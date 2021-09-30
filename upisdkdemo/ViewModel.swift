//
//  ViewModel.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-08.
//

import Foundation
import Moya

class ViewModel: ObservableObject {
    @Published var mAccessToken: String = ""
    @Published var mChargeToken: String = ""
    @Published var mReference: String = ""
    @Published var mIsLoading = false
    @Published var mIsPresentAlert = false
    
    var mErrorMsg: CitconApiResponse<ErrorMessage>? = nil
    let mDecoder = JSONDecoder()
    
    func getAccessToken() {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<RequestApi>(plugins: [networkLogger])
        
        self.mIsLoading = true
        provider.request(.accessToken) { (result) in
            switch result {
            case .success(let response):
                // Parsing the data:
                do {
                    let parsedData = try self.mDecoder.decode(CitconApiResponse<AccessToken>.self, from: response.data)
                    
                    if (parsedData.status == "success") {
                        self.mAccessToken = parsedData.data.access_token
                        self.getReference()
                        self.getChargeToken(provider)
                    }
                } catch {
                    self.mIsLoading = false
                    self.mErrorMsg = try! self.mDecoder.decode(CitconApiResponse<ErrorMessage>.self, from: response.data)
                    
                    if (self.mErrorMsg?.status == "fail") {
                        self.mIsPresentAlert = true
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    private func getChargeToken(_ provider: MoyaProvider<RequestApi>) {
        provider.request(.chargeToken(self.mAccessToken, self.mReference)) { (result) in
            self.mIsLoading = false
            switch result {
            case .success(let response):
                // Parsing the data:
                do {
                    let parsedData = try self.mDecoder.decode(CitconApiResponse<ChargeToken>.self, from: response.data)
                    
                    if (parsedData.status == "success") {
                        self.mChargeToken = parsedData.data.charge_token
                    }
                } catch {
                    //print(error)
                    self.mErrorMsg = try! self.mDecoder.decode(CitconApiResponse<ErrorMessage>.self, from: response.data)

                    if (self.mErrorMsg?.status == "fail") {
                        self.mIsPresentAlert = true
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    private func getReference() -> Void {
        mReference = randomString(10)
        
    }
    
    private func randomString(_ length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
}
