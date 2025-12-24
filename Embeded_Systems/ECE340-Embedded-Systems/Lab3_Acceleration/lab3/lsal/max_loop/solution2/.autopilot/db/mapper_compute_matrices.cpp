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
extern "C" void compute_matrices(char*, char*, volatile void *, short*);
extern "C" void apatb_compute_matrices_hw(volatile void * __xlx_apatb_param_query, volatile void * __xlx_apatb_param_database, volatile void * __xlx_apatb_param_max_index, volatile void * __xlx_apatb_param_direction_matrix) {
  // Collect __xlx_query__tmp_vec
  vector<sc_bv<8> >__xlx_query__tmp_vec;
  for (int j = 0, e = 32; j != e; ++j) {
    __xlx_query__tmp_vec.push_back(((char*)__xlx_apatb_param_query)[j]);
  }
  int __xlx_size_param_query = 32;
  int __xlx_offset_param_query = 0;
  int __xlx_offset_byte_param_query = 0*1;
  char* __xlx_query__input_buffer= new char[__xlx_query__tmp_vec.size()];
  for (int i = 0; i < __xlx_query__tmp_vec.size(); ++i) {
    __xlx_query__input_buffer[i] = __xlx_query__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_database__tmp_vec
  vector<sc_bv<8> >__xlx_database__tmp_vec;
  for (int j = 0, e = 65598; j != e; ++j) {
    __xlx_database__tmp_vec.push_back(((char*)__xlx_apatb_param_database)[j]);
  }
  int __xlx_size_param_database = 65598;
  int __xlx_offset_param_database = 0;
  int __xlx_offset_byte_param_database = 0*1;
  char* __xlx_database__input_buffer= new char[__xlx_database__tmp_vec.size()];
  for (int i = 0; i < __xlx_database__tmp_vec.size(); ++i) {
    __xlx_database__input_buffer[i] = __xlx_database__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_direction_matrix__tmp_vec
  vector<sc_bv<16> >__xlx_direction_matrix__tmp_vec;
  for (int j = 0, e = 2099136; j != e; ++j) {
    __xlx_direction_matrix__tmp_vec.push_back(((short*)__xlx_apatb_param_direction_matrix)[j]);
  }
  int __xlx_size_param_direction_matrix = 2099136;
  int __xlx_offset_param_direction_matrix = 0;
  int __xlx_offset_byte_param_direction_matrix = 0*2;
  short* __xlx_direction_matrix__input_buffer= new short[__xlx_direction_matrix__tmp_vec.size()];
  for (int i = 0; i < __xlx_direction_matrix__tmp_vec.size(); ++i) {
    __xlx_direction_matrix__input_buffer[i] = __xlx_direction_matrix__tmp_vec[i].range(15, 0).to_uint64();
  }
  // DUT call
  compute_matrices(__xlx_query__input_buffer, __xlx_database__input_buffer, __xlx_apatb_param_max_index, __xlx_direction_matrix__input_buffer);
// print __xlx_apatb_param_query
  sc_bv<8>*__xlx_query_output_buffer = new sc_bv<8>[__xlx_size_param_query];
  for (int i = 0; i < __xlx_size_param_query; ++i) {
    __xlx_query_output_buffer[i] = __xlx_query__input_buffer[i+__xlx_offset_param_query];
  }
  for (int i = 0; i < __xlx_size_param_query; ++i) {
    ((char*)__xlx_apatb_param_query)[i] = __xlx_query_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_database
  sc_bv<8>*__xlx_database_output_buffer = new sc_bv<8>[__xlx_size_param_database];
  for (int i = 0; i < __xlx_size_param_database; ++i) {
    __xlx_database_output_buffer[i] = __xlx_database__input_buffer[i+__xlx_offset_param_database];
  }
  for (int i = 0; i < __xlx_size_param_database; ++i) {
    ((char*)__xlx_apatb_param_database)[i] = __xlx_database_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_direction_matrix
  sc_bv<16>*__xlx_direction_matrix_output_buffer = new sc_bv<16>[__xlx_size_param_direction_matrix];
  for (int i = 0; i < __xlx_size_param_direction_matrix; ++i) {
    __xlx_direction_matrix_output_buffer[i] = __xlx_direction_matrix__input_buffer[i+__xlx_offset_param_direction_matrix];
  }
  for (int i = 0; i < __xlx_size_param_direction_matrix; ++i) {
    ((short*)__xlx_apatb_param_direction_matrix)[i] = __xlx_direction_matrix_output_buffer[i].to_uint64();
  }
}
