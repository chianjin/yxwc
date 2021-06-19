# ------------------------------------------------
# ->> Source and dist file names
# ------------------------------------------------
PDFFileName=宜轩文艸
TeXFileName=yxwc
# ------------------------------------------------
# ->> Set Compiler
# ------------------------------------------------
Compiler=latexmk -xelatex
# ------------------------------------------------
# ->> Set directory
# ------------------------------------------------
SourcePath=src
BuildPath=build
if [ ! -d ${BuildPath} ]
then
    mkdir ${BuildPath}
fi
# ------------------------------------------------
# ->> Build textual content
# ------------------------------------------------
cd ${SourcePath}
$Compiler -synctex=1 -interaction=nonstopmode -output-directory=../${BuildPath} ${TeXFileName}
cd ..
# ------------------------------------------------
# ->> Rename output PDF filename
# ------------------------------------------------
if [ -f ${BuildPath}/${PDFFileName}.pdf ]
then
    rm ${BuildPath}/${PDFFileName}.pdf
fi
if [ -f ${BuildPath}/${TeXFileName}.pdf ]
then
    mv ${BuildPath}/${TeXFileName}.pdf ${PDFFileName}.pdf
fi
echo ------------------------------------------------
echo Build ${TeXFileName} finished...
echo ------------------------------------------------
