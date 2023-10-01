PREFIX:=main
FILES:= $(wildcard *.tex)
BIB:= $(wildcard *.bib)

$(PREFIX).pdf: $(PREFIX).tex $(PREFIX).bbl $(FILES)
	pdflatex "$(PREFIX)"

$(PREFIX).bbl: $(BIB)
	pdflatex "$(PREFIX)"
	bibtex "$(PREFIX)"
	pdflatex "$(PREFIX)"

twice: $(PREFIX).tex $(PREFIX).bbl $(FILES)
	pdflatex "$(PREFIX)"
	pdflatex "$(PREFIX)"

once: $(PREFIX).tex $(PREFIX).bbl $(FILES)
	pdflatex "$(PREFIX)"

clean:
	rm -f $(PREFIX).aux
	rm -f $(PREFIX).log
	rm -f $(PREFIX).pdf
	rm -f $(PREFIX).bbl
	rm -f $(PREFIX).blg
	rm -f $(PREFIX).out
	rm -f $(PREFIX).synctex.gz
