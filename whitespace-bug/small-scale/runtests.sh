#!/bin/sh

function Separator {
  echo -e "\e[90m------------------------------------------------------------------------------"
}

function ExecTest()
{
  Separator
  echo -e "\e[94mTEST \"\e[93m$1\e[94m\" WITH: \"\e[93m$2\e[94m\" INTO: \"\e[93m$3\""
  arun -r $1 < $2 > $3
}

function Compile()
{
  Separator
  echo -e "\e[94mCOMPILE \"\e[93m$1\e[94m\""
  alan $1 > /dev/null 2>&1 || (
    echo -e "\e[91m*** COMPILATION FAILED! ***"
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    alan $1
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    exit 1
    )
}

function PolishSource()
{
  # Remove leading AND trailing whitespaces
  Separator
  echo -e "\e[94mCOPY \"\e[93m$1\e[94m\" TO \"\e[93m$2\e[94m\" AND POLISH WHITESPACE"
  sed -E \
  -e "s/^ +//" \
  -e "s/ +$//" \
  $1 > $2
  # ---------------------------------------
  # If OS is Windows, normalize EOL to CRLF
  # ---------------------------------------
  if [[ $(uname -s) == MINGW* ]];then
    unix2dos $2
  fi
}

function DiffTranscripts()
{
  Separator
  echo -e "\e[94mDIFFING \"\e[93m$1\e[94m\" WITH: \"\e[93m$2\e[94m\":"
  echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"
  diff $1 $2
  echo -e "\e[94m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"
}

## -----------------------------------------------------------------------------

rm *.a3c  *.a3log  polish_*.alan  > /dev/null 2>&1

PolishSource "source_example.alan"  "polish_example.alan"
Compile "source_example.alan" || exit
Compile "polish_example.alan" || exit

ExecTest "source_example.a3c"  "test.a3sol"  "source_test.a3log"
ExecTest "polish_example.a3c"  "test.a3sol"  "polish_test.a3log"

DiffTranscripts "source_test.a3log"  "polish_test.a3log"

echo -e "/// FINSH ///"
exit 0
