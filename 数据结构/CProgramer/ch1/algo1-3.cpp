
#include<stdio.h>
#include<sys/timeb.h>

int main()
{
  int i,j,k;

  printf("请输入i j k :");

  scanf("%d%d%d",&i,&j,&k);

  int sum = i+j+k;

  printf("%d\n",sum);

  return 0;
}

