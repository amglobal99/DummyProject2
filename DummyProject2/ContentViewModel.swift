//
//  ContentViewModel.swift
//  DummyProject2
//
//  Created by amglobal on 10/7/26.
//

import Foundation
import Observation


nonisolated public final class Todo: Identifiable, Decodable, Sendable {
    public let id: Int
    let userId: Int
    let title: String
    let completed: Bool
    
    init(id: Int, userId: Int, title: String, completed: Bool) {
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
}


@Observable
final class ContentViewModel {
    var todos: [Todo] = []
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    
    //MARK: - Load Data
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        
        do {
            //throw DataLoadingError.requestFailed
            try await Task.sleep(for: .seconds(5))
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedTodos = try JSONDecoder().decode([Todo].self, from: data)
            self.todos = decodedTodos
        } catch let error as DataLoadingError {
            print("A network error occurred: \(error)")
            self.errorMessage = error.errorDescription
        }catch {
            print("we have an error")
            self.errorMessage = "We have an unknown error:  \(error.localizedDescription)"
        }
        
    }
    
} //end class





extension Todo: Equatable, Hashable {
    
    public static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id &&
        lhs.userId == rhs.userId
    }
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
    }
    
}




enum DataLoadingError: Error, Equatable {
    case requestFailed
    case internetDown
    
    
    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "URL request FAiled"
        case .internetDown:
            return "The server may be down."
        }
    }
}


