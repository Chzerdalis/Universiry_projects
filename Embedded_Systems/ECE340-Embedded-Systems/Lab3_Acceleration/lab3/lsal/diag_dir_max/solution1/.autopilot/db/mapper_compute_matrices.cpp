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
struct __cosim_s20__ { char data[32]; };
extern "C" void compute_matrices(__cosim_s20__*, int, int, int, int);
extern "C" void apatb_compute_matrices_hw(volatile void * __xlx_apatb_param_query, volatile void * __xlx_apatb_param_database, volatile void * __xlx_apatb_param_max_index, volatile void * __xlx_apatb_param_direction_matrix) {
  // Collect __xlx_query_database_max_index_direction_matrix__tmp_vec
  vector<sc_bv<256> >__xlx_query_database_max_index_direction_matrix__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<256> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_query)[j*4+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_query)[j*4+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_query)[j*4+2];
    _xlx_tmp_sc.range(255, 192) = ((long long*)__xlx_apatb_param_query)[j*4+3];
    __xlx_query_database_max_index_direction_matrix__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_query = 1;
  int __xlx_offset_param_query = 0;
  int __xlx_offset_byte_param_query = 0*32;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<256> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_database)[j*4+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_database)[j*4+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_database)[j*4+2];
    _xlx_tmp_sc.range(255, 192) = ((long long*)__xlx_apatb_param_database)[j*4+3];
    __xlx_query_database_max_index_direction_matrix__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_database = 1;
  int __xlx_offset_param_database = 1;
  int __xlx_offset_byte_param_database = 1*32;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<256> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_max_index)[j*4+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_max_index)[j*4+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_max_index)[j*4+2];
    _xlx_tmp_sc.range(255, 192) = ((long long*)__xlx_apatb_param_max_index)[j*4+3];
    __xlx_query_database_max_index_direction_matrix__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_max_index = 1;
  int __xlx_offset_param_max_index = 2;
  int __xlx_offset_byte_param_max_index = 2*32;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<256> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_direction_matrix)[j*4+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_direction_matrix)[j*4+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_direction_matrix)[j*4+2];
    _xlx_tmp_sc.range(255, 192) = ((long long*)__xlx_apatb_param_direction_matrix)[j*4+3];
    __xlx_query_database_max_index_direction_matrix__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_direction_matrix = 1;
  int __xlx_offset_param_direction_matrix = 3;
  int __xlx_offset_byte_param_direction_matrix = 3*32;
  __cosim_s20__* __xlx_query_database_max_index_direction_matrix__input_buffer= new __cosim_s20__[__xlx_query_database_max_index_direction_matrix__tmp_vec.size()];
  for (int i = 0; i < __xlx_query_database_max_index_direction_matrix__tmp_vec.size(); ++i) {
    ((long long*)__xlx_query_database_max_index_direction_matrix__input_buffer)[i*4+0] = __xlx_query_database_max_index_direction_matrix__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_query_database_max_index_direction_matrix__input_buffer)[i*4+1] = __xlx_query_database_max_index_direction_matrix__tmp_vec[i].range(127, 64).to_uint64();
    ((long long*)__xlx_query_database_max_index_direction_matrix__input_buffer)[i*4+2] = __xlx_query_database_max_index_direction_matrix__tmp_vec[i].range(191, 128).to_uint64();
    ((long long*)__xlx_query_database_max_index_direction_matrix__input_buffer)[i*4+3] = __xlx_query_database_max_index_direction_matrix__tmp_vec[i].range(255, 192).to_uint64();
  }
  // DUT call
  compute_matrices(__xlx_query_database_max_index_direction_matrix__input_buffer, __xlx_offset_byte_param_query, __xlx_offset_byte_param_database, __xlx_offset_byte_param_max_index, __xlx_offset_byte_param_direction_matrix);
// print __xlx_apatb_param_query
  sc_bv<256>*__xlx_query_output_buffer = new sc_bv<256>[__xlx_size_param_query];
  for (int i = 0; i < __xlx_size_param_query; ++i) {
    char* start = (char*)(&(__xlx_query_database_max_index_direction_matrix__input_buffer[__xlx_offset_param_query]));
    __xlx_query_output_buffer[i].range(63, 0) = ((long long*)start)[i*4+0];
    __xlx_query_output_buffer[i].range(127, 64) = ((long long*)start)[i*4+1];
    __xlx_query_output_buffer[i].range(191, 128) = ((long long*)start)[i*4+2];
    __xlx_query_output_buffer[i].range(255, 192) = ((long long*)start)[i*4+3];
  }
  for (int i = 0; i < __xlx_size_param_query; ++i) {
    ((long long*)__xlx_apatb_param_query)[i*4+0] = __xlx_query_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_query)[i*4+1] = __xlx_query_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_query)[i*4+2] = __xlx_query_output_buffer[i].range(191, 128).to_uint64();
    ((long long*)__xlx_apatb_param_query)[i*4+3] = __xlx_query_output_buffer[i].range(255, 192).to_uint64();
  }
