#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void compute_matrices(volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_compute_matrices_hw(volatile void * __xlx_apatb_param_query, volatile void * __xlx_apatb_param_database, volatile void * __xlx_apatb_param_max_index, volatile void * __xlx_apatb_param_direction_matrix) {
  // DUT call
  compute_matrices(__xlx_apatb_param_query, __xlx_apatb_param_database, __xlx_apatb_param_max_index, __xlx_apatb_param_direction_matrix);
}
