//
//  NewsViewController.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import UIKit

class NewsViewController: UIViewController {

    var post: Post?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = "\((post?.id)!)"
        userIdLabel.text = "\((post?.userId)!)"
        titleLabel.text = post?.title
        bodyLabel.text = post?.body

    }


}
