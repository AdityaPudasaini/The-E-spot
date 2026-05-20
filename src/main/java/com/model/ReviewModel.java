package com.model;

public class ReviewModel 
{
	private int reviewId;
    private int productId;
    private int memberId;
    private String memberUsername;
    private int reviewRating;
    private String reviewComment;
    private String reviewDate;

    public int getReviewId() 
    { 
    	return reviewId; 
    }
    
    public void setReviewId(int reviewId) 
    { 
    	this.reviewId = reviewId; 
    }

    public int getProductId() 
    { 
    	return productId; 
    }
    
    public void setProductId(int productId) 
    { 
    	this.productId = productId; 
    }

    public int getMemberId() 
    { 
    	return memberId; 
    }
    
    public void setMemberId(int memberId) 
    { 
    	this.memberId = memberId; 
    }

    public String getMemberUsername() 
    { 
    	return memberUsername; 
    }
    
    public void setMemberUsername(String memberUsername) 
    { 
    	this.memberUsername = memberUsername; 
    }

    public int getReviewRating() 
    { 
    	return reviewRating; 
    }
    
    public void setReviewRating(int reviewRating) 
    { 
    	this.reviewRating = reviewRating; 
    }

    public String getReviewComment() 
    { 
    	return reviewComment; 
    }
    
    public void setReviewComment(String reviewComment) 
    { 
    	this.reviewComment = reviewComment; 
    }

    public String getReviewDate() 
    { 
    	return reviewDate; 
    }
    
    public void setReviewDate(String reviewDate) 
    { 
    	this.reviewDate = reviewDate; 
    }
}