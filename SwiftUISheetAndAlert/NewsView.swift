//
//  NewsView.swift
//  SwiftUINavigation
//
//  Created by 黃柏嘉 on 2025/01/23.
//

import SwiftUI

struct NewsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var showAlert: Bool = false
    
    var news: NewsInfo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Image(news.title)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Group {
                    Text("\(news.type)》\(news.title)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    Text(news.date)
                        .foregroundStyle(.gray)
                        .font(.system(size: 15, weight: .regular, design: .none))
                    
                    Text(news.content)
                }.padding([.leading, .trailing], 10)
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay {
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    })
                    
                    Spacer()
                }.padding()
            }
        }
        .alert("請確認", isPresented: $showAlert) {
            Button("確認", action: { dismiss() })
            Button("取消", action: { })
        } message: {
            Text("是否要關閉？")
        }
    }
}
