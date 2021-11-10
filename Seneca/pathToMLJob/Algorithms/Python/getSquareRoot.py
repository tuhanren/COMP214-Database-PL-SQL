def getSquareRoot(num, precision):
    """ Only for positive number """
     # TODO: find a start point
    b = num; c = 0; a = (b + c)/2

    # TODO: compare a**2 with num + precision or num - precision
    while (a**2 > (num + precision)) or (a**2 < (num - precision)):
        # reset the bounds
        if (a**2 > (num + precision)):
            # reset the larger bound
            b = a
        else:
            # reset the lower bound
            c = a 
        a = (b + c)/2
    return a

getSquareRoot(num = 5.5, precision = 0.00001)

