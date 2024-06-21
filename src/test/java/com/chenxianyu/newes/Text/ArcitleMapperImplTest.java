package com.chenxianyu.newes.Text;

import com.chenxianyu.newes.Dao.Impl.ArcitleMapperImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ArcitleMapperImplTest {

    @Test
    void getArticleList() {
        ArcitleMapperImpl arcitleMapper = new ArcitleMapperImpl();
        System.out.println(arcitleMapper.getArticleList(0, 10).toString());
    }
}