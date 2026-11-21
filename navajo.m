#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

@interface MyDelegate : NSObject
- (void)applicationWillFinishLaunching:(NSNotification *)notification;
@end

@implementation MyDelegate
- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
	[NSApp setMainMenu:[[NSMenu new] autorelease]];
	id appMenuItem = [[NSMenuItem new] autorelease];
	id appMenu = [[NSMenu new] autorelease];
	[appMenu addItemWithTitle:[@"Quit " stringByAppendingString:
						    [[NSProcessInfo processInfo]
							    processName]]
			   action:@selector(terminate:)
		    keyEquivalent:@"q"];
	[appMenuItem setSubmenu:appMenu];

	[[NSApp mainMenu] addItem:appMenuItem];

	[NSApp run];
}
@end

int main(int argc, const char *argv[])
{
	[NSApplication sharedApplication];
	[NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

	id delegate = [[MyDelegate alloc] init];

	[NSApp setDelegate:delegate];

	return NSApplicationMain(argc, argv);
}
