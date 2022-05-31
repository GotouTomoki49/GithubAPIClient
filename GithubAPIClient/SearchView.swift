//
//  SearchView.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/27.
//

import SwiftUI

struct SearchView: View {
    @State private var cardViewInputs: [CardView.Input] = [CardView.Input(iconImage: UIImage(named: "icon")!,
          title:  "タイトル",
          language: "swift",
          star: 2000, description: "説明文",
          url: "https://www.jec.ac.jp")]
    @State var text: String = ""
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                //カードを入れたい（たくさんある）
                ForEach(cardViewInputs) { input in
                    CardView(input: input)
                    
                }
            }
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
