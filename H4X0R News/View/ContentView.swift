//
//  ContentView.swift
//  H4X0R News
//
//  Created by Prathamesh Araikar on 05/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        
        //            List {
        //                Text("Hello, world!")
        //            }
        
        // Instead of using a normal List we are going to use the one which takes a piece of data and then computes that row using that data and we are going to provide a piece of data that conforms to the identifiable protocol
        
        // The data which we are gonna use is our array of "posts"
        // As the rowContent is the last part of our list we can convert it to a trailing closure
        
        // For every single "post" in our "posts array" we are going to use each of these posts array's items to create a new Text Object and the text view is going to be populated using each "post's title"
        
        ZStack {
            NavigationView {
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                .navigationTitle("H4X0R News")
            }
            .onAppear {
                networkManager.fetchData()  // Calling our API
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Identifiable: This is going to allow our list to be able to recognize the order of our posts based on the constant created "id"

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Namaste"),
//    Post(id: "3", title: "Hola"),
//]
