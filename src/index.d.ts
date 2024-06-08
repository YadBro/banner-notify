type NotifyPropsConfigs = [number, Color3, number, Color3];

interface NotifyProps {
	/**
	 * 	The big text of the notification
	 */
	header: string;

	/**
	 * The small and translucent text of the notification
	 */
	message: string;

	/**
	 * The image that represents the idea of the notification
	 */
	icon: string;

	/**
	 * 	How long will the notification shown
	 */
	duration: number;

	/**
	 * Table of configurations (optional)
	 *
	 *
	 * @description
	 * ### This Configs Follow:
	 * [Background Transparency, Background Color, Content Transparency, Content Color]
	 */
	configs?: NotifyPropsConfigs;

	/**
	 * Player to show the notification (server only)
	 */
	player?: Player;
}

interface BannerNotify {
	InitServer(): void;
	InitClient(): void;

	/**
	 * 
	 * @example
	 * 
	 * import BannerNotify from "@rbxts/banner-notify"
	 * 
	 * // In this example there is configs. That is a default configs
	 * const configs = [
			.3, // Background Transparency
			Color3.fromRGB(0, 0, 0),    // Background Color
			0,  // Content Transparency
			Color3.fromRGB(255, 255, 255),  // Content Color
		]
	* 
	* BannerNotify.Notify("Header", "Content / Message", "rbxassetid://11326670020", 5, configs)
	* 
	* @description
	* If you require the module on LocalScript then you do not need to comply the player argument.
	*/
	Notify(props: NotifyProps): void;
}

declare const BannerNotify: BannerNotify;
export = BannerNotify;
