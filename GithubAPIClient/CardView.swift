//
//  CardView.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/27.
//

import SwiftUI

struct CardView: View {
    // CardView.Input
    // 表示のための入れ物（≠ JSON用の入れ物)
    struct Input: Identifiable {
        let id: UUID = UUID()
        let iconImage: UIImage // アイコンの画像
        let title: String // リポジトリのタイトル
        let language: String? // リポジトリの開発言語
        let star: Int // スターの数
        let description: String? // リポジトリの説明
        let url: String // リポジトリのURL
    }
    
    let input: Input
    
    var body: some View {
        VStack (alignment: .leading) {
            icon
            title
            languageAndStarts
            description
        }
        .padding(24)
        // 角丸矩形
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 1))
        .frame(minWidth: 140, minHeight: 180)
        .padding()

    }
    
    var icon: some View {
        
        Image(uiImage: input.iconImage)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            // 画像を丸くクリップする
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            // おしゃれ
            // 影を付ける
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
    }
    
    var title: some View {
        Text(input.title)
            .foregroundColor(.black)
            .font(.title)
            .fontWeight(.bold)
    }
    
    var languageAndStarts: some View {
        HStack {
            Text(input.language ?? "")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
            HStack(spacing: 4) {
                Image(systemName: "star")
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                Text(String(input.star))
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var description: some View {
        Text(input.description ?? "")
            .foregroundColor(.black)
            // 書かれている文字すべてを表示しようとする
            .lineLimit(nil)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: CardView.Input(
            iconImage: UIImage(named: "Tarou2")!,
            title: "タイトル",
            language: "swift",
            star: 2000, description: "説明文",
            url: "https://www.jec.ac.jp"))
    }
}
