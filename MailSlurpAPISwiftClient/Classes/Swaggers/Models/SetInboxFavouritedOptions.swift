//
// SetInboxFavouritedOptions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Options for setting inbox favourite state */

public struct SetInboxFavouritedOptions: Codable {

    /** Should the inbox be favourited? */
    public var state: Bool?

    public init(state: Bool?) {
        self.state = state
    }


}

