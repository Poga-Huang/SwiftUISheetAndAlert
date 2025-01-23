//
//  ContentView.swift
//  SwiftUISheetAndAlert
//
//  Created by 黃柏嘉 on 2025/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectInfo: NewsInfo?
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(NewsInfo.news) { info in
                    VStack(alignment: .leading) {
                        Text(info.title)
                            .fontWeight(.bold)
                        
                        Text(info.date)
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                    }
                    .onTapGesture {
                        selectInfo = info
                    }
                    .sheet(item: $selectInfo,
                           onDismiss: handleDismiss) { info in
                        NewsView(news: info)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("體育新聞")
        }
    }
    
    init() {
        let scrollAppearence = UINavigationBarAppearance()
        scrollAppearence.backgroundColor = .systemFill
        scrollAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        scrollAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .black
        standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = standardAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollAppearence
        UINavigationBar.appearance().compactAppearance = standardAppearance
    }
    
    func handleDismiss() {
        print("Dismiss")
    }
}

#Preview {
    ContentView()
}
