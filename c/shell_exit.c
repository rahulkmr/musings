char code[] = "\xb0\x01\x31\xdb\xcd\x80";

int main(int argc, const char *argv[])
{
    int (*func)();
    func = (int (*)())code;
    (int)(*func)();
    return 0;
}
