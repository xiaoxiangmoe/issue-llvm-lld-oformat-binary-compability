#!/bin/sh

CCFLAGS='-std=gnu2x -g0 -Os --target=x86_64-unknown-none-elf -march=x86-64 -ffreestanding -fomit-frame-pointer -fno-exceptions -fno-asynchronous-unwind-tables -fno-unwind-tables -Wall -Werror'
LDFLAGS='-static -nostdlib --nmagic --strip-debug --oformat=binary'
CC=clang
LD=ld.lld

DIST='./dist-lld-binary'

mkdir -p $DIST

$CC $CCFLAGS  -c ./src/boot.c -o $DIST/boot.o

$LD $LDFLAGS --Map=$DIST/boot.map --script=./src/linker.ld -o $DIST/boot.out $DIST/boot.o
cp $DIST/boot.out $DIST/boot.bin
