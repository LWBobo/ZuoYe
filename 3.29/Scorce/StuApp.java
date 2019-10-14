package test;

public class StuApp {
	private static Course[] courses=new Course[5];
	private static Student[] stus=new Student[10];
	private static Score[] scores=new Score[50];
	private static int coursesIndex=0;
	public static void addCourse(Course course) {
		if(coursesIndex>courses.length) {
			System.out.println("too many courses");
			return;
		}
		courses[coursesIndex++]=course;
	}
	private static int stusIndex=0;
	public static void addStu(Student stu) {
		if(stusIndex>stus.length) {
			System.out.println("too many Student");
			return;
		}
		stus[stusIndex++]=stu;
	}
	
	private static int scoreIndex=0;
//	public static void addScoreToStu(Student stu,String courseName,double grade) {
//		if(scoreIndex>scores.length) {
//			System.out.println("too many student");
//			return;
//		}
//		for(int i=0;i<=coursesIndex;i++) {
//			if(courses[i].name.equals(courseName)) {
//				scores[scoreIndex++]=new Score(stu,courses[i],grade);
//				break;
//			}
//		}
//	}
	public static void addScoreToCourse(Course course,long courseID,double grade) {
		if(scoreIndex>scores.length) {
			System.out.println("too many student");
			return;
		}
		for(int i=0;i<=coursesIndex;i++) {
			if(courses[i].id==(courseID)) {
				scores[scoreIndex++]=new Score(course,courses[i],grade);
				break;
			}
		}
	}
	
	public static void main(String[] args) {
		Course java=new Course(1,"java");
		addCourse(java);
		Course os=new Course(2,"os");
		addCourse(os);
		Course math=new Course(3,"math");
		addCourse(math);
		Student stua=new Student("张三",1L);
		addStu(stua);
		//addScoreToStu(stua,"java",86);
		addScoreToCourse(java,1,50.2);
		//addScoreToStu(stua,"math",89.5);
		addScoreToCourse(math,3,66.6);
		Student stub=new Student("李四",2L);
		addStu(stub);
		//addScoreToStu(stub,"os",100);
		addScoreToCourse(os,2,100);
		System.out.println("课程号\t\t课程名\t\t成绩");
		for(int i=0;i<scoreIndex;i++) {
			StringBuilder sb=new StringBuilder();
			sb.append(scores[i].course1.id).append("\t");
			for(int j=1;j<16-(scores[i].course1.name.getBytes()).length;j++)
				sb.append(" ");
			sb.append(scores[i].course1.name);
			for(int k=1;k<=16-(scores[i].course1.name.getBytes()).length;k++)
				sb.append(" ");
			sb.append(scores[i].grade);
			System.out.println(sb);
		}
	}

}
