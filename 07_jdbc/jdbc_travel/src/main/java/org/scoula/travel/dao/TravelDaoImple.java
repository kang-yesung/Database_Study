package org.scoula.travel.dao;

import org.scoula.common.JDBCUtil;
import org.scoula.travel.domain.TravelImageVO;
import org.scoula.travel.domain.TravelVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TravelDaoImple implements TravelDao {

    Connection conn = JDBCUtil.getConnection();

    @Override
    public void insert(TravelVO travelVO) {
        // database create
        String sql = "insert into tbl_travel(no,district,title,description,address,phone) values(?,?,?,?,?,?)";

        try(PreparedStatement pstmt = conn.prepareStatement(sql)){

            // query ㄹ완성하기
            pstmt.setLong(1, travelVO.getNo());
            pstmt.setString(2, travelVO.getDistrict());
            pstmt.setString(3, travelVO.getTitle());
            pstmt.setString(4, travelVO.getDescription());
            pstmt.setString(5, travelVO.getAddress());
            pstmt.setString(6, travelVO.getPhone());

            int count = pstmt.executeUpdate();


        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertImage(TravelImageVO travelImageVO) {
        String sql = "insert into tbl_travel_image(filename, travel_no) values(?,?)";
        try(PreparedStatement pstmt= conn.prepareStatement(sql)){
            //1. 쿼리 완성하기
            pstmt.setString(1, travelImageVO.getFilename());
            pstmt.setLong(2, travelImageVO.getTravelNo());

            int count = pstmt.executeUpdate();


        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
