#include <stdio.h>
#include <stdlib.h>

int main()
{
    int direction = 0;
    float conversion = 0.00;
    float imoney = 0.00;
    float omoney = 0.00;

    printf("Please input exchange rate.\n");
    scanf("%f", &conversion);
    getchar();

    printf("Are you converting from dollars to foreign currency (0) or foreign currency to dollars (1).\n");
    printf("Input either 0 or 1.\n");
    scanf("%d", &direction);
    if(direction != 0 && direction != 1) {
            printf("Invalid input.\n");
            return 1;
    }
    getchar();

    printf("Now input monetary amount to convert.\n");
    scanf("%f", &imoney);
    getchar();

    if(direction == 0) {
        omoney = imoney * conversion;
    } else if(direction == 1) {
        omoney = imoney / conversion;
    }
    printf("Converted value is %.2f", omoney);
    return 0;
}
