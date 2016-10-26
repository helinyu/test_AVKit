//
//  CustomAVPlayer.m
//  test_AVKit
//
//  Created by felix on 2016/10/26.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "CustomAVPlayer.h"
#import <AVKit/AVKit.h>

@interface CustomAVPlayer ()

@property (nonatomic) AVPlayerViewController *playerVC;

@end

@implementation CustomAVPlayer

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initVairables];

}

- (void)initVairables {
    self.playerVC = [AVPlayerViewController new];
    if (self.navigationController) {
//        [self.navigationController pushViewController:self.playerVC animated:true];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
