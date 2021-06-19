@ECHO OFF
rem ------------------------------------------------
rem ->> Source and dist file names
rem ------------------------------------------------
set PDFFileName=ÒËÐùÎÄÆH
set TeXFileName=yxwc

rem ------------------------------------------------
rem ->> TEX compiler
rem ------------------------------------------------
set Compiler=latexmk -xelatex 

rem ------------------------------------------------
rem ->> Build directory
rem ------------------------------------------------
set BuildPath=build
if not exist %BuildPath% ( md %BuildPath% )

rem ------------------------------------------------
rem ->> Build textual content
rem ------------------------------------------------
set SourcePath=src
rem %CompileName% -synctex=1 -interaction=nonstopmode -output-directory=%BuildPath% %FileName%
cd %SourcePath%
%Compiler% -synctex=1 -output-directory=../%BuildPath% %TeXFileName%
cd ..
if exist %PDFFileName%.pdf ( del %PDFFileName%.pdf )
if exist %BuildPath%\%TeXFileName%.pdf ( copy %BuildPath%\%TeXFileName%.pdf %PDFFileName%.pdf )

rem ------------------------------------------------
rem ->> View compiled file
rem ------------------------------------------------
if exist %PDFFileName%.pdf (
start  " " /max %PDFFileName%.pdf
)

ECHO ------------------------------------------------
ECHO Build %TeXFileName%.tex finished...
ECHO ------------------------------------------------
