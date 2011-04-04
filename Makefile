FILE=talk.tex
HANDOUT=handout.tex
EXPORTED=img/cvcs.png img/dvcs.png
RM=rm -rf

presentation: $(FILE) $(EXPORTED)
	@pdflatex $<
	@pdflatex $<

handout: $(FILE) $(EXPORTED)
	@sed -e '1s/presentation/handout/' < $< > $(HANDOUT)
	@pdflatex $(HANDOUT)
	@pdflatex $(HANDOUT)

%.png: %.svg
	@inkscape --without-gui --export-area-drawing --export-dpi=120 --export-png=$@ $<

.PHONY: clean mrproper
clean:
	$(RM) *.aux *.log *.out *.nav *.toc *.snm *.vrb

mrproper: clean
	$(RM) *.pdf auto $(HANDOUT) $(EXPORTED)
