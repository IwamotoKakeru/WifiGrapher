//
//  WifiDataScannerTests.m
//  WifiGrapher
//
//  Created by 岩本　翔 on 2026/03/09.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "WifiDataScanner.h"

@interface WifiDataScannerTests : XCTestCase
@end

@implementation WifiDataScannerTests
- (void)testAvailableSSIDReturnsCorrectList {
    id mockInterface = OCMClassMock([CWInterface class]);
    
    id mockNetwork = OCMClassMock([CWNetwork class]);
    NSString *expectedSsid = @"Test_WiFi";
    OCMStub([mockNetwork ssid]).andReturn(expectedSsid);
    
    NSSet *fakeNetworks = [NSSet setWithObject:mockNetwork];
    
    OCMStub([mockInterface scanForNetworksWithSSID:[OCMArg any] error:[OCMArg anyObjectRef]]).andReturn(fakeNetworks);
    
    WifiDataScanner *scanner = [[WifiDataScanner alloc] initWithInterface:mockInterface];
    NSArray *result = [scanner availableSSIDs];
    
    XCTAssertEqual(result.count,1, @"SSIDの数が一致しません");
    XCTAssertEqualObjects(result.firstObject, expectedSsid, @"SSID名が一致しません");
}

- (void)testAvailableSSIDsReturnsEmptyOnError {
    id mockInterface = OCMClassMock([CWInterface class]);
    
    // エラーが発生するケースをシミュレート
    NSError *error = [NSError errorWithDomain:@"com.test" code:500 userInfo:nil];
    OCMStub([mockInterface scanForNetworksWithSSID:nil error:[OCMArg anyObjectRef]])
        .andSetByPointerValue(error) // エラーをセット
        .andReturn(nil);             // 返り値はnil
    
    WifiDataScanner *scanner = [[WifiDataScanner alloc] initWithInterface:mockInterface];
    XCTAssertEqual([[scanner availableSSIDs] count], 0);
}


@end
