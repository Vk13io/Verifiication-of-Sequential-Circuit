




class ring_sequence_item extends uvm_sequence_item;

`uvm_object_utils(ring_sequence_item)
 bit rst;        
  bit [7:0] out;

  function new(string name="ring_sequence_item");
    super.new(name);
  endfunction



function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field("rst",this.rst,1,UVM_DEC);
		printer.print_field("out",this.out,8,UVM_DEC);
endfunction


endclass








































































/*
  function string input2string();
    return($sformatf(" rst=%0b ", rst));
  endfunction
  
  function string output2string();
    return($sformatf(" out=%8b", out));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction

*/

