class ring_test extends uvm_test;

    `uvm_component_utils(ring_test)

    ring_env env_h;
  
int has_scoreboard = 1;


  function new(string name="ring_test",uvm_component parent);
	    super.new(name,parent);
    endfunction


    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_h = ring_env::type_id::create("env_h",this);

    endfunction
  

    task run_phase(uvm_phase phase);
	uvm_top.print_topology();
       endtask

endclass:ring_test



class normal_seq_test extends ring_test;
`uvm_component_utils(normal_seq_test)
 function new(string name="normal_seq_test",uvm_component parent);
	    super.new(name,parent);
    endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

 task run_phase(uvm_phase phase);
 	normal_seq n_seq;
 	phase.raise_objection(this);
		n_seq= normal_seq::type_id::create("n_seq");
 		n_seq.start(env_h.agent_h.sequencer_h);
 		#300;
	phase.drop_objection(this);
endtask


endclass






