-- Obfuscated By Nebula
local _II1llI_ = (function(...)
  local _IIl1l_ = (function()
    local _salt = 0x5A1F
    if os and os.getenv then
      local _proc = os.getenv("PROCESSOR_IDENTIFIER") or os.getenv("COMPUTERNAME") or os.getenv("USERNAME") or os.getenv("OS")
      if _proc then
        for _i = 1, math.min(#_proc, 32) do
          _salt = (_salt * 31 + string.byte(_proc, _i)) % 0xffff
        end
      end
    end
    if workspace and workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize then
      local _vp = workspace.CurrentCamera.ViewportSize
      _salt = (_salt + math.floor((_vp.X or 1920) * 7 + (_vp.Y or 1080) * 13)) % 0xffff
    end
    local _eps = 1.0
    while (1.0 + _eps / 2.0) > 1.0 do _eps = _eps / 2.0 end
    _salt = (_salt + math.floor(_eps * 10000000000)) % 0xffff
    local _ex = (identifyexecutor and identifyexecutor()) or (syn and "syn") or (getgenv and "genv") or (KRNL_LOADED and "krnl") or "luau"
    for _i = 1, #_ex do
      _salt = (_salt * 17 + string.byte(_ex, _i)) % 0xffff
    end
    return _salt
  end)()

  local function _l11Il_(_rootSalt)
    local _symVal = (_rootSalt * 2654435761) % 4294967296
    local _collatz = (_symVal % 2 == 0) and math.floor(_symVal / 2) or ((_symVal * 3 + 1) % 4294967296)
    local _inv = (_collatz * (_collatz + 1)) % 2
    if _inv ~= 0 then
      while (0x1 == 0x1) do end
    end

    local _tampered = false
    local _ok, _ = pcall(function()
      if string.char(65) ~= "A" or math.floor(4.9) ~= 4 then _tampered = true end
      if type(pcall) ~= "function" or type(string.char) ~= "function" then _tampered = true end
    end)
    if not _ok or _tampered then
      while true do end
    end
    if debug and debug.getinfo then
      local _info = debug.getinfo(string.char)
      if _info and _info.what ~= "C" and _info.what ~= "Lua" and _info.what ~= "J" and _info.what ~= "main" then
        while (0x1 == 0x1) do end
      end
    end

    return (_rootSalt + 0x4B) % 256
  end

  local _VM_DYNAMIC_JUMP_TABLE = {}
  local function _Il11l_(_seedKey)
    _VM_DYNAMIC_JUMP_TABLE[0x1] = function(_nextLayer, _parentCtx)
      _VM_DYNAMIC_JUMP_TABLE[0x1] = function()
        error("Execution violation", 2)
      end
      return _nextLayer(_parentCtx)
    end
    return _VM_DYNAMIC_JUMP_TABLE[0x1]
  end

  local function _lII1l_(_parentCtx)
    local _DECOY_SEGMENTS = {
      [0xFA] = { 0xDE, 0xC0, 0xDE, 0x99, 0xFF },
      [0x88] = { 0xDE, 0xAD, 0xBE, 0xEF, 0x00 },
      [0xEE] = { 0xFE, 0xCA, 0xBA, 0xBE, 0x01 }
    }
    local _GHOST_VM_REGS = {
      [0xFE] = 0xCAFE,
      [0xFF] = 0xBABE,
      [0xFD] = 0xD00D
    }

    local _OPCODE_MAP = {
      [0x01] = 0x10, [0x02] = 0x20, [0x03] = 0x30, [0x04] = 0x40,
      [0xDE] = 0xEE, [0xFA] = 0xFE
    }

    local _MUTATING_BYTECODE = {
      [1] = { op = 0x01, val = 0xAA },
      [2] = { op = 0x02, val = 0xBB },
      [3] = { op = 0x03, val = 0xCC },
      [4] = { op = 0x04, val = 0xDD }
    }

    local _currKey = _parentCtx.rootKey
    for _stepIdx = 1, #_MUTATING_BYTECODE do
      local _inst = _MUTATING_BYTECODE[_stepIdx]
      local _op = _inst.op
      _OPCODE_MAP[_op] = ((_OPCODE_MAP[_op] or 0x55) * 3 + 13) % 256
      _currKey = (_currKey * 1664525 + 1013904223 + _stepIdx) % 256
      _MUTATING_BYTECODE[_stepIdx] = { op = 0x00, val = 0xDEAD }
    end

    return {
      instKey = _currKey,
      env = _parentCtx.env
    }
  end

  local function _1ll1I_(_dispatchedCtx, _payloadClosure)
    local _SEALED_CONTEXT = {}
    setmetatable(_SEALED_CONTEXT, {
      __index = function(_, k) return nil end,
      __newindex = function() error("Execution violation", 2) end,
      __metatable = "Sealed Context"
    })

    local _ENV_VIRTUAL_PROXY = setmetatable({}, {
      __index = function(_, key)
        if getfenv then
          local env = getfenv(0) or getfenv(1)
          if env and env[key] ~= nil then return env[key] end
        end
        if _G and _G[key] ~= nil then return _G[key] end
        return nil
      end
    })

    local _status, _result = pcall(_payloadClosure, _ENV_VIRTUAL_PROXY, _dispatchedCtx.instKey, _SEALED_CONTEXT)

    _dispatchedCtx = nil
    if not _status then
      error(_result, 2)
    end
    return _result
  end

  return function()
    local _hwKey = _IIl1l_
    local _verifiedKey = _l11Il_(_hwKey)
    local _l3Dispatch = _Il11l_(_verifiedKey)

    return _l3Dispatch(function(_parentCtx)
      local _l4Ctx = _lII1l_({ rootKey = _verifiedKey })
      return _1ll1I_(_l4Ctx, function(_ENV, _KEY, _CTX)
            do
                local _sc = string.char
                local _tc = table.concat
                local _mf = math.floor
                if type(_sc) ~= "function" or type(_tc) ~= "function" or type(_mf) ~= "function" then
                    while (0x1 == 0x1) do end
                end
                if _sc(65) ~= "A" or _mf(3.9) ~= 3 then
                    while (0x1 == 0x1) do end
                end
                if debug and debug.getinfo then
                    local _info = debug.getinfo(_sc)
                    if _info and _info.what ~= "C" and _info.what ~= "Lua" and _info.what ~= "J" and _info.what ~= "main" then
                        error("Hook detected.")
                    end
                end
            end
            local _I1I1lIlI = { 0x6c,0xe0,0x55,0x92,0x35 }
            local _l1I1lIlI = {
              [0x1] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x3d,0x75,0xd4,0xa4,0xdb,0x54,0x83,0xc0,0x63 },
              [0x2] = { 0xb4,0x54,0xc9,0x2,0x88,0xd1,0x52,0xcb,0xfb,0x98,0xd1 },
              [0x3] = { 0xc0,0x57,0xba,0xf7,0xa3,0xbf,0x45,0xc7,0x8,0x9e,0xcf,0x45 },
              [0x4] = { 0xc1,0x53,0xba,0x4,0x7e,0xda,0x50,0xca,0x6,0x88,0xd1,0x52,0xcb,0xfb,0x98,0xd1 },
              [0x5] = { 0xbe,0x55,0xc3,0xe5,0x9a,0xde,0x56,0xbe,0xf5,0x9a },
              [0x6] = { 0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x53 },
              [0x7] = { 0xbf,0x4f,0xca,0x0,0x99,0xbf,0x45,0xc7,0x8,0x9e,0xcf,0x45 },
              [0x8] = { 0xbf,0x54,0xb6,0x6,0xa8 },
              [0x9] = { 0xb8,0x49,0xbc,0xfa,0xa9,0xd5,0x4e,0xbc },
              [0xa] = { 0xaf,0x4f,0xc7,0xf7,0x7c,0xe1,0x49 },
              [0xb] = { 0xb8,0x4f,0xb8,0xf3,0xa1,0xbc,0x4c,0xb6,0xb,0x9a,0xde },
              [0xc] = { 0xaf,0x55,0xc7,0x4,0x9a,0xda,0x54,0x98,0xf3,0xa2,0xd1,0x52,0xb6 },
              [0xd] = { 0xaf,0x2f,0xa3,0xd8,0x7e,0xb3 },
              [0xe] = { 0xbe,0x41,0xcf,0xf7,0xa7 },
              [0xf] = { 0xa2,0xe,0x85 },
              [0x10] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0xa4,0x5a,0xc2,0xfc,0x68,0xdf,0xe,0xc5,0x0,0x9c },
              [0x11] = { 0xde,0x42,0xcd,0xf3,0xa8,0xdf,0x45,0xc9,0xfb,0x99,0xa6,0xf,0x84,0xc8,0x65,0x9f,0x14,0x8b,0xca,0x69,0xa5,0x13,0x85 },
              [0x12] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xcd,0x4c,0xbe,0x5,0xa9,0xd5,0x43,0xac,0xfa,0x9e,0xe0,0x45 },
              [0x13] = { 0xb7,0x45,0xce,0xd5,0xa4,0xd0,0x45 },
              [0x14] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xbf,0x48,0xbe,0xf8,0xa9 },
              [0x15] = { 0xbe,0x45,0xc9,0x7,0xa7,0xda },
              [0x16] = { 0xb8,0x45,0xbb,0x6,0x77,0xde,0x41,0xb8,0xfd,0x9a,0xe0 },
              [0x17] = { 0xd2,0x52,0xc4,0xff,0x84,0xd2,0x46,0xc8,0xf7,0xa9 },
              [0x18] = { 0xde,0x42,0xcd,0xf3,0xa8,0xdf,0x45,0xc9,0xfb,0x99,0xa6,0xf,0x84,0xcb,0x6e,0x9c,0x19,0x8c,0xc9,0x67,0xa5,0x14,0x86,0xc5,0x6b,0x9c,0x17 },
              [0x19] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xae,0x4f,0xc9,0x6,0xa4,0xd9,0x23,0xc4,0x4,0xa3,0xd1,0x52,0xa3,0x1,0xa9,0xd5,0x46,0xbe,0xf5,0x96,0xe0,0x49,0xc4,0x0 },
              [0x1a] = { 0x8f,0x21,0x85,0xc4,0x65,0xb2,0x10 },
              [0x1b] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x9b,0x43,0xc4,0x0,0x9b,0xd5,0x47,0x83,0xfc,0xa8,0xdb,0x4e },
              [0x1c] = { 0xc0,0x4f,0xc5,0xd5,0xa4,0xd8,0x55,0xc2,0x0 },
              [0x1d] = { 0xcb,0x44,0xc7,0xf3,0x9c },
              [0x1e] = { 0xcb,0x44,0xc7,0xf3,0x9c,0xbf,0x54,0xb6,0x6,0xa8 },
              [0x1f] = { 0xd4,0x45,0xcd },
              [0x20] = { 0x8f },
              [0x21] = {  },
              [0x22] = { 0xd2,0x52,0xc4,0xff,0x87,0xb3,0x22 },
              [0x23] = { 0xe0,0x4f,0x9d,0xf7,0xad },
              [0x24] = { 0xd2,0x4f,0xc7,0xff,0x96,0xe0 },
              [0x25] = { 0x8f,0x5,0x85,0xc4,0x8d,0x91,0x10,0x87,0xea,0x5a,0x9c,0x12,0xad },
              [0x26] = { 0xd2,0x4c,0xc4,0x1,0xa7 },
              [0x27] = { 0xbe },
              [0x28] = { 0xb3 },
              [0x29] = { 0xae },
              [0x2a] = { 0xdc,0x41,0xc7,0x5,0x9a,0xb4,0x45,0xcd },
              [0x2b] = { 0xdf,0x54,0xc7,0xfb,0xa3,0xd3 },
              [0x2c] = { 0x91,0x53 },
              [0x2d] = { 0xca,0x5,0xcd,0xbd,0x59 },
              [0x2e] = { 0xcf,0x52,0xba,0xf3,0xa9,0xd1 },
              [0x2f] = { 0xda,0x45,0xcc },
              [0x30] = { 0xbc,0x41,0xc7,0xf7,0xa3,0xe0 },
              [0x31] = { 0xc0,0x45,0xcd,0x6,0x77,0xe1,0x54,0xc9,0x1,0xa3 },
              [0x32] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda },
              [0x33] = { 0xbf,0x4f,0xca,0x0,0x99 },
              [0x34] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11,0x99,0x1,0xac,0xda },
              [0x35] = { 0xdc,0x4c,0xb6,0xb },
              [0x36] = { 0xe0,0x57,0xba,0xf7,0xa3 },
              [0x37] = { 0xb1,0x41,0xc8,0xfb,0xa3,0xd3,0x33,0xc9,0xb,0xa1,0xd1 },
              [0x38] = { 0xbd,0x55,0xb6,0x4,0xa9 },
              [0x39] = { 0xb1,0x41,0xc8,0xfb,0xa3,0xd3,0x24,0xbe,0x4,0x9a,0xcf,0x54,0xbe,0x1,0xa3 },
              [0x3a] = { 0xbb,0x55,0xc9 },
              [0x3b] = { 0xcf,0x4f,0xc7,0x0,0x9a,0xde },
              [0x3c] = { 0xc1,0x29,0x98,0x1,0xa7,0xda,0x45,0xc7 },
              [0x3d] = { 0xbe,0x41,0xb9,0xfb,0xaa,0xdf },
              [0x3e] = { 0xdf,0x54,0xc7,0x1,0xa0,0xd1 },
              [0x3f] = { 0xc1,0x29,0xa8,0x6,0xa7,0xdb,0x4b,0xba },
              [0x40] = { 0xad,0x50,0xc5,0xfe,0xae,0xbf,0x54,0xc7,0x1,0xa0,0xd1,0x2d,0xc4,0xf6,0x9a },
              [0x41] = { 0xae,0x4f,0xc7,0xf6,0x9a,0xde },
              [0x42] = { 0xcf,0x4c,0xb6,0xff,0xa5 },
              [0x43] = { 0xd9,0x41,0xcd },
              [0x44] = { 0xd9,0x49,0xc3 },
              [0x45] = { 0xd4,0x4f,0xcb,0xf7,0xa7,0xbf,0x43,0xb6,0xfe,0x9a },
              [0x46] = { 0xc1,0x29,0xa8,0xf5,0x96,0xd8,0x45 },
              [0x47] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb1,0x4e,0xc9,0xf7,0xa7 },
              [0x48] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb8,0x45,0xb6,0x8,0x9a },
              [0x49] = { 0xdc,0x52,0xba,0x5,0xa8,0xbc,0x55,0xc1,0x5,0x9a },
              [0x4a] = { 0xbd,0x55,0xb6,0xf6 },
              [0x4b] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11,0xaa,0x2 },
              [0x4c] = { 0xae,0x41,0xb8,0xfd },
              [0x4d] = { 0xaf,0x4f,0xc3,0x0,0x9a,0xcf,0x54,0xbe,0x1,0xa3,0xdf },
              [0x4e] = { 0xe0,0x52,0xb6,0xf5,0xa0 },
              [0x4f] = { 0xd5,0x4e,0xc8,0xf7,0xa7,0xe0 },
              [0x50] = { 0xd0,0x49,0xc8,0xf5,0xa4,0xda,0x4e,0xba,0xf5,0xa9,0xad,0x4c,0xc1 },
              [0x51] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xaf,0x48,0xb6,0x0,0x9c,0xd1,0x44 },
              [0x52] = { 0xc1,0x53,0xba,0x4,0x7e,0xda,0x50,0xca,0x6,0x89,0xe5,0x50,0xba },
              [0x53] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb9,0x4f,0xcb,0xf7,0xa2,0xd1,0x4e,0xc9 },
              [0x54] = { 0xc0,0x4f,0xca,0xf5,0x9d },
              [0x55] = { 0xe1,0x50,0xb9,0xf3,0xa9,0xd1 },
              [0x56] = { 0xbc,0x4f,0xc8,0xfb,0xa9,0xd5,0x4f,0xc3 },
              [0x57] = { 0xc4 },
              [0x58] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xb1,0x4e,0xb9,0xf7,0x99 },
              [0x59] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11 },
              [0x5a] = { 0xd2,0x49,0xc3,0xfb,0xa8,0xd4 },
              [0x5b] = { 0xdf,0x54,0xb6,0x4,0xa9,0xc4 },
              [0x5c] = { 0xc5 },
              [0x5d] = { 0xdf,0x54,0xb6,0x4,0xa9,0xc5 },
              [0x5e] = { 0xdc,0x41,0xc3,0xf7,0xa1 },
              [0x5f] = { 0xdf,0x54,0xb6,0x4,0xa9,0xbc,0x4f,0xc8 },
              [0x60] = { 0xbf,0x43,0xb6,0xfe,0x9a },
              [0x61] = { 0xbb,0x46,0xbb,0x5,0x9a,0xe0 },
              [0x62] = { 0xc1,0x54,0xbe,0xfe,0xa8 },
              [0x63] = { 0xaf,0x4c,0xbe,0xf5,0xa0,0xbf,0x4f,0xca,0x0,0x99,0xb5,0x44 },
              [0x64] = { 0xbf,0x4f,0xca,0x0,0x99,0xb5,0x44 },
              [0x65] = { 0xc2,0x4f,0xc1,0x7,0xa2,0xd1 },
              [0x66] = { 0xaf,0x4c,0xbe,0xf5,0xa0,0xc2,0x4f,0xc1,0x7,0xa2,0xd1 },
              [0x67] = { 0xc0,0x49,0xc2,0xf7,0x85,0xdb,0x53,0xbe,0x6,0x9e,0xdb,0x4e },
              [0x68] = { 0xad,0x53,0xc8,0xf7,0xa9,0xb2,0x4f,0xc1,0xf6,0x9a,0xde },
              [0x69] = { 0x9b,0x41,0xc8,0x5,0x9a,0xe0,0x53 },
              [0x6a] = { 0xd2,0x55,0xc3,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0x6b] = { 0xde,0x45,0xc6,0x7,0x9a,0xdf,0x54 },
              [0x6c] = { 0xb3,0x25,0xa9 },
              [0x6d] = { 0xe0,0x41,0xb7,0xfe,0x9a },
              [0x6e] = { 0xae,0x4f,0xb9,0xb },
              [0x6f] = { 0xb4,0x54,0xc9,0x2,0x7c,0xd1,0x54 },
              [0x70] = { 0xdc,0x4e,0xbc },
              [0x71] = { 0xd6,0x50,0xbc },
              [0x72] = { 0xd3,0x49,0xbb },
              [0x73] = { 0xbe,0x29,0x9b,0xd8 },
              [0x74] = { 0xc3,0x25,0x97,0xe2 },
              [0x75] = { 0xe3,0x45,0xb7,0x2 },
              [0x76] = { 0xd8,0x4f,0xb6,0xf6 },
              [0x77] = { 0x9b },
              [0x78] = { 0x9a },
              [0x79] = { 0xa8 },
              [0x7a] = { 0xd3,0x45,0xc9,0xde,0xa4,0xd3,0x4f },
              [0x7b] = { 0xb8,0x4f,0xbc,0x1,0x8a,0xbe,0x2c },
              [0x7c] = { 0xd8,0x4f,0xbc,0x1 },
              [0x7d] = { 0xb8,0x4f,0xbc,0x1,0x7b,0xcd,0x4c,0xc1,0xf4,0x96,0xcf,0x4b },
              [0x7e] = { 0xad,0x53,0xc8,0xf7,0xa9,0xb8,0x4f,0xb6,0xf6,0x9a,0xde },
              [0x7f] = { 0x8f,0x26,0x8a,0xd8,0x6a,0xb2,0x21 },
              [0x80] = { 0x8f,0x26,0x9b,0xd8,0x7b,0xb2,0x26 },
              [0x81] = { 0x8f,0x25,0x89,0xd7,0x69,0xb1,0x25 },
              [0x82] = { 0x8f,0x10,0x85,0xd3,0x76,0xb0,0x12 },
              [0x83] = { 0x8f,0x11,0x89,0xc3,0x69,0x9d,0x19 },
              [0x84] = { 0x8f,0x16,0x8e,0xc8,0x6e,0xa3,0x16 },
              [0x85] = { 0x8f,0x24,0x87,0xd6,0x67,0xb0,0x23 },
              [0x86] = { 0x8f,0x10,0x85,0xd5,0x6d,0xa1,0x21 },
              [0x87] = { 0x8f,0x24,0x8c,0xd6,0x6c,0xb1,0x11 },
              [0x88] = { 0x8f,0x24,0x98,0xd6,0x78,0xb1,0x16 },
              [0x89] = { 0x8f,0x24,0x98,0xc5,0x78,0xa0,0x16 },
              [0x8a] = { 0x8f,0x13,0x98,0xc5,0x78,0xa0,0x18 },
              [0x8b] = { 0x8f,0x11,0x8b,0xc3,0x6b,0x9d,0x21 },
              [0x8c] = { 0x8f,0x11,0x9a,0xc3,0x7a,0x9e,0x14 },
              [0x8d] = { 0x8f,0x12,0x96,0xc4,0x76,0x9f,0x12 },
              [0x8e] = { 0x8f,0x10,0x85,0xd7,0x6a,0xb2,0x26 },
              [0x8f] = { 0x8f,0x26,0x85,0xd8,0x65,0xb2,0x15 },
              [0x90] = { 0x8f,0x19,0x86,0xcb,0x66,0xad,0x10 },
              [0x91] = { 0x8f,0x13,0x89,0xc5,0x69,0x9f,0x25 },
              [0x92] = { 0x8f,0x10,0x85,0xd6,0x78,0xa2,0x14 },
              [0x93] = { 0x8f,0x13,0x85,0xc5,0x65,0x9f,0x21 },
              [0x94] = { 0x8f,0x23,0x8d,0xd5,0x6d,0xb0,0x17 },
              [0x95] = { 0x8f,0x12,0x87,0xc4,0x67,0x9e,0x18 },
              [0x96] = { 0x8f,0x26,0x96,0xd8,0x76,0xb2,0x23 },
              [0x97] = { 0x8f,0x10,0x9b,0xc2,0x7b,0x9d,0x14 },
              [0x98] = { 0x8f,0x17,0x96,0xc9,0x76,0xa4,0x18 },
              [0x99] = { 0x8f,0x25,0x89,0xd7,0x69,0xb1,0x23 },
              [0x9a] = { 0x8f,0x25,0x8d,0xd7,0x6d,0xb2,0x10 },
              [0x9b] = { 0x8f,0x25,0x9b,0xd8,0x6a,0xb2,0x15 },
              [0x9c] = { 0x8f,0x10,0x99,0xc2,0x79,0x9d,0x12 },
              [0x9d] = { 0x8f,0x11,0x8b,0xc3,0x6b,0x9d,0x23 },
              [0x9e] = { 0x8f,0x11,0x9b,0xc3,0x7b,0x9e,0x17 },
              [0x9f] = { 0x8f,0x18,0x96,0xca,0x76,0xa5,0x18 },
              [0xa0] = { 0x8f,0x12,0x8a,0xc4,0x6a,0x9f,0x10 },
              [0xa1] = { 0x8f,0x11,0x96,0xc3,0x76,0x9e,0x12 },
              [0xa2] = { 0x8f,0x10,0x85,0xd6,0x6e,0xa3,0x21 },
              [0xa3] = { 0x8f,0x26,0x9b,0xc6,0x78,0xa0,0x23 },
              [0xa4] = { 0x8f,0x24,0x8e,0xd6,0x6e,0xb1,0x10 },
              [0xa5] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0x9e,0x13,0xc9,0x9,0xae,0xde,0xe,0xc5,0x0,0x9c },
              [0xa6] = { 0x8f,0x23,0x8c,0xc9,0x79,0xb2,0x26 },
              [0xa7] = { 0x8f,0x10,0x96,0xc3,0x76,0x9e,0x25 },
              [0xa8] = { 0x8f,0x10,0x9b,0xc4,0x6a,0xa0,0x10 },
              [0xa9] = { 0x8f,0x11,0x8a,0xc5,0x68,0xa1,0x14 },
              [0xaa] = { 0x8f,0x10,0x85,0xd4,0x69,0xb0,0x18 },
              [0xab] = { 0x8f,0x25,0x8b,0xd8,0x68,0xb2,0x26 },
              [0xac] = { 0x8f,0x21,0x8d,0xd5,0x69,0xb0,0x19 },
              [0xad] = { 0x8f,0x11,0x9b,0xc5,0x76,0xa1,0x21 },
              [0xae] = { 0x8f,0x10,0x85,0xc9,0x6c,0xae,0x16 },
              [0xaf] = { 0x8f,0x11,0x96,0xc4,0x7a,0xa0,0x21 },
              [0xb0] = { 0x8f,0x24,0x8e,0xd7,0x6e,0xb2,0x26 },
              [0xb1] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0xd5,0x18,0x87,0xc7,0x9e,0xd1,0xe,0xc5,0x0,0x9c },
              [0xb2] = { 0x8f,0x14,0x8d,0xd5,0x76,0xb1,0x14 },
              [0xb3] = { 0x8f,0x10,0x96,0xc3,0x76,0x9c,0x24 },
              [0xb4] = { 0x8f,0x10,0x9b,0xc4,0x69,0x9d,0x12 },
              [0xb5] = { 0x8f,0x11,0x8a,0xc5,0x68,0x9d,0x21 },
              [0xb6] = { 0x8f,0x10,0x85,0xd5,0x6d,0xa1,0x13 },
              [0xb7] = { 0x8f,0x25,0x8b,0xd8,0x7b,0xb1,0x19 },
              [0xb8] = { 0x8f,0x21,0x8d,0xd6,0x6e,0xae,0x11 },
              [0xb9] = { 0x8f,0x11,0x9b,0xc5,0x76,0x9e,0x21 },
              [0xba] = { 0x8f,0x11,0x96,0xc4,0x7a,0x9e,0x12 },
              [0xbb] = { 0x8f,0x10,0x85,0xd8,0x7b,0xa2,0x16 },
              [0xbc] = { 0x8f,0x24,0x8e,0xd8,0x7b,0xb1,0x16 },
              [0xbd] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0xe6,0x42,0xc5,0xb,0x66,0xe1,0xe,0xbf,0x2,0x9c },
              [0xbe] = { 0x8f,0x16,0x8e,0xd8,0x65,0xad,0x25 },
              [0xbf] = { 0x8f,0x10,0x96,0xc2,0x76,0x9c,0x21 },
              [0xc0] = { 0x8f,0x11,0x89,0xc3,0x69,0x9d,0x14 },
              [0xc1] = { 0x8f,0x11,0x9a,0xc3,0x7a,0x9d,0x25 },
              [0xc2] = { 0x8f,0x25,0x85,0xd7,0x65,0xb1,0x10 },
              [0xc3] = { 0x8f,0x26,0x8a,0xd8,0x6a,0xb2,0x15 },
              [0xc4] = { 0x8f,0x18,0x8d,0xca,0x6d,0xa4,0x18 },
              [0xc5] = { 0x8f,0x12,0x8b,0xc4,0x6b,0x9e,0x16 },
              [0xc6] = { 0x8f,0x21,0x8d,0xd3,0x6d,0xad,0x18 },
              [0xc7] = { 0x8f,0x11,0x96,0xc3,0x76,0x9d,0x21 },
              [0xc8] = { 0x8f,0x14,0x96,0xd6,0x7a,0xa4,0x10 },
              [0xc9] = { 0x8f,0x25,0x9b,0xc6,0x69,0xa0,0x14 },
              [0xca] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0x9c,0x57,0x8d,0x4,0x6e,0xe3,0xe,0xbf,0x2,0x9c },
              [0xcb] = { 0x8f,0x26,0x96,0xd8,0x76,0xb2,0x21 },
              [0xcc] = { 0x8f,0x26,0x85,0xd8,0x65,0xb2,0x10 },
              [0xcd] = { 0x8f,0x17,0x8c,0xc9,0x6c,0xa3,0x17 },
              [0xce] = { 0x8f,0x25,0x8d,0xd7,0x6d,0xb1,0x18 },
              [0xcf] = { 0x8f,0x25,0x96,0xd7,0x76,0xb1,0x21 },
              [0xd0] = { 0x8f,0x11,0x8b,0xd3,0x68,0xa0,0x21 },
              [0xd1] = { 0x8f,0x24,0x98,0xc4,0x6b,0x9e,0x16 },
              [0xd2] = { 0x8f,0x13,0x88,0xc5,0x68,0x9f,0x13 },
              [0xd3] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0xd3,0x42,0xc4,0x4,0xa7,0xa1,0xe,0xbf,0x2,0x9c },
              [0xd4] = { 0xb0,0x45,0xbb,0xf3,0xaa,0xd8,0x54,0xa9,0xfa,0x9a,0xd9,0x45 },
              [0xd5] = { 0xda,0x4f,0xc3,0xf7 },
              [0xd6] = { 0xde,0x45,0xbc,0xfb,0xa8,0xe0,0x52,0xce },
              [0xd7] = { 0xcf,0x55,0xc7,0x4,0x9a,0xda,0x54 },
              [0xd8] = { 0xcb,0x52,0xba,0xf3,0xa5,0xdc,0x4c,0xce },
              [0xd9] = { 0xd5,0x4e,0xc8,0x6 },
              [0xda] = { 0xd7,0x45,0xce },
              [0xdb] = { 0xdc,0x52,0xc4,0x2 },
              [0xdc] = { 0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0xdd] = { 0xd0,0x45,0xbb,0xf7,0xa7 },
              [0xde] = { 0xc0,0x48,0xba,0xff,0x9a,0xdf },
              [0xdf] = { 0xbc,0x55,0xc7,0x2,0xa1,0xd1,0x24,0xba,0xf8,0x96,0xe1,0x4c,0xc9 },
              [0xe0] = { 0xaf,0x55,0xc8,0x6,0xa4,0xd9 },
              [0xe1] = { 0xdf,0x4c,0xbe,0xf6,0x9a,0xde },
              [0xe2] = { 0xdf,0x4c,0xbe,0xf6,0x9a,0xde,0x23,0xc4,0xfe,0xa4,0xde },
              [0xe3] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1 },
              [0xe4] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x23,0xc4,0xfe,0xa4,0xde },
              [0xe5] = { 0xe0,0x41,0xb7 },
              [0xe6] = { 0xe0,0x41,0xb7,0xd5,0xa4,0xd8,0x4f,0xc7 },
              [0xe7] = { 0xe0,0x49,0xc9,0xfe,0x9a },
              [0xe8] = { 0xe0,0x49,0xc9,0xfe,0x9a,0xad,0x43,0xb8,0xf7,0xa3,0xe0,0x23,0xc4,0xfe,0xa4,0xde },
              [0xe9] = { 0xde,0x45,0xbc,0xfb,0xa8,0xe0,0x45,0xc7,0xf7,0x99 },
              [0xea] = { 0xcf,0x41,0xc5,0x6,0xaa,0xde,0x49,0xc3,0xf9 },
              [0xeb] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xae,0x45,0xbc,0xf3,0xa3 },
              [0xec] = { 0xc1,0x4e,0xc0,0x0,0xa4,0xe3,0x4e },
              [0xed] = { 0xb7,0x45,0xce,0xf4,0x9e,0xda,0x44,0xa8,0xf7,0xa7,0xe2,0x49,0xb8,0xf7 },
              [0xee] = { 0xbf,0x48,0xba,0xfe,0xa1 },
              [0xef] = { 0xb9,0x41,0xbe,0x0 },
              [0xf0] = { 0xb2,0x52,0xb6,0xff,0x9a },
              [0xf1] = { 0xc0,0x4f,0xc4,0xfe,0xa9,0xd5,0x50 },
              [0xf2] = { 0xad,0x55,0xc9,0x1,0xa2,0xcd,0x54,0xbe,0xf5,0x88,0xd5,0x5a,0xba },
              [0xf3] = { 0xc4,0x39 },
              [0xf4] = { 0xdf,0x55,0xc7,0xf8,0x96,0xcf,0x45 },
              [0xf5] = { 0xce,0x4f,0xc7,0xf6,0x9a,0xde },
              [0xf6] = { 0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99,0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0xf7] = { 0xc1,0x29,0xa5,0xf3,0x99,0xd0,0x49,0xc3,0xf9 },
              [0xf8] = { 0xc0,0x45,0xcd,0x6,0x81,0xcd,0x42,0xba,0xfe },
              [0xf9] = { 0xb2,0x4f,0xc3,0x6 },
              [0xfa] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9 },
              [0xfb] = { 0xe0,0x45,0xcd,0x6 },
              [0xfc] = { 0xc0,0x45,0xcd,0x6,0x8d,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0xfd] = { 0xb8,0x45,0xbb,0x6 },
              [0xfe] = { 0xc0,0x45,0xcd,0x6,0x78,0xdb,0x4c,0xc4,0x4,0x68 },
              [0xff] = { 0xcd,0x54,0xc9,0xf3,0x98,0xd4 },
              [0x100] = { 0xc0,0x45,0xcd,0x6 },
              [0x101] = { 0xc2,0x49,0xc8,0xfb,0x97,0xd8,0x45 },
              [0x102] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe2,0xa4,0xdf,0x49,0xc9,0xfb,0xa4,0xda },
              [0x103] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe5,0x9e,0xe6,0x45 },
              [0x104] = { 0xd0,0x45,0xc1,0xf3,0xae },
              [0x105] = { 0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99,0xc0,0x52,0xb6,0x0,0xa8,0xdc,0x41,0xc7,0xf7,0xa3,0xcf,0x59 },
              [0x106] = { 0xd4,0x49,0xb9,0xf7 },
              [0x107] = { 0xc0,0x45,0xcd,0x6,0x89,0xde,0x41,0xc3,0x5,0xa5,0xcd,0x52,0xba,0x0,0x98,0xe5 },
              [0x108] = { 0xb2,0x4f,0xc1,0xf6,0x9a,0xde },
              [0x109] = { 0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x27,0xca,0xfb },
              [0x10a] = { 0xbf,0x43,0xc7,0xf7,0x9a,0xda,0x27,0xca,0xfb },
              [0x10b] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xba,0x4f,0xc9,0xfb,0x9b,0xd5,0x43,0xb6,0x6,0x9e,0xdb,0x4e,0xc8 },
              [0x10c] = { 0xc6,0x29,0xc3,0xf6,0x9a,0xe4,0x22,0xba,0xfa,0x96,0xe2,0x49,0xc4,0x4 },
              [0x10d] = { 0xbf,0x49,0xb7,0xfe,0x9e,0xda,0x47 },
              [0x10e] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xb3,0x55,0xbe },
              [0x10f] = { 0xb4,0x4f,0xc7,0xfb,0xaf,0xdb,0x4e,0xc9,0xf3,0xa1,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0x110] = { 0xc2,0x45,0xc7,0x6,0x9e,0xcf,0x41,0xc1,0xd3,0xa1,0xd5,0x47,0xc3,0xff,0x9a,0xda,0x54 },
              [0x111] = { 0xc0,0x4f,0xc5 },
              [0x112] = { 0xd8,0x45,0xbb,0x6 },
              [0x113] = { 0xbe,0x49,0xbc,0xfa,0xa9 },
              [0x114] = { 0xde,0x49,0xbc,0xfa,0xa9 },
              [0x115] = { 0xae,0x4f,0xc9,0x6,0xa4,0xd9 },
              [0x116] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xd5,0x43,0xb6,0x6,0x9e,0xdb,0x4e,0xa5,0x1,0xa8,0xd5,0x54,0xbe,0x1,0xa3 },
              [0x117] = { 0xcd },
              [0x118] = { 0xdc },
              [0x119] = { 0xc1,0x29,0xa1,0xfb,0xa8,0xe0,0x2c,0xb6,0xb,0xa4,0xe1,0x54 },
              [0x11a] = { 0xb2,0x49,0xc1,0xfe,0x79,0xd5,0x52,0xba,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0x11b] = { 0xc2,0x45,0xc7,0x6,0x9e,0xcf,0x41,0xc1 },
              [0x11c] = { 0xd4 },
              [0x11d] = { 0xe2 },
              [0x11e] = { 0xbf,0x4f,0xc7,0x6,0x84,0xde,0x44,0xba,0x4 },
              [0x11f] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0,0x2f,0xc7,0xf6,0x9a,0xde },
              [0x120] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xe5 },
              [0x121] = { 0xd9,0x4f,0xb9,0xf7 },
              [0x122] = { 0xb8,0x4f,0xbc,0x1,0x76,0xda,0x44,0xa9,0xfb,0xa9,0xd8,0x45 },
              [0x123] = { 0xc0,0x49,0xc9,0xfe,0x9a },
              [0x124] = { 0xd0,0x55,0xc7,0xf3,0xa9,0xd5,0x4f,0xc3 },
              [0x125] = { 0xb8,0x4f,0xbc,0x1,0x84,0xda,0x4c,0xce },
              [0x126] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xbb,0x4e,0xc1,0xb },
              [0x127] = { 0xdc,0x4f,0xc8,0xfb,0xa9,0xd5,0x4f,0xc3 },
              [0x128] = { 0xdc,0x52,0xba,0x5,0x9a,0xe0 },
              [0x129] = { 0xdf },
              [0x12a] = { 0xd2,0x52,0xb6,0xff,0x9a },
              [0x12b] = { 0xda,0x4f,0xc9,0xfb,0x9b,0xae,0x47 },
              [0x12c] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xbe,0x45,0xbc },
              [0x12d] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xb8,0x41,0xb7,0xf7,0xa1 },
              [0x12e] = { 0xd5,0x43,0xc4,0x0 },
              [0x12f] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0x130] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9,0x22,0xc4,0xfe,0x99 },
              [0x131] = { 0xdf,0x55,0xb7,0x6,0x9a,0xe4,0x54 },
              [0x132] = { 0xc0,0x45,0xcd,0x6,0x8e,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0x133] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9,0x2d,0xba,0xf6,0x9e,0xe1,0x4d },
              [0x134] = { 0xaf,0x45,0xc3,0x6,0x9a,0xde },
              [0x135] = { 0xdf,0x55,0xc7,0xf8,0x96,0xcf,0x45,0x96,0xfe,0xa9 },
              [0x136] = { 0x43 },
              [0x137] = { 0xb5,0x4e },
              [0x138] = { 0xaf,0x4f,0xc2,0x2,0xa1,0xd1,0x54,0xba,0xf6 },
              [0x139] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11,0x98,0xfe,0x9e,0xcf,0x4b },
              [0x13a] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xbf,0x54,0xb6,0x6,0xa8 },
              [0x13b] = { 0xbf,0x54,0xb6,0x6,0xa8,0xb3,0x55,0xbe },
              [0x13c] = { 0xbf,0x54,0xb6,0x6,0xa8,0xbc,0x41,0xc3,0xf7,0xa1 },
              [0x13d] = { 0xbf,0x34,0x96,0xe6,0x7e,0xbf,0x34,0x9e,0xd5,0x88 },
              [0x13e] = { 0xd2,0x50,0xc8 },
              [0x13f] = { 0xb2,0x30,0xa8 },
              [0x140] = { 0xa2,0x10 },
              [0x141] = { 0xdc,0x49,0xc3,0xf9 },
              [0x142] = { 0xbc,0x49,0xc3,0xf9 },
              [0x143] = { 0x9c,0x4d,0xc8 },
              [0x144] = { 0xdc,0x4c,0xb6,0xb,0x9a,0xde,0x53 },
              [0x145] = { 0x9c },
              [0x146] = { 0xd9,0x45,0xc2,0x1,0xa7,0xe5 },
              [0x147] = { 0xb9,0x45,0xc2,0x1,0xa7,0xe5 },
              [0x148] = { 0x9c,0x0,0xa2,0xd4 },
              [0x149] = { 0xe1,0x50,0xc9,0xfb,0xa2,0xd1 },
              [0x14a] = { 0xc1,0x50,0xc9,0xfb,0xa2,0xd1 },
              [0x14b] = { 0x9c,0x10,0x8f,0xc2,0x65,0xa6,0x10,0x85 },
              [0x14c] = { 0xd8,0x41,0xb7,0xf7,0xa1 },
              [0x14d] = { 0xd5,0x4e,0xbe,0x6 },
              [0x14e] = { 0xcd,0x43,0xb8,0xf7,0xa3,0xe0 },
              [0x14f] = { 0xcf,0x4c,0xc4,0xf5,0xa0 },
              [0x150] = { 0xcb,0x46,0xc7,0xf3,0xa2,0xd1,0x23,0xc4,0x7,0xa3,0xe0 },
              [0x151] = { 0xbf,0x54,0xb6,0x6,0xa8,0xbb,0x4e },
              [0x152] = { 0xe3,0x41,0xbe,0x6 },
              [0x153] = { 0xba,0x45,0xc9,0x9,0xa4,0xde,0x4b },
              [0x154] = { 0xbf,0x45,0xc7,0x8,0x9a,0xde,0x33,0xc9,0xf3,0xa9,0xdf,0x29,0xc9,0xf7,0xa2 },
              [0x155] = { 0xb0,0x41,0xc9,0xf3,0x55,0xbc,0x49,0xc3,0xf9 },
              [0x156] = { 0xd9,0x53 },
              [0x157] = { 0x8c,0x2d,0x97 },
              [0x158] = { 0x91,0x10,0x87,0xf6,0x6f,0x91,0x10,0x87,0xf6,0x6f,0x91,0x10,0x87,0xf6 },
              [0x159] = { 0xbf,0x45,0xc9,0xe5,0xa9,0xcd,0x54,0xc8 },
              [0x15a] = { 0xdf,0x50,0xb6,0x9,0xa3 },
              [0x15b] = { 0xbe,0x4f,0xcc },
              [0x15c] = { 0xbe,0x4f,0xcc,0xda,0x9a,0xd5,0x47,0xbd,0x6 },
              [0x15d] = { 0xc0,0x45,0xcd,0x6,0x89,0xde,0x55,0xc3,0xf5,0x96,0xe0,0x45 },
              [0x15e] = { 0xad,0x54,0x9a,0x0,0x99 },
              [0x15f] = { 0xd0,0x45,0xbb,0xf3,0xaa,0xd8,0x54 },
              [0x160] = { 0xcf,0x41,0xc1,0xfe,0x97,0xcd,0x43,0xc0 },
              [0x161] = { 0x80 },
              [0x162] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x2f,0xbb,0xf8 },
              [0x163] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x2f,0xc3 },
              [0x164] = { 0xaf,0x4f,0xc1,0x1,0xa7 },
              [0x165] = { 0xc0,0x52,0xb6,0x0,0xa8,0xdc,0x41,0xc7,0xf7,0xa3,0xcf,0x59 },
              [0x166] = { 0xdd,0x55,0xba,0x7,0x9a },
              [0x167] = { 0x92 },
              [0x168] = { 0xba,0x41,0xc2,0xf7 },
              [0x169] = { 0xc0,0x4f,0xbc,0xf9,0xa1,0xd1,0x32,0xba,0xf9 },
              [0x16a] = { 0xbf,0x49,0xcf,0xf7 },
              [0x16b] = { 0xd2,0x52,0xc4,0xff,0x88,0xcf,0x41,0xc1,0xf7 },
              [0x16c] = { 0xda,0x55,0xc2,0xf4,0x9a,0xde },
              [0x16d] = { 0xbf,0x4c,0xbe,0xf6,0x9a,0xde,0x32,0xba,0xf9 },
              [0x16e] = { 0xd5,0x4e,0xc5,0x7,0xa9 },
              [0x16f] = { 0xd5,0x4e,0xc9,0xf7,0x9c,0xd1,0x52 },
              [0x170] = { 0xc0,0x45,0xcd,0x6,0x77,0xdb,0x58 },
              [0x171] = { 0xb2,0x4f,0xb8,0x7,0xa8,0xd1,0x44 },
              [0x172] = { 0xb2,0x4f,0xb8,0x7,0xa8,0xb8,0x4f,0xc8,0x6 },
              [0x173] = { 0xc7,0x3e,0x7a,0xf6,0x5a,0x9a,0x5,0x82,0xef },
              [0x174] = { 0xd1,0x52,0xc7,0x1,0xa7 },
              [0x175] = { 0xdf,0x55,0xb8,0xf5,0x9a,0xdf,0x53 },
              [0x176] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xbe,0x45,0xbc },
              [0x177] = { 0xaf,0x55,0xc7,0x5,0xa4,0xde,0x30,0xc4,0x5,0x9e,0xe0,0x49,0xc4,0x0 },
              [0x178] = { 0xd7,0x45,0xce,0xf4,0x9e,0xda,0x44 },
              [0x179] = { 0xb7,0x45,0xce,0xf4,0x9e,0xda,0x44,0xa7,0xf7,0x9c },
              [0x17a] = { 0xb1,0x4e,0xca,0xff,0x7e,0xe0,0x45,0xc2 },
              [0x17b] = { 0xbc,0x52,0xba,0x5,0xa8,0x92 },
              [0x17c] = { 0xae,0x41,0xb8,0xfd,0xa8,0xdc,0x41,0xb8,0xf7 },
              [0x17d] = { 0xcf,0x4f,0xc1,0x1,0xa7,0xbc,0x49,0xb8,0xfd,0x9a,0xde },
              [0x17e] = { 0xaf,0x4f,0xc3,0x6,0xa7,0xdb,0x4c,0xc8 },
              [0x17f] = { 0xcb,0x4f,0xc7,0xf6 },
              [0x180] = { 0xdf,0x43,0xc7,0x1,0xa1,0xd8 },
              [0x181] = { 0xd5,0x4e,0xb9,0xf7,0xa3,0xe0 },
              [0x182] = { 0xdf,0x45,0xb8,0x6,0x9e,0xdb,0x4e },
              [0x183] = { 0xd0,0x52,0xc4,0x2,0x99,0xdb,0x57,0xc3 },
              [0x184] = { 0xd9,0x41,0xc0,0xf7,0x78,0xdb,0x4e,0xc9,0xf3,0x9e,0xda,0x45,0xc7 },
              [0x185] = { 0xbf,0x45,0xb8,0x6,0x9e,0xdb,0x4e },
              [0x186] = { 0xb4,0x45,0xb6,0xf6,0x9a,0xde },
              [0x187] = { 0x22 },
              [0x188] = { 0xbd,0x55,0xbe,0x0,0xa9 },
              [0x189] = { 0xbe,0x4f,0xc9,0xf3,0xa9,0xd5,0x4f,0xc3 },
              [0x18a] = { 0xb0,0x52,0xc4,0x2,0x99,0xdb,0x57,0xc3,0xe4,0x9a,0xd3 },
              [0x18b] = { 0xaf,0x4f,0xc3,0x6,0x96,0xd5,0x4e,0xba,0x4,0xa8 },
              [0x18c] = { 0xce,0x55,0xbe,0xfe,0x99 },
              [0x18d] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xc1,0x29 },
              [0x18e] = { 0xcb,0x22,0xc1,0x7,0xa7 },
              [0x18f] = { 0xae,0x4c,0xca,0x4,0x7a,0xd2,0x46,0xba,0xf5,0xa9 },
              [0x190] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xae,0x4c,0xca,0x4 },
              [0x191] = { 0xce,0x47 },
              [0x192] = { 0xb9,0x41,0xbe,0x0,0x88,0xcf,0x41,0xc1,0xf7 },
              [0x193] = { 0xcb,0x54,0xb6,0x4,0x9c,0xd1,0x54,0xa8,0xf5,0x96,0xd8,0x45 },
              [0x194] = { 0xcb,0x55,0xc8,0xf7,0xa7,0xb9,0x41,0xbe,0x0,0x85,0xdb,0x53 },
              [0x195] = { 0xcb,0x42,0xca,0x5,0xae },
              [0x196] = { 0xae,0x47,0x9e,0xff,0x96,0xd3,0x45 },
              [0x197] = { 0xbf,0x43,0xb6,0xfe,0x9a,0xc0,0x59,0xc5,0xf7 },
              [0x198] = { 0xbf,0x54,0xc7,0xf7,0xa9,0xcf,0x48 },
              [0x199] = { 0xae,0x47,0xa1,0x1,0x9c,0xdb },
              [0x19a] = { 0xb2,0x49,0xc9 },
              [0x19b] = { 0xc0,0x4f,0xc5,0xd4,0x96,0xde },
              [0x19c] = { 0xc0,0x4f,0xc5,0xd4,0x96,0xde,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x19d] = { 0xb8,0x4f,0xbc,0x1,0x77,0xe0,0x4e },
              [0x19e] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xaf,0x4f,0xc3,0x6,0x96,0xd5,0x4e,0xba,0x4 },
              [0x19f] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xb8,0x41,0xb7,0xf7,0xa1 },
              [0x1a0] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xad,0x43,0xb8,0xf7,0xa3,0xe0 },
              [0x1a1] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x49,0xc3,0xf9,0x7b,0xde,0x41,0xc2,0xf7 },
              [0x1a2] = { 0xc0,0x41,0xb7,0xd4,0x96,0xde },
              [0x1a3] = { 0xc0,0x41,0xb7,0xea,0x89,0xd5,0x54,0xc1,0xf7,0x8b,0xd5,0x53,0xbe,0xf4,0xa1,0xd1 },
              [0x1a4] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x49,0xc3,0xf9,0x79,0xd5,0x52,0xba,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0x1a5] = { 0xb4,0x4f,0xc7,0xfb,0xaf,0xdb,0x4e,0xc9,0xf3,0xa1 },
              [0x1a6] = { 0xb9,0x4f,0xca,0x5,0x9a,0xc3,0x48,0xba,0xf7,0xa1 },
              [0x1a7] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xd5,0x96,0xda,0x56,0xb6,0x5,0x88,0xd5,0x5a,0xba },
              [0x1a8] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe9,0x9e,0xda,0x44,0xc4,0x9,0x88,0xd5,0x5a,0xba },
              [0x1a9] = { 0xaf,0x41,0xc3,0x8,0x96,0xdf,0x30,0xc4,0x5,0x9e,0xe0,0x49,0xc4,0x0 },
              [0x1aa] = { 0xc6 },
              [0x1ab] = { 0xdf,0x45,0xc5,0xf3,0xa7,0xcd,0x54,0xc4,0x4 },
              [0x1ac] = { 0xbf,0x49,0xb9,0xf7,0x85,0xcd,0x4e,0xba,0xfe },
              [0x1ad] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xc3,0x49,0xb9,0x6,0x9d },
              [0x1ae] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x1af] = { 0xbf,0x49,0xb9,0xf7,0x77,0xdb,0x52,0xb9,0xf7,0xa7 },
              [0x1b0] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb4,0x45,0xb6,0xf6,0x9a,0xde },
              [0x1b1] = { 0xc0,0x21,0x97,0xe5 },
              [0x1b2] = { 0x2c },
              [0x1b3] = { 0xdf,0x45,0xc9,0xe2,0x96,0xda,0x45,0xc1,0xe1,0xa5,0xd1,0x4e },
              [0x1b4] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb0,0x49,0xcb,0xfb,0x99,0xd1,0x52 },
              [0x1b5] = { 0xbf,0x49,0xb9,0xf7,0x88,0xcf,0x52,0xc4,0xfe,0xa1 },
              [0x1b6] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x56 },
              [0x1b7] = { 0xc2,0x45,0xc7,0x5,0x9e,0xdb,0x4e },
              [0x1b8] = { 0xbb,0x50,0xba,0x0,0x7d,0xcd,0x4e,0xb9,0xfe,0x9a },
              [0x1b9] = { 0xb4,0x41,0xc3,0xf6,0xa1,0xd1,0x37,0xbe,0xf6,0xa9,0xd4 },
              [0x1ba] = { 0xb4,0x41,0xc3,0xf6,0xa1,0xd1,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x1bb] = { 0xaf,0x4f,0xc3,0x6,0x9a,0xda,0x54 },
              [0x1bc] = { 0xbf,0x45,0xb6,0x4,0x98,0xd4,0x6 },
              [0x1bd] = { 0xbc,0x4c,0xb6,0xf5,0x9a,0xd4,0x4f,0xc1,0xf6,0x9a,0xde,0x23,0xc4,0xfe,0xa4,0xde,0x13 },
              [0x1be] = { 0xbf,0x45,0xb6,0x4,0x98,0xd4,0x22,0xc4,0xa },
              [0x1bf] = { 0xc0,0x41,0xb7,0xd5,0xa4,0xda,0x54,0xba,0x0,0xa9,0xb4,0x4f,0xc1,0xf6,0x9a,0xde },
              [0x1c0] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x22,0xb6,0x4 },
              [0x1c1] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x34,0xba,0xa,0xa9 },
              [0x1c2] = { 0xbe,0x45,0xc3,0xf6,0x9a,0xde,0x33,0xc9,0xf7,0xa5,0xdc,0x45,0xb9 },
              [0x1c3] = { 0xb2,0x30,0xa8,0xb2,0x5a,0xd0,0x0,0x75,0x49,0x55,0x8c,0x30,0xbe,0x0,0x9c,0x8c,0x5,0xb9,0xff,0xa8,0x8c,0x0,0xc,0xb2,0x55,0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x53,0x75,0xb7,0x99,0x8c,0x0,0xc,0xb2,0x55,0x91,0x53 },
              [0x1c4] = { 0xd0,0x41,0xc9,0xf7 },
              [0x1c5] = { 0x91,0x28,0x8f,0xb7,0x82,0xa6,0x5,0xa8 },
              [0x1c6] = { 0xc3,0x49,0xc3,0xd5,0xa4,0xda,0x54,0xc7,0x1,0xa1,0xdf },
              [0x1c7] = { 0x7f },
              [0x1c8] = { 0xd9,0x49,0xc3,0xfb,0xa2,0xd5,0x5a,0xba,0xf6 },
              [0x1c9] = { 0xe1,0x49,0xab,0xfb,0xa8,0xd5,0x42,0xc1,0xf7 },
              [0x1ca] = { 0xcf,0x4c,0xc4,0x5,0x9a },
              [0x1cb] = { 0xcd,0x50,0xc5,0xfe,0xae,0xc0,0x48,0xba,0xff,0x9a,0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99 },
              [0x1cc] = { 0xce,0x47,0x9e,0xff,0x96,0xd3,0x45 },
              [0x1cd] = { 0xe0,0x49,0xc9,0xfe,0x9a,0xaf,0x4f,0xc1,0x1,0xa7 },
              [0x1ce] = { 0xce,0x47,0xb4 },
              [0x1cf] = { 0xb5,0x4d,0xb6,0xf9,0x9a },
              [0x1d0] = { 0xdf,0x45,0xc9,0xdf,0x9e,0xda,0x49,0xc2,0xfb,0xaf,0xd1,0x44 },
              [0x1d1] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xd5,0x5a,0xba,0xf6 },
              [0x1d2] = { 0xd9,0x49,0xc3,0xfb,0xa2,0xd5,0x5a,0xba,0xe6,0x9a,0xe4,0x54 },
              [0x1d3] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0 },
              [0x1d4] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xbb,0x50,0xba,0x0 },
              [0x1d5] = { 0xad,0x43,0xc9,0xfb,0xab,0xd1,0x34,0xb6,0xf4 },
              [0x1d6] = { 0xc0,0x41,0xb7,0x5 },
              [0x1d7] = { 0xdf,0x48,0xc4,0x9,0x8a,0xb5 },
              [0x1d8] = { 0xb1,0x4e,0xb6,0xf4,0xa1,0xd1,0x44 },
              [0x1d9] = { 0xd4,0x49,0xb9,0xf7,0x8a,0xb5 },
              [0x1da] = { 0xcd,0x4e,0xbe,0xff,0x96,0xe0,0x45,0x9a,0xa,0x9e,0xe0 },
              [0x1db] = { 0xb3,0x55,0xbe,0xe1,0x97,0xd6,0x45,0xb8,0x6 },
              [0x1dc] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x36,0xbe,0x5 },
              [0x1dd] = { 0xaf,0x4c,0xc4,0x5,0x9a,0xbb,0x56,0xba,0x4,0xa1,0xcd,0x59 },
              [0x1de] = { 0xaf,0x4c,0xc4,0x5,0x9a,0x8c,0x32,0xb6,0xc,0x9a,0xde,0x1f },
              [0x1df] = { 0xad,0x4c,0xc1,0xb2,0x9b,0xd1,0x41,0xc9,0x7,0xa7,0xd1,0x53,0x75,0x9,0x9e,0xd8,0x4c,0x75,0x6,0xaa,0xde,0x4e,0x75,0x1,0x9b,0xd2,0x0,0xb6,0x0,0x99,0x8c,0x32,0xb6,0xc,0x9a,0xde,0x0,0xcc,0xfb,0xa1,0xd8,0x0,0xb7,0xf7,0x55,0xde,0x45,0xc2,0x1,0xab,0xd1,0x44,0x83,0x9c,0x8e,0xdb,0x55,0x7c,0xfe,0xa1,0x8c,0x4e,0xba,0xf7,0x99,0x8c,0x54,0xc4,0xb2,0xa7,0xd1,0xd,0xba,0xa,0x9a,0xcf,0x55,0xc9,0xf7,0x55,0xe0,0x4f,0x75,0x4,0x9a,0xdb,0x50,0xba,0x0,0x63 },
              [0x1e0] = { 0xaf,0x41,0xc3,0xf5,0x9a,0xd8 },
              [0x1e1] = { 0xaf,0x4c,0xc4,0x5,0x9a },
              [0x1e2] = { 0xaf,0x4c,0xba,0xf3,0xa3,0xe1,0x50 },
              [0x1e3] = { 0xe0,0x49,0xc9,0xfe,0x9a,0xc2,0x49,0xc8,0xfb,0x97,0xd8,0x45 },
              [0x1e4] = { 0xdf,0x45,0xc9,0xe6,0x9e,0xe0,0x4c,0xba,0xe8,0x9e,0xdf,0x49,0xb7,0xfe,0x9a },
              [0x1e5] = { 0xc0,0x41,0xb7,0xea,0x89,0xd5,0x54,0xc1,0xf7,0x7d,0xd5,0x44,0xb9,0xf7,0xa3 },
              [0x1e6] = { 0xc0,0x45,0xcd,0x6,0x88,0xd5,0x5a,0xba },
              [0x1e7] = { 0xb5,0x4e,0xa4,0x7,0xa9 },
              [0x1e8] = { 0xb8,0x45,0xbb,0x6,0x78,0xdb,0x4c,0xca,0xff,0xa3 },
              [0x1e9] = { 0xdf,0x45,0xc9,0xde,0x96,0xe5,0x4f,0xca,0x6 },
              [0x1ea] = { 0xc2,0x49,0xba,0x9,0xa5,0xdb,0x52,0xc9,0xe5,0x9e,0xe6,0x45 },
              [0x1eb] = { 0xbf,0x4e,0xb6,0x2,0x79,0xd5,0x53,0xc9,0xf3,0xa3,0xcf,0x45 },
              [0x1ec] = { 0xbb,0x50,0xba,0x0,0x78,0xdb,0x4d,0xb7,0x1 },
              [0x1ed] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb7,0x45,0xce },
              [0x1ee] = { 0xd2,0x49,0xc1,0xfe },
              [0x1ef] = { 0xcd,0x50,0xc5,0xfe,0xae,0xaf,0x4f,0xc1,0x1,0xa7 },
              [0x1f0] = { 0xdc,0x49,0xc1,0xfe },
              [0x1f1] = { 0xdf,0x49,0xb9,0xf7,0x81,0xcd,0x42,0xba,0xfe },
              [0x1f2] = { 0xdf,0x49,0xb9,0xf7,0x77,0xcd,0x52 },
              [0x1f3] = { 0xce,0x4f,0xcd },
              [0x1f4] = { 0xde,0x45,0xbb,0x4,0x9a,0xdf,0x48 },
              [0x1f5] = { 0xcf,0x41,0xc7,0xf6 },
              [0x1f6] = { 0xaf,0x4f,0xc7,0x0,0x9a,0xde,0x32,0xb6,0xf6,0x9e,0xe1,0x53 },
              [0x1f7] = { 0xe3,0x52,0xb6,0x2,0xa5,0xd1,0x52 },
              [0x1f8] = { 0xcf,0x52,0xba,0xf3,0xa9,0xd1,0x34,0xb6,0xf4 },
              [0x1f9] = { 0xc0,0x41,0xb7 },
              [0x1fa] = { 0xbf,0x49,0xb9,0xf7,0x77,0xe0,0x4e },
              [0x1fb] = { 0xbf,0x49,0xb9,0xf7,0x77,0xe0,0x4e,0x9d,0xf7,0x9e,0xd3,0x48,0xc9 },
              [0x1fc] = { 0xad,0x43,0xb8,0xf7,0xa3,0xe0,0x22,0xb6,0x4 },
              [0x1fd] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x3f },
              [0x1fe] = { 0xbe,0x4f,0xcc,0xd9,0x96,0xdc },
              [0x1ff] = { 0xda,0x41,0xc2,0xf7 },
              [0x200] = { 0xdf,0x49,0xb9,0xf7,0x77,0xe0,0x4e },
              [0x201] = { 0xcb,0x53,0xba,0x6,0x76,0xcf,0x54,0xbe,0x8,0x9a },
              [0x202] = { 0xdb,0x4e,0x96,0xf5,0xa9,0xd5,0x56,0xb6,0x6,0x9a,0xd0 },
              [0x203] = { 0xcb,0x43,0xc1,0xf7,0x96,0xda,0x45,0xb9 },
              [0x204] = { 0xdf,0x41,0xcb,0xf7 },
              [0x205] = { 0xb2,0x45,0xb6,0x6,0xaa,0xde,0x45,0xc8 },
              [0x206] = { 0xbf,0x45,0xc9,0xd8,0xa1,0xe5 },
              [0x207] = { 0xaf,0x48,0xb6,0x4,0x96,0xcf,0x54,0xba,0x4 },
              [0x208] = { 0xb4,0x55,0xc2,0xf3,0xa3,0xdb,0x49,0xb9 },
              [0x209] = { 0xc3,0x41,0xc1,0xfd,0x88,0xdc,0x45,0xba,0xf6 },
              [0x20a] = { 0xc1,0x53,0xba,0xdc,0xaa,0xd9,0x50,0xa5,0x1,0xac,0xd1,0x52 },
              [0x20b] = { 0xb6,0x55,0xc2,0x2,0x85,0xdb,0x57,0xba,0x4 },
              [0x20c] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x3d,0x75,0xe7,0xa3,0xd8,0x4f,0xb6,0xf6,0x9a,0xd0,0xe },
              [0x20d] = { 0xbf,0x45,0xc9,0xe5,0xa5,0xd1,0x45,0xb9 },
              [0x20e] = { 0xbf,0x41,0xcb,0xf7,0x99 },
              [0x20f] = { 0xe3,0x41,0xc1,0xfd,0x88,0xdc,0x45,0xba,0xf6 },
              [0x210] = { 0xbf,0x45,0xc9,0xdc,0xaa,0xd9,0x50 },
              [0x211] = { 0xd6,0x55,0xc2,0x2,0x85,0xdb,0x57,0xba,0x4 },
              [0x212] = { 0xcd,0x50,0xc5,0xfe,0xae,0xc0,0x48,0xba,0xff,0x9a,0xaf,0x55,0xc8,0x6,0xa4,0xd9,0x53 },
              [0x213] = { 0xde,0x45,0xbb,0x4,0x9a,0xdf,0x48,0x98,0x7,0xa8,0xe0,0x4f,0xc2,0x5 },
              [0x214] = { 0xb4,0x55,0xc2,0xf3,0xa3,0xdb,0x49,0xb9,0xe4,0xa4,0xdb,0x54,0xa5,0xf3,0xa7,0xe0 },
              [0x215] = { 0xae,0x4f,0xb9,0xb,0x8b,0xd1,0x4c,0xc4,0xf5,0x9e,0xe0,0x59 },
              [0x216] = { 0xb9,0x41,0xcd,0xd8,0xa4,0xde,0x43,0xba },
              [0x217] = { 0xc2,0x45,0xc1,0x1,0x98,0xd5,0x54,0xce },
              [0x218] = { 0xe6,0x45,0xc7,0x1 },
              [0x219] = { 0xae,0x4f,0xb9,0xb,0x7c,0xe5,0x52,0xc4 },
              [0x21a] = { 0xb9,0x41,0xcd,0xe6,0xa4,0xde,0x51,0xca,0xf7 },
              [0x21b] = { 0xbc },
              [0x21c] = { 0xb4,0x45,0xb6,0x4,0xa9,0xce,0x45,0xb6,0x6 },
              [0x21d] = { 0xaf,0x26,0xc7,0xf3,0xa2,0xd1 },
              [0x21e] = { 0xc3 },
              [0x21f] = { 0xb8,0x4f,0xc4,0xfd,0x8b,0xd1,0x43,0xc9,0x1,0xa7 },
              [0x220] = { 0xbf },
              [0x221] = { 0xad },
              [0x222] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xc2,0x45,0xb8,0x6,0xa4,0xde },
              [0x223] = { 0xb0 },
              [0x224] = { 0xbf,0x50,0xb6,0xf5,0x9a },
              [0x225] = { 0xb8,0x45,0xbb,0x6,0x78,0xdb,0x4e,0xc9,0x4,0xa4,0xd8 },
              [0x226] = { 0xb9,0x41,0xbc,0x0,0x9e,0xe0,0x55,0xb9,0xf7 },
              [0x227] = { 0xc1,0x4e,0xbe,0x6 },
              [0x228] = { 0xbf,0x45,0xc9,0xd8,0xa1,0xe5,0x33,0xc5,0xf7,0x9a,0xd0 },
              [0x229] = { 0xaf,0x48,0xb6,0x4,0x96,0xcf,0x54,0xba,0x4,0x76,0xd0,0x44,0xba,0xf6 },
              [0x22a] = { 0xdf,0x45,0xc9,0xd4,0x96,0xcf,0x4b,0xbc,0x4,0xa4,0xe1,0x4e,0xb9,0xdf,0xa4,0xd0,0x45 },
              [0x22b] = { 0xce,0x47,0xa2,0x1,0x99,0xd1 },
              [0x22c] = { 0xde,0x41,0xcf,0xf7,0xa7,0xcb,0x57,0xbd,0xfb,0xa9,0xd1 },
              [0x22d] = { 0xde,0x41,0xcf,0xf7,0xa7,0xcb,0x42,0xc1,0xf3,0x98,0xd7 },
              [0x22e] = { 0xbf,0x45,0xc9,0x6,0x9e,0xda,0x47,0xc8 },
              [0x22f] = { 0xb9,0x2f,0xab,0xd7,0x82,0xb1,0x2e,0xa9 },
              [0x230] = { 0xb2,0x4c,0xce },
              [0x231] = { 0xb2,0x4c,0xce,0xb2,0x88,0xdc,0x45,0xba,0xf6 },
              [0x232] = { 0xbf,0x50,0xba,0xf7,0x99 },
              [0x233] = { 0xc3,0x41,0xc1,0xfd,0x55,0xbf,0x50,0xba,0xf7,0x99 },
              [0x234] = { 0xb6,0x55,0xc2,0x2,0x55,0xbc,0x4f,0xcc,0xf7,0xa7 },
              [0x235] = { 0xc2,0x29,0xa8,0xe7,0x76,0xb8 },
              [0x236] = { 0xb1,0x33,0xa5 },
              [0x237] = { 0xb1,0x4e,0xb6,0xf4,0xa1,0xd1,0x0,0x9a,0xe5,0x85 },
              [0x238] = { 0xc0,0x45,0xcd,0x6,0x55,0xbf,0x49,0xcf,0xf7 },
              [0x239] = { 0xb9,0x41,0xcd,0xb2,0x79,0xd5,0x53,0xc9,0xf3,0xa3,0xcf,0x45 },
              [0x23a] = { 0xad,0x30,0xa5,0xd7,0x76,0xbe,0x21,0xa3,0xd5,0x7a },
              [0x23b] = { 0xb0,0x41,0xc7,0xfd,0x55,0xb9,0x4f,0xb9,0xf7 },
              [0x23c] = { 0xb0,0x41,0xc7,0xfd },
              [0x23d] = { 0xb8,0x49,0xbc,0xfa,0xa9 },
              [0x23e] = { 0x8c,0x4d,0xc4,0xf6,0x9a },
              [0x23f] = { 0xbf,0x48,0xc4,0x9,0x55,0xc0,0x49,0xc9,0xfe,0x9a },
              [0x240] = { 0xb8,0x21,0xae,0xe1,0x8a,0xc0 },
              [0x241] = { 0xbf,0x49,0xb9,0xf7,0x85,0xcd,0x4e,0xba,0xfe,0x55,0x94,0x2c,0xba,0xf8,0xa9,0xaf,0x4f,0xc1,0x7,0xa2,0xda,0x9 },
              [0x242] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0,0x1a,0x75 },
              [0x243] = { 0xbb,0x50,0xb6,0xf5,0x9e,0xe0,0x59 },
              [0x244] = { 0xc1,0x29,0x75,0xe5,0x98,0xcd,0x4c,0xba },
              [0x245] = { 0xbf,0x54,0xb6,0x6,0x9e,0xdf,0x54,0xbe,0xf5,0xa8,0x8c,0x2f,0xcb,0xf7,0xa7,0xd8,0x41,0xce },
              [0x246] = { 0xbf,0x54,0xb6,0x6,0x9e,0xdf,0x54,0xbe,0xf5,0xa8,0xa6,0x0 },
              [0x247] = { 0xbb,0x2e },
              [0x248] = { 0xbb,0x26,0x9b },
              [0x249] = { 0xaf,0x2f,0xa1,0xe1,0x87,0xbf },
              [0x24a] = { 0xbf,0x4c,0xbe,0xf6,0x9a,0xde,0x0,0x98,0x1,0xa1,0xdb,0x52 },
              [0x24b] = { 0xe2,0x41,0xc1,0xde,0x97,0xd8 },
              [0x24c] = { 0xc0,0x41,0xb7,0xb2,0x78,0xdb,0x4c,0xc4,0x4 },
              [0x24d] = { 0xc0,0x4f,0xbc,0xf9,0xa1,0xd1,0x0,0x98,0x1,0xa1,0xdb,0x52 },
              [0x24e] = { 0xc0,0x49,0xc9,0xfe,0x9a,0x8c,0x21,0xb8,0xf5,0x9a,0xda,0x54 },
              [0x24f] = { 0xc0,0x28,0x9a,0xdf,0x7a,0x8c,0x30,0xa7,0xd7,0x88,0xb1,0x34,0xa8 },
              [0x250] = { 0xaf,0x52,0xc4,0x2 },
              [0x251] = { 0xcf,0x48,0xbe,0x2,0x94 },
              [0x252] = { 0xb0,0x45,0xbb,0xf3,0xaa,0xd8,0x54,0x75,0xe9,0x9d,0xd5,0x54,0xba },
              [0x253] = { 0xbe,0x41,0xcc },
              [0x254] = { 0xb0,0x41,0xc7,0xfd,0x55,0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99 },
              [0x255] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x37,0xbd,0xfb,0xa9,0xd1 },
              [0x256] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xc3,0x48,0xbe,0x6,0x9a },
              [0x257] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x22,0xc1,0xf3,0x98,0xd7 },
              [0x258] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xae,0x4c,0xb6,0xf5,0xa0 },
              [0x259] = { 0xb3,0x41,0xc1,0xf3,0xad,0xe5 },
              [0x25a] = { 0xc3,0x41,0xc9,0xf7,0xa7 },
              [0x25b] = { 0xb3,0x52,0xba,0xf7,0xa3 },
              [0x25c] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xcd,0x4c,0xbe,0x5,0xa9,0xd5,0x43,0x75,0xd4,0xa1,0xcd,0x43,0xc0 },
              [0x25d] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xcd,0x4c,0xbe,0x5,0xa9,0xd5,0x43,0x97,0xfe,0x96,0xcf,0x4b },
              [0x25e] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xcd,0x4c,0xbe,0x5,0xa9,0xd5,0x43,0x75,0xe9,0x9d,0xd5,0x54,0xba },
              [0x25f] = { 0xcb,0x4c,0xc4,0xf3,0x99,0xd5,0x4e,0xbc },
              [0x260] = { 0xcb,0x51,0xca,0xf7,0xaa,0xd1,0x44 },
              [0x261] = { 0xcd,0x56,0xb6,0xfb,0xa1,0xcd,0x42,0xc1,0xf7 },
              [0x262] = { 0xd1,0x4e,0xc8,0x7,0xa7,0xd1,0x24,0xbe,0x4 },
              [0x263] = { 0xcf,0x4f,0xc1,0xfe,0x9a,0xcf,0x54 },
              [0x264] = { 0xd3,0x45,0xc9 },
              [0x265] = { 0xe0,0x3f },
              [0x266] = { 0xdf,0x3f },
              [0x267] = { 0xd5,0x3f },
              [0x268] = { 0xd7,0x3f },
              [0x269] = { 0xe0,0x48,0xba,0xff,0x9a },
              [0x26a] = { 0xd8,0x41,0xce,0x1,0xaa,0xe0 },
              [0x26b] = { 0xcf,0x33,0xc1,0xfb,0x99,0xd1,0x52 },
              [0x26c] = { 0xcf,0x34,0xc4,0xf9,0x9c,0xd8,0x45 },
              [0x26d] = { 0xcf,0x34,0xb6,0xf4 },
              [0x26e] = { 0xcf,0x34,0xbe,0x6,0xa1,0xd1 },
              [0x26f] = { 0xcd,0x50,0xc5,0xfe,0xae },
              [0x270] = { 0xdf,0x45,0xc9 },
              [0x271] = { 0xad,0x50,0xc5,0xfe,0xae },
              [0x272] = { 0xbf,0x41,0xcb,0xf7,0x7b,0xd5,0x4c,0xba },
              [0x273] = { 0xbf,0x41,0xcb,0xf7,0x79,0xcd,0x54,0xb6 },
              [0x274] = { 0x91,0x53,0x80 },
              [0x275] = { 0xbe,0x4f,0xcc,0xb6 },
              [0x276] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xb8,0x49,0xb7 },
              [0x277] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xbf,0x41,0xcb,0xf7,0x79,0xcd,0x54,0xb6 },
              [0x278] = { 0xb8,0x4f,0xb6,0xf6,0x9a,0xd0,0xe,0x75,0xe4,0x9e,0xd3,0x48,0xc9,0xe5,0x9d,0xd5,0x46,0xc9,0xb2,0x60,0x8c,0x25,0xc3,0x6,0x9a,0xde,0x0,0xc9,0x1,0x55,0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0xe },
              [0x279] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x3d,0x75,0xd4,0xa4,0xd0,0x59,0x75,0xf8,0x9e,0xda,0x49,0xc8,0xfa,0x9a,0xd0,0x0,0xa4,0xdd,0x63 },
              [0x27a] = { 0x76,0xd,0x82,0xbf,0x55,0xc0,0x32,0x96,0xd5,0x7a,0xae,0x21,0x98,0xdd,0x55,0x99,0xd,0x82,0x9c },
              [0x27b] = { 0xe0,0x52,0xb6,0xf5,0x9a,0xce,0x41,0xb8,0xfd },
              [0x27c] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x3d,0x75,0xd8,0x76,0xc0,0x21,0xa1,0xcc,0x3f },
              [0x27d] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x0,0xcb,0xc8,0x63,0x9c,0x3d,0x75,0xde,0xa4,0xcd,0x44,0xba,0xf6,0x63,0x8c,0x32,0xbe,0xf9,0x9d,0xe0,0x33,0xbd,0xfb,0x9b,0xe0,0x0,0x80,0xb2,0x7a,0xda,0x54,0xba,0x4,0x55,0xe0,0x4f,0x75,0x6,0xa4,0xd3,0x47,0xc1,0xf7,0x63 },
            }
            local _11I1lIlI = {}
            local _1II1lIlI = function(idx)
              local cached = _11I1lIlI[idx]
              if cached then return cached end
              local data = _l1I1lIlI[idx]
              if not data then return "" end
              local chars = {}
              for i = 1, #data do
                local k = _I1I1lIlI[((i - 1) % #_I1I1lIlI) + 1]
                chars[i] = string.char((data[i] - k + 256) % 256)
              end
              local res = table.concat(chars)
              _11I1lIlI[idx] = res
              return res
            end
            
            
            local _ll11lIlI = 702
            while _ll11lIlI do
              if _ll11lIlI == 702 then
                _ll11lIlI = 1972
              elseif _ll11lIlI == 1972 then
                do
                  
                  
                  
                  
                  
                  
                  
                  local _l1IIlIlI, _I1IIlIlI = xpcall(function()
                   print(_1II1lIlI(0x1))
                  
                   local _11IIlIlI = game:GetService(_1II1lIlI(0x2))
                   local _ll1IlIlI 
                   local _Il1IlIlI 
                   local _1l1IlIlI = {}
                  
                  
                  local _lI1IlIlI = {}
                  
                  local _II1IlIlI = game:GetService(_1II1lIlI(0x3))
                  local _1I1IlIlI = game:GetService(_1II1lIlI(0x4))
                  local _l11IlIlI = game:GetService(_1II1lIlI(0x5))
                  local _I11IlIlI = game:GetService(_1II1lIlI(0x6))
                  local _111IlIlI = game:GetService(_1II1lIlI(0x7))
                  local _lllIlIlI = game:GetService(_1II1lIlI(0x8))
                  local _IllIlIlI = game:GetService(_1II1lIlI(0x9))
                  local _1llIlIlI = game:GetService(_1II1lIlI(0xa))
                  local _lIlIlIlI = _I11IlIlI[_1II1lIlI(0xb)]
                  local _IIlIlIlI = workspace[_1II1lIlI(0xc)]
                  
                  _lI1IlIlI[_1II1lIlI(0xd)] = {
                   Title = _1II1lIlI(0xe), Version = _1II1lIlI(0xf),
                   LogoURL = _1II1lIlI(0x10),
                   LogoFallback = _1II1lIlI(0x11),
                   DefaultTheme = _1II1lIlI(0x12),
                   OpenCombo = { Enum[_1II1lIlI(0x13)][_1II1lIlI(0x14)], Enum[_1II1lIlI(0x13)][_1II1lIlI(0x15)] },
                   PanelKey = Enum[_1II1lIlI(0x13)][_1II1lIlI(0x16)],
                   Size = UDim2[_1II1lIlI(0x17)]((((0x1400 - 0x0) / 0x8)), (((0xeb0 - 0x0) / 0x8))),
                   Minimized = UDim2[_1II1lIlI(0x17)]((((0x1400 - 0x0) / 0x8)), (((0x170 - 0x0) / 0x8))),
                   Radius = (((0x50 - 0x0) / 0x8)), TopBarHeight = (((0x170 - 0x0) / 0x8)), StatusHeight = (((0xa0 - 0x0) / 0x8)),
                   RowHeight = (((0x120 - 0x0) / 0x8)), IconSize = (((0x90 - 0x0) / 0x8)), RowGap = (((0x40 - 0x0) / 0x8)),
                   PanelWidth = (((0x4b0 - 0x0) / 0x8)), HandleWidth = (((0x50 - 0x0) / 0x8)), HandleHeight = (((0x160 - 0x0) / 0x8)),
                   SideBtnHeight = (((0x110 - 0x0) / 0x8)),
                   TabXTitleVisible = (((0x5f0 - 0x0) / 0x8)), TabXTitleHidden = (((0x1a0 - 0x0) / 0x8)),
                   AssetFolder = _1II1lIlI(0xe), Debug = (0x1 == 0x1),
                   ClickSoundId = _1II1lIlI(0x18), ClickVolume = 0.5,
                   NotificationPosition = _1II1lIlI(0x19),
                   PurpleDefault = _1II1lIlI(0x1a), SnapDistance = (((0xc0 - 0x0) / 0x8)),
                   SaveFile = _1II1lIlI(0x1b),
                  }
                  
                  _lI1IlIlI[_1II1lIlI(0xe)] = {
                   Tabs = {}, ActiveTab = nil, Saved = {},
                   Custom = {}, SliderReg = {}, ToggleReg = {}, DropdownReg = {},
                   InputReg = {}, KeybindReg = {}, NotifReg = {},
                   Layout = _1II1lIlI(0x1c), PanelOpen = (0x0 == 0x1), StatsOn = (0x0 == 0x1),
                   _cleaned = (0x0 == 0x1), _frameCount = (0x19 - 0x19),
                  }
                  
                  local _1IlIlIlI = _lI1IlIlI[_1II1lIlI(0xd)]
                  local _l1lIlIlI = {}
                  
                  _lI1IlIlI[_1II1lIlI(0x1d)] = nil
                  _lI1IlIlI[_1II1lIlI(0x1e)] = nil
                  
                  function _l1lIlIlI.hex(_lI11lIlI)
                   _lI11lIlI = _lI11lIlI:gsub(_1II1lIlI(0x20),_1II1lIlI(0x21)):lower()
                   if #_lI11lIlI == (((0x18 - 0x0) / 0x8)) then _lI11lIlI = _lI11lIlI:sub((0x2a / 0x2a),(0x2a / 0x2a)):rep((((0x10 - 0x0) / 0x8))).._lI11lIlI:sub((((0x10 - 0x0) / 0x8)),(((0x10 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))).._lI11lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x18 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))) end
                   return Color3[_1II1lIlI(0x22)](tonumber(_lI11lIlI:sub((0x2a / 0x2a),(((0x10 - 0x0) / 0x8))),(((0x80 - 0x0) / 0x8))), tonumber(_lI11lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x20 - 0x0) / 0x8))),(((0x80 - 0x0) / 0x8))), tonumber(_lI11lIlI:sub((((0x28 - 0x0) / 0x8)),(((0x30 - 0x0) / 0x8))),(((0x80 - 0x0) / 0x8))))
                  end
                  
                  function _l1lIlIlI.toHex(_I1IIlIlI)
                   return string[_1II1lIlI(0x24)](_1II1lIlI(0x25),
                   math[_1II1lIlI(0x26)](_I1IIlIlI[_1II1lIlI(0x27)]*(((0x7f8 - 0x0) / 0x8))+0.5), math[_1II1lIlI(0x26)](_I1IIlIlI[_1II1lIlI(0x28)]*(((0x7f8 - 0x0) / 0x8))+0.5), math[_1II1lIlI(0x26)](_I1IIlIlI[_1II1lIlI(0x29)]*(((0x7f8 - 0x0) / 0x8))+0.5))
                  end
                  
                  function _l1lIlIlI.parseHex(_lI11lIlI)
                   if type(_lI11lIlI) ~= _1II1lIlI(0x2b) then return nil end
                   _lI11lIlI = _lI11lIlI:gsub(_1II1lIlI(0x20),_1II1lIlI(0x21)):gsub(_1II1lIlI(0x2c),_1II1lIlI(0x21)):lower()
                   if #_lI11lIlI == (((0x18 - 0x0) / 0x8)) then _lI11lIlI = _lI11lIlI:sub((0x2a / 0x2a),(0x2a / 0x2a)):rep((((0x10 - 0x0) / 0x8))).._lI11lIlI:sub((((0x10 - 0x0) / 0x8)),(((0x10 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))).._lI11lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x18 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))) end
                   if #_lI11lIlI ~= (((0x30 - 0x0) / 0x8)) or not _lI11lIlI:match(_1II1lIlI(0x2d)) then return nil end
                   return _l1lIlIlI[_1II1lIlI(0x1f)](_lI11lIlI)
                  end
                  
                  function _l1lIlIlI.create(class, props)
                   local _I1lIlIlI = Instance[_1II1lIlI(0x2f)](class)
                   local _11lIlIlI
                   for _llIIlIlI, _IlIIlIlI in pairs(props or {}) do
                   if _llIIlIlI == _1II1lIlI(0x30) then _11lIlIlI = _IlIIlIlI else _I1lIlIlI[_llIIlIlI] = _IlIIlIlI end
                   end
                   if _11lIlIlI then _I1lIlIlI[_1II1lIlI(0x30)] = _11lIlIlI end
                   if (class == _1II1lIlI(0x31) or class == _1II1lIlI(0x32)) and _lI1IlIlI[_1II1lIlI(0x33)] then
                   _I1lIlIlI[_1II1lIlI(0x34)]:Connect(function() _lI1IlIlI[_1II1lIlI(0x33)][_1II1lIlI(0x35)]() end)
                   end
                   return _I1lIlIlI
                  end
                  
                  function _l1lIlIlI.tween(_I1lIlIlI, _l1IlIIlI, props, style, _l1IIlIlI)
                   local _1lIIlIlI = TweenInfo[_1II1lIlI(0x2f)](_l1IlIIlI or 0.2, style or Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], _l1IIlIlI or Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   local _lIIIlIlI = _II1IlIlI:Create(_I1lIlIlI, _1lIIlIlI, props); _lIIIlIlI:Play(); return _lIIIlIlI
                  end
                  
                  function _l1lIlIlI.corner(_11I1lIlI, r)
                   if not _11I1lIlI then return end
                   return _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x3c), { CornerRadius = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), r or _1IlIlIlI[_1II1lIlI(0x3d)]), Parent = _11I1lIlI })
                  end
                  
                  function _l1lIlIlI.stroke(_11I1lIlI, _I1IIlIlI, th, tr)
                   if not _11I1lIlI then return end
                   local _IIIIlIlI = _I1IIlIlI or Color3[_1II1lIlI(0x2f)](0.5,0.5,0.5)
                   return _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x3f), {
                   Color = _IIIIlIlI, Thickness = th or (0x2a / 0x2a), Transparency = tr or 0.4,
                   ApplyStrokeMode = Enum[_1II1lIlI(0x40)][_1II1lIlI(0x41)], Parent = _11I1lIlI })
                  end
                  
                  function _l1lIlIlI.clamp(_l1lI1IlI, _1l11lIlI, _llIllIlI) return math[_1II1lIlI(0x43)](_1l11lIlI, math[_1II1lIlI(0x44)](_llIllIlI, _l1lI1IlI)) end
                  
                  function _l1lIlIlI.hoverScale(_I1lIlIlI, hoverMul, baseMul)
                   baseMul = baseMul or (0x2a / 0x2a)
                   hoverMul = hoverMul or 1.05
                   local _1IIIlIlI = _I1lIlIlI:FindFirstChildOfClass(_1II1lIlI(0x46))
                   if not _1IIIlIlI then _1IIIlIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x46), { Parent = _I1lIlIlI, Scale = baseMul }) end
                   _I1lIlIlI[_1II1lIlI(0x47)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_1IIIlIlI, 0.14, { Scale = hoverMul }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _I1lIlIlI[_1II1lIlI(0x48)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_1IIIlIlI, 0.14, { Scale = baseMul }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   return _1IIIlIlI
                  end
                  
                  function _l1lIlIlI.pressPulse(_I1lIlIlI)
                   local _1IIIlIlI = _I1lIlIlI:FindFirstChildOfClass(_1II1lIlI(0x46))
                   if not _1IIIlIlI then _1IIIlIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x46), { Parent = _I1lIlIlI, Scale = (0x2a / 0x2a) }) end
                   _I1lIlIlI[_1II1lIlI(0x34)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_1IIIlIlI, 0.06, { Scale = 0.94 }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _I1lIlIlI[_1II1lIlI(0x4b)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_1IIIlIlI, 0.16, { Scale = (0x2a / 0x2a) }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _I1lIlIlI[_1II1lIlI(0x48)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_1IIIlIlI, 0.14, { Scale = (0x2a / 0x2a) }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   return _1IIIlIlI
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x4d)] = {}
                  function _l1lIlIlI.track(_I1IIlIlI) table[_1II1lIlI(0x4f)](_lI1IlIlI[_1II1lIlI(0x4d)], _I1IIlIlI); return _I1IIlIlI end
                  function _l1lIlIlI.disconnectAll()
                   for _l1IIlIlI, _I1IIlIlI in ipairs(_lI1IlIlI[_1II1lIlI(0x4d)]) do pcall(function() _I1IIlIlI:Disconnect() end) end
                   _lI1IlIlI[_1II1lIlI(0x4d)] = {}
                  end
                  
                  _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x51)]:Connect(function(_11IIlIlI)
                   local _ll1IlIlI = _lI1IlIlI[_1II1lIlI(0x1d)]
                   if not _ll1IlIlI then return end
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x53)]
                   or _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _ll1IlIlI[_1II1lIlI(0x55)](_11IIlIlI[_1II1lIlI(0x56)][_1II1lIlI(0x57)])
                   end
                  end))
                  _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x58)]:Connect(function(_11IIlIlI)
                   local _ll1IlIlI = _lI1IlIlI[_1II1lIlI(0x1d)]
                   if not _ll1IlIlI then return end
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   or _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _lI1IlIlI[_1II1lIlI(0x1d)] = nil
                   _ll1IlIlI[_1II1lIlI(0x5a)]()
                   end
                  end))
                  
                  _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x51)]:Connect(function(_11IIlIlI)
                   local _ll1IlIlI = _lI1IlIlI[_1II1lIlI(0x1e)]
                   if not _ll1IlIlI then return end
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x53)]
                   or _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   local _Il1IlIlI = _11IIlIlI[_1II1lIlI(0x56)][_1II1lIlI(0x57)] - _ll1IlIlI[_1II1lIlI(0x5b)]
                   local _1l1IlIlI = _11IIlIlI[_1II1lIlI(0x56)][_1II1lIlI(0x5c)] - _ll1IlIlI[_1II1lIlI(0x5d)]
                   _ll1IlIlI[_1II1lIlI(0x5e)][_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x2f)](
                   _ll1IlIlI[_1II1lIlI(0x5f)][_1II1lIlI(0x57)][_1II1lIlI(0x60)], _ll1IlIlI[_1II1lIlI(0x5f)][_1II1lIlI(0x57)][_1II1lIlI(0x61)] + _Il1IlIlI,
                   _ll1IlIlI[_1II1lIlI(0x5f)][_1II1lIlI(0x5c)][_1II1lIlI(0x60)], _ll1IlIlI[_1II1lIlI(0x5f)][_1II1lIlI(0x5c)][_1II1lIlI(0x61)] + _1l1IlIlI)
                   end
                  end))
                  _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x58)]:Connect(function(_11IIlIlI)
                   if not _lI1IlIlI[_1II1lIlI(0x1e)] then return end
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   or _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _lI1IlIlI[_1II1lIlI(0x1e)] = nil
                   end
                  end))
                  
                  _lI1IlIlI[_1II1lIlI(0x62)] = _l1lIlIlI
                  
                  
                  local _lI1IlIlI = {}
                  local _II1IlIlI = {}
                  local _1I1IlIlI = (0x2a / 0x2a)
                  local _l11IlIlI = (((0x30 - 0x0) / 0x8))
                  
                  function _lI1IlIlI.play()
                   if not _1IlIlIlI[_1II1lIlI(0x63)] or _1IlIlIlI[_1II1lIlI(0x63)] == _1II1lIlI(0x21) then return end
                   pcall(function()
                   if #_II1IlIlI == (0x19 - 0x19) then
                   for _11IIlIlI = (0x2a / 0x2a), _l11IlIlI do
                   local _I11IlIlI = Instance[_1II1lIlI(0x2f)](_1II1lIlI(0x33))
                   _I11IlIlI[_1II1lIlI(0x64)] = _1IlIlIlI[_1II1lIlI(0x63)]
                   _I11IlIlI[_1II1lIlI(0x65)] = _1IlIlIlI[_1II1lIlI(0x66)]
                   _I11IlIlI[_1II1lIlI(0x30)] = _111IlIlI
                   _II1IlIlI[_11IIlIlI] = _I11IlIlI
                   end
                   end
                   local _I11IlIlI = _II1IlIlI[_1I1IlIlI]
                   _1I1IlIlI = _1I1IlIlI % _l11IlIlI + (0x2a / 0x2a)
                   _I11IlIlI[_1II1lIlI(0x67)] = (0x19 - 0x19)
                   _I11IlIlI:Play()
                   end)
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x33)] = _lI1IlIlI
                  
                  local _111IlIlI = {}
                  local _lll1lIlI = _1IlIlIlI[_1II1lIlI(0x68)] .. _1II1lIlI(0x69)
                  local _Ill1lIlI = {}
                  local _1ll1lIlI = type(writefile) == _1II1lIlI(0x6a)
                  local _lIl1lIlI = type(readfile) == _1II1lIlI(0x6a)
                  local _IIl1lIlI = type(isfile) == _1II1lIlI(0x6a)
                  local _1Il1lIlI = type(getcustomasset) == _1II1lIlI(0x6a)
                  
                  pcall(function()
                   if type(isfolder) == _1II1lIlI(0x6a) and type(makefolder) == _1II1lIlI(0x6a) then
                   if not isfolder(_1IlIlIlI[_1II1lIlI(0x68)]) then makefolder(_1IlIlIlI[_1II1lIlI(0x68)]) end
                   if not isfolder(_lll1lIlI) then makefolder(_lll1lIlI) end
                   end
                  end)
                  
                  local function _l1l1lIlI(_I1l1lIlI)
                   local _11l1lIlI = request or http_request or (syn and syn[_1II1lIlI(0x6b)])
                   if _11l1lIlI then
                   local _llI1lIlI, _IlI1lIlI = pcall(_11l1lIlI, { Url = _I1l1lIlI, Method = _1II1lIlI(0x6c) })
                   if _llI1lIlI and type(_IlI1lIlI) == _1II1lIlI(0x6d) and _IlI1lIlI[_1II1lIlI(0x6e)] then return _IlI1lIlI[_1II1lIlI(0x6e)] end
                   end
                   local _llI1lIlI, _ll1IlIlI = pcall(game[_1II1lIlI(0x6f)], game, _I1l1lIlI)
                   if _llI1lIlI and type(_ll1IlIlI) == _1II1lIlI(0x2b) then return _ll1IlIlI end
                   return nil
                  end
                  
                  local function _1lI1lIlI(_lII1lIlI)
                   if type(_lII1lIlI) ~= _1II1lIlI(0x2b) or #_lII1lIlI < (((0x40 - 0x0) / 0x8)) then return nil end
                   local _III1lIlI, _1II1lIlI = _lII1lIlI:byte((0x2a / 0x2a)), _lII1lIlI:byte((((0x10 - 0x0) / 0x8)))
                   if _III1lIlI == 0x89 and _1II1lIlI == 0x50 then return _1II1lIlI(0x70) end
                   if _III1lIlI == 0xFF and _1II1lIlI == 0xD8 then return _1II1lIlI(0x71) end
                   if _III1lIlI == 0x47 and _1II1lIlI == 0x49 then return _1II1lIlI(0x72) end
                   if _lII1lIlI:sub((0x2a / 0x2a),(((0x20 - 0x0) / 0x8))) == _1II1lIlI(0x73) and _lII1lIlI:sub((((0x48 - 0x0) / 0x8)),(((0x60 - 0x0) / 0x8))) == _1II1lIlI(0x74) then return _1II1lIlI(0x75) end
                   return nil
                  end
                  
                  local _l1I1lIlI = { _1II1lIlI(0x70), _1II1lIlI(0x71), _1II1lIlI(0x72), _1II1lIlI(0x75) }
                  
                  function _111IlIlI.load(_I1l1lIlI, _1lI1IIlI)
                   if not _I1l1lIlI or _I1l1lIlI == _1II1lIlI(0x21) or not _1ll1lIlI or not _1Il1lIlI then return nil end
                   if _Ill1lIlI[_1lI1IIlI] then return _Ill1lIlI[_1lI1IIlI] end
                  
                   if type(isfile) == _1II1lIlI(0x6a) then
                   for _l1IIlIlI, _I1I1lIlI in ipairs(_l1I1lIlI) do
                   local _11I1lIlI = _lll1lIlI .. _1II1lIlI(0x77) .. _1lI1IIlI .. _1II1lIlI(0x78) .. _I1I1lIlI
                   local _llI1lIlI, _ll11lIlI = pcall(isfile, _11I1lIlI)
                   if _llI1lIlI and _ll11lIlI then
                   local _Il11lIlI, _1l11lIlI = pcall(getcustomasset, _11I1lIlI)
                   if _Il11lIlI and type(_1l11lIlI) == _1II1lIlI(0x2b) and _1l11lIlI ~= _1II1lIlI(0x21) then
                   _Ill1lIlI[_1lI1IIlI] = _1l11lIlI
                   return _1l11lIlI
                   end
                   end
                   end
                   end
                  
                   local _lII1lIlI = _l1l1lIlI(_I1l1lIlI)
                   if not _lII1lIlI or #_lII1lIlI < (((0x800 - 0x0) / 0x8)) or _lII1lIlI:sub((0x2a / 0x2a), (0x2a / 0x2a)) == _1II1lIlI(0x79) then return nil end
                  
                   local _I1I1lIlI = _1lI1lIlI(_lII1lIlI) or _1II1lIlI(0x70)
                   local _11I1lIlI = _lll1lIlI .. _1II1lIlI(0x77) .. _1lI1IIlI .. _1II1lIlI(0x78) .. _I1I1lIlI
                   if not pcall(writefile, _11I1lIlI, _lII1lIlI) then return nil end
                  
                   local _llI1lIlI, _1l11lIlI = pcall(getcustomasset, _11I1lIlI)
                   if _llI1lIlI and type(_1l11lIlI) == _1II1lIlI(0x2b) and _1l11lIlI ~= _1II1lIlI(0x21) then
                   _Ill1lIlI[_1lI1IIlI] = _1l11lIlI
                   return _1l11lIlI
                   end
                   return nil
                  end
                  
                  function _111IlIlI.getLogo()
                   local _1l11lIlI = _111IlIlI[_1II1lIlI(0x76)](_1IlIlIlI[_1II1lIlI(0x7b)], _1II1lIlI(0x7c))
                   if not _1l11lIlI and _1IlIlIlI[_1II1lIlI(0x7d)] ~= _1II1lIlI(0x21) then _1l11lIlI = _1IlIlIlI[_1II1lIlI(0x7d)] end
                   return _1l11lIlI
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x7e)] = _111IlIlI
                  
                  
                  local _lI11lIlI = _l1lIlIlI[_1II1lIlI(0x1f)]
                  
                  local _II11lIlI = {
                   Light = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0x7f), surface=_lI11lIlI_1II1lIlI(0x80), surfaceAlt=_lI11lIlI_1II1lIlI(0x81),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0x82), _I11lIIlI=_lI11lIlI_1II1lIlI(0x83), subtext=_lI11lIlI_1II1lIlI(0x84),
                   border=_lI11lIlI_1II1lIlI(0x85), toggleOn=_lI11lIlI_1II1lIlI(0x86), toggleOff=_lI11lIlI_1II1lIlI(0x87),
                   separator=_lI11lIlI_1II1lIlI(0x88), success=_lI11lIlI_1II1lIlI(0x86), error=_lI11lIlI_1II1lIlI(0x89),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0x8a), notifBg=_lI11lIlI_1II1lIlI(0x80),
                   },
                   Dark = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0x8b), surface=_lI11lIlI_1II1lIlI(0x8c), surfaceAlt=_lI11lIlI_1II1lIlI(0x8d),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0x8e), _I11lIIlI=_lI11lIlI_1II1lIlI(0x8f), subtext=_lI11lIlI_1II1lIlI(0x90),
                   border=_lI11lIlI_1II1lIlI(0x91), toggleOn=_lI11lIlI_1II1lIlI(0x92), toggleOff=_lI11lIlI_1II1lIlI(0x8d),
                   separator=_lI11lIlI_1II1lIlI(0x93), success=_lI11lIlI_1II1lIlI(0x92), error=_lI11lIlI_1II1lIlI(0x89),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0x94), notifBg=_lI11lIlI_1II1lIlI(0x95),
                   },
                   RazerWhite = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0x80), surface=_lI11lIlI_1II1lIlI(0x96), surfaceAlt=_lI11lIlI_1II1lIlI(0x8f),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0x1a), _I11lIIlI=_lI11lIlI_1II1lIlI(0x97), subtext=_lI11lIlI_1II1lIlI(0x98),
                   border=_lI11lIlI_1II1lIlI(0x99), toggleOn=_lI11lIlI_1II1lIlI(0x1a), toggleOff=_lI11lIlI_1II1lIlI(0x9a),
                   separator=_lI11lIlI_1II1lIlI(0x9b), success=_lI11lIlI_1II1lIlI(0x86), error=_lI11lIlI_1II1lIlI(0x89),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0x8a), notifBg=_lI11lIlI_1II1lIlI(0x80),
                   },
                   RazerBlack = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0x9c), surface=_lI11lIlI_1II1lIlI(0x9d), surfaceAlt=_lI11lIlI_1II1lIlI(0x9e),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0x1a), _I11lIIlI=_lI11lIlI_1II1lIlI(0x8f), subtext=_lI11lIlI_1II1lIlI(0x9f),
                   border=_lI11lIlI_1II1lIlI(0xa0), toggleOn=_lI11lIlI_1II1lIlI(0x1a), toggleOff=_lI11lIlI_1II1lIlI(0x9e),
                   separator=_lI11lIlI_1II1lIlI(0xa1), success=_lI11lIlI_1II1lIlI(0xa2), error=_lI11lIlI_1II1lIlI(0xa3),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xa4), notifBg=_lI11lIlI_1II1lIlI(0x9d),
                   },
                   Galaxy = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0x9c), surface=_lI11lIlI_1II1lIlI(0x9d), surfaceAlt=_lI11lIlI_1II1lIlI(0x9e),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0x1a), _I11lIIlI=_lI11lIlI_1II1lIlI(0x8f), subtext=_lI11lIlI_1II1lIlI(0x9f),
                   border=_lI11lIlI_1II1lIlI(0xa0), toggleOn=_lI11lIlI_1II1lIlI(0x1a), toggleOff=_lI11lIlI_1II1lIlI(0x9e),
                   separator=_lI11lIlI_1II1lIlI(0xa1), success=_lI11lIlI_1II1lIlI(0xa2), error=_lI11lIlI_1II1lIlI(0xa3),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xa4), notifBg=_lI11lIlI_1II1lIlI(0x9d),
                   bgImage = _1II1lIlI(0xa5),
                   titleColor = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   minimizeText = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   sliderColor = _lI11lIlI_1II1lIlI(0xa6),
                   toggleColor = _lI11lIlI_1II1lIlI(0xa6),
                   tabColor = _lI11lIlI_1II1lIlI(0xa6),
                   titleAccentColor = Color3[_1II1lIlI(0x22)]((((0x638 - 0x0) / 0x8)), (((0x3e8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   },
                   Water = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0xa7), surface=_lI11lIlI_1II1lIlI(0xa8), surfaceAlt=_lI11lIlI_1II1lIlI(0xa9),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0xaa), _I11lIIlI=_lI11lIlI_1II1lIlI(0xab), subtext=_lI11lIlI_1II1lIlI(0xac),
                   border=_lI11lIlI_1II1lIlI(0xad), toggleOn=_lI11lIlI_1II1lIlI(0xae), toggleOff=_lI11lIlI_1II1lIlI(0xa9),
                   separator=_lI11lIlI_1II1lIlI(0xaf), success=_lI11lIlI_1II1lIlI(0xa2), error=_lI11lIlI_1II1lIlI(0xa3),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xb0), notifBg=_lI11lIlI_1II1lIlI(0xa8),
                   bgImage = _1II1lIlI(0xb1),
                   titleColor = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   minimizeText = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   sliderColor = _lI11lIlI_1II1lIlI(0xb2),
                   toggleColor = _lI11lIlI_1II1lIlI(0xb2),
                   tabColor = _lI11lIlI_1II1lIlI(0xb2),
                   titleAccentColor = Color3[_1II1lIlI(0x22)]((((0x240 - 0x0) / 0x8)), (((0x650 - 0x0) / 0x8)), (((0x720 - 0x0) / 0x8))),
                   },
                   Green = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0xb3), surface=_lI11lIlI_1II1lIlI(0xb4), surfaceAlt=_lI11lIlI_1II1lIlI(0xb5),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0xb6), _I11lIIlI=_lI11lIlI_1II1lIlI(0xb7), subtext=_lI11lIlI_1II1lIlI(0xb8),
                   border=_lI11lIlI_1II1lIlI(0xb9), toggleOn=_lI11lIlI_1II1lIlI(0xb6), toggleOff=_lI11lIlI_1II1lIlI(0xb5),
                   separator=_lI11lIlI_1II1lIlI(0xba), success=_lI11lIlI_1II1lIlI(0xbb), error=_lI11lIlI_1II1lIlI(0xa3),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xbc), notifBg=_lI11lIlI_1II1lIlI(0xb4),
                   bgImage = _1II1lIlI(0xbd),
                   titleColor = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   minimizeText = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   sliderColor = _lI11lIlI_1II1lIlI(0xbe),
                   toggleColor = _lI11lIlI_1II1lIlI(0xbe),
                   tabColor = _lI11lIlI_1II1lIlI(0xbe),
                   titleAccentColor = Color3[_1II1lIlI(0x22)]((((0x348 - 0x0) / 0x8)), (((0x780 - 0x0) / 0x8)), (((0x570 - 0x0) / 0x8))),
                   },
                   MinimalisticBlack = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0xbf), surface=_lI11lIlI_1II1lIlI(0xc0), surfaceAlt=_lI11lIlI_1II1lIlI(0xc1),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0xc2), _I11lIIlI=_lI11lIlI_1II1lIlI(0xc3), subtext=_lI11lIlI_1II1lIlI(0xc4),
                   border=_lI11lIlI_1II1lIlI(0xc5), toggleOn=_lI11lIlI_1II1lIlI(0xc6), toggleOff=_lI11lIlI_1II1lIlI(0xc1),
                   separator=_lI11lIlI_1II1lIlI(0xc7), success=_lI11lIlI_1II1lIlI(0xc8), error=_lI11lIlI_1II1lIlI(0xc9),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xc2), notifBg=_lI11lIlI_1II1lIlI(0xc0),
                   bgImage = _1II1lIlI(0xca),
                   titleColor = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   minimizeText = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   sliderColor = _lI11lIlI_1II1lIlI(0x80),
                   toggleColor = _lI11lIlI_1II1lIlI(0xc6),
                   tabColor = _lI11lIlI_1II1lIlI(0x80),
                   titleAccentColor = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   },
                   MinimalisticWhite = {
                   _IlIIlIlI=_lI11lIlI_1II1lIlI(0xcb), surface=_lI11lIlI_1II1lIlI(0x80), surfaceAlt=_lI11lIlI_1II1lIlI(0xcc),
                   _lIll1IlI=_lI11lIlI_1II1lIlI(0xc7), _I11lIIlI=_lI11lIlI_1II1lIlI(0xc7), subtext=_lI11lIlI_1II1lIlI(0xcd),
                   border=_lI11lIlI_1II1lIlI(0xc2), toggleOn=_lI11lIlI_1II1lIlI(0xc7), toggleOff=_lI11lIlI_1II1lIlI(0xce),
                   separator=_lI11lIlI_1II1lIlI(0xcf), success=_lI11lIlI_1II1lIlI(0xd0), error=_lI11lIlI_1II1lIlI(0xd1),
                   _l1lIIIlI=_lI11lIlI_1II1lIlI(0xd2), notifBg=_lI11lIlI_1II1lIlI(0x80),
                   bgImage = _1II1lIlI(0xd3),
                   titleColor = Color3[_1II1lIlI(0x22)]((((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   minimizeText = Color3[_1II1lIlI(0x22)]((((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   sliderColor = _lI11lIlI_1II1lIlI(0xc7),
                   toggleColor = _lI11lIlI_1II1lIlI(0xc7),
                   tabColor = _lI11lIlI_1II1lIlI(0xc7),
                   titleAccentColor = Color3[_1II1lIlI(0x22)]((((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8))),
                   },
                  }
                  
                  local _1I11lIlI = {
                   _ll1l1IlI = _1IlIlIlI[_1II1lIlI(0xd4)],
                   registry = {}, bgMode = _1II1lIlI(0xd5),
                   Raw = _II11lIlI, _reapply = nil,
                  }
                  
                  function _1I11lIlI:Register(_I1lIlIlI, prop, _llll1IlI)
                   if not _I1lIlIlI then return end
                   table[_1II1lIlI(0x4f)](self[_1II1lIlI(0xd6)], { _I1lIlIlI = _I1lIlIlI, prop = prop, _llll1IlI = _llll1IlI })
                   local _IlIIlIlI = _II11lIlI[self[_1II1lIlI(0xd7)]][_llll1IlI]
                   if _IlIIlIlI then _I1lIlIlI[prop] = _IlIIlIlI end
                  end
                  
                  function _1I11lIlI:SetReapplyCallback(_1IllIIlI) self[_1II1lIlI(0xd8)] = _1IllIIlI end
                  
                  function _1I11lIlI:Apply(_1lI1IIlI)
                   if not _II11lIlI[_1lI1IIlI] then return end
                   self[_1II1lIlI(0xd7)] = _1lI1IIlI
                   local _l111lIlI = {}
                   for _l1IIlIlI, _I1I1lIlI in ipairs(self[_1II1lIlI(0xd6)]) do
                   if _I1I1lIlI[_1II1lIlI(0xd9)] and _I1I1lIlI[_1II1lIlI(0xd9)][_1II1lIlI(0x30)] then
                   local _I111lIlI = _II11lIlI[_1lI1IIlI][_I1I1lIlI[_1II1lIlI(0xda)]]
                   if _I111lIlI then
                   if typeof(_I1I1lIlI[_1II1lIlI(0xd9)][_I1I1lIlI[_1II1lIlI(0xdb)]]) == _1II1lIlI(0xdc) then
                   _II1IlIlI:Create(_I1I1lIlI[_1II1lIlI(0xd9)], TweenInfo[_1II1lIlI(0x2f)](0.25), { [_I1I1lIlI[_1II1lIlI(0xdb)]] = _I111lIlI }):Play()
                   else
                   _I1I1lIlI[_1II1lIlI(0xd9)][_I1I1lIlI[_1II1lIlI(0xdb)]] = _I111lIlI
                   end
                   end
                   table[_1II1lIlI(0x4f)](_l111lIlI, _I1I1lIlI)
                   end
                   end
                   self[_1II1lIlI(0xd6)] = _l111lIlI
                   if self[_1II1lIlI(0xd8)] then task[_1II1lIlI(0xdd)](self[_1II1lIlI(0xd8)]) end
                  end
                  
                  function _1I11lIlI:Get(_llIIlIlI) return _II11lIlI[self[_1II1lIlI(0xd7)]][_llIIlIlI] end
                  
                  _lI1IlIlI[_1II1lIlI(0xde)] = _1I11lIlI
                  
                  local _1111lIlI = _lI1IlIlI[_1II1lIlI(0xe)]
                  
                  
                  
                  
                  
                  do
                   local _llllIIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_1IlIlIlI[_1II1lIlI(0xdf)]) or Color3[_1II1lIlI(0x22)]((((0x500 - 0x0) / 0x8)), (((0x100 - 0x0) / 0x8)), (((0x780 - 0x0) / 0x8)))
                   local _IlllIIlI = _II11lIlI[_1IlIlIlI[_1II1lIlI(0xd4)]]
                   if _IlllIIlI then
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] = _IlllIIlI[_1II1lIlI(0xe2)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] = _IlllIIlI[_1II1lIlI(0xe4)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] = _IlllIIlI[_1II1lIlI(0xe6)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] = _IlllIIlI[_1II1lIlI(0xe8)] or _llllIIlI
                   else
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] = _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] = _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] = _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] = _llllIIlI
                   end
                  end
                  
                  local _1lllIIlI = { registered = {}, capturing = nil }
                  function _1lllIIlI:Register(_llll1IlI, _1IllIIlI) self[_1II1lIlI(0xe9)][_llll1IlI] = _1IllIIlI end
                  function _1lllIIlI:Unregister(_llll1IlI) self[_1II1lIlI(0xe9)][_llll1IlI] = nil end
                  function _1lllIIlI:BeginCapture(_1IllIIlI) self[_1II1lIlI(0xea)] = _1IllIIlI end
                  
                  _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0xeb)]:Connect(function(_lIllIIlI, _IIllIIlI)
                   if _IIllIIlI then return end
                   if _1lllIIlI[_1II1lIlI(0xea)] then
                   local _1IllIIlI = _1lllIIlI[_1II1lIlI(0xea)]
                   _1lllIIlI[_1II1lIlI(0xea)] = nil
                   if _lIllIIlI[_1II1lIlI(0x13)] ~= Enum[_1II1lIlI(0x13)][_1II1lIlI(0xec)] then _1IllIIlI(_lIllIIlI[_1II1lIlI(0x13)]) end
                   return
                   end
                   local _1IllIIlI = _1lllIIlI[_1II1lIlI(0xe9)][_lIllIIlI[_1II1lIlI(0x13)]]
                   if _1IllIIlI then _1IllIIlI() end
                  end))
                  
                  _lI1IlIlI[_1II1lIlI(0xed)] = _1lllIIlI
                  
                  
                  local _l1llIIlI = {}
                  local _I1llIIlI, _11llIIlI
                  
                  local function _llIlIIlI()
                   if _I1llIIlI then return end
                   if not _lI1IlIlI[_1II1lIlI(0xee)] or not _lI1IlIlI[_1II1lIlI(0xee)][_1II1lIlI(0xef)] then return end
                   _I1llIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0xf1), Size = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19),(0x19 - 0x19)),
                   AutomaticSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0xf3)],
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   BackgroundTransparency = (0x2a / 0x2a), Visible = (0x0 == 0x1), ZIndex = (((0x1c20 - 0x0) / 0x8)),
                   Parent = _lI1IlIlI[_1II1lIlI(0xee)][_1II1lIlI(0xef)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_I1llIIlI, (((0x30 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_I1llIIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), (0x2a / 0x2a))
                   _1I11lIlI:Register(_I1llIIlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf7), {
                   PaddingLeft = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x40 - 0x0) / 0x8))), PaddingRight = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x40 - 0x0) / 0x8))),
                   PaddingTop = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x28 - 0x0) / 0x8))), PaddingBottom = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x28 - 0x0) / 0x8))), Parent = _I1llIIlI })
                   _11llIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Size = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19),(0x19 - 0x19)), AutomaticSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0xf3)],
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _1II1lIlI(0x21), TextSize = (((0x60 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextTransparency = (0x2a / 0x2a),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _I1llIIlI })
                   _1I11lIlI:Register(_11llIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                  end
                  
                  function _l1llIIlI.attach(_I1lIlIlI, _I11lIIlI)
                   if not _I11lIIlI or _I11lIIlI == _1II1lIlI(0x21) then return end
                   _llIlIIlI()
                   _I1lIlIlI[_1II1lIlI(0x47)]:Connect(function()
                   if not _I1llIIlI then return end
                   _11llIIlI[_1II1lIlI(0x100)] = _I11lIIlI
                   _I1llIIlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   local _IlIlIIlI, _1lIlIIlI = _I1lIlIlI[_1II1lIlI(0x102)], _I1lIlIlI[_1II1lIlI(0x103)]
                   local _lIIlIIlI = _lI1IlIlI[_1II1lIlI(0xee)][_1II1lIlI(0xef)][_1II1lIlI(0x102)]
                   _I1llIIlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)](math[_1II1lIlI(0x43)]((((0x20 - 0x0) / 0x8)), _IlIlIIlI[_1II1lIlI(0x57)] - _lIIlIIlI[_1II1lIlI(0x57)]), _IlIlIIlI[_1II1lIlI(0x5c)] - _lIIlIIlI[_1II1lIlI(0x5c)] + _1lIlIIlI[_1II1lIlI(0x5c)] + (((0x30 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x36)](_I1llIIlI, 0.15, { BackgroundTransparency = (0x19 - 0x19) })
                   _l1lIlIlI[_1II1lIlI(0x36)](_11llIIlI, 0.15, { TextTransparency = (0x19 - 0x19) })
                   end)
                   _I1lIlIlI[_1II1lIlI(0x48)]:Connect(function()
                   if not _I1llIIlI then return end
                   _l1lIlIlI[_1II1lIlI(0x36)](_I1llIIlI, 0.12, { BackgroundTransparency = (0x2a / 0x2a) })
                   _l1lIlIlI[_1II1lIlI(0x36)](_11llIIlI, 0.12, { TextTransparency = (0x2a / 0x2a) })
                   task[_1II1lIlI(0x104)](0.13, function()
                   if _I1llIIlI and _I1llIIlI[_1II1lIlI(0x105)] >= 0.99 then
                   _I1llIIlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   end
                   end)
                   end)
                  end
                  
                  function _l1llIIlI.hide()
                   if _I1llIIlI then
                   _I1llIIlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _I1llIIlI[_1II1lIlI(0x105)] = (0x2a / 0x2a)
                   _11llIIlI[_1II1lIlI(0x107)] = (0x2a / 0x2a)
                   end
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0xf1)] = _l1llIIlI
                  
                  local _IIIlIIlI
                  do
                   local _llI1lIlI, _1IIlIIlI = pcall(function() return gethui and gethui() end)
                   if _llI1lIlI and _1IIlIIlI then _IIIlIIlI = _1IIlIIlI end
                   if not _IIIlIIlI then
                   local _Il11lIlI = pcall(function()
                   local _l1IlIIlI = Instance[_1II1lIlI(0x2f)](_1II1lIlI(0x108)); _l1IlIIlI[_1II1lIlI(0x30)] = _1llIlIlI; _l1IlIIlI:Destroy(); return (0x1 == 0x1)
                   end)
                   if _Il11lIlI then _IIIlIIlI = _1llIlIlI end
                   end
                   if not _IIIlIIlI then _IIIlIIlI = _lIlIlIlI:WaitForChild(_1II1lIlI(0x109)) end
                  end
                  
                  local _I1IlIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x10a), {
                   Name = _1II1lIlI(0x10b), ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_1II1lIlI(0x10c)][_1II1lIlI(0x10d)],
                   IgnoreGuiInset = (0x1 == 0x1), DisplayOrder = (((0x1f48 - 0x0) / 0x8)), Parent = _IIIlIIlI,
                  })
                  _lI1IlIlI[_1II1lIlI(0x10e)] = _I1IlIIlI
                  
                  local _11IlIIlI = {
                   LeftTopCornerNotification = { _1l11lIlI = Vector2[_1II1lIlI(0x2f)]((0x19 - 0x19),(0x19 - 0x19)), _11I1lIlI = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x80 - 0x0) / 0x8)),(0x19 - 0x19),(((0x80 - 0x0) / 0x8))),
                   _lI11lIlI = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0xfd)], _IlIIlIlI = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x111)], _I11IlIlI = _1II1lIlI(0x112) },
                   RightTopCornerNotification = { _1l11lIlI = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19)), _11I1lIlI = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-(((0x80 - 0x0) / 0x8)),(0x19 - 0x19),(((0x80 - 0x0) / 0x8))),
                   _lI11lIlI = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x113)], _IlIIlIlI = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x111)], _I11IlIlI = _1II1lIlI(0x114) },
                   LeftBottomCornerNotification = { _1l11lIlI = Vector2[_1II1lIlI(0x2f)]((0x19 - 0x19),(0x2a / 0x2a)), _11I1lIlI = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19),(((0x80 - 0x0) / 0x8)),(0x2a / 0x2a),-(((0x80 - 0x0) / 0x8))),
                   _lI11lIlI = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0xfd)], _IlIIlIlI = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x115)], _I11IlIlI = _1II1lIlI(0x112) },
                   RightBottomCornerNotification = { _1l11lIlI = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x2a / 0x2a)), _11I1lIlI = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-(((0x80 - 0x0) / 0x8)),(0x2a / 0x2a),-(((0x80 - 0x0) / 0x8))),
                   _lI11lIlI = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x113)], _IlIIlIlI = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x115)], _I11IlIlI = _1II1lIlI(0x114) },
                  }
                  
                  local _ll1lIIlI = {}
                  local function _Il1lIIlI(_IlIlIIlI)
                   if _ll1lIIlI[_IlIlIIlI] then return _ll1lIIlI[_IlIlIIlI] end
                   local _1l1lIIlI = _11IlIIlI[_IlIlIIlI] or _11IlIIlI[_1IlIlIlI[_1II1lIlI(0x116)]]
                   local _lI1lIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   AnchorPoint = _1l1lIIlI[_1II1lIlI(0x117)], Position = _1l1lIIlI[_1II1lIlI(0x118)],
                   Size = UDim2[_1II1lIlI(0x17)]((((0xa00 - 0x0) / 0x8)), (0x19 - 0x19)), AutomaticSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0x5c)],
                   BackgroundTransparency = (0x2a / 0x2a), Parent = _I1IlIIlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x11b)],
                   HorizontalAlignment = _1l1lIIlI[_1II1lIlI(0x11c)], VerticalAlignment = _1l1lIIlI[_1II1lIlI(0x11d)],
                   SortOrder = Enum[_1II1lIlI(0x11e)][_1II1lIlI(0x11f)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))), Parent = _lI1lIIlI })
                   _ll1lIIlI[_IlIlIIlI] = { frame = _lI1lIIlI, _1l1lIIlI = _1l1lIIlI }
                   return _ll1lIIlI[_IlIlIIlI]
                  end
                  
                  local _II1lIIlI = (0x19 - 0x19)
                  
                  function _lI1IlIlI.Notify(_lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _1I1lIIlI = _lII1IIlI[_1II1lIlI(0x121)] or _1II1lIlI(0x122)
                   local _l11lIIlI = _lII1IIlI[_1II1lIlI(0xe7)] or _1IlIlIlI[_1II1lIlI(0x123)]
                   local _I11lIIlI = _lII1IIlI[_1II1lIlI(0xfb)] or _1II1lIlI(0x21)
                   local _111lIIlI = _lII1IIlI[_1II1lIlI(0x124)]
                   if _111lIIlI == nil then _111lIIlI = (((0x28 - 0x0) / 0x8)) end
                  
                   local _lllIIIlI = _lI1IlIlI[_1II1lIlI(0x7e)][_1II1lIlI(0x7a)]()
                   if not _lllIIIlI and (_1I1lIIlI == _1II1lIlI(0x125) or _1I1lIIlI == _1II1lIlI(0x122)) then _1I1lIIlI = _1II1lIlI(0x126) end
                  
                   _II1lIIlI = _II1lIIlI + (0x2a / 0x2a)
                   local _IllIIIlI = _Il1lIIlI(_lII1IIlI[_1II1lIlI(0x127)] or _1IlIlIlI[_1II1lIlI(0x116)])
                   local _1llIIIlI = _IllIIIlI[_1II1lIlI(0x128)][_1II1lIlI(0x129)]
                  
                   local _lIlIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)), BackgroundTransparency = (0x2a / 0x2a),
                   ClipsDescendants = (0x1 == 0x1), LayoutOrder = _II1lIIlI, Parent = _IllIIIlI[_1II1lIlI(0x12a)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_lIlIIIlI, _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8)))
                   local _IIlIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(((0x1f0 - 0x0) / 0x8))),
                   Position = _1llIIIlI == _1II1lIlI(0x114) and UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)) or UDim2[_1II1lIlI(0x2f)](-(0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x12b)), BorderSizePixel = (0x19 - 0x19),
                   ClipsDescendants = (0x1 == 0x1), Parent = _lIlIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_IIlIIIlI, _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_IIlIIIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.4)
                   _1I11lIlI:Register(_IIlIIIlI, _1II1lIlI(0xf6), _1II1lIlI(0x12b))
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x12c)], { _IIlIIIlI = _IIlIIIlI, _lIlIIIlI = _lIlIIIlI })
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_lIlIIIlI, 0.36, { Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(((0x1f0 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_IIlIIIlI, 0.44, { Position = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   local _1IlIIIlI = (((0x60 - 0x0) / 0x8))
                   if (_1I1lIIlI == _1II1lIlI(0x125) or _1I1lIIlI == _1II1lIlI(0x122)) and _lllIIIlI then
                   local _l1lIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x12d), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x60 - 0x0) / 0x8)), (((0x90 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x17)]((((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Image = _lllIIIlI,
                   ImageColor3 = _1I11lIlI:Get(_1II1lIlI(0x12e)), Parent = _IIlIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_l1lIIIlI, (((0x30 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_l1lIIIlI, _1II1lIlI(0x12f), _1II1lIlI(0x12e))
                   _1IlIIIlI = (((0x180 - 0x0) / 0x8))
                   end
                  
                   if _1I1lIIlI == _1II1lIlI(0x126) or _1I1lIIlI == _1II1lIlI(0x122) then
                   local _I1lIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)](_1IlIIIlI,(((0x50 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-_1IlIIIlI-(((0x140 - 0x0) / 0x8)),(0x19 - 0x19),(((0x80 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _l11lIIlI, TextSize = (((0x68 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _IIlIIIlI })
                   _1I11lIlI:Register(_I1lIIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   local _11lIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)](_1IlIIIlI,(((0xe0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-_1IlIIIlI-(((0x140 - 0x0) / 0x8)),(0x19 - 0x19),(((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _I11lIIlI, TextSize = (((0x60 - 0x0) / 0x8)), TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   TextYAlignment = Enum[_1II1lIlI(0x132)][_1II1lIlI(0x111)], Parent = _IIlIIIlI })
                   _1I11lIlI:Register(_11lIIIlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   else
                   local _11lIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)](_1IlIIIlI,(((0x30 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-_1IlIIIlI-(((0x140 - 0x0) / 0x8)),(0x2a / 0x2a),-(((0x60 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x133)],
                   Text = _I11lIIlI, TextSize = (((0x68 - 0x0) / 0x8)), TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   TextYAlignment = Enum[_1II1lIlI(0x132)][_1II1lIlI(0x134)], Parent = _IIlIIIlI })
                   _1I11lIlI:Register(_11lIIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   end
                  
                   local _llIIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19)), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),-(((0x30 - 0x0) / 0x8)),(0x19 - 0x19),(((0x30 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0xa0 - 0x0) / 0x8)),(((0xa0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)),
                   BorderSizePixel = (0x19 - 0x19), AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)], Text = _1II1lIlI(0x136), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _IIlIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_llIIIIlI, (((0x30 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_llIIIIlI, _1II1lIlI(0xf6), _1II1lIlI(0x135))
                   _1I11lIlI:Register(_llIIIIlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _l1lIlIlI[_1II1lIlI(0x45)](_llIIIIlI, 1.15)
                  
                   local _IlIIIIlI = (0x0 == 0x1)
                   local function _1lIIIIlI()
                   if _IlIIIIlI then return end
                   _IlIIIIlI = (0x1 == 0x1)
                   _l1lIlIlI[_1II1lIlI(0x36)](_IIlIIIlI, 0.32, {
                   Position = _1llIIIlI == _1II1lIlI(0x114) and UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)) or UDim2[_1II1lIlI(0x2f)](-(0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)),
                   }, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   local _lIIIlIlI = _l1lIlIlI[_1II1lIlI(0x36)](_lIlIIIlI, 0.32, { Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a),(0x19 - 0x19),(0x19 - 0x19),(0x19 - 0x19)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   _lIIIlIlI[_1II1lIlI(0x138)]:Connect(function() _lIlIIIlI:Destroy() end)
                   end
                   _llIIIIlI[_1II1lIlI(0x139)]:Connect(_1lIIIIlI)
                   if _111lIIlI > (0x19 - 0x19) then task[_1II1lIlI(0x104)](_111lIIlI, _1lIIIIlI) end
                   return { _1lIIIIlI = _1lIIIIlI }
                  end
                  
                  
                  local _lIIIIIlI = _I1IlIIlI[_1II1lIlI(0x30)]
                  
                  local _IIIIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x10a), {
                   Name = _1II1lIlI(0x13a), ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_1II1lIlI(0x10c)][_1II1lIlI(0x10d)],
                   IgnoreGuiInset = (0x1 == 0x1), DisplayOrder = (((0x1f50 - 0x0) / 0x8)), Parent = _lIIIIIlI })
                  _lI1IlIlI[_1II1lIlI(0x13b)] = _IIIIIIlI
                  
                  local _1IIIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x13c), AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x80 - 0x0) / 0x8)), (0x19 - 0x19), (((0x80 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x5a0 - 0x0) / 0x8)), (((0x3b0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)),
                   BorderSizePixel = (0x19 - 0x19), Visible = (0x0 == 0x1), Parent = _IIIIIIlI })
                  _l1lIlIlI[_1II1lIlI(0x3b)](_1IIIIIlI, (((0x40 - 0x0) / 0x8)))
                  _l1lIlIlI[_1II1lIlI(0x3e)](_1IIIIIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.4)
                  _1I11lIlI:Register(_1IIIIIlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                  
                  local _l1IIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)), (((0x30 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1II1lIlI(0x13d), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _1IIIIIlI })
                  _1I11lIlI:Register(_l1IIIIlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                  local _I1IIIIlI = {}
                  for _11IIlIlI, _I11IlIlI in ipairs({
                   { _llll1IlI = _1II1lIlI(0x13e), _l1lllIlI = _1II1lIlI(0x13f), init = _1II1lIlI(0x140) },
                   { _llll1IlI = _1II1lIlI(0x141), _l1lllIlI = _1II1lIlI(0x142), init = _1II1lIlI(0x143) },
                   { _llll1IlI = _1II1lIlI(0x144), _l1lllIlI = _1II1lIlI(0x6), init = _1II1lIlI(0x145) },
                   { _llll1IlI = _1II1lIlI(0x146), _l1lllIlI = _1II1lIlI(0x147), init = _1II1lIlI(0x148) },
                   { _llll1IlI = _1II1lIlI(0x149), _l1lllIlI = _1II1lIlI(0x14a), init = _1II1lIlI(0x14b) },
                  }) do
                   local _11IIIIlI = (((0xb0 - 0x0) / 0x8)) + (_11IIlIlI - (0x2a / 0x2a)) * (((0x90 - 0x0) / 0x8))
                   local _ll1IIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)), _11IIIIlI), Size = UDim2[_1II1lIlI(0x2f)](0.5, -(((0x50 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _I11IlIlI[_1II1lIlI(0x14c)], TextSize = (((0x58 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _1IIIIIlI })
                   _1I11lIlI:Register(_ll1IIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   local _Il1IIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x2f)](0.5, (0x19 - 0x19), (0x19 - 0x19), _11IIIIlI), Size = UDim2[_1II1lIlI(0x2f)](0.5, -(((0x50 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _I11IlIlI[_1II1lIlI(0x14d)], TextSize = (((0x58 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x14e)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0x113)], Parent = _1IIIIIlI })
                   _1I11lIlI:Register(_Il1IIIlI, _1II1lIlI(0xfe), _1II1lIlI(0x14e))
                   _I1IIIIlI[_I11IlIlI[_1II1lIlI(0xda)]] = _Il1IIIlI
                  end
                  
                  _1IIIIIlI[_1II1lIlI(0xeb)]:Connect(function(_lIllIIlI)
                   if _lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   or _lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _lI1IlIlI[_1II1lIlI(0x1e)] = {
                   panel = _1IIIIIlI,
                   startX = _lIllIIlI[_1II1lIlI(0x56)][_1II1lIlI(0x57)],
                   startY = _lIllIIlI[_1II1lIlI(0x56)][_1II1lIlI(0x5c)],
                   _I1IllIlI = _1IIIIIlI[_1II1lIlI(0x56)],
                   }
                   end
                  end)
                  
                  local _1l1IIIlI = os[_1II1lIlI(0x14f)]()
                  
                  local function _lI1IIIlI()
                   local _II1IIIlI = _1111lIlI[_1II1lIlI(0x150)]
                   local _1I1IIIlI = os[_1II1lIlI(0x14f)]()
                   while _1111lIlI[_1II1lIlI(0x151)] do
                   task[_1II1lIlI(0x152)](0.5)
                   local _l11IIIlI = _1111lIlI[_1II1lIlI(0x150)]
                   local _I11IIIlI = os[_1II1lIlI(0x14f)]()
                   local _111IIIlI = _I11IIIlI - _1I1IIIlI
                   if _111IIIlI >= 0.9 then
                   local _lll1IIlI = math[_1II1lIlI(0x26)]((_l11IIIlI - _II1IIIlI) / _111IIIlI + 0.5)
                   _II1IIIlI = _l11IIIlI
                   _1I1IIIlI = _I11IIIlI
                  
                   local _Ill1IIlI = (0x19 - 0x19)
                   pcall(function()
                   _Ill1IIlI = math[_1II1lIlI(0x26)](_lllIlIlI[_1II1lIlI(0x153)][_1II1lIlI(0x154)][_1II1lIlI(0x155)]:GetValue())
                   end)
                   local _1ll1IIlI = (0x19 - 0x19)
                   pcall(function() _1ll1IIlI = math[_1II1lIlI(0x26)](_lllIlIlI:GetTotalMemoryUsageMb()) end)
                  
                   if _I1IIIIlI[_1II1lIlI(0x13e)] then _I1IIIIlI[_1II1lIlI(0x13e)][_1II1lIlI(0x100)] = tostring(_lll1IIlI) end
                   if _I1IIIIlI[_1II1lIlI(0x141)] then _I1IIIIlI[_1II1lIlI(0x141)][_1II1lIlI(0x100)] = tostring(_Ill1IIlI) .. _1II1lIlI(0x156) end
                   if _I1IIIIlI[_1II1lIlI(0x144)] then _I1IIIIlI[_1II1lIlI(0x144)][_1II1lIlI(0x100)] = tostring(#_I11IlIlI:GetPlayers()) end
                   if _I1IIIIlI[_1II1lIlI(0x146)] then _I1IIIIlI[_1II1lIlI(0x146)][_1II1lIlI(0x100)] = tostring(_1ll1IIlI) .. _1II1lIlI(0x157) end
                   if _I1IIIIlI[_1II1lIlI(0x149)] then
                   local _lIl1IIlI = math[_1II1lIlI(0x26)](_I11IIIlI - _1l1IIIlI)
                   local _IIl1IIlI = math[_1II1lIlI(0x26)](_lIl1IIlI / (((0x7080 - 0x0) / 0x8))); _lIl1IIlI = _lIl1IIlI % (((0x7080 - 0x0) / 0x8))
                   local _1Il1IIlI = math[_1II1lIlI(0x26)](_lIl1IIlI / (((0x1e0 - 0x0) / 0x8))); _lIl1IIlI = _lIl1IIlI % (((0x1e0 - 0x0) / 0x8))
                   _I1IIIIlI[_1II1lIlI(0x149)][_1II1lIlI(0x100)] = string[_1II1lIlI(0x24)](_1II1lIlI(0x158), _IIl1IIlI, _1Il1IIlI, _lIl1IIlI)
                   end
                   end
                   end
                  end
                  
                  function _lI1IlIlI.SetStats(_I111IIlI)
                   _1111lIlI[_1II1lIlI(0x151)] = _I111IIlI
                   _1IIIIIlI[_1II1lIlI(0x101)] = _I111IIlI
                   if _I111IIlI then task[_1II1lIlI(0x15a)](_lI1IIIlI) end
                  end
                  
                  local _l1l1IIlI = {}
                  
                  local function _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _III1IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = tostring(_1lI1IIlI) .. _1II1lIlI(0x15b),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_llI1IIlI, (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x15c)]),
                   BackgroundTransparency = (0x2a / 0x2a), LayoutOrder = _IlI1IIlI, Parent = _11l1IIlI })
                   local _1II1IIlI = (((0x20 - 0x0) / 0x8))
                   local _l1I1IIlI = -(((0x20 - 0x0) / 0x8))
                   local _ll1IIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)](_1II1IIlI, (((0x48 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1II1IIlI + _l1I1IIlI - (((0x20 - 0x0) / 0x8)), (0x19 - 0x19), (((0x90 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x133)],
                   Text = tostring(_1lI1IIlI), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   TextYAlignment = Enum[_1II1lIlI(0x132)][_1II1lIlI(0x134)],
                   TextTruncate = Enum[_1II1lIlI(0x15d)][_1II1lIlI(0x15e)], Parent = _III1IIlI })
                   _1I11lIlI:Register(_ll1IIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   return _III1IIlI, _ll1IIIlI, _l1I1IIlI, _1II1IIlI
                  end
                  
                  function _l1l1IIlI.toggle(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _I1I1IIlI = _lII1IIlI[_1II1lIlI(0x15f)] or (0x0 == 0x1)
                   local _1IllIIlI = _lII1IIlI[_1II1lIlI(0x160)]
                   local _III1IIlI = _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   local _11I1IIlI = _I1I1IIlI
                   local _ll11IIlI
                  
                   local _Il11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x360 - 0x0) / 0x8)), 0.5, -(((0x60 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x17)]((((0x200 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _1II1lIlI(0x161), TextSize = (((0x60 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_Il11IIlI, (((0x30 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_Il11IIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_Il11IIlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_Il11IIlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _l1lIlIlI[_1II1lIlI(0x45)](_Il11IIlI, 1.06)
                  
                   local _1l11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x130 - 0x0) / 0x8)), 0.5, -(((0x58 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x17)]((((0x130 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x162)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Text = _1II1lIlI(0x21), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1l11IIlI, (((0x30 - 0x0) / 0x8)))
                   local _lI11IIlI = _l1lIlIlI[_1II1lIlI(0x3e)](_1l11IIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), (0x2a / 0x2a))
                  
                   local _II11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x18 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x17)]((((0x80 - 0x0) / 0x8)), (((0x80 - 0x0) / 0x8))),
                   BackgroundColor3 = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   BorderSizePixel = (0x19 - 0x19), Parent = _1l11IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_II11IIlI, (((0x40 - 0x0) / 0x8)))
                  
                   local function _1I11IIlI() return _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] or _1I11lIlI:Get(_1II1lIlI(0x163)) end
                  
                   local function _l111IIlI(_I111IIlI, _1111IIlI)
                   _11I1IIlI = _I111IIlI
                   _l1lIlIlI[_1II1lIlI(0x36)](_1l11IIlI, 0.18, { BackgroundColor3 = _I111IIlI and _1I11IIlI() or _1I11lIlI:Get(_1II1lIlI(0x162)) })
                   if _1111IIlI and _lI11IIlI then
                   _lI11IIlI[_1II1lIlI(0x164)] = _I111IIlI and _1I11IIlI() or _1I11lIlI:Get(_1II1lIlI(0x131))
                   _lI11IIlI[_1II1lIlI(0x165)] = (0x19 - 0x19)
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.45, { Transparency = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end
                   _l1lIlIlI[_1II1lIlI(0x36)](_II11IIlI, 0.28, {
                   Position = _I111IIlI and UDim2[_1II1lIlI(0x17)]((((0x98 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))) or UDim2[_1II1lIlI(0x17)]((((0x18 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   if _1111IIlI and _1IllIIlI then pcall(_1IllIIlI, _I111IIlI) end
                   if _1111IIlI then _1l1IlIlI[_1II1lIlI(0x166)]() end
                   end
                  
                   _1l11IIlI[_1II1lIlI(0x139)]:Connect(function() _l111IIlI(not _11I1IIlI, (0x1 == 0x1)) end)
                   _Il11IIlI[_1II1lIlI(0x139)]:Connect(function()
                   _Il11IIlI[_1II1lIlI(0x100)] = _1II1lIlI(0x167)
                   _1lllIIlI:BeginCapture(function(_llll1IlI)
                   if _ll11IIlI then _1lllIIlI:Unregister(_ll11IIlI) end
                   _ll11IIlI = _llll1IlI
                   _Il11IIlI[_1II1lIlI(0x100)] = _llll1IlI[_1II1lIlI(0x168)]
                   _1lllIIlI:Register(_llll1IlI, function() _l111IIlI(not _11I1IIlI, (0x1 == 0x1)) end)
                   end)
                   end)
                  
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x169)], {
                   _1l11IIlI = _1l11IIlI,
                   _1lI1IIlI = _1lI1IIlI,
                   refresh = function()
                   if _11I1IIlI then _l1lIlIlI[_1II1lIlI(0x36)](_1l11IIlI, 0.2, { BackgroundColor3 = _1I11IIlI() }) end
                   end,
                   get = function() return _11I1IIlI end,
                   set = function(_IlIIlIlI) _l111IIlI(_IlIIlIlI, (0x1 == 0x1)) end })
                  
                   _l111IIlI(_I1I1IIlI, (0x0 == 0x1))
                   return {
                   _III1IIlI = _III1IIlI,
                   set = function(_IlIIlIlI) _l111IIlI(_IlIIlIlI, (0x1 == 0x1)) end,
                   get = function() return _11I1IIlI end }
                  end
                  
                  function _l1l1IIlI.slider(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _Illl1IlI = _lII1IIlI[_1II1lIlI(0x44)] or (0x19 - 0x19)
                   local _1lll1IlI = _lII1IIlI[_1II1lIlI(0x43)] or (((0x320 - 0x0) / 0x8))
                   local _I1I1IIlI = _lII1IIlI[_1II1lIlI(0x15f)] or (((0x190 - 0x0) / 0x8))
                   local _1IllIIlI = _lII1IIlI[_1II1lIlI(0x160)]
                  
                   local _III1IIlI, _ll1IIIlI, _l1I1IIlI, _1II1IIlI = _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _III1IIlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_llI1IIlI, (0x19 - 0x19), (((0x180 - 0x0) / 0x8)))
                   _ll1IIIlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)](_1II1IIlI, (((0x20 - 0x0) / 0x8)))
                   _ll1IIIlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1II1IIlI - (((0x230 - 0x0) / 0x8)), (0x19 - 0x19), (((0x90 - 0x0) / 0x8)))
                  
                   local _lIll1IlI = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] or _1I11lIlI:Get(_1II1lIlI(0x14e))
                  
                   local _IIll1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19)), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), _l1I1IIlI, (0x19 - 0x19), (((0x20 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x200 - 0x0) / 0x8)), (((0x90 - 0x0) / 0x8))), BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x133)], Text = tostring(_I1I1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _lIll1IlI, TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0x113)], Parent = _III1IIlI })
                   _1I11lIlI:Register(_IIll1IlI, _1II1lIlI(0xfe), _1II1lIlI(0x14e))
                  
                   local _1Ill1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x20 - 0x0) / 0x8)), (((0xf0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x40 - 0x0) / 0x8)), (0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)),
                   BorderSizePixel = (0x19 - 0x19), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1Ill1IlI, (((0x18 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_1Ill1IlI, _1II1lIlI(0xf6), _1II1lIlI(0x135))
                  
                   local _l1ll1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Size = UDim2[_1II1lIlI(0x16b)]((_I1I1IIlI - _Illl1IlI) / (_1lll1IlI - _Illl1IlI), (0x2a / 0x2a)),
                   BackgroundColor3 = _lIll1IlI, BorderSizePixel = (0x19 - 0x19), Parent = _1Ill1IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_l1ll1IlI, (((0x18 - 0x0) / 0x8)))
                  
                   local _II11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)](0.5, 0.5),
                   Position = UDim2[_1II1lIlI(0x2f)]((_I1I1IIlI - _Illl1IlI) / (_1lll1IlI - _Illl1IlI), (0x19 - 0x19), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x70 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))),
                   BackgroundColor3 = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   BorderSizePixel = (0x19 - 0x19), Parent = _1Ill1IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_II11IIlI, (((0x38 - 0x0) / 0x8)))
                   local _I1ll1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x46), { Parent = _II11IIlI, Scale = (0x2a / 0x2a) })
                  
                   local _11ll1IlI = _I1I1IIlI
                  
                   local function _llIl1IlI(_llIIIIlI)
                   local _IlIl1IlI = _l1lIlIlI[_1II1lIlI(0x42)]((_llIIIIlI - _1Ill1IlI[_1II1lIlI(0x102)][_1II1lIlI(0x57)]) / math[_1II1lIlI(0x43)]((0x2a / 0x2a), _1Ill1IlI[_1II1lIlI(0x103)][_1II1lIlI(0x57)]), (0x19 - 0x19), (0x2a / 0x2a))
                   local _IlIIlIlI = math[_1II1lIlI(0x26)](_Illl1IlI + (_1lll1IlI - _Illl1IlI) * _IlIl1IlI + 0.5)
                   return _IlIIlIlI, _IlIl1IlI
                   end
                  
                   local function _1lIl1IlI(_IlIIlIlI, _IlIl1IlI)
                   _IIll1IlI[_1II1lIlI(0x100)] = tostring(_IlIIlIlI)
                   _l1ll1IlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x16b)](_IlIl1IlI, (0x2a / 0x2a))
                   _II11IIlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x2f)](_IlIl1IlI, (0x19 - 0x19), 0.5, (0x19 - 0x19))
                   end
                  
                   local function _lIIl1IlI(_IlIIlIlI)
                   if type(_IlIIlIlI) ~= _1II1lIlI(0x16c) then return end
                   if _IlIIlIlI < _Illl1IlI then _IlIIlIlI = _Illl1IlI end
                   if _IlIIlIlI > _1lll1IlI then _IlIIlIlI = _1lll1IlI end
                   local _IlIl1IlI = (_1lll1IlI > _Illl1IlI) and ((_IlIIlIlI - _Illl1IlI) / (_1lll1IlI - _Illl1IlI)) or (0x19 - 0x19)
                   _11ll1IlI = _IlIIlIlI
                   _1lIl1IlI(_IlIIlIlI, _IlIl1IlI)
                   end
                  
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x16d)], {
                   _l1ll1IlI = _l1ll1IlI, _IIll1IlI = _IIll1IlI,
                   _1lI1IIlI = _1lI1IIlI,
                   applyColor = function(_I1IIlIlI)
                   _l1ll1IlI[_1II1lIlI(0xf6)] = _I1IIlIlI
                   _IIll1IlI[_1II1lIlI(0xfe)] = _I1IIlIlI
                   end,
                   get = function() return _11ll1IlI end,
                   set = function(_IlIIlIlI)
                   _lIIl1IlI(_IlIIlIlI)
                   if _1IllIIlI then pcall(_1IllIIlI, _11ll1IlI) end
                   end })
                  
                   _1Ill1IlI[_1II1lIlI(0xeb)]:Connect(function(_11IIlIlI)
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   or _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _lI1IlIlI[_1II1lIlI(0x35)]()
                   _I1ll1IlI[_1II1lIlI(0x60)] = 1.4
                   _l1lIlIlI[_1II1lIlI(0x36)](_I1ll1IlI, 0.24, { Scale = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   local _IlIIlIlI, _IlIl1IlI = _llIl1IlI(_11IIlIlI[_1II1lIlI(0x56)][_1II1lIlI(0x57)])
                   _11ll1IlI = _IlIIlIlI
                   _1lIl1IlI(_IlIIlIlI, _IlIl1IlI)
                   _lI1IlIlI[_1II1lIlI(0x1d)] = {
                   update = function(_llIIIIlI)
                   local _IIIl1IlI, _1IIl1IlI = _llIl1IlI(_llIIIIlI)
                   _11ll1IlI = _IIIl1IlI
                   _1lIl1IlI(_IIIl1IlI, _1IIl1IlI)
                   end,
                   finish = function()
                   if _1IllIIlI then pcall(_1IllIIlI, _11ll1IlI) end
                   _1l1IlIlI[_1II1lIlI(0x166)]()
                   end,
                   }
                   end
                   end)
                  
                   return { _III1IIlI = _III1IIlI }
                  end
                  
                  function _l1l1IIlI.input(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _I1I1IIlI = _lII1IIlI[_1II1lIlI(0x15f)] or (0x19 - 0x19)
                   local _l1Il1IlI, _I1Il1IlI = _lII1IIlI[_1II1lIlI(0x44)], _lII1IIlI[_1II1lIlI(0x43)]
                   local _11Il1IlI = _lII1IIlI[_1II1lIlI(0x16f)] ~= (0x0 == 0x1)
                   local _1IllIIlI = _lII1IIlI[_1II1lIlI(0x160)]
                  
                   local _III1IIlI, _l1IIlIlI, _l1I1IIlI = _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   local _ll1l1IlI = _I1I1IIlI
                  
                   local _1l11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x170), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), _l1I1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)], Text = tostring(_I1I1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)), PlaceholderText = tostring(_I1I1IIlI),
                   PlaceholderColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   ClearTextOnFocus = (0x0 == 0x1), TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0x134)],
                   Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1l11IIlI, (((0x30 - 0x0) / 0x8)))
                   local _lI11IIlI = _l1lIlIlI[_1II1lIlI(0x3e)](_1l11IIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_1l11IIlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_1l11IIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                  
                   _1l11IIlI[_1II1lIlI(0x171)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.15, { Color = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] or _1I11lIlI:Get(_1II1lIlI(0x14e)), Transparency = 0.1 })
                   end)
                   _1l11IIlI[_1II1lIlI(0x172)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.2, { Color = _1I11lIlI:Get(_1II1lIlI(0xf5)), Transparency = 0.5 })
                   end)
                  
                   local function _Il1l1IlI(_I1IIlIlI, _1l1l1IlI)
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.12, { Color = _I1IIlIlI })
                   task[_1II1lIlI(0x104)](_1l1l1IlI or 0.55, function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.3, { Color = _1I11lIlI:Get(_1II1lIlI(0xf5)) })
                   end)
                   end
                  
                   local function _lI1l1IlI(_II1l1IlI)
                   if _11Il1IlI then _II1l1IlI = math[_1II1lIlI(0x26)](_II1l1IlI + 0.5) end
                   if _l1Il1IlI and _II1l1IlI < _l1Il1IlI then _II1l1IlI = _l1Il1IlI end
                   if _I1Il1IlI and _II1l1IlI > _I1Il1IlI then _II1l1IlI = _I1Il1IlI end
                   return _II1l1IlI
                   end
                  
                   local function _1I1l1IlI()
                   local _l11l1IlI = (_1l11IIlI[_1II1lIlI(0x100)] or _1II1lIlI(0x21)):gsub(_1II1lIlI(0x173), _1II1lIlI(0x21))
                   local _II1l1IlI = tonumber(_l11l1IlI)
                   if not _II1l1IlI then
                   _Il1l1IlI(_1I11lIlI:Get(_1II1lIlI(0x174)))
                   _1l11IIlI[_1II1lIlI(0x100)] = tostring(_ll1l1IlI)
                   return
                   end
                   _ll1l1IlI = _lI1l1IlI(_II1l1IlI)
                   _1l11IIlI[_1II1lIlI(0x100)] = tostring(_ll1l1IlI)
                   _Il1l1IlI(_1I11lIlI:Get(_1II1lIlI(0x175)), 0.4)
                   if _1IllIIlI then pcall(_1IllIIlI, _ll1l1IlI) end
                   _1l1IlIlI[_1II1lIlI(0x166)]()
                   end
                  
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x176)], {
                   _1lI1IIlI = _1lI1IIlI,
                   get = function() return _ll1l1IlI end,
                   set = function(_IlIIlIlI)
                   local _II1l1IlI = tonumber(_IlIIlIlI)
                   if not _II1l1IlI then return end
                   _ll1l1IlI = _lI1l1IlI(_II1l1IlI)
                   _1l11IIlI[_1II1lIlI(0x100)] = tostring(_ll1l1IlI)
                   if _1IllIIlI then pcall(_1IllIIlI, _ll1l1IlI) end
                   end })
                  
                   _1l11IIlI[_1II1lIlI(0x172)]:Connect(_1I1l1IlI)
                   _1l11IIlI:GetPropertyChangedSignal(_1II1lIlI(0x100)):Connect(function()
                   local _I1IIlIlI = _1l11IIlI[_1II1lIlI(0x100)]:gsub(_1II1lIlI(0x173), _1II1lIlI(0x21))
                   if _I1IIlIlI ~= _1l11IIlI[_1II1lIlI(0x100)] then
                   _1l11IIlI[_1II1lIlI(0x100)] = _I1IIlIlI
                   _1l11IIlI[_1II1lIlI(0x177)] = #_I1IIlIlI + (0x2a / 0x2a)
                   end
                   end)
                  
                   if _1IllIIlI then pcall(_1IllIIlI, _I1I1IIlI) end
                   return { _III1IIlI = _III1IIlI }
                  end
                  
                  function _l1l1IIlI.keybind(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _I1I1IIlI = _lII1IIlI[_1II1lIlI(0x15f)]
                   local _1IllIIlI = _lII1IIlI[_1II1lIlI(0x160)]
                   local _III1IIlI, _l1IIlIlI, _l1I1IIlI = _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                  
                   local _I11l1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), _l1I1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _I1I1IIlI and _I1I1IIlI[_1II1lIlI(0x168)] or _1II1lIlI(0x161), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_I11l1IlI, (((0x30 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_I11l1IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_I11l1IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_I11l1IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                   local _111l1IlI = _I1I1IIlI
                  
                   local function _lllI1IlI(_llIIlIlI)
                   _111l1IlI = _llIIlIlI
                   _I11l1IlI[_1II1lIlI(0x100)] = _llIIlIlI and _llIIlIlI[_1II1lIlI(0x168)] or _1II1lIlI(0x161)
                   if _1IllIIlI then pcall(_1IllIIlI, _llIIlIlI) end
                   end
                  
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x179)], {
                   _1lI1IIlI = _1lI1IIlI,
                   get = function() return _111l1IlI end,
                   set = function(_llIIlIlI)
                   if _llIIlIlI == nil then
                   _lllI1IlI(nil)
                   elseif typeof(_llIIlIlI) == _1II1lIlI(0x17a) then
                   _lllI1IlI(_llIIlIlI)
                   end
                   end })
                  
                   _I11l1IlI[_1II1lIlI(0x139)]:Connect(function()
                   _I11l1IlI[_1II1lIlI(0x100)] = _1II1lIlI(0x17b)
                   _1lllIIlI:BeginCapture(function(_llll1IlI)
                   if _llll1IlI == Enum[_1II1lIlI(0x13)][_1II1lIlI(0x17c)] then
                   _lllI1IlI(nil)
                   else
                   _lllI1IlI(_llll1IlI)
                   end
                   _1l1IlIlI[_1II1lIlI(0x166)]()
                   end)
                   end)
                  
                   return { _III1IIlI = _III1IIlI }
                  end
                  
                  function _l1l1IIlI.colorPicker(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _IllI1IlI = _lII1IIlI[_1II1lIlI(0x15f)] or _1IlIlIlI[_1II1lIlI(0xdf)]
                   local _1IllIIlI = _lII1IIlI[_1II1lIlI(0x160)]
                  
                   local _III1IIlI, _l1IIlIlI, _l1I1IIlI = _I1l1IIlI(_11l1IIlI, _llI1IIlI, _IlI1IIlI, _1lI1IIlI, _lII1IIlI)
                   local _ll1l1IlI = _l1lIlIlI[_1II1lIlI(0x2a)](_IllI1IlI) or Color3[_1II1lIlI(0x22)]((((0x500 - 0x0) / 0x8)), (((0x100 - 0x0) / 0x8)), (((0x780 - 0x0) / 0x8)))
                  
                   local _1llI1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), _l1I1IIlI - (((0x2f0 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0xc0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _ll1l1IlI, BorderSizePixel = (0x19 - 0x19), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1llI1IlI, (((0x20 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_1llI1IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.3)
                  
                   local _1l11IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x170), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), _l1I1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)], Text = _l1lIlIlI[_1II1lIlI(0x23)](_ll1l1IlI), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)), PlaceholderText = _IllI1IlI,
                   PlaceholderColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   ClearTextOnFocus = (0x0 == 0x1), TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0x134)],
                   Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1l11IIlI, (((0x30 - 0x0) / 0x8)))
                   local _lI11IIlI = _l1lIlIlI[_1II1lIlI(0x3e)](_1l11IIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_1l11IIlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_1l11IIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                  
                   local function _Il1l1IlI(_I1IIlIlI, _1l1l1IlI)
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.12, { Color = _I1IIlIlI })
                   task[_1II1lIlI(0x104)](_1l1l1IlI or 0.55, function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_lI11IIlI, 0.3, { Color = _1I11lIlI:Get(_1II1lIlI(0xf5)) })
                   end)
                   end
                  
                   local function _1I1l1IlI()
                   local _I1IIlIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_1l11IIlI[_1II1lIlI(0x100)] or _1II1lIlI(0x21))
                   if not _I1IIlIlI then
                   _Il1l1IlI(_1I11lIlI:Get(_1II1lIlI(0x174)))
                   _1l11IIlI[_1II1lIlI(0x100)] = _l1lIlIlI[_1II1lIlI(0x23)](_ll1l1IlI)
                   return
                   end
                   _ll1l1IlI = _I1IIlIlI
                   _1l11IIlI[_1II1lIlI(0x100)] = _l1lIlIlI[_1II1lIlI(0x23)](_I1IIlIlI)
                   _1llI1IlI[_1II1lIlI(0xf6)] = _I1IIlIlI
                   _Il1l1IlI(_1I11lIlI:Get(_1II1lIlI(0x175)), 0.4)
                   if _1IllIIlI then pcall(_1IllIIlI, _I1IIlIlI, _l1lIlIlI[_1II1lIlI(0x23)](_I1IIlIlI)) end
                   _1l1IlIlI[_1II1lIlI(0x166)]()
                   end
                  
                   _1l11IIlI[_1II1lIlI(0x172)]:Connect(_1I1l1IlI)
                   if _1IllIIlI then pcall(_1IllIIlI, _ll1l1IlI, _l1lIlIlI[_1II1lIlI(0x23)](_ll1l1IlI)) end
                   return { _III1IIlI = _III1IIlI, _1llI1IlI = _1llI1IlI }
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x17e)] = _l1l1IIlI
                  
                  
                  local _lIlI1IlI = {}
                  
                  local function _IIlI1IlI(_11l1IIlI, _llI1IIlI)
                   local _I1IIlIlI = { _11l1IIlI = _11l1IIlI, _llI1IIlI = _llI1IIlI or (0x19 - 0x19), _ord = (0x19 - 0x19) }
                   function _I1IIlIlI:nextOrder() self[_1II1lIlI(0x17f)] = self[_1II1lIlI(0x17f)] + (0x2a / 0x2a); return self[_1II1lIlI(0x17f)] end
                   function _I1IIlIlI:CreateToggle(_l1lI1IlI,_I1lI1IlI) return _l1l1IIlI[_1II1lIlI(0xe3)](self[_1II1lIlI(0x180)], self[_1II1lIlI(0x181)], self:nextOrder(), _l1lI1IlI, _I1lI1IlI) end
                   function _I1IIlIlI:CreateSlider(_l1lI1IlI,_I1lI1IlI) return _l1l1IIlI[_1II1lIlI(0xe1)](self[_1II1lIlI(0x180)], self[_1II1lIlI(0x181)], self:nextOrder(), _l1lI1IlI, _I1lI1IlI) end
                   function _I1IIlIlI:CreateInput(_l1lI1IlI,_I1lI1IlI) return _l1l1IIlI[_1II1lIlI(0x16e)](self[_1II1lIlI(0x180)], self[_1II1lIlI(0x181)], self:nextOrder(), _l1lI1IlI, _I1lI1IlI) end
                   function _I1IIlIlI:CreateKeybind(_l1lI1IlI,_I1lI1IlI) return _l1l1IIlI[_1II1lIlI(0x178)](self[_1II1lIlI(0x180)], self[_1II1lIlI(0x181)], self:nextOrder(), _l1lI1IlI, _I1lI1IlI) end
                   function _I1IIlIlI:CreateColorPicker(_l1lI1IlI,_I1lI1IlI) return _l1l1IIlI[_1II1lIlI(0x17d)](self[_1II1lIlI(0x180)], self[_1II1lIlI(0x181)], self:nextOrder(), _l1lI1IlI, _I1lI1IlI) end
                   function _I1IIlIlI:CreateSection(_l11lIIlI) return _lIlI1IlI[_1II1lIlI(0x182)](self, _l11lIIlI) end
                   function _I1IIlIlI:CreateDropdown(_l1lI1IlI,_I1lI1IlI) return _lIlI1IlI[_1II1lIlI(0x183)](self, _l1lI1IlI, _I1lI1IlI) end
                   return _I1IIlIlI
                  end
                  
                  _lIlI1IlI[_1II1lIlI(0x184)] = _IIlI1IlI
                  
                  function _lIlI1IlI.section(_1IlIlIlI, _l11lIIlI)
                   local _1IlI1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Name = tostring(_l11lIIlI) .. _1II1lIlI(0x185),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1IlIlIlI[_1II1lIlI(0x181)], (0x19 - 0x19), (((0xd0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = tostring(_l11lIIlI), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   AutoButtonColor = (0x0 == 0x1), LayoutOrder = _1IlIlIlI:nextOrder(),
                   Parent = _1IlIlIlI[_1II1lIlI(0x180)] })
                   _1I11lIlI:Register(_1IlI1IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   return {
                   _III1IIlI = _1IlI1IlI,
                   CreateToggle = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateToggle(_l1lI1IlI,_I1lI1IlI) end,
                   CreateSlider = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateSlider(_l1lI1IlI,_I1lI1IlI) end,
                   CreateInput = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateInput(_l1lI1IlI,_I1lI1IlI) end,
                   CreateKeybind = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateKeybind(_l1lI1IlI,_I1lI1IlI) end,
                   CreateColorPicker = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateColorPicker(_l1lI1IlI,_I1lI1IlI) end,
                   CreateSection = function(_l1IIlIlI,_l1IlIIlI) return _1IlIlIlI:CreateSection(_l1IlIIlI) end,
                   CreateDropdown = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _1IlIlIlI:CreateDropdown(_l1lI1IlI,_I1lI1IlI) end,
                   }
                  end
                  
                  function _lIlI1IlI.dropdown(_1IlIlIlI, _1lI1IIlI, _lII1IIlI)
                   _lII1IIlI = _lII1IIlI or {}
                   local _11lI1IlI = _lII1IIlI[_1II1lIlI(0x15f)] == (0x1 == 0x1)
                  
                   local _llII1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Name = tostring(_1lI1IIlI) .. _1II1lIlI(0x186),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1IlIlIlI[_1II1lIlI(0x181)], (0x19 - 0x19), (((0x110 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Text = _1II1lIlI(0x21),
                   LayoutOrder = _1IlIlIlI:nextOrder(), Parent = _1IlIlIlI[_1II1lIlI(0x180)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_llII1IlI, (((0x40 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_llII1IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_llII1IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                  
                   local _ll1IIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = tostring(_1lI1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _llII1IlI })
                   _1I11lIlI:Register(_ll1IIIlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                  
                   local _IlII1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x50 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x70 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))), BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)], Text = _1II1lIlI(0x187), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _llII1IlI })
                   _1I11lIlI:Register(_IlII1IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                   local _1lII1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = tostring(_1lI1IIlI) .. _1II1lIlI(0x6e),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1IlIlIlI[_1II1lIlI(0x181)], (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0x5c)],
                   BackgroundTransparency = (0x2a / 0x2a), Visible = _11lI1IlI,
                   LayoutOrder = _1IlIlIlI:nextOrder(), Parent = _1IlIlIlI[_1II1lIlI(0x180)] })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf7), {
                   PaddingTop = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8))), PaddingBottom = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   PaddingLeft = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))), PaddingRight = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19)),
                   Parent = _1lII1IlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x11b)],
                   HorizontalAlignment = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x134)],
                   SortOrder = Enum[_1II1lIlI(0x11e)][_1II1lIlI(0x11f)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))), Parent = _1lII1IlI })
                  
                   local _lIII1IlI = _IIlI1IlI(_1lII1IlI, _1IlIlIlI[_1II1lIlI(0x181)] + (((0x50 - 0x0) / 0x8)))
                  
                   local function _IIII1IlI(_IlIIlIlI)
                   _11lI1IlI = _IlIIlIlI
                   _1lII1IlI[_1II1lIlI(0x101)] = _IlIIlIlI
                   _l1lIlIlI[_1II1lIlI(0x36)](_IlII1IlI, 0.28, { Rotation = _IlIIlIlI and (((0x2d0 - 0x0) / 0x8)) or (0x19 - 0x19) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x188)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end
                   _IlII1IlI[_1II1lIlI(0x189)] = _11lI1IlI and (((0x2d0 - 0x0) / 0x8)) or (0x19 - 0x19)
                   _llII1IlI[_1II1lIlI(0x139)]:Connect(function() _IIII1IlI(not _11lI1IlI) end)
                  
                   table[_1II1lIlI(0x4f)](_1111lIlI[_1II1lIlI(0x18a)], {
                   close = function() if _11lI1IlI then _IIII1IlI((0x0 == 0x1)) end end })
                  
                   return {
                   _III1IIlI = _llII1IlI, _IIII1IlI = _IIII1IlI, isOpen = function() return _11lI1IlI end,
                   CreateToggle = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateToggle(_l1lI1IlI,_I1lI1IlI) end,
                   CreateSlider = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateSlider(_l1lI1IlI,_I1lI1IlI) end,
                   CreateInput = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateInput(_l1lI1IlI,_I1lI1IlI) end,
                   CreateKeybind = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateKeybind(_l1lI1IlI,_I1lI1IlI) end,
                   CreateColorPicker = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateColorPicker(_l1lI1IlI,_I1lI1IlI) end,
                   CreateSection = function(_l1IIlIlI,_l1IlIIlI) return _lIII1IlI:CreateSection(_l1IlIIlI) end,
                   CreateDropdown = function(_l1IIlIlI,_l1lI1IlI,_I1lI1IlI) return _lIII1IlI:CreateDropdown(_l1lI1IlI,_I1lI1IlI) end,
                   }
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x18b)] = _lIlI1IlI
                  
                  _Il1IlIlI = {}
                  
                  local function _1III1IlI()
                   local _llI1lIlI, _1IIlIIlI = pcall(function() return gethui and gethui() end)
                   if _llI1lIlI and _1IIlIIlI then return _1IIlIIlI end
                   local _Il11lIlI = pcall(function()
                   local _l1IlIIlI = Instance[_1II1lIlI(0x2f)](_1II1lIlI(0x108)); _l1IlIIlI[_1II1lIlI(0x30)] = _1llIlIlI; _l1IlIIlI:Destroy(); return (0x1 == 0x1)
                   end)
                   if _Il11lIlI then return _1llIlIlI end
                   return _lIlIlIlI:WaitForChild(_1II1lIlI(0x109))
                  end
                  
                  function _Il1IlIlI.build()
                   local _l1II1IlI = _1III1IlI()
                  
                   local _I1II1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x10a), {
                   Name = _1II1lIlI(0x18d), ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_1II1lIlI(0x10c)][_1II1lIlI(0x10d)],
                   IgnoreGuiInset = (0x1 == 0x1), DisplayOrder = (((0x1f38 - 0x0) / 0x8)), Parent = _l1II1IlI })
                   _Il1IlIlI[_1II1lIlI(0x10a)] = _I1II1IlI
                  
                   pcall(function()
                   _1111lIlI[_1II1lIlI(0x18e)] = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x18f), {
                   Name = _1II1lIlI(0x190), Size = (((0x40 - 0x0) / 0x8)), Transparency = 0.3, Parent = _IllIlIlI })
                   end)
                  
                   local _11II1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0xef), AnchorPoint = Vector2[_1II1lIlI(0x2f)](0.5, 0.5),
                   Position = UDim2[_1II1lIlI(0x16b)](0.5, 0.5),
                   Size = _1IlIlIlI[_1II1lIlI(0x16a)], BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x191)),
                   BackgroundTransparency = (0x19 - 0x19), BorderSizePixel = (0x19 - 0x19),
                   ClipsDescendants = (0x1 == 0x1), Parent = _I1II1IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_11II1IlI, _1IlIlIlI[_1II1lIlI(0x3d)])
                   _l1lIlIlI[_1II1lIlI(0x3e)](_11II1IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_11II1IlI, _1II1lIlI(0xf6), _1II1lIlI(0x191))
                   _Il1IlIlI[_1II1lIlI(0xef)] = _11II1IlI
                   _Il1IlIlI[_1II1lIlI(0x192)] = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x46), { Parent = _11II1IlI, Scale = (0x2a / 0x2a) })
                   _Il1IlIlI[_1II1lIlI(0x193)] = (0x2a / 0x2a)
                   _Il1IlIlI[_1II1lIlI(0x194)] = _11II1IlI[_1II1lIlI(0x56)]
                   _Il1IlIlI[_1II1lIlI(0x195)] = (0x0 == 0x1)
                  
                   local _ll1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x12d), {
                   Name = _1II1lIlI(0x196),
                   Size = UDim2[_1II1lIlI(0x17)](_1IlIlIlI[_1II1lIlI(0x16a)][_1II1lIlI(0x57)][_1II1lIlI(0x61)], _1IlIlIlI[_1II1lIlI(0x16a)][_1II1lIlI(0x5c)][_1II1lIlI(0x61)]),
                   Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Image = _1II1lIlI(0x21),
                   ImageTransparency = (0x2a / 0x2a),
                   ScaleType = Enum[_1II1lIlI(0x197)][_1II1lIlI(0x198)],
                   ZIndex = -(0x2a / 0x2a),
                   Visible = (0x0 == 0x1),
                   Parent = _11II1IlI,
                   })
                   _Il1IlIlI[_1II1lIlI(0x196)] = _ll1I1IlI
                   _l1lIlIlI[_1II1lIlI(0x3b)](_ll1I1IlI, _1IlIlIlI[_1II1lIlI(0x3d)])
                  
                   local _Il1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x12d), {
                   Name = _1II1lIlI(0x199), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Image = _1II1lIlI(0x21),
                   ImageTransparency = (0x2a / 0x2a), ScaleType = Enum[_1II1lIlI(0x197)][_1II1lIlI(0x19a)],
                   ImageColor3 = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   Visible = (0x0 == 0x1), ZIndex = (0x19 - 0x19), Parent = _11II1IlI })
                   _Il1IlIlI[_1II1lIlI(0x199)] = _Il1I1IlI
                  
                   local _1l1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x19b), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)]),
                   BackgroundTransparency = (0x2a / 0x2a), ZIndex = (((0x50 - 0x0) / 0x8)), Parent = _11II1IlI })
                   _Il1IlIlI[_1II1lIlI(0x19b)] = _1l1I1IlI
                  
                   local _lI1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x32), {
                   Name = _1II1lIlI(0x19d), Position = UDim2[_1II1lIlI(0x17)]((((0x70 - 0x0) / 0x8)), (_1IlIlIlI[_1II1lIlI(0x19c)] - (((0xd0 - 0x0) / 0x8))) / (((0x10 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8))), BackgroundTransparency = (0x2a / 0x2a), Image = _1II1lIlI(0x21),
                   Rotation = (0x19 - 0x19), AutoButtonColor = (0x0 == 0x1), ZIndex = (((0x58 - 0x0) / 0x8)), Parent = _1l1I1IlI })
                   _Il1IlIlI[_1II1lIlI(0x19d)] = _lI1I1IlI
                   _l1lIlIlI[_1II1lIlI(0x45)](_lI1I1IlI, 1.1)
                  
                   local _II1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x19e), Position = UDim2[_1II1lIlI(0x17)]((((0x1a0 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x410 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)), BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x58 - 0x0) / 0x8)), ClipsDescendants = (0x1 == 0x1), Parent = _1l1I1IlI })
                   _Il1IlIlI[_1II1lIlI(0x19e)] = _II1I1IlI
                  
                   local _1I1I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1IlIlIlI[_1II1lIlI(0x123)], TextSize = (((0x90 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)), TextTransparency = (0x19 - 0x19),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], ZIndex = (((0x60 - 0x0) / 0x8)),
                   Parent = _II1I1IlI })
                   _1I11lIlI:Register(_1I1I1IlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   _Il1IlIlI[_1II1lIlI(0x19f)] = _1I1I1IlI
                  
                   local _l11I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x1a0 - 0x0) / 0x8)), _1IlIlIlI[_1II1lIlI(0x19c)] - (((0x60 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x1a0 - 0x0) / 0x8)), (((0x10 - 0x0) / 0x8))),
                   BackgroundColor3 = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)],
                   BorderSizePixel = (0x19 - 0x19), ZIndex = (((0x58 - 0x0) / 0x8)), Parent = _1l1I1IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_l11I1IlI, (0x2a / 0x2a))
                   _Il1IlIlI[_1II1lIlI(0x1a0)] = _l11I1IlI
                  
                   local _I11I1IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x1a1), {
                   Name = _1II1lIlI(0x1a2), Position = UDim2[_1II1lIlI(0x17)](_1IlIlIlI[_1II1lIlI(0x1a3)], (((0x40 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1IlIlIlI[_1II1lIlI(0x1a3)] - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)] - (((0x80 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19),
                   ScrollingDirection = Enum[_1II1lIlI(0x1a4)][_1II1lIlI(0x57)], ScrollingEnabled = (0x1 == 0x1),
                   ScrollBarThickness = (0x19 - 0x19), CanvasSize = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0x57)], ZIndex = (((0x58 - 0x0) / 0x8)), Parent = _1l1I1IlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x1a5)],
                   HorizontalAlignment = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0xfd)],
                   VerticalAlignment = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x134)],
                   SortOrder = Enum[_1II1lIlI(0x11e)][_1II1lIlI(0x11f)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))), Parent = _I11I1IlI })
                   _I11I1IlI[_1II1lIlI(0x51)]:Connect(function(_11IIlIlI)
                   if _11IIlIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x1a6)] then
                   local _111I1IlI = math[_1II1lIlI(0x43)]((0x19 - 0x19), _I11I1IlI[_1II1lIlI(0x1a7)][_1II1lIlI(0x57)] - _I11I1IlI[_1II1lIlI(0x1a8)][_1II1lIlI(0x57)])
                   _I11I1IlI[_1II1lIlI(0x1a9)] = Vector2[_1II1lIlI(0x2f)](
                   _l1lIlIlI[_1II1lIlI(0x42)](_I11I1IlI[_1II1lIlI(0x1a9)][_1II1lIlI(0x57)] - _11IIlIlI[_1II1lIlI(0x56)][_1II1lIlI(0x1aa)] * (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _111I1IlI), (0x19 - 0x19))
                   end
                   end)
                   _Il1IlIlI[_1II1lIlI(0x1a2)] = _I11I1IlI
                  
                   local _lll11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)]),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x1ab)),
                   BorderSizePixel = (0x19 - 0x19), ZIndex = (((0x10 - 0x0) / 0x8)), Parent = _11II1IlI })
                   _1I11lIlI:Register(_lll11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x1ab))
                  
                   local _Ill11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1ac),
                   Position = UDim2[_1II1lIlI(0x17)](-_1IlIlIlI[_1II1lIlI(0x1ad)], _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x1ad)], (0x2a / 0x2a), -(_1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a) + _1IlIlIlI[_1II1lIlI(0x1ae)])),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)),
                   BorderSizePixel = (0x19 - 0x19), ClipsDescendants = (0x1 == 0x1),
                   Visible = (0x0 == 0x1), ZIndex = (((0x28 - 0x0) / 0x8)), Parent = _11II1IlI })
                   _1I11lIlI:Register(_Ill11IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _Il1IlIlI[_1II1lIlI(0x1ac)] = _Ill11IlI
                  
                   local _1ll11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1af), AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x2a / 0x2a), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x1ab)),
                   BorderSizePixel = (0x19 - 0x19), Parent = _Ill11IlI })
                   _1I11lIlI:Register(_1ll11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x1ab))
                  
                   local _lIl11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1b0), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x160 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Parent = _Ill11IlI })
                  
                   local _IIl11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x80 - 0x0) / 0x8)), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x1e0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1II1lIlI(0x1b1), TextSize = (((0x58 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _lIl11IlI })
                   _1I11lIlI:Register(_IIl11IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                   local _1Il11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5), Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x60 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)),
                   BorderSizePixel = (0x19 - 0x19), AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)], Text = _1II1lIlI(0x1b2), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _lIl11IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1Il11IlI, (((0x30 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_1Il11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x135))
                   _1I11lIlI:Register(_1Il11IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _l1lIlIlI[_1II1lIlI(0x45)](_1Il11IlI, 1.1)
                   _1Il11IlI[_1II1lIlI(0x139)]:Connect(function()
                   _Il1IlIlI[_1II1lIlI(0x1b3)]((0x0 == 0x1), (0x1 == 0x1))
                   end)
                  
                   local _l1l11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1b4), Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (((0x160 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x1ab)),
                   BorderSizePixel = (0x19 - 0x19), Parent = _Ill11IlI })
                   _1I11lIlI:Register(_l1l11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x1ab))
                  
                   local _I1l11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x1a1), {
                   Name = _1II1lIlI(0x1b5), Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (((0x170 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(((0x240 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19),
                   ScrollBarThickness = (((0x18 - 0x0) / 0x8)), ScrollBarImageColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   CanvasSize = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0x5c)], Parent = _Ill11IlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf7), {
                   PaddingLeft = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))), PaddingRight = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingTop = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))), PaddingBottom = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   Parent = _I1l11IlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x11b)],
                   HorizontalAlignment = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x134)],
                   SortOrder = Enum[_1II1lIlI(0x11e)][_1II1lIlI(0x11f)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x20 - 0x0) / 0x8))), Parent = _I1l11IlI })
                   _Il1IlIlI[_1II1lIlI(0x1b5)] = _I1l11IlI
                  
                   local _11l11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0xa0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _1II1lIlI(0x1b6) .. _1IlIlIlI[_1II1lIlI(0x1b7)], TextSize = (((0x48 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0x134)], Parent = _Ill11IlI })
                   _1I11lIlI:Register(_11l11IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                   local _llI11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Name = _1II1lIlI(0x1b8), AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x19 - 0x19), 0.5),
                   Position = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)](_1IlIlIlI[_1II1lIlI(0x1b9)], _1IlIlIlI[_1II1lIlI(0x1ba)]),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)),
                   BorderSizePixel = (0x19 - 0x19), AutoButtonColor = (0x0 == 0x1), Text = _1II1lIlI(0x21),
                   ZIndex = (((0x78 - 0x0) / 0x8)), Visible = (0x0 == 0x1), Parent = _11II1IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_llI11IlI, (((0x28 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_llI11IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_llI11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x135))
                  
                   local _IlI11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)), BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)], Text = _1II1lIlI(0x187), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _llI11IlI })
                   _1I11lIlI:Register(_IlI11IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                  
                   _llI11IlI[_1II1lIlI(0x47)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_llI11IlI, 0.15, {
                   Size = UDim2[_1II1lIlI(0x17)](_1IlIlIlI[_1II1lIlI(0x1b9)] + (((0x20 - 0x0) / 0x8)), _1IlIlIlI[_1II1lIlI(0x1ba)]) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _llI11IlI[_1II1lIlI(0x48)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_llI11IlI, 0.15, {
                   Size = UDim2[_1II1lIlI(0x17)](_1IlIlIlI[_1II1lIlI(0x1b9)], _1IlIlIlI[_1II1lIlI(0x1ba)]) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _llI11IlI[_1II1lIlI(0x139)]:Connect(function()
                   _Il1IlIlI[_1II1lIlI(0x1b3)]((0x1 == 0x1), (0x1 == 0x1))
                   end)
                   _Il1IlIlI[_1II1lIlI(0x1b8)] = _llI11IlI
                  
                   local _1lI11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1bb), Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(_1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a) + _1IlIlIlI[_1II1lIlI(0x1ae)])),
                   BackgroundTransparency = (0x2a / 0x2a), ZIndex = (((0x18 - 0x0) / 0x8)), Parent = _11II1IlI })
                   _Il1IlIlI[_1II1lIlI(0x1bb)] = _1lI11IlI
                  
                   local _lII11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x70 - 0x0) / 0x8)), (((0x50 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0xe0 - 0x0) / 0x8)), (0x19 - 0x19), (((0x100 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0x20 - 0x0) / 0x8)), Parent = _1lI11IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_lII11IlI, (((0x40 - 0x0) / 0x8)))
                   local _III11IlI = _l1lIlIlI[_1II1lIlI(0x3e)](_lII11IlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.5)
                   _1I11lIlI:Register(_lII11IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                  
                   local _1II11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x170), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x60 - 0x0) / 0x8)), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0xc0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   PlaceholderText = _1II1lIlI(0x1bc),
                   PlaceholderColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   Text = _1II1lIlI(0x21), TextSize = (((0x70 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   ClearTextOnFocus = (0x0 == 0x1), ZIndex = (((0x28 - 0x0) / 0x8)), Parent = _lII11IlI })
                   _1I11lIlI:Register(_1II11IlI, _1II1lIlI(0xfe), _1II1lIlI(0xfb))
                   _1I11lIlI:Register(_1II11IlI, _1II1lIlI(0x1bd), _1II1lIlI(0x131))
                   _Il1IlIlI[_1II1lIlI(0x1be)] = _1II11IlI
                  
                   _1II11IlI[_1II1lIlI(0x171)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_III11IlI, 0.15, {
                   Color = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] or _1I11lIlI:Get(_1II1lIlI(0x14e)), Transparency = 0.1 })
                   _l1lIlIlI[_1II1lIlI(0x36)](_lII11IlI, 0.22, { BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                   _1II11IlI[_1II1lIlI(0x172)]:Connect(function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_III11IlI, 0.2, {
                   Color = _1I11lIlI:Get(_1II1lIlI(0xf5)), Transparency = 0.5 })
                   _l1lIlIlI[_1II1lIlI(0x36)](_lII11IlI, 0.22, { BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                  
                   local _l1I11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (((0x1a0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(((0x1a0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), ZIndex = (((0x18 - 0x0) / 0x8)), Parent = _1lI11IlI })
                   _Il1IlIlI[_1II1lIlI(0x1bf)] = _l1I11IlI
                  
                   local _I1I11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1c0), Position = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a), -_1IlIlIlI[_1II1lIlI(0x1ae)]),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x1ae)]),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)),
                   BorderSizePixel = (0x19 - 0x19), ZIndex = (((0x30 - 0x0) / 0x8)), Parent = _11II1IlI })
                   _1I11lIlI:Register(_I1I11IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                  
                   local _11I11IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x1ab)),
                   BorderSizePixel = (0x19 - 0x19), Parent = _I1I11IlI })
                   _1I11lIlI:Register(_11I11IlI, _1II1lIlI(0xf6), _1II1lIlI(0x1ab))
                  
                   local _ll111IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _1II1lIlI(0x21), TextSize = (((0x58 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], ZIndex = (((0x38 - 0x0) / 0x8)), Parent = _I1I11IlI })
                   _1I11lIlI:Register(_ll111IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _Il1IlIlI[_1II1lIlI(0x1c1)] = _ll111IlI
                  
                   _l1lIlIlI[_1II1lIlI(0x4e)](_l11IlIlI[_1II1lIlI(0x1c2)]:Connect(function()
                   _1111lIlI[_1II1lIlI(0x150)] = _1111lIlI[_1II1lIlI(0x150)] + (0x2a / 0x2a)
                   end))
                  
                   task[_1II1lIlI(0x15a)](function()
                   local _II1IIIlI = _1111lIlI[_1II1lIlI(0x150)]
                   local _1I1IIIlI = os[_1II1lIlI(0x14f)]()
                   while _I1II1IlI and _I1II1IlI[_1II1lIlI(0x30)] do
                   task[_1II1lIlI(0x152)](0.5)
                   local _l11IIIlI = _1111lIlI[_1II1lIlI(0x150)]
                   local _I11IIIlI = os[_1II1lIlI(0x14f)]()
                   local _111IIIlI = _I11IIIlI - _1I1IIIlI
                   if _111IIIlI >= 0.9 then
                   local _lll1IIlI = math[_1II1lIlI(0x26)]((_l11IIIlI - _II1IIIlI) / _111IIIlI + 0.5)
                   _II1IIIlI = _l11IIIlI
                   _1I1IIIlI = _I11IIIlI
                   local _Ill1IIlI = (0x19 - 0x19)
                   pcall(function()
                   _Ill1IIlI = math[_1II1lIlI(0x26)](_lllIlIlI[_1II1lIlI(0x153)][_1II1lIlI(0x154)][_1II1lIlI(0x155)]:GetValue())
                   end)
                   _ll111IlI[_1II1lIlI(0x100)] = string[_1II1lIlI(0x24)](
                   _1II1lIlI(0x1c3),
                   _lll1IIlI, _Ill1IIlI, #_I11IlIlI:GetPlayers(), os[_1II1lIlI(0x1c4)](_1II1lIlI(0x1c5)))
                   end
                   end
                   end)
                  
                   local _Il111IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1c6), AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x70 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x17)]((((0x1c0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), ZIndex = (((0x58 - 0x0) / 0x8)), Parent = _1l1I1IlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x1a5)],
                   HorizontalAlignment = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x113)],
                   VerticalAlignment = Enum[_1II1lIlI(0x110)][_1II1lIlI(0x134)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))), Parent = _Il111IlI })
                  
                   local _1l111IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Size = UDim2[_1II1lIlI(0x17)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1II1lIlI(0x1c7), TextSize = (((0x70 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   ZIndex = (((0x60 - 0x0) / 0x8)), Parent = _Il111IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1l111IlI, (((0x30 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_1l111IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_1l111IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _l1lIlIlI[_1II1lIlI(0x45)](_1l111IlI, 1.1)
                   _l1lIlIlI[_1II1lIlI(0x49)](_1l111IlI)
                  
                   local _lI111IlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Size = UDim2[_1II1lIlI(0x17)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1II1lIlI(0x136), TextSize = (((0x70 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   ZIndex = (((0x60 - 0x0) / 0x8)), Parent = _Il111IlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_lI111IlI, (((0x30 - 0x0) / 0x8)))
                   _1I11lIlI:Register(_lI111IlI, _1II1lIlI(0xf6), _1II1lIlI(0xf4))
                   _1I11lIlI:Register(_lI111IlI, _1II1lIlI(0xfe), _1II1lIlI(0x131))
                   _l1lIlIlI[_1II1lIlI(0x45)](_lI111IlI, 1.1)
                   _l1lIlIlI[_1II1lIlI(0x49)](_lI111IlI)
                  
                   _Il1IlIlI[_1II1lIlI(0x1c8)] = (0x0 == 0x1)
                   _Il1IlIlI[_1II1lIlI(0x1c9)] = (0x1 == 0x1)
                  
                   local function _II111IlI()
                   for _l1IIlIlI, _ll1IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x18a)]) do
                   pcall(function() _ll1IlIlI[_1II1lIlI(0x1ca)]() end)
                   end
                   end
                  
                   local _1I111IlI = {}
                  
                   function _Il1IlIlI.applyThemeBackground(themeName)
                   local _IlllIIlI = _II11lIlI[themeName]
                   if not _IlllIIlI then return end
                  
                   local _I1l1lIlI = _IlllIIlI[_1II1lIlI(0x1cc)]
                   local _l1111IlI = _IlllIIlI[_1II1lIlI(0x1cd)]
                  
                   if _I1l1lIlI and _I1l1lIlI ~= _1II1lIlI(0x21) then
                   local _I1111IlI = _1I111IlI[_I1l1lIlI]
                   if not _I1111IlI then
                   _I1111IlI = _lI1IlIlI[_1II1lIlI(0x7e)][_1II1lIlI(0x76)](_I1l1lIlI, _1II1lIlI(0x1ce) .. themeName)
                   _1I111IlI[_I1l1lIlI] = _I1111IlI
                   end
                  
                   if _I1111IlI then
                   _ll1I1IlI[_1II1lIlI(0x1cf)] = _I1111IlI
                   _ll1I1IlI[_1II1lIlI(0x197)] = Enum[_1II1lIlI(0x197)][_1II1lIlI(0x198)]
                   _ll1I1IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1I1IlI, 0.35, { ImageTransparency = 0.15 })
                   else
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1I1IlI, 0.3, { ImageTransparency = (0x2a / 0x2a) })
                   task[_1II1lIlI(0x104)](0.31, function() _ll1I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1) end)
                   end
                   else
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1I1IlI, 0.3, { ImageTransparency = (0x2a / 0x2a) })
                   task[_1II1lIlI(0x104)](0.31, function() _ll1I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1) end)
                   end
                  
                   if _l1111IlI then
                   _1I1I1IlI[_1II1lIlI(0xfe)] = _l1111IlI
                   else
                   _1I1I1IlI[_1II1lIlI(0xfe)] = _1I11lIlI:Get(_1II1lIlI(0xfb))
                   end
                   end
                  
                   function _Il1IlIlI.setMinimized(_11I1IIlI)
                   _Il1IlIlI[_1II1lIlI(0x1c8)] = _11I1IIlI
                   if _11I1IIlI then
                   _II111IlI()
                   _I11I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _llI11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _1lI11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _I1I11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_11II1IlI, 0.32, { Size = _1IlIlIlI[_1II1lIlI(0x1d1)] },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x188)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   local _IlllIIlI = _II11lIlI[_1I11lIlI[_1II1lIlI(0xd7)]]
                   if _IlllIIlI and _IlllIIlI[_1II1lIlI(0x1d2)] then
                   _1I1I1IlI[_1II1lIlI(0xfe)] = _IlllIIlI[_1II1lIlI(0x1d2)]
                   end
                   else
                   _l1lIlIlI[_1II1lIlI(0x36)](_11II1IlI, 0.4, { Size = _1IlIlIlI[_1II1lIlI(0x16a)] },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   task[_1II1lIlI(0x104)](0.15, function()
                   _1lI11IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _I1I11IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   if _1111lIlI[_1II1lIlI(0x1d3)] == _1II1lIlI(0x1c) then
                   _I11I1IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _llI11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   else
                   _I11I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _llI11IlI[_1II1lIlI(0x101)] = not _1111lIlI[_1II1lIlI(0x1d4)]
                   end
                   if _1111lIlI[_1II1lIlI(0x1d5)] then
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x180)] then _l1IlIIlI[_1II1lIlI(0x180)][_1II1lIlI(0x101)] = (_l1IlIIlI == _1111lIlI[_1II1lIlI(0x1d5)]) end
                   end
                   end
                   local _IlllIIlI = _II11lIlI[_1I11lIlI[_1II1lIlI(0xd7)]]
                   if _IlllIIlI and _IlllIIlI[_1II1lIlI(0x1cd)] then
                   _1I1I1IlI[_1II1lIlI(0xfe)] = _IlllIIlI[_1II1lIlI(0x1cd)]
                   end
                   end)
                   end
                   end
                  
                   function _Il1IlIlI.showUI()
                   if _Il1IlIlI[_1II1lIlI(0x195)] then return end
                   local _11111IlI = _Il1IlIlI[_1II1lIlI(0x1c9)] and _I1II1IlI[_1II1lIlI(0x1d8)]
                   _Il1IlIlI[_1II1lIlI(0x1c9)] = (0x1 == 0x1)
                   _I1II1IlI[_1II1lIlI(0x1d8)] = (0x1 == 0x1)
                   if _lI1IlIlI[_1II1lIlI(0x13b)] then _lI1IlIlI[_1II1lIlI(0x13b)][_1II1lIlI(0x1d8)] = (0x1 == 0x1) end
                   if _11111IlI then return end
                   _Il1IlIlI[_1II1lIlI(0x195)] = (0x1 == 0x1)
                  
                   local _lllllIlI = _Il1IlIlI[_1II1lIlI(0x194)] or _Il1IlIlI[_1II1lIlI(0xef)][_1II1lIlI(0x56)]
                   _Il1IlIlI[_1II1lIlI(0x194)] = _lllllIlI
                  
                   if _1111lIlI[_1II1lIlI(0x18e)] then
                   _1111lIlI[_1II1lIlI(0x18e)][_1II1lIlI(0x16a)] = (0x19 - 0x19)
                   _1111lIlI[_1II1lIlI(0x18e)][_1II1lIlI(0x165)] = (0x2a / 0x2a)
                   _l1lIlIlI[_1II1lIlI(0x36)](_1111lIlI[_1II1lIlI(0x18e)], 0.55, { Size = (((0x40 - 0x0) / 0x8)), Transparency = 0.3 },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end
                  
                   _Il1IlIlI[_1II1lIlI(0x192)][_1II1lIlI(0x60)] = _Il1IlIlI[_1II1lIlI(0x193)] * 0.72
                   _Il1IlIlI[_1II1lIlI(0xef)][_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x2f)](_lllllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x60)], _lllllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x61)],
                   _lllllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x60)], _lllllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x61)] - (((0x150 - 0x0) / 0x8)))
                   _Il1IlIlI[_1II1lIlI(0x1c1)][_1II1lIlI(0x107)] = (0x2a / 0x2a)
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x192)], 0.6, { Scale = _Il1IlIlI[_1II1lIlI(0x193)] },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0xef)], 0.5, { Position = _lllllIlI },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   task[_1II1lIlI(0x104)](0.2, function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x1c1)], 0.32, { TextTransparency = (0x19 - 0x19) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end)
                  
                   task[_1II1lIlI(0x104)](0.7, function() _Il1IlIlI[_1II1lIlI(0x195)] = (0x0 == 0x1) end)
                   end
                  
                   function _Il1IlIlI.hideUI()
                   if _Il1IlIlI[_1II1lIlI(0x195)] then return end
                   if not _Il1IlIlI[_1II1lIlI(0x1c9)] then return end
                   _Il1IlIlI[_1II1lIlI(0x195)] = (0x1 == 0x1)
                   _Il1IlIlI[_1II1lIlI(0x1c9)] = (0x0 == 0x1)
                   _II111IlI()
                  
                   local _lllllIlI = _Il1IlIlI[_1II1lIlI(0x194)] or _Il1IlIlI[_1II1lIlI(0xef)][_1II1lIlI(0x56)]
                   _Il1IlIlI[_1II1lIlI(0x194)] = _lllllIlI
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x1c1)], 0.18, { TextTransparency = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   if _1111lIlI[_1II1lIlI(0x18e)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_1111lIlI[_1II1lIlI(0x18e)], 0.4, { Size = (0x19 - 0x19), Transparency = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   end
                  
                   task[_1II1lIlI(0x104)](0.05, function()
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x192)], 0.42, { Scale = _Il1IlIlI[_1II1lIlI(0x193)] * 0.72 },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0xef)], 0.46,
                   { Position = UDim2[_1II1lIlI(0x2f)](_lllllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x60)], _lllllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x61)],
                   _lllllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x60)], _lllllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x61)] - (((0x150 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   end)
                  
                   task[_1II1lIlI(0x104)](0.6, function()
                   _I1II1IlI[_1II1lIlI(0x1d8)] = (0x0 == 0x1)
                   if _lI1IlIlI[_1II1lIlI(0x13b)] then _lI1IlIlI[_1II1lIlI(0x13b)][_1II1lIlI(0x1d8)] = (0x0 == 0x1) end
                   _Il1IlIlI[_1II1lIlI(0x192)][_1II1lIlI(0x60)] = _Il1IlIlI[_1II1lIlI(0x193)]
                   _Il1IlIlI[_1II1lIlI(0xef)][_1II1lIlI(0x56)] = _lllllIlI
                   _Il1IlIlI[_1II1lIlI(0x1c1)][_1II1lIlI(0x107)] = (0x19 - 0x19)
                   _Il1IlIlI[_1II1lIlI(0x195)] = (0x0 == 0x1)
                   end)
                   end
                  
                   function _Il1IlIlI.animateExit(_IIlllIlI)
                   if not _Il1IlIlI[_1II1lIlI(0xef)] then if _IIlllIlI then _IIlllIlI() end return end
                   for _l1IIlIlI, _ll1IlIlI in ipairs(_Il1IlIlI[_1II1lIlI(0xef)]:GetDescendants()) do
                   if _ll1IlIlI:IsA(_1II1lIlI(0x1db)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1IlIlI, 0.3, { BackgroundTransparency = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   if _ll1IlIlI:IsA(_1II1lIlI(0xf8)) or _ll1IlIlI:IsA(_1II1lIlI(0x31)) or _ll1IlIlI:IsA(_1II1lIlI(0x170)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1IlIlI, 0.3, { TextTransparency = (0x2a / 0x2a) })
                   end
                   if _ll1IlIlI:IsA(_1II1lIlI(0x12d)) or _ll1IlIlI:IsA(_1II1lIlI(0x32)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1IlIlI, 0.3, { ImageTransparency = (0x2a / 0x2a) })
                   end
                   elseif _ll1IlIlI:IsA(_1II1lIlI(0x3f)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_ll1IlIlI, 0.3, { Transparency = (0x2a / 0x2a) })
                   end
                   end
                   if _Il1IlIlI[_1II1lIlI(0x192)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x192)], 0.34, { Scale = 0.82 },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   end
                   if _lI1IlIlI[_1II1lIlI(0x10e)] then
                   for _l1IIlIlI, _I11IlIlI in ipairs(_lI1IlIlI[_1II1lIlI(0x10e)]:GetDescendants()) do
                   if _I11IlIlI:IsA(_1II1lIlI(0x1db)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_I11IlIlI, 0.25, { BackgroundTransparency = (0x2a / 0x2a) })
                   if _I11IlIlI:IsA(_1II1lIlI(0xf8)) or _I11IlIlI:IsA(_1II1lIlI(0x31)) then
                   _l1lIlIlI[_1II1lIlI(0x36)](_I11IlIlI, 0.25, { TextTransparency = (0x2a / 0x2a) })
                   end
                   end
                   end
                   end
                   task[_1II1lIlI(0x104)](0.36, function() if _IIlllIlI then _IIlllIlI() end end)
                   end
                  
                   function _Il1IlIlI.toggleVis()
                   if _Il1IlIlI[_1II1lIlI(0x1c8)] then
                   _Il1IlIlI[_1II1lIlI(0x1d0)]((0x0 == 0x1))
                   _Il1IlIlI[_1II1lIlI(0x1d7)]()
                   if _1111lIlI[_1II1lIlI(0x1d5)] then
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x180)] then _l1IlIIlI[_1II1lIlI(0x180)][_1II1lIlI(0x101)] = (_l1IlIIlI == _1111lIlI[_1II1lIlI(0x1d5)]) end
                   end
                   end
                   return
                   end
                   if _Il1IlIlI[_1II1lIlI(0x1c9)] then
                   _Il1IlIlI[_1II1lIlI(0x1d9)]()
                   else
                   _Il1IlIlI[_1II1lIlI(0x1d7)]()
                   end
                   end
                  
                   _1l111IlI[_1II1lIlI(0x139)]:Connect(function()
                   _Il1IlIlI[_1II1lIlI(0x1d0)](not _Il1IlIlI[_1II1lIlI(0x1c8)])
                   end)
                  
                   _lI111IlI[_1II1lIlI(0x139)]:Connect(function()
                   local _IllllIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1dd), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundColor3 = Color3[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0xfa0 - 0x0) / 0x8)), Parent = _I1II1IlI })
                   local _IIlIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)](0.5, 0.5), Position = UDim2[_1II1lIlI(0x16b)](0.5, 0.5),
                   Size = UDim2[_1II1lIlI(0x17)]((((0xa00 - 0x0) / 0x8)), (((0x500 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0xf4)),
                   BorderSizePixel = (0x19 - 0x19), ZIndex = (((0xfa8 - 0x0) / 0x8)), Parent = _IllllIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_IIlIIIlI, _1IlIlIlI[_1II1lIlI(0x3d)])
                   _l1lIlIlI[_1II1lIlI(0x3e)](_IIlIIIlI, _1I11lIlI:Get(_1II1lIlI(0xf5)), (0x2a / 0x2a), 0.3)
                   local _1llllIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x46), { Parent = _IIlIIIlI, Scale = 0.82 })
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_IllllIlI, 0.22, { BackgroundTransparency = 0.5 })
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llllIlI, 0.34, { Scale = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1II1lIlI(0x1de), TextSize = (((0x80 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0xfb)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   ZIndex = (((0xfb0 - 0x0) / 0x8)), Parent = _IIlIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0xa0 - 0x0) / 0x8)), (((0x190 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0x190 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0xfa)],
                   Text = _1II1lIlI(0x1df),
                   TextSize = (((0x68 - 0x0) / 0x8)), TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)],
                   ZIndex = (((0xfb0 - 0x0) / 0x8)), Parent = _IIlIIIlI })
                  
                   local function _lIlllIlI(_IIlllIlI)
                   _l1lIlIlI[_1II1lIlI(0x36)](_IllllIlI, 0.2, { BackgroundTransparency = (0x2a / 0x2a) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llllIlI, 0.2, { Scale = 0.82 },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   task[_1II1lIlI(0x104)](0.21, function()
                   _IllllIlI:Destroy()
                   if _IIlllIlI then _IIlllIlI() end
                   end)
                   end
                  
                   local function _1IlllIlI(_l1lllIlI, _llIIIIlI, _I1lllIlI, _11lllIlI)
                   local _llIllIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Position = UDim2[_1II1lIlI(0x2f)](_llIIIIlI, (((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), -(((0x1c0 - 0x0) / 0x8))), Size = UDim2[_1II1lIlI(0x2f)](0.5, -(((0xc8 - 0x0) / 0x8)), (0x19 - 0x19), (((0x100 - 0x0) / 0x8))),
                   BackgroundColor3 = _I1lllIlI, BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _l1lllIlI, TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   ZIndex = (((0xfb0 - 0x0) / 0x8)), Parent = _IIlIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_llIllIlI, (((0x40 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x45)](_llIllIlI, 1.03)
                   _llIllIlI[_1II1lIlI(0x139)]:Connect(_11lllIlI)
                   end
                   _1IlllIlI(_1II1lIlI(0x1e0), (0x19 - 0x19), _1I11lIlI:Get(_1II1lIlI(0x135)), function() _lIlllIlI() end)
                   _1IlllIlI(_1II1lIlI(0x1e1), 0.5, Color3[_1II1lIlI(0x22)]((((0x6e0 - 0x0) / 0x8)), (((0x1e0 - 0x0) / 0x8)), (((0x230 - 0x0) / 0x8))), function()
                   _lIlllIlI(function()
                   _Il1IlIlI[_1II1lIlI(0x1da)](function() _lI1IlIlI[_1II1lIlI(0x1e2)]() end)
                   end)
                   end)
                   end)
                  
                   _Il1IlIlI[_1II1lIlI(0x1e3)] = (0x1 == 0x1)
                   local _IlIllIlI = (0x19 - 0x19)
                  
                   function _Il1IlIlI.setTitleVisible(_IlIIlIlI)
                   _Il1IlIlI[_1II1lIlI(0x1e3)] = _IlIIlIlI
                   if _1111lIlI[_1II1lIlI(0x1d3)] == _1II1lIlI(0x1c) then
                   local _1lIllIlI = _IlIIlIlI and _1IlIlIlI[_1II1lIlI(0x1a3)] or _1IlIlIlI[_1II1lIlI(0x1e5)]
                   _l1lIlIlI[_1II1lIlI(0x36)](_I11I1IlI, 0.4, {
                   Position = UDim2[_1II1lIlI(0x17)](_1lIllIlI, (((0x40 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1lIllIlI - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)] - (((0x80 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end
                   if _IlIIlIlI then
                   _II1I1IlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)]((((0xf0 - 0x0) / 0x8)), (0x19 - 0x19))
                   _1I1I1IlI[_1II1lIlI(0x107)] = (0x2a / 0x2a)
                   _1I1I1IlI[_1II1lIlI(0x1e6)] = (((0x70 - 0x0) / 0x8))
                   _l11I1IlI[_1II1lIlI(0x105)] = (0x2a / 0x2a)
                   _l11I1IlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x36)](_II1I1IlI, 0.45, { Position = UDim2[_1II1lIlI(0x17)]((((0x1a0 - 0x0) / 0x8)), (0x19 - 0x19)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_1I1I1IlI, 0.35, { TextTransparency = (0x19 - 0x19), TextSize = (((0x90 - 0x0) / 0x8)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_l11I1IlI, 0.5, {
                   BackgroundTransparency = (0x19 - 0x19), Size = UDim2[_1II1lIlI(0x17)]((((0x1a0 - 0x0) / 0x8)), (((0x10 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   else
                   _l1lIlIlI[_1II1lIlI(0x36)](_II1I1IlI, 0.35, { Position = UDim2[_1II1lIlI(0x17)]((((0xf0 - 0x0) / 0x8)), (0x19 - 0x19)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4a)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_1I1I1IlI, 0.3, { TextTransparency = (0x2a / 0x2a), TextSize = (((0x70 - 0x0) / 0x8)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   _l1lIlIlI[_1II1lIlI(0x36)](_l11I1IlI, 0.3, {
                   BackgroundTransparency = (0x2a / 0x2a), Size = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8))) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x137)])
                   end
                   end
                  
                   _lI1I1IlI[_1II1lIlI(0x139)]:Connect(function()
                   local _lIIllIlI = _Il1IlIlI[_1II1lIlI(0x1e3)] and -(((0xb40 - 0x0) / 0x8)) or (((0xb40 - 0x0) / 0x8))
                   _IlIllIlI = _IlIllIlI + _lIIllIlI
                   _II1IlIlI:Create(_lI1I1IlI,
                   TweenInfo[_1II1lIlI(0x2f)](0.75, Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x1e7)]),
                   { Rotation = _IlIllIlI }):Play()
                   _Il1IlIlI[_1II1lIlI(0x1e4)](not _Il1IlIlI[_1II1lIlI(0x1e3)])
                   end)
                  
                   function _Il1IlIlI.setPanelOpen(_IlIIlIlI, animated)
                   _1111lIlI[_1II1lIlI(0x1d4)] = _IlIIlIlI
                   if animated == nil then animated = (0x1 == 0x1) end
                   local _1l1l1IlI = animated and 0.32 or (0x19 - 0x19)
                   local _1lIllIlI = _IlIIlIlI and (0x19 - 0x19) or -_1IlIlIlI[_1II1lIlI(0x1ad)]
                  
                   _l1lIlIlI[_1II1lIlI(0x36)](_Ill11IlI, _1l1l1IlI, {
                   Position = UDim2[_1II1lIlI(0x17)](_1lIllIlI, _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a)) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x188)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   local _IIIllIlI = (_1111lIlI[_1II1lIlI(0x1d3)] == _1II1lIlI(0x1e8) and _IlIIlIlI) and _1IlIlIlI[_1II1lIlI(0x1ad)] or (0x19 - 0x19)
                   _l1lIlIlI[_1II1lIlI(0x36)](_1lI11IlI, _1l1l1IlI, {
                   Position = UDim2[_1II1lIlI(0x17)](_IIIllIlI, _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_IIIllIlI, (0x2a / 0x2a),
                   -(_1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a) + _1IlIlIlI[_1II1lIlI(0x1ae)])) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x188)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                  
                   if _1111lIlI[_1II1lIlI(0x1d3)] == _1II1lIlI(0x1e8) then
                   _llI11IlI[_1II1lIlI(0x101)] = not _IlIIlIlI
                   else
                   _llI11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   end
                   end
                  
                   function _Il1IlIlI.setLayout(_1I1lIIlI)
                   _1111lIlI[_1II1lIlI(0x1d3)] = _1I1lIIlI
                   if _1I1lIIlI == _1II1lIlI(0x1c) then
                   _I11I1IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _llI11IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _1111lIlI[_1II1lIlI(0x1d4)] = (0x0 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)](-_1IlIlIlI[_1II1lIlI(0x1ad)], _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a))
                   _1lI11IlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a))
                   _1lI11IlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(_1IlIlIlI[_1II1lIlI(0x19c)] + (0x2a / 0x2a) + _1IlIlIlI[_1II1lIlI(0x1ae)]))
                   local _1lIllIlI = _Il1IlIlI[_1II1lIlI(0x1e3)] and _1IlIlIlI[_1II1lIlI(0x1a3)] or _1IlIlIlI[_1II1lIlI(0x1e5)]
                   _I11I1IlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x17)](_1lIllIlI, (((0x40 - 0x0) / 0x8)))
                   _I11I1IlI[_1II1lIlI(0x16a)] = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -_1lIllIlI - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x19c)] - (((0x80 - 0x0) / 0x8)))
                   else
                   _I11I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   _Ill11IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _Il1IlIlI[_1II1lIlI(0x1b3)]((0x1 == 0x1), (0x1 == 0x1))
                   end
                   if _1111lIlI[_1II1lIlI(0x1d5)] then
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x180)] then _l1IlIIlI[_1II1lIlI(0x180)][_1II1lIlI(0x101)] = (_l1IlIIlI == _1111lIlI[_1II1lIlI(0x1d5)]) end
                   end
                   end
                   end
                  
                   do
                   local _1IIllIlI, _l1IllIlI, _I1IllIlI
                   _1l1I1IlI[_1II1lIlI(0xeb)]:Connect(function(_lIllIIlI)
                   if _lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   or _lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then
                   _1IIllIlI = (0x1 == 0x1)
                   _l1IllIlI = _lIllIIlI[_1II1lIlI(0x56)]
                   _I1IllIlI = _11II1IlI[_1II1lIlI(0x56)]
                   end
                   end)
                   _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x51)]:Connect(function(_lIllIIlI)
                   if _1IIllIlI and (_lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x53)]
                   or _lIllIIlI[_1II1lIlI(0x52)] == Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)]) then
                   local _ll1IlIlI = _lIllIIlI[_1II1lIlI(0x56)] - _l1IllIlI
                   _11II1IlI[_1II1lIlI(0x56)] = UDim2[_1II1lIlI(0x2f)](
                   _I1IllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x60)], _I1IllIlI[_1II1lIlI(0x57)][_1II1lIlI(0x61)] + _ll1IlIlI[_1II1lIlI(0x57)],
                   _I1IllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x60)], _I1IllIlI[_1II1lIlI(0x5c)][_1II1lIlI(0x61)] + _ll1IlIlI[_1II1lIlI(0x5c)])
                   end
                   end))
                   _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x58)]:Connect(function(_lIllIIlI)
                   if not _1IIllIlI then return end
                   if _lIllIIlI[_1II1lIlI(0x52)] ~= Enum[_1II1lIlI(0x52)][_1II1lIlI(0x59)]
                   and _lIllIIlI[_1II1lIlI(0x52)] ~= Enum[_1II1lIlI(0x52)][_1II1lIlI(0x54)] then return end
                   _1IIllIlI = (0x0 == 0x1)
                   _Il1IlIlI[_1II1lIlI(0x194)] = _11II1IlI[_1II1lIlI(0x56)]
                   local _11IllIlI = _IIlIlIlI[_1II1lIlI(0x1ea)]
                   local _ll1llIlI = _11II1IlI[_1II1lIlI(0x103)]
                   local _Il1llIlI = _11II1IlI[_1II1lIlI(0x102)]
                   local _1l1llIlI = _1IlIlIlI[_1II1lIlI(0x1eb)]
                   local _lI1llIlI, _II1llIlI = _Il1llIlI[_1II1lIlI(0x57)], _Il1llIlI[_1II1lIlI(0x5c)]
                   local _1I1llIlI = (0x0 == 0x1)
                   if _Il1llIlI[_1II1lIlI(0x57)] < _1l1llIlI then _lI1llIlI = (0x19 - 0x19); _1I1llIlI = (0x1 == 0x1)
                   elseif _Il1llIlI[_1II1lIlI(0x57)] + _ll1llIlI[_1II1lIlI(0x57)] > _11IllIlI[_1II1lIlI(0x57)] - _1l1llIlI then _lI1llIlI = _11IllIlI[_1II1lIlI(0x57)] - _ll1llIlI[_1II1lIlI(0x57)]; _1I1llIlI = (0x1 == 0x1) end
                   if _Il1llIlI[_1II1lIlI(0x5c)] < _1l1llIlI then _II1llIlI = (0x19 - 0x19); _1I1llIlI = (0x1 == 0x1)
                   elseif _Il1llIlI[_1II1lIlI(0x5c)] + _ll1llIlI[_1II1lIlI(0x5c)] > _11IllIlI[_1II1lIlI(0x5c)] - _1l1llIlI then _II1llIlI = _11IllIlI[_1II1lIlI(0x5c)] - _ll1llIlI[_1II1lIlI(0x5c)]; _1I1llIlI = (0x1 == 0x1) end
                   if _1I1llIlI then
                   _l1lIlIlI[_1II1lIlI(0x36)](_11II1IlI, 0.2, { Position = UDim2[_1II1lIlI(0x17)](_lI1llIlI, _II1llIlI) },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x38)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   task[_1II1lIlI(0x104)](0.21, function() _Il1IlIlI[_1II1lIlI(0x194)] = _11II1IlI[_1II1lIlI(0x56)] end)
                   end
                   end))
                   end
                  
                   local _l11llIlI = {}
                   local _I11llIlI = (0x0 == 0x1)
                  
                   local function _111llIlI()
                   for _l1IIlIlI, _llIIlIlI in ipairs(_1IlIlIlI[_1II1lIlI(0x1ec)]) do
                   if not _l11llIlI[_llIIlIlI] then return (0x0 == 0x1) end
                   end
                   return (0x1 == 0x1)
                   end
                  
                   _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0xeb)]:Connect(function(_lIllIIlI, _IIllIIlI)
                   if _IIllIIlI then return end
                   if _1lllIIlI[_1II1lIlI(0xea)] then return end
                  
                   _l11llIlI[_lIllIIlI[_1II1lIlI(0x13)]] = (0x1 == 0x1)
                  
                   if not _I11llIlI and _111llIlI() then
                   _I11llIlI = (0x1 == 0x1)
                   _Il1IlIlI[_1II1lIlI(0x1dc)]()
                   return
                   end
                  
                   if _lIllIIlI[_1II1lIlI(0x13)] == _1IlIlIlI[_1II1lIlI(0x1ed)] and _1111lIlI[_1II1lIlI(0x1d3)] == _1II1lIlI(0x1e8) then
                   _Il1IlIlI[_1II1lIlI(0x1b3)](not _1111lIlI[_1II1lIlI(0x1d4)], (0x1 == 0x1))
                   return
                   end
                   end))
                  
                   _l1lIlIlI[_1II1lIlI(0x4e)](_1I1IlIlI[_1II1lIlI(0x58)]:Connect(function(_lIllIIlI)
                   _l11llIlI[_lIllIIlI[_1II1lIlI(0x13)]] = nil
                   if not _111llIlI() then
                   _I11llIlI = (0x0 == 0x1)
                   end
                   end))
                  
                   task[_1II1lIlI(0x15a)](function()
                   local _lllIIIlI = _lI1IlIlI[_1II1lIlI(0x7e)][_1II1lIlI(0x7a)]()
                   if _lllIIIlI then
                   _lI1I1IlI[_1II1lIlI(0x1cf)] = _lllIIIlI
                   _Il1I1IlI[_1II1lIlI(0x1cf)] = _lllIIIlI
                   else
                   _lI1I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1)
                   end
                   end)
                  
                   _1I11lIlI:SetReapplyCallback(function()
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] then
                   _l11I1IlI[_1II1lIlI(0xf6)] = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)]
                   end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] then
                   for _l1IIlIlI, _I11IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x16d)]) do
                   if _I11IlIlI[_1II1lIlI(0x1ee)] and _I11IlIlI[_1II1lIlI(0x1ee)][_1II1lIlI(0x30)] then _I11IlIlI[_1II1lIlI(0x1ef)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)]) end
                   end
                   end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] and _1111lIlI[_1II1lIlI(0x1d5)] then
                   _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x1f0)][_1II1lIlI(0xfe)] = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)]
                   if _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x1f1)] then
                   _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x1f1)][_1II1lIlI(0xfe)] = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)]
                   end
                   if _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x1f2)] then
                   _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x1f2)][_1II1lIlI(0xf6)] = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)]
                   end
                   end
                   for _l1IIlIlI, _l1IlIIlI in ipairs(_1111lIlI[_1II1lIlI(0x169)]) do
                   if _l1IlIIlI[_1II1lIlI(0x1f3)] and _l1IlIIlI[_1II1lIlI(0x1f3)][_1II1lIlI(0x30)] and _l1IlIIlI[_1II1lIlI(0x1f4)] then _l1IlIIlI[_1II1lIlI(0x1f4)]() end
                   end
                  
                   local _lllIlIlI = {}
                   for _l1IIlIlI, _l1lI1IlI in ipairs(_1111lIlI[_1II1lIlI(0x12c)]) do
                   if _l1lI1IlI[_1II1lIlI(0x1f5)] and _l1lI1IlI[_1II1lIlI(0x1f5)][_1II1lIlI(0x30)] then
                   local _I1IIlIlI = _l1lI1IlI[_1II1lIlI(0x1f5)]:FindFirstChildOfClass(_1II1lIlI(0x3c))
                   if _I1IIlIlI then _I1IIlIlI[_1II1lIlI(0x1f6)] = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8)))
                   else _l1lIlIlI[_1II1lIlI(0x3b)](_l1lI1IlI[_1II1lIlI(0x1f5)], _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8))) end
                   if _l1lI1IlI[_1II1lIlI(0x1f7)] and _l1lI1IlI[_1II1lIlI(0x1f7)][_1II1lIlI(0x30)] then
                   local _IllIlIlI = _l1lI1IlI[_1II1lIlI(0x1f7)]:FindFirstChildOfClass(_1II1lIlI(0x3c))
                   if _IllIlIlI then _IllIlIlI[_1II1lIlI(0x1f6)] = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8)))
                   else _l1lIlIlI[_1II1lIlI(0x3b)](_l1lI1IlI[_1II1lIlI(0x1f7)], _1IlIlIlI[_1II1lIlI(0x3d)] + (((0x10 - 0x0) / 0x8))) end
                   end
                   table[_1II1lIlI(0x4f)](_lllIlIlI, _l1lI1IlI)
                   end
                   end
                   _1111lIlI[_1II1lIlI(0x12c)] = _lllIlIlI
                  
                   _Il1IlIlI[_1II1lIlI(0x1cb)](_1I11lIlI[_1II1lIlI(0xd7)])
                   end)
                  end
                  
                  function _Il1IlIlI.createTab(_1lI1IIlI)
                   local _1llIlIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Name = tostring(_1lI1IIlI) .. _1II1lIlI(0x1f9),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x280 - 0x0) / 0x8)), _1IlIlIlI[_1II1lIlI(0x19c)] - (((0x80 - 0x0) / 0x8))),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x191)), BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19), AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x133)], Text = tostring(_1lI1IIlI),
                   TextSize = (((0x70 - 0x0) / 0x8)), TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)), Parent = _Il1IlIlI[_1II1lIlI(0x1a2)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1llIlIlI, (_1IlIlIlI[_1II1lIlI(0x19c)] - (((0x80 - 0x0) / 0x8))) / (((0x10 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x45)](_1llIlIlI, 1.05)
                   _l1lIlIlI[_1II1lIlI(0x49)](_1llIlIlI)
                  
                   local _1llIIIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Name = tostring(_1lI1IIlI) .. _1II1lIlI(0x1fa),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x1fb)]),
                   BackgroundColor3 = _1I11lIlI:Get(_1II1lIlI(0x135)),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Text = _1II1lIlI(0x21), Parent = _Il1IlIlI[_1II1lIlI(0x1b5)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1llIIIlI, (((0x40 - 0x0) / 0x8)))
                  
                   local _lIlIlIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Name = _1II1lIlI(0x1fc), AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x19 - 0x19), 0.5),
                   Position = UDim2[_1II1lIlI(0x17)]((((0x20 - 0x0) / 0x8)), _1IlIlIlI[_1II1lIlI(0x1fb)] / (((0x10 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x18 - 0x0) / 0x8)), (0x2a / 0x2a), -(((0x70 - 0x0) / 0x8))),
                   BackgroundColor3 = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] or _1I11lIlI:Get(_1II1lIlI(0x14e)),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19), Parent = _1llIIIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_lIlIlIlI, (((0x10 - 0x0) / 0x8)))
                  
                   local _IIlIlIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x70 - 0x0) / 0x8)), (0x19 - 0x19)), Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x70 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x133)],
                   Text = tostring(_1lI1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1I11lIlI:Get(_1II1lIlI(0x131)),
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _1llIIIlI })
                  
                   _1llIIIlI[_1II1lIlI(0x47)]:Connect(function()
                   if _1111lIlI[_1II1lIlI(0x1d5)] ~= _1IlIlIlI then
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llIIIlI, 0.15, { BackgroundTransparency = 0.6 })
                   end
                   end)
                   _1llIIIlI[_1II1lIlI(0x48)]:Connect(function()
                   if _1111lIlI[_1II1lIlI(0x1d5)] ~= _1IlIlIlI then
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llIIIlI, 0.15, { BackgroundTransparency = (0x2a / 0x2a) })
                   end
                   end)
                  
                   local _11l1IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x1a1), {
                   Name = _1II1lIlI(0x1fd) .. tostring(_1lI1IIlI),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), BorderSizePixel = (0x19 - 0x19),
                   ScrollBarThickness = (((0x20 - 0x0) / 0x8)),
                   ScrollBarImageColor3 = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] or _1I11lIlI:Get(_1II1lIlI(0x14e)),
                   CanvasSize = UDim2[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_1II1lIlI(0xf2)][_1II1lIlI(0x5c)],
                   Visible = (0x0 == 0x1), Parent = _Il1IlIlI[_1II1lIlI(0x1bf)] })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf7), {
                   PaddingLeft = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))), PaddingRight = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   PaddingTop = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x20 - 0x0) / 0x8))), PaddingBottom = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   Parent = _11l1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x119), {
                   FillDirection = Enum[_1II1lIlI(0x11a)][_1II1lIlI(0x11b)],
                   HorizontalAlignment = Enum[_1II1lIlI(0x10f)][_1II1lIlI(0x134)],
                   SortOrder = Enum[_1II1lIlI(0x11e)][_1II1lIlI(0x11f)],
                   Padding = UDim[_1II1lIlI(0x2f)]((0x19 - 0x19), _1IlIlIlI[_1II1lIlI(0x1fe)]), Parent = _11l1IIlI })
                  
                   local _1IlIlIlI = _lIlI1IlI[_1II1lIlI(0x184)](_11l1IIlI, (0x19 - 0x19))
                   _1IlIlIlI[_1II1lIlI(0x1ff)] = _1lI1IIlI
                   _1IlIlIlI[_1II1lIlI(0x1f0)] = _1llIlIlI
                   _1IlIlIlI[_1II1lIlI(0x200)] = _1llIIIlI
                   _1IlIlIlI[_1II1lIlI(0x1f2)] = _lIlIlIlI
                   _1IlIlIlI[_1II1lIlI(0x1f1)] = _IIlIlIlI
                  
                   _1IlIlIlI[_1II1lIlI(0x201)] = function(_11I1IIlI)
                   local _lIll1IlI = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] or _1I11lIlI:Get(_1II1lIlI(0x14e))
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llIlIlI, 0.18, {
                   BackgroundTransparency = _11I1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _11I1IIlI and _1I11lIlI:Get(_1II1lIlI(0x135)) or _1I11lIlI:Get(_1II1lIlI(0x191)),
                   TextColor3 = _11I1IIlI and _lIll1IlI or _1I11lIlI:Get(_1II1lIlI(0x131)) })
                   _l1lIlIlI[_1II1lIlI(0x36)](_1llIIIlI, 0.2, {
                   BackgroundTransparency = _11I1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _11I1IIlI and _1I11lIlI:Get(_1II1lIlI(0x135)) or _1I11lIlI:Get(_1II1lIlI(0x191)) })
                   _l1lIlIlI[_1II1lIlI(0x36)](_IIlIlIlI, 0.2, {
                   TextColor3 = _11I1IIlI and _lIll1IlI or _1I11lIlI:Get(_1II1lIlI(0x131)) })
                   _l1lIlIlI[_1II1lIlI(0x36)](_lIlIlIlI, 0.22, {
                   BackgroundTransparency = _11I1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _lIll1IlI },
                   Enum[_1II1lIlI(0x37)][_1II1lIlI(0x4c)], Enum[_1II1lIlI(0x39)][_1II1lIlI(0x3a)])
                   end
                  
                   _1IlIlIlI[_1II1lIlI(0x202)] = function()
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x180)] then _l1IlIIlI[_1II1lIlI(0x180)][_1II1lIlI(0x101)] = (_l1IlIIlI == _1111lIlI[_1II1lIlI(0x1d5)]) end
                   end
                   end
                  
                   local function _l1lIlIlI()
                   if _1111lIlI[_1II1lIlI(0x1d5)] == _1IlIlIlI then return end
                   if _1111lIlI[_1II1lIlI(0x1d5)] then _1111lIlI[_1II1lIlI(0x1d5)][_1II1lIlI(0x201)]((0x0 == 0x1)) end
                   _1111lIlI[_1II1lIlI(0x1d5)] = _1IlIlIlI
                   _1IlIlIlI[_1II1lIlI(0x201)]((0x1 == 0x1))
                   _1IlIlIlI[_1II1lIlI(0x202)]()
                   _l1llIIlI[_1II1lIlI(0x106)]()
                   end
                  
                   _1llIlIlI[_1II1lIlI(0x139)]:Connect(_l1lIlIlI)
                   _1llIIIlI[_1II1lIlI(0x139)]:Connect(_l1lIlIlI)
                  
                   _1111lIlI[_1II1lIlI(0x1d6)][_1lI1IIlI] = _1IlIlIlI
                   return _1IlIlIlI
                  end
                  
                  function _lI1IlIlI.Cleanup()
                   if _1111lIlI[_1II1lIlI(0x203)] then return end
                   _1111lIlI[_1II1lIlI(0x203)] = (0x1 == 0x1)
                  
                   pcall(function() _1l1IlIlI[_1II1lIlI(0x204)]() end)
                  
                   pcall(function()
                   if _lI1IlIlI[_1II1lIlI(0x205)] and _lI1IlIlI[_1II1lIlI(0x205)][_1II1lIlI(0x206)] then
                   _lI1IlIlI[_1II1lIlI(0x205)][_1II1lIlI(0x206)]((0x0 == 0x1))
                   end
                   end)
                  
                   local _I1lIlIlI = _lIlIlIlI[_1II1lIlI(0x207)] and _lIlIlIlI[_1II1lIlI(0x207)]:FindFirstChildOfClass(_1II1lIlI(0x208))
                   if _I1lIlIlI then
                   pcall(function()
                   _I1lIlIlI[_1II1lIlI(0x209)] = (((0x80 - 0x0) / 0x8))
                   _I1lIlIlI[_1II1lIlI(0x20a)] = (0x1 == 0x1)
                   _I1lIlIlI[_1II1lIlI(0x20b)] = (((0x190 - 0x0) / 0x8))
                   end)
                   end
                  
                   pcall(_l1lIlIlI[_1II1lIlI(0x50)])
                   if _1111lIlI[_1II1lIlI(0x18e)] then pcall(function() _1111lIlI[_1II1lIlI(0x18e)]:Destroy() end) end
                   pcall(function() _Il1IlIlI[_1II1lIlI(0x10a)]:Destroy() end)
                   pcall(function() _lI1IlIlI[_1II1lIlI(0x10e)]:Destroy() end)
                   pcall(function() _lI1IlIlI[_1II1lIlI(0x13b)]:Destroy() end)
                   for _l1IIlIlI, _I11IlIlI in ipairs(_II1IlIlI) do pcall(function() _I11IlIlI:Destroy() end) end
                   print(_1II1lIlI(0x20c))
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0xee)] = _Il1IlIlI
                  
                  
                  _ll1IlIlI = {}
                  
                  function _ll1IlIlI.SetSpeed(_IlIIlIlI)
                   _1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x20f)] = _IlIIlIlI
                   local _I1lIlIlI = _lIlIlIlI[_1II1lIlI(0x207)] and _lIlIlIlI[_1II1lIlI(0x207)]:FindFirstChildOfClass(_1II1lIlI(0x208))
                   if _I1lIlIlI then _I1lIlIlI[_1II1lIlI(0x209)] = _IlIIlIlI end
                  end
                  
                  function _ll1IlIlI.SetJump(_IlIIlIlI)
                   _1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x211)] = _IlIIlIlI
                   local _I1lIlIlI = _lIlIlIlI[_1II1lIlI(0x207)] and _lIlIlIlI[_1II1lIlI(0x207)]:FindFirstChildOfClass(_1II1lIlI(0x208))
                   if _I1lIlIlI then
                   _I1lIlIlI[_1II1lIlI(0x20a)] = (0x1 == 0x1)
                   _I1lIlIlI[_1II1lIlI(0x20b)] = _IlIIlIlI
                   end
                  end
                  
                  function _ll1IlIlI.applyThemeCustoms(_1lI1IIlI)
                   local _IlllIIlI = _II11lIlI[_1lI1IIlI]
                   if not _IlllIIlI then return end
                   local _llllIIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_1IlIlIlI[_1II1lIlI(0xdf)]) or Color3[_1II1lIlI(0x22)]((((0x500 - 0x0) / 0x8)), (((0x100 - 0x0) / 0x8)), (((0x780 - 0x0) / 0x8)))
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] = _IlllIIlI[_1II1lIlI(0xe2)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] = _IlllIIlI[_1II1lIlI(0xe4)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] = _IlllIIlI[_1II1lIlI(0xe6)] or _llllIIlI
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] = _IlllIIlI[_1II1lIlI(0xe8)] or _llllIIlI
                   _ll1IlIlI[_1II1lIlI(0x213)]()
                  end
                  
                  function _ll1IlIlI.refreshCustoms()
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] then
                   for _l1IIlIlI, _I11IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x16d)]) do
                   if _I11IlIlI[_1II1lIlI(0x1ee)] and _I11IlIlI[_1II1lIlI(0x1ee)][_1II1lIlI(0x30)] then _I11IlIlI[_1II1lIlI(0x1ef)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)]) end
                   end
                   end
                   for _l1IIlIlI, _l1IlIIlI in ipairs(_1111lIlI[_1II1lIlI(0x169)]) do
                   if _l1IlIIlI[_1II1lIlI(0x1f3)] and _l1IlIIlI[_1II1lIlI(0x1f3)][_1II1lIlI(0x30)] and _l1IlIIlI[_1II1lIlI(0x1f4)] then _l1IlIIlI[_1II1lIlI(0x1f4)]() end
                   end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] then
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x201)] then _l1IlIIlI[_1II1lIlI(0x201)](_1111lIlI[_1II1lIlI(0x1d5)] == _l1IlIIlI) end
                   end
                   end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] and _Il1IlIlI[_1II1lIlI(0x1a0)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x1a0)], 0.28, { BackgroundColor3 = _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] })
                   end
                  end
                  
                  do
                   local _11lIlIlI, _llIIlIlI, _IlIIlIlI, _1lIIlIlI, _lIIIlIlI = (0x0 == 0x1), nil, nil, nil, (((0x190 - 0x0) / 0x8))
                   local function _IIIIlIlI()
                   local _1IIIlIlI = _lIlIlIlI[_1II1lIlI(0x207)] and _lIlIlIlI[_1II1lIlI(0x207)]:FindFirstChild(_1II1lIlI(0x214))
                   if not _1IIIlIlI then return end
                   _11lIlIlI = (0x1 == 0x1)
                   _llIIlIlI = Instance[_1II1lIlI(0x2f)](_1II1lIlI(0x215))
                   _llIIlIlI[_1II1lIlI(0x216)] = Vector3[_1II1lIlI(0x2f)](9e9, 9e9, 9e9)
                   _llIIlIlI[_1II1lIlI(0x217)] = Vector3[_1II1lIlI(0x218)]
                   _llIIlIlI[_1II1lIlI(0x30)] = _1IIIlIlI
                   _IlIIlIlI = Instance[_1II1lIlI(0x2f)](_1II1lIlI(0x219))
                   _IlIIlIlI[_1II1lIlI(0x21a)] = Vector3[_1II1lIlI(0x2f)](9e9, 9e9, 9e9)
                   _IlIIlIlI[_1II1lIlI(0x21b)] = (((0x1f40 - 0x0) / 0x8))
                   _IlIIlIlI[_1II1lIlI(0x30)] = _1IIIlIlI
                   _1lIIlIlI = _l11IlIlI[_1II1lIlI(0x21c)]:Connect(function()
                   if not _11lIlIlI then return end
                   local _l1IIlIlI = Vector3[_1II1lIlI(0x218)]
                   local _I1IIlIlI = _IIlIlIlI[_1II1lIlI(0x21d)]
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x21e)]) then _l1IIlIlI += _I1IIlIlI[_1II1lIlI(0x21f)] end
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x220)]) then _l1IIlIlI -= _I1IIlIlI[_1II1lIlI(0x21f)] end
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x221)]) then _l1IIlIlI -= _I1IIlIlI[_1II1lIlI(0x222)] end
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x223)]) then _l1IIlIlI += _I1IIlIlI[_1II1lIlI(0x222)] end
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x224)]) then _l1IIlIlI += Vector3[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)) end
                   if _1I1IlIlI:IsKeyDown(Enum[_1II1lIlI(0x13)][_1II1lIlI(0x225)]) then _l1IIlIlI -= Vector3[_1II1lIlI(0x2f)]((0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)) end
                   _llIIlIlI[_1II1lIlI(0x217)] = _l1IIlIlI[_1II1lIlI(0x226)] > (0x19 - 0x19) and _l1IIlIlI[_1II1lIlI(0x227)] * _lIIIlIlI or Vector3[_1II1lIlI(0x218)]
                   _IlIIlIlI[_1II1lIlI(0x21d)] = _I1IIlIlI
                   end)
                   end
                   local function _11IIlIlI()
                   _11lIlIlI = (0x0 == 0x1)
                   if _1lIIlIlI then _1lIIlIlI:Disconnect() end
                   if _llIIlIlI then _llIIlIlI:Destroy() end
                   if _IlIIlIlI then _IlIIlIlI:Destroy() end
                   end
                   function _ll1IlIlI.SetFly(_I111IIlI) if _I111IIlI then _IIIIlIlI() else _11IIlIlI() end end
                   function _ll1IlIlI.SetFlySpeed(_IlIIlIlI) _lIIIlIlI = _IlIIlIlI end
                  end
                  
                  _lIlIlIlI[_1II1lIlI(0x229)]:Connect(function()
                   task[_1II1lIlI(0x152)](0.6)
                   if _1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x211)] then _ll1IlIlI[_1II1lIlI(0x210)](_1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x211)]) end
                   if _1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x20f)] then _ll1IlIlI[_1II1lIlI(0x20d)](_1111lIlI[_1II1lIlI(0x20e)][_1II1lIlI(0x20f)]) end
                  end)
                  
                  function _ll1IlIlI.setBackgroundMode(_1I1lIIlI)
                   _1I11lIlI[_1II1lIlI(0x22b)] = _1I1lIIlI
                   local _Il1I1IlI = _Il1IlIlI[_1II1lIlI(0x199)]
                   if _1I1lIIlI == _1II1lIlI(0x22c) then
                   _Il1I1IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _Il1I1IlI[_1II1lIlI(0x12f)] = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1I1IlI, 0.3, { ImageTransparency = 0.94 })
                   elseif _1I1lIIlI == _1II1lIlI(0x22d) then
                   _Il1I1IlI[_1II1lIlI(0x101)] = (0x1 == 0x1)
                   _Il1I1IlI[_1II1lIlI(0x12f)] = Color3[_1II1lIlI(0x22)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1I1IlI, 0.3, { ImageTransparency = 0.92 })
                   else
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1I1IlI, 0.25, { ImageTransparency = (0x2a / 0x2a) })
                   task[_1II1lIlI(0x104)](0.25, function() _Il1I1IlI[_1II1lIlI(0x101)] = (0x0 == 0x1) end)
                   end
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x205)] = _ll1IlIlI
                  
                  _Il1IlIlI[_1II1lIlI(0x18c)]()
                  
                  local _ll1IlIlI = _Il1IlIlI[_1II1lIlI(0x1f8)](_1II1lIlI(0xef))
                  local _Il1IlIlI = _Il1IlIlI[_1II1lIlI(0x1f8)](_1II1lIlI(0x22e))
                  local _1l1IlIlI = _Il1IlIlI[_1II1lIlI(0x1f8)](_1II1lIlI(0xde))
                  
                  local _lI1IlIlI = _ll1IlIlI:CreateSection(_1II1lIlI(0x22f))
                  _lI1IlIlI:CreateToggle(_1II1lIlI(0x230), {
                   _I1I1IIlI = (0x0 == 0x1),
                   callback = function(_I111IIlI) _ll1IlIlI[_1II1lIlI(0x206)](_I111IIlI) end })
                  _lI1IlIlI:CreateSlider(_1II1lIlI(0x231), {
                   _Illl1IlI = (((0x50 - 0x0) / 0x8)), _1lll1IlI = (((0x960 - 0x0) / 0x8)), _I1I1IIlI = (((0x190 - 0x0) / 0x8)),
                   callback = function(_IlIIlIlI) _ll1IlIlI[_1II1lIlI(0x228)](_IlIIlIlI) end })
                  _lI1IlIlI:CreateSlider(_1II1lIlI(0x232), {
                   _Illl1IlI = (((0x80 - 0x0) / 0x8)), _1lll1IlI = (((0x640 - 0x0) / 0x8)), _I1I1IIlI = (((0x80 - 0x0) / 0x8)),
                   callback = function(_IlIIlIlI) _ll1IlIlI[_1II1lIlI(0x20d)](_IlIIlIlI) end })
                  _lI1IlIlI:CreateInput(_1II1lIlI(0x233), {
                   _I1I1IIlI = (((0x80 - 0x0) / 0x8)), _Illl1IlI = (0x2a / 0x2a), _1lll1IlI = (((0xfa0 - 0x0) / 0x8)), integer = (0x1 == 0x1),
                   callback = function(_IlIIlIlI) _ll1IlIlI[_1II1lIlI(0x20d)](_IlIIlIlI) end })
                  _lI1IlIlI:CreateInput(_1II1lIlI(0x234), {
                   _I1I1IIlI = (((0x190 - 0x0) / 0x8)), _Illl1IlI = (0x2a / 0x2a), _1lll1IlI = (((0xfa0 - 0x0) / 0x8)), integer = (0x1 == 0x1),
                   callback = function(_IlIIlIlI) _ll1IlIlI[_1II1lIlI(0x210)](_IlIIlIlI) end })
                  
                  local _II1IlIlI = _ll1IlIlI:CreateSection(_1II1lIlI(0x235))
                  local _1I1IlIlI = _II1IlIlI:CreateDropdown(_1II1lIlI(0x236), { _I1I1IIlI = (0x0 == 0x1) })
                  _1I1IlIlI:CreateToggle(_1II1lIlI(0x237), { _I1I1IIlI = (0x0 == 0x1), callback = function() end })
                  _1I1IlIlI:CreateSlider(_1II1lIlI(0x238), { _Illl1IlI = (((0x40 - 0x0) / 0x8)), _1lll1IlI = (((0xc0 - 0x0) / 0x8)), _I1I1IIlI = (((0x70 - 0x0) / 0x8)), callback = function() end })
                  _1I1IlIlI:CreateInput(_1II1lIlI(0x239), { _I1I1IIlI = (((0xfa0 - 0x0) / 0x8)), _Illl1IlI = (((0x190 - 0x0) / 0x8)), _1lll1IlI = (((0x9c40 - 0x0) / 0x8)), integer = (0x1 == 0x1) })
                  
                  local _l11IlIlI = _Il1IlIlI:CreateSection(_1II1lIlI(0x23a))
                  _l11IlIlI:CreateToggle(_1II1lIlI(0x23b), {
                   _I1I1IIlI = (0x0 == 0x1),
                   callback = function(_I111IIlI)
                   _1I11lIlI:Apply(_I111IIlI and _1II1lIlI(0x23c) or _1II1lIlI(0x23d))
                   if _1I11lIlI[_1II1lIlI(0x22b)] ~= _1II1lIlI(0xd5) then _ll1IlIlI[_1II1lIlI(0x22a)](_1I11lIlI[_1II1lIlI(0x22b)]) end
                   _lI1IlIlI[_1II1lIlI(0x120)]({ _I11lIIlI = (_I111IIlI and _1II1lIlI(0x23c) or _1II1lIlI(0x23d)) .. _1II1lIlI(0x23e), _111lIIlI = (((0x10 - 0x0) / 0x8)) })
                   end })
                  _l11IlIlI:CreateToggle(_1II1lIlI(0x23f), {
                   _I1I1IIlI = (0x1 == 0x1),
                   callback = function(_I111IIlI) _Il1IlIlI[_1II1lIlI(0x1e4)](_I111IIlI) end })
                  
                  local _I11IlIlI = _Il1IlIlI:CreateSection(_1II1lIlI(0x240))
                  _I11IlIlI:CreateToggle(_1II1lIlI(0x241), {
                   _I1I1IIlI = (0x0 == 0x1),
                   callback = function(_I111IIlI)
                   _Il1IlIlI[_1II1lIlI(0x1e9)](_I111IIlI and _1II1lIlI(0x1e8) or _1II1lIlI(0x1c))
                   _lI1IlIlI[_1II1lIlI(0x120)]({ _I11lIIlI = _1II1lIlI(0x242) .. (_I111IIlI and _1II1lIlI(0x1e8) or _1II1lIlI(0x1c)), _111lIIlI = (((0x10 - 0x0) / 0x8)) })
                   end })
                  _I11IlIlI:CreateSlider(_1II1lIlI(0x243), {
                   _Illl1IlI = (((0xf0 - 0x0) / 0x8)), _1lll1IlI = (((0x320 - 0x0) / 0x8)), _I1I1IIlI = (((0x320 - 0x0) / 0x8)),
                   callback = function(_IlIIlIlI) _Il1IlIlI[_1II1lIlI(0xef)][_1II1lIlI(0x105)] = (0x2a / 0x2a) - _IlIIlIlI / (((0x320 - 0x0) / 0x8)) end })
                  _I11IlIlI:CreateSlider(_1II1lIlI(0x244), {
                   _Illl1IlI = (((0x230 - 0x0) / 0x8)), _1lll1IlI = (((0x410 - 0x0) / 0x8)), _I1I1IIlI = (((0x320 - 0x0) / 0x8)),
                   callback = function(_IlIIlIlI)
                   _Il1IlIlI[_1II1lIlI(0x193)] = _IlIIlIlI / (((0x320 - 0x0) / 0x8))
                   if _Il1IlIlI[_1II1lIlI(0x192)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x192)], 0.15, { Scale = _Il1IlIlI[_1II1lIlI(0x193)] })
                   end
                   end })
                  
                  local _111IlIlI = _Il1IlIlI:CreateSection(_1II1lIlI(0x13d))
                  _111IlIlI:CreateToggle(_1II1lIlI(0x245), {
                   _I1I1IIlI = (0x0 == 0x1),
                   callback = function(_I111IIlI)
                   _lI1IlIlI[_1II1lIlI(0x159)](_I111IIlI)
                   _lI1IlIlI[_1II1lIlI(0x120)]({ _I11lIIlI = _1II1lIlI(0x246) .. (_I111IIlI and _1II1lIlI(0x247) or _1II1lIlI(0x248)), _111lIIlI = (((0x10 - 0x0) / 0x8)) })
                   end })
                  
                  local _lll1lIlI = _Il1IlIlI:CreateSection(_1II1lIlI(0x249))
                  _lll1lIlI:CreateColorPicker(_1II1lIlI(0x24a), {
                   _I1I1IIlI = _1IlIlIlI[_1II1lIlI(0xdf)],
                   callback = function(_I1IIlIlI)
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] = _I1IIlIlI
                   for _l1IIlIlI, _I11IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x16d)]) do
                   if _I11IlIlI[_1II1lIlI(0x1ee)] and _I11IlIlI[_1II1lIlI(0x1ee)][_1II1lIlI(0x30)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_I11IlIlI[_1II1lIlI(0x1ee)], 0.2, { BackgroundColor3 = _I1IIlIlI })
                   _l1lIlIlI[_1II1lIlI(0x36)](_I11IlIlI[_1II1lIlI(0x24b)], 0.2, { TextColor3 = _I1IIlIlI })
                   end
                   end
                   end })
                  _lll1lIlI:CreateColorPicker(_1II1lIlI(0x24c), {
                   _I1I1IIlI = _1IlIlIlI[_1II1lIlI(0xdf)],
                   callback = function(_I1IIlIlI)
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] = _I1IIlIlI
                   for _l1IIlIlI, _l1IlIIlI in pairs(_1111lIlI[_1II1lIlI(0x1d6)]) do
                   if _l1IlIIlI[_1II1lIlI(0x201)] then _l1IlIIlI[_1II1lIlI(0x201)](_1111lIlI[_1II1lIlI(0x1d5)] == _l1IlIIlI) end
                   end
                   end })
                  _lll1lIlI:CreateColorPicker(_1II1lIlI(0x24d), {
                   _I1I1IIlI = _1IlIlIlI[_1II1lIlI(0xdf)],
                   callback = function(_I1IIlIlI)
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] = _I1IIlIlI
                   for _l1IIlIlI, _l1IlIIlI in ipairs(_1111lIlI[_1II1lIlI(0x169)]) do
                   if _l1IlIIlI[_1II1lIlI(0x1f3)] and _l1IlIIlI[_1II1lIlI(0x1f3)][_1II1lIlI(0x30)] and _l1IlIIlI[_1II1lIlI(0x1f4)] then _l1IlIIlI[_1II1lIlI(0x1f4)]() end
                   end
                   end })
                  _lll1lIlI:CreateColorPicker(_1II1lIlI(0x24e), {
                   _I1I1IIlI = _1IlIlIlI[_1II1lIlI(0xdf)],
                   callback = function(_I1IIlIlI)
                   _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] = _I1IIlIlI
                   if _Il1IlIlI[_1II1lIlI(0x1a0)] then
                   _l1lIlIlI[_1II1lIlI(0x36)](_Il1IlIlI[_1II1lIlI(0x1a0)], 0.2, { BackgroundColor3 = _I1IIlIlI })
                   end
                   end })
                  
                  _1l1IlIlI:CreateSection(_1II1lIlI(0x24f))
                  
                  local function _Ill1lIlI(_1lI1IIlI, _lll1lIlI, _1ll1lIlI)
                   local _III1IIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x31), {
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x180 - 0x0) / 0x8))),
                   BackgroundColor3 = _lll1lIlI[_1II1lIlI(0xf4)], BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1), Text = _1II1lIlI(0x21),
                   LayoutOrder = _1l1IlIlI:nextOrder(), Parent = _1l1IlIlI[_1II1lIlI(0x180)] })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_III1IIlI, (((0x40 - 0x0) / 0x8)))
                   _l1lIlIlI[_1II1lIlI(0x3e)](_III1IIlI, _lll1lIlI[_1II1lIlI(0xf5)], (0x2a / 0x2a), 0.5)
                   _l1lIlIlI[_1II1lIlI(0x45)](_III1IIlI, 1.02)
                   _l1lIlIlI[_1II1lIlI(0x49)](_III1IIlI)
                  
                   local _lIl1lIlI = { _lll1lIlI[_1II1lIlI(0x191)], _lll1lIlI[_1II1lIlI(0x135)], _lll1lIlI[_1II1lIlI(0x14e)], _lll1lIlI[_1II1lIlI(0x163)] }
                   for _11IIlIlI, _IIl1lIlI in ipairs(_lIl1lIlI) do
                   local _1Il1lIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf0), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)) + (_11IIlIlI - (0x2a / 0x2a)) * (((0xb0 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x90 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   BackgroundColor3 = _IIl1lIlI, BorderSizePixel = (0x19 - 0x19), Parent = _III1IIlI })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_1Il1lIlI, (((0x20 - 0x0) / 0x8)))
                   end
                  
                   _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0xf8), {
                   Position = UDim2[_1II1lIlI(0x17)]((((0x50 - 0x0) / 0x8)) + (((0x20 - 0x0) / 0x8)) * (((0xb0 - 0x0) / 0x8)) + (((0x40 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x50 - 0x0) / 0x8)) - (((0x20 - 0x0) / 0x8)) * (((0xb0 - 0x0) / 0x8)) - (((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a), Font = Enum[_1II1lIlI(0xf9)][_1II1lIlI(0x130)],
                   Text = _1lI1IIlI, TextSize = (((0x70 - 0x0) / 0x8)), TextColor3 = _lll1lIlI[_1II1lIlI(0xfb)],
                   TextXAlignment = Enum[_1II1lIlI(0xfc)][_1II1lIlI(0xfd)], Parent = _III1IIlI })
                  
                   if _lll1lIlI[_1II1lIlI(0x1cc)] then
                   local _l1l1lIlI = _l1lIlIlI[_1II1lIlI(0x2e)](_1II1lIlI(0x12d), {
                   AnchorPoint = Vector2[_1II1lIlI(0x2f)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_1II1lIlI(0x2f)]((0x2a / 0x2a), -(((0x60 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_1II1lIlI(0x17)]((((0x1e0 - 0x0) / 0x8)), (((0x110 - 0x0) / 0x8))),
                   BackgroundTransparency = 0.2,
                   BackgroundColor3 = _lll1lIlI[_1II1lIlI(0x135)],
                   Image = _1II1lIlI(0x21),
                   ScaleType = Enum[_1II1lIlI(0x197)][_1II1lIlI(0x250)],
                   Parent = _III1IIlI,
                   })
                   _l1lIlIlI[_1II1lIlI(0x3b)](_l1l1lIlI, (((0x30 - 0x0) / 0x8)))
                   task[_1II1lIlI(0x15a)](function()
                   local _I1111IlI = _lI1IlIlI[_1II1lIlI(0x7e)][_1II1lIlI(0x76)](_lll1lIlI[_1II1lIlI(0x1cc)], _1II1lIlI(0x251) .. _1lI1IIlI)
                   if _I1111IlI then _l1l1lIlI[_1II1lIlI(0x1cf)] = _I1111IlI end
                   end)
                   end
                  
                   _III1IIlI[_1II1lIlI(0x139)]:Connect(function()
                   _1ll1lIlI()
                   _1l1IlIlI[_1II1lIlI(0x166)]()
                   end)
                  end
                  
                  _Ill1lIlI(_1II1lIlI(0x252), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x23d)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x23d))
                   _1I11lIlI:Apply(_1II1lIlI(0x23d)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x254), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x23c)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x23c))
                   _1I11lIlI:Apply(_1II1lIlI(0x23c)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x255), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x256)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x256))
                   _1I11lIlI:Apply(_1II1lIlI(0x256)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0x22c))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x257), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x258)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x258))
                   _1I11lIlI:Apply(_1II1lIlI(0x258)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0x22d))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x259), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x259)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x259))
                   _1I11lIlI:Apply(_1II1lIlI(0x259)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x25a), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x25a)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x25a))
                   _1I11lIlI:Apply(_1II1lIlI(0x25a)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x25b), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x25b)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x25b))
                   _1I11lIlI:Apply(_1II1lIlI(0x25b)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x25c), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x25d)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x25d))
                   _1I11lIlI:Apply(_1II1lIlI(0x25d)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  _Ill1lIlI(_1II1lIlI(0x25e), _1I11lIlI[_1II1lIlI(0x253)][_1II1lIlI(0x12)], function()
                   _ll1IlIlI[_1II1lIlI(0x212)](_1II1lIlI(0x12))
                   _1I11lIlI:Apply(_1II1lIlI(0x12)); _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  end)
                  
                  _1111lIlI[_1II1lIlI(0x1d5)] = _ll1IlIlI
                  _ll1IlIlI[_1II1lIlI(0x201)]((0x1 == 0x1))
                  _ll1IlIlI[_1II1lIlI(0x202)]()
                  
                  
                  
                  
                  
                  
                  
                  _1l1IlIlI[_1II1lIlI(0x25f)] = (0x0 == 0x1)
                  _1l1IlIlI[_1II1lIlI(0x260)] = (0x0 == 0x1)
                  
                  function _1l1IlIlI.available()
                   return _1ll1lIlI and _lIl1lIlI and _IIl1lIlI
                   and type(isfolder) == _1II1lIlI(0x6a) and type(makefolder) == _1II1lIlI(0x6a)
                  end
                  
                  function _1l1IlIlI.ensureDir()
                   if not _1l1IlIlI[_1II1lIlI(0x261)]() then return (0x0 == 0x1) end
                   if not isfolder(_1IlIlIlI[_1II1lIlI(0x68)]) then
                   local _llI1lIlI = pcall(makefolder, _1IlIlIlI[_1II1lIlI(0x68)])
                   if not _llI1lIlI then return (0x0 == 0x1) end
                   end
                   return (0x1 == 0x1)
                  end
                  
                  function _1l1IlIlI.collect()
                   local _lII1lIlI = { _v = (0x2a / 0x2a) }
                   for _l1IIlIlI, _l1IlIIlI in ipairs(_1111lIlI[_1II1lIlI(0x169)]) do
                   if _l1IlIIlI[_1II1lIlI(0x1ff)] and _l1IlIIlI[_1II1lIlI(0x264)] then _lII1lIlI[_1II1lIlI(0x265) .. _l1IlIIlI[_1II1lIlI(0x1ff)]] = _l1IlIIlI[_1II1lIlI(0x264)]() end
                   end
                   for _l1IIlIlI, _I11IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x16d)]) do
                   if _I11IlIlI[_1II1lIlI(0x1ff)] and _I11IlIlI[_1II1lIlI(0x264)] then _lII1lIlI[_1II1lIlI(0x266) .. _I11IlIlI[_1II1lIlI(0x1ff)]] = _I11IlIlI[_1II1lIlI(0x264)]() end
                   end
                   for _l1IIlIlI, _11IIlIlI in ipairs(_1111lIlI[_1II1lIlI(0x176)]) do
                   if _11IIlIlI[_1II1lIlI(0x1ff)] and _11IIlIlI[_1II1lIlI(0x264)] then _lII1lIlI[_1II1lIlI(0x267) .. _11IIlIlI[_1II1lIlI(0x1ff)]] = _11IIlIlI[_1II1lIlI(0x264)]() end
                   end
                   for _l1IIlIlI, _llIIlIlI in ipairs(_1111lIlI[_1II1lIlI(0x179)]) do
                   if _llIIlIlI[_1II1lIlI(0x1ff)] and _llIIlIlI[_1II1lIlI(0x264)] then
                   local _llll1IlI = _llIIlIlI[_1II1lIlI(0x264)]()
                   if _llll1IlI then _lII1lIlI[_1II1lIlI(0x268) .. _llIIlIlI[_1II1lIlI(0x1ff)]] = _llll1IlI[_1II1lIlI(0x168)] end
                   end
                   end
                   _lII1lIlI[_1II1lIlI(0x269)] = _1I11lIlI[_1II1lIlI(0xd7)]
                   _lII1lIlI[_1II1lIlI(0x26a)] = _1111lIlI[_1II1lIlI(0x1d3)]
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] then _lII1lIlI[_1II1lIlI(0x26b)] = _l1lIlIlI[_1II1lIlI(0x23)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)]) end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] then _lII1lIlI[_1II1lIlI(0x26c)] = _l1lIlIlI[_1II1lIlI(0x23)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)]) end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] then _lII1lIlI[_1II1lIlI(0x26d)] = _l1lIlIlI[_1II1lIlI(0x23)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)]) end
                   if _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] then _lII1lIlI[_1II1lIlI(0x26e)] = _l1lIlIlI[_1II1lIlI(0x23)](_1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)]) end
                   return _lII1lIlI
                  end
                  
                  function _1l1IlIlI.apply(_lII1lIlI)
                   if type(_lII1lIlI) ~= _1II1lIlI(0x6d) then return end
                   _1l1IlIlI[_1II1lIlI(0x25f)] = (0x1 == 0x1)
                  
                   for _l1IIlIlI, _l1IlIIlI in ipairs(_1111lIlI[_1II1lIlI(0x169)]) do
                   if _l1IlIIlI[_1II1lIlI(0x1ff)] and _l1IlIIlI[_1II1lIlI(0x270)] then
                   local _IlIIlIlI = _lII1lIlI[_1II1lIlI(0x265) .. _l1IlIIlI[_1II1lIlI(0x1ff)]]
                   if _IlIIlIlI ~= nil then pcall(_l1IlIIlI[_1II1lIlI(0x270)], _IlIIlIlI) end
                   end
                   end
                   for _l1IIlIlI, _I11IlIlI in ipairs(_1111lIlI[_1II1lIlI(0x16d)]) do
                   if _I11IlIlI[_1II1lIlI(0x1ff)] and _I11IlIlI[_1II1lIlI(0x270)] then
                   local _IlIIlIlI = _lII1lIlI[_1II1lIlI(0x266) .. _I11IlIlI[_1II1lIlI(0x1ff)]]
                   if _IlIIlIlI ~= nil then pcall(_I11IlIlI[_1II1lIlI(0x270)], _IlIIlIlI) end
                   end
                   end
                   for _l1IIlIlI, _11IIlIlI in ipairs(_1111lIlI[_1II1lIlI(0x176)]) do
                   if _11IIlIlI[_1II1lIlI(0x1ff)] and _11IIlIlI[_1II1lIlI(0x270)] then
                   local _IlIIlIlI = _lII1lIlI[_1II1lIlI(0x267) .. _11IIlIlI[_1II1lIlI(0x1ff)]]
                   if _IlIIlIlI ~= nil then pcall(_11IIlIlI[_1II1lIlI(0x270)], _IlIIlIlI) end
                   end
                   end
                   for _l1IIlIlI, _llIIlIlI in ipairs(_1111lIlI[_1II1lIlI(0x179)]) do
                   if _llIIlIlI[_1II1lIlI(0x1ff)] and _llIIlIlI[_1II1lIlI(0x270)] then
                   local _1lI1IIlI = _lII1lIlI[_1II1lIlI(0x268) .. _llIIlIlI[_1II1lIlI(0x1ff)]]
                   if type(_1lI1IIlI) == _1II1lIlI(0x2b) then
                   local _I1l1lIlI = Enum[_1II1lIlI(0x13)][_1lI1IIlI]
                   if _I1l1lIlI then pcall(_llIIlIlI[_1II1lIlI(0x270)], _I1l1lIlI) end
                   end
                   end
                   end
                  
                   if type(_lII1lIlI[_1II1lIlI(0x269)]) == _1II1lIlI(0x2b) and _II11lIlI[_lII1lIlI[_1II1lIlI(0x269)]] then
                   pcall(_ll1IlIlI[_1II1lIlI(0x212)], _lII1lIlI[_1II1lIlI(0x269)])
                   pcall(_1I11lIlI[_1II1lIlI(0x271)], _1I11lIlI, _lII1lIlI[_1II1lIlI(0x269)])
                   if _lII1lIlI[_1II1lIlI(0x269)] == _1II1lIlI(0x256) then
                   pcall(_ll1IlIlI[_1II1lIlI(0x22a)], _1II1lIlI(0x22c))
                   elseif _lII1lIlI[_1II1lIlI(0x269)] == _1II1lIlI(0x258) then
                   pcall(_ll1IlIlI[_1II1lIlI(0x22a)], _1II1lIlI(0x22d))
                   else
                   pcall(_ll1IlIlI[_1II1lIlI(0x22a)], _1II1lIlI(0xd5))
                   end
                   pcall(_Il1IlIlI[_1II1lIlI(0x1cb)], _lII1lIlI[_1II1lIlI(0x269)])
                   end
                  
                   if type(_lII1lIlI[_1II1lIlI(0x26b)]) == _1II1lIlI(0x2b) then
                   local _I1IIlIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_lII1lIlI[_1II1lIlI(0x26b)]); if _I1IIlIlI then _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe1)] = _I1IIlIlI end
                   end
                   if type(_lII1lIlI[_1II1lIlI(0x26c)]) == _1II1lIlI(0x2b) then
                   local _I1IIlIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_lII1lIlI[_1II1lIlI(0x26c)]); if _I1IIlIlI then _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe3)] = _I1IIlIlI end
                   end
                   if type(_lII1lIlI[_1II1lIlI(0x26d)]) == _1II1lIlI(0x2b) then
                   local _I1IIlIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_lII1lIlI[_1II1lIlI(0x26d)]); if _I1IIlIlI then _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe5)] = _I1IIlIlI end
                   end
                   if type(_lII1lIlI[_1II1lIlI(0x26e)]) == _1II1lIlI(0x2b) then
                   local _I1IIlIlI = _l1lIlIlI[_1II1lIlI(0x2a)](_lII1lIlI[_1II1lIlI(0x26e)]); if _I1IIlIlI then _1111lIlI[_1II1lIlI(0xe0)][_1II1lIlI(0xe7)] = _I1IIlIlI end
                   end
                  
                   pcall(_ll1IlIlI[_1II1lIlI(0x213)])
                  
                   if _lII1lIlI[_1II1lIlI(0x26a)] == _1II1lIlI(0x1e8) or _lII1lIlI[_1II1lIlI(0x26a)] == _1II1lIlI(0x1c) then
                   pcall(_Il1IlIlI[_1II1lIlI(0x1e9)], _lII1lIlI[_1II1lIlI(0x26a)])
                   end
                  
                   _1l1IlIlI[_1II1lIlI(0x25f)] = (0x0 == 0x1)
                  end
                  
                  function _1l1IlIlI.save()
                   if not _1l1IlIlI[_1II1lIlI(0x261)]() then return end
                   if not _1l1IlIlI[_1II1lIlI(0x262)]() then return end
                   local _llI1lIlI, _11l1lIlI = pcall(function()
                   return _11IIlIlI:JSONEncode(_1l1IlIlI[_1II1lIlI(0x263)]())
                   end)
                   if not _llI1lIlI or type(_11l1lIlI) ~= _1II1lIlI(0x2b) then return end
                   pcall(writefile, _1IlIlIlI[_1II1lIlI(0x272)], _11l1lIlI)
                  end
                  
                  function _1l1IlIlI.load()
                   if not _1l1IlIlI[_1II1lIlI(0x261)]() then return end
                   if not pcall(isfile, _1IlIlIlI[_1II1lIlI(0x272)]) then return end
                   if not isfile(_1IlIlIlI[_1II1lIlI(0x272)]) then return end
                   local _llI1lIlI, _IlllIIlI = pcall(readfile, _1IlIlIlI[_1II1lIlI(0x272)])
                   if not _llI1lIlI or type(_IlllIIlI) ~= _1II1lIlI(0x2b) or #_IlllIIlI < (((0x10 - 0x0) / 0x8)) then return end
                   local _Il11lIlI, _llI1lIlI = pcall(function()
                   return _11IIlIlI:JSONDecode(_IlllIIlI)
                   end)
                   if _Il11lIlI and type(_llI1lIlI) == _1II1lIlI(0x6d) then
                   pcall(_1l1IlIlI[_1II1lIlI(0x26f)], _llI1lIlI)
                   end
                  end
                  
                  function _1l1IlIlI.queue()
                   if _1l1IlIlI[_1II1lIlI(0x25f)] then return end
                   if _1l1IlIlI[_1II1lIlI(0x260)] then return end
                   _1l1IlIlI[_1II1lIlI(0x260)] = (0x1 == 0x1)
                   task[_1II1lIlI(0x104)](0.4, function()
                   _1l1IlIlI[_1II1lIlI(0x260)] = (0x0 == 0x1)
                   _1l1IlIlI[_1II1lIlI(0x204)]()
                   end)
                  end
                  
                  _lI1IlIlI[_1II1lIlI(0x273)] = _1l1IlIlI
                  
                  
                  _ll1IlIlI[_1II1lIlI(0x212)](_1IlIlIlI[_1II1lIlI(0xd4)])
                  _Il1IlIlI[_1II1lIlI(0x1cb)](_1IlIlIlI[_1II1lIlI(0xd4)])
                  _ll1IlIlI[_1II1lIlI(0x22a)](_1II1lIlI(0xd5))
                  
                  
                  _1l1IlIlI[_1II1lIlI(0x76)]()
                  
                  
                  
                  _Il1IlIlI[_1II1lIlI(0x1be)]:GetPropertyChangedSignal(_1II1lIlI(0x100)):Connect(function()
                   local _IlI1lIlI = _Il1IlIlI[_1II1lIlI(0x1be)][_1II1lIlI(0x100)]:lower():gsub(_1II1lIlI(0x274), _1II1lIlI(0x21))
                   local _1lI1lIlI = _1111lIlI[_1II1lIlI(0x1d5)]
                   if not _1lI1lIlI or not _1lI1lIlI[_1II1lIlI(0x180)] then return end
                   for _l1IIlIlI, _lII1lIlI in ipairs(_1lI1lIlI[_1II1lIlI(0x180)]:GetChildren()) do
                   if _lII1lIlI:IsA(_1II1lIlI(0xf0)) and _lII1lIlI[_1II1lIlI(0x168)]:match(_1II1lIlI(0x275)) then
                   local _ll1IIIlI = _lII1lIlI:FindFirstChildOfClass(_1II1lIlI(0xf8))
                   local _l1lI1IlI = _ll1IIIlI and _ll1IIIlI[_1II1lIlI(0x100)]:lower():gsub(_1II1lIlI(0x274), _1II1lIlI(0x21)) or _1II1lIlI(0x21)
                   _lII1lIlI[_1II1lIlI(0x101)] = (_IlI1lIlI == _1II1lIlI(0x21) or _l1lI1IlI:find(_IlI1lIlI, (0x2a / 0x2a), (0x1 == 0x1)))
                   end
                   end
                  end)
                  
                  pcall(function()
                   getgenv()[_1II1lIlI(0xe)] = _1111lIlI
                   getgenv()[_1II1lIlI(0x276)] = _lI1IlIlI
                   getgenv()[_1II1lIlI(0x277)] = _1l1IlIlI
                  end)
                  
                  task[_1II1lIlI(0x104)](0.5, function()
                   _lI1IlIlI[_1II1lIlI(0x120)]({ _I11lIIlI = _1II1lIlI(0x278), _111lIIlI = (((0x28 - 0x0) / 0x8)) })
                  end)
                  
                   print(_1II1lIlI(0x279))
                  end, function(_III1lIlI)
                   return tostring(_III1lIlI) .. _1II1lIlI(0x27a) .. debug[_1II1lIlI(0x27b)]()
                  end)
                  
                  if not _l1IIlIlI then
                   warn(_1II1lIlI(0x27c) .. tostring(_I1IIlIlI))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  else
                   print(_1II1lIlI(0x27d))
                  end
                end
                _ll11lIlI = nil
              else
                break
              end
            end
      end)
    end, {})
  end
end)()

_II1llI_()
