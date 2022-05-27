//
//  CardView.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/27.
//

import SwiftUI

struct CardView: View {
    //CardView.Input
    //表示するための入れ物
    struct Input: Identifiable{
        let id: UUID = UUID()
        let iconImage: UIImage //アイコン
        let title: String //タイトル
        let language: String? //開発言語
        let star: Int //スターの数
        let description: String? //リポジトリー説明
        let url: String //リポジトリーURL
    }
    var body: some View {
        //icon
        //title
        //languageAndStarts
        VStack (alignment: .leading) {
            icon
            title
            languageAndStarts
            description
        }
        .padding(24)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 1))
        .frame(minWidth: 140, minHeight: 180)
        .padding()
    }
    
    var icon: some View{
        //FIXME: apiから取得に画像に変更
        //Image(uiImage: input.iconImage)
        Image(uiImage: UIImage(named: "icon")!)
        // Buttonで包む際に色が変わらないようにする
            .renderingMode(.original)
        //親のサイズに伸縮できるようにする
            .resizable()
        //アスペクト比を保つ
            .aspectRatio(contentMode: .fit)
        //サイズはw:60,h:60固定
            .frame(width: 60, height: 60)
        //丸くクリップ
            .clipShape(Circle())
        //丸い枠線
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
        //ドロップシャドウ
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
        
    }
    var title : some View{
        Text("タイトル")
        // 明示的に色を指定しないとbuttonでくるんだときにおかしくなる
            .foregroundColor(.black)
            .font(.title)
            .fontWeight(.bold)
    }
    var languageAndStarts: some View{
        HStack{
            //FIXME: apiから取得に画像に変更
            //.font(input.language ?? "")
            Text("言語")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
            HStack(spacing: 4){
                Image(systemName: "star")
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                //Text(input.star)
                Text(String(10000))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
        }
    }
    var description: some View{
        Text("説明文")
            .foregroundColor(.black)
        //書かれている文字全てを表示しようとしている
            .lineLimit(nil)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
