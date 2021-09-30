//
//  Response.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-09.
//

import Foundation

class CitconApiResponse<T: Codable>: Codable {
    let status: String
    let app: String
    let version: String
    let data: T
}

class ErrorMessage : Codable {
    let code: String
    let message: String
}

class AccessToken: Codable {
    let access_token: String
    let token_type: String?
    let expiry: UInt
    let permission: Array<String>?
}

class ChargeToken: Codable {
    let object: String
    let charge_token: String
    let id: String
    let reference: String
    let amount: Int
    let currency: String
    let time_created: Int
    let time_captured: Int?
    let status: String?
    let country: String?
}
