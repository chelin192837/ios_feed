
#include"c1.h"
typedef int ElemType;
#include"c2-1.h"
#include"bo2-1.cpp"

Status equal(ElemType c1,ElemType c2)
{
   //判断两个函数是否相等
    if(c1==c2)
    {
       return TRUE;    
    }else{
       return FALSE;
    }
   return 0;
}

void Union(SqList &La,SqList Lb)
{
   //将所有在线性表Lb中但不在La中的数据元素插入到La中
   ElemType e; 
   int La_len,Lb_len;
   int i;

   La_len = ListLength(La);
   Lb_len = ListLength(Lb);
   
   for(i=1;i<=Lb_len;i++)
   {
     GetElem(Lb,i,e);//取Lb中第i个元素赋值给e;
     if(!LocateElem(La,e,equal))
     {
       ListInsert(La,++La_len,e);
     }
   } 
}

void print(ElemType &c)
{
   printf("%d",c);
}

//以地址为指针域,以指针所指向的值为数据域,来模拟单链表;
int main()
{
   SqList La,Lb;
   Status i;
   int j;
   i=InitList(La);

   if(i==1)
   {
     for(j=1;j<=5;j++)
     {
      i=ListInsert(La,j,j);
     } 
   }
   printf("La=");//输出表La的内容
  //   ListTraverse(La,printf);
  ListPrintf(La);
   InitList(Lb);

   for(j=1;j<=5;j++)
   {
    i=ListInsert(Lb,j,j*2);
   }

   printf("Lb=");//输出表Lb的内容
  // ListTraverse(Lb,printf);
     ListPrintf(Lb);
   Union(La,Lb);

   printf("new La = ");//输出新表La的内容

  // ListTraverse(La,print); 
     ListPrintf(La);
  
     return 0;
}








    


