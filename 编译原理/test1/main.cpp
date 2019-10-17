#include<iostream>
#include<cstring>
#include<algorithm>
#include<stack>
using namespace std;

stack<char> s1;		//运算符栈
stack<char> s2;		//中间结果栈

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
    void test(){
        char c[100]="3+5-3+5*2";
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
    	while(!s1.empty()){
		cout<<s1.top();
		s1.pop();
	}

    }

int main(){

    test();
	return 0;
}
