//
// GroupContactsDto.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct GroupContactsDto: Codable {

    public var contacts: [ContactDto]
    public var group: GroupDto

    public init(contacts: [ContactDto], group: GroupDto) {
        self.contacts = contacts
        self.group = group
    }


}
