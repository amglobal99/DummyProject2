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
                        Text( String(todo.title.prefix(25)))
                    }
                    .navigationTitle("To-Dos")
                    
                }
                
            }
        } // nav stack
        .task {
//            do {
//                await viewModel.loadData()
//            } catch {
//                // Handle the error gracefully
//                viewModel.errorMessage = error.localizedDescription
//                viewModel.isLoading = false
//            }
//            
            
            await viewModel.loadData()
        }
            
    } // body
}


#Preview {
    ContentView()
}
