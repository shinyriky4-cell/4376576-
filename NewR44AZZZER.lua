-- ═══════════════════════════════════════════════════════════════════════
--  RAZER v6.4 — Full build + DeleteThemeTab
--  Tabs: Main · Player · Settings · Themes
--  DeleteThemeTab() removes the Themes tab at runtime.
--  Obfuscate this file with Moonveil. Do NOT edit the obfuscated output.
-- ═══════════════════════════════════════════════════════════════════════

local _runOK, _runErr = xpcall(function()
    print("[Razer] Boot...")

    local HttpService = game:GetService("HttpService")
    local F
    local SH
    local SaveData = {}

--[(1) CONFIG + UTILS]--
local Lib = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local StatsService = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

Lib.CONFIG = {
    Title = "Razer", Version = "6.4",
    LogoURL = "https://files.catbox.moe/8zmj3s.png",
    LogoFallback = "rbxassetid://6034684930",
    DefaultTheme = "MinimalisticWhite",
    OpenCombo = { Enum.KeyCode.RightShift, Enum.KeyCode.Return },
    PanelKey = Enum.KeyCode.LeftBracket,
    Size = UDim2.fromOffset(640, 470),
    Minimized = UDim2.fromOffset(640, 46),
    Radius = 10, TopBarHeight = 46, StatusHeight = 20,
    RowHeight = 36, IconSize = 18, RowGap = 8,
    PanelWidth = 150, HandleWidth = 10, HandleHeight = 44,
    SideBtnHeight = 34,
    TabXTitleVisible = 190, TabXTitleHidden = 52,
    AssetFolder = "Razer", Debug = true,
    ClickSoundId = "rbxassetid://99097729413607", ClickVolume = 0.5,
    NotificationPosition = "RightBottomCornerNotification",
    PurpleDefault = "#A020F0", SnapDistance = 24,
    SaveFile = "Razer/config.json",
}

Lib.Razer = {
    Tabs = {}, ActiveTab = nil, Saved = {},
    Custom = {}, SliderReg = {}, ToggleReg = {}, DropdownReg = {},
    InputReg = {}, KeybindReg = {}, NotifReg = {},
    Layout = "TopColumn", PanelOpen = false, StatsOn = false,
    _cleaned = false, _frameCount = 0,
}

local CONFIG = Lib.CONFIG
local U = {}

Lib._drag = nil
Lib._dragStats = nil

function U.hex(h)
    h = h:gsub("#",""):lower()
    if #h == 3 then h = h:sub(1,1):rep(2)..h:sub(2,2):rep(2)..h:sub(3,3):rep(2) end
    return Color3.fromRGB(tonumber(h:sub(1,2),16), tonumber(h:sub(3,4),16), tonumber(h:sub(5,6),16))
end

function U.toHex(c)
    return string.format("#%02X%02X%02X",
        math.floor(c.R*255+0.5), math.floor(c.G*255+0.5), math.floor(c.B*255+0.5))
end

function U.parseHex(h)
    if type(h) ~= "string" then return nil end
    h = h:gsub("#",""):gsub("%s",""):lower()
    if #h == 3 then h = h:sub(1,1):rep(2)..h:sub(2,2):rep(2)..h:sub(3,3):rep(2) end
    if #h ~= 6 or not h:match("^%x+$") then return nil end
    return U.hex(h)
end

function U.create(class, props)
    local inst = Instance.new(class)
    local parent
    for k, v in pairs(props or {}) do
        if k == "Parent" then parent = v else inst[k] = v end
    end
    if parent then inst.Parent = parent end
    if (class == "TextButton" or class == "ImageButton") and Lib.Sound then
        inst.MouseButton1Down:Connect(function() Lib.Sound.play() end)
    end
    return inst
end

function U.tween(inst, t, props, style, dir)
    local ti = TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
    local tw = TweenService:Create(inst, ti, props); tw:Play(); return tw
end

function U.corner(p, r)
    if not p then return end
    return U.create("UICorner", { CornerRadius = UDim.new(0, r or CONFIG.Radius), Parent = p })
end

function U.stroke(p, c, th, tr)
    if not p then return end
    local color = c or Color3.new(0.5,0.5,0.5)
    return U.create("UIStroke", {
        Color = color, Thickness = th or 1, Transparency = tr or 0.4,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = p })
end

function U.clamp(n, a, b) return math.max(a, math.min(b, n)) end

function U.hoverScale(inst, hoverMul, baseMul)
    baseMul = baseMul or 1
    hoverMul = hoverMul or 1.05
    local sc = inst:FindFirstChildOfClass("UIScale")
    if not sc then sc = U.create("UIScale", { Parent = inst, Scale = baseMul }) end
    inst.MouseEnter:Connect(function()
        U.tween(sc, 0.14, { Scale = hoverMul }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end)
    inst.MouseLeave:Connect(function()
        U.tween(sc, 0.14, { Scale = baseMul }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end)
    return sc
end

function U.pressPulse(inst)
    local sc = inst:FindFirstChildOfClass("UIScale")
    if not sc then sc = U.create("UIScale", { Parent = inst, Scale = 1 }) end
    inst.MouseButton1Down:Connect(function()
        U.tween(sc, 0.06, { Scale = 0.94 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end)
    inst.MouseButton1Up:Connect(function()
        U.tween(sc, 0.16, { Scale = 1 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)
    inst.MouseLeave:Connect(function()
        U.tween(sc, 0.14, { Scale = 1 }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end)
    return sc
end

Lib.Connections = {}
function U.track(c) table.insert(Lib.Connections, c); return c end
function U.disconnectAll()
    for _, c in ipairs(Lib.Connections) do pcall(function() c:Disconnect() end) end
    Lib.Connections = {}
end

U.track(UserInputService.InputChanged:Connect(function(i)
    local d = Lib._drag
    if not d then return end
    if i.UserInputType == Enum.UserInputType.MouseMovement
    or i.UserInputType == Enum.UserInputType.Touch then
        d.update(i.Position.X)
    end
end))
U.track(UserInputService.InputEnded:Connect(function(i)
    local d = Lib._drag
    if not d then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1
    or i.UserInputType == Enum.UserInputType.Touch then
        Lib._drag = nil
        d.finish()
    end
end))

U.track(UserInputService.InputChanged:Connect(function(i)
    local d = Lib._dragStats
    if not d then return end
    if i.UserInputType == Enum.UserInputType.MouseMovement
    or i.UserInputType == Enum.UserInputType.Touch then
        local dx = i.Position.X - d.startX
        local dy = i.Position.Y - d.startY
        d.panel.Position = UDim2.new(
            d.startPos.X.Scale, d.startPos.X.Offset + dx,
            d.startPos.Y.Scale, d.startPos.Y.Offset + dy)
    end
end))
U.track(UserInputService.InputEnded:Connect(function(i)
    if not Lib._dragStats then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1
    or i.UserInputType == Enum.UserInputType.Touch then
        Lib._dragStats = nil
    end
end))

Lib.Utils = U

--[(2) SOUND + ASSET LOADER]--
local S = {}
local soundPool = {}
local soundPoolIdx = 1
local POOL_SIZE = 6

function S.play()
    if not CONFIG.ClickSoundId or CONFIG.ClickSoundId == "" then return end
    pcall(function()
        if #soundPool == 0 then
            for i = 1, POOL_SIZE do
                local s = Instance.new("Sound")
                s.SoundId = CONFIG.ClickSoundId
                s.Volume = CONFIG.ClickVolume
                s.Parent = SoundService
                soundPool[i] = s
            end
        end
        local s = soundPool[soundPoolIdx]
        soundPoolIdx = soundPoolIdx % POOL_SIZE + 1
        s.TimePosition = 0
        s:Play()
    end)
end

Lib.Sound = S

local A = {}
local ASSET_DIR = CONFIG.AssetFolder .. "/assets"
local assetCache = {}
local hasWrite = type(writefile) == "function"
local hasRead  = type(readfile)  == "function"
local hasFile  = type(isfile)    == "function"
local hasGCA = type(getcustomasset) == "function"

pcall(function()
    if type(isfolder) == "function" and type(makefolder) == "function" then
        if not isfolder(CONFIG.AssetFolder) then makefolder(CONFIG.AssetFolder) end
        if not isfolder(ASSET_DIR) then makefolder(ASSET_DIR) end
    end
end)

local function httpFetch(url)
    local req = request or http_request or (syn and syn.request)
    if req then
        local ok, res = pcall(req, { Url = url, Method = "GET" })
        if ok and type(res) == "table" and res.Body then return res.Body end
    end
    local ok, d = pcall(game.HttpGet, game, url)
    if ok and type(d) == "string" then return d end
    return nil
end

A.httpFetch = httpFetch

local function detectExt(data)
    if type(data) ~= "string" or #data < 8 then return nil end
    local b1, b2 = data:byte(1), data:byte(2)
    if b1 == 0x89 and b2 == 0x50 then return "png" end
    if b1 == 0xFF and b2 == 0xD8 then return "jpg" end
    if b1 == 0x47 and b2 == 0x49 then return "gif" end
    if data:sub(1,4) == "RIFF" and data:sub(9,12) == "WEBP" then return "webp" end
    return nil
end

local CACHE_EXTS = { "png", "jpg", "gif", "webp" }

function A.load(url, name)
    if not url or url == "" or not hasWrite or not hasGCA then return nil end
    if assetCache[name] then return assetCache[name] end

    if type(isfile) == "function" then
        for _, e in ipairs(CACHE_EXTS) do
            local p = ASSET_DIR .. "/" .. name .. "." .. e
            local ok, exists = pcall(isfile, p)
            if ok and exists then
                local ok2, a = pcall(getcustomasset, p)
                if ok2 and type(a) == "string" and a ~= "" then
                    assetCache[name] = a
                    return a
                end
            end
        end
    end

    local data = httpFetch(url)
    if not data or #data < 256 or data:sub(1, 1) == "<" then return nil end

    local e = detectExt(data) or "png"
    local p = ASSET_DIR .. "/" .. name .. "." .. e
    if not pcall(writefile, p, data) then return nil end

    local ok, a = pcall(getcustomasset, p)
    if ok and type(a) == "string" and a ~= "" then
        assetCache[name] = a
        return a
    end
    return nil
end

function A.getLogo()
    local a = A.load(CONFIG.LogoURL, "logo")
    if not a and CONFIG.LogoFallback ~= "" then a = CONFIG.LogoFallback end
    return a
end

Lib.AssetLoader = A

--[(3) THEMES + KEYBIND SERVICE]--
local h = U.hex

local RawThemes = {
    Light = {
        bg=h"#F5F5FA", surface=h"#FFFFFF", surfaceAlt=h"#E4E4EE",
        accent=h"#00AAD2", text=h"#141419", subtext=h"#696976",
        border=h"#D2D2DC", toggleOn=h"#00C85A", toggleOff=h"#D7D7E1",
        separator=h"#DCDCE6", success=h"#00C85A", error=h"#DC3C46",
        icon=h"#3C3C48", notifBg=h"#FFFFFF",
    },
    Dark = {
        bg=h"#16161A", surface=h"#1E1E24", surfaceAlt=h"#2A2A32",
        accent=h"#00E5FF", text=h"#F0F0F5", subtext=h"#9191A0",
        border=h"#34343E", toggleOn=h"#00DC64", toggleOff=h"#2A2A32",
        separator=h"#30303A", success=h"#00DC64", error=h"#DC3C46",
        icon=h"#C8C8D7", notifBg=h"#222228",
    },
    RazerWhite = {
        bg=h"#FFFFFF", surface=h"#FAFAFC", surfaceAlt=h"#F0F0F5",
        accent=h"#A020F0", text=h"#0F0F14", subtext=h"#7A7A88",
        border=h"#E4E4EC", toggleOn=h"#A020F0", toggleOff=h"#E8E8F0",
        separator=h"#EFF5F5", success=h"#00C85A", error=h"#DC3C46",
        icon=h"#3C3C48", notifBg=h"#FFFFFF",
    },
    RazerBlack = {
        bg=h"#0D0D12", surface=h"#16161C", surfaceAlt=h"#1F1F27",
        accent=h"#A020F0", text=h"#F0F0F5", subtext=h"#8A8A98",
        border=h"#252530", toggleOn=h"#A020F0", toggleOff=h"#1F1F27",
        separator=h"#1A1A22", success=h"#00D97A", error=h"#FF4C4C",
        icon=h"#D9D9E0", notifBg=h"#16161C",
    },
    Galaxy = {
        bg=h"#0D0D12", surface=h"#16161C", surfaceAlt=h"#1F1F27",
        accent=h"#A020F0", text=h"#F0F0F5", subtext=h"#8A8A98",
        border=h"#252530", toggleOn=h"#A020F0", toggleOff=h"#1F1F27",
        separator=h"#1A1A22", success=h"#00D97A", error=h"#FF4C4C",
        icon=h"#D9D9E0", notifBg=h"#16161C",
        bgImage    = "https://files.catbox.moe/23twyr.png",
        titleColor = Color3.fromRGB(255, 255, 255),
        minimizeText = Color3.fromRGB(255, 255, 255),
        sliderColor = h"#C77DFF",
        toggleColor = h"#C77DFF",
        tabColor    = h"#C77DFF",
        titleAccentColor = Color3.fromRGB(199, 125, 255),
    },
    Water = {
        bg=h"#0A1A2E", surface=h"#0F2540", surfaceAlt=h"#153354",
        accent=h"#00B4D8", text=h"#E6F3FF", subtext=h"#A8C4D9",
        border=h"#1F3A5A", toggleOn=h"#0077B6", toggleOff=h"#153354",
        separator=h"#1A2E4A", success=h"#00D97A", error=h"#FF4C4C",
        icon=h"#D9E9FF", notifBg=h"#0F2540",
        bgImage    = "https://files.catbox.moe/i825ie.png",
        titleColor = Color3.fromRGB(255, 255, 255),
        minimizeText = Color3.fromRGB(255, 255, 255),
        sliderColor = h"#48CAE4",
        toggleColor = h"#48CAE4",
        tabColor    = h"#48CAE4",
        titleAccentColor = Color3.fromRGB(72, 202, 228),
    },
    Green = {
        bg=h"#0A1A0D", surface=h"#0F2412", surfaceAlt=h"#15331A",
        accent=h"#00C853", text=h"#E6FFE9", subtext=h"#A8D9B1",
        border=h"#1F3A2A", toggleOn=h"#00C853", toggleOff=h"#15331A",
        separator=h"#1A2E22", success=h"#00FF66", error=h"#FF4C4C",
        icon=h"#D9FFE6", notifBg=h"#0F2412",
        bgImage    = "https://files.catbox.moe/zbpy1u.jpg",
        titleColor = Color3.fromRGB(255, 255, 255),
        minimizeText = Color3.fromRGB(255, 255, 255),
        sliderColor = h"#69F0AE",
        toggleColor = h"#69F0AE",
        tabColor    = h"#69F0AE",
        titleAccentColor = Color3.fromRGB(105, 240, 174),
    },
    MinimalisticBlack = {
        bg=h"#0A0A0A", surface=h"#141414", surfaceAlt=h"#1E1E1E",
        accent=h"#E0E0E0", text=h"#F5F5F5", subtext=h"#888888",
        border=h"#262626", toggleOn=h"#A8A8A8", toggleOff=h"#1E1E1E",
        separator=h"#1A1A1A", success=h"#4ADE80", error=h"#EF4444",
        icon=h"#E0E0E0", notifBg=h"#141414",
        bgImage    = "https://files.catbox.moe/0w8r9w.jpg",
        titleColor = Color3.fromRGB(255, 255, 255),
        minimizeText = Color3.fromRGB(255, 255, 255),
        sliderColor = h"#FFFFFF",
        toggleColor = h"#A8A8A8",
        tabColor    = h"#FFFFFF",
        titleAccentColor = Color3.fromRGB(255, 255, 255),
    },
    MinimalisticWhite = {
        bg=h"#FAFAFA", surface=h"#FFFFFF", surfaceAlt=h"#F0F0F0",
        accent=h"#1A1A1A", text=h"#1A1A1A", subtext=h"#777777",
        border=h"#E0E0E0", toggleOn=h"#1A1A1A", toggleOff=h"#E8E8E8",
        separator=h"#EAEAEA", success=h"#16A34A", error=h"#DC2626",
        icon=h"#333333", notifBg=h"#FFFFFF",
        bgImage    = "https://files.catbox.moe/gborr5.jpg",
        titleColor = Color3.fromRGB(20, 20, 20),
        minimizeText = Color3.fromRGB(20, 20, 20),
        sliderColor = h"#1A1A1A",
        toggleColor = h"#1A1A1A",
        tabColor    = h"#1A1A1A",
        titleAccentColor = Color3.fromRGB(26, 26, 26),
    },
}

local Themes = {
    current = CONFIG.DefaultTheme,
    registry = {}, bgMode = "none",
    Raw = RawThemes, _reapply = nil,
}

function Themes:Register(inst, prop, key)
    if not inst then return end
    table.insert(self.registry, { inst = inst, prop = prop, key = key })
    local v = RawThemes[self.current][key]
    if v then inst[prop] = v end
end

function Themes:SetReapplyCallback(cb) self._reapply = cb end

function Themes:Apply(name)
    if not RawThemes[name] then return end
    self.current = name
    local newReg = {}
    for _, e in ipairs(self.registry) do
        if e.inst and e.inst.Parent then
            local target = RawThemes[name][e.key]
            if target then
                if typeof(e.inst[e.prop]) == "Color3" then
                    TweenService:Create(e.inst, TweenInfo.new(0.25), { [e.prop] = target }):Play()
                else
                    e.inst[e.prop] = target
                end
            end
            table.insert(newReg, e)
        end
    end
    self.registry = newReg
    if self._reapply then task.defer(self._reapply) end
end

function Themes:Get(k) return RawThemes[self.current][k] end

Lib.Themes = Themes

local Razer = Lib.Razer

do
    local purple = U.parseHex(CONFIG.PurpleDefault) or Color3.fromRGB(160, 32, 240)
    local raw = RawThemes[CONFIG.DefaultTheme]
    if raw then
        Razer.Custom.slider = raw.sliderColor or purple
        Razer.Custom.toggle = raw.toggleColor or purple
        Razer.Custom.tab    = raw.tabColor    or purple
        Razer.Custom.title  = raw.titleAccentColor or purple
    else
        Razer.Custom.slider = purple
        Razer.Custom.toggle = purple
        Razer.Custom.tab    = purple
        Razer.Custom.title  = purple
    end
end

local K = { registered = {}, capturing = nil }
function K:Register(key, cb) self.registered[key] = cb end
function K:Unregister(key) self.registered[key] = nil end
function K:BeginCapture(cb) self.capturing = cb end

U.track(UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if K.capturing then
        local cb = K.capturing
        K.capturing = nil
        if input.KeyCode ~= Enum.KeyCode.Unknown then cb(input.KeyCode) end
        return
    end
    local cb = K.registered[input.KeyCode]
    if cb then cb() end
end))

Lib.KeybindService = K

--[(4) TOOLTIP + NOTIFICATIONS]--
local Tooltip = {}
local tipBox, tipLabel

local function ensureTip()
    if tipBox then return end
    if not Lib.Shell or not Lib.Shell.Main then return end
    tipBox = U.create("Frame", {
        Name = "Tooltip", Size = UDim2.fromOffset(0,0),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        BackgroundTransparency = 1, Visible = false, ZIndex = 900,
        Parent = Lib.Shell.Main })
    U.corner(tipBox, 6)
    U.stroke(tipBox, Themes:Get("border"), 1, 1)
    Themes:Register(tipBox, "BackgroundColor3", "surface")
    U.create("UIPadding", {
        PaddingLeft = UDim.new(0,8), PaddingRight = UDim.new(0,8),
        PaddingTop = UDim.new(0,5), PaddingBottom = UDim.new(0,5), Parent = tipBox })
    tipLabel = U.create("TextLabel", {
        Size = UDim2.fromOffset(0,0), AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1, Font = Enum.Font.Gotham,
        Text = "", TextSize = 12, TextColor3 = Themes:Get("text"),
        TextTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = tipBox })
    Themes:Register(tipLabel, "TextColor3", "text")
end

function Tooltip.attach(inst, text)
    if not text or text == "" then return end
    ensureTip()
    inst.MouseEnter:Connect(function()
        if not tipBox then return end
        tipLabel.Text = text
        tipBox.Visible = true
        local pos, size = inst.AbsolutePosition, inst.AbsoluteSize
        local mp = Lib.Shell.Main.AbsolutePosition
        tipBox.Position = UDim2.fromOffset(math.max(4, pos.X - mp.X), pos.Y - mp.Y + size.Y + 6)
        U.tween(tipBox, 0.15, { BackgroundTransparency = 0 })
        U.tween(tipLabel, 0.15, { TextTransparency = 0 })
    end)
    inst.MouseLeave:Connect(function()
        if not tipBox then return end
        U.tween(tipBox, 0.12, { BackgroundTransparency = 1 })
        U.tween(tipLabel, 0.12, { TextTransparency = 1 })
        task.delay(0.13, function()
            if tipBox and tipBox.BackgroundTransparency >= 0.99 then
                tipBox.Visible = false
            end
        end)
    end)
end

function Tooltip.hide()
    if tipBox then
        tipBox.Visible = false
        tipBox.BackgroundTransparency = 1
        tipLabel.TextTransparency = 1
    end
end

Lib.Tooltip = Tooltip

local notifParent
do
    local ok, hui = pcall(function() return gethui and gethui() end)
    if ok and hui then notifParent = hui end
    if not notifParent then
        local ok2 = pcall(function()
            local t = Instance.new("Folder"); t.Parent = CoreGui; t:Destroy(); return true
        end)
        if ok2 then notifParent = CoreGui end
    end
    if not notifParent then notifParent = LP:WaitForChild("PlayerGui") end
end

local NotifGui = U.create("ScreenGui", {
    Name = "RazerNotifications", ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true, DisplayOrder = 1001, Parent = notifParent,
})
Lib.NotifGui = NotifGui

local NOTIF_POS = {
    LeftTopCornerNotification = { a = Vector2.new(0,0), p = UDim2.new(0,16,0,16),
        h = Enum.HorizontalAlignment.Left, v = Enum.VerticalAlignment.Top, s = "left" },
    RightTopCornerNotification = { a = Vector2.new(1,0), p = UDim2.new(1,-16,0,16),
        h = Enum.HorizontalAlignment.Right, v = Enum.VerticalAlignment.Top, s = "right" },
    LeftBottomCornerNotification = { a = Vector2.new(0,1), p = UDim2.new(0,16,1,-16),
        h = Enum.HorizontalAlignment.Left, v = Enum.VerticalAlignment.Bottom, s = "left" },
    RightBottomCornerNotification = { a = Vector2.new(1,1), p = UDim2.new(1,-16,1,-16),
        h = Enum.HorizontalAlignment.Right, v = Enum.VerticalAlignment.Bottom, s = "right" },
}

local notifStacks = {}
local function getNotifStack(pos)
    if notifStacks[pos] then return notifStacks[pos] end
    local preset = NOTIF_POS[pos] or NOTIF_POS[CONFIG.NotificationPosition]
    local stack = U.create("Frame", {
        AnchorPoint = preset.a, Position = preset.p,
        Size = UDim2.fromOffset(320, 0), AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1, Parent = NotifGui })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = preset.h, VerticalAlignment = preset.v,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8), Parent = stack })
    notifStacks[pos] = { frame = stack, preset = preset }
    return notifStacks[pos]
end

local notifOrder = 0

function Lib.Notify(opts)
    opts = opts or {}
    local mode = opts.mode or "LogoAndTitle"
    local title = opts.title or CONFIG.Title
    local text = opts.text or ""
    local duration = opts.duration
    if duration == nil then duration = 5 end

    local logo = Lib.AssetLoader.getLogo()
    if not logo and (mode == "LogoOnly" or mode == "LogoAndTitle") then mode = "TitleOnly" end

    notifOrder = notifOrder + 1
    local info = getNotifStack(opts.position or CONFIG.NotificationPosition)
    local side = info.preset.s

    local wrapper = U.create("Frame", {
        Size = UDim2.new(1,0,0,0), BackgroundTransparency = 1,
        ClipsDescendants = true, LayoutOrder = notifOrder, Parent = info.frame })
    U.corner(wrapper, CONFIG.Radius + 2)
    local card = U.create("Frame", {
        Size = UDim2.new(1,0,0,62),
        Position = side == "right" and UDim2.new(1,0,0,0) or UDim2.new(-1,0,0,0),
        BackgroundColor3 = Themes:Get("notifBg"), BorderSizePixel = 0,
        ClipsDescendants = true, Parent = wrapper })
    U.corner(card, CONFIG.Radius + 2)
    U.stroke(card, Themes:Get("border"), 1, 0.4)
    Themes:Register(card, "BackgroundColor3", "notifBg")
    table.insert(Razer.NotifReg, { card = card, wrapper = wrapper })

    U.tween(wrapper, 0.36, { Size = UDim2.new(1,0,0,62) },
        Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    U.tween(card, 0.44, { Position = UDim2.new(0,0,0,0) },
        Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    local padLeft = 12
    if (mode == "LogoOnly" or mode == "LogoAndTitle") and logo then
        local icon = U.create("ImageLabel", {
            Position = UDim2.fromOffset(12, 18), Size = UDim2.fromOffset(26, 26),
            BackgroundTransparency = 1, Image = logo,
            ImageColor3 = Themes:Get("icon"), Parent = card })
        U.corner(icon, 6)
        Themes:Register(icon, "ImageColor3", "icon")
        padLeft = 48
    end

    if mode == "TitleOnly" or mode == "LogoAndTitle" then
        local t1 = U.create("TextLabel", {
            Position = UDim2.fromOffset(padLeft,10), Size = UDim2.new(1,-padLeft-40,0,16),
            BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
            Text = title, TextSize = 13, TextColor3 = Themes:Get("text"),
            TextXAlignment = Enum.TextXAlignment.Left, Parent = card })
        Themes:Register(t1, "TextColor3", "text")
        local t2 = U.create("TextLabel", {
            Position = UDim2.fromOffset(padLeft,28), Size = UDim2.new(1,-padLeft-40,0,24),
            BackgroundTransparency = 1, Font = Enum.Font.Gotham,
            Text = text, TextSize = 12, TextWrapped = true,
            TextColor3 = Themes:Get("subtext"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top, Parent = card })
        Themes:Register(t2, "TextColor3", "subtext")
    else
        local t2 = U.create("TextLabel", {
            Position = UDim2.fromOffset(padLeft,6), Size = UDim2.new(1,-padLeft-40,1,-12),
            BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
            Text = text, TextSize = 13, TextWrapped = true,
            TextColor3 = Themes:Get("text"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center, Parent = card })
        Themes:Register(t2, "TextColor3", "text")
    end

    local x = U.create("TextButton", {
        AnchorPoint = Vector2.new(1,0), Position = UDim2.new(1,-6,0,6),
        Size = UDim2.fromOffset(20,20),
        BackgroundColor3 = Themes:Get("surfaceAlt"),
        BorderSizePixel = 0, AutoButtonColor = false,
        Font = Enum.Font.GothamBold, Text = "×", TextSize = 12,
        TextColor3 = Themes:Get("subtext"), Parent = card })
    U.corner(x, 6)
    Themes:Register(x, "BackgroundColor3", "surfaceAlt")
    Themes:Register(x, "TextColor3", "subtext")
    U.hoverScale(x, 1.15)

    local dismissed = false
    local function dismiss()
        if dismissed then return end
        dismissed = true
        U.tween(card, 0.32, {
            Position = side == "right" and UDim2.new(1,0,0,0) or UDim2.new(-1,0,0,0),
        }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local tw = U.tween(wrapper, 0.32, { Size = UDim2.new(1,0,0,0) },
            Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        tw.Completed:Connect(function() wrapper:Destroy() end)
    end
    x.MouseButton1Click:Connect(dismiss)
    if duration > 0 then task.delay(duration, dismiss) end
    return { dismiss = dismiss }
end

--[(5) STATS + CONTROLS]--
local statsParent = NotifGui.Parent

local StatsGui = U.create("ScreenGui", {
    Name = "RazerStats", ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true, DisplayOrder = 1002, Parent = statsParent })
Lib.StatsGui = StatsGui

local StatsPanel = U.create("Frame", {
    Name = "StatsPanel", AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.new(1, -16, 0, 16),
    Size = UDim2.fromOffset(180, 118),
    BackgroundColor3 = Themes:Get("surface"),
    BorderSizePixel = 0, Visible = false, Parent = StatsGui })
U.corner(StatsPanel, 8)
U.stroke(StatsPanel, Themes:Get("border"), 1, 0.4)
Themes:Register(StatsPanel, "BackgroundColor3", "surface")

local StatsTitle = U.create("TextLabel", {
    Position = UDim2.fromOffset(10, 6), Size = UDim2.new(1, -20, 0, 14),
    BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
    Text = "STATISTICS", TextSize = 10,
    TextColor3 = Themes:Get("subtext"),
    TextXAlignment = Enum.TextXAlignment.Left, Parent = StatsPanel })
Themes:Register(StatsTitle, "TextColor3", "subtext")

local statRows = {}
for i, s in ipairs({
    { key = "fps",     label = "FPS",     init = "60" },
    { key = "ping",    label = "Ping",    init = "0ms" },
    { key = "players", label = "Players", init = "0" },
    { key = "memory",  label = "Memory",  init = "0 MB" },
    { key = "uptime",  label = "Uptime",  init = "00:00:00" },
}) do
    local y = 22 + (i - 1) * 18
    local lbl = U.create("TextLabel", {
        Position = UDim2.fromOffset(10, y), Size = UDim2.new(0.5, -10, 0, 14),
        BackgroundTransparency = 1, Font = Enum.Font.Gotham,
        Text = s.label, TextSize = 11, TextColor3 = Themes:Get("text"),
        TextXAlignment = Enum.TextXAlignment.Left, Parent = StatsPanel })
    Themes:Register(lbl, "TextColor3", "text")
    local val = U.create("TextLabel", {
        Position = UDim2.new(0.5, 0, 0, y), Size = UDim2.new(0.5, -10, 0, 14),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = s.init, TextSize = 11, TextColor3 = Themes:Get("accent"),
        TextXAlignment = Enum.TextXAlignment.Right, Parent = StatsPanel })
    Themes:Register(val, "TextColor3", "accent")
    statRows[s.key] = val
end

StatsPanel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        Lib._dragStats = {
            panel = StatsPanel,
            startX = input.Position.X,
            startY = input.Position.Y,
            startPos = StatsPanel.Position,
        }
    end
end)

local statsStartTime = os.clock()

local function statsLoop()
    local lastCount = Razer._frameCount
    local lastClock = os.clock()
    while Razer.StatsOn do
        task.wait(0.5)
        local nowCount = Razer._frameCount
        local nowClock = os.clock()
        local elapsed = nowClock - lastClock
        if elapsed >= 0.9 then
            local fps = math.floor((nowCount - lastCount) / elapsed + 0.5)
            lastCount = nowCount
            lastClock = nowClock

            local ping = 0
            pcall(function()
                ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            local mem = 0
            pcall(function() mem = math.floor(StatsService:GetTotalMemoryUsageMb()) end)

            if statRows.fps then statRows.fps.Text = tostring(fps) end
            if statRows.ping then statRows.ping.Text = tostring(ping) .. "ms" end
            if statRows.players then statRows.players.Text = tostring(#Players:GetPlayers()) end
            if statRows.memory then statRows.memory.Text = tostring(mem) .. " MB" end
            if statRows.uptime then
                local sec = math.floor(nowClock - statsStartTime)
                local hh = math.floor(sec / 3600); sec = sec % 3600
                local mm = math.floor(sec / 60); sec = sec % 60
                statRows.uptime.Text = string.format("%02d:%02d:%02d", hh, mm, sec)
            end
        end
    end
end

function Lib.SetStats(on)
    Razer.StatsOn = on
    StatsPanel.Visible = on
    if on then task.spawn(statsLoop) end
end

local C = {}

local function buildRow(scroll, indent, order, name, opts)
    opts = opts or {}
    local row = U.create("Frame", {
        Name = tostring(name) .. "Row",
        Size = UDim2.new(1, -indent, 0, CONFIG.RowHeight),
        BackgroundTransparency = 1, LayoutOrder = order, Parent = scroll })
    local labelX = 4
    local right = -4
    local lbl = U.create("TextLabel", {
        Position = UDim2.fromOffset(labelX, 9),
        Size = UDim2.new(1, -labelX + right - 4, 0, 18),
        BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
        Text = tostring(name), TextSize = 14,
        TextColor3 = Themes:Get("text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd, Parent = row })
    Themes:Register(lbl, "TextColor3", "text")
    return row, lbl, right, labelX
end

function C.toggle(scroll, indent, order, name, opts)
    opts = opts or {}
    local default = opts.default or false
    local cb = opts.callback
    local row = buildRow(scroll, indent, order, name, opts)
    local state = default
    local bind

    local keyBtn = U.create("TextButton", {
        Position = UDim2.new(1, -108, 0.5, -12), Size = UDim2.fromOffset(64, 24),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        AutoButtonColor = false, Font = Enum.Font.Gotham,
        Text = "—", TextSize = 12, TextColor3 = Themes:Get("subtext"), Parent = row })
    U.corner(keyBtn, 6)
    U.stroke(keyBtn, Themes:Get("border"), 1, 0.5)
    Themes:Register(keyBtn, "BackgroundColor3", "surface")
    Themes:Register(keyBtn, "TextColor3", "subtext")
    U.hoverScale(keyBtn, 1.06)

    local box = U.create("TextButton", {
        Position = UDim2.new(1, -38, 0.5, -11), Size = UDim2.fromOffset(38, 22),
        BackgroundColor3 = Themes:Get("toggleOff"), BorderSizePixel = 0,
        AutoButtonColor = false, Text = "", Parent = row })
    U.corner(box, 6)
    local boxStroke = U.stroke(box, Themes:Get("border"), 1, 1)

    local knob = U.create("Frame", {
        Position = UDim2.fromOffset(3, 3), Size = UDim2.fromOffset(16, 16),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0, Parent = box })
    U.corner(knob, 8)

    local function onColor() return Razer.Custom.toggle or Themes:Get("toggleOn") end

    local function apply(on, fire)
        state = on
        U.tween(box, 0.18, { BackgroundColor3 = on and onColor() or Themes:Get("toggleOff") })
        if fire and boxStroke then
            boxStroke.Color = on and onColor() or Themes:Get("subtext")
            boxStroke.Transparency = 0
            U.tween(boxStroke, 0.45, { Transparency = 1 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        end
        U.tween(knob, 0.28, {
            Position = on and UDim2.fromOffset(19, 3) or UDim2.fromOffset(3, 3) },
            Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        if fire and cb then pcall(cb, on) end
        if fire then SaveData.queue() end
    end

    box.MouseButton1Click:Connect(function() apply(not state, true) end)
    keyBtn.MouseButton1Click:Connect(function()
        keyBtn.Text = "…"
        K:BeginCapture(function(key)
            if bind then K:Unregister(bind) end
            bind = key
            keyBtn.Text = key.Name
            K:Register(key, function() apply(not state, true) end)
        end)
    end)

    table.insert(Razer.ToggleReg, {
        box = box,
        name = name,
        refresh = function()
            if state then U.tween(box, 0.2, { BackgroundColor3 = onColor() }) end
        end,
        get = function() return state end,
        set = function(v) apply(v, true) end })

    apply(default, false)
    return {
        row = row,
        set = function(v) apply(v, true) end,
        get = function() return state end }
end

function C.slider(scroll, indent, order, name, opts)
    opts = opts or {}
    local min = opts.min or 0
    local max = opts.max or 100
    local default = opts.default or 50
    local cb = opts.callback

    local row, lbl, right, labelX = buildRow(scroll, indent, order, name, opts)
    row.Size = UDim2.new(1, -indent, 0, 48)
    lbl.Position = UDim2.fromOffset(labelX, 4)
    lbl.Size = UDim2.new(1, -labelX - 70, 0, 18)

    local accent = Razer.Custom.slider or Themes:Get("accent")

    local valLbl = U.create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, right, 0, 4),
        Size = UDim2.fromOffset(64, 18), BackgroundTransparency = 1,
        Font = Enum.Font.GothamMedium, Text = tostring(default), TextSize = 13,
        TextColor3 = accent, TextXAlignment = Enum.TextXAlignment.Right, Parent = row })
    Themes:Register(valLbl, "TextColor3", "accent")

    local trk = U.create("Frame", {
        Position = UDim2.fromOffset(4, 30), Size = UDim2.new(1, -8, 0, 6),
        BackgroundColor3 = Themes:Get("surfaceAlt"),
        BorderSizePixel = 0, Parent = row })
    U.corner(trk, 3)
    Themes:Register(trk, "BackgroundColor3", "surfaceAlt")

    local fill = U.create("Frame", {
        Size = UDim2.fromScale((default - min) / (max - min), 1),
        BackgroundColor3 = accent, BorderSizePixel = 0, Parent = trk })
    U.corner(fill, 3)

    local knob = U.create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0, Parent = trk })
    U.corner(knob, 7)
    local knobScale = U.create("UIScale", { Parent = knob, Scale = 1 })

    local currentValue = default

    local function compute(x)
        local rel = U.clamp((x - trk.AbsolutePosition.X) / math.max(1, trk.AbsoluteSize.X), 0, 1)
        local v = math.floor(min + (max - min) * rel + 0.5)
        return v, rel
    end

    local function setVisual(v, rel)
        valLbl.Text = tostring(v)
        fill.Size = UDim2.fromScale(rel, 1)
        knob.Position = UDim2.new(rel, 0, 0.5, 0)
    end

    local function setFromValue(v)
        if type(v) ~= "number" then return end
        if v < min then v = min end
        if v > max then v = max end
        local rel = (max > min) and ((v - min) / (max - min)) or 0
        currentValue = v
        setVisual(v, rel)
    end

    table.insert(Razer.SliderReg, {
        fill = fill, valLbl = valLbl,
        name = name,
        applyColor = function(c)
            fill.BackgroundColor3 = c
            valLbl.TextColor3 = c
        end,
        get = function() return currentValue end,
        set = function(v)
            setFromValue(v)
            if cb then pcall(cb, currentValue) end
        end })

    trk.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then
            S.play()
            knobScale.Scale = 1.4
            U.tween(knobScale, 0.24, { Scale = 1 },
                Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local v, rel = compute(i.Position.X)
            currentValue = v
            setVisual(v, rel)
            Lib._drag = {
                update = function(x)
                    local v2, rel2 = compute(x)
                    currentValue = v2
                    setVisual(v2, rel2)
                end,
                finish = function()
                    if cb then pcall(cb, currentValue) end
                    SaveData.queue()
                end,
            }
        end
    end)

    return { row = row }
end

function C.input(scroll, indent, order, name, opts)
    opts = opts or {}
    local default = opts.default or 0
    local minV, maxV = opts.min, opts.max
    local intOnly = opts.integer ~= false
    local cb = opts.callback

    local row, _, right = buildRow(scroll, indent, order, name, opts)
    local current = default

    local box = U.create("TextBox", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, right, 0.5, 0),
        Size = UDim2.fromOffset(90, 24),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        Font = Enum.Font.Gotham, Text = tostring(default), TextSize = 13,
        TextColor3 = Themes:Get("text"), PlaceholderText = tostring(default),
        PlaceholderColor3 = Themes:Get("subtext"),
        ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Center,
        Parent = row })
    U.corner(box, 6)
    local boxStroke = U.stroke(box, Themes:Get("border"), 1, 0.5)
    Themes:Register(box, "BackgroundColor3", "surface")
    Themes:Register(box, "TextColor3", "text")

    box.Focused:Connect(function()
        U.tween(boxStroke, 0.15, { Color = Razer.Custom.tab or Themes:Get("accent"), Transparency = 0.1 })
    end)
    box.FocusLost:Connect(function()
        U.tween(boxStroke, 0.2, { Color = Themes:Get("border"), Transparency = 0.5 })
    end)

    local function flash(c, dur)
        U.tween(boxStroke, 0.12, { Color = c })
        task.delay(dur or 0.55, function()
            U.tween(boxStroke, 0.3, { Color = Themes:Get("border") })
        end)
    end

    local function clampNum(num)
        if intOnly then num = math.floor(num + 0.5) end
        if minV and num < minV then num = minV end
        if maxV and num > maxV then num = maxV end
        return num
    end

    local function commit()
        local cleaned = (box.Text or ""):gsub("[^%d%.%-]", "")
        local num = tonumber(cleaned)
        if not num then
            flash(Themes:Get("error"))
            box.Text = tostring(current)
            return
        end
        current = clampNum(num)
        box.Text = tostring(current)
        flash(Themes:Get("success"), 0.4)
        if cb then pcall(cb, current) end
        SaveData.queue()
    end

    table.insert(Razer.InputReg, {
        name = name,
        get = function() return current end,
        set = function(v)
            local num = tonumber(v)
            if not num then return end
            current = clampNum(num)
            box.Text = tostring(current)
            if cb then pcall(cb, current) end
        end })

    box.FocusLost:Connect(commit)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        local c = box.Text:gsub("[^%d%.%-]", "")
        if c ~= box.Text then
            box.Text = c
            box.CursorPosition = #c + 1
        end
    end)

    if cb then pcall(cb, default) end
    return { row = row }
end

function C.keybind(scroll, indent, order, name, opts)
    opts = opts or {}
    local default = opts.default
    local cb = opts.callback
    local row, _, right = buildRow(scroll, indent, order, name, opts)

    local btn = U.create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, right, 0.5, 0),
        Size = UDim2.fromOffset(90, 24),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        AutoButtonColor = false, Font = Enum.Font.Gotham,
        Text = default and default.Name or "—", TextSize = 12,
        TextColor3 = Themes:Get("subtext"), Parent = row })
    U.corner(btn, 6)
    U.stroke(btn, Themes:Get("border"), 1, 0.5)
    Themes:Register(btn, "BackgroundColor3", "surface")
    Themes:Register(btn, "TextColor3", "subtext")

    local currentKey = default

    local function setBind(k)
        currentKey = k
        btn.Text = k and k.Name or "—"
        if cb then pcall(cb, k) end
    end

    table.insert(Razer.KeybindReg, {
        name = name,
        get = function() return currentKey end,
        set = function(k)
            if k == nil then
                setBind(nil)
            elseif typeof(k) == "EnumItem" then
                setBind(k)
            end
        end })

    btn.MouseButton1Click:Connect(function()
        btn.Text = "Press…"
        K:BeginCapture(function(key)
            if key == Enum.KeyCode.Backspace then
                setBind(nil)
            else
                setBind(key)
            end
            SaveData.queue()
        end)
    end)

    return { row = row }
end

function C.colorPicker(scroll, indent, order, name, opts)
    opts = opts or {}
    local defaultHex = opts.default or CONFIG.PurpleDefault
    local cb = opts.callback

    local row, _, right = buildRow(scroll, indent, order, name, opts)
    local current = U.parseHex(defaultHex) or Color3.fromRGB(160, 32, 240)

    local swatch = U.create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, right - 94, 0.5, 0),
        Size = UDim2.fromOffset(24, 24),
        BackgroundColor3 = current, BorderSizePixel = 0, Parent = row })
    U.corner(swatch, 4)
    U.stroke(swatch, Themes:Get("border"), 1, 0.3)

    local box = U.create("TextBox", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, right, 0.5, 0),
        Size = UDim2.fromOffset(90, 24),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        Font = Enum.Font.Gotham, Text = U.toHex(current), TextSize = 12,
        TextColor3 = Themes:Get("text"), PlaceholderText = defaultHex,
        PlaceholderColor3 = Themes:Get("subtext"),
        ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Center,
        Parent = row })
    U.corner(box, 6)
    local boxStroke = U.stroke(box, Themes:Get("border"), 1, 0.5)
    Themes:Register(box, "BackgroundColor3", "surface")
    Themes:Register(box, "TextColor3", "text")

    local function flash(c, dur)
        U.tween(boxStroke, 0.12, { Color = c })
        task.delay(dur or 0.55, function()
            U.tween(boxStroke, 0.3, { Color = Themes:Get("border") })
        end)
    end

    local function commit()
        local c = U.parseHex(box.Text or "")
        if not c then
            flash(Themes:Get("error"))
            box.Text = U.toHex(current)
            return
        end
        current = c
        box.Text = U.toHex(c)
        swatch.BackgroundColor3 = c
        flash(Themes:Get("success"), 0.4)
        if cb then pcall(cb, c, U.toHex(c)) end
        SaveData.queue()
    end

    box.FocusLost:Connect(commit)
    if cb then pcall(cb, current, U.toHex(current)) end
    return { row = row, swatch = swatch }
end

Lib.Controls = C

--[(6) CONTAINERS + SHELL]--
local CT = {}

local function makeContainer(scroll, indent)
    local c = { scroll = scroll, indent = indent or 0, _ord = 0 }
    function c:nextOrder() self._ord = self._ord + 1; return self._ord end
    function c:CreateToggle(n,o) return C.toggle(self.scroll, self.indent, self:nextOrder(), n, o) end
    function c:CreateSlider(n,o) return C.slider(self.scroll, self.indent, self:nextOrder(), n, o) end
    function c:CreateInput(n,o) return C.input(self.scroll, self.indent, self:nextOrder(), n, o) end
    function c:CreateKeybind(n,o) return C.keybind(self.scroll, self.indent, self:nextOrder(), n, o) end
    function c:CreateColorPicker(n,o) return C.colorPicker(self.scroll, self.indent, self:nextOrder(), n, o) end
    function c:CreateSection(title) return CT.section(self, title) end
    function c:CreateDropdown(n,o) return CT.dropdown(self, n, o) end
    return c
end

CT.makeContainer = makeContainer

function CT.section(tab, title)
    local hdr = U.create("TextButton", {
        Name = tostring(title) .. "Section",
        Size = UDim2.new(1, -tab.indent, 0, 26),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = tostring(title), TextSize = 12,
        TextColor3 = Themes:Get("subtext"),
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false, LayoutOrder = tab:nextOrder(),
        Parent = tab.scroll })
    Themes:Register(hdr, "TextColor3", "subtext")
    return {
        row = hdr,
        CreateToggle      = function(_,n,o) return tab:CreateToggle(n,o) end,
        CreateSlider      = function(_,n,o) return tab:CreateSlider(n,o) end,
        CreateInput       = function(_,n,o) return tab:CreateInput(n,o) end,
        CreateKeybind     = function(_,n,o) return tab:CreateKeybind(n,o) end,
        CreateColorPicker = function(_,n,o) return tab:CreateColorPicker(n,o) end,
        CreateSection     = function(_,t)   return tab:CreateSection(t) end,
        CreateDropdown    = function(_,n,o) return tab:CreateDropdown(n,o) end,
    }
end

function CT.dropdown(tab, name, opts)
    opts = opts or {}
    local open = opts.default == true

    local header = U.create("TextButton", {
        Name = tostring(name) .. "Header",
        Size = UDim2.new(1, -tab.indent, 0, 34),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        AutoButtonColor = false, Text = "",
        LayoutOrder = tab:nextOrder(), Parent = tab.scroll })
    U.corner(header, 8)
    U.stroke(header, Themes:Get("border"), 1, 0.5)
    Themes:Register(header, "BackgroundColor3", "surface")

    local lbl = U.create("TextLabel", {
        Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -40, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = tostring(name), TextSize = 13,
        TextColor3 = Themes:Get("text"),
        TextXAlignment = Enum.TextXAlignment.Left, Parent = header })
    Themes:Register(lbl, "TextColor3", "text")

    local chev = U.create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold, Text = "▶", TextSize = 10,
        TextColor3 = Themes:Get("subtext"), Parent = header })
    Themes:Register(chev, "TextColor3", "subtext")

    local body = U.create("Frame", {
        Name = tostring(name) .. "Body",
        Size = UDim2.new(1, -tab.indent, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1, Visible = open,
        LayoutOrder = tab:nextOrder(), Parent = tab.scroll })
    U.create("UIPadding", {
        PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 6),
        PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 0),
        Parent = body })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6), Parent = body })

    local bodyC = makeContainer(body, tab.indent + 10)

    local function setOpen(v)
        open = v
        body.Visible = v
        U.tween(chev, 0.28, { Rotation = v and 90 or 0 },
            Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    end
    chev.Rotation = open and 90 or 0
    header.MouseButton1Click:Connect(function() setOpen(not open) end)

    table.insert(Razer.DropdownReg, {
        close = function() if open then setOpen(false) end end })

    return {
        row = header, setOpen = setOpen, isOpen = function() return open end,
        CreateToggle      = function(_,n,o) return bodyC:CreateToggle(n,o) end,
        CreateSlider      = function(_,n,o) return bodyC:CreateSlider(n,o) end,
        CreateInput       = function(_,n,o) return bodyC:CreateInput(n,o) end,
        CreateKeybind     = function(_,n,o) return bodyC:CreateKeybind(n,o) end,
        CreateColorPicker = function(_,n,o) return bodyC:CreateColorPicker(n,o) end,
        CreateSection     = function(_,t)   return bodyC:CreateSection(t) end,
        CreateDropdown    = function(_,n,o) return bodyC:CreateDropdown(n,o) end,
    }
end

Lib.Containers = CT

SH = {}

local function getUiParent()
    local ok, hui = pcall(function() return gethui and gethui() end)
    if ok and hui then return hui end
    local ok2 = pcall(function()
        local t = Instance.new("Folder"); t.Parent = CoreGui; t:Destroy(); return true
    end)
    if ok2 then return CoreGui end
    return LP:WaitForChild("PlayerGui")
end

function SH.build()
    local uiParent = getUiParent()

    local ScreenGui = U.create("ScreenGui", {
        Name = "RazerUI", ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true, DisplayOrder = 999, Parent = uiParent })
    SH.ScreenGui = ScreenGui

    pcall(function()
        Razer._Blur = U.create("BlurEffect", {
            Name = "RazerBlur", Size = 8, Transparency = 0.3, Parent = Lighting })
    end)

    local Main = U.create("Frame", {
        Name = "Main", AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = CONFIG.Size, BackgroundColor3 = Themes:Get("bg"),
        BackgroundTransparency = 0, BorderSizePixel = 0,
        ClipsDescendants = true, Parent = ScreenGui })
    U.corner(Main, CONFIG.Radius)
    U.stroke(Main, Themes:Get("border"), 1, 0.5)
    Themes:Register(Main, "BackgroundColor3", "bg")
    SH.Main = Main
    SH.MainScale = U.create("UIScale", { Parent = Main, Scale = 1 })
    SH._targetScale = 1
    SH._userMainPos = Main.Position
    SH._busy = false

    local BgImage = U.create("ImageLabel", {
        Name = "BgImage",
        Size = UDim2.fromOffset(CONFIG.Size.X.Offset, CONFIG.Size.Y.Offset),
        Position = UDim2.fromOffset(0, 0),
        BackgroundTransparency = 1, Image = "", ImageTransparency = 1,
        ScaleType = Enum.ScaleType.Stretch, ZIndex = -1, Visible = false,
        Parent = Main,
    })
    SH.BgImage = BgImage
    U.corner(BgImage, CONFIG.Radius)

    local BgLogo = U.create("ImageLabel", {
        Name = "BgLogo", Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, Image = "",
        ImageTransparency = 1, ScaleType = Enum.ScaleType.Fit,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Visible = false, ZIndex = 0, Parent = Main })
    SH.BgLogo = BgLogo

    local TopBar = U.create("Frame", {
        Name = "TopBar", Size = UDim2.new(1, 0, 0, CONFIG.TopBarHeight),
        BackgroundTransparency = 1, ZIndex = 10, Parent = Main })
    SH.TopBar = TopBar

    local LogoBtn = U.create("ImageButton", {
        Name = "LogoBtn", Position = UDim2.fromOffset(14, (CONFIG.TopBarHeight - 26) / 2),
        Size = UDim2.fromOffset(26, 26), BackgroundTransparency = 1, Image = "",
        Rotation = 0, AutoButtonColor = false, ZIndex = 11, Parent = TopBar })
    SH.LogoBtn = LogoBtn
    U.hoverScale(LogoBtn, 1.1)

    local TitleContainer = U.create("Frame", {
        Name = "TitleContainer", Position = UDim2.fromOffset(52, 0),
        Size = UDim2.new(0, 130, 1, 0), BackgroundTransparency = 1,
        ZIndex = 11, ClipsDescendants = true, Parent = TopBar })
    SH.TitleContainer = TitleContainer

    local TitleLabel = U.create("TextLabel", {
        Position = UDim2.fromOffset(0, 0), Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = CONFIG.Title, TextSize = 18,
        TextColor3 = Themes:Get("text"), TextTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 12,
        Parent = TitleContainer })
    Themes:Register(TitleLabel, "TextColor3", "text")
    SH.TitleLabel = TitleLabel

    local TitleAccent = U.create("Frame", {
        Position = UDim2.fromOffset(52, CONFIG.TopBarHeight - 12),
        Size = UDim2.fromOffset(52, 2),
        BackgroundColor3 = Razer.Custom.title,
        BorderSizePixel = 0, ZIndex = 11, Parent = TopBar })
    U.corner(TitleAccent, 1)
    SH.TitleAccent = TitleAccent

    local TabBar = U.create("ScrollingFrame", {
        Name = "TabBar", Position = UDim2.fromOffset(CONFIG.TabXTitleVisible, 8),
        Size = UDim2.new(1, -CONFIG.TabXTitleVisible - 60, 0, CONFIG.TopBarHeight - 16),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollingDirection = Enum.ScrollingDirection.X, ScrollingEnabled = true,
        ScrollBarThickness = 0, CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X, ZIndex = 11, Parent = TopBar })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6), Parent = TabBar })
    TabBar.InputChanged:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseWheel then
            local mx = math.max(0, TabBar.AbsoluteCanvasSize.X - TabBar.AbsoluteWindowSize.X)
            TabBar.CanvasPosition = Vector2.new(
                U.clamp(TabBar.CanvasPosition.X - i.Position.Z * 60, 0, mx), 0)
        end
    end)
    SH.TabBar = TabBar

    local Separator = U.create("Frame", {
        Position = UDim2.fromOffset(0, CONFIG.TopBarHeight),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Themes:Get("separator"),
        BorderSizePixel = 0, ZIndex = 2, Parent = Main })
    Themes:Register(Separator, "BackgroundColor3", "separator")

    local SidePanel = U.create("Frame", {
        Name = "SidePanel",
        Position = UDim2.fromOffset(-CONFIG.PanelWidth, CONFIG.TopBarHeight + 1),
        Size = UDim2.new(0, CONFIG.PanelWidth, 1, -(CONFIG.TopBarHeight + 1 + CONFIG.StatusHeight)),
        BackgroundColor3 = Themes:Get("surface"),
        BorderSizePixel = 0, ClipsDescendants = true,
        Visible = false, ZIndex = 5, Parent = Main })
    Themes:Register(SidePanel, "BackgroundColor3", "surface")
    SH.SidePanel = SidePanel

    local SideBgImage = U.create("ImageLabel", {
        Name = "SideBgImage",
        Size = UDim2.fromOffset(CONFIG.Size.X.Offset, CONFIG.Size.Y.Offset),
        Position = UDim2.fromOffset(CONFIG.PanelWidth, -(CONFIG.TopBarHeight + 1)),
        BackgroundTransparency = 1, Image = "", ImageTransparency = 1,
        ScaleType = Enum.ScaleType.Stretch, ZIndex = 0, Visible = false,
        Parent = SidePanel,
    })
    SH.SideBgImage = SideBgImage

    local SideBorder = U.create("Frame", {
        Name = "SideBorder", AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundColor3 = Themes:Get("separator"),
        BorderSizePixel = 0, ZIndex = 2, Parent = SidePanel })
    Themes:Register(SideBorder, "BackgroundColor3", "separator")

    local PanelHeader = U.create("Frame", {
        Name = "PanelHeader", Size = UDim2.new(1, 0, 0, 44),
        BackgroundTransparency = 1, ZIndex = 3, Parent = SidePanel })

    local PanelTitle = U.create("TextLabel", {
        Position = UDim2.fromOffset(16, 0), Size = UDim2.new(1, -60, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = "TABS", TextSize = 11, TextColor3 = Themes:Get("subtext"),
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 3, Parent = PanelHeader })
    Themes:Register(PanelTitle, "TextColor3", "subtext")

    local PanelCloseBtn = U.create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(22, 22),
        BackgroundColor3 = Themes:Get("surfaceAlt"),
        BorderSizePixel = 0, AutoButtonColor = false,
        Font = Enum.Font.GothamBold, Text = "◀", TextSize = 10,
        TextColor3 = Themes:Get("subtext"), ZIndex = 3, Parent = PanelHeader })
    U.corner(PanelCloseBtn, 6)
    Themes:Register(PanelCloseBtn, "BackgroundColor3", "surfaceAlt")
    Themes:Register(PanelCloseBtn, "TextColor3", "subtext")
    U.hoverScale(PanelCloseBtn, 1.1)
    PanelCloseBtn.MouseButton1Click:Connect(function()
        SH.setPanelOpen(false, true)
    end)

    local PanelDivider = U.create("Frame", {
        Name = "PanelDivider", Position = UDim2.fromOffset(0, 44),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Themes:Get("separator"),
        BorderSizePixel = 0, ZIndex = 3, Parent = SidePanel })
    Themes:Register(PanelDivider, "BackgroundColor3", "separator")

    local SideScroll = U.create("ScrollingFrame", {
        Name = "SideScroll", Position = UDim2.fromOffset(0, 46),
        Size = UDim2.new(1, 0, 1, -72),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollBarThickness = 3, ScrollBarImageColor3 = Themes:Get("subtext"),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 3, Parent = SidePanel })
    U.create("UIPadding", {
        PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8),
        Parent = SideScroll })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4), Parent = SideScroll })
    SH.SideScroll = SideScroll

    local PanelFooter = U.create("TextLabel", {
        Position = UDim2.new(0, 0, 1, -20), Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1, Font = Enum.Font.Gotham,
        Text = "Razer v" .. CONFIG.Version, TextSize = 9,
        TextColor3 = Themes:Get("subtext"),
        TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 3, Parent = SidePanel })
    Themes:Register(PanelFooter, "TextColor3", "subtext")

    local OpenHandle = U.create("TextButton", {
        Name = "OpenHandle", AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 2, 0.5, 0),
        Size = UDim2.fromOffset(CONFIG.HandleWidth, CONFIG.HandleHeight),
        BackgroundColor3 = Themes:Get("surfaceAlt"),
        BorderSizePixel = 0, AutoButtonColor = false, Text = "",
        ZIndex = 15, Visible = false, Parent = Main })
    U.corner(OpenHandle, 5)
    U.stroke(OpenHandle, Themes:Get("border"), 1, 0.5)
    Themes:Register(OpenHandle, "BackgroundColor3", "surfaceAlt")

    local OpenArrow = U.create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold, Text = "▶", TextSize = 10,
        TextColor3 = Themes:Get("subtext"), Parent = OpenHandle })
    Themes:Register(OpenArrow, "TextColor3", "subtext")

    OpenHandle.MouseEnter:Connect(function()
        U.tween(OpenHandle, 0.15, {
            Size = UDim2.fromOffset(CONFIG.HandleWidth + 4, CONFIG.HandleHeight) },
            Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end)
    OpenHandle.MouseLeave:Connect(function()
        U.tween(OpenHandle, 0.15, {
            Size = UDim2.fromOffset(CONFIG.HandleWidth, CONFIG.HandleHeight) },
            Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end)
    OpenHandle.MouseButton1Click:Connect(function()
        SH.setPanelOpen(true, true)
    end)
    SH.OpenHandle = OpenHandle

    local Content = U.create("Frame", {
        Name = "Content", Position = UDim2.fromOffset(0, CONFIG.TopBarHeight + 1),
        Size = UDim2.new(1, 0, 1, -(CONFIG.TopBarHeight + 1 + CONFIG.StatusHeight)),
        BackgroundTransparency = 1, ZIndex = 3, Parent = Main })
    SH.Content = Content

    local SearchWrap = U.create("Frame", {
        Position = UDim2.fromOffset(14, 10), Size = UDim2.new(1, -28, 0, 32),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        ZIndex = 4, Parent = Content })
    U.corner(SearchWrap, 8)
    local searchStroke = U.stroke(SearchWrap, Themes:Get("border"), 1, 0.5)
    Themes:Register(SearchWrap, "BackgroundColor3", "surface")

    local SearchBox = U.create("TextBox", {
        Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -24, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.Gotham,
        PlaceholderText = "Search…",
        PlaceholderColor3 = Themes:Get("subtext"),
        Text = "", TextSize = 14, TextColor3 = Themes:Get("text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false, ZIndex = 5, Parent = SearchWrap })
    Themes:Register(SearchBox, "TextColor3", "text")
    Themes:Register(SearchBox, "PlaceholderColor3", "subtext")
    SH.SearchBox = SearchBox

    SearchBox.Focused:Connect(function()
        U.tween(searchStroke, 0.15, {
            Color = Razer.Custom.tab or Themes:Get("accent"), Transparency = 0.1 })
        U.tween(SearchWrap, 0.22, { BackgroundColor3 = Themes:Get("surfaceAlt") },
            Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end)
    SearchBox.FocusLost:Connect(function()
        U.tween(searchStroke, 0.2, {
            Color = Themes:Get("border"), Transparency = 0.5 })
        U.tween(SearchWrap, 0.22, { BackgroundColor3 = Themes:Get("surface") },
            Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end)

    local TabContentHolder = U.create("Frame", {
        Position = UDim2.fromOffset(0, 52), Size = UDim2.new(1, 0, 1, -52),
        BackgroundTransparency = 1, ZIndex = 3, Parent = Content })
    SH.TabContentHolder = TabContentHolder

    local StatusBar = U.create("Frame", {
        Name = "StatusBar", Position = UDim2.new(0, 0, 1, -CONFIG.StatusHeight),
        Size = UDim2.new(1, 0, 0, CONFIG.StatusHeight),
        BackgroundColor3 = Themes:Get("surface"),
        BorderSizePixel = 0, ZIndex = 6, Parent = Main })
    Themes:Register(StatusBar, "BackgroundColor3", "surface")

    local StatusSep = U.create("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = Themes:Get("separator"),
        BorderSizePixel = 0, Parent = StatusBar })
    Themes:Register(StatusSep, "BackgroundColor3", "separator")

    local StatusText = U.create("TextLabel", {
        Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -20, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.Gotham,
        Text = "", TextSize = 11, TextColor3 = Themes:Get("subtext"),
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7, Parent = StatusBar })
    Themes:Register(StatusText, "TextColor3", "subtext")
    SH.StatusText = StatusText

    U.track(RunService.RenderStepped:Connect(function()
        Razer._frameCount = Razer._frameCount + 1
    end))

    task.spawn(function()
        local lastCount = Razer._frameCount
        local lastClock = os.clock()
        while ScreenGui and ScreenGui.Parent do
            task.wait(0.5)
            local nowCount = Razer._frameCount
            local nowClock = os.clock()
            local elapsed = nowClock - lastClock
            if elapsed >= 0.9 then
                local fps = math.floor((nowCount - lastCount) / elapsed + 0.5)
                lastCount = nowCount
                lastClock = nowClock
                local ping = 0
                pcall(function()
                    ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue())
                end)
                StatusText.Text = string.format(
                    "FPS %d  ·  Ping %dms  ·  Players %d  ·  %s",
                    fps, ping, #Players:GetPlayers(), os.date("%H:%M:%S"))
            end
        end
    end)

    local CW = U.create("Frame", {
        Name = "WinControls", AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(56, 24),
        BackgroundTransparency = 1, ZIndex = 11, Parent = TopBar })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 6), Parent = CW })

    local MinBtn = U.create("TextButton", {
        Size = UDim2.fromOffset(22, 22),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        AutoButtonColor = false, Font = Enum.Font.GothamBold,
        Text = "–", TextSize = 14, TextColor3 = Themes:Get("subtext"),
        ZIndex = 12, Parent = CW })
    U.corner(MinBtn, 6)
    Themes:Register(MinBtn, "BackgroundColor3", "surface")
    Themes:Register(MinBtn, "TextColor3", "subtext")
    U.hoverScale(MinBtn, 1.1)
    U.pressPulse(MinBtn)

    local CloseBtn = U.create("TextButton", {
        Size = UDim2.fromOffset(22, 22),
        BackgroundColor3 = Themes:Get("surface"), BorderSizePixel = 0,
        AutoButtonColor = false, Font = Enum.Font.GothamBold,
        Text = "×", TextSize = 14, TextColor3 = Themes:Get("subtext"),
        ZIndex = 12, Parent = CW })
    U.corner(CloseBtn, 6)
    Themes:Register(CloseBtn, "BackgroundColor3", "surface")
    Themes:Register(CloseBtn, "TextColor3", "subtext")
    U.hoverScale(CloseBtn, 1.1)
    U.pressPulse(CloseBtn)

    SH.minimized = false
    SH.uiVisible = true

    local function closeAllDropdowns()
        for _, d in ipairs(Razer.DropdownReg) do
            pcall(function() d.close() end)
        end
    end

    local bgImageCache = {}

    function SH.applyThemeBackground(themeName)
        local raw = RawThemes[themeName]
        if not raw then return end

        local url = raw.bgImage
        local titleCol = raw.titleColor

        if url and url ~= "" then
            local cached = bgImageCache[url]
            if not cached then
                cached = Lib.AssetLoader.load(url, "bg_" .. themeName)
                bgImageCache[url] = cached
            end

            if cached then
                BgImage.Image = cached
                BgImage.ScaleType = Enum.ScaleType.Stretch
                BgImage.Visible = true
                U.tween(BgImage, 0.35, { ImageTransparency = 0.15 })

                if SH.SideBgImage then
                    SH.SideBgImage.Image = cached
                    SH.SideBgImage.ScaleType = Enum.ScaleType.Stretch
                    SH.SideBgImage.Visible = true
                    U.tween(SH.SideBgImage, 0.35, { ImageTransparency = 0.15 })
                end
                U.tween(SidePanel, 0.35, { BackgroundTransparency = 1 })
            else
                U.tween(BgImage, 0.3, { ImageTransparency = 1 })
                task.delay(0.31, function() BgImage.Visible = false end)
                if SH.SideBgImage then
                    U.tween(SH.SideBgImage, 0.3, { ImageTransparency = 1 })
                    task.delay(0.31, function() SH.SideBgImage.Visible = false end)
                end
                U.tween(SidePanel, 0.35, { BackgroundTransparency = 0 })
            end
        else
            U.tween(BgImage, 0.3, { ImageTransparency = 1 })
            task.delay(0.31, function() BgImage.Visible = false end)
            if SH.SideBgImage then
                U.tween(SH.SideBgImage, 0.3, { ImageTransparency = 1 })
                task.delay(0.31, function() SH.SideBgImage.Visible = false end)
            end
            U.tween(SidePanel, 0.35, { BackgroundTransparency = 0 })
        end

        if titleCol then
            TitleLabel.TextColor3 = titleCol
        else
            TitleLabel.TextColor3 = Themes:Get("text")
        end
    end

    function SH.setMinimized(state)
        SH.minimized = state
        if state then
            closeAllDropdowns()
            TabBar.Visible = false
            SidePanel.Visible = false
            OpenHandle.Visible = false
            Content.Visible = false
            StatusBar.Visible = false

            U.tween(Main, 0.32, { Size = CONFIG.Minimized },
                Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

            local raw = RawThemes[Themes.current]
            if raw and raw.minimizeText then
                TitleLabel.TextColor3 = raw.minimizeText
            end
        else
            U.tween(Main, 0.4, { Size = CONFIG.Size },
                Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            task.delay(0.15, function()
                Content.Visible = true
                StatusBar.Visible = true
                if Razer.Layout == "TopColumn" then
                    TabBar.Visible = true
                    SidePanel.Visible = false
                    OpenHandle.Visible = false
                else
                    TabBar.Visible = false
                    SidePanel.Visible = true
                    OpenHandle.Visible = not Razer.PanelOpen
                end
                if Razer.ActiveTab then
                    for _, t in pairs(Razer.Tabs) do
                        if t.scroll then t.scroll.Visible = (t == Razer.ActiveTab) end
                    end
                end
                local raw = RawThemes[Themes.current]
                if raw and raw.titleColor then
                    TitleLabel.TextColor3 = raw.titleColor
                end
            end)
        end
    end

    function SH.showUI()
        if SH._busy then return end
        local wasVisible = SH.uiVisible and ScreenGui.Enabled
        SH.uiVisible = true
        ScreenGui.Enabled = true
        if Lib.StatsGui then Lib.StatsGui.Enabled = true end
        if wasVisible then return end
        SH._busy = true

        local base = SH._userMainPos or SH.Main.Position
        SH._userMainPos = base

        if Razer._Blur then
            Razer._Blur.Size = 0
            Razer._Blur.Transparency = 1
            U.tween(Razer._Blur, 0.55, { Size = 8, Transparency = 0.3 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        end

        SH.MainScale.Scale = SH._targetScale * 0.72
        SH.Main.Position = UDim2.new(base.X.Scale, base.X.Offset,
                                     base.Y.Scale, base.Y.Offset - 42)
        SH.StatusText.TextTransparency = 1

        U.tween(SH.MainScale, 0.6, { Scale = SH._targetScale },
            Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        U.tween(SH.Main, 0.5, { Position = base },
            Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

        task.delay(0.2, function()
            U.tween(SH.StatusText, 0.32, { TextTransparency = 0 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        end)

        task.delay(0.7, function() SH._busy = false end)
    end

    function SH.hideUI()
        if SH._busy then return end
        if not SH.uiVisible then return end
        SH._busy = true
        SH.uiVisible = false
        closeAllDropdowns()

        local base = SH._userMainPos or SH.Main.Position
        SH._userMainPos = base

        U.tween(SH.StatusText, 0.18, { TextTransparency = 1 },
            Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        if Razer._Blur then
            U.tween(Razer._Blur, 0.4, { Size = 0, Transparency = 1 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        end

        task.delay(0.05, function()
            U.tween(SH.MainScale, 0.42, { Scale = SH._targetScale * 0.72 },
                Enum.EasingStyle.Back, Enum.EasingDirection.In)
            U.tween(SH.Main, 0.46,
                { Position = UDim2.new(base.X.Scale, base.X.Offset,
                                       base.Y.Scale, base.Y.Offset - 42) },
                Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        end)

        task.delay(0.6, function()
            ScreenGui.Enabled = false
            if Lib.StatsGui then Lib.StatsGui.Enabled = false end
            SH.MainScale.Scale = SH._targetScale
            SH.Main.Position = base
            SH.StatusText.TextTransparency = 0
            SH._busy = false
        end)
    end

    function SH.animateExit(thenFn)
        if not SH.Main then if thenFn then thenFn() end return end
        for _, d in ipairs(SH.Main:GetDescendants()) do
            if d:IsA("GuiObject") then
                U.tween(d, 0.3, { BackgroundTransparency = 1 },
                    Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
                    U.tween(d, 0.3, { TextTransparency = 1 })
                end
                if d:IsA("ImageLabel") or d:IsA("ImageButton") then
                    U.tween(d, 0.3, { ImageTransparency = 1 })
                end
            elseif d:IsA("UIStroke") then
                U.tween(d, 0.3, { Transparency = 1 })
            end
        end
        if SH.MainScale then
            U.tween(SH.MainScale, 0.34, { Scale = 0.82 },
                Enum.EasingStyle.Back, Enum.EasingDirection.In)
        end
        if Lib.NotifGui then
            for _, s in ipairs(Lib.NotifGui:GetDescendants()) do
                if s:IsA("GuiObject") then
                    U.tween(s, 0.25, { BackgroundTransparency = 1 })
                    if s:IsA("TextLabel") or s:IsA("TextButton") then
                        U.tween(s, 0.25, { TextTransparency = 1 })
                    end
                end
            end
        end
        task.delay(0.36, function() if thenFn then thenFn() end end)
    end

    function SH.toggleVis()
        if SH.minimized then
            SH.setMinimized(false)
            SH.showUI()
            if Razer.ActiveTab then
                for _, t in pairs(Razer.Tabs) do
                    if t.scroll then t.scroll.Visible = (t == Razer.ActiveTab) end
                end
            end
            return
        end
        if SH.uiVisible then
            SH.hideUI()
        else
            SH.showUI()
        end
    end

    MinBtn.MouseButton1Click:Connect(function()
        SH.setMinimized(not SH.minimized)
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        local overlay = U.create("Frame", {
            Name = "CloseOverlay", Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.new(0, 0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ZIndex = 500, Parent = ScreenGui })
        local card = U.create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(320, 160),
            BackgroundColor3 = Themes:Get("surface"),
            BorderSizePixel = 0, ZIndex = 501, Parent = overlay })
        U.corner(card, CONFIG.Radius)
        U.stroke(card, Themes:Get("border"), 1, 0.3)
        local cardScale = U.create("UIScale", { Parent = card, Scale = 0.82 })

        U.tween(overlay, 0.22, { BackgroundTransparency = 0.5 })
        U.tween(cardScale, 0.34, { Scale = 1 },
            Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        U.create("TextLabel", {
            Position = UDim2.fromOffset(20, 20), Size = UDim2.new(1, -40, 0, 24),
            BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
            Text = "Close Razer?", TextSize = 16,
            TextColor3 = Themes:Get("text"),
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 502, Parent = card })
        U.create("TextLabel", {
            Position = UDim2.fromOffset(20, 50), Size = UDim2.new(1, -40, 0, 50),
            BackgroundTransparency = 1, Font = Enum.Font.Gotham,
            Text = "All features will turn off and Razer will be removed.\nYou'll need to re-execute to reopen.",
            TextSize = 13, TextWrapped = true,
            TextColor3 = Themes:Get("subtext"),
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 502, Parent = card })

        local function closeOverlay(thenFn)
            U.tween(overlay, 0.2, { BackgroundTransparency = 1 },
                Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            U.tween(cardScale, 0.2, { Scale = 0.82 },
                Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            task.delay(0.21, function()
                overlay:Destroy()
                if thenFn then thenFn() end
            end)
        end

        local function mk(label, x, col, fn)
            local b = U.create("TextButton", {
                Position = UDim2.new(x, 20, 1, -56), Size = UDim2.new(0.5, -25, 0, 32),
                BackgroundColor3 = col, BorderSizePixel = 0,
                AutoButtonColor = false, Font = Enum.Font.GothamBold,
                Text = label, TextSize = 14,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                ZIndex = 502, Parent = card })
            U.corner(b, 8)
            U.hoverScale(b, 1.03)
            b.MouseButton1Click:Connect(fn)
        end
        mk("Cancel", 0, Themes:Get("surfaceAlt"), function() closeOverlay() end)
        mk("Close", 0.5, Color3.fromRGB(220, 60, 70), function()
            closeOverlay(function()
                SH.animateExit(function() Lib.Cleanup() end)
            end)
        end)
    end)

    SH.titleVisible = true
    local accumRot = 0

    function SH.setTitleVisible(v)
        SH.titleVisible = v
        if Razer.Layout == "TopColumn" then
            local targetX = v and CONFIG.TabXTitleVisible or CONFIG.TabXTitleHidden
            U.tween(TabBar, 0.4, {
                Position = UDim2.fromOffset(targetX, 8),
                Size = UDim2.new(1, -targetX - 60, 0, CONFIG.TopBarHeight - 16) },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        end
        if v then
            TitleContainer.Position = UDim2.fromOffset(30, 0)
            TitleLabel.TextTransparency = 1
            TitleLabel.TextSize = 14
            TitleAccent.BackgroundTransparency = 1
            TitleAccent.Size = UDim2.fromOffset(0, 2)
            U.tween(TitleContainer, 0.45, { Position = UDim2.fromOffset(52, 0) },
                Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            U.tween(TitleLabel, 0.35, { TextTransparency = 0, TextSize = 18 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            U.tween(TitleAccent, 0.5, {
                BackgroundTransparency = 0, Size = UDim2.fromOffset(52, 2) },
                Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        else
            U.tween(TitleContainer, 0.35, { Position = UDim2.fromOffset(30, 0) },
                Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            U.tween(TitleLabel, 0.3, { TextTransparency = 1, TextSize = 14 },
                Enum.EasingStyle.Quart, Enum.EasingDirection.In)
            U.tween(TitleAccent, 0.3, {
                BackgroundTransparency = 1, Size = UDim2.fromOffset(0, 2) },
                Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        end
    end

    LogoBtn.MouseButton1Click:Connect(function()
        local delta = SH.titleVisible and -360 or 360
        accumRot = accumRot + delta
        TweenService:Create(LogoBtn,
            TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
            { Rotation = accumRot }):Play()
        SH.setTitleVisible(not SH.titleVisible)
    end)

    function SH.setPanelOpen(v, animated)
        Razer.PanelOpen = v
        if animated == nil then animated = true end
        local dur = animated and 0.32 or 0
        local targetX = v and 0 or -CONFIG.PanelWidth

        U.tween(SidePanel, dur, {
            Position = UDim2.fromOffset(targetX, CONFIG.TopBarHeight + 1) },
            Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        if SH.SideBgImage then
            U.tween(SH.SideBgImage, dur, {
                Position = UDim2.fromOffset(-targetX, -(CONFIG.TopBarHeight + 1)) },
                Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        end

        local contentOffset = (Razer.Layout == "LeftColumn" and v) and CONFIG.PanelWidth or 0
        U.tween(Content, dur, {
            Position = UDim2.fromOffset(contentOffset, CONFIG.TopBarHeight + 1),
            Size = UDim2.new(1, -contentOffset, 1,
                -(CONFIG.TopBarHeight + 1 + CONFIG.StatusHeight)) },
            Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        if Razer.Layout == "LeftColumn" then
            OpenHandle.Visible = not v
        else
            OpenHandle.Visible = false
        end
    end

    function SH.setLayout(mode)
        Razer.Layout = mode
        if mode == "TopColumn" then
            TabBar.Visible = true
            SidePanel.Visible = false
            OpenHandle.Visible = false
            Razer.PanelOpen = false
            SidePanel.Position = UDim2.fromOffset(-CONFIG.PanelWidth, CONFIG.TopBarHeight + 1)
            if SH.SideBgImage then
                SH.SideBgImage.Position = UDim2.fromOffset(CONFIG.PanelWidth, -(CONFIG.TopBarHeight + 1))
            end
            Content.Position = UDim2.fromOffset(0, CONFIG.TopBarHeight + 1)
            Content.Size = UDim2.new(1, 0, 1, -(CONFIG.TopBarHeight + 1 + CONFIG.StatusHeight))
            local targetX = SH.titleVisible and CONFIG.TabXTitleVisible or CONFIG.TabXTitleHidden
            TabBar.Position = UDim2.fromOffset(targetX, 8)
            TabBar.Size = UDim2.new(1, -targetX - 60, 0, CONFIG.TopBarHeight - 16)
        else
            TabBar.Visible = false
            SidePanel.Visible = true
            SH.setPanelOpen(true, true)
        end
        if Razer.ActiveTab then
            for _, t in pairs(Razer.Tabs) do
                if t.scroll then t.scroll.Visible = (t == Razer.ActiveTab) end
            end
        end
    end

    do
        local dragging, start, startPos
        TopBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                start = input.Position
                startPos = Main.Position
            end
        end)
        U.track(UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
                local d = input.Position - start
                Main.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + d.X,
                    startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end))
        U.track(UserInputService.InputEnded:Connect(function(input)
            if not dragging then return end
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then return end
            dragging = false
            SH._userMainPos = Main.Position
            local vp = Camera.ViewportSize
            local sz = Main.AbsoluteSize
            local ps = Main.AbsolutePosition
            local snap = CONFIG.SnapDistance
            local nx, ny = ps.X, ps.Y
            local moved = false
            if ps.X < snap then nx = 0; moved = true
            elseif ps.X + sz.X > vp.X - snap then nx = vp.X - sz.X; moved = true end
            if ps.Y < snap then ny = 0; moved = true
            elseif ps.Y + sz.Y > vp.Y - snap then ny = vp.Y - sz.Y; moved = true end
            if moved then
                U.tween(Main, 0.2, { Position = UDim2.fromOffset(nx, ny) },
                    Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                task.delay(0.21, function() SH._userMainPos = Main.Position end)
            end
        end))
    end

    local heldKeys = {}
    local comboFired = false

    local function comboHeld()
        for _, k in ipairs(CONFIG.OpenCombo) do
            if not heldKeys[k] then return false end
        end
        return true
    end

    U.track(UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if K.capturing then return end

        heldKeys[input.KeyCode] = true

        if not comboFired and comboHeld() then
            comboFired = true
            SH.toggleVis()
            return
        end

        if input.KeyCode == CONFIG.PanelKey and Razer.Layout == "LeftColumn" then
            SH.setPanelOpen(not Razer.PanelOpen, true)
            return
        end
    end))

    U.track(UserInputService.InputEnded:Connect(function(input)
        heldKeys[input.KeyCode] = nil
        if not comboHeld() then
            comboFired = false
        end
    end))

    task.spawn(function()
        local logo = Lib.AssetLoader.getLogo()
        if logo then
            LogoBtn.Image = logo
            BgLogo.Image = logo
        else
            LogoBtn.Visible = false
        end
    end)

    Themes:SetReapplyCallback(function()
        if Razer.Custom.title then
            TitleAccent.BackgroundColor3 = Razer.Custom.title
        end
        if Razer.Custom.slider then
            for _, s in ipairs(Razer.SliderReg) do
                if s.fill and s.fill.Parent then s.applyColor(Razer.Custom.slider) end
            end
        end
        if Razer.Custom.tab and Razer.ActiveTab then
            Razer.ActiveTab.pill.TextColor3 = Razer.Custom.tab
            if Razer.ActiveTab.sideLabel then
                Razer.ActiveTab.sideLabel.TextColor3 = Razer.Custom.tab
            end
            if Razer.ActiveTab.sideBar then
                Razer.ActiveTab.sideBar.BackgroundColor3 = Razer.Custom.tab
            end
        end
        for _, t in ipairs(Razer.ToggleReg) do
            if t.box and t.box.Parent and t.refresh then t.refresh() end
        end

        local nr = {}
        for _, n in ipairs(Razer.NotifReg) do
            if n.card and n.card.Parent then
                local c = n.card:FindFirstChildOfClass("UICorner")
                if c then c.CornerRadius = UDim.new(0, CONFIG.Radius + 2)
                else U.corner(n.card, CONFIG.Radius + 2) end
                if n.wrapper and n.wrapper.Parent then
                    local wc = n.wrapper:FindFirstChildOfClass("UICorner")
                    if wc then wc.CornerRadius = UDim.new(0, CONFIG.Radius + 2)
                    else U.corner(n.wrapper, CONFIG.Radius + 2) end
                end
                table.insert(nr, n)
            end
        end
        Razer.NotifReg = nr

        SH.applyThemeBackground(Themes.current)
    end)
end

-- ═══════════════════════════════════════════════════════════════════════
--  SH.createTab — now with :Destroy() for runtime removal
-- ═══════════════════════════════════════════════════════════════════════
function SH.createTab(name)
    local pill = U.create("TextButton", {
        Name = tostring(name) .. "Tab",
        Size = UDim2.fromOffset(80, CONFIG.TopBarHeight - 16),
        BackgroundColor3 = Themes:Get("bg"), BackgroundTransparency = 1,
        BorderSizePixel = 0, AutoButtonColor = false,
        Font = Enum.Font.GothamMedium, Text = tostring(name),
        TextSize = 14, TextColor3 = Themes:Get("subtext"), Parent = SH.TabBar })
    U.corner(pill, (CONFIG.TopBarHeight - 16) / 2)
    U.hoverScale(pill, 1.05)
    U.pressPulse(pill)

    local side = U.create("TextButton", {
        Name = tostring(name) .. "SideBtn",
        Size = UDim2.new(1, 0, 0, CONFIG.SideBtnHeight),
        BackgroundColor3 = Themes:Get("surfaceAlt"),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        AutoButtonColor = false, Text = "", Parent = SH.SideScroll })
    U.corner(side, 8)

    local sideBar = U.create("Frame", {
        Name = "AccentBar", AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromOffset(4, CONFIG.SideBtnHeight / 2),
        Size = UDim2.new(0, 3, 1, -14),
        BackgroundColor3 = Razer.Custom.tab or Themes:Get("accent"),
        BackgroundTransparency = 1, BorderSizePixel = 0, Parent = side })
    U.corner(sideBar, 2)

    local sideLabel = U.create("TextLabel", {
        Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -14, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
        Text = tostring(name), TextSize = 13,
        TextColor3 = Themes:Get("subtext"),
        TextXAlignment = Enum.TextXAlignment.Left, Parent = side })

    side.MouseEnter:Connect(function()
        if Razer.ActiveTab ~= tab then
            U.tween(side, 0.15, { BackgroundTransparency = 0.6 })
        end
    end)
    side.MouseLeave:Connect(function()
        if Razer.ActiveTab ~= tab then
            U.tween(side, 0.15, { BackgroundTransparency = 1 })
        end
    end)

    local scroll = U.create("ScrollingFrame", {
        Name = "Scroll_" .. tostring(name),
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Razer.Custom.tab or Themes:Get("accent"),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false, Parent = SH.TabContentHolder })
    U.create("UIPadding", {
        PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14),
        PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 14),
        Parent = scroll })
    U.create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, CONFIG.RowGap), Parent = scroll })

    local tab = CT.makeContainer(scroll, 0)
    tab.name = name
    tab.pill = pill
    tab.sideBtn = side
    tab.sideBar = sideBar
    tab.sideLabel = sideLabel

    tab._setActive = function(state)
        local accent = Razer.Custom.tab or Themes:Get("accent")
        U.tween(pill, 0.18, {
            BackgroundTransparency = state and 0 or 1,
            BackgroundColor3 = state and Themes:Get("surfaceAlt") or Themes:Get("bg"),
            TextColor3 = state and accent or Themes:Get("subtext") })
        U.tween(side, 0.2, {
            BackgroundTransparency = state and 0 or 1,
            BackgroundColor3 = state and Themes:Get("surfaceAlt") or Themes:Get("bg") })
        U.tween(sideLabel, 0.2, {
            TextColor3 = state and accent or Themes:Get("subtext") })
        U.tween(sideBar, 0.22, {
            BackgroundTransparency = state and 0 or 1,
            BackgroundColor3 = accent },
            Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end

    tab.onActivated = function()
        for _, t in pairs(Razer.Tabs) do
            if t.scroll then t.scroll.Visible = (t == Razer.ActiveTab) end
        end
    end

    local function activate()
        if tab._destroyed then return end
        if Razer.ActiveTab == tab then return end
        if Razer.ActiveTab then Razer.ActiveTab._setActive(false) end
        Razer.ActiveTab = tab
        tab._setActive(true)
        tab.onActivated()
        Tooltip.hide()
    end
    tab.Activate = activate

    pill.MouseButton1Click:Connect(activate)
    side.MouseButton1Click:Connect(activate)

    -- ── tab:Destroy() ─────────────────────────────────────────────
    -- Removes this tab from the shell entirely: pill, side button,
    -- content scroll frame. If it was the active tab, switches to
    -- another live tab (or leaves ActiveTab = nil if none remain).
    -- Idempotent — safe to call repeatedly.
    function tab.Destroy()
        if tab._destroyed then return false end
        tab._destroyed = true

        if Razer.ActiveTab == tab then
            Razer.ActiveTab = nil
            for _, other in pairs(Razer.Tabs) do
                if other ~= tab and not other._destroyed then
                    other.Activate()
                    break
                end
            end
        end

        pcall(function() pill:Destroy() end)
        pcall(function() side:Destroy() end)
        pcall(function() scroll:Destroy() end)

        Razer.Tabs[name] = nil
        return true
    end

    Razer.Tabs[name] = tab
    return tab
end

function Lib.Cleanup()
    if Razer._cleaned then return end
    Razer._cleaned = true

    pcall(function() SaveData.save() end)

    pcall(function()
        if Lib.Features and Lib.Features.SetFly then
            Lib.Features.SetFly(false)
        end
    end)

    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        pcall(function()
            hum.WalkSpeed = 16
            hum.UseJumpPower = true
            hum.JumpPower = 50
        end)
    end

    pcall(U.disconnectAll)
    if Razer._Blur then pcall(function() Razer._Blur:Destroy() end) end
    pcall(function() SH.ScreenGui:Destroy() end)
    pcall(function() Lib.NotifGui:Destroy() end)
    pcall(function() Lib.StatsGui:Destroy() end)
    for _, s in ipairs(soundPool) do pcall(function() s:Destroy() end) end
    print("[Razer] Unloaded.")
end

Lib.Shell = SH

--[(7) FEATURES]--
F = {}

function F.SetSpeed(v)
    Razer.Saved.walkSpeed = v
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = v end
end

function F.SetJump(v)
    Razer.Saved.jumpPower = v
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.UseJumpPower = true
        hum.JumpPower = v
    end
end

function F.applyThemeCustoms(name)
    local raw = RawThemes[name]
    if not raw then return end
    local purple = U.parseHex(CONFIG.PurpleDefault) or Color3.fromRGB(160, 32, 240)
    Razer.Custom.slider = raw.sliderColor or purple
    Razer.Custom.toggle = raw.toggleColor or purple
    Razer.Custom.tab    = raw.tabColor    or purple
    Razer.Custom.title  = raw.titleAccentColor or purple
    F.refreshCustoms()
end

function F.refreshCustoms()
    if Razer.Custom.slider then
        for _, s in ipairs(Razer.SliderReg) do
            if s.fill and s.fill.Parent then s.applyColor(Razer.Custom.slider) end
        end
    end
    for _, t in ipairs(Razer.ToggleReg) do
        if t.box and t.box.Parent and t.refresh then t.refresh() end
    end
    if Razer.Custom.tab then
        for _, t in pairs(Razer.Tabs) do
            if t._setActive then t._setActive(Razer.ActiveTab == t) end
        end
    end
    if Razer.Custom.title and SH.TitleAccent then
        U.tween(SH.TitleAccent, 0.28, { BackgroundColor3 = Razer.Custom.title })
    end
end

do
    local flying, bv, bg, flyConn, flySpeed = false, nil, nil, nil, 50
    local function startFly()
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        flying = true
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.zero
        bv.Parent = hrp
        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 1000
        bg.Parent = hrp
        flyConn = RunService.Heartbeat:Connect(function()
            if not flying then return end
            local dir = Vector3.zero
            local cam = Camera.CFrame
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end
            bv.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.zero
            bg.CFrame = cam
        end)
    end
    local function stopFly()
        flying = false
        if flyConn then flyConn:Disconnect() end
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
    function F.SetFly(on) if on then startFly() else stopFly() end end
    function F.SetFlySpeed(v) flySpeed = v end
end

LP.CharacterAdded:Connect(function()
    task.wait(0.6)
    if Razer.Saved.jumpPower then F.SetJump(Razer.Saved.jumpPower) end
    if Razer.Saved.walkSpeed then F.SetSpeed(Razer.Saved.walkSpeed) end
end)

function F.setBackgroundMode(mode)
    Themes.bgMode = mode
    local BgLogo = SH.BgLogo
    if mode == "razer_white" then
        BgLogo.Visible = true
        BgLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
        U.tween(BgLogo, 0.3, { ImageTransparency = 0.94 })
    elseif mode == "razer_black" then
        BgLogo.Visible = true
        BgLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
        U.tween(BgLogo, 0.3, { ImageTransparency = 0.92 })
    else
        U.tween(BgLogo, 0.25, { ImageTransparency = 1 })
        task.delay(0.25, function() BgLogo.Visible = false end)
    end
end

Lib.Features = F

SH.build()

-- ═══════════════════════════════════════════════════════════════════════
--  BUILD TABS + FEATURES
-- ═══════════════════════════════════════════════════════════════════════

local mainTab     = SH.createTab("Main")
local playerTab   = SH.createTab("Player")
local settingsTab = SH.createTab("Settings")
local themesTab   = SH.createTab("Themes")

-- Keep a reference so DeleteThemeTab can find it even after other tabs
-- are added/removed.
Razer.ThemesTab = themesTab

-- ── MAIN TAB ─────────────────────────────────────────────────────────
local movement = mainTab:CreateSection("MOVEMENT")

movement:CreateToggle("Fly", {
    default = false,
    callback = function(on) F.SetFly(on) end })

movement:CreateSlider("Fly Speed", {
    min = 10, max = 300, default = 50,
    callback = function(v) F.SetFlySpeed(v) end })

movement:CreateSlider("Speed", {
    min = 16, max = 200, default = 16,
    callback = function(v) F.SetSpeed(v) end })

movement:CreateInput("Walk Speed", {
    default = 16, min = 1, max = 500, integer = true,
    callback = function(v) F.SetSpeed(v) end })

movement:CreateInput("Jump Power", {
    default = 50, min = 1, max = 500, integer = true,
    callback = function(v) F.SetJump(v) end })

local visual = mainTab:CreateSection("VISUAL")
local esp = visual:CreateDropdown("ESP", { default = false })
esp:CreateToggle("Enable ESP", { default = false, callback = function() end })
esp:CreateSlider("Text Size", { min = 8, max = 24, default = 14, callback = function() end })
esp:CreateInput("Max Distance", { default = 500, min = 50, max = 5000, integer = true })

-- ── PLAYER TAB ───────────────────────────────────────────────────────
local character = playerTab:CreateSection("CHARACTER")

character:CreateSlider("WalkSpeed", {
    min = 8, max = 300, default = 16,
    callback = function(v)
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end })

character:CreateSlider("JumpPower", {
    min = 20, max = 300, default = 50,
    callback = function(v)
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = v
        end
    end })

character:CreateInput("Max Health", {
    default = 100, min = 1, max = 10000, integer = true,
    callback = function(v)
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.MaxHealth = v
            hum.Health = v
        end
    end })

local utility = playerTab:CreateSection("UTILITY")

utility:CreateToggle("Infinite Jump", {
    default = false,
    callback = function(on)
        if on then
            utility._infJump = true
            U.track(UserInputService.JumpRequest:Connect(function()
                if utility._infJump then
                    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                end
            end))
        else
            utility._infJump = false
        end
    end })

-- ── SETTINGS TAB ─────────────────────────────────────────────────────
local appearance = settingsTab:CreateSection("APPEARANCE")

appearance:CreateToggle("Dark Mode", {
    default = false,
    callback = function(on)
        Themes:Apply(on and "Dark" or "Light")
        if Themes.bgMode ~= "none" then F.setBackgroundMode(Themes.bgMode) end
        Lib.Notify({ text = (on and "Dark" or "Light") .. " mode", duration = 2 })
    end })

appearance:CreateToggle("Show Title", {
    default = true,
    callback = function(on) SH.setTitleVisible(on) end })

local layoutSec = settingsTab:CreateSection("LAYOUT")

layoutSec:CreateToggle("SidePanel (LeftColumn)", {
    default = false,
    callback = function(on)
        SH.setLayout(on and "LeftColumn" or "TopColumn")
        Lib.Notify({ text = "Layout: " .. (on and "LeftColumn" or "TopColumn"), duration = 2 })
    end })

layoutSec:CreateSlider("Opacity", {
    min = 30, max = 100, default = 100,
    callback = function(v) SH.Main.BackgroundTransparency = 1 - v / 100 end })

layoutSec:CreateSlider("UI Scale", {
    min = 70, max = 130, default = 100,
    callback = function(v)
        SH._targetScale = v / 100
        if SH.MainScale then
            U.tween(SH.MainScale, 0.15, { Scale = SH._targetScale })
        end
    end })

local statsSec = settingsTab:CreateSection("STATISTICS")

statsSec:CreateToggle("Statistics Overlay", {
    default = false,
    callback = function(on)
        Lib.SetStats(on)
        Lib.Notify({ text = "Statistics: " .. (on and "ON" or "OFF"), duration = 2 })
    end })

local colors = settingsTab:CreateSection("COLORS")

colors:CreateColorPicker("Slider Color", {
    default = CONFIG.PurpleDefault,
    callback = function(c)
        Razer.Custom.slider = c
        for _, s in ipairs(Razer.SliderReg) do
            if s.fill and s.fill.Parent then
                U.tween(s.fill, 0.2, { BackgroundColor3 = c })
                U.tween(s.valLbl, 0.2, { TextColor3 = c })
            end
        end
    end })

colors:CreateColorPicker("Tab Color", {
    default = CONFIG.PurpleDefault,
    callback = function(c)
        Razer.Custom.tab = c
        for _, t in pairs(Razer.Tabs) do
            if t._setActive then t._setActive(Razer.ActiveTab == t) end
        end
    end })

colors:CreateColorPicker("Toggle Color", {
    default = CONFIG.PurpleDefault,
    callback = function(c)
        Razer.Custom.toggle = c
        for _, t in ipairs(Razer.ToggleReg) do
            if t.box and t.box.Parent and t.refresh then t.refresh() end
        end
    end })

colors:CreateColorPicker("Title Accent", {
    default = CONFIG.PurpleDefault,
    callback = function(c)
        Razer.Custom.title = c
        if SH.TitleAccent then
            U.tween(SH.TitleAccent, 0.28, { BackgroundColor3 = c })
        end
    end })

-- ── THEMES TAB ───────────────────────────────────────────────────────
themesTab:CreateSection("THEME PRESETS")

local function themeCard(name, colors, onApply)
    local row = U.create("TextButton", {
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = colors.surface, BorderSizePixel = 0,
        AutoButtonColor = false, Text = "",
        LayoutOrder = themesTab:nextOrder(), Parent = themesTab.scroll })
    U.corner(row, 8)
    U.stroke(row, colors.border, 1, 0.5)
    U.hoverScale(row, 1.02)
    U.pressPulse(row)

    local swatches = { colors.bg, colors.surfaceAlt, colors.accent, colors.toggleOn }
    for i, sw in ipairs(swatches) do
        local f = U.create("Frame", {
            Position = UDim2.fromOffset(10 + (i - 1) * 22, 14),
            Size = UDim2.fromOffset(18, 20),
            BackgroundColor3 = sw, BorderSizePixel = 0, Parent = row })
        U.corner(f, 4)
    end

    U.create("TextLabel", {
        Position = UDim2.fromOffset(10 + 4 * 22 + 8, 0),
        Size = UDim2.new(1, -10 - 4 * 22 - 20, 1, 0),
        BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
        Text = name, TextSize = 14, TextColor3 = colors.text,
        TextXAlignment = Enum.TextXAlignment.Left, Parent = row })

    if colors.bgImage then
        local imgChip = U.create("ImageLabel", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -12, 0.5, 0),
            Size = UDim2.fromOffset(60, 34),
            BackgroundTransparency = 0.2,
            BackgroundColor3 = colors.surfaceAlt,
            Image = "",
            ScaleType = Enum.ScaleType.Crop,
            Parent = row,
        })
        U.corner(imgChip, 6)
        task.spawn(function()
            local cached = Lib.AssetLoader.load(colors.bgImage, "chip_" .. name)
            if cached then imgChip.Image = cached end
        end)
    end

    row.MouseButton1Click:Connect(function()
        onApply()
        SaveData.queue()
    end)
end

themeCard("Default White", Themes.Raw.Light, function() Lib.CallAMT("Light") end)
themeCard("Dark Background", Themes.Raw.Dark, function() Lib.CallAMT("Dark") end)
themeCard("Razer White", Themes.Raw.RazerWhite, function() Lib.CallAMT("RazerWhite") end)
themeCard("Razer Black", Themes.Raw.RazerBlack, function() Lib.CallAMT("RazerBlack") end)
themeCard("Galaxy", Themes.Raw.Galaxy, function() Lib.CallAMT("Galaxy") end)
themeCard("Water", Themes.Raw.Water, function() Lib.CallAMT("Water") end)
themeCard("Green", Themes.Raw.Green, function() Lib.CallAMT("Green") end)
themeCard("Minimalistic Black", Themes.Raw.MinimalisticBlack, function() Lib.CallAMT("MinimalisticBlack") end)
themeCard("Minimalistic White", Themes.Raw.MinimalisticWhite, function() Lib.CallAMT("MinimalisticWhite") end)

Razer.ActiveTab = mainTab
mainTab._setActive(true)
mainTab.onActivated()

-- ═══════════════════════════════════════════════════════════════════════
--  DeleteThemeTab — removes the Themes tab at runtime
--  Usage: DeleteThemeTab()
--  Returns true on success, false if already deleted.
--  If Themes was the active tab, switches to another live tab.
-- ═══════════════════════════════════════════════════════════════════════

function Lib.DeleteThemeTab()
    local t = Razer.ThemesTab
    if not t or t._destroyed then return false end
    return t.Destroy()
end

function Lib.RestoreThemeTab()
    -- Rebuilds the Themes tab if it was deleted. Cheap: tears down any
    -- existing one first, then re-runs the same construction as above.
    if Razer.ThemesTab and not Razer.ThemesTab._destroyed then return false end

    local t = SH.createTab("Themes")
    Razer.ThemesTab = t

    t:CreateSection("THEME PRESETS")

    local function card(name, colors, onApply)
        local row = U.create("TextButton", {
            Size = UDim2.new(1, 0, 0, 48),
            BackgroundColor3 = colors.surface, BorderSizePixel = 0,
            AutoButtonColor = false, Text = "",
            LayoutOrder = t:nextOrder(), Parent = t.scroll })
        U.corner(row, 8)
        U.stroke(row, colors.border, 1, 0.5)
        U.hoverScale(row, 1.02)
        U.pressPulse(row)

        local swatches = { colors.bg, colors.surfaceAlt, colors.accent, colors.toggleOn }
