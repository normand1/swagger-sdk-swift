//
// WebhookTestResponse.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct WebhookTestResponse: Codable {

    public var message: String?
    public var statusCode: Int?

    public init(message: String?, statusCode: Int?) {
        self.message = message
        self.statusCode = statusCode
    }


}
