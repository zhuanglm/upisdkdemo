//
//  Response.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-09.
//

import Foundation

public class Response<T: Codable>: Codable {
    let status: String
    let app: String
    let version: String
    let data: T
}

public class ErrorMessage : Codable {
    let code: String
    let message: String
}

public class AccessToken: Codable {
    let access_token: String
    let token_type: String?
    let expiry: UInt
    let permission: Array<String>?
}
