#include "sram.h"
#include "data_structures_constants.h"

struct Alien getAlien(int pSramAliens, int x, int y) {
    struct Alien a;
    a.alive = sram[(pSramAliens + 0) + (sizeof(struct Alien) * ((x * 8) + y))];
    a.type = sram[(pSramAliens + 1) + (sizeof(struct Alien) * ((x * 8) + y))];
    a.rowId = sram[(pSramAliens + 2) + (sizeof(struct Alien) * ((x * 8) + y))];
    return a;
}

void setAlien(int pSramAliens, int x, int y, struct Alien a) {
    sram[(pSramAliens + 0) + (sizeof(struct Alien) * ((x * 8) + y))] = a.alive;
    sram[(pSramAliens + 1) + (sizeof(struct Alien) * ((x * 8) + y))] = a.type;
    sram[(pSramAliens + 2) + (sizeof(struct Alien) * ((x * 8) + y))] = a.rowId;
}

void resetSRAM() {
    int i;
    for (i = 0; i < 2048; i++ ) {
      sram[i] = 0;
   }
}

/*  Fixed Block Size Dynamic Memory Allocation
    Implimented with a free list  */
int sram_malloc(int s) {
    if(s == 0) {
        return -1;
    }

    int HEAP_SIZE = 2048;
    int FREE_LIST_OVERHEAD = 1;// if byte is zero its not taken, else its how much is taken.
    int BLOCK_SIZE = 8;//8 Byte Blocks
    int TOTAL_BLOCKS = HEAP_SIZE / (BLOCK_SIZE + FREE_LIST_OVERHEAD);
    int FREE_LIST_END = (TOTAL_BLOCKS * FREE_LIST_OVERHEAD);

    int blocksNeeded = ((s - 1) / BLOCK_SIZE) + 1;

    int currBlock = 0;
    int foundBlocks = 0;
    int startFoundBlocks = 0;
    while((foundBlocks < blocksNeeded) && (currBlock < FREE_LIST_END)) {
        if(sram[currBlock] == 0) {//curr block is free
            foundBlocks++;
            currBlock++;
        } else {//curr block is allocated
            foundBlocks = 0;
            startFoundBlocks = currBlock + sram[currBlock];
            currBlock += sram[currBlock];
        }
    }

    /*printf("Blocks Needed: %i\n", blocksNeeded);
    printf("Total Blocks: %i\n", TOTAL_BLOCKS);
    printf("Free List End: %i\n", FREE_LIST_END);
    printf("Start Found Blocks: %i\n\n", startFoundBlocks);*/

    if(currBlock == FREE_LIST_END) {
        return -1;//Out of memory, or heap fragmented
    } else {
        sram[startFoundBlocks] = blocksNeeded;
        return FREE_LIST_END + (startFoundBlocks * (BLOCK_SIZE));
    }
}

int sram_free(int loc) {
    int HEAP_SIZE = 2048;
    int FREE_LIST_OVERHEAD = 1;// if byte is zero its not taken, else its how much is taken.
    int BLOCK_SIZE = 8;//8 Byte Blocks
    int TOTAL_BLOCKS = HEAP_SIZE / (BLOCK_SIZE + FREE_LIST_OVERHEAD);
    int FREE_LIST_END = (TOTAL_BLOCKS * FREE_LIST_OVERHEAD);

    int freeListLoc = (loc - FREE_LIST_END) / (BLOCK_SIZE);

    //printf("Free List Location: %i\n", freeListLoc);

    sram[freeListLoc] = 0;
    return freeListLoc;

}
