// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Mar 16 21:11:00 2020
// Host        : LAPTOP-0T8S0NBT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub e:/GIT/coa-design/cpu/cpu.srcs/sources_1/ip/ram1/ram1_stub.v
// Design      : ram1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.2" *)
module ram1(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],d[15:0],clk,we,spo[15:0]" */;
  input [7:0]a;
  input [15:0]d;
  input clk;
  input we;
  output [15:0]spo;
endmodule
