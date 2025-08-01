//
//  LoginView.swift
//  UserAuth
//
//  Created by bryson evans on 7/10/25.
//
import SwiftUI
import FirebaseStorage
import FirebaseAuth
struct LoginView: View {
    @State private var email = " "
    @State private var password = " "
    @State private var errormessage = " "
    @State private var isLoggedIn = false
    var body: some View {
        NavigationStack{
            if isLoggedIn {
                ContactView()
            } else {
                Text("Sign In")
                    .font(.title)
                    .padding()
                Text("Email Address")
                TextField("Email Address", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                Text("Password")
                SecureField("***********", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                //                    Button(action: logIn){
                //                        Text("Login")
                //                        Image(systemName: "arrow.right")
                //                    }
                VStack{
                    NavigationLink{
                        ContactView()
                    } label: {
                        Text("Login")
                            .fontWeight(.bold)
                    }
                        Text(errormessage)
                        
                        NavigationLink{
                            SignUpView()
                        } label: {
                            Text("Don't have an Account")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                    }
                
            }
        }
    }
        func logIn(){
            Auth.auth().signIn(withEmail: email,password:
                                password) {authResult, error in
                if let error = error{
                    errormessage = error.localizedDescription
                } else {
                    isLoggedIn = true
                }
            }
        }
    }

    #Preview {
        LoginView()
    }
    
    

