//
//  FinishRegistrationView.swift
//  iCoffee
//
//  Created by Aman on 18/05/23.
//

import SwiftUI

struct FinishRegistrationView: View {
    
    @State var name = ""
    @State var surname = ""
    @State var telephone = ""
    @State var address = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            
            Section() {
                
                Text("Finish Registration")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.top, .bottom], 20)
                
                TextField("Name", text: $name)
                TextField("Surname", text: $surname)
                TextField("Telephone", text: $telephone)
                TextField("Address", text: $address)
            } // end of section
            
            Section() {
                
                Button(action: {
                    self.finishRegistration()
                }, label: {
                    Text("Finish Registration")
                })
            }.disabled(!self.fieldsCompleted())
            //end of section
            
            
        }//end of form
    }//end of body
    
    private func fieldsCompleted() -> Bool {
        
        return self.name != "" && self.surname != "" && self.telephone != "" && self.address != ""
        
    }
    
    private func finishRegistration() {
        
        let fullName = name + " " + surname
        
        updateCurrentUser(withValues: [kFIRSTNAME : name, kLASTNAME : surname, kFULLNAME : fullName,
             kFULLADDRESS : address, kPHONENUMBER : telephone, kONBOARD : true]) { (error) in
            
            if error != nil {
                
                print("error update user: ", error!.localizedDescription)
                return
            }
            
            self.presentationMode.wrappedValue.dismiss()
            
        }
        
    }
}

struct FinishRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationView()
    }
}
