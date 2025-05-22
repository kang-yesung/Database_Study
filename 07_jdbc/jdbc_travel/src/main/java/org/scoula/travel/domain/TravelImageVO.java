package org.scoula.travel.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TravelImageVO {

    private Long no;
    private String filename;
    private Long travelNo;

}
