//
//  SearchView.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/27.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                
            }
        .padding()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                TextField("検索キーワード", text: $text){
                    //編集完了後に呼ばれるクロージャー
                    
                }
                //テキストフィールドのスタイルを角丸にする
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.asciiCapable)
                .frame(width:UIScreen.main.bounds.width - 40)
                
            }
        }
    }
        .navigationViewStyle(StackNavigationViewStyle())
        
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
