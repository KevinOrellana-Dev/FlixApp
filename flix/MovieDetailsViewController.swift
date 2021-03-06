//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by admin on 2/26/20.
//  Copyright © 2020 kevin.orellana06@gmail.com. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var movie: [String:Any]!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        
        
       let baseUrl = "https://image.tmdb.org/t/p/w185"
       let posterPath =  movie["poster_path"] as! String
       let posterUrl = URL(string: baseUrl + posterPath)
               
       posterView.af_setImage(withURL: posterUrl!)
        
        
        let backdropPath =  movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
                      
        backdropView.af_setImage(withURL: backdropUrl!)
        
        // Do any additional setup after loading the view.
    }
    



}
