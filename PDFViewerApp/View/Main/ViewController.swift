//
//  ViewController.swift
//  PDFViewerApp
//
//  Created by Mohamed Elbana on 11/10/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFldPage: UITextField!
    @IBOutlet weak var viewPDF: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    
    var pdfView: PDFView? = nil
    
    let MIN_PAGE = 0
    let MAX_PAGE = 290
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSearch.btnSquare()
        
        initPDF()
        initDocument(PAGE.get())
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePageChange(notification:)), name: Notification.Name.PDFViewPageChanged, object: nil)
    }
    
    @objc
    func handlePageChange(notification: Notification) {
        let currentPageIndex = pdfView!.document?.index(for: pdfView!.currentPage!)
        print("Page: \(currentPageIndex ?? 0)")
        PAGE.save(currentPageIndex ?? 0)
    }
    
    private func initPDF() {
        pdfView = PDFView(frame: viewPDF.bounds)
        pdfView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewPDF.addSubview(pdfView!)
        pdfView?.autoScales = true
    }
    
    private func initDocument(_ pageNo: Int) {
        let fileURL = Bundle.main.url(forResource: "book", withExtension: "pdf")
        pdfView?.document = PDFDocument(url: fileURL!)
        if let page = pdfView!.document?.page(at: pageNo) {
            pdfView!.go(to: page)
         }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "PDFViewerApp"
    }
    
    @IBAction func btnSearchClicked(_ sender: Any) {
        if txtFldPage.text != "" {
            let pageNumber: Int = Int(txtFldPage.text ?? "1") ?? 1
            if pageNumber >= MIN_PAGE && pageNumber <= MAX_PAGE {
                 initDocument(pageNumber - 1)
            } else {
                showAlert("This page not exists in the book!")
            }
        } else {
            showAlert("Enter page number!")
        }
        
        txtFldPage.text = ""
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


