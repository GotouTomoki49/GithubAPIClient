//
//  SearchReposityRequest.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/31.
//

import Foundation

protocol APIRequestType{
    //＜ジェネリクス＞の書き方の代わり
    associatedtype Response: Decodable
    
    //プロパティ
    var path: String {get}  //計算型プロパティという意味ではない
    var queryItems: [URLQueryItem]?{ get }
}

struct SearchReposityRequest: APIRequestType{
    typealias Response = SearchReposityResponse
    
    private let query: String
    
    let path = "/search/repositories"
    
    let queryItems: [URLQueryItem]?
    
    init(query: String){
        self.query = query
        self .queryItems = [.init(name: "q", value: query),
                            .init(name: "order", value: "desc")]
    } 
}
