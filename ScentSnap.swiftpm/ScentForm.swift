//
//  ScentForm.swift
//  ScentSnap
//
//  Created by 박리라 on 2023/04/16.
//

import SwiftUI

struct ScentForm: View {
    @Binding var scents: [ScentData]
    @Environment (\.presentationMode) var presentationMode
    @State private var isShowingImagePicker = false
    @State private var image: UIImage? = nil
    @State private var name = ""
    @State private var description = ""
    @State private var location = ""
    @State private var slider1 = 0.0
    @State private var slider2 = 0.0
    @State private var slider3 = 0.0
    
    var body: some View {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter name of the scent", text: $name)
                }
                Section(header: Text("Description")) {
                    TextField("Enter description", text: $description)
                }
                Section(header: Text("location")) {
                    TextField("Enter location", text: $location)
                }
                Section(header: Text("Feeling1")) {
                    Slider(value: $slider1)
                }
                Section(header: Text("Feeling2")) {
                    Slider(value: $slider2)
                }
                Section(header: Text("Feeling3")) {
                    Slider(value: $slider3)
                }
                Section(header: Text("Image")) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    } else {
                        Text("No image selected")
                    }
                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Text("Choose Image")
                    }
                }
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(image: $image)
                }

                Button(action: addContact) {
                    Text("Add Scent")
                }
            }
    }
    
    private func addContact() {
        let imageData = image?.jpegData(compressionQuality: 1.0)
        let newScent = ScentData(name: name, description: description, location: location, slider1: slider1, slider2: slider2, slider3: slider3)
        scents.append(newScent)
        presentationMode.wrappedValue.dismiss()
    }
}


/*
import SwiftUI

struct ContactForm: View {
    @Binding var contacts: [Contact]
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var description = ""
    @State private var sliderValue = 0.5
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter name", text: $name)
                }
                Section(header: Text("Phone Number")) {
                    TextField("Enter phone number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                Section(header: Text("Description")) {
                    TextField("Enter description", text: $description)
                }
                Section(header: Text("Slider Value")) {
                    Slider(value: $sliderValue)
                }
                Button(action: addContact) {
                    Text("Add Contact")
                }
            }
            .navigationTitle("Add Contact")
        }
    }
    
    private func addContact() {
        let newContact = Contact(name: name, phoneNumber: phoneNumber, description: description, sliderValue: sliderValue)
        contacts.append(newContact)
        presentationMode.wrappedValue.dismiss()
    }

}
*/
