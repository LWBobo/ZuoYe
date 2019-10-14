/***
 * 信 1605-3 20163432 张运涛
 * 编制一个读单词过程，源程序为一个文件，读取该文件，识别出各个具有独立意义的单词，
 * 即基本保留字、标识符、常数、运算符、界符五大类。并依次输出各个单词的内部编码及单词符号自身值。
 */
 
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;


 
public class Word {
 
    static Scanner sc = new Scanner(System.in);
 
    // 保存关键字
    private static List<String> KeyWords;
    // 保存操作符
    private static List<String> Operators;
    // 保存界符
    private static List<String> Boundarys;
 
    private static List<String> Spaces;
     static String str="";
        public static String  readFileByChars(String fileName) {
            File file = new File(fileName);
            Reader reader = null;
            
          
            try {
                //System.out.println("以字符为单位读取文件内容，一次读多个字符：");
                // 一次读多个字符
                char[] tempchars = new char[300];
                int charread = 0;
                reader = new InputStreamReader(new FileInputStream(fileName));
                // 读入多个字符到字符数组中，charread为一次读取字符数
               
                while ((charread = reader.read(tempchars)) != -1) {
                    // 同样屏蔽掉r不显示
                    if ((charread == tempchars.length)
                            && (tempchars[tempchars.length - 1] != '~')) {
                        System.out.print(tempchars+"1");
                    } else {
                        for (int i = 0; i < charread; i++) {
                            if (tempchars[i] == '~') {
                                continue;
                            } else {
                                str+=tempchars[i];
                                //System.out.print(tempchars[i]);
                               
                            }
                        }
                        //System.out.println("str="+str);
                    }
                }
            } catch (Exception e1) {
                e1.printStackTrace();
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e1) {
                    }
                }
            }
            return str;
        }
    // 初始化
    static {
        // 关键字数组 --> 关键字列表
        String[] keywordArr = { "public", "private", "protected", "short",
                "int", "long", "char", "float", "double", "boolean", "static",
                "void", "for","while" ,"return","continue"};
        KeyWords = Arrays.asList(keywordArr);
 
        // 操作符数组 --> 操作符列表
        String[] operatorArr = { "+", "-", "*", "/", "%", "=", ">", "<", "&" };
        Operators = Arrays.asList(operatorArr);
 
        // 界符数组 --> 界符列表
        String[] boundaryArr = { "" + '{', "" + '}', "" + '[', "" + ']',
                "" + '(', "" + ')', "" + ';' , "" + '.' };
        Boundarys = Arrays.asList(boundaryArr);
 
        // 空格字符数组 --> 空格字符列表
        String[] SpaceArr = { " ", "\t", "\n" };
        Spaces = Arrays.asList(SpaceArr);
    }
    static boolean isDelimiter = false;//是否有分隔符
 
    // 字符串缓冲
    static StringBuffer strb = new StringBuffer();
 
    public static void main(String[] args) {
        String inStr =  readFileByChars("C:\\Users\\Administrator\\workspace\\68465\\src\\源程序.txt");
        //System.out.println("+++"+inStr);
        System.out.println("####################简单词法分析器#####################");
        for (char ch : inStr.toCharArray()) {
            match(ch);
        }
        
            
    }
 
    static void match(char ch) {
        // 分割符缓冲
        StringBuffer bouStrb = new StringBuffer();
        // 1. 判断字符类型
        /**
         * (空格|操作符|界符)都是(关键字|标识符|数字)的分割符
         * 即，任意两个(关键字|标识符|数字)之间不可直接相连,而无分割符(空格|操作符|界符)
         */
        // 1.0 空格,返回空格
        if (Spaces.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            
        }
        // 1.1. 操作符, 返回"operator"
        if (Operators.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            bouStrb = new StringBuffer(ch + " 是操作符  单词种别码为4");
        }
        // 1.2 界符, 返回"boundary"
        if (Boundarys.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            bouStrb = new StringBuffer(ch + " 是界符 单词种别码为5");
        }
        // 2. 如果是分割符，
        /**
         * 判断strb中有缓冲字符串， 2.1 若有，检查其是不是常数(暂不接受负数) 2.1.1 若是, 输出字符串,
         * 并标识该字符串为constant 2.1.2 若不是, 检查在不在关键字表中， 2.1.2.1 若在,
         * 输出字符串,并标识该字符串为keyword 2.1.2.2 若不在, 输出字符串,并标识该字符串为identifier
         * 
         * 还原变量初始设置，并退出
         */
        if (isDelimiter) {
            if (strb.length() > 0) {
                if (strb.charAt(0) >= '0' && strb.charAt(0) <= '9') {
                    System.out.println(strb + " 是常数 单词种别码为3");
 
                } else if (KeyWords.indexOf(strb.toString()) >= 0) {
                    System.out.println(strb + " 是关键字  单词种别码为1");
                } else {
                    System.out.println(strb + "是标识符  单词种别码为2");
                }
            }
            if (bouStrb.length() > 0)
                System.out.println(bouStrb);
            strb.setLength(0);
            isDelimiter = false;
            return;
        }
 
        // 3. 进行到该步，说明字符不是分割符,则把该字符追加到strb中即可
        strb.append(ch);
 
    }
 
}