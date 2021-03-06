//
// DomainDto.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Domain plus verification records and status */

public struct DomainDto: Codable {

    public var createdAt: Date
    public var domain: String
    public var _id: UUID
    public var isVerified: Bool
    public var updatedAt: Date
    public var userId: UUID
    public var verificationToken: String

    public init(createdAt: Date, domain: String, _id: UUID, isVerified: Bool, updatedAt: Date, userId: UUID, verificationToken: String) {
        self.createdAt = createdAt
        self.domain = domain
        self._id = _id
        self.isVerified = isVerified
        self.updatedAt = updatedAt
        self.userId = userId
        self.verificationToken = verificationToken
    }

    public enum CodingKeys: String, CodingKey { 
        case createdAt
        case domain
        case _id = "id"
        case isVerified
        case updatedAt
        case userId
        case verificationToken
    }


}

