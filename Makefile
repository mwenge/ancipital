.PHONY: all clean run

D64_IMAGE = "bin/ancipital.d64"
X64 = x64
X64SC = x64sc
C1541 = c1541

all: clean d64 run
original: clean d64_orig run_orig

ancipital.prg: src/ancipital.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/ancipital.prg -L bin/list-co1.txt -l bin/labels.txt src/ancipital.asm
	md5sum bin/ancipital.prg bin/ancipital-bench.prg

d64: ancipital.prg
	$(C1541) -format "ancipital,rq" d64 $(D64_IMAGE)
	$(C1541) $(D64_IMAGE) -write bin/ancipital.prg "ancipital"
	$(C1541) $(D64_IMAGE) -list

run: d64
	$(X64) -verbose $(D64_IMAGE)

run: d64

clean:
	-rm $(D64_IMAGE)
	-rm bin/ancipital.prg
	-rm bin/ancipital.prg
	-rm bin/bonusphase_graphics.prg
	-rm bin/*.txt
