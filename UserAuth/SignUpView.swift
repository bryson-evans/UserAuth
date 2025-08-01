//
//  SignUpView.swift
//  UserAuth
//
//  Created by bryson evans on 7/10/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct SignUpView: View {
  @State private var email = " "
  @State private var password = " "
  @State private var errormessage = " "
  @State private var signUpSuccessfull = false
  var body: some View {
    NavigationStack{
      if signUpSuccessfull {
        LoginView()
      } else {
        Text("Sign Up")
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
        Button(action: signUp){
          Text("Sign Up")
          Image(systemName: "arrow.right")
        }
        Text(errormessage)
        NavigationLink{
          LoginView()
        } label: {
          Text("Already have an Account")
          Text("Login")
            .fontWeight(.bold)
        }
      }
    }
  }
  func signUp(){
    Auth.auth().createUser(withEmail: email,password:
              password) {authResult, error in
      if let error = error{
        errormessage = error.localizedDescription
      } else {
        signUpSuccessfull = true
        if let user = authResult?.user{
          let db = Firestore.firestore()
          db.collection("users").document(user.uid).setData(
            ["email":user.email ?? " ", "uid": user.uid]) {error in
              if error != nil {
                errormessage = "Error Saving user"
            } else {
                errormessage = "User Signed Up Successfully "
              }
          }
        }
      }
    }
  }
}
#Preview {
  SignUpView()
}
