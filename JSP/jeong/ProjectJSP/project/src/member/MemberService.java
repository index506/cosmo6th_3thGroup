package member;

public class MemberService {
	MemberDAO memberDAO;
	
	public MemberService(){
		memberDAO = new MemberDAO(); 
	}
	
	public void addMember(MemberVO memberVO) {
		memberDAO.insertMember(memberVO);
	}
}
