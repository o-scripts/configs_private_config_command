m.tex()
{
	echo "tmpfiles = *.aux *.log *.toc *.fls *.nav *.out *.snm *.fdb_latexmk *.vrb *.synctex.gz" > Makefile
	echo "" >> Makefile
	echo "all:" >> Makefile
	echo "	xelatex *.tex" >> Makefile
	echo "	mkdir -p pdf" >> Makefile
	echo "	mv *.pdf pdf/" >> Makefile
	echo "clean:" >> Makefile
	echo '	rm -vf ${tmpfiles}' >> Makefile
}