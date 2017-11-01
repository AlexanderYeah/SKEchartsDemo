//
//  ViewController.m
//  HowToUseEchats
//
//  Created by AY on 2017/11/1.
//  Copyright © 2017年 xunli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

/**  创建一个webview 加载 图标 */
@property (strong,nonatomic)UIWebView *webview;


@end

@implementation ViewController

#pragma mark - lazyload

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
	_webview.delegate = self;
	[self.view addSubview:_webview];
	
	NSString *filePath = [[NSBundle mainBundle]pathForResource:@"line.html" ofType:nil];
	
	NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	[_webview loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
}


//webview加载完成后加载图表数据  
-(void)webViewDidFinishLoad:(UIWebView *)webView  
{  
    //传值标题  
  	NSString *setTitle = @"setTitle数量（吨)";
	[_webview stringByEvaluatingJavaScriptFromString:setTitle];
    //传值X轴  
    [_webview stringByEvaluatingJavaScriptFromString:@"setData(['01','02','03','04','05','06','07','08'])"];
    //柱状图  
	NSString *setValueData = [NSString stringWithFormat:@"setValueData([%@,%@,%@,%@,%@,%@,%@,%@])",@"200",@"100",@"260",@"400",@"100",@"180",@"160",@"250"];
      
    //传值Y轴数据  
    [_webview stringByEvaluatingJavaScriptFromString:setValueData];
      
      
      
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
