class env_cfg extends uvm_object;
	`uvm_object_utils(env_cfg)
	
	int has_scoreboard;

	function new(string name="env_cfg");
		super.new(name);
	endfunction

endclass
