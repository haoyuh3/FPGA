// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (win64) Build 3788238 Tue Feb 21 20:00:34 MST 2023
// Date        : Sat Oct 28 14:48:39 2023
// Host        : haoyuh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/vivado
//               lab/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0_1/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "3" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.109778 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1200" *) 
  (* C_READ_DEPTH_B = "1200" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Lg5F1Zfiau3QeByGU2d8iLyq6c0Ay54VBRkPDiennEnh7TDqlDHQ30ugh+dQhv2UbRSQ4p1Rw5u0
jZgZUZmy1Br6WeCfAfENro2z0tYpE6huap6VYu8VXMMViOdpLZhd3Joz8MWf9Vkpz9O8GsaXV6w1
FT3lzzRx4ZlWqSymP/Y=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
k67ldAp8HxMr9nrczAiQCAT2rtecidPnBUTDua4bP0PhBLrvQbOxphm7BiFhkHdGPiDgK6MdINUG
D//GaYQsWWpVUpGZfs8KXRKikvei6OQ4trNDIgpYU9T+zsDYIrvScWpep4H0Kh3R+s45gq7RnJ5m
vdUnaWHtpnFw5f3ARp9akA4O1XBR1BgUKzTCIe0UPAGCpWS1hK4aBQcxKu2PkOA+tPNAh3UV3BiZ
vZru2ov5N6bbEX7XHtyrDx4JovVQLfEIY+57bKNfzEEYKSjLOo5b7ftblU7gLeFmR30a6dQOMMgx
KzeWIzCpQemUcnoi/VEHbHGDt4HRBpIGifDODg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
i+RRRWsjfOwMRpKMUFh0IBcShI8yHuzdR43aSUy7WlXp2lerQDV/hI6ANfHItxdA5uJrEIK5wJiU
VgB5oYlKbVJ1BvZbui5wQoJkmW7IbzfMYtuEI22QXBHs019oGwhANUpCO9BetK/0TTzFxVnHtNOu
/LHdKkMBA0VUUUKT6VU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tFYGPovVzEoIrKrjTzB6ZqQ6KnkrcjUP1OIG5V7ru9HH8w5P8AlgATXl1Xl3Dc0sTv5AhUl86uI/
Te6q6PxhMPJoRhRB1vXyGzAjrWjA4CWJdMmVu8MWo5zod7cvpkzdrQp18aQTcCDQwlU1DmNGiEOo
zimuLuAUKe6AyAorB43/1QRQQqCxNB7BHRnOJAQDnoyMFVNrG12rKOA/sAyZpMLD4B6xJ7gH7QXT
AZuGXKyILGNZ45qXUr2Hw1p0w3wXMgy/YvUW8HbaHN4jAYcIe/ECoyXyKCAWdzANlF2rT2PeCMqV
QEbigoyqGX27Rm4To5kqLVbmwgAs2ChKUhPckA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR8YLkP+Cq0MiT1XckSgPvE9wroyAiBbeHMaKlLiOTx7yegD3rCMk4uetnkA7xdOCG95C0Od5pVH
e2YrEW06xFSOsWdDnQqKOKFYhTwAs147Ze0j25zjomr5m7CmawjMolxykzS96zChWImangU+6Dpu
mE/MKg5/kaC+7gqdMqPmK5P2lIX+ouok9XKxOokJuqD87QwEzDlFFh/qV9pd923yFRNG1c5yQCAY
jC0bWlxJRQo6nbEwBgMn8rC/mMABPH8uD2sMe1yaJv5P7sFeOf3cmAdUGQBGVHRKdpZ59LnHTu1K
InNoIfz9Mx01CNUYdTBr3X0w6fmS/h2C4MO1mA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qqgM6XiDSmuIOj2QmFL4f6puTJICjYjWzQLoNxU1gzCcXd5+ng75tjwe5w6urE45Df59LYjXr90N
xoD+v0GnCLOppWUn4S+1ojqBqn0qMLsvms3D9/dYenWKxpbEiFxbArUoCPmld0c++8yPVQ73qapG
1gDmjbWJO8ByYC0/tiugtOK/vE3jYVzEtxehN3MCFPsHGsspvaF3CdRsMas3tebV/SuH2XSAP8j+
fZhSi0u301RRmZ6mSAEqJK3He0Y91Z5ZQOd80417UBeLHaQiA9kHY2RWaBMXWHjx36IJNuIr/7jr
pqPYRD+g+IOGSYqYr2U+oVSWF/J6FaLGEFORSw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SLY1z3pfrH+89d+aYr8ZYKuGi1pV2B4YTh8mk4uHOGs4LKQ1igmeyM9GJBaMAmt5JcC96WDDnBw4
nB1kIjnCrjVv02nSbiHz+gz/GD9SP86nLzS9QkwUHgiEudWJ/8Fkv+fRer0hLWhtpFMq+QCQAqbX
Dy+Em4RhLOM5CQyRCxiExuROQRkGjH1tQtyz+peAX147pqTEtR9LrFRYUYEPXhtD9b7MSp46zgf4
lSI4aGfqhp6fXq48O+If4NBHVZAh8gHdbneSQhe7VWYJyFRn5NXB16YXAJLa4JQatsMczE+AmO09
k2OEByw2UvUNKGEaf4tNqeBnQNu8yAJKmMaRpQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
rHgksH8uRTUXMqfrbR/KpR7K/BN7+l1GGoZ5uBkIVJQ9E1b2f3VZJPrQ7S7VUrJ9W3clOpFEhjAM
Oc8jJzlnUOrbHfYO51LCZ66FccJgE3OjLaM/OzA3c72JbMeF05jEDKf4QdMRaIQwV0vXvFMXFbcg
CD7AuUhMJ/GWQx0JJmueM8RLvNdUcIDBkWoZcPsRFynLr8IfIXTFpVIdlFrvWDV9M+csfXnQIq6k
Y3z8TRciA00/EiKvOp6Eo50/kD4QjKDFCqzWcw9vpMR1S+mAW8D3yQQ3Mw+7TRW5DTmB7qmmS/LD
xKznKyYDNP9KJ8z4NfSZgy9kCEKF/AEOrpIJqnNaoA6HXh9YFegFhy9SpTPldFTNyW6JDzyY5DW1
hVFcYJFPmlT/ZDM7HC/yiWmfTZamjNjr6j6r4fX5ptKg03NOZ6yoiMqKwnvLDnRIQe9/S7fEOqdV
LqZswQByjnvoCBsrGYw6cNNfz5CW00eecKgkExyDTb2F/xuv6oGtNaRS

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oDWKuMa0YoA/U/QPkQrlE/kjfj1li0yqCn8MeJ3rAm2Z/2YKghA9gsxWs8xB4fe/adKSQ4aHEt1i
tUAxBkQYlT8XiaSFJIAVhNmuXgiEPZ20R+VwppLUjekdT7PC18dHecsi59XlgVJPcddzakFIoqXD
rk8iU8PsQ4WRTiUl44mpMR93K+emGu1nkBJznWpM1pH3aBODRmMjU7IigwOfmOnDjrCzVULW4z7V
2AuUO8AJxPTXjBkt8QkS+Lo97MZG0bItGmjC+mkr0BAz/l2ADPjOsfpKHAN3Qk4Crlkhpfgt7XT0
5KHCyECHiPkWrJah55lp7roA13m4EgPMJeM69w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rabaiFoR9bIj5CFcJ70CIsYI2myG5mevbxKcSzOpgQHZ4FX874h3Mvv4oNhB5aIwoXefnyix4Pas
3xk2ZBOqreX1vuZUYS7Nk3rT6wqN+/JYXGO7E9xfmFF/iTdL9heWc8JHcLe4e6B8B9QYhGlkRIbN
3etlFTSqKlO5nfA6dKX6Cd+yV3PZZfJXT4jlaY1rpqMPaBtlHWQ7D4o1gO+mHgP0sOQ4bpowU+7Q
jMr0tYghyxsfIddTxrVE0fwZeg1qWlo+iSU1PAJGRVMKIAn7NZ4i8f+ed6NJKt2vGjDFfZXLXClO
nyA+xb6K3aWY3lMR6qP8qDkKAJJZe9Y36MRGng==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpnCRmSw3bCoDXuz4ACuAPPPaMheVpOmUjnTbTAMOWU5UsZtyDXZeGV8/oIsADVazSxLQZSBGgiy
SKvVnFKfYB7AgQDUMZFw0rVRtHiVMwSzKWeKD6RAhsC0bPj9SvO7LAbMlPup0Bqp/B+25di0U3gR
HcJdPJAve7xMFNBSYWEA8qxoNxWNshmZSjI/bZ357HlFVPisa6jUUqfB1NL8is8ZUS6S+cNLQyEf
tij0AWwPrqG8naFrpTzHWE6VrXYG5oNftxQbYOQR6HjuL4cx/R64+btFaWdnBHup1adCO/sGxhdd
Dd1b6OQ/2YtZTyp2K8aDHbceCM5X1/8CZdRU5g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 50128)
`pragma protect data_block
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
UYBLVOB7XcLemSqRqznLgvgwx2MCxdM0eA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
