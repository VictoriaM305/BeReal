//
//  FeedViewController.swift
//  lab-insta-parse
//
//  Created by Victoria Mckinnie on 09/29/24.
//

import ParseSwift

func queryPosts() {
    let query = Post.query()
        .include("user")
        .order([.descending("createdAt")])

    query.find { [weak self] result in
        switch result {
        case .success(let posts):
            self?.posts = posts
            self?.tableView.reloadData()
        case .failure(let error):
            self?.showAlert(description: error.localizedDescription)
        }
    }
}


