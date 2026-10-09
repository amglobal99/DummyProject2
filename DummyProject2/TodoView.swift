//
//  TodoView.swift
//  DummyProject2
//
//  Created by amglobal on 10/9/26.
//

import SwiftUI

struct TodoView: View {
    
    var item: Todo
    
    var body: some View {
        VStack(alignment: .leading,  spacing:25) {
            Text("\(item.title)")
            Text("Completed: \(String(describing: item.completed) ) ")
            Text("Id: \(item.id)")
            Text("User ID: \(item.userId)")
        }
        .navigationTitle("\(item.title)")
        .frame(width: 250, height: 300, alignment: .leading)
        .padding()
        .overlay (
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, lineWidth: 4)
        )
    }
}




#Preview {
    TodoView(item: Todo(id: 33, userId: 4343, title: "Call Mike", completed: false))
}
