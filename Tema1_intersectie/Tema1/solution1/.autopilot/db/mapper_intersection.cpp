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
extern "C" void intersection(char, char, char, char, volatile void *, volatile void *, volatile void *);
extern "C" void apatb_intersection_hw(char __xlx_apatb_param_Stg, char __xlx_apatb_param_D, char __xlx_apatb_param_S, char __xlx_apatb_param_J, volatile void * __xlx_apatb_param_Regula, volatile void * __xlx_apatb_param_EW, volatile void * __xlx_apatb_param_NS) {
  // DUT call
  intersection(__xlx_apatb_param_Stg, __xlx_apatb_param_D, __xlx_apatb_param_S, __xlx_apatb_param_J, __xlx_apatb_param_Regula, __xlx_apatb_param_EW, __xlx_apatb_param_NS);
}
