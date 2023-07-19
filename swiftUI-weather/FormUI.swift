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
    var body: some View {
       
        Form {
            Section(header: Text("Personal Information")){
                TextField("First Name",text: $firstName)
                TextField("Last Name",text: $lastName)
                DatePicker("Birthdate",selection: $date, displayedComponents: .date)
            }
            Section(header: Text("Actions")){
                Toggle("Send NewsLetter",isOn: $shouldSendNewsletter)
            }
            
        }
       
    }
}

struct FormUI_Previews: PreviewProvider {
    static var previews: some View {
        FormUI()
    }
}
