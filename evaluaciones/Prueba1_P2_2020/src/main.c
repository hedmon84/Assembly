void do_delay()
{
    for (volatile int i = 0; i < 10000; i++)
    {
    }
}

int main()
{

    volatile unsigned short *p = (unsigned short *)0xb800;

    int i = 0;
    int rw = 0;
    int rd = 81;

    while (i != 2350)
    {

        *(p + rw) = 0x1f00 | ' ';

        rw = rw + rd;
        *(p + rw) = 0x1f00 | '0';

        i++;
        do_delay();
    }

    return 0;
}
