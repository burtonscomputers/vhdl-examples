GHDL = ghdl
ANALIZE = -a -Wc,-m32 -Wa,--32 --ieee=synopsys -fexplicit
ELABORATE = -e -Wa,--32 -Wl,-m32 --ieee=synopsys -fexplicit
RUN = -r


#--------------------------------------------------
#EDIT
NAME0 = aludec.vhd
NAME1 = maindec.vhd
NAME2 = components1.vhd
NAME3 = controller.vhd
NAME4 = components2.vhd
NAME5 = datapath.vhd
NAME6 = components3.vhd
NAME7 = mips.vhd
NAME8 = test_mips.vhd
NAME12 = test_mips

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
	$(GHDL) $(ELABORATE) $(NAME12)
	$(GHDL) $(RUN) $(NAME12) $(STOP_TIME) $(VCD_FILE)

clean:
	rm -f *.o *.cf *.vcd $(NAMETB)
