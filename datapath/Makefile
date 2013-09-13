GHDL = ghdl
ANALIZE = -a -Wc,-m32 -Wa,--32 --ieee=synopsys -fexplicit
ELABORATE = -e -Wa,--32 -Wl,-m32 --ieee=synopsys -fexplicit
RUN = -r


#--------------------------------------------------
#EDIT
NAME0 = adder.vhd
NAME1 = ALU.vhd
NAME2 = dmem.vhd
NAME3 = flopr.vhd
NAME4 = imem.vhd
NAME5 = mux2.vhd
NAME6 = regfile.vhd
NAME7 = signext.vhd
NAME8 = sl2.vhd
NAME9 = components.vhd
NAME10 = datapath.vhd
NAME11 = datapath_tb.vhd
NAME12 = datapath_tb
STOP_TIME = --stop-time=200ns
VCD_FILE = --vcd=data.vcd
#--------------------------------------------------

all: vhdl

vhdl:
	$(GHDL) $(ANALIZE) $(NAME0) 
	$(GHDL) $(ANALIZE) $(NAME1)  
	$(GHDL) $(ANALIZE) $(NAME2) 
	$(GHDL) $(ANALIZE) $(NAME3) 
	$(GHDL) $(ANALIZE) $(NAME4)  
	$(GHDL) $(ANALIZE) $(NAME5) 
	$(GHDL) $(ANALIZE) $(NAME6) 
	$(GHDL) $(ANALIZE) $(NAME7) 
	$(GHDL) $(ANALIZE) $(NAME8) 
	$(GHDL) $(ANALIZE) $(NAME9) 
	$(GHDL) $(ANALIZE) $(NAME10) 
	$(GHDL) $(ANALIZE) $(NAME11) 
	$(GHDL) $(ELABORATE) $(NAME12)
	$(GHDL) $(RUN) $(NAME12) $(STOP_TIME) $(VCD_FILE)   

clean:
	rm -f *.o *.cf *.vcd $(NAMETB)
