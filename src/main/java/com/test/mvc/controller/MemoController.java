package com.test.mvc.controller;

import com.test.mvc.dto.MemoPostDto;
import com.test.mvc.entity.Memo;
import com.test.mvc.service.MemoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@Slf4j
public class MemoController {
    //서비스 통해 위임하여 조회나 기타등등
    private final MemoService memoService;
    
    @GetMapping("/")
    public String list(Model model){
        List<Memo> memo = memoService.findList();
        System.out.println("memo = " + memo);

        model.addAttribute("mList",memo);
        return "/memo/list";
    }

    @PostMapping
    public ResponseEntity<?> post(
            @RequestBody MemoPostDto memoPostDto,Model model
            ){
        System.out.println(" 추가시퀀스 진입");
        log.info("/api/vi/replies: post");
        log.debug("parameter: {}", memoPostDto);
        System.out.println("memo = " + memoPostDto);
        boolean flag = memoService.save(memoPostDto);
        
//        int count = memoService.count();
//        System.out.println("count = " + count);
//model.addAttribute("totalCount",count);
        List<Memo> mmLists = memoService.findList();
                //돌려줄 데이터
        return ResponseEntity
                .ok()
                .body(mmLists);
    }

    
}
