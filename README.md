# Alan Bugs Testbed

A place to submit examples of bugs in [ALAN] Interactive Fiction Language, in order to isolate them and fix them.

Anyone can [report a bug] by providing code examples to this repository via pull requests.

For any questions and discussions, either [open an issue] here or join the conversation via email on the [Alan-IF Google group].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
    - [Submitting a Bug](#submitting-a-bug)
- [Project Organization](#project-organization)
    - [Useful Verbs](#useful-verbs)
- [Current Bugs Examples](#current-bugs-examples)
- [Artistic License 2.0](#artistic-license-20)

<!-- /MarkdownTOC -->

-----

# Introduction

The [Alan] language is still in beta stage, it's therefore important for its development toward the first stable release to find and report any bugs encountered.


Some bugs pop-up unexpectedly during adventures creation, and it's not always easy to isolate their cause.
Ideally, the best way to inform Alan developers about a bug is to extrapolate it from its context by creating a minimal viable example of its manifestation.
But sometimes this is not an easy task due the complexity of the context.

Either way, this repository is the right place to publicly share examples of bugs.
Publishing real code examples is much better than sending code examples pasted inside emails, and it grants Alan developers quicker access to the code.

## Submitting a Bug

You can either:

- [Open an issue], and describe the bug.
- Submit an example adventure of the bug.

The former approach is quicker and preferable for bugs that can be easily described and reproduced by anyone.

The latter is the way to go when a full example is required to demonstrate a bug.

Each example should be contributed in an isolated folder, to keep the project structure uncluttered.
Clone the repository, add your example, and create a pull request.

In either case, don't forget to provide details about your OS, the version of the Alan SDK used, and a clear description of the bug.

# Project Organization

Bugs examples are organized by folders.

A copy of [Anssi Räisänen]'s  2.x (dev snapshot) is provided in oreder to allow running example adventures known to display a bug:

- [`/StdLib/`](./StdLib)

## Useful Verbs

To reduce code typing in each test adventure, some core verbs are provided to cover basic commands:

- [`/_core-verbs/`](./_core-verbs/):
    + [`core-verbs.i`](./_core-verbs/core-verbs.i) — take, drop, put, look, i.


# Current Bugs Examples

|                    folder                   |                  description                  |       Alan SDK       | Issue | status |
|---------------------------------------------|-----------------------------------------------|----------------------|-------|--------|
| [`/whitespace-bug/`](./whitespace-bug/)     | inconsistent white space in room descriptions | v3.0beta6 build 1880 |       | solved |
| [`/container-limits/`](./container-limits/) | TAKE ALL exceeding `Limit Count` crashes      | v3.0beta8 build 2220 | [#34] | solved |

# Artistic License 2.0

- [`COPYING`](./COPYING)

This project is governed by the terms of the Artistic License 2.0.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Open an issue]: https://github.com/alan-if/alan-bugs-testbed/issues/new "Click to open an issue to report a bug"

<!-- Alan -->

[Alan-IF Google group]: https://groups.google.com/g/alan-if/ "Visit the Alan-IF Discussions group at Google"
[ALAN]: https://www.alanif.se/ "Visit Alan website"
[Standard Library]: https://github.com/AnssiR66/AlanStdLib "Go to the Alan Standard Library repository on GitHub"

<!-- document cross references -->

[report a bug]: #submitting-a-bug

<!-- Issues -->

[#34]: https://github.com/alan-if/alan/issues/34

<!-- people -->

[Anssi Räisänen]: https://github.com/AnssiR66 "View Anssi Räisänen's GitHub profile"

<!-- EOF -->
