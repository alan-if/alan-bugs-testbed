:: "tests/clothing/TEST_FOLDER.bat"     v1.2.0 | 2019/04/18 | by Tristano Ajmone
:: -----------------------------------------------------------------------------
:: SINGLE ADVENTURE -- Run all tests in the folder.
:: -----------------------------------------------------------------------------
@ECHO OFF & CLS
SET ADV=ega.alan
:: Code Page 28591 = ISO 8859-1 Latin 1; Western European (ISO)
CHCP 28591 > nul

DEL *.a3c *.a3log

:: Compile using StdLib1:
CALL alan.exe -import ..\ -import StdLib1\ %ADV%
RENAME ega.a3c ega1.a3c
:: Test #1
CALL :ExecTest ega1.a3c test.a3sol
RENAME test.a3log test1.a3log
:: Test #1 Without comments in commands script
CALL :ExecTest ega1.a3c test-no-comments.a3sol
RENAME test-no-comments.a3log test1-no-comments.a3log

:: Compile using StdLib2:
CALL alan.exe -import ..\ -import StdLib2\ %ADV%
RENAME ega.a3c ega2.a3c
:: Test #1
CALL :ExecTest ega2.a3c test.a3sol
RENAME test.a3log test2.a3log
:: Test #1 Without comments in commands script
CALL :ExecTest ega2.a3c test-no-comments.a3sol
RENAME test-no-comments.a3log test2-no-comments.a3log
EXIT /B

:: -----------------------------------------------------------------------------

:ExecTest
ECHO TEST %1 WITH:  %2
CALL arun.exe -r %1 < %2 > %~n2.a3log
EXIT /B

