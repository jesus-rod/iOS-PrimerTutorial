//
//  Post.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 02.02.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let id: String
    let postedBy: String
    let title: String
    let body: String
}
