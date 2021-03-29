# Ancipital (1984) by Jeff Minter
<img src="http://www.the-commodore-zone.com/articlelive/content_images/cover_ancipital_minter.jpg" height=300><img src="http://www.simplygames.net/wp-content/uploads/2017/08/Anciptal-screenshot-1.png" height=300>


This is the reverse-engineered and [commented source code] for the 1986 Commodore 64 game Ancipital by Jeff Minter. Following the build instructions below you can compile and run Ancipital from scratch yourself on a Linux or Windows desktop. Ancipital was written in 6502 assembler so might be a challenge to read and understand, even for someone who is already familiar with low-level languages such as C. The objective of providing the commented code here is to allow an interested reader to understand the techniques Minter used when coding the game and gain some insight into the workings of 6502 assembler in a then-state-of-the-art Commodore 64 game. The place to start is the [overview of the code in the src directory](https://github.com/mwenge/ancipital/tree/master/src).

You can play Mama Llama in your browser at https://mwenge.github.io/ancipital/. (Ctrl key is 'Fire', Arrow Keys to move.)
You might find [the game's original manual](https://github.com/mwenge/ancipital/tree/master/src/OriginalGameManual.md) a useful read to try and figure out what on earth is going on!

## Current Status
The game compiles and plays. The routines in [the main game](https://github.com/mwenge/ancipital/tree/master/src/ancipital.asm) are all labelled. Character set data, sprite data, and mini-games have been separated out but noall of them are commented yet. Because there is so much character and sprite data, and because Ancipital contains two sub games, it was necessary to use a compressor ([Exomizer]) to produce the final binary. Interesting findings, some analysis of the game logic and an overview of the code's structure [can be found here](https://github.com/mwenge/ancipital/tree/master/src).


## Build Requirements
* [64tass][64tass], tested with v1.54, r1900
* [VICE][vice]
* [Exomizer][Exomizer]

[64tass]: http://tass64.sourceforge.net/
[vice]: http://vice-emu.sourceforge.net/
[https://gridrunner.xyz]: https://mwenge.github.io/gridrunner.xyz
[commented source code]:https://github.com/mwenge/ancipital/blob/master/src/
[DNA]:https://github.com/mwenge/ancipital/blob/master/demos/dna
[Torus]:https://github.com/mwenge/ancipital/blob/master/demos/torus
[Torus2]:https://github.com/mwenge/ancipital/blob/master/demos/torus2
[Iridis Spaceship]:https://github.com/mwenge/ancipital/blob/master/demos/iridis_spaceship
[Made in France]:https://github.com/mwenge/ancipital/blob/master/demos/mif
[Exomizer]:https://bitbucket.org/magli143/exomizer/wiki/Home

## Build Instructions
To compile and run it do:

```sh
$ make
```
The compiled game is written to the `bin` folder. 

To just compile the game and get a binary (`ancipital.prg`) do:

```sh
$ make ancipital.prg
```

