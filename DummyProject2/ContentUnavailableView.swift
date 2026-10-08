//
//  ContentUnavailableView.swift
//  DummyProject2
//
//  Created by amglobal on 10/8/26.
//

import SwiftUI

struct ContentUnavailableView: View {
    
    var errorMessage: String = "test message"
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Error: \(String(describing: errorMessage))")
                .font(.headline)
                .frame(width: 300, height: 300) // Specific size frame
                .background(Color.blue.opacity(0.2)) // Background color
                .overlay(
                    RoundedRectangle(cornerRadius: 12) // Optional corner radius
                        .stroke(Color.blue, lineWidth: 2) // Border color & width
                )
                .clipShape(RoundedRectangle(cornerRadius: 12)) // Clips background to shape
            
            
            Button("Exit App") {
                // Hard exit (Forces the app to close immediately)
                // Note: Susceptible to App Store rejection.
                exit(0)
            }
            .tint(.red)
            .buttonStyle(.borderedProminent)
            
        } // vstack
    } //body
}



#Preview {
    ContentUnavailableView()
}
