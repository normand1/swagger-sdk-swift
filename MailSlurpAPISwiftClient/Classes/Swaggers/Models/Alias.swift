//
// Alias.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Alias: Codable {

    public var createdAt: Date
    public var emailAddress: String
    public var _id: UUID?
    public var inboxId: UUID?
    public var name: String?
    public var proxied: Bool?
    public var updatedAt: Date
    public var userId: UUID?

    public init(createdAt: Date, emailAddress: String, _id: UUID?, inboxId: UUID?, name: String?, proxied: Bool?, updatedAt: Date, userId: UUID?) {
        self.createdAt = createdAt
        self.emailAddress = emailAddress
        self._id = _id
        self.inboxId = inboxId
        self.name = name
        self.proxied = proxied
        self.updatedAt = updatedAt
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey { 
        case createdAt
        case emailAddress
        case _id = "id"
        case inboxId
        case name
        case proxied
        case updatedAt
        case userId
    }


}

