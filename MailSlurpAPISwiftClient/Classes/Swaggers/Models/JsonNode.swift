//
// JsonNode.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct JsonNode: Codable {

    public enum NodeType: String, Codable { 
        case array = "ARRAY"
        case binary = "BINARY"
        case boolean = "BOOLEAN"
        case missing = "MISSING"
        case null = "NULL"
        case number = "NUMBER"
        case object = "OBJECT"
        case pojo = "POJO"
        case string = "STRING"
    }
    public var array: Bool?
    public var bigDecimal: Bool?
    public var bigInteger: Bool?
    public var binary: Bool?
    public var boolean: Bool?
    public var containerNode: Bool?
    public var double: Bool?
    public var empty: Bool?
    public var float: Bool?
    public var floatingPointNumber: Bool?
    public var int: Bool?
    public var integralNumber: Bool?
    public var long: Bool?
    public var missingNode: Bool?
    public var nodeType: NodeType?
    public var null: Bool?
    public var number: Bool?
    public var object: Bool?
    public var pojo: Bool?
    public var short: Bool?
    public var textual: Bool?
    public var valueNode: Bool?

    public init(array: Bool?, bigDecimal: Bool?, bigInteger: Bool?, binary: Bool?, boolean: Bool?, containerNode: Bool?, double: Bool?, empty: Bool?, float: Bool?, floatingPointNumber: Bool?, int: Bool?, integralNumber: Bool?, long: Bool?, missingNode: Bool?, nodeType: NodeType?, null: Bool?, number: Bool?, object: Bool?, pojo: Bool?, short: Bool?, textual: Bool?, valueNode: Bool?) {
        self.array = array
        self.bigDecimal = bigDecimal
        self.bigInteger = bigInteger
        self.binary = binary
        self.boolean = boolean
        self.containerNode = containerNode
        self.double = double
        self.empty = empty
        self.float = float
        self.floatingPointNumber = floatingPointNumber
        self.int = int
        self.integralNumber = integralNumber
        self.long = long
        self.missingNode = missingNode
        self.nodeType = nodeType
        self.null = null
        self.number = number
        self.object = object
        self.pojo = pojo
        self.short = short
        self.textual = textual
        self.valueNode = valueNode
    }


}
