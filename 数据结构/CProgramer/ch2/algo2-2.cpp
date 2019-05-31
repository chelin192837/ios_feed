

#include"c1.h"
typedef int ElemType;
#include"c2-1.h"
#include"bo2-1.cpp"

void MergeList(SqList La,SqList Lb,SqList &Lc)
{
  int i=0,j=0,k=0;
  int La_length,Lb_length;
  
  La_length = ListLength(La);
  Lb_length = ListLength(Lb);
  
  ElemType ai;
  ElemType bj;
 while(i<La_length||j<Lb_length)
 {
   GetElem(La,i,ai);
   GetElem(Lb,j,bj);
   if(ai<bj)
   {
     ListInsert(Lc,k++,ai);
     i++;
   }else{
     ListInsert(Lc,k++,bj);
     j++;   
   }
 }

  while(i<La_length)
  { 
    GetElem(La,i,ai);
    ListInsert(Lc,k++,ai);
  }

  while(j<Lb_length)
  {
   GetElem(Lb,j,bj);
   ListInsert(Lc,k++,bj);
  }
 
  Lc.length = k;
}

int main()
{

  int a[4]={2,5,7,9};

  int b[5]={3,9,11,15,20};

  SqList La,Lb,Lc;
  
  InitList(La);
  
  InitList(Lb); 

  InitList(Lc);
 
for(int i=1;i<5;i++)
   ListInsert(La,i,a[i-1]);

for(int j=1;j<8;j++)
   ListInsert(Lb,j,b[j-1]);


 int e;
 for(int i=1;i<5;i++)
   {
   GetElem(La,i,e);
   printf("La--%d \n",e);    
  }

 MergeList(La,Lb,Lc);

   printf("\n Lc--%d",ListLength(Lc));


 ListPrintf(Lc);

}





















































