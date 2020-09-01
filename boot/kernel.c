void kernelmain(void* mbd, unsigned int mnum)
{
    if (mnum != 0x1BADB002)
    {
        log("Error: Invalid boot number!", 0x07);
    }
    else
    {
        log("Hello World", 0x07);
    }
}

void log(char* message, int color)
{
    char* mem = (char*)(0xb8000);
    while (*message != 0)
    {
        *mem = *message;
        mem++;
        message++;
        *mem = (char*)color;
        mem++;
    }
}
