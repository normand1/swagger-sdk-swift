//
// WebhookTestRequest.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct WebhookTestRequest: Codable {

    public enum Method: String, Codable { 
        case _get = "GET"
        case head = "HEAD"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
        case options = "OPTIONS"
        case trace = "TRACE"
    }
    public var headers: [String:String]
    public var method: Method
    public var payload: String?
    public var url: String

    public init(headers: [String:String], method: Method, payload: String?, url: String) {
        self.headers = headers
        self.method = method
        self.payload = payload
        self.url = url
    }


}

