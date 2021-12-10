//
//  LoginView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 01/12/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        VStack {
            signInGoogle
            signInFacebook
        }.padding()
    }
    
    func handleLoginGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else {
                    return
                }
                
                print(user.displayName ?? "")
            }
        }
    }
    
    func handleLoginFacebook(){
        
    }
}

extension LoginView {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
    var signInGoogle: some View {
        HStack {
            
            Button(action: {
                handleLoginGoogle()
            }, label: {
                
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                
                Text("Sign In with Google")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.red)
                    .kerning(1.1)
            }).padding()
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red, lineWidth: 2)
                .opacity(0.5)
        )
        
    }
    
    var signInFacebook: some View {
        HStack {
            Button(action: {
                handleLoginFacebook()
            }, label: {
                
                Image("facebook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                
                Text("Sign In with Facebook")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.red)
                    .kerning(1.1)
            }).padding()
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.red, lineWidth: 2)
                .opacity(0.5)
        )
    }
}
