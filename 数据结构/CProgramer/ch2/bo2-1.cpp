//#include"c2-1.h"
Status InitList(SqList &L)
{
   //操作结构:构造一个空的顺序线性表
   L.elem = (ElemType*)malloc(LIST_INIT_SIZE*sizeof(ElemType));
   L.length=0;//空表长度为0;
   L.listsize=LIST_INIT_SIZE;//初始存储容量
  
   return OK;  
}

//销毁线性表
Status DestroyList(SqList &L)
{
  free(L.elem);
  L.elem=NULL;
  L.length=0;
  L.listsize=0;
  return OK;
}

//将L重置为空表
Status ClearList(SqList &L)
{
  L.length=0;
  return OK;
}

//判断线性表是否为空表
Status ListEmpty(SqList L)
{
  if(L.length==0)
  {
   return TRUE;
  }else{
   return FALSE;
  }
}

//返回L中数据元素个数
int ListLength(SqList L)
{
  return L.length;
}

//用e返回第i个数据元素的值
Status GetElem(SqList L,int i,ElemType &e)
{
    e = *(L.elem+i-1);
    return OK;
}

//返回L中第1个与e满足关系compare()的数据元素的位序
//compare()是数元素判定函数(满足为1,否则为0)
int LocateElem(SqList L,ElemType e,Status(*compare)(ElemType,ElemType))
{
   ElemType *p;
   int i=1;
   p=L.elem;
   
   while(i<=L.length&&!compare(*p++,e))
    ++i;
   
   if(i<=L.length)
     return i;
   else
     return 0;
}

//如果cur_e是L的数据元素,且不是第一个,则用pre_e返回它的前驱
//否则操作失败,pre_e无定义
Status PriorElem(SqList L,ElemType cur_e,ElemType &pre_e)
{
  int i=2;
  ElemType *p= L.elem+1;//获取线性表的基址
  while(i<=L.length&&*p!=cur_e)//循环获取cur_e的地址
 { 
    p++;
    i++;
 }

  if(i>L.length)//当线性表只有一个元素的时候它就没有直接前驱
   return INFEASIBLE;
 else
 {
   pre_e=*--p;//获取到cur_e的地址后,地址减1就获得了它的前一个地址,然后通过*取值
   return OK;
 }
  
}

//用next_e返回它的后继
Status NextElem(SqList L,ElemType cur_e,ElemType &next_e)
{

  int i=1;

  ElemType *p = L.elem ;

  while(i<L.length&&*p!=cur_e)
  {
    p++;
    i++;    
  }

 if(i==L.length)
  return INFEASIBLE;
 else
  {
   next_e = *++p;
   return OK;
  }
}

//在L中第i个位置插入新的元素e,L的长度加1
Status ListInsert(SqList &L,int i,ElemType e)
{
   //获取第i个位置的地址
   ElemType *newbase,*q,*p;
  
   if(i<1||i>L.length+1)
     return ERROR;

    if(L.length>=L.listsize)//当前存储空间已满,增加分配
    {
      newbase=(ElemType*)realloc(L.elem,(L.listsize+LISTINCREMENT)*sizeof(ElemType));
      L.elem = newbase;//新基址
      L.listsize+=LISTINCREMENT;//增加存储容量
    }
   
    q=L.elem+i-1;//q为插入位置
 
    for(p=L.elem+L.length-1;p>=q;--p)
      *(p+1)=*p;//插入位置以后的元素依次往右移
   
    *q=e;//插入e

    ++L.length;//表长加1
    
    return OK;
}

//删除L的第i个数据元素,并用e返回其值,L的长度减1;
Status ListDelete(SqList &L,int i,ElemType &e)
{
  ElemType *p,*q;
  
  if(i<1||i>L.length)
    return ERROR;

  q=L.elem+i-1;//得到第i个元素的地址

  for(++p;p<=q;++p)
    *(p-1)=*p;//删除位置以后的元素依次往左移
  
  L.length--;//表长减1;

  return OK;
   
}

//依次对L的每个数据元素调用函数vi()
Status ListTraverse(SqList L,void(*vi)(ElemType&))
{
   ElemType *p;
   int i;
   p=L.elem;
   for(i=0;i<=L.length;i++)
      vi(*p++);
  
   return OK;
}

Status ListPrintf(SqList L)
{
    ElemType *p;
    int i;
    p=L.elem;
   for(i=0;i<=L.length;i++)
     printf("%d \n",*(p++));
   
   printf("\n");
}












































