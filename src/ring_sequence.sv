


class ring_sequence extends uvm_sequence#(ring_sequence_item);

  `uvm_object_utils(ring_sequence)            

  function new(string name="ring_sequence");  
    super.new(name);
  endfunction

endclass


class normal_seq extends ring_sequence;
  `uvm_object_utils(normal_seq)     

function new(string name="normal_seq");

	super.new(name);

endfunction

      task body();
 ring_sequence_item req;

    req=ring_sequence_item::type_id::create("req");
    start_item(req);
 req.rst=0;

    finish_item(req);

  endtask
  


endclass

















































/*

class rst_seq extends ring_sequence;
  `uvm_object_utils(rst_seq)     

function new(string name="rst_seq");

	super.new(name);

endfunction

      task body();
 ring_sequence_item req;
    req=ring_sequence_item::type_id::create("req");
    start_item(req);
    req.rst=1;
			
    finish_item(req);
  endtask:body


endclass


*/







