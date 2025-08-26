//
//  ContentView.swift
//  PDFChat
//
//  Created by Muhammad Shayan Zahid on 22/08/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var networkManager: NetworkManager
    @EnvironmentObject private var router: Router
    
    @State private var showDocumentPicker = false
    @State private var isDocumentSelected = false
    @State private var selectedDocument: URL?
    @State private var showErrorAlert = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 24) {
                    Text("Upload your PDF file 📚")
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        showDocumentPicker.toggle()
                    } label: {
                        VStack(spacing: 16) {
                            Image(systemName: "icloud.and.arrow.up.fill")
                                .font(.title)
                            
                            if let selectedDocument {
                                Text(selectedDocument.lastPathComponent)
                                    .font(.title3)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    Button {
                        processPDF()
                    } label: {
                        Text("Process PDF")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(isDocumentSelected ? .blue : .gray.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    .disabled(!isDocumentSelected)
                    
                    Spacer()
                }
                .padding()
                
                if isLoading {
                    LoadingOverlay()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(isPresented: $showDocumentPicker) {
                DocumentPicker { url in
                    if !url.absoluteString.isEmpty {
                        isDocumentSelected = true
                        selectedDocument = url
                    }
                }
            }
            .alert("Error", isPresented: $showErrorAlert, actions: {}) {
                Text("There was an error processing the PDF. Please try again.")
            }
        }
    }
    
    private func processPDF() {
        isLoading = true
        
        if let selectedDocument {
            Task {
                do {
                    let _ = try await networkManager.uploadPDF(fileURL: selectedDocument)
                    
                    isLoading = false
                    router.navigateTo(.chatView(documentName: selectedDocument.lastPathComponent))
                } catch {
                    isLoading = false
                    showErrorAlert.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
