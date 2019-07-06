#include <stdio.h>
#include <stdbool.h>

#define WIDTH 13
#define HEIGHT 13

int next_state(int me, int other){
  if(other==3) return 1;
  else if(other==2) return me;
  else return 0;
}

int main(){
  int field[WIDTH][HEIGHT]={
    {0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,1,1,0,1,1,1,1,1,1,0,0},
    {0,0,1,1,0,1,1,1,1,1,1,0,0},
    {0,0,1,1,0,0,0,0,0,0,0,0,0},
    {0,0,1,1,0,0,0,0,0,1,1,0,0},
    {0,0,1,1,0,0,0,0,0,1,1,0,0},
    {0,0,1,1,0,0,0,0,0,1,1,0,0},
    {0,0,0,0,0,0,0,0,0,1,1,0,0},
    {0,0,1,1,1,1,1,1,0,1,1,0,0},
    {0,0,1,1,1,1,1,1,0,1,1,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0},
  };

  int copy[WIDTH][HEIGHT];

  for(;;){
    for(int i=0;i<WIDTH;i++){  //惑星のループ
      for(int j=0;j<HEIGHT;j++){
        int count=0;

        for(int x=-1;x<=1;x++){  //衛星のループ
          for(int y=-1;y<=1;y++){
            if(x!=0 || y!=0){
              if(i+x>=0 && i+x<=WIDTH-1 && j+y>=0 && j+y<=HEIGHT-1 ){
                if(field[i+x][j+y]>=1){
                  count+=1;
                }
              }
            }
          }
        }
        copy[i][j]=next_state(field[i][j],count);
        printf(copy[i][j]==0 ? "□" : "■");
      }
      printf("\n");
    }
    for(int i=0;i<WIDTH;i++){
      for(int j=0;j<HEIGHT;j++){
        field[i][j]=copy[i][j];
      }
    }
    getchar();

  }

}
