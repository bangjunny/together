package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.CityPhotoDto;
import com.semi.dto.UserDto;
import com.semi.mapper.CityMapper;

@Service
public class CityService implements CityServiceInter {

	@Autowired
	private CityMapper cityMapper;

	@Override
	public CityBoardDto getDetailbycbnum(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbycbnum(cbnum);
	}

	@Override
	public UserDto getDetailbyunum(int unum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbyunum(unum);
	}

	@Override
	public void insertCity(CityBoardDto dto) {
		// TODO Auto-generated method stub
		cityMapper.insertCity(dto);
	}

	@Override
	public String preContent(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.preContent(dto);
	}

	@Override
	public String nxtContent(CityBoardDto dto) {
		// TODO Auto-generated method stub

		return cityMapper.nxtContent(dto);

	}

	@Override
	public String preNum(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.preNum(dto);
	}

	@Override
	public String nxtNum(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.nxtNum(dto);
	}

	@Override
	public String getTotalComment(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getTotalComment(cbnum);
	}

	@Override
	public List<CbReBoardDto> getCommentByCbnum(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getCommentByCbnum(cbnum);
	}

	@Override
	public void updateStep(int ref, int step) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<>();

		map.put("ref", ref);
		map.put("step", step);

		cityMapper.updateStep(map);
	}

	@Override
	public int getReboardNum() {
		// TODO Auto-generated method stub
		return cityMapper.getReboardNum();
	}

	@Override
	public void newComment(CbReBoardDto dto) {
		// TODO Auto-generated method stub
		int ref = dto.getRef();
		int step = dto.getRef();
		int depth = dto.getRef();

		step = 0;
		depth = 0;
		ref = cityMapper.getReboardNum() + 1;

		dto.setRef(ref);
		dto.setStep(step);
		dto.setDepth(depth);

		cityMapper.newComment(dto);
	}

	@Override
	public void addComment(CbReBoardDto dto) {
		// TODO Auto-generated method stub

		int ref = dto.getRef();
		int step = dto.getStep();
		int depth = dto.getDepth();
		// System.out.println("이전 : "+depth);
		this.updateStep(ref, step);

		step++;
		depth++;

		dto.setRef(ref);
		dto.setStep(step);
		dto.setDepth(depth);
		// System.out.println("변경 : "+depth);
		cityMapper.addComment(dto);
	}

	@Override
	public CbReBoardDto getCommentByRenum(int renum) {
		// TODO Auto-generated method stub
		return cityMapper.getCommentByRenum(renum);
	}

	@Override
	public void deleteCityboard(int cbnum) {
		// TODO Auto-generated method stub
		cityMapper.deleteCityboard(cbnum);
	}

	@Override
	public List<CityBoardDto> getCityPagingList(int start, int perpage, String city1, String city2, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		map.put("city1", city1);
		map.put("city2", city2);
		map.put("keyword", keyword);
		return cityMapper.getCityPagingList(map);
	}

	@Override
	public void updateComment(CbReBoardDto dto) {
		// TODO Auto-generated method stub
		cityMapper.updateComment(dto);
	}

	@Override
	public void deleteComment(int renum) {
		// TODO Auto-generated method stub
		cityMapper.deleteComment(renum);
	}

	@Override
	public void updateReadcount(int cbnum) {
		// TODO Auto-generated method stub
		cityMapper.updateReadcount(cbnum);
	}

	@Override
	public void newCityPhoto(CityPhotoDto dto) {
		// TODO Auto-generated method stub
		cityMapper.newCityPhoto(dto);
	}

	@Override
	public List<String> getAllPhoto(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getAllPhoto(cbnum);
	}

	@Override
	public List<CityPhotoDto> getPhoto(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getPhoto(cbnum);
	}

	@Override
	public String getPhotoCount(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getPhotoCount(cbnum);
	}

	@Override
	public int getTotalCountCity(String city1, String city2, String keyword) {
		// TODO Auto-generated method stub
		return cityMapper.getTotalCountCity(city1, city2, keyword);
	}

  @Override
  	public void updateCity(CityBoardDto dto) {
	  	// TODO Auto-generated method stub
	  	cityMapper.updateCity(dto);
  	}

  @Override
  	public void updateCityPhoto(CityBoardDto dto) {
	  	// TODO Auto-generated method stub
	  	cityMapper.updateCityPhoto(dto);
  	}

  	@Override
  	public void deleteCityPhoto(String photo_idx) {
  		// TODO Auto-generated method stub
  		cityMapper.deleteCityPhoto(photo_idx);
  	}

	@Override
	public List<CityBoardDto> getCityPagingListReadTop(String city1, String city2, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("city1", city1);
		map.put("city2", city2);
		map.put("keyword", keyword);
		return cityMapper.getCityPagingListReadTop(map);
		
	}

	@Override
	public List<CityBoardDto> getCityPagingListLikeTop(String city1, String city2, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("city1", city1);
		map.put("city2", city2);
		map.put("keyword", keyword);
		return cityMapper.getCityPagingListLikeTop(map);
	}
	
	@Override
	   public void cblike(int unum, int cbnum) {
	      // TODO Auto-generated method stub
	      Map<String, Object> map = new HashMap<>();
	      map.put("unum", unum);
	      map.put("cbnum", cbnum);
	      cityMapper.cblike(map);
	      
	   }

	   @Override
	   public int cblikecheck(int unum, int cbnum) {
	      // TODO Auto-generated method stub
	      Map<String, Object> map = new HashMap<>();
	      map.put("unum", unum);
	      map.put("cbnum", cbnum);
	      return cityMapper.cblikecheck(map);
	   }

	   @Override
	   public int cblikecountplus(int cbnum) {
	      // TODO Auto-generated method stub
	      return cityMapper.cblikecountplus(cbnum);
	   }

	   @Override
	   public void cbdislike(int unum, int cbnum) {
	      // TODO Auto-generated method stub
	      Map<String, Object> map = new HashMap<>();
	      map.put("unum", unum);
	      map.put("cbnum", cbnum);
	      cityMapper.cbdislike(map);
	   }

	   @Override
	   public int cblikecountminus(int cbnum) {
	      // TODO Auto-generated method stub
	      return cityMapper.cblikecountminus(cbnum);
	   }
	
}