// print __xlx_apatb_param_database
  sc_bv<256>*__xlx_database_output_buffer = new sc_bv<256>[__xlx_size_param_database];
  for (int i = 0; i < __xlx_size_param_database; ++i) {
    char* start = (char*)(&(__xlx_query_database_max_index_direction_matrix__input_buffer[__xlx_offset_param_database]));
    __xlx_database_output_buffer[i].range(63, 0) = ((long long*)start)[i*4+0];
    __xlx_database_output_buffer[i].range(127, 64) = ((long long*)start)[i*4+1];
    __xlx_database_output_buffer[i].range(191, 128) = ((long long*)start)[i*4+2];
    __xlx_database_output_buffer[i].range(255, 192) = ((long long*)start)[i*4+3];
  }
  for (int i = 0; i < __xlx_size_param_database; ++i) {
    ((long long*)__xlx_apatb_param_database)[i*4+0] = __xlx_database_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_database)[i*4+1] = __xlx_database_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_database)[i*4+2] = __xlx_database_output_buffer[i].range(191, 128).to_uint64();
    ((long long*)__xlx_apatb_param_database)[i*4+3] = __xlx_database_output_buffer[i].range(255, 192).to_uint64();
  }
// print __xlx_apatb_param_max_index
  sc_bv<256>*__xlx_max_index_output_buffer = new sc_bv<256>[__xlx_size_param_max_index];
  for (int i = 0; i < __xlx_size_param_max_index; ++i) {
    char* start = (char*)(&(__xlx_query_database_max_index_direction_matrix__input_buffer[__xlx_offset_param_max_index]));
    __xlx_max_index_output_buffer[i].range(63, 0) = ((long long*)start)[i*4+0];
    __xlx_max_index_output_buffer[i].range(127, 64) = ((long long*)start)[i*4+1];
    __xlx_max_index_output_buffer[i].range(191, 128) = ((long long*)start)[i*4+2];
    __xlx_max_index_output_buffer[i].range(255, 192) = ((long long*)start)[i*4+3];
  }
  for (int i = 0; i < __xlx_size_param_max_index; ++i) {
    ((long long*)__xlx_apatb_param_max_index)[i*4+0] = __xlx_max_index_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_max_index)[i*4+1] = __xlx_max_index_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_max_index)[i*4+2] = __xlx_max_index_output_buffer[i].range(191, 128).to_uint64();
    ((long long*)__xlx_apatb_param_max_index)[i*4+3] = __xlx_max_index_output_buffer[i].range(255, 192).to_uint64();
  }
// print __xlx_apatb_param_direction_matrix
  sc_bv<256>*__xlx_direction_matrix_output_buffer = new sc_bv<256>[__xlx_size_param_direction_matrix];
  for (int i = 0; i < __xlx_size_param_direction_matrix; ++i) {
    char* start = (char*)(&(__xlx_query_database_max_index_direction_matrix__input_buffer[__xlx_offset_param_direction_matrix]));
    __xlx_direction_matrix_output_buffer[i].range(63, 0) = ((long long*)start)[i*4+0];
    __xlx_direction_matrix_output_buffer[i].range(127, 64) = ((long long*)start)[i*4+1];
    __xlx_direction_matrix_output_buffer[i].range(191, 128) = ((long long*)start)[i*4+2];
    __xlx_direction_matrix_output_buffer[i].range(255, 192) = ((long long*)start)[i*4+3];
  }
  for (int i = 0; i < __xlx_size_param_direction_matrix; ++i) {
    ((long long*)__xlx_apatb_param_direction_matrix)[i*4+0] = __xlx_direction_matrix_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_direction_matrix)[i*4+1] = __xlx_direction_matrix_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_direction_matrix)[i*4+2] = __xlx_direction_matrix_output_buffer[i].range(191, 128).to_uint64();
    ((long long*)__xlx_apatb_param_direction_matrix)[i*4+3] = __xlx_direction_matrix_output_buffer[i].range(255, 192).to_uint64();
  }
}
