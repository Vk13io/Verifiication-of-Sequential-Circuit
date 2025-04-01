module top;
  import tb_pkg::*;
  import uvm_pkg::*;

  bit clk; 
  intf in(clk);

  ring_counter DUT(.rst(in.rst),
                   .clk(in.clk),
                   .out(in.out)
                   );
  
  initial begin
    clk = 0;
  end

  always #5 clk = ~clk;
  

  initial begin
    uvm_config_db#(virtual intf)::set(null,"*","vif",in);
    run_test("ring_test");
  end
endmodule
