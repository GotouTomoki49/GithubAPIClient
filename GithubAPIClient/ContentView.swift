//
//  ContentView.swift
//  GithubAPIClient
//
//  Created by cmStudent on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    init() {
        // 外でも流用ができる
        // 指定のバージョン以降の時だけ設定する、など
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
        }
    }
    
    
    var body: some View {
        HomeView()
        //SafariView(url: URL(string: "https://www.jec.ac.jp")!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
