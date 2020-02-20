m.tex()
{
	cat > Makefile << EOF
tmpfiles="*.aux *.log *.toc *.fls *.nav *.out *.snm *.fdb_latexmk *.vrb *.synctex.gz"
all:
	mkdir -p pdf
	xelatex *.tex
	mv *.pdf pdf/
clean:
	rm -vf ${tmpfiles}
EOF
}

m.latex()
{
    cat > Makefile <<EOF
#
# Makefile for Bachelorthesis
#
#  supresses command output
#
# conditionals are not allowed to have a starting tab,
# otherwise they will be sent to the shell
#
DEBUG='true'
ROOT_DIR= ${PWD}
BUILD_DIR=${ROOT_DIR}/.build
XELATEX_OPTS=-output-directory= $(BUILD_DIR)
BIBER_OPTS=--output_directory=$ (BUILD_DIR)
.PHONY : clearscr clean screen print

all: copy_sources screen print copy_output

copy_sources:
  rsync --verbose --checksum --recursive --human-readable --progress --exclude=output --exclude=.git* $(ROOT_DIR)/$ (ROOT_DIR)/.build

copy_output:
  cp --update $(BUILD_DIR)/*.pdf$ (ROOT_DIR)/output

screen:
  echo "Building screen version ..."
  cd $(BUILD_DIR)
ifeq ($ (DEBUG) , 'true')
  echo "\n------------------ xelatex --------------------\n"
  xelatex thesis $(XELATEX_OPTS) | grep --ignore-case warning
  echo "\n------------------- biber ---------------------\n"
  biber thesis$ (BIBER_OPTS)
  echo "\n--------------- makeglossaries ----------------\n"
  makeglossaries thesis
  echo "\n------------------ xelatex --------------------\n"
  xelatex thesis $(XELATEX_OPTS) | grep --ignore-case warning
else
  xelatex thesis$ (XELATEX_OPTS) > /dev/null
  biber thesis $(BIBER_OPTS) > /dev/null
  makeglossaries thesis > /dev/null
  xelatex thesis$ (XELATEX_OPTS) > /dev/null
endif

print:
  echo "Building print version ..."
  cd $(BUILD_DIR)
ifeq ($ (DEBUG) , 'true')
  echo "\n------------------ xelatex --------------------\n"
  xelatex thesis_print $(XELATEX_OPTS) | grep --ignore-case warning
  echo "\n------------------- biber ---------------------\n"
  biber thesis_print$ (BIBER_OPTS)
  echo "\n--------------- makeglossaries ----------------\n"
  makeglossaries thesis_print
  echo "\n------------------ xelatex --------------------\n"
  xelatex thesis_print $(XELATEX_OPTS) | grep --ignore-case warning
else
  xelatex thesis_print$ (XELATEX_OPTS) > /dev/null
  biber thesis_print $(BIBER_OPTS) > /dev/null
  makeglossaries thesis_print > /dev/null
  xelatex thesis_print$ (XELATEX_OPTS) > /dev/null
endif

clean:
  echo "I will clean up this mess ..."
  rm -rf $(BUILD_DIR)/*
  # remove the following commands, if the build was started in the BUILD_DIR successfully
  rm -f *.out *.nav *.snm *.toc *.log *.bcf *.bbl *.blg *.lof *.lol *.lot *.run.xml *.xdy *.glo *.glg *.gls *.idx *.ist *-blx.bib .*.bbl.swp *.mtc* *.maf
  find . -name \*.aux -type f -delete
  find . -name \*.bbl -type f -delete
  find . -name \*.bak -type f -delete
  find . -name \*.blg -type f -delete
  find . -name \*.fls -type f -delete
  find . -name \*.fdb_latexmk -type f -delete
  find . -name \*.vsdx -type f -delete
  find $(ROOT_DIR) -name '*in Konflikt stehende*' -delete

clearscreen:
  clear
EOF
}
