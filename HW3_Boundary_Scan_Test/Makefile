VLOG = ncverilog
SRC = testbench.v TOP.v
VLOGARG = +access+r
TMPFILE = *.log verilog.key nWaveLog
DBFILE = *.fsdb *.vcd *.bak
RM = ‐rm ‐rf
all :: sim
sim :
	$(VLOG) $(SRC) $(VLOGARG)
clean :
	$(RM) $(TMPFILE)
veryclean :
	$(RM) $(TMPFILE) $(DBFILE)