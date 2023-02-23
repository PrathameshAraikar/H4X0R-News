//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Prathamesh Araikar on 05/01/22.
//

import Foundation

// ObservableObject: This protocol means that we can actually start to broadcast one or many of its properties to any interested parties.

// @Published: Now to publish our "posts" to any interested parties we need to use the keyword @Published

class NetworkManger: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

// The point where we use @Published we always have to make sure that we fetch the main thread. So we have to tap into the DispacthQueue.main.async and inside the closure we write our self.posts = results.hits.

// Its because this property is a property that other objects are listening to. Therefore this update must happen on the main thread
