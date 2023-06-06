package bbs;

public class BbsProxy {
    private Bbs bbs;

    public BbsProxy(Bbs bbs) {
        this.bbs = bbs;
    }

    
    public void setBbsID(int bbsID) {
        bbs.setBbsID(bbsID);
    }

    
    public void setBbsTitle(String bbsTitle) {
    	if(this.hasWritePermission(bbs.getUserID()))
    		bbs.setBbsContent(bbsTitle);
        
    }

    
    public void setUserID(String userID) {
        bbs.setUserID(userID);
    }

    
//    public void setBbsDate(String bbsDate) {
//        bbs.setBbsDate(bbsDate);
//    }

    
    public void setBbsContent(String bbsContent) {
    	if(this.hasWritePermission(bbs.getUserID()))
    		bbs.setBbsContent(bbsContent);
    	
    }

    
    public void setBbsAvailable(int bbsAvailable) {
        bbs.setBbsAvailable(bbsAvailable);
    }
    
    public int getBbsID() { 
        return bbs.getBbsID();
    }
    
	public String getBbsTitle() {
		return bbs.getBbsTitle();
	}
	
	public String getUserID() {
		return bbs.getUserID();
	}
	
	public String getBbsDate() {
		return bbs.getBbsDate();
	}
	public String getBbsContent() {
		return bbs.getBbsContent();
	}
	
	public int getBbsAvailable() {
		return bbs.getBbsAvailable();
	}
	
	public boolean hasWritePermission(String userID) {
		return userID.equals(bbs.getUserID());
	}
	

}

