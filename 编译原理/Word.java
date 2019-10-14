/***
 * �� 1605-3 20163432 ������
 * ����һ�������ʹ��̣�Դ����Ϊһ���ļ�����ȡ���ļ���ʶ����������ж�������ĵ��ʣ�
 * �����������֡���ʶ������������������������ࡣ����������������ʵ��ڲ����뼰���ʷ�������ֵ��
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
 
    // ����ؼ���
    private static List<String> KeyWords;
    // ���������
    private static List<String> Operators;
    // ������
    private static List<String> Boundarys;
 
    private static List<String> Spaces;
     static String str="";
        public static String  readFileByChars(String fileName) {
            File file = new File(fileName);
            Reader reader = null;
            
          
            try {
                //System.out.println("���ַ�Ϊ��λ��ȡ�ļ����ݣ�һ�ζ�����ַ���");
                // һ�ζ�����ַ�
                char[] tempchars = new char[300];
                int charread = 0;
                reader = new InputStreamReader(new FileInputStream(fileName));
                // �������ַ����ַ������У�charreadΪһ�ζ�ȡ�ַ���
               
                while ((charread = reader.read(tempchars)) != -1) {
                    // ͬ�����ε�r����ʾ
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
    // ��ʼ��
    static {
        // �ؼ������� --> �ؼ����б�
        String[] keywordArr = { "public", "private", "protected", "short",
                "int", "long", "char", "float", "double", "boolean", "static",
                "void", "for","while" ,"return","continue"};
        KeyWords = Arrays.asList(keywordArr);
 
        // ���������� --> �������б�
        String[] operatorArr = { "+", "-", "*", "/", "%", "=", ">", "<", "&" };
        Operators = Arrays.asList(operatorArr);
 
        // ������� --> ����б�
        String[] boundaryArr = { "" + '{', "" + '}', "" + '[', "" + ']',
                "" + '(', "" + ')', "" + ';' , "" + '.' };
        Boundarys = Arrays.asList(boundaryArr);
 
        // �ո��ַ����� --> �ո��ַ��б�
        String[] SpaceArr = { " ", "\t", "\n" };
        Spaces = Arrays.asList(SpaceArr);
    }
    static boolean isDelimiter = false;//�Ƿ��зָ���
 
    // �ַ�������
    static StringBuffer strb = new StringBuffer();
 
    public static void main(String[] args) {
        String inStr =  readFileByChars("C:\\Users\\Administrator\\workspace\\68465\\src\\Դ����.txt");
        //System.out.println("+++"+inStr);
        System.out.println("####################�򵥴ʷ�������#####################");
        for (char ch : inStr.toCharArray()) {
            match(ch);
        }
        
            
    }
 
    static void match(char ch) {
        // �ָ������
        StringBuffer bouStrb = new StringBuffer();
        // 1. �ж��ַ�����
        /**
         * (�ո�|������|���)����(�ؼ���|��ʶ��|����)�ķָ��
         * ������������(�ؼ���|��ʶ��|����)֮�䲻��ֱ������,���޷ָ��(�ո�|������|���)
         */
        // 1.0 �ո�,���ؿո�
        if (Spaces.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            
        }
        // 1.1. ������, ����"operator"
        if (Operators.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            bouStrb = new StringBuffer(ch + " �ǲ�����  �����ֱ���Ϊ4");
        }
        // 1.2 ���, ����"boundary"
        if (Boundarys.indexOf(ch + "") >= 0) {
            isDelimiter = true;
            bouStrb = new StringBuffer(ch + " �ǽ�� �����ֱ���Ϊ5");
        }
        // 2. ����Ƿָ����
        /**
         * �ж�strb���л����ַ����� 2.1 ���У�������ǲ��ǳ���(�ݲ����ܸ���) 2.1.1 ����, ����ַ���,
         * ����ʶ���ַ���Ϊconstant 2.1.2 ������, ����ڲ��ڹؼ��ֱ��У� 2.1.2.1 ����,
         * ����ַ���,����ʶ���ַ���Ϊkeyword 2.1.2.2 ������, ����ַ���,����ʶ���ַ���Ϊidentifier
         * 
         * ��ԭ������ʼ���ã����˳�
         */
        if (isDelimiter) {
            if (strb.length() > 0) {
                if (strb.charAt(0) >= '0' && strb.charAt(0) <= '9') {
                    System.out.println(strb + " �ǳ��� �����ֱ���Ϊ3");
 
                } else if (KeyWords.indexOf(strb.toString()) >= 0) {
                    System.out.println(strb + " �ǹؼ���  �����ֱ���Ϊ1");
                } else {
                    System.out.println(strb + "�Ǳ�ʶ��  �����ֱ���Ϊ2");
                }
            }
            if (bouStrb.length() > 0)
                System.out.println(bouStrb);
            strb.setLength(0);
            isDelimiter = false;
            return;
        }
 
        // 3. ���е��ò���˵���ַ����Ƿָ��,��Ѹ��ַ�׷�ӵ�strb�м���
        strb.append(ch);
 
    }
 
}