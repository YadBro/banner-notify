--[[

BANNER NOTIFICATION | Created by: @blve_hxrizon

The elements must be unfolded in their corresponding parents!

!!! DO NOT CHANGE ANY SCRIPTS IF YOU DO NOT KNOW WHAT YOU ARE DOING !!!
!!!	DO NOT CHANGE ANY ELEMENT'S NAME OR PROPERTIES !!!
!!! THIS MAY RESULT TO CONSTANT BREAKS AND ERRORS !!!

Bugs, Suggestions? Inquire in the devforum post: https://devforum.roblox.com/t/2212832

]]

local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

local info = TweenInfo.new(.5, Enum.EasingStyle.Exponential)

local BannerNotification_Storage__NAME = "BannerNotification_Storage"
local GUI__NAME = "BannerNotification"
local REMOTE__NAME = "BannerNotify"

local default = {
	.3, 							-- Background Transparency
	Color3.fromRGB(0, 0, 0), 		-- Background Color
	
	0, 								-- Content Transparency
	Color3.fromRGB(255, 255, 255), 	-- Content Color
}

local module = {}

local function getNotifyEvent()
	local notifyEvent = replicatedStorage:WaitForChild(BannerNotification_Storage__NAME)[REMOTE__NAME]

	return notifyEvent
end

