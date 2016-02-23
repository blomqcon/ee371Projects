#include <stdio.h>
#include <stdlib.h>

#define BUFFER_SIZE 50

char readBuffer(char** pTransmit, char* pBufferHead, char* pBuffer) {
    //printf("%c %c %i\n", **pTransmit, 0xC8, **pTransmit == 0xC8);
    if(**pTransmit == 0x60 || **pTransmit == '\0') {
        return '\0';
    } else {
        char c = **pTransmit;
        **pTransmit = 0x60;

        if((*pTransmit - pBuffer) == (BUFFER_SIZE - 1)) {
            *pTransmit = pBuffer;
        } else {
            *pTransmit = *pTransmit + sizeof(char);
        }
        return c;
    }
}

void writeBuffer(char c, char** pBufferHead, char** pBuffer) {
    if(!(**pBufferHead == 0x60 || **pBufferHead == '\0')) return;

    *(*pBufferHead) = c;
    if((*pBufferHead - *pBuffer) == (BUFFER_SIZE - 1)) {
        *pBufferHead = *pBuffer;
    } else {
        *pBufferHead = *pBufferHead + sizeof(char);
    }

}

int main() {
    char *pBuffer = calloc(BUFFER_SIZE, sizeof(char));

    char* pBufferHead = pBuffer;
    char* pTransmit = pBuffer;

    writeBuffer('A', &pBufferHead, &pBuffer);
    writeBuffer('B', &pBufferHead, &pBuffer);
    writeBuffer('C', &pBufferHead, &pBuffer);
    writeBuffer('D', &pBufferHead, &pBuffer);
    printf("%s\n", pBuffer);

    printf("%c\n", readBuffer(&pTransmit, pBufferHead, pBuffer));
    printf("%c\n", readBuffer(&pTransmit, pBufferHead, pBuffer));
    printf("%c\n", readBuffer(&pTransmit, pBufferHead, pBuffer));
    printf("%c\n", readBuffer(&pTransmit, pBufferHead, pBuffer));

    printf("\n%s\n", pBuffer);

    return 0;
}
