int fact(int num, int acc) {
    if (num < 1)
        return acc;
    else
        return fact(num - 1, num * acc);
}
