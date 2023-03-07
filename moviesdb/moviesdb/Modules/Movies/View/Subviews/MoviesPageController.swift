//
//  MoviesPageController.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 04/03/23.
//

import UIKit

protocol PageControlProtocol: UIViewController {
    var numberOfPages: Int { get }
    func setPage(_ index: Int)
    func moviePage(at index: Int) -> MoviePage? 
}

protocol MoviesPageDelegate: AnyObject {
    func didChangePage(page: UIViewController, at index: Int)
    func didSelectItem(at indexPath: IndexPath, at pageIndex: Int)
}


// MARK: controller

class MoviesPageController: UIPageViewController, PageControlProtocol {

    weak var pageDelegate: MoviesPageDelegate?
    private var pages: [UIViewController] = []
    internal var numberOfPages: Int = 0
    
    convenience init(numberOfPages: Int, transitionStyle: UIPageViewController.TransitionStyle = .scroll, navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal) {
        self.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation)
        self.numberOfPages = numberOfPages
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        pages = (0..<numberOfPages).map ({ _ in
            let controller = MoviePage()
            controller.delegate = self
            return controller
        })
        setViewControllers([pages[currentIndex]], direction: .forward, animated: false)
    }
    
    func setPage(_ index: Int) {
        if index == currentIndex, index >= pages.count { return }
        var direction: UIPageViewController.NavigationDirection = .reverse
        if index > currentIndex {
            direction = .forward
        }
        setViewControllers([pages[index]], direction: direction, animated: false)
    }
    
    func moviePage(at index: Int) -> MoviePage? {
        if pages.count > index {
            return pages[index] as? MoviePage
        }
        return nil
    }
    
    private var currentIndex: Int {
        guard let vc = viewControllers?.first else { return 0 }
        return pages.firstIndex(of: vc) ?? 0
    }
}

extension MoviesPageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return pages.last }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return pages.first }
        guard pages.count > nextIndex else { return nil }
        return pages[nextIndex]
    }
}

extension MoviesPageController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed { return }
        let page = pages[currentIndex]
        pageDelegate?.didChangePage(page: page, at: currentIndex)
    }
}

extension MoviesPageController: MovieListDelegate {
    func didSelectItem(at indexPath: IndexPath, object: CardMovieModel) {
        pageDelegate?.didSelectItem(at: indexPath, at: currentIndex)
    }
}
