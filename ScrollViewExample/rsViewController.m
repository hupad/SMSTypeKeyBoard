//
//  rsViewController.m
//  ScrollViewExample
//
//  Created by Harish Upadyayula on 5/31/13.
//  Copyright (c) 2013 ritch systems. All rights reserved.
//

#import "rsViewController.h"

@interface rsViewController ()

@end

@implementation rsViewController

@synthesize comments,scrollView,toolBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   [self registerForKeyboardNotifications];
    
   	// Do any additional setup after loading the view, typically from a nib.
    self.comments.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)submit:(id)sender {
    
    UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 200)];

    [yourLabel setTextColor:[UIColor blackColor]];
    [yourLabel setBackgroundColor:[UIColor clearColor]];
    [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [yourLabel setText: self.comments.text];
    yourLabel.numberOfLines = 30;
    yourLabel.lineBreakMode = NSLineBreakByWordWrapping;
    yourLabel.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview: yourLabel];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [comments resignFirstResponder];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.0];
        [UIView setAnimationBeginsFromCurrentState:YES];
    
    toolBar.frame = CGRectMake(toolBar.frame.origin.x, (toolBar.frame.origin.y - kbSize.height), toolBar.frame.size.width, toolBar.frame.size.height);
    
//        comments.frame = CGRectMake(comments.frame.origin.x, (comments.frame.origin.y - kbSize.height), comments.frame.size.width, comments.frame.size.height);
//    
//        btnSubmt.frame = CGRectMake(btnSubmt.frame.origin.x, (btnSubmt.frame.origin.y - kbSize.height), btnSubmt.frame.size.width, btnSubmt.frame.size.height);
    
    [UIView commitAnimations];
//
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    scrollView.contentInset = contentInsets;
//    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
//    CGRect aRect = self.view.frame;
//    aRect.size.height -= kbSize.height;
//    
//    if (!CGRectContainsPoint(aRect, comments.frame.origin) ) {
//        CGPoint scrollPoint = CGPointMake(0.0, comments.frame.origin.y-kbSize.height);
//        [scrollView setContentOffset:scrollPoint animated:YES];
//    }
    
    }
    - (void)keyboardWillBeHidden:(NSNotification *)aNotification {
        
        NSDictionary* info = [aNotification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
      
//        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
//        scrollView.contentInset = contentInsets;
//        scrollView.scrollIndicatorInsets = contentInsets;
        
			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDuration:0.0];
			[UIView setAnimationBeginsFromCurrentState:YES];
			toolBar.frame = CGRectMake(toolBar.frame.origin.x, (toolBar.frame.origin.y + kbSize.height), toolBar.frame.size.width, toolBar.frame.size.height);
        [UIView commitAnimations];
	
    }
@end
