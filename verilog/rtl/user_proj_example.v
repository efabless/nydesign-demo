// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

     // IOs
  input  [37:0] io_in,
  output [37:0] io_out,
  output [37:0] io_oeb

);

    wire clk;
    wire rstn;

    wire [13:0] count;
    wire [6:0] led;

    assign count[13:4] = 10'b0;

    assign clk = io_in[10];
    assign io_oeb[10] = 1'b1;
    assign rstn = io_in[11];
    assign io_oeb[11] = 1'b1;

    assign io_out[18:12] = led[6:0];
    assign io_oeb[18:12] = 7'b0;

    assign io_out[11:0] = 12'b0;
    assign io_out[37:19] = 19'b0;

    assign io_oeb[9:0] = 10'b0;
    assign io_oeb[37:19] = 19'b0;


    counter c0 (
        .clk(clk),
        .rstn(rstn),
        .out(count[3:0])
    );

    segment7 s0 (
        .count(count[3:0]),
        .segments(led)
    );

endmodule

module counter (
        input   clk,
        input   rstn,
        output reg[3:0] out
);

always @ (posedge clk) begin
  if (! rstn)
        out <= 0;
    else
        out <= out + 1;
end

endmodule


module segment7(
     count,
     segments
    );

     //Declare inputs,outputs and internal variables.
     input [3:0] count;
     output reg [6:0] segments;

//always block for converting bin count into 7 segment format
  always @(*)
    begin
        case(count)
            //                7654321
            0:  segments = 7'b0111111;
            1:  segments = 7'b0000110;
            2:  segments = 7'b1011011;
            3:  segments = 7'b1001111;
            4:  segments = 7'b1100110;
            5:  segments = 7'b1101101;
            6:  segments = 7'b1111100;
            7:  segments = 7'b0000111;
            8:  segments = 7'b1111111;
            9:  segments = 7'b1100111;
            default:
                segments = 7'b0000000;
        endcase
    end
    
endmodule

`default_nettype wire
