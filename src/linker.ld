ENTRY(main);
SECTIONS
{
    . = 0x7C00;
    .text : AT(0x7C00)
    {
        *(__start);
        _text = .;
        *(.text);
        _text_end = .;
    }
    .sig : AT(0x7DFE)
    {
        SHORT(0xaa55);
    }
} 