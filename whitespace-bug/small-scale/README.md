# Small Scale Bug Example

Trying to create a minimum viable example (no library) displaying the whitespace bug.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
- [Approach](#approach)

<!-- /MarkdownTOC -->

-----

# Introduction

To try and isolate if the whitespace bug is related to specific Alan constructs or instructions, we'll try and build a small adventure and test if it shows the bug, and keep adding code to it until the bug shows up.

The idea is that if we keep adding at each step different type of constructs (conditional descriptions, events, etc.) we'll eventually pin down a specific feature that triggers the bug.

This is because so far the bug has always shown up between sentences that are stitched together by Alan — in particular, when the previous sentence ended with a full stop or other sentence-ending marks. So, probably the bug has to do with the smart functionality that collates different strings into well formatted sentences, removing redundant whitespace.

# Approach

We create a source adventure "`source_<adv-name>.alan`" that contains leading and trailing whitespace in the code lines, and the test script will create a copy "`polish_<adv-name>.alan`" where the extra white space is removed.

- [`source_example.alan`](./source_example.alan) (extra WS) → SED → [`polish_example.alan`](./polish_example.alan) (stripped WS)

Then both adventures are compiled:

- [`source_example.alan`](./source_example.alan) → ALAN → [`source_example.a3c`](./source_example.a3c)
- [`polish_example.alan`](./polish_example.alan) → ALAN → [`polish_example.a3c`](./polish_example.a3c)

and run against the same commands-script:

- [`source_example.a3c`](./source_example.a3c) → ARUN → [`test.a3sol`](./test.a3sol) → [`source_test.a3log`](./source_test.a3log)
- [`polish_example.a3c`](./polish_example.a3c) → ARUN → [`test.a3sol`](./test.a3sol) → [`polish_test.a3log`](./polish_test.a3log)

Their transcripts preserve the same `source_`/`polish_` prefixes to distinguish them.




<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>



<!-- EOF -->