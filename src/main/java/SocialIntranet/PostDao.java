package SocialIntranet;

import DBconnection.DBconn;

import java.io.InputStream;
import java.sql.*;

public class PostDao
{
    public String addPost(String eId, String pDate, String text, InputStream[] image, int tot)
    {
        int empId,pId=0;
        String res;
        Statement statement = null;
        ResultSet rs = null;
        empId = Integer.parseInt(eId);
        Connection con = null;
        try
        {
            con = DBconn.getConnection();

            PreparedStatement st1 = con.prepareStatement("INSERT INTO post (empId,dateTime,postText,postImage) VALUES(?,?,?,?)");
            st1.setInt(1, empId);
            st1.setString(2, pDate);
            st1.setString(3, text);
            st1.setInt(4, tot);
            st1.executeUpdate();
            st1.close();

            statement = con.createStatement();
            rs = statement.executeQuery("SELECT postId FROM post ORDER BY postId DESC LIMIT 1");
            if(rs.next())
            {
                pId = rs.getInt("postId");
                for(int i=0;i<tot;i++)
                {
                    if(image[i]!=null)
                    {
                        PreparedStatement st2 = con.prepareStatement("INSERT INTO postimgs VALUES(?,?,?)");
                        st2.setInt(1,pId);
                        st2.setInt(2,i+1);
                        st2.setBlob(3, image[i]);
                        st2.executeUpdate();
                        st2.close();
                    }
                }
            }

            con.close();
            res = "Successful";
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            res = "Unsuccessful";
        }
        return res;
    }
}
