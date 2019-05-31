
//抽象数据类型Triplet和ElemType的基本操作8个

//初始化构造三元组
Status InitTriplet(Triplet &T,ElemType v1,ElemType v2,ElemType v3)
{
   if(!(T=(ElemType*)malloc(3*sizeof(ElemType))))
    {
     exit(OVERFLOW);
    }

   T[0]=v1,T[1]=v2,T[2]=v3;
   
   return OK;
}

//销毁三元组
Status DestroyTriplet(Triplet &T)
{
   free(T);
   T=NULL;
   return OK;
}

//用e返回第i个元素的值
Status Get(Triplet T,int i,ElemType &e)
{
  if(i<1||i>3)
  {
    return ERROR;
  }

  e=T[i-1];

  return OK;
}

//设置T中第i个元素为e
Status Put(Triplet T,int i,ElemType e)
{
   if(i<1||i>3)
   {
     return ERROR;
   }
   T[i-1]=e;
   return OK;
}

//是否是升序排列
Status IsAscending(Triplet T)
{
   return (T[0]<=T[1]&&T[1]<T[2]);
}

//是否是降序排列
Status IsDescending(Triplet T)
{
  return (T[0]>=T[1]&&T[1]>=T[2]);
}

Status Max(Triplet T,ElemType &e)
{
   e=T[0]>=T[1]?T[0]>=T[2]?T[0]:T[2]:T[1]>=T[2]?T[1]:T[2];
  
  return OK;
}

Status Min(Triplet T,ElemType &e)
{
   e=T[0]<=T[1]?T[0]<T[2]?T[0]:T[2]:T[1]<=T[2]?T[1]:T[2];

   return OK;
}































