class ring_env extends uvm_env;

   `uvm_component_utils(ring_env)
  function new(string name="ring_env",uvm_component parent);
    super.new(name,parent);
  endfunction

  ring_agent    agent_h;
  ring_scoreboard scoreboard_h;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
			 scoreboard_h = ring_scoreboard::type_id::create("scoreboard_h",this);
		

    agent_h    = ring_agent::type_id::create("agent_h",this);
   
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  agent_h.monitor_h.ap_mon.connect(scoreboard_h.fifo_ring.analysis_export);
  endfunction
endclass:ring_env
