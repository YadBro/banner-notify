<img src="https://devforum-uploads.s3.dualstack.us-east-2.amazonaws.com/uploads/original/5X/3/5/8/5/3585baca0167f63cc272751c90b84833893eb83a.jpeg" />

<h3 style="text-align: center;">
    ◉ Banner Notify | Best Way to Notify!
    <br />
    (roblox-ts and [rojo and wally] version)
</h3>

<h1>
 📃 Credits
</h1>

<div>

[blve_hxrizon](https://devforum.roblox.com/t/%E2%97%89-banner-notify-best-way-to-notify/2212832/1)

</div>

<h1>
 Introduction
</h1>

<p>
Banner Notifications is intuitive and customizable. You can easily notify a player for what they have done or whatnot.
</p>

## 📦 Installation

This package is available for Roblox TypeScript and [Wally](https://wally.run/package/yadbro/banner-notify).

```bash
npm install @rbxts/banner-notify
```

&nbsp;


## ⚙ Usage

1. You need to initialize client and server. **Remember this initialization only run once!. Recommended place this code in /StarterPlayer/StarterPlayerScripts for client and /ServerScriptService for server**
### Client:
```ts
/*
    (roblox-ts) /client/main.client.ts
*/
    import BannerNotify from "@rbxts/banner-notify";

    BannerNotify.InitClient();
```

```lua
[[--
    (rojo and wally) /client/init.client.luau
]]

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BannerNotify = require(ReplicatedStorage.Packages["banner-notify"])

    BannerNotify:InitClient()
```

### Server:
```ts
/*
    (roblox-ts) /server/main.server.ts
*/
    import BannerNotify from "@rbxts/banner-notify";

    BannerNotify.InitServer();
```

```lua
[[--
    (rojo and wally) /server/init.server.luau
]]

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BannerNotify = require(ReplicatedStorage.Packages["banner-notify"])

    BannerNotify:InitServer()
```

2. Now you can use Banner Notify in client and server with following props.

```ts
/*
    (roblox-ts) /server/main.server.ts
*/
    import BannerNotify from "@rbxts/banner-notify";

    BannerNotify.Notify({
        duration: 3,
        header: "Example In Server",
        icon: "rbxassetid://11326670020",
        message: "Example Banner Notify In Server",
        player,
    });
```

```lua
[[--
    (rojo and wally) /server/init.server.luau
]]

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BannerNotify = require(ReplicatedStorage.Packages["banner-notify"])

    BannerNotify:Notify({
        duration= 1,
        header= "Example",
        icon= "rbxassetid://11326670020",
        message= "Example Banner Notify",
    });
```