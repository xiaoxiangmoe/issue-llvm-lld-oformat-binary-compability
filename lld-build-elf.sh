#!/bin/sh

CCFLAGS='-std=gnu2x -g0 -Os --target=x86_64-unknown-none-elf -march=x86-64 -ffreestanding -fomit-frame-pointer -fno-exceptions -fno-asynchronous-unwind-tables -fno-unwind-tables -Wall -Werror'
LDFLAGS='-static -nostdlib --nmagic --strip-debug'
CC=clang
LD=ld.lld

DIST='./dist-lld-elf'

mkdir -p $DIST

$CC $CCFLAGS  -c ./src/boot.c -o $DIST/boot.o

$LD $LDFLAGS --Map=$DIST/boot.map --script=./src/linker.ld -o $DIST/boot.out $DIST/boot.o
llvm-objcopy --binary-architecture=x86-64 --strip-all -O binary $DIST/boot.out $DIST/boot.bin
