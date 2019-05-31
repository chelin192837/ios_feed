

#include"c1.h"
typedef int ElemType;
#include"c1-1.h"
#include"Bo1-1.cpp"

int main()
{
   Triplet T;
   ElemType m;
   Status i;

   i=InitTriplet(T,5,7,9);
  
   i=Get(T,2,m);

   if(i==OK)
   {
     printf("T[2]为%d,\nT的第2个值为:%d\n",T[2],m);
   }


   
  //   printf("调用初始化函数后,i=%d(1:成功) T的三个值为:%d,%d,%d \n",i,T[0],T[1],T[2]);

//   cout<<T[0]<<''<<T[1]<<''<<T[2]<<endl;

   return 0;
}
