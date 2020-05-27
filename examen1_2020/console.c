void put_char(char ch);

void print_str(const char *message)
{
    // Loop through each char of the message and print it .
    const char *p = message;

    while (*p != '\0') {
        put_char(*p++);
    }
}

void print_number(int num)
{
    if (num == 0)
        put_char('0');
    else {
        char buffer[12]; // 12 elements should be enough for a 32-bit number
        char *p = &buffer[11];
        int quot, rem;
        int n = (num < 0)? -num : num;

        *p = '\0';
        while (n > 0) {
            int quot = n / 10;
            int rem = n % 10;
            p--;
            *p = rem + '0';
            n = quot;
        }

        print_str(p);
    }
}
