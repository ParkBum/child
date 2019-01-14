package logic;

public class Daycare_total {

	private double teacher_avg; //서울시 어린이집 교사 평균 수
	private double maxchild_avg;//서울시 어린이집 정원 평균 수
	private double nowchild_avg;//서울시 어린이집 현원 평균 수
	private double score_avg;//서울시 어린이집 후기 평균
	private double child_per_teacher;//서울시 어린이집 교사 1명당 평균 담당 영아 수
	public double getTeacher_avg() {
		return teacher_avg;
	}
	public void setTeacher_avg(double teacher_avg) {
		this.teacher_avg = teacher_avg;
	}
	public double getMaxchild_avg() {
		return maxchild_avg;
	}
	public void setMaxchild_avg(double maxchild_avg) {
		this.maxchild_avg = maxchild_avg;
	}
	public double getNowchild_avg() {
		return nowchild_avg;
	}
	public void setNowchild_avg(double nowchild_avg) {
		this.nowchild_avg = nowchild_avg;
	}
	public double getScore_avg() {
		return score_avg;
	}
	public void setScore_avg(double score_avg) {
		this.score_avg = score_avg;
	}
	public double getChild_per_teacher() {
		return child_per_teacher;
	}
	public void setChild_per_teacher(double child_per_teacher) {
		this.child_per_teacher = child_per_teacher;
	} 
	
	
}
