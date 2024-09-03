//
//  ViewController.swift
//  SHR Assesment
//
//  Created by Sneh  on 28/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var descriptionTableView: UITableView!
    
    
    var articles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiData()
        setupTableView()
        setupNavigationLeftBarImage()
        setupNavigationRightBarImage()
    }
    
    
    func setupNavigationLeftBarImage() {
        let image = UIImage(systemName: "line.3.horizontal")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let leftBarButtonItem = UIBarButtonItem(customView: imageView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupNavigationRightBarImage(){
        let image = UIImage(systemName: "tag.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let rightBarButton = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    
    
    
    
    
    func getApiData() {
        ApiManager.shared.fetchApiData(lastid: articles.last?.id ?? 0) { model, error in
            if let error {
                print(error)
            } else {
                if let model {
                    self.articles += model.data.data
                    DispatchQueue.main.async {
                        self.descriptionTableView.reloadData()
                    }
                }
            }
        }
    }
    
    func setupTableView() {
        descriptionTableView.delegate = self
        descriptionTableView.dataSource = self
        descriptionTableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        descriptionTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource , UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = descriptionTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        let article = articles[indexPath.row]
        cell.configureCell(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == articles.count - 2 {
            getApiData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if offset.y > 0 {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else if offset.y < 0  {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
    }
    
    
}
