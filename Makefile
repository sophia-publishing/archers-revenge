.PHONY: all clean

all: build/pdf_output/book.pdf build/pdf_output/bookcover.pdf build/pdf_output/book-cover-for-web.jpg

build:
	mkdir -p build/output/chapters build/output/cover build/pdf_output

build/pdf_output/book.pdf: book.tex | build
	pdflatex -output-directory=build/output $<
	pdflatex -output-directory=build/output $<
	cp build/output/book.pdf $@

build/pdf_output/bookcover.pdf: bookcover.tex | build
	pdflatex -output-directory=build/output $<
	pdflatex -output-directory=build/output $<
	cp build/output/bookcover.pdf $@

build/pdf_output/book-cover-for-web.jpg: build/pdf_output/book.pdf
	pdftoppm $< build/pdf_output/book-cover-for-web -jpeg -f 1 -l 1 -singlefile

clean:
	rm -rf build