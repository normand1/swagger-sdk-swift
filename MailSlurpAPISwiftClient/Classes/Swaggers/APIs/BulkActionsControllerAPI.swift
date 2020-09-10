//
// BulkActionsControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class BulkActionsControllerAPI {
    /**
     Bulk create Inboxes (email addresses)
     
     - parameter count: (query) Number of inboxes to be created in bulk 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func bulkCreateInboxes(count: Int, completion: @escaping ((_ data: [Inbox]?,_ error: Error?) -> Void)) {
        bulkCreateInboxesWithRequestBuilder(count: count).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Bulk create Inboxes (email addresses)
     - POST /bulk/inboxes
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
}, {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
} ]}]
     
     - parameter count: (query) Number of inboxes to be created in bulk 

     - returns: RequestBuilder<[Inbox]> 
     */
    open class func bulkCreateInboxesWithRequestBuilder(count: Int) -> RequestBuilder<[Inbox]> {
        let path = "/bulk/inboxes"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "count": count.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<[Inbox]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Bulk Delete Inboxes
     
     - parameter ids: (body) ids 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func bulkDeleteInboxes(ids: [UUID], completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        bulkDeleteInboxesWithRequestBuilder(ids: ids).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Bulk Delete Inboxes
     - DELETE /bulk/inboxes
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter ids: (body) ids 

     - returns: RequestBuilder<Void> 
     */
    open class func bulkDeleteInboxesWithRequestBuilder(ids: [UUID]) -> RequestBuilder<Void> {
        let path = "/bulk/inboxes"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: ids)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Bulk Send Emails
     
     - parameter bulkSendEmailOptions: (body) bulkSendEmailOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func bulkSendEmails(bulkSendEmailOptions: BulkSendEmailOptions, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        bulkSendEmailsWithRequestBuilder(bulkSendEmailOptions: bulkSendEmailOptions).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Bulk Send Emails
     - POST /bulk/send
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter bulkSendEmailOptions: (body) bulkSendEmailOptions 

     - returns: RequestBuilder<Void> 
     */
    open class func bulkSendEmailsWithRequestBuilder(bulkSendEmailOptions: BulkSendEmailOptions) -> RequestBuilder<Void> {
        let path = "/bulk/send"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: bulkSendEmailOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
