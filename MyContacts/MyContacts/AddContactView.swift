
import SwiftUI
import PhotosUI
import CoreImage


struct AddContactView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    @State private var name = ""
    @State private var number = ""
    @State private var notes = ""
    @State private var photoData: Data?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    PhotosPicker(selection: $selectedItem) {
                        if let processedImage {
                            processedImage
                                .resizable()
                                .scaledToFit()
                        } else {
                            ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import photo"))
                        }
                    }
                    .buttonStyle(.plain)
                    .onChange(of: selectedItem, loadImage)
                }
                
                Section("Contact details ") {
                    TextField("Name", text: $name)
                    TextField("Phone number", text: $number)
                }
                
                Section("Notes") {
                    TextEditor(text: $notes)
                }
            }
            .navigationTitle("New contact")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newContact = Person(name: name, number: number, notes: notes)
                        modelContext.insert(newContact)
                        dismiss()
                    }
                }
            }
        }
    }
    
    func loadImage() {
        guard let selectedItem else { return }
         
        Task{
            guard let imageData = try await selectedItem.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            processedImage = Image(uiImage: inputImage)
            
        }
    }
}
