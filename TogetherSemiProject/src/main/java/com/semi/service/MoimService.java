package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.MoimDto;
import com.semi.dto.MoimMemberDto;
import com.semi.dto.MoimScheduleDto;
import com.semi.dto.ScheduleJoinDto;
import com.semi.mapper.MoimMapper;

@Service
public class MoimService implements MoimServiceInter {
   
   @Autowired
   private MoimMapper moimMapper;
   
   @Override
   public int getMaxNum() {
      // TODO Auto-generated method stub
      return moimMapper.getMaxNum();
   }

   @Override
   public int getTotalCount(String category, String city1, String city2) {
      // TODO Auto-generated method stub
      return moimMapper.getTotalCount(category, city1, city2);
   }

   @Override
   public void insertMoim(MoimDto dto) {
      // TODO Auto-generated method stub
      moimMapper.insertMoim(dto);
   }
   
   @Override
   public void insertMoimMember(MoimMemberDto mdto) {
      // TODO Auto-generated method stub
      moimMapper.insertMoimMember(mdto);
   }

   @Override
   public List<MoimDto> getPagingList(int start, int perpage, String category, String city1, String city2, String sort) {
      // TODO Auto-generated method stub
      Map<String, Object> map=new HashMap<>();
      map.put("start", start);
      map.put("perpage", perpage);
      map.put("category", category);
      map.put("city1", city1);
      map.put("city2", city2);
      map.put("sort", sort);
      return moimMapper.getPagingList(map);
   }
  
   @Override
   public void updateJjimcount(int mnum, int unum) {
      // TODO Auto-generated method stub
      Map<String, Integer>map = new HashMap<>();
      map.put("mnum", mnum);
      map.put("unum", unum);
      
      moimMapper.updateJjimcount(map);
   }

   @Override
   public MoimDto getData(int mnum) {
      // TODO Auto-generated method stub
      return moimMapper.getData(mnum);
   }

   @Override
   public void deleteMoim(int mnum) {
	// TODO Auto-generated method stub
	   moimMapper.deleteMoim(mnum);
	   }

   @Override
   public void updateMoim(MoimDto dto) {
      // TODO Auto-generated method stub
      moimMapper.updateMoim(dto);
   }

   @Override
   public int overlappedMname(MoimDto dto) {
      return moimMapper.overlappedMname(dto);
   }

   @Override
   public boolean pressJjim(int unum, int mnum) {
   
      Map<String, Object> map = new HashMap<>();
      map.put("mnum", mnum);
      map.put("unum", unum);
      
      boolean pressChk = moimMapper.pressJjim(map)==0?false:true;
      return pressChk;
   }

   @Override
   public void deleteJjim(int unum, int mnum) {
      
      Map<String, Object> map = new HashMap<>();
      map.put("mnum", mnum);
      map.put("unum", unum);
      
      moimMapper.deleteJjim(map);
      
   }

   @Override
   public void moimGaip(int unum, String mname) {
      
      Map<String, Object> map = new HashMap<>();
      map.put("mname", mname);
      map.put("unum", unum);
      
      moimMapper.moimGaip(map);
      
   }

   @Override
   public void deleteGaip(int unum, String mname) {
      Map<String, Object> map = new HashMap<>();
      map.put("mname", mname);
      map.put("unum", unum);
      
      moimMapper.deleteGaip(map);
      
   }

   @Override
   public boolean pressGaip(int unum, String mname) {
      Map<String, Object> map = new HashMap<>();
      map.put("mname", mname);
      map.put("unum", unum);
      
      boolean pressGaipChk = moimMapper.pressGaip(map)==0?false:true;
      return pressGaipChk;
   }
   
   @Override
   public List<Map<String, Object>> getGaipmemberList(String mname) {
      
      return moimMapper.getGaipmemberList(mname);

   }

	@Override
	public void acceptGaip(int unum, String mname) {
		 Map<String, Object> map = new HashMap<>();
	     map.put("mname", mname);
	     map.put("unum", unum);
	     System.out.println(map);
	     
	     moimMapper.acceptGaip(map);
		
	}
	
	@Override
	public void deniedGaip(int unum, String mname) {
		 Map<String, Object> map = new HashMap<>();
	     map.put("mname", mname);
	     map.put("unum", unum);
	     
	     moimMapper.deleteGaip(map);
		
	}
	
	@Override
	public void insertMoimSchedule(MoimScheduleDto msdto) {
		// TODO Auto-generated method stub
		moimMapper.insertMoimSchedule(msdto);
	}

	@Override
	public Integer acceptChk(int unum, String mname) {
		 Map<String, Object> map = new HashMap<>();
	     map.put("mname", mname);
	     map.put("unum", unum);
	     
		return moimMapper.acceptChk(map);
	}
	
	@Override
	public void changeMm(String hiddenname, String Mmname) {
		Map<String, Object> map = new HashMap<>();
		map.put("Mmname", Mmname);
	    map.put("hiddenname",hiddenname );
	 
	    
		moimMapper.changeMm(map);
		
	}


	@Override
	public int getScheduleCount(int mnum) {
		// TODO Auto-generated method stub
		return moimMapper.getScheduleCount(mnum);
	}

	@Override
	public List<MoimScheduleDto> getScheduleList(int mnum, int unum) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
	      map.put("mnum", mnum);
	      map.put("unum", unum);
	      return moimMapper.getScheduleList(map);
	}

	@Override
	public void deleteSchedule(String mssubject, int mnum) {
		 Map<String, Object> map = new HashMap<>();
	     map.put("mssubject", mssubject);
	     map.put("mnum", mnum);
	     
	     moimMapper.deleteSchedule(map);
		
	}
   
	@Override
	   public void scheduleJoin(int unum, int msnum, int mnum) {
	      
	      Map<String, Object> map = new HashMap<>();	      
	      map.put("unum", unum);
	      map.put("msnum", msnum);
	      map.put("mnum", mnum);
	      moimMapper.scheduleJoin(map);
	      
	   }

	@Override
	public void cancelScheduleJoin(int unum, int msnum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
	     map.put("unum", unum);
	     map.put("msnum", msnum);
	     
	     moimMapper.cancelScheduleJoin(map);
	}
	 
	@Override
	   public int getMemberCheckCount(int unum, String mname) {
	      // TODO Auto-generated method stub
	      return moimMapper.getMemberCheckCount(unum,mname);
	   }
		
	@Override
	public void mandate(int unum, String mname) {
		 Map<String, Object> map = new HashMap<>();
	     map.put("mname", mname);
	     map.put("unum", unum);
	     System.out.println(map);
	     
	     moimMapper.mandate(map);		
	}
	
	@Override
	   public List<Map<String, Object>> getJoinMemberList(int msnum) {
	      
	      return moimMapper.getJoinMemberList(msnum);

	   }
	
}