//
// DomainControllerAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DomainControllerAPI {
    /**
     Create Domain
     
     - parameter domainOptions: (body) domainOptions 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createDomain(domainOptions: CreateDomainOptions, completion: @escaping ((_ data: DomainDto?,_ error: Error?) -> Void)) {
        createDomainWithRequestBuilder(domainOptions: domainOptions).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Create Domain
     - POST /domains
     - Link a domain that you own with MailSlurp so you can create email addresses using it. Endpoint returns DNS records used for validation. You must add these verification records to your host provider's DNS setup to verify the domain.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "isVerified" : true,
  "domain" : "domain",
  "verificationToken" : "verificationToken",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter domainOptions: (body) domainOptions 

     - returns: RequestBuilder<DomainDto> 
     */
    open class func createDomainWithRequestBuilder(domainOptions: CreateDomainOptions) -> RequestBuilder<DomainDto> {
        let path = "/domains"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: domainOptions)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<DomainDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Delete a domain
     
     - parameter _id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteDomain(_id: UUID, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteDomainWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Delete a domain
     - DELETE /domains/{id}
     - Delete a domain. This will disable any existing inboxes that use this domain.
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     
     - parameter _id: (path) id 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteDomainWithRequestBuilder(_id: UUID) -> RequestBuilder<Void> {
        var path = "/domains/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get a domain
     
     - parameter _id: (path) id 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDomain(_id: UUID, completion: @escaping ((_ data: DomainDto?,_ error: Error?) -> Void)) {
        getDomainWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get a domain
     - GET /domains/{id}
     - Returns domain verification status and tokens for a given domain
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example={
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "isVerified" : true,
  "domain" : "domain",
  "verificationToken" : "verificationToken",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "userId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
  "updatedAt" : "2000-01-23T04:56:07.000+00:00"
}}]
     
     - parameter _id: (path) id 

     - returns: RequestBuilder<DomainDto> 
     */
    open class func getDomainWithRequestBuilder(_id: UUID) -> RequestBuilder<DomainDto> {
        var path = "/domains/{id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<DomainDto>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Get domains
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDomains(completion: @escaping ((_ data: [DomainPreview]?,_ error: Error?) -> Void)) {
        getDomainsWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get domains
     - GET /domains
     - List all custom domains you have created
     - API Key:
       - type: apiKey x-api-key 
       - name: API_KEY
     - examples: [{contentType=application/json, example=[ {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "domain" : "domain",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91"
}, {
  "createdAt" : "2000-01-23T04:56:07.000+00:00",
  "domain" : "domain",
  "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91"
} ]}]

     - returns: RequestBuilder<[DomainPreview]> 
     */
    open class func getDomainsWithRequestBuilder() -> RequestBuilder<[DomainPreview]> {
        let path = "/domains"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[DomainPreview]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
