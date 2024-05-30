package com.test.mvc.service;

import com.test.mvc.dto.MemoPostDto;
import com.test.mvc.entity.Memo;
import com.test.mvc.mapper.MemoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemoService {
    //매퍼 통해서 끌어오기
   private final MemoMapper memoMapper;

   public List<Memo> findList(){
       List<Memo> memoList = memoMapper.findAll();

       return memoList;
   }

   public boolean save(MemoPostDto memo){
       boolean flag = memoMapper.save(memo);

       if(flag) log.info("메모 등록 성공!! - {}",memo);
       else log.warn("메모 등록 실패");
       return flag;
   }

   public int count(){
       int count = memoMapper.count();
       return count;
   }


}
