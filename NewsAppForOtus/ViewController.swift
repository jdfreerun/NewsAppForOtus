//
//  ViewController.swift
//  NewsAppForOtus
//
//  Created by Albert Fayzullin on 25.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts: Post?

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
        return posts?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableCell else { return UITableViewCell() }
        let item = posts?.data[indexPath.row] 
        cell.setupItem(item: item!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsViewController {
            destination.post = posts?.data[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func downloadJSON(compteted: @escaping () -> ()) {
        let url = URL(string: "https://inshorts.deta.dev/news?category=technology")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {
            (data,_,_) in
            guard let data = data else { return }
        do {
            self.posts = try JSONDecoder().decode(Post.self, from: data)

            DispatchQueue.main.async {
                compteted()
            }
            }
        catch {
            print("Error: \(error)")
        }
    }
        task.resume()
    }
}

