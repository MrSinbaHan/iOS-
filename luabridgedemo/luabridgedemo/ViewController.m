//
//  ViewController.m
//  luabridgedemo
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "lauxlib.h"
#import "lua.h"
#import "lualib.h"
#import "LuaBridge.h"

@interface ViewController ()
{
    lua_State* L;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    L = [[LuaBridge instance] L];
    NSString* fn = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"lua"];
    if (luaL_dofile(L, [fn UTF8String])) {
        NSLog(@"Lua Error: %s", lua_tostring(L, -1));
    }
    lua_getglobal(L, "addFun");
    
    lua_pushnumber(L, 240);
    lua_pushnumber(L, 315);
    
    if (lua_pcall(L, 2 ,1, 0)) {
        NSLog(@"Lua Error: %s\n, result =%s", lua_tostring(L, -1), lua_tostring(L, -1));
    }else{
        NSLog(@"Lua Error: %s\n, result1 =%s", lua_tostring(L, -2),lua_tostring(L, -1));
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
