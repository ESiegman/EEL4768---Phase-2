# EEL4768---Phase-2

Docs: `documentation/phase_2.pdf`. Four modules, each a skeleton at the repo
root with the body left for you: `alu.v`, `imm.v`, `rf.v`, `decoder.v`.

## There is no autograder here

Writing a testbench for each module is part of the assignment. Read
`example/opmux.v` and `example/opmux_tb.v` first -- the testbench is a
worked, commented walkthrough, and every testbench you write should follow
its shape (drive inputs, wait, compare against a value you worked out by
hand, count and print a verdict).

`alu_tb.v`, `imm_tb.v`, `rf_tb.v` and `decoder_tb.v` exist at the repo root
as empty placeholders. Once you write one, the test runner below picks it
up automatically. A module whose testbench is still empty (or missing)
fails to compile and is reported as failed, not skipped -- that's the
signal to go write it.

## Running locally

Install Icarus Verilog, yosys and netlistsvg via conda + npm:

```
conda env create -f https://raw.githubusercontent.com/UnaryLab/EEL4768_RISC-V_Project/main/phase_2/environment.yaml
conda activate eel4768_phase_2
npm install -g netlistsvg   # for `make schematics`; yosys itself isn't on conda-forge for this env
```

or on Debian/Ubuntu: `sudo apt-get install iverilog yosys` (+ `npm install -g netlistsvg`).
Waveforms open in [Surfer](https://surfer-project.org/) or gtkwave, whichever you have.

Then:

```
make test         # run your testbenches, writes results/local.txt
make schematics   # synthesize alu/imm/rf/decoder, render SVGs to build/schematics/
```

`./run_test.sh <name> [submission_dir]` and `./gen_schematics.sh` are the
underlying scripts (see `Makefile`). Compile/sim logs, `.vcd` waveforms and
schematic `.svg`s all land under `build/`.

## CI

`.github/workflows/ci.yml` runs on every push/PR: it installs Icarus
Verilog, yosys and netlistsvg, runs your testbenches (`make ci`) and
synthesizes all four modules into gate-level schematics. It posts a
PASS/FAIL/SKIP table plus a schematic-generation summary as the job
summary, with logs, waveforms and schematic SVGs attached as the
`self-check-output` artifact. Only testbench failures fail the job.
