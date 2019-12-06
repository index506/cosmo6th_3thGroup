package service;

import java.util.ArrayList;

import dao.LogDAO;
import dao.MemberDAO;
import dto.LogVO;
import dto.MemberVO;

public class MemberService {
	MemberDAO memberDAO;
	LogDAO logDAO;

	public MemberService() {
		memberDAO = new MemberDAO();
		logDAO = new LogDAO();
	}
	
	public ArrayList<LogVO> ListTestLog(String id,int tpage) {
		ArrayList<LogVO> testLogList = logDAO.selectTestListById(id, tpage);
		return testLogList;
	}
	
	public String pageNumber(String id,int tpage) {
		// TODO Auto-generated method stub
		return logDAO.pageNumber(id,tpage);
	}

	public void AddMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(memberVO);
	}

	public void ModifyMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(memberVO);
	}
}
