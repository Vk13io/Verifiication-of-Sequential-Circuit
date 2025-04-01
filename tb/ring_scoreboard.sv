




class ring_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(ring_scoreboard)
   ring_sequence_item txn;
   uvm_tlm_analysis_fifo #(ring_sequence_item) fifo_ring;

	ring_sequence_item src_cov;

  

  covergroup ring_cov;
    option.per_instance= 1;
  
    
    RST:coverpoint txn.rst { 
        bins rst_low ={0};
        bins rst_high={1};
    }


OUT: coverpoint txn.out {
    bins bit_0 = {1};
    bins bit_1 = {2};
    bins bit_2 = {4};
    bins bit_3 = {8};
    bins bit_4 = {16};
    bins bit_5 = {32};
    bins bit_6 = {64};
    bins bit_7 = {128};
}
endgroup



  function new(string name="",uvm_component parent);
    super.new(name,parent);
    ring_cov=new();
  endfunction


	


function void build_phase (uvm_phase phase);
	super.build_phase(phase);

	fifo_ring = new("fifo_ring",this);
endfunction

task run_phase(uvm_phase phase);
forever
	begin
		fifo_ring.get(txn);
		src_cov = txn;
		
    		ring_cov.sample();
	end
endtask







endclass




