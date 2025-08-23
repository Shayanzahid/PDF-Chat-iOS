//
//  RouterView.swift
//  PDFChat
//
//  Created by Muhammad Shayan Zahid on 22/08/2025.
//

import SwiftUI

// View containing the necessary SwiftUI
// code to utilize a NavigationStack for
// navigation accross our views.
struct RouterView<Content: View>: View {
    @StateObject private var router: Router = Router()
    @StateObject private var networkManager = NetworkManager()
    // Our root view content
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
        .environmentObject(networkManager)
    }
}
