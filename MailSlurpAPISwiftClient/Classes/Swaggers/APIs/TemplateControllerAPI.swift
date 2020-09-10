//
// TemplateControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class TemplateControllerAPI {
    /**
     Create a Template
     
     - parameter createTemplateOptions: (body) createTemplateOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createTemplate(createTemplateOptions: CreateTemplateOptions, completion: @escaping ((_ data: TemplateDto?,_ error: Error?) -> Void)) {
        createTemplateWithRequestBuilder(createTemplateOptions: createTemplateOptions).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Create a Template
     - POST /templates
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "variables" : [ {
    "variableType" : "STRING",
    "name" : "name"
  }, {
    "variableType" : "STRING",
    "name" : "name"
  } ],
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "content" : "content"
}}]
     
     - parameter createTemplateOptions: (body) createTemplateOptions 

     - returns: RequestBuilder<TemplateDto> 
     */
    open class func createTemplateWithRequestBuilder(createTemplateOptions: CreateTemplateOptions) -> RequestBuilder<TemplateDto> {
        let path = "/templates"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createTemplateOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<TemplateDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete Template
     
     - parameter templateId: (path) TemplateId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteTemplate(templateId: UUID, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteTemplateWithRequestBuilder(templateId: templateId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete Template
     - DELETE /templates/{TemplateId}
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter templateId: (path) TemplateId 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteTemplateWithRequestBuilder(templateId: UUID) -> RequestBuilder<Void> {
        var path = "/templates/{TemplateId}"
        let templateIdPreEscape = "\(templateId)"
        let templateIdPostEscape = templateIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{TemplateId}", with: templateIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter sort
     */
    public enum Sort_getAllTemplates: String { 
        case asc = "ASC"
        case desc = "DESC"
    }

    /**
     Get all Templates in paginated format
     
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllTemplates(page: Int? = nil, size: Int? = nil, sort: Sort_getAllTemplates? = nil, completion: @escaping ((_ data: PageTemplateProjection?,_ error: Error?) -> Void)) {
        getAllTemplatesWithRequestBuilder(page: page, size: size, sort: sort).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get all Templates in paginated format
     - GET /templates/paginated
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
    "variables" : [ "variables", "variables" ],
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "updatedAt" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "createdAt" : "2000-01-23T04:56:07.000+00:00",
    "variables" : [ "variables", "variables" ],
    "name" : "name",
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "updatedAt" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "first" : true,
  "empty" : true,
  "totalElements" : 5
}}]
     
     - parameter page: (query) Optional page index in inbox list pagination (optional, default to 0)
     - parameter size: (query) Optional page size in inbox list pagination (optional, default to 20)
     - parameter sort: (query) Optional createdAt sort direction ASC or DESC (optional, default to ASC)

     - returns: RequestBuilder<PageTemplateProjection> 
     */
    open class func getAllTemplatesWithRequestBuilder(page: Int? = nil, size: Int? = nil, sort: Sort_getAllTemplates? = nil) -> RequestBuilder<PageTemplateProjection> {
        let path = "/templates/paginated"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(), 
            "size": size?.encodeToJSON(), 
            "sort": sort?.rawValue
        ])

        let requestBuilder: RequestBuilder<PageTemplateProjection>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get Template
     
     - parameter templateId: (path) TemplateId 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTemplate(templateId: UUID, completion: @escaping ((_ data: TemplateDto?,_ error: Error?) -> Void)) {
        getTemplateWithRequestBuilder(templateId: templateId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get Template
     - GET /templates/{TemplateId}
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "variables" : [ {
    "variableType" : "STRING",
    "name" : "name"
  }, {
    "variableType" : "STRING",
    "name" : "name"
  } ],
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "content" : "content"
}}]
     
     - parameter templateId: (path) TemplateId 

     - returns: RequestBuilder<TemplateDto> 
     */
    open class func getTemplateWithRequestBuilder(templateId: UUID) -> RequestBuilder<TemplateDto> {
        var path = "/templates/{TemplateId}"
        let templateIdPreEscape = "\(templateId)"
        let templateIdPostEscape = templateIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{TemplateId}", with: templateIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<TemplateDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get all Templates
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTemplates(completion: @escaping ((_ data: [TemplateProjection]?,_ error: Error?) -> Void)) {
        getTemplatesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get all Templates
     - GET /templates
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "variables" : [ "variables", "variables" ],
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}, {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "variables" : [ "variables", "variables" ],
  "name" : "name",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
} ]}]

     - returns: RequestBuilder<[TemplateProjection]> 
     */
    open class func getTemplatesWithRequestBuilder() -> RequestBuilder<[TemplateProjection]> {
        let path = "/templates"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[TemplateProjection]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
