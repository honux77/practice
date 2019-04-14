#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define TURN 10

typedef struct {
	int ans[3];
	int strike;
	int ball;
} player;

void generateRandomAns(int arr[]) {
	arr[0] = arr[1] = arr[2] = 0;
	while (arr[0] == arr[1] || arr[1] == arr[2]) {
		arr[0] = rand() % 9 + 1;
		arr[1] = rand() % 9 + 1;
		arr[2] = rand() % 9 + 1;
	}	
}

player *init() {
	player *p = (player *) malloc(sizeof(player));
	p->strike = p->ball = 0;
	generateRandomAns(p->ans);	
	return p;
}

//guessing game
//if s = 3 you win
int nextTurn(player *p, int *gcount) {
	(*gcount)++;
	printf("Turn %d / %d\n", *gcount, TURN);
	printf("Input guessing number. ex) 123 :\n");
	//TODO 
	//implement this


	if (p->strike == 3) {
		return 1;
	}
	return 0;
}

void endGame(player *p) {
	int *ans = p->ans;
	printf("You lost! Answer is %d%d%d\n", ans[0], ans[1], ans[2]);
}
int main(void)
{
	//init random
	srand((unsigned int)time(NULL));   
	player *pc = init();	
	int gcount = 0;
	while (gcount < TURN) {
		int ret = nextTurn(pc, &gcount);
		if (ret) {
			printf("You made the day! score is: %d\n", gcount);
			break;
		}
	}
	endGame(pc);	
	return 0;
}