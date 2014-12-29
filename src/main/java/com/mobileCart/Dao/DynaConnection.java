package com.mobileCart.Dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.DescribeTableRequest;
import com.amazonaws.services.dynamodbv2.model.PutItemRequest;
import com.amazonaws.services.dynamodbv2.model.PutItemResult;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;
import com.amazonaws.services.dynamodbv2.model.TableDescription;
import com.mobileCart.Domain.catlog;

public class DynaConnection {

	public static  String createConnection(){

		AWSCredentials Credentials = new BasicAWSCredentials(myConfig.getMyAccessId(), myConfig.getMySecretId());
		System.out.println("Credentials taken...");
		AmazonDynamoDBClient dynamoDB = new AmazonDynamoDBClient(Credentials);
		Region usWest2 = Region.getRegion(Regions.US_WEST_1);
		dynamoDB.setRegion(usWest2);
		System.out.println("dyan connected...");

		String tableName = "Mobiles";
		
		return null;
		}
	
		public static Object addItem(String companyName, int price, int quantity, String productName){
		String companyname = companyName;
		int prce = price;
		int quant = quantity;
		String productname = productName;
		
		System.out.println("price is "+prce);
		
		AWSCredentials Credentials = new BasicAWSCredentials(myConfig.getMyAccessId(), myConfig.getMySecretId());
		System.out.println("Credentials taken...");
		AmazonDynamoDBClient dynamoDB = new AmazonDynamoDBClient(Credentials);
		Region usWest2 = Region.getRegion(Regions.US_WEST_1);
		dynamoDB.setRegion(usWest2);
		System.out.println("dyan connected...");
		
		String tableName = "Mobiles";
		
		Map<String, AttributeValue> item = newItem(companyname, prce, quant, productname);
        PutItemRequest putItemRequest = new PutItemRequest(tableName, item);
        PutItemResult putItemResult = dynamoDB.putItem(putItemRequest);
        System.out.println("Result: " + putItemResult);
		
		return null;
		}
		
		public static List<String> getAllItems (){
			System.out.println("inside allitems db");
			
			AWSCredentials Credentials = new BasicAWSCredentials(myConfig.getMyAccessId(), myConfig.getMySecretId());
			System.out.println("Credentials taken...");
			AmazonDynamoDBClient dynamoDB = new AmazonDynamoDBClient(Credentials);
			Region usWest2 = Region.getRegion(Regions.US_WEST_1);
			dynamoDB.setRegion(usWest2);
			System.out.println("dyan connected...");
			
			String tableName = "Mobiles";
			
			 System.out.println("before scan result for items");
		        ScanRequest scnRequest = new ScanRequest(tableName);
		        ScanResult scnResult = dynamoDB.scan(scnRequest);
		        System.out.println("scan result for table is "+scnResult);
		        List<Map<String, AttributeValue>> items = scnResult.getItems();
				System.out.println("items"+items);
				List<String> ls=new ArrayList<String>();
				ls.add(items.toString());
				return ls;
		}
	
		private static Map<String, AttributeValue> newItem(String companyName, int price, int quantity, String productName) {
	        Map<String, AttributeValue> item = new HashMap<String, AttributeValue>();
	        item.put("companyName", new AttributeValue(companyName));
	        item.put("price", new AttributeValue().withN(Integer.toString(price)));
	        item.put("quantity", new AttributeValue().withN(Integer.toString(quantity)));
	        item.put("productName", new AttributeValue().withS(productName));
	        
	        System.out.println("object "+item.toString());
	        return item;
	    }

}
