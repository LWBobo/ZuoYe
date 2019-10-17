#include <iostream>
#include <stack>
#include <math.h>
#include<windows.h>
#include<fstream>


using namespace std;
stack<char> s1;		//运算符栈
stack<char> s2;		//中间结果栈

bool Number(char ch)//判断是否为数字，是则返回true
{
    if (ch >= 48 && ch <= 57)
        return true;
    else
        return false;
}

void InPut(char*& str)//接收输入的中缀表达式的函数，并简单判断是否合法
{
    cout << "Please Enter What You Want To calculation:" << endl;
    cout << "姓名：刘文博  学号：201716040224  班级：软件1702" << endl ;
    fstream f("C:\\Users\\Administrator\\Documents\\Tencent Files\\1697668797\\FileRecv\\a.txt");
    string line;
//    getline(f, line);
    while(1)
    {
    //    str = (char *)line.c_str() ;
        cin >> str;
        if (Number(str[0]) || str[0] == '(')//中缀表达式的第一个必定是数字，如果不是，则非法
        {
            int count1 = 0;
            for(int i = 0 ; str[i] != '\0' ; i++ )
            {
                if(str[i] == '(')
                {
                    count1++;
                }else if(str[i] == ')')
                {
                    count1--;
                }
            }
            if(count1 != 0)
            {
                cout << "Illegal Input,Please Input Again:";
                delete[] str;
            }else{

                break;
            }

        }else{
                cout << "Illegal Input,Please Input Again:";
                delete[] str;
        }
    }
}

int GetPriority(char sy)//设置各个操作符的优先级
{
    switch (sy)
    {
    case '#':
        return 0;
    case '(':
        return 1;
    case '+':
    case '-':
        return 3;
    case '*':
    case '/':
        return 5;
    case ')':
        return 6;
    default:
        return -1;
    }
}


int f(const char str){
	int yxj;		//优先级
	switch(str){
		case '*':yxj=5;break;
		case '/':yxj=5;break;
		case '+':yxj=4;break;
		case '-':yxj=4;break;
	}
	return yxj;

}


void AddSpace(char*& arr)//给转成的后缀表达式的数字和符号添加空格，区分每个字符
{
    *arr = ' ';
    arr++;
}

char* GetBack()//获取后缀表达式的函数
{
    char* c = new char[30];
    char* back = new char[30];
    char* backend = back;
    InPut(c);
   //char c[100]="1+((2+3)*4)-5";
	int lenc=strlen(c);
	//读取字符串
	for(int i=0;i<lenc;i++){
		if(c[i]>='0'&&c[i]<='9'){		//如果是数字，直接压入s2
			s2.push(c[i]);
		}else if(c[i]=='+'||c[i]=='-'||c[i]=='*'||c[i]=='/'){	//如果是运算符
			while(true){
			if(s1.empty()||s1.top()=='('){		//s1为空 ，或者栈顶为(
				s1.push(c[i]);
				break;
			}else if(f(c[i])>f(s1.top())){		//当前运算符优先级大于s1栈顶运算符优先级
				s1.push(c[i]);
				break;
			}
			else{								//小于等于
				char cc=s1.top();
				s1.pop();
				s2.push(cc);
			}
		}
		}else{
		    if(c[i] == '#')
            {
                continue ;
            }
			if(c[i]=='('){			//直接读入
				s1.push(c[i]);
			}else{
				while(s1.top()!='('){
					char ccc=s1.top();
					s1.pop();
					s2.push(ccc);
				}
				s1.pop();
			}
		}
	}
        while(!s1.empty()){
                char cccc=s1.top();
                s2.push(cccc);
                s1.pop();
            }

	//while(!s2.empty()){	//结果是逆序的
	//	cout<<s2.top();
	//	s2.pop();
	//}
	while(!s2.empty()){
		char c=s2.top();
		s1.push(c);
		s2.pop();
	}
        string  ss;
    	while(!s1.empty()){
        ss += s1.top();
        ss += " ";
		s1.pop();
	}
	char *s = (char *) ss.c_str();

	return s;
}

double GetNumber(char*& arr)
{
    //因为输出为char*，所以可能两位数以上的数字被拆开，此函数为正确得到数字
    double sum[10] = { 0 }; int i = 0; double result = 0;
    while (*arr != ' ')
    {
        sum[i] = *arr-48;
        i++;
        arr++;
    }
    int k = i - 1;
    for (int j = 0; j < i; j++,k--)
    {
        result += (sum[j] * pow(10, k));
    }
    return result;
}

double Cauculate(char ch, double left, double right)//各个操作符对应的操作
{
    switch (ch)
    {
    case '+':
        return left + right;
    case '-':
        return left - right;
    case '*':
        return left * right;
    case '/':
        return left / right;
    default:
        return 0;
        break;
    }
}

double CountBack(char* back)
{
    stack<double> s;
    while (*back)
    {
        if (Number(*back))//遇到数字
        {
            s.push(GetNumber(back));//将正确的数字入栈
        }
        else if (*back == ' ')
        {
            back++;//遇到空格跳过
        }
        else
        {
            double a = s.top();

            s.pop();
            double b = s.top();
            s.pop();
            s.push(Cauculate(*back, b, a));//遇到符号时，取栈顶的第二个数和第一个数求解，并入栈
            back++;
        }
    }
    while (s.size() >= 2)//最终栈内存在的数大于2时，继续计算，直到只剩下一个数
    {
        double a = s.top();
        s.pop();
        double b = s.top();
        s.pop();
        s.push(Cauculate(*back, b, a));
    }
    //返回这个数字，既是最终结果
    return s.top();
}

void FunTest()
{
    cout << "The Result Is: " <<CountBack(GetBack()) << endl;
}

int main()
{
 //   FunTest();

    char * str = GetBack();
    cout << "str :"<< str << endl;
    cout << "*str :" <<*str << endl;
    double num = CountBack(str);
    cout << num << endl;
    system("pause");
    return 0;
}
