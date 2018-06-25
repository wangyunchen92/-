//
//  ViewController.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/11.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "ViewController.h"
#import "boardView.h"

@interface ViewController ()
@property (nonatomic, strong)boardView *boardview;

@property (nonatomic, strong)UILabel *labelText;

@property (nonatomic, strong)UIButton *startbutton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.labelText.center = CGPointMake(self.view.bounds.size.width/2 + 50, self.view.bounds.size.height/2 - 200);
    
    self.startbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.startbutton.center = CGPointMake(self.labelText.center.x - 100, self.labelText.center.y);
    [self.startbutton setTitle:@"开始" forState:UIControlStateNormal];
    [self.startbutton addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchDown];
    [self.startbutton setTitleColor:[UIColor blueColor] forState:0];
    [self.view addSubview:self.startbutton];
    
    [self.view addSubview:self.labelText];
    self.labelText.text = @"白走";
    self.boardview = [[boardView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    
    self.boardview.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [self.view addSubview:self.boardview];
    
    [self.boardview addObserver:self forKeyPath:@"isW" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.boardview.block_finish = ^(BOOL isW) {
        self.labelText.text = isW ? @"白胜" : @"黑胜";
    };
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context{

    if ([keyPath isEqualToString:@"isW"] && object == self.boardview) {
        self.labelText.text = self.boardview.isW ? @"白走" : @"黑走";
    }
}

- (void)start:(UIButton *)sender {
    [self.boardview removeFromSuperview];
    self.boardview = [[boardView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    self.boardview.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [self.view addSubview:self.boardview];
    [self.boardview addObserver:self forKeyPath:@"isW" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.boardview.block_finish = ^(BOOL isW) {
        self.labelText.text = isW ? @"白胜" : @"黑胜";
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
