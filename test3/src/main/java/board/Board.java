package board;

public class Board {
	private int num;
	private String name;
	private String subject;
	private String content;
	private int pos;
	private int ref;
	private int depth;
	private String regdate;
	private int count;
	
	public Board() {

	}

	public Board(int num, String name, String subject, String content, int pos, int ref, int depth, String regdate,
			int count) {
		super();
		this.num = num;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.pos = pos;
		this.ref = ref;
		this.depth = depth;
		this.regdate = regdate;
		this.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPos() {
		return pos;
	}

	public void setPos(int pos) {
		this.pos = pos;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", name=" + name + ", subject=" + subject + ", content=" + content + ", pos=" + pos
				+ ", ref=" + ref + ", depth=" + depth + ", regdate=" + regdate + ", count=" + count + "]";
	}
	
	
	
}
