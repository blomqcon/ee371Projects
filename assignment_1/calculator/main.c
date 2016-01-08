#include <stdio.h>
#include <stdlib.h>

//code does not handle the bad input of non numerical values. Behavior undefined.
int main()
{
    int direction = 0;
    float conversion = 0.00;
    float inMoney = 0.00;
    float outMoney = 0.00;

    //get exchange rate
    printf("This is a simple money conversion calculator.\n");
    printf("Please input exchange rate.\n");
    scanf("%f", &conversion);
    getchar();

    //if inputted exchange rate is 0.00, ask for input again
    while(conversion == 0) {
        printf("0 is not a valid exchange rate. Please input again.\n");
        scanf("%f", &conversion);
        getchar();
    }

    //ask dollars -> foreign currency or foreign currency -> dollars.
    printf("\nAre you converting from dollars to foreign currency (0) \n or foreign currency to dollars (1).\n");
    printf("Input either 0 or 1.\n");
    scanf("%d", &direction);
    while(direction != 0 && direction != 1) {
            printf("Invalid input.\n\n");
            printf("Are you converting from dollars to foreign currency (0) \n or foreign currency to dollars (1).\n");
            printf("Input either 0 or 1.\n");
            scanf("%d", &direction);
    }
    getchar();

    //get amount to convert
    printf("\nNow input monetary amount to convert.\n");
    scanf("%f", &inMoney);
    getchar();

    //calculate converted amount
    if(direction == 0) {
        outMoney = inMoney * conversion;
    } else if(direction == 1) {
        outMoney = inMoney / conversion;
    }
    printf("Converted value is %.2f", outMoney);
    return 0;
}
