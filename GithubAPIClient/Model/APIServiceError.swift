//
//  APIServiceError.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/31.
//

import Foundation

enum APIServiceError: Error{
    //URLが不正
    case invalidURL
    //githubのAPIのレスポンスエラーがある
    case responseError
    //JSONをバーストした時に発生したエラー
    case parseError(Error)
    
}
