
void sram_malloc_test() {
    resetSRAM();
    int test1 =  sram_malloc(1);
    int test2 =  sram_malloc(8);
    int test3 =  sram_malloc(17);
    int test4 =  sram_malloc(800);
    int test5 =  sram_malloc(255);
    int test6 =  sram_malloc(255);
    int test7 =  sram_malloc(255);
    int test8 =  sram_malloc(190);
    int test9 =  sram_malloc(255);
    int test10 =  sram_malloc(5);
    printf("%i\n", test1);
    printf("%i\n", test2);
    printf("%i\n", test3);
    printf("%i\n", test4);
    printf("%i\n", test5);
    printf("%i\n", test6);
    printf("%i\n", test7);
    printf("%i\n", test8);
    printf("%i\n", test9);
    printf("%i\n", test10);
}

void sram_free_test() {
    resetSRAM();
    int test1 = sram_malloc(1000);
    int test2 = sram_malloc(700);

    int test3 = sram_malloc(40);
    int test4 = sram_malloc(40);
    int test5 = sram_malloc(24);
    int test6 = sram_malloc(24);
    sram_free(test5);
    int test7 = sram_malloc(24);
    sram_free(test6);
    sram_free(test4);
    int test8 = sram_malloc(64);
    sram_free(test7);
    int test9 = sram_malloc(64);

    printf("%i\n", test1);
    printf("%i\n", test2);
    printf("%i\n", test3);
    printf("%i\n", test4);
    printf("%i\n", test5);
    printf("%i\n", test6);
    printf("%i\n", test7);
    printf("%i\n", test8);
    printf("%i\n", test9);
}
