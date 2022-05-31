//
//  APIService.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/31.
//

import Foundation
import Combine

protocol APIServiceType{
    //request.responseはdecodaableの何かである
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response,APIServiceError> where Request: APIRequestType
        
    }
//api通信をしてdecode
final class APIService: APIServiceType{
    
    private let baseURLString: String
    
    init(baseURLString: String="https://api.github.com"){
        self.baseURLString = baseURLString
    }
    func request<Request>(with request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request : APIRequestType {
        guard let pathURL =  URL(string: request.path, relativeTo: URL(string: baseURLString)) else{
            return Fail(error: APIServiceError.invalidURL).eraseToAnyPublisher()
        }
        var urlCompornents = URLComponents(url: pathURL,
            resolvingAgainstBaseURL: true)!
        urlCompornents.queryItems = request.queryItems
        
        var request = URLRequest(url: urlCompornents.url!)
        
        //なくてもいい
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        //JSONのスネークけーすをswift側が自動でキャメルケースにしてparseしてくれる
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: request)
        //取ってきたデータは？
        //mapでレスポンスデータだけをストリームに使う
            .map{ data, URLResponse in data}
            .mapError{ _ in
                      APIServiceError.responseError
                      }
        //ここから先は正常なデータを処理していく
        //dataはjsonなのでデコード
            .decode(type: Request.Response.self, decoder: decoder)
        //エラーが起きるかも
            .mapError{ error in
                APIServiceError.parseError(error)
            }
        //メインスレッドで実行
            .receive(on: RunLoop.main)
        //Publisherを平坦に鳴らす
            .eraseToAnyPublisher()
                      
        
    }

     
}

