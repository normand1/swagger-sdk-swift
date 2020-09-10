//
// CreateWebhookOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Options for creating a webhook. Webhooks can be attached to inboxes and MailSlurp will POST a webhook payload to the URL specified whenever the inbox receives an email. Webhooks are great for processing many inbound emails. */

public struct CreateWebhookOptions: Codable {

    /** Optional basic authentication that MailSlurp should use when calling the URL. For instance if your URL is https://example.com then basic auth will call a URL like https://{username}@{password}:example.com */
    public var basicAuth: BasicAuthOptions?
    /** Optional name for the webhook */
    public var name: String?
    /** Public URL on your server that MailSlurp can post WebhookNotification payload to when an email is received. The payload of the submitted JSON is described by https://api.mailslurp.com/schemas/webhook-payload */
    public var url: String?

    public init(basicAuth: BasicAuthOptions?, name: String?, url: String?) {
        self.basicAuth = basicAuth
        self.name = name
        self.url = url
    }


}

