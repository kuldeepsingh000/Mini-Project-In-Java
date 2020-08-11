package com.amar.candidate.util;

public class WrongDataException extends Exception {
//	This exception will be thrown in the CandidateMain class methods whenever invalid input is given. 
	@Override
	public String toString()
	{
		return "Data Incorrect";
	}
}