local function generateGUI()
	local BannerNotification = Instance.new("ScreenGui");
	BannerNotification.DisplayOrder = 100;
	BannerNotification.IgnoreGuiInset = true;
	BannerNotification.Name = GUI__NAME;
	BannerNotification.ResetOnSpawn = false;
	BannerNotification.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
	BannerNotification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	BannerNotification.Parent = game.Players.LocalPlayer.PlayerGui;

	local ActiveNotifications = Instance.new("Frame");
	ActiveNotifications.AnchorPoint = Vector2.new(0.5, 0.5);
	ActiveNotifications.BackgroundTransparency = 1;
	ActiveNotifications.Name = "ActiveNotifications";
	ActiveNotifications.Position = UDim2.new(0.5, 0, 0.5, 0);
	ActiveNotifications.Size = UDim2.new(1, 0, 1, 0);
	ActiveNotifications.Parent = BannerNotification;

	local List = Instance.new("UIListLayout");
	List.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	List.Name = "List";
	List.SortOrder = Enum.SortOrder.LayoutOrder;
	List.Parent = ActiveNotifications;

	local Padding = Instance.new("UIPadding");
	Padding.Name = "Padding";
	Padding.PaddingTop = UDim.new(0, 10);
	Padding.Parent = ActiveNotifications;

	local Canvas = Instance.new("Frame");
	Canvas.AutomaticSize = Enum.AutomaticSize.Y;
	Canvas.BackgroundTransparency = 1;
	Canvas.Name = "Canvas";
	Canvas.Size = UDim2.new(1, 0, 0, 0);
	Canvas.Visible = false;
	Canvas.Parent = BannerNotification;

	local Shape = Instance.new("ImageLabel");
	Shape.AnchorPoint = Vector2.new(0.5, 0.5);
	Shape.BackgroundTransparency = 1;
	Shape.Image = "rbxassetid://11983017276";
	Shape.ImageColor3 = Color3.fromRGB(0, 0, 0);
	Shape.ImageTransparency = 0.5;
	Shape.Name = "Shape";
	Shape.Position = UDim2.new(0.5, 0, 0.5, 0);
	Shape.ScaleType = Enum.ScaleType.Slice;
	Shape.Size = UDim2.new(0, 60, 0, 60);
	Shape.SliceCenter = Rect.new(512, 512, 512, 512);
	Shape.Parent = Canvas;

	local Scale = Instance.new("UIScale");
	Scale.Name = "Scale";
	Scale.Parent = Shape;

	local Notification = Instance.new("ImageLabel");
	Notification.AnchorPoint = Vector2.new(0.5, 0);
	Notification.AutomaticSize = Enum.AutomaticSize.XY;
	Notification.BackgroundTransparency = 1;
	Notification.Image = "rbxassetid://11942813307";
	Notification.ImageColor3 = Color3.fromRGB(0, 0, 0);
	Notification.ImageTransparency = 0.3;
	Notification.Name = "Notification";
	Notification.Position = UDim2.new(0.5, 0, 0, 0);
	Notification.ScaleType = Enum.ScaleType.Slice;
	Notification.SliceCenter = Rect.new(512, 512, 512, 512);
	Notification.Parent = Canvas;

	local Scale = Instance.new("UIScale");
	Scale.Name = "Scale";
	Scale.Parent = Notification;

	local Padding = Instance.new("UIPadding");
	Padding.Name = "Padding";
	Padding.PaddingBottom = UDim.new(0, 5);
	Padding.PaddingLeft = UDim.new(0, 10);
	Padding.PaddingRight = UDim.new(0, 25);
	Padding.PaddingTop = UDim.new(0, 5);
	Padding.Parent = Notification;

	local Icon = Instance.new("ImageLabel");
	Icon.AnchorPoint = Vector2.new(0, 0.5);
	Icon.BackgroundTransparency = 1;
	Icon.Image = "rbxassetid://11326670020";
	Icon.ImageTransparency = 0.1;
	Icon.Name = "Icon";
	Icon.Position = UDim2.new(0, 15, 0.5, 0);
	Icon.ScaleType = Enum.ScaleType.Fit;
	Icon.Size = UDim2.new(0, 30, 0, 30);
	Icon.ZIndex = 2;
	Icon.Parent = Notification;

	local Texts = Instance.new("CanvasGroup");
	Texts.AutomaticSize = Enum.AutomaticSize.XY;
	Texts.BackgroundTransparency = 1;
	Texts.Name = "Texts";
	Texts.Size = UDim2.new(1, -50, 0, 50);
	Texts.Parent = Notification;

	local Header = Instance.new("TextLabel");
	Header.AutomaticSize = Enum.AutomaticSize.XY;
	Header.BackgroundTransparency = 1;
	Header.Font = Enum.Font.GothamMedium;
	Header.FontFace.Family = "rbxasset://fonts/families/GothamSSm.json"
	Header.FontFace.Weight = Enum.FontWeight.Medium
	Header.FontFace.Style = Enum.FontStyle.Normal
	Header.Name = "Header";
	Header.Text = "Header";
	Header.TextColor3 = Color3.fromRGB(255, 255, 255);
	Header.TextSize = 17;
	Header.TextTransparency = 0.1;
	Header.TextWrapped = true;
	Header.TextXAlignment = Enum.TextXAlignment.Left;
	Header.ZIndex = 2;
	Header.Parent = Texts;

	local SizeConstraint = Instance.new("UISizeConstraint");
	SizeConstraint.MaxSize = Vector2.new(300, math.huge);
	SizeConstraint.MinSize = Vector2.new(250, 0);
	SizeConstraint.Name = "SizeConstraint";
	SizeConstraint.Parent = Header;

	local List = Instance.new("UIListLayout");
	List.Name = "List";
	List.Padding = UDim.new(0, 2);
	List.SortOrder = Enum.SortOrder.LayoutOrder;
	List.VerticalAlignment = Enum.VerticalAlignment.Center;
	List.Parent = Texts;

	local Padding = Instance.new("UIPadding");
	Padding.Name = "Padding";
	Padding.PaddingBottom = UDim.new(0, 10);
	Padding.PaddingLeft = UDim.new(0, 65);
	Padding.PaddingTop = UDim.new(0, 10);
	Padding.Parent = Texts;

	local Description = Instance.new("TextLabel");
	Description.AutomaticSize = Enum.AutomaticSize.XY;
	Description.BackgroundTransparency = 1;
	Description.Font = Enum.Font.Gotham;
	Header.FontFace.Family = "rbxasset://fonts/families/GothamSSm.json"
	Header.FontFace.Weight = Enum.FontWeight.Regular
	Header.FontFace.Style = Enum.FontStyle.Normal
	Description.Name = "Description";
	Description.Text = "Description";
	Description.TextColor3 = Color3.fromRGB(255, 255, 255);
	Description.TextSize = 14;
	Description.TextTransparency = 0.5;
	Description.TextWrapped = true;
	Description.TextXAlignment = Enum.TextXAlignment.Left;
	Description.ZIndex = 2;
	Description.Parent = Texts;

	local SizeConstraint = Instance.new("UISizeConstraint");
	SizeConstraint.MaxSize = Vector2.new(300, math.huge);
	SizeConstraint.MinSize = Vector2.new(250, 0);
	SizeConstraint.Name = "SizeConstraint";
	SizeConstraint.Parent = Description;

	local Padding = Instance.new("UIPadding");
	Padding.Name = "Padding";
	Padding.PaddingBottom = UDim.new(0, 10);
	Padding.PaddingTop = UDim.new(0, 10);
	Padding.Parent = Canvas;
