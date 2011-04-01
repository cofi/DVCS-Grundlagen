FILE=talk.tex
HANDOUT=handout.tex
RM=rm -rf

presentation: $(FILE)
	@pdflatex $<
	@pdflatex $<

handout: $(FILE)
	@sed -e '1s/presentation/handout/' < $< > $(HANDOUT)
	@pdflatex $(HANDOUT)
	@pdflatex $(HANDOUT)

.PHONY: clean mrproper
clean:
	$(RM) *.aux *.log *.out *.nav *.toc *.snm *.vrb

mrproper: clean
	$(RM) *.pdf auto $(HANDOUT)
