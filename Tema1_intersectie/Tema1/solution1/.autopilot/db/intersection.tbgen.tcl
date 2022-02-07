set moduleName intersection
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {intersection}
set C_modelType { void 0 }
set C_modelArgList {
	{ Stg uint 1 regular  }
	{ D uint 1 regular  }
	{ S uint 1 regular  }
	{ J uint 1 regular  }
	{ Regula int 32 regular {pointer 1}  }
	{ EW int 1 regular {pointer 1}  }
	{ NS int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Stg", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "D", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "S", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "J", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "Regula", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "EW", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "NS", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 9
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ Stg sc_in sc_logic 1 signal 0 } 
	{ D sc_in sc_logic 1 signal 1 } 
	{ S sc_in sc_logic 1 signal 2 } 
	{ J sc_in sc_logic 1 signal 3 } 
	{ Regula sc_out sc_lv 32 signal 4 } 
	{ EW sc_out sc_logic 1 signal 5 } 
	{ NS sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "Stg", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Stg", "role": "default" }} , 
 	{ "name": "D", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "D", "role": "default" }} , 
 	{ "name": "S", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "S", "role": "default" }} , 
 	{ "name": "J", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "J", "role": "default" }} , 
 	{ "name": "Regula", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Regula", "role": "default" }} , 
 	{ "name": "EW", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "EW", "role": "default" }} , 
 	{ "name": "NS", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NS", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "intersection",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "Stg", "Type" : "None", "Direction" : "I"},
			{"Name" : "D", "Type" : "None", "Direction" : "I"},
			{"Name" : "S", "Type" : "None", "Direction" : "I"},
			{"Name" : "J", "Type" : "None", "Direction" : "I"},
			{"Name" : "Regula", "Type" : "None", "Direction" : "O"},
			{"Name" : "EW", "Type" : "None", "Direction" : "O"},
			{"Name" : "NS", "Type" : "None", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	intersection {
		Stg {Type I LastRead 0 FirstWrite -1}
		D {Type I LastRead 0 FirstWrite -1}
		S {Type I LastRead 0 FirstWrite -1}
		J {Type I LastRead 0 FirstWrite -1}
		Regula {Type O LastRead -1 FirstWrite 0}
		EW {Type O LastRead -1 FirstWrite 1}
		NS {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	Stg { ap_none {  { Stg in_data 0 1 } } }
	D { ap_none {  { D in_data 0 1 } } }
	S { ap_none {  { S in_data 0 1 } } }
	J { ap_none {  { J in_data 0 1 } } }
	Regula { ap_none {  { Regula out_data 1 32 } } }
	EW { ap_none {  { EW out_data 1 1 } } }
	NS { ap_none {  { NS out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
