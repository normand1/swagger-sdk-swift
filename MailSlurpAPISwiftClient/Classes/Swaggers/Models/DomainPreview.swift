//
// DomainPreview.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Preview object for domain entity */

public struct DomainPreview: Codable {

    public var createdAt: Date
    public var domain: String
    public var _id: UUID

    public init(createdAt: Date, domain: String, _id: UUID) {
        self.createdAt = createdAt
        self.domain = domain
        self._id = _id
    }

    public enum CodingKeys: String, CodingKey { 
        case createdAt
        case domain
        case _id = "id"
    }


}

