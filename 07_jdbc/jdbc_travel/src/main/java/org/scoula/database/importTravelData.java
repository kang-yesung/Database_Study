package org.scoula.database;


import com.opencsv.bean.CsvToBeanBuilder;
import org.scoula.common.JDBCUtil;
import org.scoula.travel.dao.TravelDao;
import org.scoula.travel.dao.TravelDaoImple;
import org.scoula.travel.domain.TravelVO;

import java.io.FileReader;
import java.util.List;

// OpenSCV 라이브러리
// CSV파일을 읽을때 도와준는 라이브러리
public class importTravelData {
    public static void main(String[] args) throws Exception {

        TravelDao dao = new TravelDaoImple();


        List<TravelVO> travels = new CsvToBeanBuilder<TravelVO>(new FileReader("travel.csv"))
                .withType(TravelVO.class)
                .build()
                .parse();

        travels.forEach(travel ->{
            System.out.println(travel);
            dao.insert(travel);
        });
    }
}
