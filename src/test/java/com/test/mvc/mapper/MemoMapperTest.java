package com.test.mvc.mapper;

import com.test.mvc.dto.MemoPostDto;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemoMapperTest {

    @Autowired
    MemoMapper memoMapper;

    @Test
    @DisplayName("insert 테스트")
    void insertTest() {
        //given
        String memoContent= "5번째 메모 입력";

        //when
        memoMapper.save(MemoPostDto.builder()
                .memoText(memoContent)
                .build());
        //then
    }
}