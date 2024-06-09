package com.test.mvc.controller;

import com.test.mvc.dto.MemoModifyDto;
import com.test.mvc.dto.MemoPostDto;
import com.test.mvc.entity.Memo;
import com.test.mvc.service.MemoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@Slf4j
public class MemoController {
    //서비스 통해 위임하여 조회나 기타등등
    private final MemoService memoService;

    @GetMapping("/")
    public String list(Model model) {
//        System.out.println("/ getMapping");
        List<Memo> memo = memoService.findList();
        System.out.println("memo = " + memo);

        model.addAttribute("mList", memo);
        return "/memo/list";
    }

    @PostMapping
    public ResponseEntity<?> post(
            @RequestBody MemoPostDto memoPostDto, Model model
    ) {
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

    //삭제 처리 method: delete
    @DeleteMapping("/{mno}")
    public ResponseEntity<?> delete(@PathVariable long mno) { //PathVariable : url 데이터 읽음~!

//        System.out.println("삭제 시퀀스");
        System.out.println("mno = " + mno);
        List<Memo> mList = memoService.delete(mno);
        return ResponseEntity
                .ok()
                .body(mList);
    }

    // ▽ put patch 동시 사용 방법.~!⭐️
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<?> modify(
           @Validated @RequestBody MemoModifyDto dto
            , BindingResult result      //검증 객체
    ) {

        log.info("/api/v1/replies : PUT, PATCH");       //PUT 타입으로 넘겨주면 받는다~!
        log.debug("parameter: {}", dto);

        //@Validated 건 곳에서 dto 들어가면   @NotNull @NotBlink 인지 검사
        if (result.hasErrors()) {
            Map<String, String> errors = makeValidationMessageMap(result);

            return ResponseEntity
                    .badRequest()
                    .body(errors);
        }



        List<Memo> mList = memoService.modify(dto);
        return ResponseEntity.ok().body(mList);
    }



    private Map<String, String> makeValidationMessageMap(BindingResult result) {

        Map<String, String> errors = new HashMap<>();

        List<FieldError> fieldErrors = result.getFieldErrors();

        for (FieldError error : fieldErrors) {
            errors.put(error.getField(), error.getDefaultMessage());
        }

        return errors;

    }
} //end MemoController
