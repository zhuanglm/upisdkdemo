//
//  ContentView.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mViewModel = ViewModel()
    @State private var mConsumerID = "115646448"
    @State var mIs3DS = false
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("consumer_id", text: $mConsumerID)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Toggle(isOn: $mIs3DS) {
                Text("threeds")
            }
            
            Button(action: {
                mViewModel.getReference()
                mViewModel.mAccessToken = mConsumerID
            }) {
                Text("new_payment")
                    .font(.body)
                    .padding(.horizontal, 60.0)
                    .padding(.vertical, 8.0)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
            
            
            HStack {
                Text("access_token")
                    .font(.body)
                Spacer()
            }
    
            Text(mViewModel.mAccessToken)
                .font(.body)
                .foregroundColor(.green)
                .multilineTextAlignment(.leading)
            
            HStack {
                Text("charge_token")
                    .font(.body)
                Text(mViewModel.mAccessToken)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            
            HStack {
                Text(LocalizedStringKey("reference"))
                    .font(.body)
                Text(mViewModel.mReference)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.all)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.locale, .init(identifier: "zh"))
        }
    }
}
