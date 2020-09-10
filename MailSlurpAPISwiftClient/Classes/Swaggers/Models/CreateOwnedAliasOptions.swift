//
// CreateOwnedAliasOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Create email alias options. Email aliases can be used to mask real email addresses behind an ID. You can also attach an inbox to an alias so that any email received by the inbox email address if forwarded to the alias email address. */

public struct CreateOwnedAliasOptions: Codable {

    /** Email address to be hidden behind alias */
    public var emailAddress: String?
    /** Optional inbox ID to attach to alias. Emails received by this inbox will be forwarded to the alias email address */
    public var inboxId: UUID?
    /** Optional name for alias */
    public var name: String?
    /** Optional proxied flag. When proxied is true alias will forward the incoming emails to the aliased email address via a proxy inbox. A new proxy is created for every new email thread. By replying to the proxy you can correspond with using your email alias without revealing your real email address. */
    public var proxied: Bool?

    public init(emailAddress: String?, inboxId: UUID?, name: String?, proxied: Bool?) {
        self.emailAddress = emailAddress
        self.inboxId = inboxId
        self.name = name
        self.proxied = proxied
    }


}

