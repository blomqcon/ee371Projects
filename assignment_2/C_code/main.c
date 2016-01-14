#include <stdio.h>
#include <stdlib.h>

int main()
{
   printf("Part 1: \n");
   part1();
   printf("\nPart 2: \n");
   part2();
}

part1() {
     //declare several variables
    int iOne = 1, iTwo = 2;
    float fOne = 1.1, fTwo = 2.2;
    char cOne = 'a', cTwo = 'b';

    //declare several pointers
    int *pInt;
    float *pFloat;
    char *pChar;

    //assign value to pointer.
    //print out value through pointer
    pInt = &iOne;
    printf("%d\n", *pInt);
    pInt = &iTwo;
    printf("%d\n", *pInt);

    pFloat = &fOne;
    printf("%f\n", *pFloat);
    pFloat = &fTwo;
    printf("%f\n", *pFloat);

    pChar = &cOne;
    printf("%c\n", *pChar);
    pChar = &cTwo;
    printf("%c\n", *pChar);
    return 0;
}

part2() {
    //declare variables
    int A = 22, B = 17, C = 6, D = 4, E = 9;
    int result;

    //declare pointers to the variables
    int *pA = &A, *pB = &B, *pC = &C, *pD = &D, *pE = &E;

    //calculate result
    result = ((*pA - *pB) * (*pC + *pD)) / *pE;
    printf("Value of result: %d\n", result);
}
