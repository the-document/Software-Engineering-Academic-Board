package com.nguyenhongphuc.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;

import javax.imageio.ImageIO;

public class StorageData {

	public Boolean WriteImageToDataFolder(String Url) {
		
		BufferedImage image=null;
		try {
			URL MyUrl=new URL(Url);
			image=ImageIO.read(MyUrl);
			
			ImageIO.write(image,"png", new File("location"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
}
