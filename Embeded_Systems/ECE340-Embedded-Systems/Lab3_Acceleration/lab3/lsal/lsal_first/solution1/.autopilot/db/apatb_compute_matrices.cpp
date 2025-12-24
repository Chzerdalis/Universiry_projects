#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_query "../tv/cdatafile/c.compute_matrices.autotvin_query.dat"
#define AUTOTB_TVOUT_query "../tv/cdatafile/c.compute_matrices.autotvout_query.dat"
// wrapc file define:
#define AUTOTB_TVIN_database "../tv/cdatafile/c.compute_matrices.autotvin_database.dat"
#define AUTOTB_TVOUT_database "../tv/cdatafile/c.compute_matrices.autotvout_database.dat"
// wrapc file define:
#define AUTOTB_TVIN_max_index "../tv/cdatafile/c.compute_matrices.autotvin_max_index.dat"
#define AUTOTB_TVOUT_max_index "../tv/cdatafile/c.compute_matrices.autotvout_max_index.dat"
// wrapc file define:
#define AUTOTB_TVIN_direction_matrix "../tv/cdatafile/c.compute_matrices.autotvin_direction_matrix.dat"
#define AUTOTB_TVOUT_direction_matrix "../tv/cdatafile/c.compute_matrices.autotvout_direction_matrix.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_query "../tv/rtldatafile/rtl.compute_matrices.autotvout_query.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_database "../tv/rtldatafile/rtl.compute_matrices.autotvout_database.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_max_index "../tv/rtldatafile/rtl.compute_matrices.autotvout_max_index.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_direction_matrix "../tv/rtldatafile/rtl.compute_matrices.autotvout_direction_matrix.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  query_depth = 0;
  database_depth = 0;
  max_index_depth = 0;
  direction_matrix_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{query " << query_depth << "}\n";
  total_list << "{database " << database_depth << "}\n";
  total_list << "{max_index " << max_index_depth << "}\n";
  total_list << "{direction_matrix " << direction_matrix_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int query_depth;
    int database_depth;
    int max_index_depth;
    int direction_matrix_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void compute_matrices_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_compute_matrices_hw(volatile void * __xlx_apatb_param_query, volatile void * __xlx_apatb_param_database, volatile void * __xlx_apatb_param_max_index, volatile void * __xlx_apatb_param_direction_matrix) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_max_index);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > max_index_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "max_index");
  
            // push token into output port buffer
            if (AESL_token != "") {
              max_index_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)__xlx_apatb_param_max_index)[0] = max_index_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_direction_matrix);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<16> > direction_matrix_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "direction_matrix");
  
            // push token into output port buffer
            if (AESL_token != "") {
              direction_matrix_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((short*)__xlx_apatb_param_direction_matrix)[0] = direction_matrix_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//query
aesl_fh.touch(AUTOTB_TVIN_query);
aesl_fh.touch(AUTOTB_TVOUT_query);
//database
aesl_fh.touch(AUTOTB_TVIN_database);
aesl_fh.touch(AUTOTB_TVOUT_database);
//max_index
aesl_fh.touch(AUTOTB_TVIN_max_index);
aesl_fh.touch(AUTOTB_TVOUT_max_index);
//direction_matrix
aesl_fh.touch(AUTOTB_TVIN_direction_matrix);
aesl_fh.touch(AUTOTB_TVOUT_direction_matrix);
CodeState = DUMP_INPUTS;
// print query Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_query, __xlx_sprintf_buffer.data());
  {
    sc_bv<8> __xlx_tmp_lv = *((char*)__xlx_apatb_param_query);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_query, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.query_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_query, __xlx_sprintf_buffer.data());
}
// print database Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_database, __xlx_sprintf_buffer.data());
  {
    sc_bv<8> __xlx_tmp_lv = *((char*)__xlx_apatb_param_database);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_database, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.database_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_database, __xlx_sprintf_buffer.data());
}
// print max_index Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_max_index, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_max_index);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_max_index, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.max_index_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_max_index, __xlx_sprintf_buffer.data());
}
// print direction_matrix Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_direction_matrix, __xlx_sprintf_buffer.data());
  {
    sc_bv<16> __xlx_tmp_lv = *((short*)__xlx_apatb_param_direction_matrix);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_direction_matrix, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.direction_matrix_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_direction_matrix, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
compute_matrices_hw_stub_wrapper(__xlx_apatb_param_query, __xlx_apatb_param_database, __xlx_apatb_param_max_index, __xlx_apatb_param_direction_matrix);
CodeState = DUMP_OUTPUTS;
// print max_index Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_max_index, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_max_index);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_max_index, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.max_index_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_max_index, __xlx_sprintf_buffer.data());
}
// print direction_matrix Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_direction_matrix, __xlx_sprintf_buffer.data());
  {
    sc_bv<16> __xlx_tmp_lv = *((short*)__xlx_apatb_param_direction_matrix);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_direction_matrix, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.direction_matrix_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_direction_matrix, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
