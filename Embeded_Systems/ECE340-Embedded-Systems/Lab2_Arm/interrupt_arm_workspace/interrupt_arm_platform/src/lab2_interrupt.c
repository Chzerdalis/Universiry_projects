#include "xparameters.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include <unistd.h>
#include <time.h>

// Parameter definitions
#define INTC_DEVICE_ID 		     XPAR_PS7_SCUGIC_0_DEVICE_ID
#define BTNS_DEVICE_ID		     XPAR_GPIO_0_DEVICE_ID
#define SW_8BIT_DIVEICE_ID       XPAR_GPIO_1_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID   XPAR_FABRIC_BTNS_5BIT_IP2INTC_IRPT_INTR
#define INTC_GPIO_INTERRUPT_ID_2 XPAR_FABRIC_SWS_8BIT_IP2INTC_IRPT_INTR

#define BTN_INT 			   XGPIO_IR_CH1_MASK
#define SW_8BIT_INT			   XGPIO_IR_CH2_MASK

XGpio BTNInst;
XGpio SW8BITInst;
XScuGic INTCInst;  // Generic Interrupt Controller
static int btn_value = 0;
static int sw_value = 0;
static int btn_oldvalue = 0;
static int counter_value = 0;
clock_t start, end;
double cpu_time_used;

//----------------------------------------------------
// PROTOTYPE FUNCTIONS
//----------------------------------------------------
static void BTN_Intr_Handler(void *baseaddr_p);
static void SW_8BIT_Intr_Handler(void *baseaddr_p);
static int InterruptSystemSetup(XScuGic *XScuGicInstancePtr);
static int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr, XGpio *GpioInstancePtr_1);

//----------------------------------------------------
// INTERRUPT HANDLER FUNCTIONS
// - called by the timer, button interrupt, performs
// - LED flashing
//----------------------------------------------------


void BTN_Intr_Handler(void *InstancePtr)
{
	// Disable GPIO interrupts
	XGpio_InterruptDisable(&BTNInst, BTN_INT);
	usleep(100000);

	// Ignore additional button presses
	if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT) != BTN_INT)
		return;

	btn_value = XGpio_DiscreteRead(&BTNInst, 1);

	// This is where you place your code 
    // Increment counter based on button value
	// Reset if center button pressed

	// A button is pressed
	if (btn_oldvalue < btn_value) {
		// Reset is pressed
		if (btn_value % 2 == 1)
			counter_value = 0;
		// Increment button is pressed
		else if (btn_value != 0)
			counter_value = counter_value + btn_value;

		xil_printf("Counter: %5d | Btn value: %3d", counter_value, btn_value);
		if (counter_value == 0)
			xil_printf(" (reset)");
		xil_printf("\r\n");
	}

	btn_oldvalue = btn_value;

    (void)XGpio_InterruptClear(&BTNInst, BTN_INT);

    // Enable GPIO interrupts
    XGpio_InterruptEnable(&BTNInst, BTN_INT);
}

void SW_8BIT_Intr_Handler(void *InstancePtr)
{
	// Disable GPIO interrupts
	XGpio_InterruptDisable(&SW8BITInst, SW_8BIT_INT);
	(void)XGpio_InterruptClear(&SW8BITInst, SW_8BIT_INT);

	// Ignore additional button presses
	sleep(2);
	if ((XGpio_InterruptGetStatus(&SW8BITInst) & SW_8BIT_INT) != SW_8BIT_INT)
		return;

	sw_value = XGpio_DiscreteRead(&SW8BITInst, 1);
	xil_printf("Switch is: %d\r\n", sw_value);

    (void)XGpio_InterruptClear(&SW8BITInst, SW_8BIT_INT);

    // Enable GPIO interrupts
    XGpio_InterruptEnable(&SW8BITInst, SW_8BIT_INT);
}

//----------------------------------------------------
// MAIN FUNCTION
//----------------------------------------------------
int main (void)
{
  int status;

  //----------------------------------------------------
  // INITIALIZE THE PERIPHERALS & SET DIRECTIONS OF GPIO
  //----------------------------------------------------

  xil_printf("Starting\r\n");

  // Initialize Push Buttons
  status = XGpio_Initialize(&BTNInst, BTNS_DEVICE_ID);
  if (status != XST_SUCCESS)
	  return XST_FAILURE;

  // Set all buttons direction to inputs
  XGpio_SetDataDirection(&BTNInst, 1, 0xFF);

  // Initialize switches
  status = XGpio_Initialize(&SW8BITInst, SW_8BIT_DIVEICE_ID);
  if (status != XST_SUCCESS)
	  return XST_FAILURE;

  // Set all switches direction to inputs
  XGpio_SetDataDirection(&SW8BITInst, 1, 0xFF);

  // Initialize interrupt controller
  status = IntcInitFunction(INTC_DEVICE_ID, &BTNInst, &SW8BITInst);
  if (status != XST_SUCCESS)
	  return XST_FAILURE;

  while(1){
	  // sw_value = XGpio_DiscreteRead(&SW8BITInst, 1);
	  // xil_printf("Switch is: %d\r\n", sw_value);
  }

  return 0;
}

//----------------------------------------------------
// INITIAL SETUP FUNCTIONS
//----------------------------------------------------

int InterruptSystemSetup(XScuGic *XScuGicInstancePtr)
{
	// Enable interrupt
	XGpio_InterruptEnable(&SW8BITInst, SW_8BIT_INT);
	XGpio_InterruptGlobalEnable(&SW8BITInst);

	XGpio_InterruptEnable(&BTNInst, BTN_INT);
	XGpio_InterruptGlobalEnable(&BTNInst);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 	 	 	 	 	 (Xil_ExceptionHandler)XScuGic_InterruptHandler,
			 	 	 	 	 	 XScuGicInstancePtr);
	Xil_ExceptionEnable();


	return XST_SUCCESS;

}

int IntcInitFunction(u16 DeviceId, XGpio *GpioInstancePtr, XGpio *GpioInstancePtr_1)
{
	XScuGic_Config *IntcConfig;
	int status;

	// Interrupt controller initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if (status != XST_SUCCESS)
		return XST_FAILURE;

	// Call to interrupt setup
	status = InterruptSystemSetup(&INTCInst);
	if (status != XST_SUCCESS)
		return XST_FAILURE;
	
	// Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
					  	  	 INTC_GPIO_INTERRUPT_ID,
					  	  	 (Xil_ExceptionHandler)BTN_Intr_Handler,
					  	  	 (void *)GpioInstancePtr);
	if (status != XST_SUCCESS)
		return XST_FAILURE;

	// Enable GPIO interrupts interrupt
	XGpio_InterruptEnable(GpioInstancePtr, 1);
	XGpio_InterruptGlobalEnable(GpioInstancePtr);

	// SW_8BIT
	status = XScuGic_Connect(&INTCInst,
						  	 INTC_GPIO_INTERRUPT_ID_2,
						  	 (Xil_ExceptionHandler)SW_8BIT_Intr_Handler,
						  	 (void *)GpioInstancePtr_1);
	if (status != XST_SUCCESS)
		return XST_FAILURE;

	XGpio_InterruptEnable(GpioInstancePtr_1, SW_8BIT_INT);
	XGpio_InterruptGlobalEnable(GpioInstancePtr_1);

	// Enable GPIO and timer interrupts in the controller
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID_2);
	
	return XST_SUCCESS;
}
