# EEL4768---Phase-2

Docs: `documentation/phase_2.pdf`. Four modules, each a skeleton at the repo
root with the body left for you: `alu.v`, `imm.v`, `rf.v`, `decoder.v`.

## There is no autograder here

Writing a testbench for each module is part of the assignment. Read
`example/opmux.v` and `example/opmux_tb.v` first -- the testbench is a
worked, commented walkthrough, and every testbench you write should follow
its shape (drive inputs, wait, compare against a value you worked out by
hand, count and print a verdict).

When you've written e.g. `alu_tb.v` next to `alu.v`, the test runner below
will pick it up automatically. A module without a testbench yet is reported
as skipped, not failed.

## Running locally

Install Icarus Verilog (and gtkwave, for waveforms) via conda:

```
conda env create -f https://raw.githubusercontent.com/UnaryLab/EEL4768_RISC-V_Project/main/phase_2/environment.yaml
conda activate eel4768_phase_2
```

or on Debian/Ubuntu: `sudo apt-get install iverilog gtkwave`.

Then:

```
make test    # writes results/local.txt
```

`./run_test.sh <name> [submission_dir]` is the underlying script (see
`Makefile`). Compile/sim logs and any `.vcd` waveforms land in `build/`.

## CI

`.github/workflows/ci.yml` runs `make ci` on every push/PR (installing
Icarus Verilog on the runner) and posts a PASS/FAIL/SKIP table as the job
summary, with logs and waveforms attached as the `self-check-output`
artifact.
