# Bug Test with Source Changes 

These tests try to recreate the problem in transcript whitespace caused by cleaning the StdLib source files (removing trailing spaces globally).


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Test Contents](#test-contents)

<!-- /MarkdownTOC -->

-----

# Test Contents

- [`test.bat`](./test.bat) — tests script.

There is only one test adventure and two command scripts:

- [`ega.alan`](./ega.alan)
- [`test.a3sol`](./test.a3sol)
- [`test-no-comments.a3sol`](./test-no-comments.a3sol) — identical to `test.a3sol`, but all comment lines are stripped out.

> __NOTE__ — the `test-no-comments.a3sol` variation was created to test if the problem might have been caused by comment lines in the commands scripts (expecially empty comment lines). But it turned out that the whitespace bug is found also in the transcripts without comments. At least now we can rule out comments as the source of the problem.

The adventure is compiled twice, using two different StdLib versions:

- [`StdLib1`](./StdLib1) — StdLib before polishing: commit [a18b8e6c0].
- [`StdLib2`](./StdLib2) — StdLib after polishing: commit [f91ab20aa].

The only difference between them is the removal of trailing whitespace.

After compiling, the adventure and the log are renamed to allow distinguishing which StdLib folder was used to compile it:

Files ending in "1" were compiled against [`StdLib1`](./StdLib1):

- [`ega1.a3c`](./ega1.a3c)
- [`test1.a3log`](./test1.a3log)
- [`test1-no-comments.a3log`](./test1-no-comments.a3log)

The others agains [`StdLib2`](./StdLib2):

- [`ega2.a3c`](./ega2.a3c)
- [`test2.a3log`](./test2.a3log)
- [`test2-no-comments.a3log`](./test2-no-comments.a3log)

Although the source files are the same (except for whitespace), the resulting transcripts show differences in whitespace, as shown in the diff report:

- [`DiffReport.html`](./DiffReport.html)

At line 20, the adventure compiled using the cleaned up StdLib produces one space less after `consumism.`:

```diff
-------------------------------------------------
 20 fashion consumism.  <>  20 fashion consumism.
-------------------------------------------------
```

So, the bug is not due to Git commits and checkout, nor to the command files or CDM codepage settings, but rather to something regarding the actual Alan sources parser and whitespace handling.



[a18b8e6c0]: https://github.com/AnssiR66/AlanStdLib/commit/a18b8e6c037587f698799ad239d0741ebd45c70d#diff-895c3fd2f40a1836c077eb632264ae80
[f91ab20aa]: https://github.com/AnssiR66/AlanStdLib/commit/f91ab20aa2208ae1121d72978126510bcf160c7b#diff-895c3fd2f40a1836c077eb632264ae80


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>



<!-- EOF -->