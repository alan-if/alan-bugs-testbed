# Whitespace Bug

    Alan v3.0beta6 build 1880

These tests replicate the problem mentioned in the newsgroup.

Running [`test.bat`](./test.bat) will produce again the [`example1.a3log`](./example1.a3log) transcript, which is seen as Git as being different in whitespace from the previously commited one.

# StdLib Context

I couldn't manage to create a mininum-viable example with a small adventure, so I replicated the original context in a smaller scale.

It seems that this bug only shows up when using the StdLib (English or Italian alike). Maybe it's due to the size of the Library, or to some complexity introduced by it (or a bug in the Library itself?).

# Files

## Alan Sources

- [`/StdLib/`](./StdLib) — Alan StdLib (dev branch)
- [`ega.alan`](./ega.alan)
- [`inc_debug.i`](./inc_debug.i)

## Test Scripts

- [`test.bat`](./test.bat) — compiles `ega.alan` and runs commands script.
- [`example1.a3log`](./example1.a3log) — commands script.
- [`example1.a3sol`](./example1.a3sol) — transcript log.

## Diffs

- [`_example1__before.a3log`](./_example1__before.a3log) — commited transcript.
- [`_example1__after.a3log`](./_example1__after.a3log) — run again transcript.
- [`_example1_diff.html`](./_example1_diff.html) — diff report.

...

Tristano, 2019/04/24.

