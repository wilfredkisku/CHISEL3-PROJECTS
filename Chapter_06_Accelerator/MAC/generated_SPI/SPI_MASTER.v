module SPI_MASTER(
  input        clock,
  input        reset,
  input        io_start,
  input  [7:0] io_masterData,
  input        io_miso,
  output       io_mosi,
  output       io_sclk,
  output       io_cs
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[SPI_MASTER.scala 16:22]
  reg [2:0] bitCounter; // @[SPI_MASTER.scala 17:27]
  reg [7:0] dataReg; // @[SPI_MASTER.scala 18:20]
  reg  sclkReg; // @[SPI_MASTER.scala 19:24]
  wire  _GEN_1 = io_start | state; // @[SPI_MASTER.scala 27:22 29:15 16:22]
  wire  _GEN_2 = io_start ? 1'h0 : 1'h1; // @[SPI_MASTER.scala 27:22 30:15 21:9]
  wire [7:0] _dataReg_T_1 = {dataReg[6:0],io_miso}; // @[Cat.scala 33:92]
  wire [2:0] _bitCounter_T_1 = bitCounter + 3'h1; // @[SPI_MASTER.scala 42:36]
  wire [2:0] _GEN_5 = sclkReg ? _bitCounter_T_1 : bitCounter; // @[SPI_MASTER.scala 40:23 42:22 17:27]
  assign io_mosi = dataReg[7]; // @[SPI_MASTER.scala 22:21]
  assign io_sclk = sclkReg; // @[SPI_MASTER.scala 23:11]
  assign io_cs = ~state ? _GEN_2 : 1'h1; // @[SPI_MASTER.scala 25:17]
  always @(posedge clock) begin
    if (reset) begin // @[SPI_MASTER.scala 16:22]
      state <= 1'h0; // @[SPI_MASTER.scala 16:22]
    end else if (~state) begin // @[SPI_MASTER.scala 25:17]
      state <= _GEN_1;
    end else if (state) begin // @[SPI_MASTER.scala 25:17]
      if (bitCounter == 3'h7) begin // @[SPI_MASTER.scala 35:32]
        state <= 1'h0; // @[SPI_MASTER.scala 36:15]
      end
    end
    if (reset) begin // @[SPI_MASTER.scala 17:27]
      bitCounter <= 3'h0; // @[SPI_MASTER.scala 17:27]
    end else if (~state) begin // @[SPI_MASTER.scala 25:17]
      if (io_start) begin // @[SPI_MASTER.scala 27:22]
        bitCounter <= 3'h0; // @[SPI_MASTER.scala 31:20]
      end
    end else if (state) begin // @[SPI_MASTER.scala 25:17]
      if (!(bitCounter == 3'h7)) begin // @[SPI_MASTER.scala 35:32]
        bitCounter <= _GEN_5;
      end
    end
    if (~state) begin // @[SPI_MASTER.scala 25:17]
      if (io_start) begin // @[SPI_MASTER.scala 27:22]
        dataReg <= io_masterData; // @[SPI_MASTER.scala 28:17]
      end
    end else if (state) begin // @[SPI_MASTER.scala 25:17]
      if (!(bitCounter == 3'h7)) begin // @[SPI_MASTER.scala 35:32]
        if (sclkReg) begin // @[SPI_MASTER.scala 40:23]
          dataReg <= _dataReg_T_1; // @[SPI_MASTER.scala 41:19]
        end
      end
    end
    if (reset) begin // @[SPI_MASTER.scala 19:24]
      sclkReg <= 1'h0; // @[SPI_MASTER.scala 19:24]
    end else if (!(~state)) begin // @[SPI_MASTER.scala 25:17]
      if (state) begin // @[SPI_MASTER.scala 25:17]
        if (!(bitCounter == 3'h7)) begin // @[SPI_MASTER.scala 35:32]
          sclkReg <= ~sclkReg; // @[SPI_MASTER.scala 39:17]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bitCounter = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  dataReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  sclkReg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
