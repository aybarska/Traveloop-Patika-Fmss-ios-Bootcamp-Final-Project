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

}



private extension HomeViewController {
    func makeUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 100, height: 250)
        collectionView.collectionViewLayout = layout
        //collectionView.register(ArticlesCollectionViewCell.nib, forCellWithReuseIdentifier: ArticlesCollectionViewCell.identifier)
        bg.layer.shadowColor = UIColor(red: 0.138, green: 0.138, blue: 0.138, alpha: 0.4).cgColor
        bg.layer.shadowOpacity = 1
        bg.layer.shadowRadius = 20
        bg.layer.shadowOffset = CGSize(width: 0, height: 5)
        bg.layer.masksToBounds = false
        registerCell()
    }
    
    func registerCell() {
        collectionView.register(.init(nibName: "ArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticlesCollectionViewCell")
    }
}

extension HomeViewController: HomeViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [ArticlesCellViewModel]) {
        self.items = items
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
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath) as! ArticlesCollectionViewCell
        let item = items[indexPath.row]
        cell.labelTitle.text = item.title
            //KF.url(URL(string: item.url ?? "https://i.ibb.co/mtdQq8t/1.jpg"))
           // .set(to: cell.imagelView)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let leftAndRightPaddings: CGFloat = 20.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 1.0

      let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 40)

    }

}
