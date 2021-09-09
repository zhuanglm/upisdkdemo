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
    @Published var mReference: String = ""
    @Published var mIsLoading = false
    @Published var mIsPresentAlert = false
    
    public var mErrorMsg: Response<ErrorMessage>? = nil
    
//    private func handleErrorMsg(exception: Error)-> ErrorMessage {
//            var errorMessage: ErrorMessage
//            exception.response()?.let { response ->
//                response.errorBody()?.let { errorMsg ->
//                    JSONObject(errorMsg.string()).let {
//                        errorMessage = GsonBuilder().create().fromJson(
//                            it.getJSONObject("data").toString(),
//                            ErrorMessage::class.java
//                        )
//                    }
//                }
//            }
//            return errorMessage
//        }
    
    func getAccessToken() {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<RequestApi>(plugins: [networkLogger])
        
        self.mIsLoading = true
        provider.request(.accessToken) { (result) in
            self.mIsLoading = false
            
            switch result {
            case .success(let response):
                // Parsing the data:
                let decoder = JSONDecoder()
                do {
                    let parsedData = try decoder.decode(Response<AccessToken>.self, from: response.data)
                    
                    if (parsedData.status == "success") {
                        self.mAccessToken = parsedData.data.access_token
                    }
                } catch {
                    self.mErrorMsg = try! decoder.decode(Response<ErrorMessage>.self, from: response.data)
                    
                    if (self.mErrorMsg?.status == "fail") {
                        self.mIsPresentAlert = true
                    }
                }
                
//                do {
//                    let any = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments)
//                    guard let obj = any as? [String: Any] else {
//                        return
//                    }
//                    
//                    
//                    
//                } catch {
//                    print(error)
//                }
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    func getChargeToken() {
        
    }
    
    func getReference() -> Void {
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
