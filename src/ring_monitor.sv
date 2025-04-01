class ring_monitor extends uvm_monitor;

  `uvm_component_utils(ring_monitor)

  function new(string name="ring_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  int unsigned count=0;
  
  virtual interface intf vif;

  uvm_analysis_port #(ring_sequence_item) ap_mon;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
  endfunction

  task run_phase(uvm_phase phase);
    forever
    begin
      sample_dut();
      
    end
  endtask

task sample_dut();
	
  ring_sequence_item  txn;
     txn = ring_sequence_item::type_id::create("txn");
    @(vif.cb);
    txn.rst = vif.rst;
    txn.out = vif.out;

 `uvm_info("ring_mon",$sformatf("Printing from Monitor %s", txn.sprint()),UVM_LOW)


	ap_mon.write(txn);
  endtask

endclass
