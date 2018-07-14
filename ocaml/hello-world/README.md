# Hello World

The classical introductory exercise. Just say "Hello, World!"

["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Write a function that returns the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.


## Getting Started
For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ocaml).

## Installation
To work on the exercises, you will need `Opam` and `Core`. Consult [opam](https://opam.ocaml.org) website for instructions on how to install for your OS. Once `opam` is installed open a terminal window and run the following command to install core:

opam install core

## Running Tests
A Makefile is provided with a default target to compile your solution and run the tests. At the command line, type:

```bash
make
```

## Interactive Shell
`utop` is a command line program which allows you to run Ocaml code interactively. The easiest way to install it is via opam:
```bash
opam install utop
```
Consult [utop](https://github.com/diml/utop/blob/master/README.md) for more detail.

## Feedback, Issues, Pull Requests
The [exercism/xocaml](https://github.com/exercism/xocaml) repository on
GitHub is the home for all of the Ocaml exercises.

If you have feedback about an exercise, or want to help implementing a new
one, head over there and create an issue.  We'll do our best to help you!

## Use of `option`
The type signature of the `greet` function reads `string option -> string`. It
could be that this is your first time to encounter an Option type.

An option type is an explicit way to signal that a value could be missing for a
legitimate reason.

In OCaml Options types are implemented as
a [variant type](https://realworldocaml.org/v1/en/html/variants.html) something
like

```ocaml
type 'a option =
    | None
    | Some of 'a
```

In the case of `string option` you provide an argument using one of the
following snippets

1. `None` to signal that no subject is passed.
2. `Some("Alice")` to provide an actual subject.

Just like other variants types you can match on an option. The example below
demonstrates how this can be done. Here `x` is an `string option`.

```ocaml
match x with 
    | None           -> "no argument passed"
    | Some(argument) -> "argument passed"
```

## Source

This is an exercise to introduce users to using Exercism [http://en.wikipedia.org/wiki/%22Hello,_world!%22_program](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

