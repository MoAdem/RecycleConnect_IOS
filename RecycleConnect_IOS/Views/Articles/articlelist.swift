//
//  articlelist.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 28/11/2023.
//

import SwiftUI
import URLImage


struct articlelist: View {
    @StateObject private var articleViewModel = ArticleViewModel()
        @State private var searchText: String = ""
        @State private var isArticleFormPresented: Bool = false


        var body: some View {
            ZStack {
                ScrollView {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Rechercher un article",
                                      text: $searchText, onCommit: {
                                       articleViewModel.searchQuery = searchText
                                       articleViewModel.SearchArticleByNom()
                                                    })

                                .frame(width: 240)
                                .foregroundColor(.primary)
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color(.white))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.05, green: 0.54, blue: 0.48), lineWidth: 2))
                        .padding(.top , 10)
                    }
                    .frame(maxHeight: .infinity)


                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(articleViewModel.searchArticles) { article in
                            NavigationLink(destination: articledetails(article: article)) {
                                ArticleItemView(article: article, onDelete: { onDelete(article) })
                            }
                        }
                    }
                    .padding(.top , 30)
                }


                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isArticleFormPresented.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color(red: 0.05, green: 0.54, blue: 0.48))
                                .clipShape(Circle())
                                .padding(.trailing, 50)
                        }
                        .sheet(isPresented: $isArticleFormPresented) {
                            articleform()
                        }
                    }
                }
            }
            .onAppear {
                articleViewModel.GetAllArticles()
            }
            /*.onChange(of: articleViewModel.articles) {
                articleViewModel.GetAllArticles()
            }*/
        }


        private func onDelete(_ article: article) {
            if let index = articleViewModel.articles.firstIndex(of: article) {
                articleViewModel.articles.remove(at: index)
                articleViewModel.DeleteArticle(articleId: article.id!)
            }
        }
    }


    struct ArticleItemView: View {
        var article: article
        var onDelete: () -> Void


        var body: some View {
            VStack(alignment: .center, spacing: 10) {
                URLImage(article.PhotoArticle, content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140)
                        .cornerRadius(8)
                })


                Text(article.NomArticle)
                    .font(.headline)
                    .foregroundColor(.primary)


                Text(article.EtatArticle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(10)
            .background(Color(.white))
            .cornerRadius(10)
            .contextMenu {
                Button(action: {
                    onDelete()
                }) {
                    HStack {
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }


#Preview {
    articlelist()
}
