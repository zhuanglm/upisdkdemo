//
//  ViewModel.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-08.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var mAccessToken: String = ""
    @Published var mReference: String = ""
    
    func getAccessToken() {
        
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
