# Digital Electronics — VHDL Coursework (UniCal)

This repository collects the exercises, VHDL hardware descriptions, testbenches, and waveform simulations developed during the **Digital Electronics** (*Elettronica Digitale*) course for the **Computer Engineering** (*Ingegneria Informatica*) degree at the **University of Calabria (Università della Calabria — UniCal)**.

---

## Course Topics Covered

### 1. Combinational Arithmetic Circuits
- **Full Adder & 2-bit Ripple-Carry Adder (Structural)** — [`Lezioni/fullAdderRippleCarry2bit/`](./Lezioni/fullAdderRippleCarry2bit/)
  - 1-bit Full Adder and structural 2-bit Ripple-Carry Adder using `component` declarations and `port map`.
  - First testbench and VCD waveform generation.
- **8-bit Structural Ripple-Carry Adder (`generate`)** — [`Lezioni/PropagateAndRipple8bit/`](./Lezioni/PropagateAndRipple8bit/)
  - Scaling structural adders with `bit_vector` and `for ... generate` loops.
- **8-bit Behavioral Ripple-Carry Adder** — [`Lezioni/RippleCarryBehavioral/`](./Lezioni/RippleCarryBehavioral/)
  - Dataflow/behavioral modeling with propagate signals and compact bitwise vector equations (`xor`, `and`, `or`), plus simulation testbench.
- **Signed (Two's Complement) & Parameterized Ripple-Carry Adders** — [`Lezioni/RippleCarryComplemento2/`](./Lezioni/RippleCarryComplemento2/)
  - 4-bit signed addition in two's complement with sign extension to 5 bits.
  - Exhaustive testbenches using `ieee.numeric_bit` (`to_signed`) and FST waveform outputs.
  - Generic N-bit parameterized RCA (`generic` / `generic map`) instantiated for 8-bit and 16-bit widths (`RcaParametrizzato/`).
- **3-bit Carry-Lookahead Adder (CLA)** — [`Lezioni/CarryLookAhead3bit/`](./Lezioni/CarryLookAhead3bit/)
  - Fast carry computation via propagate (`P`) and generate (`G`) signals and expanded lookahead carry equations.
- **CLA vs. RCA Comparison (Two's Complement)** — [`Lezioni/CarryLookAheadAndRippleCarry/`](./Lezioni/CarryLookAheadAndRippleCarry/)
  - Side-by-side 4-bit signed Carry-Lookahead and Ripple-Carry adders written with `ieee.std_logic_1164`, verified together via testbench and FST waveform.

### 2. Sequential Circuits & Registers
- **D Flip-Flops & Registers (Structural, Behavioral & Generic)** — [`Lezioni/FlipFlopR&Register/`](./Lezioni/FlipFlopR&Register/)
  - Edge-triggered D Flip-Flop (`falling_edge(clk)`) with asynchronous `preset` using `process` blocks and sensitivity lists.
  - 4-bit registers implemented both structurally and behaviorally, plus a generic N-bit behavioral register.
  - Synchronous testbench design: 50% duty-cycle clock generation, asynchronous preset pulsing, and setup-time alignment.
- **8-bit Register with Priority Control Signals** — [`Lezioni/Register8BitSetClear/`](./Lezioni/Register8BitSetClear/)
  - 8-bit register on `rising_edge(clk)` combining an asynchronous active-high `clear` and a synchronous active-low `set`.

### 3. Sequential Arithmetic & Register-to-Register Datapaths
- **Sequential 4-bit Two's Complement RCA with Registers** — [`Lezioni/RippleCarrySequenziale/`](./Lezioni/RippleCarrySequenziale/)
  - 4-bit signed Ripple-Carry Adder wrapped between input registers (`A`, `B`) and an output register (`SS`) with asynchronous `clear` and `rising_edge(clk)` clocking.
  - Exhaustive 256-case testbench (`-8` to `+7` for both operands) verifying reset behavior, 2 ns setup-time margins, and 2-cycle pipeline latency with FST waveform output.

---

## Key VHDL Concepts Practiced
- **Modeling styles:** structural (`component`, `port map`, `for ... generate`), dataflow/behavioral, and sequential (`process`, sensitivity lists).
- **Standard libraries & types:** `bit` / `bit_vector`, `ieee.std_logic_1164`, `ieee.numeric_bit`, and `ieee.std_logic_arith`.
- **Reusability:** parameterized hardware components with `generic` and `generic map`.
- **Verification:** combinational and synchronous testbenches, clock generation, setup/hold timing awareness, exhaustive input sweeps, and waveform inspection (`.vcd` and `.fst`).

---

## Tools & Simulation Workflow

Simulations are compiled and executed with **[NVC](https://github.com/nickg/nvc)** and waveforms are inspected with **GTKWave** or **Surfer**.

Example (running the sequential Ripple-Carry Adder testbench):

```bash
cd Lezioni/RippleCarrySequenziale
nvc -a RippleCarryWithRegisterSequenziale.vhd TestbenchRCAwithRegister.vhd
nvc -e TestbenchRCAwithRegister
nvc -r TestbenchRCAwithRegister --wave=waveform.fst --stop-time=2580ns
```

---

## Author

Student in **Computer Engineering (*Ingegneria Informatica*)** — **University of Calabria (UniCal)**.
