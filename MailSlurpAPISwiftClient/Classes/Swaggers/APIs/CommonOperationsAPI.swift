//
// CommonOperationsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class CommonOperationsAPI: APIBase {
    /**
     Create new email address
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func createNewEmailAddressUsingPOST(completion: ((data: Inbox?, error: ErrorType?) -> Void)) {
        createNewEmailAddressUsingPOSTWithRequestBuilder().execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Create new email address
     - POST /newEmailAddress
     - Returns an Inbox with an `id` and an `emailAddress`
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "emailAddress" : "emailAddress",
  "created" : "2000-01-23T04:56:07.000+00:00",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91"
}}]

     - returns: RequestBuilder<Inbox> 
     */
    public class func createNewEmailAddressUsingPOSTWithRequestBuilder() -> RequestBuilder<Inbox> {
        let path = "/newEmailAddress"
        let URLString = MailSlurpAPISwiftClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Inbox>.Type = MailSlurpAPISwiftClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

    /**
     Fetch inbox's latest email or if empty wait for email to arrive
     
     - parameter inboxEmailAddress: (query) Email address of the inbox we are fetching emails from (optional)
     - parameter inboxId: (query) Id of the inbox we are fetching emails from (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func fetchLatestEmailUsingGET(inboxEmailAddress inboxEmailAddress: String? = nil, inboxId: NSUUID? = nil, completion: ((data: Email?, error: ErrorType?) -> Void)) {
        fetchLatestEmailUsingGETWithRequestBuilder(inboxEmailAddress: inboxEmailAddress, inboxId: inboxId).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Fetch inbox's latest email or if empty wait for email to arrive
     - GET /fetchLatestEmail
     - Will return either the last received email or wait for an email to arrive and return that. If you need to wait for an email for a non-empty inbox see the other receive methods.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "cc" : [ "cc", "cc" ],
  "headers" : {
    "key" : "headers"
  },
  "bcc" : [ "bcc", "bcc" ],
  "subject" : "subject",
  "analysis" : {
    "spamVerdict" : "spamVerdict",
    "virusVerdict" : "virusVerdict",
    "dmarcVerdict" : "dmarcVerdict",
    "spfVerdict" : "spfVerdict",
    "dkimVerdict" : "dkimVerdict"
  },
  "body" : "body",
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "from" : "from",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "to" : [ "to", "to" ],
  "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter inboxEmailAddress: (query) Email address of the inbox we are fetching emails from (optional)
     - parameter inboxId: (query) Id of the inbox we are fetching emails from (optional)

     - returns: RequestBuilder<Email> 
     */
    public class func fetchLatestEmailUsingGETWithRequestBuilder(inboxEmailAddress inboxEmailAddress: String? = nil, inboxId: NSUUID? = nil) -> RequestBuilder<Email> {
        let path = "/fetchLatestEmail"
        let URLString = MailSlurpAPISwiftClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "inboxEmailAddress": inboxEmailAddress,
            "inboxId": inboxId
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Email>.Type = MailSlurpAPISwiftClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     Send an email from a random email address
     
     - parameter sendEmailOptions: (body) sendEmailOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func sendEmailSimpleUsingPOST(sendEmailOptions sendEmailOptions: SendEmailOptions, completion: ((error: ErrorType?) -> Void)) {
        sendEmailSimpleUsingPOSTWithRequestBuilder(sendEmailOptions: sendEmailOptions).execute { (response, error) -> Void in
            completion(error: error);
        }
    }


    /**
     Send an email from a random email address
     - POST /sendEmail
     - To specify an email address first create an inbox and use that with the other send email methods
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter sendEmailOptions: (body) sendEmailOptions 

     - returns: RequestBuilder<Void> 
     */
    public class func sendEmailSimpleUsingPOSTWithRequestBuilder(sendEmailOptions sendEmailOptions: SendEmailOptions) -> RequestBuilder<Void> {
        let path = "/sendEmail"
        let URLString = MailSlurpAPISwiftClientAPI.basePath + path
        let parameters = sendEmailOptions.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Void>.Type = MailSlurpAPISwiftClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

}