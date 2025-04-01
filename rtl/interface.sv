interface intf(input bit clk);
    //  port declaration    
    logic rst;
    logic [7:0] out;

       // clocking
    clocking cb @(posedge clk);
      default input #2 output #1step;
      output rst; //input of DUT
      input  out; //output of DUT
    endclocking


//modport ring_MP(clocking cb);

endinterface