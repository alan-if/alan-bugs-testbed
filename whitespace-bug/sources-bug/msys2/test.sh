#!/bin/sh
# converted from test.bat by

function ExecTest()
{
    echo TEST $1 WITH:  $2 INTO: $3
    ./msys2arun.exe -r $1 < $2 > $3
}

## -----------------------------------------------------------------------------

adv=../ega.alan

rm *.a3c *.a3log

## Compile using StdLib1:
alan -import ../../ -import ../StdLib1 $adv
mv ega.a3c ega1.a3c
ExecTest ega1.a3c test.a3sol test1.a3log

## Compile using StdLib2:
alan -import ../../ -import ../StdLib2 $adv
mv ega.a3c ega2.a3c
ExecTest ega2.a3c test.a3sol test2.a3log

echo DIFF RESULT:
diff test1.a3log test2.a3log
