//
//  MoviesViewController.swift
//  flix
//
//  Created by admin on 2/10/20.
//  Copyright © 2020 kevin.orellana06@gmail.com. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

   
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]] () // these type of variables are called properties and are available fo the lifetime of the screen. They are specieal because of their location. Creation of array of dictionaries.
    
    //this function runs the first time that a screen comes up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as! [[String:Any]]
            
            self.tableView.reloadData() // calls the buttom functions again
            print(dataDictionary)
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell //if a cell is outside the view recycle it. Else create a new one. This helps you not to store all cells (which may not be in view) in ram.
        
        
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.titlelabel.text = title
        cell.synopsisLabel.text = synopsis
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath =  movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.poserView.af_setImage(withURL: posterUrl!)
        return cell
    }

   

}
