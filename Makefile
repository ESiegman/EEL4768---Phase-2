.PHONY: help test ci clean

help:
	@echo "make test    run your testbenches (writes results/local.txt)"
	@echo "make ci      same thing, under the name CI uses (results/ci.txt)"
	@echo "make clean   remove results/ and build/"
	@echo
	@echo "Details:      ./run_test.sh <name> [submission_dir]"
	@echo "Write your own <module>_tb.v for alu, imm, rf and decoder -- see"
	@echo "README.md and example/opmux_tb.v. There is no autograder for"
	@echo "phase 2; this only runs the testbenches you write."

test:
	@./run_test.sh local

ci:
	@./run_test.sh ci

clean:
	rm -rf results build
