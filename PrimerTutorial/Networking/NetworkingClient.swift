//
//  NetworkingClient.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 02.02.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import Foundation

class NetworkClient {
    //necesitamos
    //baseURL (devpragmatico.com/primertutorial, URLSession

    let baseURL: URL
    let session: URLSession
    let responseQueue: DispatchQueue

    //singleton
    static let shared = NetworkClient(baseURL: URL(string: "http://devpragmatico.com:3000/primertutorial/")!,
                                      session: .shared,
                                      responseQueue: .main)

    init(baseURL: URL, session: URLSession, responseQueue: DispatchQueue) {
        self.baseURL = baseURL
        self.session = session
        self.responseQueue = responseQueue
    }

    func getLatestPosts(completion: @escaping ([Post]?, Error?) -> Void) -> URLSessionDataTask {
        let url = URL(string: "posts", relativeTo: baseURL)!
        let task = session.dataTask(with: url) { (data, response, error) in
            // ver si hay un error, ver si la respuesta es correcta
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                error == nil,
                let data = data
                else {
                    self.responseQueue.async {
                        completion(nil, error)
                    }

                    return
                }


            let decoder = JSONDecoder()
            do {
                let posts = try decoder.decode([Post].self, from: data)
                self.responseQueue.async {
                    completion(posts, nil)
                }
            } catch {
                self.responseQueue.async {
                    completion(nil, error)
                }

            }
        }
        task.resume()
        return task
    }
}
