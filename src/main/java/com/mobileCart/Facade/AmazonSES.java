package com.mobileCart.Facade;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;
import com.mobileCart.Dao.myConfig;

public class AmazonSES {

	public static String sendEmail(String email, String name, int mob) {

		final String FROM = "abhadan1@binghamton.edu"; // Replace with your "From"
														// address. This address
														// must be verified.
		final String TO = email; // Replace with a "To" address. If you have not
									// yet requested
									// production access, this address must be
									// verified.
		final String BODY = "Hello "
				+ name
				+ ", Thank You for using our service we will contact you soon on following no. "
				+ mob;
		final String SUBJECT = "mobileCart";

		System.out.println("To " + TO);

		// Construct an object to contain the recipient address.
		Destination destination = new Destination()
				.withToAddresses(new String[] { TO });

		// Create the subject and body of the message.
		Content subject = new Content().withData(SUBJECT);
		Content textBody = new Content().withData(BODY);
		Body body = new Body().withText(textBody);

		// Create a message with the specified subject and body.
		Message message = new Message().withSubject(subject).withBody(body);

		// Assemble the email.
		SendEmailRequest request = new SendEmailRequest().withSource(FROM)
				.withDestination(destination).withMessage(message);

		System.out.println("Attempting to send an email through Amazon SES by using the AWS SDK for Java...");

		/*
		 * The ProfileCredentialsProvider will return your [default] credential
		 * profile by reading from the credentials file located at
		 * (~/.aws/credentials).
		 * 
		 * TransferManager manages a pool of threads, so we create a single
		 * instance and share it throughout our application.
		 */
		AWSCredentials Credentials = new BasicAWSCredentials(
				myConfig.getMyAccessId(), myConfig.getMySecretId());

		// Instantiate an Amazon SES client, which will make the service call
		// with the supplied AWS credentials.
		AmazonSimpleEmailServiceClient client = new AmazonSimpleEmailServiceClient(
				Credentials);

		// Choose the AWS region of the Amazon SES endpoint you want to connect
		// to. Note that your production
		// access status, sending limits, and Amazon SES identity-related
		// settings are specific to a given
		// AWS region, so be sure to select an AWS region in which you set up
		// Amazon SES. Here, we are using
		// the US East (N. Virginia) region. Examples of other regions that
		// Amazon SES supports are US_WEST_2
		// and EU_WEST_1. For a complete list, see
		// http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html
		Region REGION = Region.getRegion(Regions.US_WEST_2);
		client.setRegion(REGION);

		// Send the email.
		client.sendEmail(request);
		System.out.println("Email sent!");

		return null;
	}
}
