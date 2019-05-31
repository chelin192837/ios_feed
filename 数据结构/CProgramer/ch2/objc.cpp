

#include<stdio.h>

#include<stdlib.h>
typedef int ElemType;

#define LIST_INIT_SIZE 10

int main()
{
  int *p,*q;

  int k;
 
  int i=3,j=4;

//  p = (ElemType*)malloc(LIST_INIT_SIZE*sizeof(ElemType));

  p = &i;
 
  q = &j;

  for(k=0;k<5;k++)
   {
     int *t = p++;
     *t=k+100;
   }

    printf("p=%p \n *p=%d \n ",p,*p);
 for(k=0;k<5;k++)
     printf("p=%p \n *p=%d \n ",p++,*p++);
 
   


  
 // printf("p=%p \n *p=%d \n q=%p \n *q=%d \n",p,*p,q,*q);
  


 // printf("p = %p \n p+1=%p \n  *p = %d \n",p,p+1,*p);

   
 // printf("i的值为:%d\n ++i的值为:%d\n i++的值为:%d\n",i,++i,i++);

   //printf("i的值为:%d\n",i);

 // int n = ++i;

 // printf("++i 的值为:%d\n",n);

  
  return 0;
}
