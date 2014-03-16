# sneak.vim :shoe:

Sneak is a minimalist, versatile Vim *motion* plugin that enables you to move to any location specified by two characters.
It works across **multiple lines**, with **operators** (including **repeat** `.`
and [**surround**][surround]), with [**keymaps**][keymaps], in **visual mode**,
and in **macros**. Many small details have been carefully considered to minimize
friction between *intent* and *action*.

The plugin chooses sane defaults, which are easily changed via `<Plug>` mappings
(see [`:help sneak`](doc/sneak.txt)).

**New Option:** Use Sneak as an elegant, streamlined alternative
to [EasyMotion](https://github.com/Lokaltog/vim-easymotion):

    let g:sneak#streak = 1

[keymaps]: http://vimdoc.sourceforge.net/htmldoc/mbyte.html#mbyte-keymap
[surround]: https://github.com/tpope/vim-surround
[count]: http://vimdoc.sourceforge.net/htmldoc/intro.html#[count]
[cleverf]: https://github.com/rhysd/clever-f.vim

### Usage (Default)

<a href="http://imgur.com/Jke0mIJ" title="Click to see a short demo"><img src="https://raw.github.com/justinmk/vim-sneak/fluff/assets/readme_diagram.png"></a>

Sneak is invoked with `s` followed by exactly two characters:

    s{char}{char}

* Press `sab` to **move the cursor** immediately to the next instance of the text "ab".
    * Additional matches, if any, are highlighted until the cursor is moved.
* Press `s` *or* `;` to go to the next match.
* Press `3s` *or* `3;` to skip to the third match from the current position.
* Press `ctrl-o` or ``` `` ``` to go back to the starting point.
    * This is a built-in Vim motion; Sneak adds to Vim's [jumplist](http://vimdoc.sourceforge.net/htmldoc/motion.html#jumplist)
      *only* on `s` invocation—not repeats—so you can 
      abandon a trail of `;` or `,` by a single `ctrl-o` or ``` `` ```.
* Press `s<Enter>` at any time to repeat the last Sneak-search.
* Press `S` to search backwards.

Sneak can be **scoped** to a column of width 2×[number] by prefixing `s`
with a number.

* Press `5sxy` to go immediately to the next instance of "xy" within 5 columns
  of the cursor.
    * A highlight block indicates the vertical scope.

Sneak is invoked with [**operators**](http://vimdoc.sourceforge.net/htmldoc/motion.html#operator)
via `z` (because `s` is taken by surround.vim).

* Press `3dzqt` to delete up to the *third* instance of "qt".
    * Press `.` to repeat the `3dzqt` operation.
    * Press `2.` to repeat twice.
    * Press `d;` to delete up to the next match.
    * Press `4d;` to delete up to the *fourth* next match.
* Press `ysz))]` to surround in brackets up to `))`.
    * Press `s` *or* `;` to go to the next `))`.
* Press `gUz\}` to upper-case the text from the cursor until the next instance
  of the literal text `\}`
    * Press `.` to repeat the `gUz\}` operation.

### Motivation

    l  f  t  %  'm  }  ]m  ]]  M  L     /
                                     ^
                                     |
                                   sneak

Vim's built-in motions cover many special cases, but it's not always easy to move across 
several lines to an arbitrary position: the `f` motion is restricted to 
the current line, and the `/` search is [clunky](#faq) for medium-distance 
motion.

Here's how Sneak differs from Vim's built-in `/` search and other plugins:

  - minimum of **3 keystrokes**
  - Sneak supports [multibyte language keymaps](http://vimdoc.sourceforge.net/htmldoc/mbyte.html#mbyte-keymap)!
    ([#47](https://github.com/justinmk/vim-sneak/issues/47))
  - move anywhere, even offscreen
  - jump immediately to first match
  - jump back to the point of `s` invocation via `ctrl-o` or ``` `` ```
    - only the *initial* invocation adds to the jumplist, not repeat-motion
  - repeat the motion
  - does not break default behavior of `f t F T ; ,`
  - does not add noise to `/` history
  - *vertical scope* with `[count]s{char}{char}` restricts the search to 2× `count` size
  - always literal: `s\*` jumps to the literal `\*`

### Installation

To install Sneak manually, just place the files directly in your `.vim` directory 
(`_vimfiles` on Windows).

Or, use a plugin manager:

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `cd ~/.vim/bundle && git clone git://github.com/justinmk/vim-sneak.git`
- [Vundle](https://github.com/gmarik/vundle)
  1. Add `Bundle 'justinmk/vim-sneak'` to .vimrc
  2. Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  1. Add `NeoBundle 'justinmk/vim-sneak'` to .vimrc
  2. Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'justinmk/vim-sneak'` to .vimrc
  2. Run `:PlugInstall`

If you want to be able to repeat Sneak *operations* (like `dzab`) with dot `.`,
then [repeat.vim](https://github.com/tpope/vim-repeat) is required. However, to repeat 
Sneak *motions* via `;` and `,` you don't need to install anything except Sneak.

### FAQ

#### Why not use `/`?

* `/ab<cr>` requires 33% more keystrokes than `sab`
  * `f` and `t` exist for a similar reason
  * common operations should use as few keystrokes as possible
* Sneak doesn't clutter your search history
* Sneak is always literal (no need to escape special characters)
* Sneak has smarter, subtler highlighting

This is why Vim has [motions](http://vimdoc.sourceforge.net/htmldoc/motion.html#left-right-motions).

#### Why not use `f`?

* Sneak is fifty times (50×) *more precise* than `f` or `t`
* Sneak moves vertically
* Sneak remembers the initial position in the Vim jumplist
  * This allows you to explore a trail of matches via `;`,
    then return to the initial position via `ctrl-o` or ``` `` ```
* Sneak highlights matches *only in the direction of your search* 

#### How dare you remap `s`?

You can specify any mapping for Sneak (see [`:help sneak`](doc/sneak.txt)).

#### How can I replace `f` with Sneak?

```
    nmap f <Plug>Sneak_s
    nmap F <Plug>Sneak_S
    xmap f <Plug>Sneak_s
    xmap F <Plug>Sneak_S
    omap f <Plug>Sneak_s
    omap F <Plug>Sneak_S
```

#### How can I replace `f` and/or `t` with *one-character* Sneak?

Sneak provides `<Plug>` convenience-mappings for "inclusive" (`f`)
and "exclusive" (`t`) 1-character-sneak.
These mappings do *not* invoke streak-mode, even if you have it enabled.
```
    "replace 'f' with inclusive 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with exclusive 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T
```

#### I want to use an "f-enhancement" plugin simultaneously with Sneak

Sneak is intended to replace the so-called [f-enhancement plugins](#related).
You can use both, but Sneak won't be able to "hook" into `f`, which means
`;` and `,` will always repeat the last Sneak.

### Related
* [Seek](https://github.com/goldfeld/vim-seek)
* [EasyMotion](https://github.com/Lokaltog/vim-easymotion)
* [smalls](https://github.com/t9md/vim-smalls)
* [improvedft](https://github.com/chrisbra/improvedft)
* [clever-f](https://github.com/rhysd/clever-f.vim)
* [vim-extended-ft](https://github.com/svermeulen/vim-extended-ft)
* [Fanf,ingTastic; ](https://github.com/dahu/vim-fanfingtastic)

### Bugs

Sneak is built to be well-behaved and annoyance-free. If you find a bug,
please report it, and perhaps include the output of:

    :call sneak#debug#report()

Sneak is tested on a 10-MB, 400k-lines, syntax-highlighted file with 
Vim 7.2.330, 7.3, 7.4.

### License

Copyright © Justin M. Keyes. Distributed under the MIT license.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/justinmk/vim-sneak/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

