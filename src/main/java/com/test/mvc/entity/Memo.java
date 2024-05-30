package com.test.mvc.entity;

import lombok.*;
import org.checkerframework.checker.units.qual.N;

import java.time.LocalDateTime;

@Getter@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Memo {
    private String memoNum;                 //index
    private String memoText;                // memo content
    private LocalDateTime regDate;      //register Date

}
