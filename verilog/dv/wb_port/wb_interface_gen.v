// Generated by SandPiper(TM) 1.12-2022/01/27-beta from Redwood EDA, LLC.
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


`include "sandpiper_gen.vh"





//
// Signals declared top-level.
//

// For $ready.
wire L0_ready_a0;
reg  L0_ready_a1;

// For $valid.
wire L0_valid_a0;

// For $valid_addr.
wire L0_valid_addr_a0;



generate

   // For $ready.
   always @(posedge clk) L0_ready_a1 <= L0_ready_a0;



endgenerate




generate   // This is awkward, but we need to go into 'generate' context in the line that `includes the declarations file.
