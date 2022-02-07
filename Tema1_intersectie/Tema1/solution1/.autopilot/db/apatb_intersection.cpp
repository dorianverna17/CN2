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
#define AUTOTB_TVIN_Stg "../tv/cdatafile/c.intersection.autotvin_Stg.dat"
#define AUTOTB_TVOUT_Stg "../tv/cdatafile/c.intersection.autotvout_Stg.dat"
// wrapc file define:
#define AUTOTB_TVIN_D "../tv/cdatafile/c.intersection.autotvin_D.dat"
#define AUTOTB_TVOUT_D "../tv/cdatafile/c.intersection.autotvout_D.dat"
// wrapc file define:
#define AUTOTB_TVIN_S "../tv/cdatafile/c.intersection.autotvin_S.dat"
#define AUTOTB_TVOUT_S "../tv/cdatafile/c.intersection.autotvout_S.dat"
// wrapc file define:
#define AUTOTB_TVIN_J "../tv/cdatafile/c.intersection.autotvin_J.dat"
#define AUTOTB_TVOUT_J "../tv/cdatafile/c.intersection.autotvout_J.dat"
// wrapc file define:
#define AUTOTB_TVIN_Regula "../tv/cdatafile/c.intersection.autotvin_Regula.dat"
#define AUTOTB_TVOUT_Regula "../tv/cdatafile/c.intersection.autotvout_Regula.dat"
// wrapc file define:
#define AUTOTB_TVIN_EW "../tv/cdatafile/c.intersection.autotvin_EW.dat"
#define AUTOTB_TVOUT_EW "../tv/cdatafile/c.intersection.autotvout_EW.dat"
// wrapc file define:
#define AUTOTB_TVIN_NS "../tv/cdatafile/c.intersection.autotvin_NS.dat"
#define AUTOTB_TVOUT_NS "../tv/cdatafile/c.intersection.autotvout_NS.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_Stg "../tv/rtldatafile/rtl.intersection.autotvout_Stg.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_D "../tv/rtldatafile/rtl.intersection.autotvout_D.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_S "../tv/rtldatafile/rtl.intersection.autotvout_S.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_J "../tv/rtldatafile/rtl.intersection.autotvout_J.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Regula "../tv/rtldatafile/rtl.intersection.autotvout_Regula.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_EW "../tv/rtldatafile/rtl.intersection.autotvout_EW.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_NS "../tv/rtldatafile/rtl.intersection.autotvout_NS.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  Stg_depth = 0;
  D_depth = 0;
  S_depth = 0;
  J_depth = 0;
  Regula_depth = 0;
  EW_depth = 0;
  NS_depth = 0;
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
  total_list << "{Stg " << Stg_depth << "}\n";
  total_list << "{D " << D_depth << "}\n";
  total_list << "{S " << S_depth << "}\n";
  total_list << "{J " << J_depth << "}\n";
  total_list << "{Regula " << Regula_depth << "}\n";
  total_list << "{EW " << EW_depth << "}\n";
  total_list << "{NS " << NS_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int Stg_depth;
    int D_depth;
    int S_depth;
    int J_depth;
    int Regula_depth;
    int EW_depth;
    int NS_depth;
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
extern "C" void intersection_hw_stub_wrapper(char, char, char, char, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_intersection_hw(char __xlx_apatb_param_Stg, char __xlx_apatb_param_D, char __xlx_apatb_param_S, char __xlx_apatb_param_J, volatile void * __xlx_apatb_param_Regula, volatile void * __xlx_apatb_param_EW, volatile void * __xlx_apatb_param_NS) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_Regula);
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
          std::vector<sc_bv<32> > Regula_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "Regula");
  
            // push token into output port buffer
            if (AESL_token != "") {
              Regula_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_Regula)[0*4+0] = Regula_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_Regula)[0*4+1] = Regula_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_Regula)[0*4+2] = Regula_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_Regula)[0*4+3] = Regula_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_EW);
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
          std::vector<sc_bv<1> > EW_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "EW");
  
            // push token into output port buffer
            if (AESL_token != "") {
              EW_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_EW)[0*1+0] = EW_pc_buffer[0].range(0, 0).to_uint64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_NS);
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
          std::vector<sc_bv<1> > NS_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "NS");
  
            // push token into output port buffer
            if (AESL_token != "") {
              NS_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_NS)[0*1+0] = NS_pc_buffer[0].range(0, 0).to_uint64();
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
//Stg
aesl_fh.touch(AUTOTB_TVIN_Stg);
aesl_fh.touch(AUTOTB_TVOUT_Stg);
//D
aesl_fh.touch(AUTOTB_TVIN_D);
aesl_fh.touch(AUTOTB_TVOUT_D);
//S
aesl_fh.touch(AUTOTB_TVIN_S);
aesl_fh.touch(AUTOTB_TVOUT_S);
//J
aesl_fh.touch(AUTOTB_TVIN_J);
aesl_fh.touch(AUTOTB_TVOUT_J);
//Regula
aesl_fh.touch(AUTOTB_TVIN_Regula);
aesl_fh.touch(AUTOTB_TVOUT_Regula);
//EW
aesl_fh.touch(AUTOTB_TVIN_EW);
aesl_fh.touch(AUTOTB_TVOUT_EW);
//NS
aesl_fh.touch(AUTOTB_TVIN_NS);
aesl_fh.touch(AUTOTB_TVOUT_NS);
CodeState = DUMP_INPUTS;
// print Stg Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Stg, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_Stg);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_Stg, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.Stg_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Stg, __xlx_sprintf_buffer.data());
}
// print D Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_D, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_D);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_D, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.D_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_D, __xlx_sprintf_buffer.data());
}
// print S Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_S, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_S);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_S, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.S_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_S, __xlx_sprintf_buffer.data());
}
// print J Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_J, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_J);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_J, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.J_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_J, __xlx_sprintf_buffer.data());
}
// print Regula Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Regula, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_Regula);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_Regula, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.Regula_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Regula, __xlx_sprintf_buffer.data());
}
// print EW Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_EW, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_EW);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_EW, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.EW_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_EW, __xlx_sprintf_buffer.data());
}
// print NS Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_NS, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_NS);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_NS, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.NS_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_NS, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
intersection_hw_stub_wrapper(__xlx_apatb_param_Stg, __xlx_apatb_param_D, __xlx_apatb_param_S, __xlx_apatb_param_J, __xlx_apatb_param_Regula, __xlx_apatb_param_EW, __xlx_apatb_param_NS);
CodeState = DUMP_OUTPUTS;
// print Regula Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_Regula, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_Regula);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_Regula, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.Regula_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_Regula, __xlx_sprintf_buffer.data());
}
// print EW Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_EW, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_EW);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_EW, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.EW_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_EW, __xlx_sprintf_buffer.data());
}
// print NS Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_NS, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)__xlx_apatb_param_NS);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_NS, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.NS_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_NS, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
