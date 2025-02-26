FILES="book.tex bookcover.tex"

for F in $FILES ; do
pdflatex $F
pdflatex $F
done

