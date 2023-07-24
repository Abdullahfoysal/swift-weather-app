//
//  FormUI.swift
//  swiftUI-weather
//
//  Created by Foysal on 7/12/23.
//

import SwiftUI

struct FormUI: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var date = Date()
    @State private var shouldSendNewsletter: Bool = false
    @State private var numberOfLikes: Int = 1
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: Text("Personal Information")){
                    TextField("First Name",text: $firstName)
                    TextField("Last Name",text: $lastName)
                    DatePicker("Birthdate",selection: $date, displayedComponents: .date)
                }
                Section(header: Text("Actions")){
                    Toggle("Send NewsLetter",isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    
                    Stepper("Number of Likes k",value: $numberOfLikes, in: 1...100)
                        .padding(.all)
                        
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service",destination: URL(string: "https://google.com")!)
                }
                
            }
             .navigationTitle("Account")
             .toolbar {
                 ToolbarItemGroup(placement: .navigationBarTrailing) {
                     Button {
                         hideKeyboard()
                     }label: {
                         Image(systemName: "keyboard.chevron.compact.down")
                     }
                     Button {
                         print("SAVE data")
                     }label: {
                         Text("Save")
                     }
                 }
             }.accentColor(.red)
                
               
            
        }
       
        
       
    }
}

struct FormUI_Previews: PreviewProvider {
    static var previews: some View {
        FormUI()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



