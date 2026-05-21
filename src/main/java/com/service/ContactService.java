package com.service;

import com.dao.ContactDAO;
import com.dao.MemberDAO;
import com.model.MemberModel;

public class ContactService {

    ContactDAO contactDao = new ContactDAO();
    MemberDAO memberDao = new MemberDAO();

    public void submitContact(String name, String email, String phone, String subject, String message) throws Exception {
        contactDao.insertContact(name, email, phone, subject, message);
    }

    public String validateContact(int memberId, String name, String email, String phone, String subject, String message) throws Exception {


        if (name == null || name.isBlank()) 
        {
        	return "Name is required.";
        }
        
        if (email == null || email.isBlank()) 
        {
        	return "Email address is required.";
        }
        
        if (subject == null || subject.isBlank()) 
        {
        	return "Please select a subject.";
        }
        
        if (message == null || message.isBlank()) 
        {
        	return "Message is required.";
        }

        if (name.length() > 50) 
        {
        	return "Name must not exceed 50 characters.";
        }
        
        if (message.length() > 2000) 
        {
        	return "Message must not exceed 2000 characters.";
        }

        MemberModel member = memberDao.getMemberRecordById(memberId);

        if (member == null) 
        {
        	return "Could not verify your account. Please log in again.";
        }

        if (!email.equalsIgnoreCase(member.getEmail())) 
        {
            return "The email address does not match the one registered on your account.";
        }


        if (phone != null && !phone.isBlank()) 
        {
            if (!phone.equals(member.getNumber())) {
                return "The phone number does not match the one registered on your account.";
            }
        }

        return null;
    }
}