//
//  HomeViewModel.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/31.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject{
    //MARK: -Inputs
    
    enum Inputs{
        //ユーザーの入力操作が終わった
        //テキストフィールドの中身をtextに入れておいてね
        case onCommit(text: String)
        
        //cardViewがタップされた
        //safariで開くurlを入れておく
        case tappedCardView(urlString: String)
        
    }
    //MARK -Outputs
    //表示するリポジトリデータ
    @Published private(set) var cardViewInputs: [CardView.Input]
        = []
    
    
    //テキストフィールドで入力された値
    @Published  var inputText: String = ""
    
    //エラーアラートを表示するかどうか
    @Published  var isShowError = false
    
    //読み込みテキストを表示するかどうか
    @Published var isLoading = false
    
    //safariView表示するかどうか
    @Published var isShowSheet = false
    
    //表示するリポジトリのURL
    @Published  var repositoryURL = ""
    
}
