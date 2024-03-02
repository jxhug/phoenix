//
//  InfoCard.swift
//  Phoenix
//
//  Created by James Hughes on 9/29/23.
//

import SwiftUI
import ExpandableText

struct TextCard: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ExpandableText(text)
            .font(.system(size: 14))
            .buttonFont(.system(size: 13))
            .buttonColor(.accentColor)
            .lineLimit(7)
            .trimMultipleNewlinesWhenTruncated(false)
            .lineSpacing(3.5)
            .padding(10)
        }
        .frame(idealWidth: 400, maxWidth: 1280, alignment: .topLeading) // controls the dimensions and alignment of the description text
        .background(Color.gray.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: 7.5)
            .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(7.5) 
        .font(.system(size: 14.5))
    }
}

struct SlotCard<Content>: View where Content: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
        }
        .font(.system(size: 14.5))
        .padding(10)
        .background(Color.gray.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: 7.5)
                .stroke(Color.secondary.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(7.5)
    }
}

