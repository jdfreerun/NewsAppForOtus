//
//  ViewController.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [Post]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsViewController {
            destination.post = posts[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func downloadJSON(compteted: @escaping () -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {
            (data,_,_) in
            guard let data = data else { return }
        do {
            self.posts = try JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                compteted()
            }
            }
        catch {
            print("Error")
        }
    }
        task.resume()
    }

}

