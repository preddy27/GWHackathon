//
//  UIViewControllerRepresentable.swift
//  GWHack
//
//  Created by Parisha Reddy on 4/11/21.
//

import SwiftUI
struct SearchBar : UIViewRepresentable {
   @Binding var text : String
   
   func searchBar(_ searchBar: UISearchBar,
                  textDidChange searchText: String) {
      text = searchText
   }
}
func makeCoordinator() -> SearchBar.Cordinator {
      return Cordinator(text: $text)
   }
func makeUIView(context: UIViewRepresentableContext<SearchBar>)
   -> UISearchBar {
   
      let searchBar = UISearchBar(frame: .zero)
      searchBar.delegate = context.coordinator
      return searchBar
   }
func updateUIView(_ uiView: UISearchBar,
                context: UIViewRepresentableContext<SearchBar>) {
       uiView.text = text
    }
}
