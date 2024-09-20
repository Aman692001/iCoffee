//
//  LoginView.swift
//  iCoffee
//
//  Created by Aman on 18/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignup = false
    @State var showingFinishReg = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State var password = ""
    @State var repeatPasswoed = ""
    
    
    var body: some View {
        
        VStack {
            
            Text("Sign In")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.bottom , .top], 20)
            
            
            VStack (alignment: .leading) {
                
                VStack (alignment: .leading) {
                    
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    TextField("Enter your email", text: $email)
                    Divider()
                    
                    
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    SecureField("Enter your password", text: $password)
                    Divider()
                    
                    if showingSignup {
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        SecureField("Repeat password", text: $repeatPasswoed)
                        Divider()
                    }
                    
                    
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.1))
                // End of Vstack
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.resetPassword()
                    }, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    })
                }//end of Hstack
                
            }.padding(.horizontal, 6)
            // end of Vstack
            
            Button(action: {
                
                self.showingSignup ? self.signUpUser() : self.loginUser()
                
            }, label: {
                Text(showingSignup ? "Sign Up" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            })// end of Button
                .background(Color.blue)
                .clipShape(Capsule())
                .padding(.top, 45)
            
            SignUpView(showingSignup: $showingSignup)
            
        }//end of Vstack
        .sheet(isPresented: $showingFinishReg) {
            FinishRegistrationView()
        }
        
    }// end of body
    
    private func loginUser() {
        
        if email != "" && password != "" {
            
            FUser.loginUserWith(email: email, password: password) { error, isEmailVerified in
                
                if error != nil {
                    
                    print("error loging in the user: ", error!.localizedDescription)
                    return
                }
                
                if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingFinishReg.toggle()
                }
                
            }
        }
        
    }
    
    private func signUpUser() {
        
        if email != "" && password != "" && repeatPasswoed != "" {
            if password == repeatPasswoed {
                
                FUser.registerUserWith(email: email, password: password) { (error) in
                    if error != nil {
                        print("Error registering user: ", error!.localizedDescription)
                    }
                    print("user has been created")
                    //go back tp app
                    //chack if user onboarding is done
                }
                
            } else {
                
                print("password dont match")
            }
        
            
        } else {
            print("Email and password must be set")
        }
    }
    
    private func resetPassword() {
        
        if email != "" {
            FUser.resetPassword(email: email) { error in
                if error != nil {
                    print("error sending reset password, ", error!.localizedDescription)
                    return
                }
                print("please chack you email")
            }
        } else {
            //notify the suer
            print("email is empty")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
.previewInterfaceOrientation(.portrait)
    }
}



struct SignUpView : View {
    
    @Binding var showingSignup: Bool
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack(spacing: 8) {
                
                Text("Don't have an Account?")
                    .foregroundColor(Color.gray.opacity(0.5))
                
                Button(action: {
                    
                    self.showingSignup.toggle()
                    
                }, label: {
                    Text("Sign Up")
                })
                    .foregroundColor(.blue)
            }//end of Hstack
            .padding(.top, 25)
        }// end of Vstack
        
    }
    
}
