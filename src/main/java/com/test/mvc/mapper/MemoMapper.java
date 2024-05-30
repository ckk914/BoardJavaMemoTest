package com.test.mvc.mapper;

import com.test.mvc.dto.MemoPostDto;
import com.test.mvc.entity.Memo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemoMapper {
    //전체 목록 조회
    List<Memo> findAll();
    //상세 조회
//    Memo findOne(int memoNum);
//    //메모 등록
    boolean save(MemoPostDto memo);
    //메모 갯수 조회
    int count();
}
