# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

TARGETS = example.pdf
DEPS_DIR = .deps
LATEXMK = latexmk -silent -recorder -use-make -deps \
                  -e 'warn qq(In Makefile, turn off custom dependencies\n);' \
                  -e '@cus_dep_list = ();' \
                  -e 'show_cus_dep();'

all : $(TARGETS)
$(foreach file,$(TARGETS),$(eval -include $(DEPS_DIR)/$(file)P))

$(DEPS_DIR) :
	mkdir $@

%.pdf : %.tex
	mkdir -p $(DEPS_DIR)
	$(LATEXMK) -pdf -pdflatex="pdflatex -interaction=nonstopmode" -deps-out=$(DEPS_DIR)/$@P $<

clean:
	latexmk -CA
	$(RM) *.acn *.acr *.alg *.bbl *.glg *.glo *.gls *.xdy *.run.xml
	$(RM) *~
	$(RM) -r $(DEPS_DIR)
