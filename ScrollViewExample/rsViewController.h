//
//  rsViewController.h
//  ScrollViewExample
//
//  Created by Harish Upadyayula on 5/31/13.
//  Copyright (c) 2013 ritch systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *comments;


- (IBAction)submit:(id)sender;

//@property (weak, nonatomic) IBOutlet UIButton *btnSubmt;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end