end

local function listenServer()
	local notifyEvent = getNotifyEvent()
	local info = TweenInfo.new(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)

	local ui = game.Players.LocalPlayer.PlayerGui:WaitForChild(GUI__NAME);

	local activeFrame = ui.ActiveNotifications
	local canvasTemplate = ui.Canvas

	notifyEvent.OnClientEvent:Connect(function(props)
		local header = props.header
		local description = props.message
		local icon = props.icon
		local duration = props.duration
		local configs = props.configs or default

		local notif = canvasTemplate:Clone()

		--// set up

		notif.Name = header
		notif.Parent = activeFrame

		notif.Notification.Texts.Header.Text = header
		notif.Notification.Texts.Description.Text = description
		notif.Notification.Icon.Image = icon

		notif.Notification.ImageTransparency = 1
		notif.Notification.Icon.ImageTransparency = 1
		notif.Notification.Texts.GroupTransparency = 1

		notif.Shape.ImageColor3 = (configs and configs[2]) or default[2]
		notif.Notification.Texts.GroupColor3 = (configs and configs[4]) or default[4]
		notif.Notification.Icon.ImageColor3 = (configs and configs[4]) or default[4]

		notif.Visible = true

		--// animation initiation

		notif.Shape.Scale.Scale = 0
		notif.Shape.ImageTransparency = 1

		tweenService:Create(notif.Shape, info, {ImageTransparency = (configs and configs[1]) or default[1]}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()

		----------------

		task.wait(.3)

		--// transformed the shape to circle

		notif.Shape.Image = "rbxassetid://11942813307"

		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(notif.Notification.AbsoluteSize.X, notif.Notification.AbsoluteSize.Y)
		}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1}):Play()

		----------------

		task.wait(.1)

		----------------

		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = (configs and configs[3]) or default[3]}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = (configs and configs[3]) or default[3]}):Play()

		--// duration started

		task.wait(duration)

		--// duration ended

		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = 1}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = 1}):Play()

		----------------

		task.wait(.2)

		--// transformed the shape back to circle

		notif.Shape.Image = "rbxassetid://11983017276" -- circle

		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(60, 60), 
			ImageTransparency = (configs and configs[1]) or default[1]}):Play()

		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()

		----------------

		task.wait(.3)

		----------------

		tweenService:Create(notif.Shape, info, {ImageTransparency = 1}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 0}):Play()

		----------------

		task.wait(.3)

		----------------

		tweenService:Create(notif.Padding, info, {PaddingTop = UDim.new(0, 0)}):Play()
		tweenService:Create(notif.Padding, info, {PaddingBottom = UDim.new(0, 0)}):Play()

		tweenService:Create(notif.Notification.Scale, info, {Scale = 0}):Play()

		----------------

		task.wait(.3)

		----------------

		notif:Destroy()
	end)
end

