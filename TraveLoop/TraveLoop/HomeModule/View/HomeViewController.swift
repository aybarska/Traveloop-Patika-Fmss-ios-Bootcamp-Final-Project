//
//  ViewController.swift
//  TraveLoop
//
//  Created by Ayberk M on 28.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var banner: UIView!
    
    @IBOutlet weak var hotelsButton: UIButton!
    @IBOutlet weak var flightsButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bg: UIImageView!
    
    var viewModel = HomeViewModel()
    
    private var items: [ArticlesCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }

    
    @IBAction func hotelsButton(_ sender: Any) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController
        let backItem = UIBarButtonItem()
        backItem.title = "Hotels"
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
        destinationVC?.moduleMethod = "Hotels"
        self.navigationController?.pushViewController(destinationVC!, animated: true)

    }
    
    @IBAction func flightsButton(_ sender: Any) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController
        let backItem = UIBarButtonItem()
        backItem.title = "Flights"
        backItem.tintColor = .black
        navigationItem.backBarButtonItem = backItem
        destinationVC?.moduleMethod = "Flights"
        self.navigationController?.pushViewController(destinationVC!, animated: true)
    }
}



private extension HomeViewController {
    func makeUI() {
        collectionViewArrangements()
        bgColor()
        bannerPhoto()
    }
    
    func bgColor() {
        self.view.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
        collectionView.backgroundColor = UIColor(red: 0.9765, green: 0.9765, blue: 0.9765, alpha: 1.0)
    }
    
    func bannerPhoto() {
        bg.layer.shadowColor = UIColor(red: 0.138, green: 0.138, blue: 0.138, alpha: 0.4).cgColor
        bg.layer.shadowOpacity = 1
        bg.layer.shadowRadius = 20
        bg.layer.shadowOffset = CGSize(width: 0, height: 5)
        bg.layer.masksToBounds = false
    }
    
    func collectionViewArrangements() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize  = CGSize(width: 150, height: 100)
        collectionView.collectionViewLayout = layout
        collectionView.register(ArticlesCollectionViewCell.nib(), forCellWithReuseIdentifier: ArticlesCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
}

extension HomeViewController: HomeViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [ArticlesCellViewModel]) {
        self.items = items // veri var
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(items.count)
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath) as! ArticlesCollectionViewCell
        let item = items[indexPath.row]
        print(item.title!)
        cell.labelTag.text = "Travel"
        cell.labelTitle.text = item.title
            //KF.url(URL(string: item.url ?? "https://i.ibb.co/mtdQq8t/1.jpg"))
           // .set(to: cell.imagelView)
        cell.imageView.image = UIImage(named: "placeholder1")
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let leftAndRightPaddings: CGFloat = 40.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 1.0
        let bottomTopPaddings: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        let height = (collectionView.frame.height-bottomTopPaddings)/numberOfItemsPerRow
        
        return CGSize(width: width-10, height: height)
        //return CGSize(width: 150, height: 75)

    }

}

