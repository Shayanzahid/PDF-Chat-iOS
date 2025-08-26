//
//  Router.swift
//  PDFChat
//
//  Created by Muhammad Shayan Zahid on 22/08/2025.
//

import SwiftUI

final class Router: ObservableObject {
    enum Route: Hashable {
        case chatView(documentName: String)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    private var routeStack: [Route] = []
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .chatView(let documentName):
            ChatView(documentName: documentName)
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        routeStack.append(appRoute)
        path.append(appRoute)
    }
    
    func navigateBack() {
        guard !routeStack.isEmpty else { return }
        routeStack.removeLast()
        path.removeLast()
    }
    
    func popToRoot() {
        routeStack.removeAll()
        path.removeLast(path.count)
    }
    
    /// Navigate to a specific route, replacing the navigation path if needed.
    func navigateToSpecific(route: Route) {
        if let index = routeStack.firstIndex(of: route) {
            // Adjust the stack to stop at the target route.
            routeStack = Array(routeStack.prefix(upTo: index + 1))
            path = NavigationPath(routeStack)
        } else {
            // If the route does not exist, append it.
            navigateTo(route)
        }
    }
}
