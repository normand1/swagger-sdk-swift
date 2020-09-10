//
// WebhookProjection.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Representation of a webhook */

public struct WebhookProjection: Codable {

    public var createdAt: Date
    public var _id: UUID
    public var inboxId: UUID
    public var name: String?
    public var updatedAt: Date
    public var url: String

    public init(createdAt: Date, _id: UUID, inboxId: UUID, name: String?, updatedAt: Date, url: String) {
        self.createdAt = createdAt
        self._id = _id
        self.inboxId = inboxId
        self.name = name
        self.updatedAt = updatedAt
        self.url = url
    }

    public enum CodingKeys: String, CodingKey { 
        case createdAt
        case _id = "id"
        case inboxId
        case name
        case updatedAt
        case url
    }


}

