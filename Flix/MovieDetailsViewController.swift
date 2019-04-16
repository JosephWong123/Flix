//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Joseph Wong on 4/15/19.
//  Copyright © 2019 Joseph Wong. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var moveScreen: UIButton!
  //  @IBOutlet var onTap: UITapGestureRecognizer!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    var movie: [String:Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        detailsLabel.text = movie["overview"] as? String
        detailsLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTap(_ sender: UIGestureRecognizer) {
        print("Hi")
        performSegue(withIdentifier: "UIImageView", sender: self)
    }
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender! as! MovieDetailsViewController
        let key = cell.movie["key"] as! String
        let vidUrl = URL(string: "https://www.youtube.com/watch?v=\\" + key)
    
        let trailerView = segue.destination as! TrailerViewController
        
        let vidRequest = URLRequest(url: vidUrl!)
        trailerView.webViewer.load(vidRequest)
            
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
