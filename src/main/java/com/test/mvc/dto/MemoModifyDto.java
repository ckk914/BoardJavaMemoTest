package com.test.mvc.dto;


import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class MemoModifyDto {
    @NotNull
    private long mno;
    @NotNull
    private String newText;
}
