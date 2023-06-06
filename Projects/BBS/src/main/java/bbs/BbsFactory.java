package bbs;
import java.util.Date;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;


class BbsFactory {
    public static BbsProxy createBbs(String bbsTitle, String userID, String bbsContent,int bbsID) {
        Bbs bbs = new Bbs();
        bbs.setBbsID(bbsID);
        bbs.setBbsTitle(bbsTitle);
        bbs.setUserID(userID);
        bbs.setBbsContent(bbsContent);
        Date now = new Date();
        bbs.setBbsDate(now.toString());
        bbs.setBbsAvailable(1);
        BbsProxy bbsProxy = new BbsProxy(bbs);
        return bbsProxy;
    }
}