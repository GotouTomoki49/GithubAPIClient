//
//  Repository.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/31.
//

import Foundation
import SwiftUI

struct Reposity: Decodable, Hashable, Identifiable{
    
    let id: Int
    let name: String
    let description: String?
    var language: Int = 0
    let htmlUrl: String
    let owner: Owner
}

struct Owner: Decodable, Hashable,Identifiable{
    let id : Int
    let avatarUrl: String
}

struct SearchReposityResponse: Decodable{
    let items: [Reposity]
}

