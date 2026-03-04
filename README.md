SPI Slave Controller – FPGA Implementation
A fully functional SPI Slave implementation on FPGA, featuring a built-in RAM and an FSM-based controller. The project explores the effect of FSM state encoding on timing performance and maximum operating frequency.
📌 Project Overview
This project implements an SPI Slave that communicates with a master device via the standard SPI protocol (MOSI, MISO, SS_n, CLK). Internally, the slave uses a synchronous active-low reset FSM to control read/write operations to a RAM module.
⚙️ Features

SPI Slave with RAM read/write support
FSM implemented in 3 different encodings: Gray, One-Hot, and Sequential
Timing-driven encoding selection based on best setup/hold slack after implementation
ILA Debug Core integrated for on-chip signal monitoring
Constraint file mapping signals to physical FPGA switches and LEDs

🗂️ Repository Structure
├── src/                  # RTL design files (SPI Slave, FSM, RAM)
├── tb/                   # Testbench files
├── sim/                  # QuestaSim do files
├── constraints/          # XDC constraint file
├── netlist/              # Generated netlist
├── bitstream/            # Final .bit file
└── report/               # PDF report with waveforms & timing analysis
🔧 Tools Used
ToolPurposeVivadoSynthesis, Implementation, BitstreamQuestaSimSimulation & LintingILA Debug CoreOn-chip signal analysis
📊 FSM Encoding Comparison
EncodingSetup SlackHold SlackMax FrequencySequential---Gray---One-Hot---

✅ Best encoding chosen based on timing results after implementation.

📋 Constraints
SignalFPGA Pinrst_nSwitch 0SS_nSwitch 1MOSISwitch 2MISOLED 0
