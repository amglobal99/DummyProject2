import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                    // 1. Changes the size of the spinner itself
                        .controlSize(.extraLarge)
                    // 2. Makes the internal frame larger
                        .frame(width: 200, height: 200)
                    // 3. Adds background color and clips it to a rounded square
                        .background(Color.secondary.opacity(0.2))
                        .cornerRadius(12)
                }else if let errorMessage = viewModel.errorMessage {
                    ContentUnavailableView(errorMessage: errorMessage)
                }else{
                    List(viewModel.todos) { todo in
                        NavigationLink(destination: TodoView(item: todo)) {
                            Text( String(todo.title.prefix(25)))
                        }
                    }
                    .navigationTitle("To-Dos")
                }
            } // group
        } // nav stack
        .task {
            await viewModel.loadData()
        }
            
    } // body
}


#Preview {
    ContentView()
}
