//
// InboxControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class InboxControllerAPI {
    /**
     Create an Inbox (email address)
     
     - parameter _description: (query) Optional description for an inbox. (optional)
     - parameter emailAddress: (query) Optional email address including domain you wish inbox to use (eg: test123@mydomain.com). Only supports domains that you have registered and verified with MailSlurp using dashboard or &#x60;createDomain&#x60; method. (optional)
     - parameter expiresAt: (query) Optional expires at timestamp. If your plan supports this feature you can specify when an inbox should expire. If left empty inbox will exist permanently or expire when your plan dictates (optional)
     - parameter favourite: (query) Is inbox favourited. (optional)
     - parameter name: (query) Optional name for an inbox. (optional)
     - parameter tags: (query) Optional tags for an inbox. Can be used for searching and filtering inboxes. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createInbox(_description: String? = nil, emailAddress: String? = nil, expiresAt: Date? = nil, favourite: Bool? = nil, name: String? = nil, tags: [String]? = nil, completion: @escaping ((_ data: Inbox?,_ error: Error?) -> Void)) {
        createInboxWithRequestBuilder(_description: _description, emailAddress: emailAddress, expiresAt: expiresAt, favourite: favourite, name: name, tags: tags).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Create an Inbox (email address)
     - POST /inboxes
     - Create a new inbox and with a randomized email address to send and receive from. Pass emailAddress parameter if you wish to use a specific email address. Creating an inbox is required before sending or receiving emails. If writing tests it is recommended that you create a new inbox during each test method so that it is unique and empty. 
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
}}]
     
     - parameter _description: (query) Optional description for an inbox. (optional)
     - parameter emailAddress: (query) Optional email address including domain you wish inbox to use (eg: test123@mydomain.com). Only supports domains that you have registered and verified with MailSlurp using dashboard or &#x60;createDomain&#x60; method. (optional)
     - parameter expiresAt: (query) Optional expires at timestamp. If your plan supports this feature you can specify when an inbox should expire. If left empty inbox will exist permanently or expire when your plan dictates (optional)
     - parameter favourite: (query) Is inbox favourited. (optional)
     - parameter name: (query) Optional name for an inbox. (optional)
     - parameter tags: (query) Optional tags for an inbox. Can be used for searching and filtering inboxes. (optional)

     - returns: RequestBuilder<Inbox> 
     */
    open class func createInboxWithRequestBuilder(_description: String? = nil, emailAddress: String? = nil, expiresAt: Date? = nil, favourite: Bool? = nil, name: String? = nil, tags: [String]? = nil) -> RequestBuilder<Inbox> {
        let path = "/inboxes"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "description": _description, 
            "emailAddress": emailAddress, 
            "expiresAt": expiresAt?.encodeToJSON(), 
            "favourite": favourite, 
            "name": name, 
            "tags": tags
        ])

        let requestBuilder: RequestBuilder<Inbox>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete all inboxes
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteAllInboxes(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteAllInboxesWithRequestBuilder().execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete all inboxes
     - DELETE /inboxes
     - Permanently delete all inboxes and associated email addresses. This will also delete all emails within the inboxes. Be careful as inboxes cannot be recovered once deleted. Note: deleting inboxes will not impact your usage limits. Monthly inbox creation limits are based on how many inboxes were created in the last 30 days, not how many inboxes you currently have.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY

     - returns: RequestBuilder<Void> 
     */
    open class func deleteAllInboxesWithRequestBuilder() -> RequestBuilder<Void> {
        let path = "/inboxes"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Delete inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteInbox(inboxId: UUID, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteInboxWithRequestBuilder(inboxId: inboxId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete inbox
     - DELETE /inboxes/{inboxId}
     - Permanently delete an inbox and associated email address aswell as all emails within the given inbox. This action cannot be undone. Note: deleting an inbox will not affect your account usage. Monthly inbox usage is based on how many inboxes you create within 30 days, not how many exist at time of request.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter inboxId: (path) inboxId 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteInboxWithRequestBuilder(inboxId: UUID) -> RequestBuilder<Void> {
        var path = "/inboxes/{inboxId}"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_getAllInboxes: String { 
        case asc = "ASC"
        case desc = "DESC"
    }

    /**
     List Inboxes Paginated
     
     - parameter favourite: (query) Optionally filter results for favourites only (optional, default to false)
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter search: (query) Optionally filter by search words partial matching ID, tags, name, and email address (optional)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)
     - parameter tag: (query) Optionally filter by tags (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllInboxes(favourite: Bool? = nil, page: Int? = nil, search: String? = nil, size: Int? = nil, sort: Sort_getAllInboxes? = nil, tag: String? = nil, completion: @escaping ((_ data: PageInboxProjection?,_ error: Error?) -> Void)) {
        getAllInboxesWithRequestBuilder(favourite: favourite, page: page, search: search, size: size, sort: sort, tag: tag).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     List Inboxes Paginated
     - GET /inboxes/paginated
     - List inboxes in paginated form. Allows for page index, page size, and sort direction. Can also filter by favourited or email address like pattern.
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
    "emailAddress" : "emailAddress",
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "favourite" : true,
    "tags" : [ "tags", "tags" ]
  }, {
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "emailAddress" : "emailAddress",
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "favourite" : true,
    "tags" : [ "tags", "tags" ]
  } ],
  "first" : true,
  "empty" : true,
  "totalElements" : 5
}}]
     
     - parameter favourite: (query) Optionally filter results for favourites only (optional, default to false)
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter search: (query) Optionally filter by search words partial matching ID, tags, name, and email address (optional)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)
     - parameter tag: (query) Optionally filter by tags (optional)

     - returns: RequestBuilder<PageInboxProjection> 
     */
    open class func getAllInboxesWithRequestBuilder(favourite: Bool? = nil, page: Int? = nil, search: String? = nil, size: Int? = nil, sort: Sort_getAllInboxes? = nil, tag: String? = nil) -> RequestBuilder<PageInboxProjection> {
        let path = "/inboxes/paginated"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "favourite": favourite, 
            "page": page?.encodeToJSON(), 
            "search": search, 
            "size": size?.encodeToJSON(), 
            "sort": sort?.rawValue, 
            "tag": tag
        ])

        let requestBuilder: RequestBuilder<PageInboxProjection>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_getEmails: String { 
        case asc = "ASC"
        case desc = "DESC"
    }

    /**
     Get emails in an Inbox
     
     - parameter inboxId: (path) Id of inbox that emails belongs to 
     - parameter limit: (query) Limit the result set, ordered by received date time sort direction (optional)
     - parameter minCount: (query) Minimum acceptable email count. Will cause request to hang (and retry) until minCount is satisfied or retryTimeout is reached. (optional)
     - parameter retryTimeout: (query) Maximum milliseconds to spend retrying inbox database until minCount emails are returned (optional)
     - parameter since: (query) Exclude emails received before this ISO 8601 date time (optional)
     - parameter sort: (query) Sort the results by received date and direction ASC or DESC (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getEmails(inboxId: UUID, limit: Int? = nil, minCount: Int64? = nil, retryTimeout: Int64? = nil, since: Date? = nil, sort: Sort_getEmails? = nil, completion: @escaping ((_ data: [EmailPreview]?,_ error: Error?) -> Void)) {
        getEmailsWithRequestBuilder(inboxId: inboxId, limit: limit, minCount: minCount, retryTimeout: retryTimeout, since: since, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get emails in an Inbox
     - GET /inboxes/{inboxId}/emails
     - List emails that an inbox has received. Only emails that are sent to the inbox's email address will appear in the inbox. It may take several seconds for any email you send to an inbox's email address to appear in the inbox. To make this endpoint wait for a minimum number of emails use the `minCount` parameter. The server will retry the inbox database until the `minCount` is satisfied or the `retryTimeout` is reached
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ {
  "cc" : [ "cc", "cc" ],
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "attachments" : [ "attachments", "attachments" ],
  "bcc" : [ "bcc", "bcc" ],
  "read" : true,
  "subject" : "subject",
  "from" : "from",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "to" : [ "to", "to" ]
}, {
  "cc" : [ "cc", "cc" ],
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "attachments" : [ "attachments", "attachments" ],
  "bcc" : [ "bcc", "bcc" ],
  "read" : true,
  "subject" : "subject",
  "from" : "from",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "to" : [ "to", "to" ]
} ]}]
     
     - parameter inboxId: (path) Id of inbox that emails belongs to 
     - parameter limit: (query) Limit the result set, ordered by received date time sort direction (optional)
     - parameter minCount: (query) Minimum acceptable email count. Will cause request to hang (and retry) until minCount is satisfied or retryTimeout is reached. (optional)
     - parameter retryTimeout: (query) Maximum milliseconds to spend retrying inbox database until minCount emails are returned (optional)
     - parameter since: (query) Exclude emails received before this ISO 8601 date time (optional)
     - parameter sort: (query) Sort the results by received date and direction ASC or DESC (optional)

     - returns: RequestBuilder<[EmailPreview]> 
     */
    open class func getEmailsWithRequestBuilder(inboxId: UUID, limit: Int? = nil, minCount: Int64? = nil, retryTimeout: Int64? = nil, since: Date? = nil, sort: Sort_getEmails? = nil) -> RequestBuilder<[EmailPreview]> {
        var path = "/inboxes/{inboxId}/emails"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(), 
            "minCount": minCount?.encodeToJSON(), 
            "retryTimeout": retryTimeout?.encodeToJSON(), 
            "since": since?.encodeToJSON(), 
            "sort": sort?.rawValue
        ])

        let requestBuilder: RequestBuilder<[EmailPreview]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get Inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInbox(inboxId: UUID, completion: @escaping ((_ data: Inbox?,_ error: Error?) -> Void)) {
        getInboxWithRequestBuilder(inboxId: inboxId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get Inbox
     - GET /inboxes/{inboxId}
     - Returns an inbox's properties, including its email address and ID.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
}}]
     
     - parameter inboxId: (path) inboxId 

     - returns: RequestBuilder<Inbox> 
     */
    open class func getInboxWithRequestBuilder(inboxId: UUID) -> RequestBuilder<Inbox> {
        var path = "/inboxes/{inboxId}"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Inbox>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_getInboxEmailsPaginated: String { 
        case asc = "ASC"
        case desc = "DESC"
    }

    /**
     Get inbox emails paginated
     
     - parameter inboxId: (path) Id of inbox that emails belongs to 
     - parameter page: (query) Optional page index in inbox emails list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox emails list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInboxEmailsPaginated(inboxId: UUID, page: Int? = nil, size: Int? = nil, sort: Sort_getInboxEmailsPaginated? = nil, completion: @escaping ((_ data: PageEmailPreview?,_ error: Error?) -> Void)) {
        getInboxEmailsPaginatedWithRequestBuilder(inboxId: inboxId, page: page, size: size, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get inbox emails paginated
     - GET /inboxes/{inboxId}/emails/paginated
     - Get a paginated list of emails in an inbox. Does not hold connections open.
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
    "cc" : [ "cc", "cc" ],
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "attachments" : [ "attachments", "attachments" ],
    "bcc" : [ "bcc", "bcc" ],
    "read" : true,
    "subject" : "subject",
    "from" : "from",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "to" : [ "to", "to" ]
  }, {
    "cc" : [ "cc", "cc" ],
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "attachments" : [ "attachments", "attachments" ],
    "bcc" : [ "bcc", "bcc" ],
    "read" : true,
    "subject" : "subject",
    "from" : "from",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "to" : [ "to", "to" ]
  } ],
  "first" : true,
  "empty" : true,
  "totalElements" : 5
}}]
     
     - parameter inboxId: (path) Id of inbox that emails belongs to 
     - parameter page: (query) Optional page index in inbox emails list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox emails list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)

     - returns: RequestBuilder<PageEmailPreview> 
     */
    open class func getInboxEmailsPaginatedWithRequestBuilder(inboxId: UUID, page: Int? = nil, size: Int? = nil, sort: Sort_getInboxEmailsPaginated? = nil) -> RequestBuilder<PageEmailPreview> {
        var path = "/inboxes/{inboxId}/emails/paginated"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(), 
            "size": size?.encodeToJSON(), 
            "sort": sort?.rawValue
        ])

        let requestBuilder: RequestBuilder<PageEmailPreview>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get inbox tags
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInboxTags(completion: @escaping ((_ data: [String]?,_ error: Error?) -> Void)) {
        getInboxTagsWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get inbox tags
     - GET /inboxes/tags
     - Get all inbox tags
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ "", "" ]}]

     - returns: RequestBuilder<[String]> 
     */
    open class func getInboxTagsWithRequestBuilder() -> RequestBuilder<[String]> {
        let path = "/inboxes/tags"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[String]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     List Inboxes / Email Addresses
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInboxes(completion: @escaping ((_ data: [Inbox]?,_ error: Error?) -> Void)) {
        getInboxesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     List Inboxes / Email Addresses
     - GET /inboxes
     - List the inboxes you have created
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

     - returns: RequestBuilder<[Inbox]> 
     */
    open class func getInboxesWithRequestBuilder() -> RequestBuilder<[Inbox]> {
        let path = "/inboxes"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[Inbox]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Send Email
     
     - parameter inboxId: (path) ID of the inbox you want to send the email from 
     - parameter sendEmailOptions: (body) Options for the email (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sendEmail(inboxId: UUID, sendEmailOptions: SendEmailOptions? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        sendEmailWithRequestBuilder(inboxId: inboxId, sendEmailOptions: sendEmailOptions).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Send Email
     - POST /inboxes/{inboxId}
     - Send an email from an inbox's email address.  The request body should contain the `SendEmailOptions` that include recipients, attachments, body etc. See `SendEmailOptions` for all available properties. Note the `inboxId` refers to the inbox's id not the inbox's email address. See https://www.mailslurp.com/guides/ for more information on how to send emails.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter inboxId: (path) ID of the inbox you want to send the email from 
     - parameter sendEmailOptions: (body) Options for the email (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func sendEmailWithRequestBuilder(inboxId: UUID, sendEmailOptions: SendEmailOptions? = nil) -> RequestBuilder<Void> {
        var path = "/inboxes/{inboxId}"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sendEmailOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Set inbox favourited state
     
     - parameter inboxId: (path) inboxId 
     - parameter setInboxFavouritedOptions: (body) setInboxFavouritedOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setInboxFavourited(inboxId: UUID, setInboxFavouritedOptions: SetInboxFavouritedOptions, completion: @escaping ((_ data: Inbox?,_ error: Error?) -> Void)) {
        setInboxFavouritedWithRequestBuilder(inboxId: inboxId, setInboxFavouritedOptions: setInboxFavouritedOptions).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Set inbox favourited state
     - PUT /inboxes/{inboxId}/favourite
     - Set and return new favourite state for an inbox
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
}}]
     
     - parameter inboxId: (path) inboxId 
     - parameter setInboxFavouritedOptions: (body) setInboxFavouritedOptions 

     - returns: RequestBuilder<Inbox> 
     */
    open class func setInboxFavouritedWithRequestBuilder(inboxId: UUID, setInboxFavouritedOptions: SetInboxFavouritedOptions) -> RequestBuilder<Inbox> {
        var path = "/inboxes/{inboxId}/favourite"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: setInboxFavouritedOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Inbox>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Update Inbox
     
     - parameter inboxId: (path) inboxId 
     - parameter updateInboxOptions: (body) updateInboxOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateInbox(inboxId: UUID, updateInboxOptions: UpdateInboxOptions, completion: @escaping ((_ data: Inbox?,_ error: Error?) -> Void)) {
        updateInboxWithRequestBuilder(inboxId: inboxId, updateInboxOptions: updateInboxOptions).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Update Inbox
     - PATCH /inboxes/{inboxId}
     - Update editable fields on an inbox
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "emailAddress" : "emailAddress",
  "name" : "name",
  "description" : "description",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "favourite" : true,
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "expiresAt" : "expiresAt",
  "tags" : [ "tags", "tags" ]
}}]
     
     - parameter inboxId: (path) inboxId 
     - parameter updateInboxOptions: (body) updateInboxOptions 

     - returns: RequestBuilder<Inbox> 
     */
    open class func updateInboxWithRequestBuilder(inboxId: UUID, updateInboxOptions: UpdateInboxOptions) -> RequestBuilder<Inbox> {
        var path = "/inboxes/{inboxId}"
        let inboxIdPreEscape = "\(inboxId)"
        let inboxIdPostEscape = inboxIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{inboxId}", with: inboxIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: updateInboxOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Inbox>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
