//
//  AddItemViewController.swift
//  checkist
//
//  Created by jaswanth on 12/05/15.
//  Copyright (c) 2015 jaswanth. All rights reserved.
//

import UIKit





protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController,didFinishAddingItem item: ChecklistItem)
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)
    }

class AddItemViewController: UITableViewController,UITextFieldDelegate {
    
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func cancel() {
       delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func done() {
        if let item = itemToEdit {
        item.text = textField.text
        delegate?.addItemViewController(self, didFinishEditingItem: item)
    } else {
        let item = ChecklistItem()
        item.text = textField.text
        item.checked = false
        delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
    }
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
                replacementString string: String) -> Bool {
                let oldText: NSString = textField.text
                let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString:string)
                doneBarButton.enabled = (newText.length > 0)
                return true
    }
    
    weak var delegate: AddItemViewControllerDelegate?
    
    
    
    override func tableView(tableView: UITableView,
                willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
                return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }

}
