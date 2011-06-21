#!/usr/bin/env python
import re, sys

whitespace = re.compile(r'\s+')

with open(sys.argv[1]) as in_file:
    with open(sys.argv[2], 'wb') as out_file:
        for line in in_file:
            bin_nums = [bin(int(num, 16))[2:].zfill(8)
                        for num in whitespace.split(line.strip())]
            out_file.write(''.join(bin_nums))
