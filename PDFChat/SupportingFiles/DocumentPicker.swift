//
//  DocumentPicker.swift
//  PDFChat
//
//  Created by Muhammad Shayan Zahid on 22/08/2025.
//

import UIKit
import SwiftUI

// MARK: - Document Picker
struct DocumentPicker: UIViewControllerRepresentable {
    var completion: (URL) -> Void
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var completion: (URL) -> Void
        
        init(completion: @escaping (URL) -> Void) {
            self.completion = completion
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }

            // Security-scoped resource (important for iCloud/Files access)
            if url.startAccessingSecurityScopedResource() {
                completion(url)
                url.stopAccessingSecurityScopedResource()
            }
        }
    }
}
