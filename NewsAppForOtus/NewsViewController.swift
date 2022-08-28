//
//  NewsViewController.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import UIKit

class NewsViewController: UIViewController {

    var post: Datum?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = post?.date
        authorLabel.text = post?.author
        titleLabel.text = post?.title
        contentLabel.text = post?.content
        timeLabel.text = post?.time
        urlLabel.text = "Link: \((post?.url)!)" 
        let imageURL = post?.imageURL
        imageNews.downloaded(from: imageURL!)
    }
}

extension UIImageView {
    func downoaded (from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        } .resume()
    }
    func downloaded (from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downoaded(from: url, contentMode: mode)
    }
}
