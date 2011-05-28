#!/usr/bin/env python

def max_crossing_subarray(a, low, mid, high):
    left_sum = float('-inf')
    max_left = None
    array_sum = []
    for i in range(mid, low - 1, -1):
        array_sum.append(a[i])
        if (array_sum == list(reversed(array_sum))
            and len(array_sum) > left_sum):
            left_sum = len(array_sum)
            max_left = i

    right_sum = float('-inf')
    max_right = None
    array_sum = []
    for i in range(mid + 1, high + 1):
        array_sum.append(a[i])
        if (array_sum == list(reversed(array_sum))
            and len(array_sum) > right_sum):
            right_sum = len(array_sum)
            max_right = i

    return (max_left, max_right, left_sum + right_sum)


def max_subarray(a, low, high):
    if high == low:
        return (low, high, a[low])
    else:
        mid = (high + low) / 2
        left_low, left_high, left_sum = max_subarray(a, low, mid)
        right_low, right_high, right_sum = max_subarray(a, mid + 1, high)
        cross_low, cross_high, cross_sum = max_crossing_subarray(a, low, mid, high)

        if left_sum >= right_sum and left_sum >= cross_sum:
            return (left_low, left_high, left_sum)
        elif right_sum >= left_sum and right_sum >= cross_sum:
            return (right_low, right_high, right_sum)
        else:
            return (cross_low, cross_high, cross_sum)

test_data =" FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth "
i, j, size = max_subarray(test_data, 0, len(test_data) - 1)
print test_data[i:j+1]
