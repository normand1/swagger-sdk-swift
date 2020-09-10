//
// WebhookControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class WebhookControllerAPI {
    /**
     Attach a WebHook URL to an inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter webhookOptions: (body) webhookOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createWebhook(inboxId: UUID, webhookOptions: CreateWebhookOptions, completion: @escaping ((_ data: WebhookDto?,_ error: Error?) -> Void)) {
        createWebhookWithRequestBuilder(inboxId: inboxId, webhookOptions: webhookOptions).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Attach a WebHook URL to an inbox
     - POST /inboxes/{inboxId}/webhooks
     - Get notified whenever an inbox receives an email via a WebHook URL. An emailID will be posted to this URL every time an email is received for this inbox. The URL must be publicly reachable by the MailSlurp server. You can provide basicAuth values if you wish to secure this endpoint.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "method" : "GET",
  "basicAuth" : true,
  "payloadJsonSchema" : "payloadJsonSchema",
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "url" : "url",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter inboxId: (path) inboxId 
     - parameter webhookOptions: (body) webhookOptions 

     - returns: RequestBuilder<WebhookDto> 
     */
    open class func createWebhookWithRequestBuilder(inboxId: UUID, webhookOptions: CreateWebhookOptions) -> RequestBuilder<WebhookDto> {
        var path = "/inboxes/{inboxId}/webhooks"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: webhookOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<WebhookDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete and disable a Webhook for an Inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter webhookId: (path) webhookId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteWebhook(inboxId: UUID, webhookId: UUID, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteWebhookWithRequestBuilder(inboxId: inboxId, webhookId: webhookId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete and disable a Webhook for an Inbox
     - DELETE /inboxes/{inboxId}/webhooks/{webhookId}
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter inboxId: (path) inboxId 
     - parameter webhookId: (path) webhookId 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteWebhookWithRequestBuilder(inboxId: UUID, webhookId: UUID) -> RequestBuilder<Void> {
        var path = "/inboxes/{inboxId}/webhooks/{webhookId}"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let webhookIdPreEscape = "\(webhookId)"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{webhookId}", with: webhookIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_getAllWebhooks: String { 
        case asc = "ASC"
        case desc = "DESC"
    }

    /**
     List Webhooks Paginated
     
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllWebhooks(page: Int? = nil, size: Int? = nil, sort: Sort_getAllWebhooks? = nil, completion: @escaping ((_ data: PageWebhookProjection?,_ error: Error?) -> Void)) {
        getAllWebhooksWithRequestBuilder(page: page, size: size, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     List Webhooks Paginated
     - GET /webhooks/paginated
     - List webhooks in paginated form. Allows for page index, page size, and sort direction.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "number" : 0,
  "last" : true,
  "numberOfElements" : 6,
  "size" : 1,
  "totalPages" : 5,
  "pageable" : {
    "paged" : true,
    "pageNumber" : 5,
    "offset" : 1,
    "pageSize" : 5,
    "unpaged" : true,
    "sort" : {
      "unsorted" : true,
      "sorted" : true,
      "empty" : true
    }
  },
  "sort" : {
    "unsorted" : true,
    "sorted" : true,
    "empty" : true
  },
  "content" : [ {
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "url" : "url",
    "updatedAt" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "url" : "url",
    "updatedAt" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "first" : true,
  "empty" : true,
  "totalElements" : 5
}}]
     
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)

     - returns: RequestBuilder<PageWebhookProjection> 
     */
    open class func getAllWebhooksWithRequestBuilder(page: Int? = nil, size: Int? = nil, sort: Sort_getAllWebhooks? = nil) -> RequestBuilder<PageWebhookProjection> {
        let path = "/webhooks/paginated"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(), 
            "size": size?.encodeToJSON(), 
            "sort": sort?.rawValue
        ])

        let requestBuilder: RequestBuilder<PageWebhookProjection>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get a webhook for an Inbox
     
     - parameter webhookId: (path) webhookId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getWebhook(webhookId: UUID, completion: @escaping ((_ data: WebhookDto?,_ error: Error?) -> Void)) {
        getWebhookWithRequestBuilder(webhookId: webhookId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get a webhook for an Inbox
     - GET /webhooks/{webhookId}
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "method" : "GET",
  "basicAuth" : true,
  "payloadJsonSchema" : "payloadJsonSchema",
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "url" : "url",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter webhookId: (path) webhookId 

     - returns: RequestBuilder<WebhookDto> 
     */
    open class func getWebhookWithRequestBuilder(webhookId: UUID) -> RequestBuilder<WebhookDto> {
        var path = "/webhooks/{webhookId}"
        let webhookIdPreEscape = "\(webhookId)"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{webhookId}", with: webhookIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<WebhookDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all Webhooks for an Inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getWebhooks(inboxId: UUID, completion: @escaping ((_ data: [WebhookDto]?,_ error: Error?) -> Void)) {
        getWebhooksWithRequestBuilder(inboxId: inboxId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get all Webhooks for an Inbox
     - GET /inboxes/{inboxId}/webhooks
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "method" : "GET",
  "basicAuth" : true,
  "payloadJsonSchema" : "payloadJsonSchema",
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "url" : "url",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}, {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "method" : "GET",
  "basicAuth" : true,
  "payloadJsonSchema" : "payloadJsonSchema",
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "inboxId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "url" : "url",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
} ]}]
     
     - parameter inboxId: (path) inboxId 

     - returns: RequestBuilder<[WebhookDto]> 
     */
    open class func getWebhooksWithRequestBuilder(inboxId: UUID) -> RequestBuilder<[WebhookDto]> {
        var path = "/inboxes/{inboxId}/webhooks"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[WebhookDto]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Send webhook test data
     
     - parameter webhookId: (path) webhookId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sendTestData(webhookId: UUID, completion: @escaping ((_ data: WebhookTestResult?,_ error: Error?) -> Void)) {
        sendTestDataWithRequestBuilder(webhookId: webhookId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Send webhook test data
     - POST /webhooks/{webhookId}/test
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "request" : {
    "headers" : {
      "key" : "headers"
    },
    "method" : "GET",
    "payload" : "payload",
    "url" : "url"
  },
  "response" : {
    "message" : "message",
    "statusCode" : 0
  },
  "message" : "message"
}}]
     
     - parameter webhookId: (path) webhookId 

     - returns: RequestBuilder<WebhookTestResult> 
     */
    open class func sendTestDataWithRequestBuilder(webhookId: UUID) -> RequestBuilder<WebhookTestResult> {
        var path = "/webhooks/{webhookId}/test"
        let webhookIdPreEscape = "\(webhookId)"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{webhookId}", with: webhookIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<WebhookTestResult>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
