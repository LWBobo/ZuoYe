#include <iostream>
#include <stack>
#include <math.h>
#include<windows.h>
#include<fstream>


using namespace std;
stack<char> s1;		//�����ջ
stack<char> s2;		//�м���ջ

bool Number(char ch)//�ж��Ƿ�Ϊ���֣����򷵻�true
{
    if (ch >= 48 && ch <= 57)
        return true;
    else
        return false;
}

void InPut(char*& str)//�����������׺���ʽ�ĺ����������ж��Ƿ�Ϸ�
{
    cout << "Please Enter What You Want To calculation:" << endl;
    cout << "���������Ĳ�  ѧ�ţ�201716040224  �༶�����1702" << endl ;
    fstream f("C:\\Users\\Administrator\\Documents\\Tencent Files\\1697668797\\FileRecv\\a.txt");
    string line;
//    getline(f, line);
    while(1)
    {
    //    str = (char *)line.c_str() ;
        cin >> str;
        if (Number(str[0]) || str[0] == '(')//��׺���ʽ�ĵ�һ���ض������֣�������ǣ���Ƿ�
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

int GetPriority(char sy)//���ø��������������ȼ�
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
	int yxj;		//���ȼ�
	switch(str){
		case '*':yxj=5;break;
		case '/':yxj=5;break;
		case '+':yxj=4;break;
		case '-':yxj=4;break;
	}
	return yxj;

}


void AddSpace(char*& arr)//��ת�ɵĺ�׺���ʽ�����ֺͷ�����ӿո�����ÿ���ַ�
{
    *arr = ' ';
    arr++;
}

char* GetBack()//��ȡ��׺���ʽ�ĺ���
{
    char* c = new char[30];
    char* back = new char[30];
    char* backend = back;
    InPut(c);
   //char c[100]="1+((2+3)*4)-5";
	int lenc=strlen(c);
	//��ȡ�ַ���
	for(int i=0;i<lenc;i++){
		if(c[i]>='0'&&c[i]<='9'){		//��������֣�ֱ��ѹ��s2
			s2.push(c[i]);
		}else if(c[i]=='+'||c[i]=='-'||c[i]=='*'||c[i]=='/'){	//����������
			while(true){
			if(s1.empty()||s1.top()=='('){		//s1Ϊ�� ������ջ��Ϊ(
				s1.push(c[i]);
				break;
			}else if(f(c[i])>f(s1.top())){		//��ǰ��������ȼ�����s1ջ����������ȼ�
				s1.push(c[i]);
				break;
			}
			else{								//С�ڵ���
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
			if(c[i]=='('){			//ֱ�Ӷ���
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

	//while(!s2.empty()){	//����������
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
    //��Ϊ���Ϊchar*�����Կ�����λ�����ϵ����ֱ��𿪣��˺���Ϊ��ȷ�õ�����
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

double Cauculate(char ch, double left, double right)//������������Ӧ�Ĳ���
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
        if (Number(*back))//��������
        {
            s.push(GetNumber(back));//����ȷ��������ջ
        }
        else if (*back == ' ')
        {
            back++;//�����ո�����
        }
        else
        {
            double a = s.top();

            s.pop();
            double b = s.top();
            s.pop();
            s.push(Cauculate(*back, b, a));//��������ʱ��ȡջ���ĵڶ������͵�һ������⣬����ջ
            back++;
        }
    }
    while (s.size() >= 2)//����ջ�ڴ��ڵ�������2ʱ���������㣬ֱ��ֻʣ��һ����
    {
        double a = s.top();
        s.pop();
        double b = s.top();
        s.pop();
        s.push(Cauculate(*back, b, a));
    }
    //����������֣��������ս��
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
