//
//  MoyaClient.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-08.
//

import Foundation
import Moya

public enum RequestApi {
    //  UserApi
    //case login(loginName: String, password: String)
    case accessToken
    case chargeToken
    
}

extension RequestApi: TargetType {
    public var task: Task {
        switch self {
        case .accessToken:
            return .requestParameters(parameters: ["token_type": "client"], encoding: JSONEncoding.default)
        case .chargeToken:
            return .requestPlain
        }
    }
    
    public var baseURL: URL {
        return URL(string: "https://api.qa01.citconpay.com/v1/")!
    }
    
    public var path: String {
        switch self {
        case .accessToken:
            return "access-tokens"
        case .chargeToken:
            return "charges"
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var headers: [String : String]? {
        return ["Authorization": "Bearer braintree--", "Content-Type": "application/json"]
    }
    
    
}


