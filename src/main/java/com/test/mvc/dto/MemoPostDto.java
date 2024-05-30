package com.test.mvc.dto;

import lombok.*;

@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class MemoPostDto {
    private String memoText;
}
