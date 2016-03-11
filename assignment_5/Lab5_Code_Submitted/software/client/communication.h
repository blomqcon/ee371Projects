#ifndef COMMUNICATION_H_
#define COMMUNICATION_H_

//void setup_interrupt(void* context);
void setup_interrupt();

char readBuffer();
void writeBuffer(char c);

#endif /* COMMUNICATION_H_ */
