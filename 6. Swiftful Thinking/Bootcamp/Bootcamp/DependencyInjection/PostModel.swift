//
//  PostModel.swift
//  DependencyInjection
//
//  Created by Mihai Constantin on 20.05.2024.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