local function generateRemoteEvent()
	local Folder = Instance.new("Folder")
	Folder.Name = BannerNotification_Storage__NAME
	Folder.Parent = replicatedStorage

	local Remote = Instance.new("RemoteEvent")
	Remote.Name = REMOTE__NAME
	Remote.Parent = Folder
end

function module:InitClient()
	assert(runService:IsClient(), "Please running this method on client side!")
	task.wait(0.5)
	generateGUI()
	listenServer()
end

function module:InitServer()
	assert(runService:IsServer(), "Please running this method on server side!")
	generateRemoteEvent()
end

function module:Notify(props)
	local header = props.header
	local description = props.message
	local icon = props.icon
	local duration = props.duration
	local configs = props.configs or default
	local player = props.player or nil
	

	if runService:IsClient() then
		local ui = players.LocalPlayer.PlayerGui:WaitForChild(GUI__NAME)

		local activeFrame = ui.ActiveNotifications
		local canvasTemplate = ui.Canvas
		local notif = canvasTemplate:Clone()
		
		--// set up
		
		notif.Name = header
		notif.Parent = activeFrame
		
		notif.Notification.Texts.Header.Text = header
		notif.Notification.Texts.Description.Text = description
		notif.Notification.Icon.Image = icon
		
		notif.Notification.ImageTransparency = 1
		notif.Notification.Icon.ImageTransparency = 1
		notif.Notification.Texts.GroupTransparency = 1
				
		notif.Shape.ImageColor3 = (configs and configs[2]) or default[2]
		notif.Notification.Texts.GroupColor3 = (configs and configs[4]) or default[4]
		notif.Notification.Icon.ImageColor3 = (configs and configs[4]) or default[4]

		notif.Visible = true

		--// animation initiation
		
		notif.Shape.Scale.Scale = 0
		notif.Shape.ImageTransparency = 1

		tweenService:Create(notif.Shape, info, {ImageTransparency = (configs and configs[1]) or default[1]}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()
		
		----------------

		task.wait(.3)
		
		--// transformed the shape to circle

		notif.Shape.Image = "rbxassetid://11942813307"

		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(notif.Notification.AbsoluteSize.X, notif.Notification.AbsoluteSize.Y)
			}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1}):Play()
		
		----------------

		task.wait(.1)

		----------------
		
		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = (configs and configs[3]) or default[3]}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = (configs and configs[3]) or default[3]}):Play()
		
		--// duration started

		task.wait(duration)

		--// duration ended

		tweenService:Create(notif.Notification.Texts, info, {GroupTransparency = 1}):Play()
		tweenService:Create(notif.Notification.Icon, info, {ImageTransparency = 1}):Play()
		
		----------------

		task.wait(.2)
		
		--// transformed the shape back to circle

		notif.Shape.Image = "rbxassetid://11983017276" -- circle

		tweenService:Create(notif.Shape, info, {Size = UDim2.fromOffset(60, 60), 
			ImageTransparency = (configs and configs[1]) or default[1]}):Play()
		
		tweenService:Create(notif.Shape.Scale, info, {Scale = 1.2}):Play()
		
		----------------
		
		task.wait(.3)
		
		----------------

		tweenService:Create(notif.Shape, info, {ImageTransparency = 1}):Play()
		tweenService:Create(notif.Shape.Scale, info, {Scale = 0}):Play()
		
		----------------

		task.wait(.3)
		
		----------------
		
		tweenService:Create(notif.Padding, info, {PaddingTop = UDim.new(0, 0)}):Play()
		tweenService:Create(notif.Padding, info, {PaddingBottom = UDim.new(0, 0)}):Play()

		tweenService:Create(notif.Notification.Scale, info, {Scale = 0}):Play()
		
		----------------

		task.wait(.3)

		----------------

		notif:Destroy()

	elseif runService:IsServer() then
		local notifyEvent = getNotifyEvent()
		notifyEvent:FireClient(player, props)
	end
end

return module