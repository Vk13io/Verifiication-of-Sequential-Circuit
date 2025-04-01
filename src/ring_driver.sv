class ring_driver extends uvm_driver #(ring_sequence_item);

  `uvm_component_utils(ring_driver)
 

function new(string name="ring_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
 
 virtual interface intf vif;
 ring_sequence_item txn;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface");
    end
  endfunction
   
  task run_phase(uvm_phase phase);
   vif.rst = 1;

    forever begin
      seq_item_port.get_next_item(req);
      send_to_dut(req);
      seq_item_port.item_done();    
    end
  endtask
 
    task send_to_dut(ring_sequence_item req);

`uvm_info("DRV",$sformatf("printing from drv %s",req.sprint()),UVM_LOW)

  @(vif.cb);
  vif.rst <= 0; 
 
  endtask

endclass


























































 //`uvm_info (" RESET ", req.input2string(), UVM_LOW)
