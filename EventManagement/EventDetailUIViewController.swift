//
//  EventDetailUIViewController.swift
//  EventManagement
//
//  Created by Thiện Huỳnh on 4/24/17.
//  Copyright © 2017 Cntt15. All rights reserved.
//

import UIKit

class EventDetailUIViewController: UIViewController {
    
    @IBOutlet weak var labelTitleEvent: UILabel!
    @IBOutlet weak var textViewEventContent: UITextView!
    var event: Event?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitleEvent.text = event?.title
        textViewEventContent.text = event?.content
        
    }

    

}
