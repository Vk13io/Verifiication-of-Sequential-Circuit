# Verifiication-of-Sequential-Circuit
Verification of Ring Counter using UVM TB


# Ring Counter Verification with UVM

## Project Overview

This project is designed to verify a **Ring Counter** implemented in RTL using **UVM** (Universal Verification Methodology). The project structure is organized into multiple directories, each serving a specific purpose. It includes RTL source files, UVM testbench files, simulation scripts, and test cases.

---

## Project Structure

```plaintext
├── rtl/                   # RTL source files (Ring Counter implementation)
│   ├── ring_counter.v      # Ring Counter module (implementation)
├── sim/                   # Simulation scripts, Makefile, and simulation logs
├── src/                   # UVM Testbench files (Agent, Driver, Monitor, etc.)
│   ├── ring_agent.sv       # UVM Agent for the Ring Counter
│   ├── ring_driver.sv      # UVM Driver for driving sequences to the DUT
│   ├── ring_monitor.sv     # UVM Monitor for observing DUT activity
│   ├── ring_sequence.sv    # UVM Sequence for stimulus generation
│   ├── ring_sequence_item.sv # UVM Sequence Item (data type for sequence)
│   ├── ring_sequencer.sv   # UVM Sequencer for managing sequence execution
├── tb/                     # Testbench files (Environment, Scoreboard, etc.)
│   ├── env_cfg.sv          # UVM Environment configuration
│   ├── ring_env.sv         # UVM Testbench Environment (includes Agents, etc.)
│   ├── ring_scoreboard.sv  # UVM Scoreboard for result checking and reporting
│   ├── top.sv              # Top-level testbench module
├── test/                   # Test cases and test configurations
│   ├── ring_test.sv        # Top-level test file that runs the verification
│   ├── tb_pkg.sv           # Package for common testbench utilities
└── README.md               # Project Documentation (this file)

```

## Test Scenarios
The following test scenarios are applied to verify the Ring Counter:

1. **Basic Ring Counter Operation**: Verify the basic counter behavior and check the cyclic pattern.
2. **Boundary Conditions**: Check the behavior when the counter reaches its maximum or minimum value.
3. **Reset Behavior**: Ensure the counter resets correctly to its initial state.
4. **Clock Enable**: Test the counter's response to the enable signal, verifying that it works when the clock is enabled.
5. **Edge Cases**: Verify the counter behavior for edge cases such as when the reset and enable are toggled at the same time.
6. **Sequencer Validation**: Ensure that the UVM sequencer drives the correct sequence of operations to the DUT.

## Testbench Details
### UVM Testbench Components

- **Ring Agent**: The agent drives stimulus and monitors the response of the Ring Counter DUT. It includes a driver and a monitor.
- **Ring Driver**: The driver applies sequences to the DUT, including clock and reset signals.
- **Ring Monitor**: The monitor observes signals from the DUT and sends them to the scoreboard for comparison with expected values.
- **Ring Scoreboard**: The scoreboard checks the correctness of the DUT's output by comparing it against expected results.
- **Ring Environment**: The environment includes the UVM agents, scoreboard, and the test sequences. It configures the agents

📌 **Author**: Vikas K  
📩 **Contact**: [GitHub Profile](https://github.com/Vk13io)
