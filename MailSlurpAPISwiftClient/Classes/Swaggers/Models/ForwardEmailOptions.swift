//
// ForwardEmailOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Options for forwarding an email */

public struct ForwardEmailOptions: Codable {

    /** Optional bcc recipients */
    public var bcc: [String]?
    /** Optional cc recipients */
    public var cc: [String]?
    /** Subject for forwarded email */
    public var subject: String?
    /** To recipients for forwarded email */
    public var to: [String]?

    public init(bcc: [String]?, cc: [String]?, subject: String?, to: [String]?) {
        self.bcc = bcc
        self.cc = cc
        self.subject = subject
        self.to = to
    }


}

