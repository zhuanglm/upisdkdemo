//
//  ContentView.swift
//  upisdkdemo
//
//  Created by Raymond Zhuang on 2021-09-07.
//

import SwiftUI

struct paymentMethods: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                
            }) {
                Text("credit_card")
                    .font(.body)
                    .padding(.vertical, 10)
            }
            
            Button(action: {
                
            }) {
                Text("paypal")
                    .font(.body)
                    .padding(.vertical, 10)
            }
            
            Button(action: {
                
            }) {
                Text("venmo")
                    .font(.body)
                    .padding(.vertical, 10)
            }
        }
    }
    
}

struct ContentView: View {
    @StateObject var mViewModel = ViewModel()
    @State private var mConsumerID = "115646448"
    @State var mIs3DS = false
    //@State private var mIsShowingAlert = false
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                TextField("consumer_id", text: $mConsumerID)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding([.leading, .trailing], 25)
                    .padding([.bottom], 15)
                
                Toggle(isOn: $mIs3DS) {
                    Text("threeds")
                }
                
                Button(action: {
                    mViewModel.getAccessToken()
                }) {
                    Text("new_payment")
                        .font(.body)
                        .padding(.horizontal, 60.0)
                        .padding(.vertical, 8.0)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }.alert(isPresented: $mViewModel.mIsPresentAlert, content: {
                    Alert(title: Text(mViewModel.mErrorMsg?.status ?? "loading"), message: Text("\(mViewModel.mErrorMsg?.data.message ?? "") -- \(mViewModel.mErrorMsg?.data.code ?? "")"), dismissButton: .default(Text("OK")))
                })
            }
            
            if(mViewModel.mIsLoading) {
                ProgressView("loading")
            }
            
            Group {
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
                    Text(LocalizedStringKey("reference"))
                        .font(.body)
                    Text(mViewModel.mReference)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    Text("charge_token")
                        .font(.body)
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
                Text(mViewModel.mChargeToken)
                    .font(.body)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.leading)
            }
            
            Divider()
            Group {
                Spacer()
                
                if(mViewModel.mChargeToken.count > 1) {
                    paymentMethods()
                }
                
                Spacer()
            }
        }
        .padding(.all)
        .onAppear {
            print("ContentView appeared!")
        }.onDisappear {
            print("ContentView disappeared!")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.locale, .init(identifier: "zh"))
        }
    }
}
