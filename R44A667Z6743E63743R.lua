-- Obfuscated By Razer
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
            local _1IIIlIlI = { 0x6c,0xe0,0x55,0x92,0x35 }
            local _IIIIlIlI = {
              [0x1] = { 0xc0,0x57,0xba,0xf7,0xa3,0xbf,0x45,0xc7,0x8,0x9e,0xcf,0x45 },
              [0x2] = { 0xc1,0x53,0xba,0x4,0x7e,0xda,0x50,0xca,0x6,0x88,0xd1,0x52,0xcb,0xfb,0x98,0xd1 },
              [0x3] = { 0xbe,0x55,0xc3,0xe5,0x9a,0xde,0x56,0xbe,0xf5,0x9a },
              [0x4] = { 0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x53 },
              [0x5] = { 0xbf,0x4f,0xca,0x0,0x99,0xbf,0x45,0xc7,0x8,0x9e,0xcf,0x45 },
              [0x6] = { 0xbf,0x54,0xb6,0x6,0xa8 },
              [0x7] = { 0xb8,0x49,0xbc,0xfa,0xa9,0xd5,0x4e,0xbc },
              [0x8] = { 0xaf,0x4f,0xc7,0xf7,0x7c,0xe1,0x49 },
              [0x9] = { 0xb8,0x4f,0xb8,0xf3,0xa1,0xbc,0x4c,0xb6,0xb,0x9a,0xde },
              [0xa] = { 0xaf,0x55,0xc7,0x4,0x9a,0xda,0x54,0x98,0xf3,0xa2,0xd1,0x52,0xb6 },
              [0xb] = { 0xaf,0x2f,0xa3,0xd8,0x7e,0xb3 },
              [0xc] = { 0xbe,0x41,0xcf,0xf7,0xa7 },
              [0xd] = { 0xa1,0xe,0x89 },
              [0xe] = { 0xd4,0x54,0xc9,0x2,0xa8,0xa6,0xf,0x84,0xf8,0x9e,0xd8,0x45,0xc8,0xc0,0x98,0xcd,0x54,0xb7,0x1,0xad,0x9a,0x4d,0xc4,0xf7,0x64,0xa4,0x5a,0xc2,0xfc,0x68,0xdf,0xe,0xc5,0x0,0x9c },
              [0xf] = { 0xde,0x42,0xcd,0xf3,0xa8,0xdf,0x45,0xc9,0xfb,0x99,0xa6,0xf,0x84,0xc8,0x65,0x9f,0x14,0x8b,0xca,0x69,0xa5,0x13,0x85 },
              [0x10] = { 0xb8,0x49,0xbc,0xfa,0xa9 },
              [0x11] = { 0xb7,0x45,0xce,0xd5,0xa4,0xd0,0x45 },
              [0x12] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xbf,0x48,0xbe,0xf8,0xa9 },
              [0x13] = { 0xbe,0x45,0xc9,0x7,0xa7,0xda },
              [0x14] = { 0xb8,0x45,0xbb,0x6,0x77,0xde,0x41,0xb8,0xfd,0x9a,0xe0 },
              [0x15] = { 0xd2,0x52,0xc4,0xff,0x84,0xd2,0x46,0xc8,0xf7,0xa9 },
              [0x16] = { 0xde,0x42,0xcd,0xf3,0xa8,0xdf,0x45,0xc9,0xfb,0x99,0xa6,0xf,0x84,0xcb,0x6e,0x9c,0x19,0x8c,0xc9,0x67,0xa5,0x14,0x86,0xc5,0x6b,0x9c,0x17 },
              [0x17] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xae,0x4f,0xc9,0x6,0xa4,0xd9,0x23,0xc4,0x4,0xa3,0xd1,0x52,0xa3,0x1,0xa9,0xd5,0x46,0xbe,0xf5,0x96,0xe0,0x49,0xc4,0x0 },
              [0x18] = { 0x8f,0x21,0x85,0xc4,0x65,0xb2,0x10 },
              [0x19] = { 0xc0,0x4f,0xc5,0xd5,0xa4,0xd8,0x55,0xc2,0x0 },
              [0x1a] = { 0xcb,0x44,0xc7,0xf3,0x9c },
              [0x1b] = { 0xd4,0x45,0xcd },
              [0x1c] = { 0x8f },
              [0x1d] = {  },
              [0x1e] = { 0xd2,0x52,0xc4,0xff,0x87,0xb3,0x22 },
              [0x1f] = { 0xe0,0x4f,0x9d,0xf7,0xad },
              [0x20] = { 0xd2,0x4f,0xc7,0xff,0x96,0xe0 },
              [0x21] = { 0x8f,0x5,0x85,0xc4,0x8d,0x91,0x10,0x87,0xea,0x5a,0x9c,0x12,0xad },
              [0x22] = { 0xd2,0x4c,0xc4,0x1,0xa7 },
              [0x23] = { 0xbe },
              [0x24] = { 0xb3 },
              [0x25] = { 0xae },
              [0x26] = { 0xdc,0x41,0xc7,0x5,0x9a,0xb4,0x45,0xcd },
              [0x27] = { 0xdf,0x54,0xc7,0xfb,0xa3,0xd3 },
              [0x28] = { 0x91,0x53 },
              [0x29] = { 0xca,0x5,0xcd,0xbd,0x59 },
              [0x2a] = { 0xcf,0x52,0xba,0xf3,0xa9,0xd1 },
              [0x2b] = { 0xda,0x45,0xcc },
              [0x2c] = { 0xbc,0x41,0xc7,0xf7,0xa3,0xe0 },
              [0x2d] = { 0xc0,0x45,0xcd,0x6,0x77,0xe1,0x54,0xc9,0x1,0xa3 },
              [0x2e] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda },
              [0x2f] = { 0xbf,0x4f,0xca,0x0,0x99 },
              [0x30] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11,0x99,0x1,0xac,0xda },
              [0x31] = { 0xdc,0x4c,0xb6,0xb },
              [0x32] = { 0xe0,0x57,0xba,0xf7,0xa3 },
              [0x33] = { 0xb1,0x41,0xc8,0xfb,0xa3,0xd3,0x33,0xc9,0xb,0xa1,0xd1 },
              [0x34] = { 0xbd,0x55,0xb6,0x4,0xa9 },
              [0x35] = { 0xb1,0x41,0xc8,0xfb,0xa3,0xd3,0x24,0xbe,0x4,0x9a,0xcf,0x54,0xbe,0x1,0xa3 },
              [0x36] = { 0xbb,0x55,0xc9 },
              [0x37] = { 0xcf,0x4f,0xc7,0x0,0x9a,0xde },
              [0x38] = { 0xc1,0x29,0x98,0x1,0xa7,0xda,0x45,0xc7 },
              [0x39] = { 0xbe,0x41,0xb9,0xfb,0xaa,0xdf },
              [0x3a] = { 0xdf,0x54,0xc7,0x1,0xa0,0xd1 },
              [0x3b] = { 0xc0,0x48,0xba,0xff,0x9a,0xdf },
              [0x3c] = { 0xce,0x4f,0xc7,0xf6,0x9a,0xde },
              [0x3d] = { 0xc1,0x29,0xa8,0x6,0xa7,0xdb,0x4b,0xba },
              [0x3e] = { 0xad,0x50,0xc5,0xfe,0xae,0xbf,0x54,0xc7,0x1,0xa0,0xd1,0x2d,0xc4,0xf6,0x9a },
              [0x3f] = { 0xae,0x4f,0xc7,0xf6,0x9a,0xde },
              [0x40] = { 0xcf,0x4c,0xb6,0xff,0xa5 },
              [0x41] = { 0xd9,0x41,0xcd },
              [0x42] = { 0xd9,0x49,0xc3 },
              [0x43] = { 0xaf,0x4f,0xc3,0x0,0x9a,0xcf,0x54,0xbe,0x1,0xa3,0xdf },
              [0x44] = { 0xe0,0x52,0xb6,0xf5,0xa0 },
              [0x45] = { 0xd5,0x4e,0xc8,0xf7,0xa7,0xe0 },
              [0x46] = { 0xd0,0x49,0xc8,0xf5,0xa4,0xda,0x4e,0xba,0xf5,0xa9,0xad,0x4c,0xc1 },
              [0x47] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xaf,0x48,0xb6,0x0,0x9c,0xd1,0x44 },
              [0x48] = { 0xc1,0x53,0xba,0x4,0x7e,0xda,0x50,0xca,0x6,0x89,0xe5,0x50,0xba },
              [0x49] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb9,0x4f,0xcb,0xf7,0xa2,0xd1,0x4e,0xc9 },
              [0x4a] = { 0xc0,0x4f,0xca,0xf5,0x9d },
              [0x4b] = { 0xe1,0x50,0xb9,0xf3,0xa9,0xd1 },
              [0x4c] = { 0xbc,0x4f,0xc8,0xfb,0xa9,0xd5,0x4f,0xc3 },
              [0x4d] = { 0xc4 },
              [0x4e] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xb1,0x4e,0xb9,0xf7,0x99 },
              [0x4f] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11 },
              [0x50] = { 0xd2,0x49,0xc3,0xfb,0xa8,0xd4 },
              [0x51] = { 0xc1,0x54,0xbe,0xfe,0xa8 },
              [0x52] = { 0xaf,0x4c,0xbe,0xf5,0xa0,0xbf,0x4f,0xca,0x0,0x99,0xb5,0x44 },
              [0x53] = { 0xbf,0x4f,0xca,0x0,0x99,0xb5,0x44 },
              [0x54] = { 0xc2,0x4f,0xc1,0x7,0xa2,0xd1 },
              [0x55] = { 0xaf,0x4c,0xbe,0xf5,0xa0,0xc2,0x4f,0xc1,0x7,0xa2,0xd1 },
              [0x56] = { 0xc0,0x49,0xc2,0xf7,0x85,0xdb,0x53,0xbe,0x6,0x9e,0xdb,0x4e },
              [0x57] = { 0xad,0x53,0xc8,0xf7,0xa9,0xb2,0x4f,0xc1,0xf6,0x9a,0xde },
              [0x58] = { 0x9b,0x41,0xc8,0x5,0x9a,0xe0,0x53 },
              [0x59] = { 0xd2,0x55,0xc3,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0x5a] = { 0xde,0x45,0xc6,0x7,0x9a,0xdf,0x54 },
              [0x5b] = { 0xb3,0x25,0xa9 },
              [0x5c] = { 0xe0,0x41,0xb7,0xfe,0x9a },
              [0x5d] = { 0xae,0x4f,0xb9,0xb },
              [0x5e] = { 0xb4,0x54,0xc9,0x2,0x7c,0xd1,0x54 },
              [0x5f] = { 0xdc,0x4e,0xbc },
              [0x60] = { 0xd6,0x50,0xbc },
              [0x61] = { 0xd3,0x49,0xbb },
              [0x62] = { 0xbe,0x29,0x9b,0xd8 },
              [0x63] = { 0xc3,0x25,0x97,0xe2 },
              [0x64] = { 0xe3,0x45,0xb7,0x2 },
              [0x65] = { 0xd8,0x4f,0xb6,0xf6 },
              [0x66] = { 0x9b },
              [0x67] = { 0x9a },
              [0x68] = { 0xa8 },
              [0x69] = { 0xd3,0x45,0xc9,0xde,0xa4,0xd3,0x4f },
              [0x6a] = { 0xb8,0x4f,0xbc,0x1,0x8a,0xbe,0x2c },
              [0x6b] = { 0xd8,0x4f,0xbc,0x1 },
              [0x6c] = { 0xb8,0x4f,0xbc,0x1,0x7b,0xcd,0x4c,0xc1,0xf4,0x96,0xcf,0x4b },
              [0x6d] = { 0xad,0x53,0xc8,0xf7,0xa9,0xb8,0x4f,0xb6,0xf6,0x9a,0xde },
              [0x6e] = { 0x8f,0x26,0x8a,0xd8,0x6a,0xb2,0x21 },
              [0x6f] = { 0x8f,0x26,0x9b,0xd8,0x7b,0xb2,0x26 },
              [0x70] = { 0x8f,0x25,0x89,0xd7,0x69,0xb1,0x25 },
              [0x71] = { 0x8f,0x10,0x85,0xd3,0x76,0xb0,0x12 },
              [0x72] = { 0x8f,0x11,0x89,0xc3,0x69,0x9d,0x19 },
              [0x73] = { 0x8f,0x16,0x8e,0xc8,0x6e,0xa3,0x16 },
              [0x74] = { 0x8f,0x24,0x87,0xd6,0x67,0xb0,0x23 },
              [0x75] = { 0x8f,0x10,0x85,0xd5,0x6d,0xa1,0x21 },
              [0x76] = { 0x8f,0x24,0x8c,0xd6,0x6c,0xb1,0x11 },
              [0x77] = { 0x8f,0x24,0x98,0xd6,0x78,0xb1,0x16 },
              [0x78] = { 0x8f,0x24,0x98,0xc5,0x78,0xa0,0x16 },
              [0x79] = { 0x8f,0x13,0x98,0xc5,0x78,0xa0,0x18 },
              [0x7a] = { 0x8f,0x11,0x8b,0xc3,0x6b,0x9d,0x21 },
              [0x7b] = { 0x8f,0x11,0x9a,0xc3,0x7a,0x9e,0x14 },
              [0x7c] = { 0x8f,0x12,0x96,0xc4,0x76,0x9f,0x12 },
              [0x7d] = { 0x8f,0x10,0x85,0xd7,0x6a,0xb2,0x26 },
              [0x7e] = { 0x8f,0x26,0x85,0xd8,0x65,0xb2,0x15 },
              [0x7f] = { 0x8f,0x19,0x86,0xcb,0x66,0xad,0x10 },
              [0x80] = { 0x8f,0x13,0x89,0xc5,0x69,0x9f,0x25 },
              [0x81] = { 0x8f,0x10,0x85,0xd6,0x78,0xa2,0x14 },
              [0x82] = { 0x8f,0x13,0x85,0xc5,0x65,0x9f,0x21 },
              [0x83] = { 0x8f,0x23,0x8d,0xd5,0x6d,0xb0,0x17 },
              [0x84] = { 0x8f,0x12,0x87,0xc4,0x67,0x9e,0x18 },
              [0x85] = { 0x8f,0x26,0x96,0xd8,0x76,0xb2,0x23 },
              [0x86] = { 0x8f,0x10,0x9b,0xc2,0x7b,0x9d,0x14 },
              [0x87] = { 0x8f,0x17,0x96,0xc9,0x76,0xa4,0x18 },
              [0x88] = { 0x8f,0x25,0x89,0xd7,0x69,0xb1,0x23 },
              [0x89] = { 0x8f,0x25,0x8d,0xd7,0x6d,0xb2,0x10 },
              [0x8a] = { 0x8f,0x25,0x9b,0xd7,0x7b,0xb2,0x15 },
              [0x8b] = { 0x8f,0x10,0x99,0xc2,0x79,0x9d,0x12 },
              [0x8c] = { 0x8f,0x11,0x8b,0xc3,0x6b,0x9d,0x23 },
              [0x8d] = { 0x8f,0x11,0x9b,0xc3,0x7b,0x9e,0x17 },
              [0x8e] = { 0x8f,0x18,0x96,0xca,0x76,0xa5,0x18 },
              [0x8f] = { 0x8f,0x12,0x8a,0xc4,0x6a,0x9f,0x10 },
              [0x90] = { 0x8f,0x11,0x96,0xc3,0x76,0x9e,0x12 },
              [0x91] = { 0x8f,0x10,0x85,0xd6,0x6e,0xa3,0x21 },
              [0x92] = { 0x8f,0x26,0x9b,0xc6,0x78,0xa0,0x23 },
              [0x93] = { 0x8f,0x24,0x8e,0xd6,0x6e,0xb1,0x10 },
              [0x94] = { 0xb0,0x45,0xbb,0xf3,0xaa,0xd8,0x54,0xa9,0xfa,0x9a,0xd9,0x45 },
              [0x95] = { 0xda,0x4f,0xc3,0xf7 },
              [0x96] = { 0xde,0x45,0xbc,0xfb,0xa8,0xe0,0x52,0xce },
              [0x97] = { 0xcf,0x55,0xc7,0x4,0x9a,0xda,0x54 },
              [0x98] = { 0xcb,0x52,0xba,0xf3,0xa5,0xdc,0x4c,0xce },
              [0x99] = { 0xd5,0x4e,0xc8,0x6 },
              [0x9a] = { 0xd7,0x45,0xce },
              [0x9b] = { 0xdc,0x52,0xc4,0x2 },
              [0x9c] = { 0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0x9d] = { 0xd0,0x45,0xbb,0xf7,0xa7 },
              [0x9e] = { 0xaf,0x55,0xc8,0x6,0xa4,0xd9 },
              [0x9f] = { 0xdf,0x4c,0xbe,0xf6,0x9a,0xde },
              [0xa0] = { 0xbc,0x55,0xc7,0x2,0xa1,0xd1,0x24,0xba,0xf8,0x96,0xe1,0x4c,0xc9 },
              [0xa1] = { 0xe0,0x41,0xb7 },
              [0xa2] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1 },
              [0xa3] = { 0xe0,0x49,0xc9,0xfe,0x9a },
              [0xa4] = { 0xde,0x45,0xbc,0xfb,0xa8,0xe0,0x45,0xc7,0xf7,0x99 },
              [0xa5] = { 0xcf,0x41,0xc5,0x6,0xaa,0xde,0x49,0xc3,0xf9 },
              [0xa6] = { 0xb5,0x4e,0xc5,0x7,0xa9,0xae,0x45,0xbc,0xf3,0xa3 },
              [0xa7] = { 0xc1,0x4e,0xc0,0x0,0xa4,0xe3,0x4e },
              [0xa8] = { 0xb7,0x45,0xce,0xf4,0x9e,0xda,0x44,0xa8,0xf7,0xa7,0xe2,0x49,0xb8,0xf7 },
              [0xa9] = { 0xbf,0x48,0xba,0xfe,0xa1 },
              [0xaa] = { 0xb9,0x41,0xbe,0x0 },
              [0xab] = { 0xb2,0x52,0xb6,0xff,0x9a },
              [0xac] = { 0xc0,0x4f,0xc4,0xfe,0xa9,0xd5,0x50 },
              [0xad] = { 0xad,0x55,0xc9,0x1,0xa2,0xcd,0x54,0xbe,0xf5,0x88,0xd5,0x5a,0xba },
              [0xae] = { 0xc4,0x39 },
              [0xaf] = { 0xdf,0x55,0xc7,0xf8,0x96,0xcf,0x45 },
              [0xb0] = { 0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99,0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0xb1] = { 0xc1,0x29,0xa5,0xf3,0x99,0xd0,0x49,0xc3,0xf9 },
              [0xb2] = { 0xc0,0x45,0xcd,0x6,0x81,0xcd,0x42,0xba,0xfe },
              [0xb3] = { 0xb2,0x4f,0xc3,0x6 },
              [0xb4] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9 },
              [0xb5] = { 0xe0,0x45,0xcd,0x6 },
              [0xb6] = { 0xc0,0x45,0xcd,0x6,0x8d,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0xb7] = { 0xb8,0x45,0xbb,0x6 },
              [0xb8] = { 0xc0,0x45,0xcd,0x6,0x78,0xdb,0x4c,0xc4,0x4,0x68 },
              [0xb9] = { 0xcd,0x54,0xc9,0xf3,0x98,0xd4 },
              [0xba] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb1,0x4e,0xc9,0xf7,0xa7 },
              [0xbb] = { 0xc0,0x45,0xcd,0x6 },
              [0xbc] = { 0xc2,0x49,0xc8,0xfb,0x97,0xd8,0x45 },
              [0xbd] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe2,0xa4,0xdf,0x49,0xc9,0xfb,0xa4,0xda },
              [0xbe] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe5,0x9e,0xe6,0x45 },
              [0xbf] = { 0xc5 },
              [0xc0] = { 0xb9,0x4f,0xca,0x5,0x9a,0xb8,0x45,0xb6,0x8,0x9a },
              [0xc1] = { 0xd4,0x49,0xb9,0xf7 },
              [0xc2] = { 0xb2,0x4f,0xc1,0xf6,0x9a,0xde },
              [0xc3] = { 0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x27,0xca,0xfb },
              [0xc4] = { 0xbf,0x43,0xc7,0xf7,0x9a,0xda,0x27,0xca,0xfb },
              [0xc5] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xba,0x4f,0xc9,0xfb,0x9b,0xd5,0x43,0xb6,0x6,0x9e,0xdb,0x4e,0xc8 },
              [0xc6] = { 0xc6,0x29,0xc3,0xf6,0x9a,0xe4,0x22,0xba,0xfa,0x96,0xe2,0x49,0xc4,0x4 },
              [0xc7] = { 0xbf,0x49,0xb7,0xfe,0x9e,0xda,0x47 },
              [0xc8] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xb3,0x55,0xbe },
              [0xc9] = { 0xb4,0x4f,0xc7,0xfb,0xaf,0xdb,0x4e,0xc9,0xf3,0xa1,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0xca] = { 0xc2,0x45,0xc7,0x6,0x9e,0xcf,0x41,0xc1,0xd3,0xa1,0xd5,0x47,0xc3,0xff,0x9a,0xda,0x54 },
              [0xcb] = { 0xc0,0x4f,0xc5 },
              [0xcc] = { 0xd8,0x45,0xbb,0x6 },
              [0xcd] = { 0xbe,0x49,0xbc,0xfa,0xa9 },
              [0xce] = { 0xde,0x49,0xbc,0xfa,0xa9 },
              [0xcf] = { 0xae,0x4f,0xc9,0x6,0xa4,0xd9 },
              [0xd0] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xd5,0x43,0xb6,0x6,0x9e,0xdb,0x4e,0xa5,0x1,0xa8,0xd5,0x54,0xbe,0x1,0xa3 },
              [0xd1] = { 0xcd },
              [0xd2] = { 0xdc },
              [0xd3] = { 0xc1,0x29,0xa1,0xfb,0xa8,0xe0,0x2c,0xb6,0xb,0xa4,0xe1,0x54 },
              [0xd4] = { 0xb2,0x49,0xc1,0xfe,0x79,0xd5,0x52,0xba,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0xd5] = { 0xc2,0x45,0xc7,0x6,0x9e,0xcf,0x41,0xc1 },
              [0xd6] = { 0xd4 },
              [0xd7] = { 0xe2 },
              [0xd8] = { 0xbf,0x4f,0xc7,0x6,0x84,0xde,0x44,0xba,0x4 },
              [0xd9] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0,0x2f,0xc7,0xf6,0x9a,0xde },
              [0xda] = { 0xba,0x4f,0xc9,0xfb,0x9b,0xe5 },
              [0xdb] = { 0xd9,0x4f,0xb9,0xf7 },
              [0xdc] = { 0xb8,0x4f,0xbc,0x1,0x76,0xda,0x44,0xa9,0xfb,0xa9,0xd8,0x45 },
              [0xdd] = { 0xc0,0x49,0xc9,0xfe,0x9a },
              [0xde] = { 0xd0,0x55,0xc7,0xf3,0xa9,0xd5,0x4f,0xc3 },
              [0xdf] = { 0xb8,0x4f,0xbc,0x1,0x84,0xda,0x4c,0xce },
              [0xe0] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xbb,0x4e,0xc1,0xb },
              [0xe1] = { 0xdc,0x4f,0xc8,0xfb,0xa9,0xd5,0x4f,0xc3 },
              [0xe2] = { 0xdc,0x52,0xba,0x5,0x9a,0xe0 },
              [0xe3] = { 0xdf },
              [0xe4] = { 0xd2,0x52,0xb6,0xff,0x9a },
              [0xe5] = { 0xda,0x4f,0xc9,0xfb,0x9b,0xae,0x47 },
              [0xe6] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xb8,0x41,0xb7,0xf7,0xa1 },
              [0xe7] = { 0xd5,0x43,0xc4,0x0 },
              [0xe8] = { 0xb5,0x4d,0xb6,0xf9,0x9a,0xaf,0x4f,0xc1,0x1,0xa7,0x9f },
              [0xe9] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9,0x22,0xc4,0xfe,0x99 },
              [0xea] = { 0xdf,0x55,0xb7,0x6,0x9a,0xe4,0x54 },
              [0xeb] = { 0xc0,0x45,0xcd,0x6,0x8e,0xad,0x4c,0xbe,0xf9,0xa3,0xd9,0x45,0xc3,0x6 },
              [0xec] = { 0xb3,0x4f,0xc9,0xfa,0x96,0xd9,0x2d,0xba,0xf6,0x9e,0xe1,0x4d },
              [0xed] = { 0xaf,0x45,0xc3,0x6,0x9a,0xde },
              [0xee] = { 0xdf,0x55,0xc7,0xf8,0x96,0xcf,0x45,0x96,0xfe,0xa9 },
              [0xef] = { 0x43 },
              [0xf0] = { 0xb5,0x4e },
              [0xf1] = { 0xaf,0x4f,0xc2,0x2,0xa1,0xd1,0x54,0xba,0xf6 },
              [0xf2] = { 0xb9,0x4f,0xca,0x5,0x9a,0xae,0x55,0xc9,0x6,0xa4,0xda,0x11,0x98,0xfe,0x9e,0xcf,0x4b },
              [0xf3] = { 0xd0,0x45,0xc1,0xf3,0xae },
              [0xf4] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xbf,0x54,0xb6,0x6,0xa8 },
              [0xf5] = { 0xbf,0x54,0xb6,0x6,0xa8,0xb3,0x55,0xbe },
              [0xf6] = { 0xbf,0x54,0xb6,0x6,0xa8,0xbc,0x41,0xc3,0xf7,0xa1 },
              [0xf7] = { 0xbf,0x34,0x96,0xe6,0x7e,0xbf,0x34,0x9e,0xd5,0x88 },
              [0xf8] = { 0xd2,0x50,0xc8 },
              [0xf9] = { 0xb2,0x30,0xa8 },
              [0xfa] = { 0xa2,0x10 },
              [0xfb] = { 0xdc,0x49,0xc3,0xf9 },
              [0xfc] = { 0xbc,0x49,0xc3,0xf9 },
              [0xfd] = { 0x9c,0x4d,0xc8 },
              [0xfe] = { 0xdc,0x4c,0xb6,0xb,0x9a,0xde,0x53 },
              [0xff] = { 0x9c },
              [0x100] = { 0xd9,0x45,0xc2,0x1,0xa7,0xe5 },
              [0x101] = { 0xb9,0x45,0xc2,0x1,0xa7,0xe5 },
              [0x102] = { 0x9c,0x0,0xa2,0xd4 },
              [0x103] = { 0xe1,0x50,0xc9,0xfb,0xa2,0xd1 },
              [0x104] = { 0xc1,0x50,0xc9,0xfb,0xa2,0xd1 },
              [0x105] = { 0x9c,0x10,0x8f,0xc2,0x65,0xa6,0x10,0x85 },
              [0x106] = { 0xd8,0x41,0xb7,0xf7,0xa1 },
              [0x107] = { 0xd5,0x4e,0xbe,0x6 },
              [0x108] = { 0xcd,0x43,0xb8,0xf7,0xa3,0xe0 },
              [0x109] = { 0xcb,0x44,0xc7,0xf3,0x9c,0xbf,0x54,0xb6,0x6,0xa8 },
              [0x10a] = { 0xdf,0x54,0xb6,0x4,0xa9,0xc4 },
              [0x10b] = { 0xdf,0x54,0xb6,0x4,0xa9,0xc5 },
              [0x10c] = { 0xdf,0x54,0xb6,0x4,0xa9,0xbc,0x4f,0xc8 },
              [0x10d] = { 0xbf,0x43,0xb6,0xfe,0x9a },
              [0x10e] = { 0xbb,0x46,0xbb,0x5,0x9a,0xe0 },
              [0x10f] = { 0xcf,0x4c,0xc4,0xf5,0xa0 },
              [0x110] = { 0xcb,0x46,0xc7,0xf3,0xa2,0xd1,0x23,0xc4,0x7,0xa3,0xe0 },
              [0x111] = { 0xbf,0x54,0xb6,0x6,0xa8,0xbb,0x4e },
              [0x112] = { 0xe3,0x41,0xbe,0x6 },
              [0x113] = { 0xba,0x45,0xc9,0x9,0xa4,0xde,0x4b },
              [0x114] = { 0xbf,0x45,0xc7,0x8,0x9a,0xde,0x33,0xc9,0xf3,0xa9,0xdf,0x29,0xc9,0xf7,0xa2 },
              [0x115] = { 0xb0,0x41,0xc9,0xf3,0x55,0xbc,0x49,0xc3,0xf9 },
              [0x116] = { 0xd9,0x53 },
              [0x117] = { 0x8c,0x2d,0x97 },
              [0x118] = { 0x91,0x10,0x87,0xf6,0x6f,0x91,0x10,0x87,0xf6,0x6f,0x91,0x10,0x87,0xf6 },
              [0x119] = { 0xbf,0x45,0xc9,0xe5,0xa9,0xcd,0x54,0xc8 },
              [0x11a] = { 0xdf,0x50,0xb6,0x9,0xa3 },
              [0x11b] = { 0xbe,0x4f,0xcc },
              [0x11c] = { 0xbe,0x4f,0xcc,0xda,0x9a,0xd5,0x47,0xbd,0x6 },
              [0x11d] = { 0xc0,0x45,0xcd,0x6,0x89,0xde,0x55,0xc3,0xf5,0x96,0xe0,0x45 },
              [0x11e] = { 0xad,0x54,0x9a,0x0,0x99 },
              [0x11f] = { 0xd0,0x45,0xbb,0xf3,0xaa,0xd8,0x54 },
              [0x120] = { 0xcf,0x41,0xc1,0xfe,0x97,0xcd,0x43,0xc0 },
              [0x121] = { 0x80 },
              [0x122] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x2f,0xbb,0xf8 },
              [0x123] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x2f,0xc3 },
              [0x124] = { 0x92 },
              [0x125] = { 0xba,0x41,0xc2,0xf7 },
              [0x126] = { 0xc0,0x4f,0xbc,0xf9,0xa1,0xd1,0x32,0xba,0xf9 },
              [0x127] = { 0xbf,0x49,0xcf,0xf7 },
              [0x128] = { 0xd2,0x52,0xc4,0xff,0x88,0xcf,0x41,0xc1,0xf7 },
              [0x129] = { 0xbf,0x4c,0xbe,0xf6,0x9a,0xde,0x32,0xba,0xf9 },
              [0x12a] = { 0xd5,0x4e,0xc5,0x7,0xa9 },
              [0x12b] = { 0xd5,0x4e,0xc9,0xf7,0x9c,0xd1,0x52 },
              [0x12c] = { 0xc0,0x45,0xcd,0x6,0x77,0xdb,0x58 },
              [0x12d] = { 0xc7,0x3e,0x7a,0xf6,0x5a,0x9a,0x5,0x82,0xef },
              [0x12e] = { 0xd1,0x52,0xc7,0x1,0xa7 },
              [0x12f] = { 0xdf,0x55,0xb8,0xf5,0x9a,0xdf,0x53 },
              [0x130] = { 0xb2,0x4f,0xb8,0x7,0xa8,0xb8,0x4f,0xc8,0x6 },
              [0x131] = { 0xaf,0x55,0xc7,0x5,0xa4,0xde,0x30,0xc4,0x5,0x9e,0xe0,0x49,0xc4,0x0 },
              [0x132] = { 0xd7,0x45,0xce,0xf4,0x9e,0xda,0x44 },
              [0x133] = { 0xbc,0x52,0xba,0x5,0xa8,0x92 },
              [0x134] = { 0xae,0x41,0xb8,0xfd,0xa8,0xdc,0x41,0xb8,0xf7 },
              [0x135] = { 0xcf,0x4f,0xc1,0x1,0xa7,0xbc,0x49,0xb8,0xfd,0x9a,0xde },
              [0x136] = { 0xaf,0x4f,0xc3,0x6,0xa7,0xdb,0x4c,0xc8 },
              [0x137] = { 0xcb,0x4f,0xc7,0xf6 },
              [0x138] = { 0xdf,0x43,0xc7,0x1,0xa1,0xd8 },
              [0x139] = { 0xd5,0x4e,0xb9,0xf7,0xa3,0xe0 },
              [0x13a] = { 0xdf,0x45,0xb8,0x6,0x9e,0xdb,0x4e },
              [0x13b] = { 0xd0,0x52,0xc4,0x2,0x99,0xdb,0x57,0xc3 },
              [0x13c] = { 0xd9,0x41,0xc0,0xf7,0x78,0xdb,0x4e,0xc9,0xf3,0x9e,0xda,0x45,0xc7 },
              [0x13d] = { 0xbf,0x45,0xb8,0x6,0x9e,0xdb,0x4e },
              [0x13e] = { 0xb4,0x45,0xb6,0xf6,0x9a,0xde },
              [0x13f] = { 0x22 },
              [0x140] = { 0xbd,0x55,0xbe,0x0,0xa9 },
              [0x141] = { 0xbe,0x4f,0xc9,0xf3,0xa9,0xd5,0x4f,0xc3 },
              [0x142] = { 0xb0,0x52,0xc4,0x2,0x99,0xdb,0x57,0xc3,0xe4,0x9a,0xd3 },
              [0x143] = { 0xaf,0x4f,0xc3,0x6,0x96,0xd5,0x4e,0xba,0x4,0xa8 },
              [0x144] = { 0xce,0x55,0xbe,0xfe,0x99 },
              [0x145] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xc1,0x29 },
              [0x146] = { 0xcb,0x22,0xc1,0x7,0xa7 },
              [0x147] = { 0xae,0x4c,0xca,0x4,0x7a,0xd2,0x46,0xba,0xf5,0xa9 },
              [0x148] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xae,0x4c,0xca,0x4 },
              [0x149] = { 0xce,0x47 },
              [0x14a] = { 0xae,0x47,0xa1,0x1,0x9c,0xdb },
              [0x14b] = { 0xbf,0x43,0xb6,0xfe,0x9a,0xc0,0x59,0xc5,0xf7 },
              [0x14c] = { 0xb2,0x49,0xc9 },
              [0x14d] = { 0xc0,0x4f,0xc5,0xd4,0x96,0xde },
              [0x14e] = { 0xc0,0x4f,0xc5,0xd4,0x96,0xde,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x14f] = { 0xb8,0x4f,0xbc,0x1,0x77,0xe0,0x4e },
              [0x150] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xaf,0x4f,0xc3,0x6,0x96,0xd5,0x4e,0xba,0x4 },
              [0x151] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xb8,0x41,0xb7,0xf7,0xa1 },
              [0x152] = { 0xc0,0x49,0xc9,0xfe,0x9a,0xad,0x43,0xb8,0xf7,0xa3,0xe0 },
              [0x153] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x49,0xc3,0xf9,0x7b,0xde,0x41,0xc2,0xf7 },
              [0x154] = { 0xc0,0x41,0xb7,0xd4,0x96,0xde },
              [0x155] = { 0xc0,0x41,0xb7,0xea,0x89,0xd5,0x54,0xc1,0xf7,0x8b,0xd5,0x53,0xbe,0xf4,0xa1,0xd1 },
              [0x156] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x49,0xc3,0xf9,0x79,0xd5,0x52,0xba,0xf5,0xa9,0xd5,0x4f,0xc3 },
              [0x157] = { 0xb4,0x4f,0xc7,0xfb,0xaf,0xdb,0x4e,0xc9,0xf3,0xa1 },
              [0x158] = { 0xb9,0x4f,0xca,0x5,0x9a,0xc3,0x48,0xba,0xf7,0xa1 },
              [0x159] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xd5,0x96,0xda,0x56,0xb6,0x5,0x88,0xd5,0x5a,0xba },
              [0x15a] = { 0xad,0x42,0xc8,0x1,0xa1,0xe1,0x54,0xba,0xe9,0x9e,0xda,0x44,0xc4,0x9,0x88,0xd5,0x5a,0xba },
              [0x15b] = { 0xaf,0x41,0xc3,0x8,0x96,0xdf,0x30,0xc4,0x5,0x9e,0xe0,0x49,0xc4,0x0 },
              [0x15c] = { 0xc6 },
              [0x15d] = { 0xdf,0x45,0xc5,0xf3,0xa7,0xcd,0x54,0xc4,0x4 },
              [0x15e] = { 0xbf,0x49,0xb9,0xf7,0x85,0xcd,0x4e,0xba,0xfe },
              [0x15f] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xc3,0x49,0xb9,0x6,0x9d },
              [0x160] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x161] = { 0xbf,0x49,0xb9,0xf7,0x77,0xdb,0x52,0xb9,0xf7,0xa7 },
              [0x162] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb4,0x45,0xb6,0xf6,0x9a,0xde },
              [0x163] = { 0xc0,0x21,0x97,0xe5 },
              [0x164] = { 0x2c },
              [0x165] = { 0xdf,0x45,0xc9,0xe2,0x96,0xda,0x45,0xc1,0xe1,0xa5,0xd1,0x4e },
              [0x166] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb0,0x49,0xcb,0xfb,0x99,0xd1,0x52 },
              [0x167] = { 0xbf,0x49,0xb9,0xf7,0x88,0xcf,0x52,0xc4,0xfe,0xa1 },
              [0x168] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x56 },
              [0x169] = { 0xc2,0x45,0xc7,0x5,0x9e,0xdb,0x4e },
              [0x16a] = { 0xbb,0x50,0xba,0x0,0x7d,0xcd,0x4e,0xb9,0xfe,0x9a },
              [0x16b] = { 0xb4,0x41,0xc3,0xf6,0xa1,0xd1,0x37,0xbe,0xf6,0xa9,0xd4 },
              [0x16c] = { 0xb4,0x41,0xc3,0xf6,0xa1,0xd1,0x28,0xba,0xfb,0x9c,0xd4,0x54 },
              [0x16d] = { 0xbd,0x55,0xb6,0xf6 },
              [0x16e] = { 0xaf,0x4f,0xc3,0x6,0x9a,0xda,0x54 },
              [0x16f] = { 0xbf,0x45,0xb6,0x4,0x98,0xd4,0x6 },
              [0x170] = { 0xbc,0x4c,0xb6,0xf5,0x9a,0xd4,0x4f,0xc1,0xf6,0x9a,0xde,0x23,0xc4,0xfe,0xa4,0xde,0x13 },
              [0x171] = { 0xbf,0x45,0xb6,0x4,0x98,0xd4,0x22,0xc4,0xa },
              [0x172] = { 0xc0,0x41,0xb7,0xd5,0xa4,0xda,0x54,0xba,0x0,0xa9,0xb4,0x4f,0xc1,0xf6,0x9a,0xde },
              [0x173] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x22,0xb6,0x4 },
              [0x174] = { 0xbf,0x54,0xb6,0x6,0xaa,0xdf,0x34,0xba,0xa,0xa9 },
              [0x175] = { 0xbe,0x45,0xc3,0xf6,0x9a,0xde,0x33,0xc9,0xf7,0xa5,0xdc,0x45,0xb9 },
              [0x176] = { 0xb2,0x30,0xa8,0xb2,0x5a,0xd0,0x0,0x75,0x49,0x55,0x8c,0x30,0xbe,0x0,0x9c,0x8c,0x5,0xb9,0xff,0xa8,0x8c,0x0,0xc,0xb2,0x55,0xbc,0x4c,0xb6,0xb,0x9a,0xde,0x53,0x75,0xb7,0x99,0x8c,0x0,0xc,0xb2,0x55,0x91,0x53 },
              [0x177] = { 0xd0,0x41,0xc9,0xf7 },
              [0x178] = { 0x91,0x28,0x8f,0xb7,0x82,0xa6,0x5,0xa8 },
              [0x179] = { 0xc3,0x49,0xc3,0xd5,0xa4,0xda,0x54,0xc7,0x1,0xa1,0xdf },
              [0x17a] = { 0x7f },
              [0x17b] = { 0xd9,0x49,0xc3,0xfb,0xa2,0xd5,0x5a,0xba,0xf6 },
              [0x17c] = { 0xe1,0x49,0xab,0xfb,0xa8,0xd5,0x42,0xc1,0xf7 },
              [0x17d] = { 0xcf,0x4c,0xc4,0x5,0x9a },
              [0x17e] = { 0xdf,0x45,0xc9,0xdf,0x9e,0xda,0x49,0xc2,0xfb,0xaf,0xd1,0x44 },
              [0x17f] = { 0xb9,0x49,0xc3,0xfb,0xa2,0xd5,0x5a,0xba,0xf6 },
              [0x180] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0 },
              [0x181] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xbb,0x50,0xba,0x0 },
              [0x182] = { 0xad,0x43,0xc9,0xfb,0xab,0xd1,0x34,0xb6,0xf4 },
              [0x183] = { 0xc0,0x41,0xb7,0x5 },
              [0x184] = { 0xb1,0x4e,0xb6,0xf4,0xa1,0xd1,0x44 },
              [0x185] = { 0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0x36,0xbe,0x5 },
              [0x186] = { 0xaf,0x4c,0xc4,0x5,0x9a,0xbb,0x56,0xba,0x4,0xa1,0xcd,0x59 },
              [0x187] = { 0xaf,0x4c,0xc4,0x5,0x9a,0x8c,0x32,0xb6,0xc,0x9a,0xde,0x1f },
              [0x188] = { 0xad,0x4c,0xc1,0xb2,0x9b,0xd1,0x41,0xc9,0x7,0xa7,0xd1,0x53,0x75,0x9,0x9e,0xd8,0x4c,0x75,0x6,0xaa,0xde,0x4e,0x75,0x1,0x9b,0xd2,0x0,0xb6,0x0,0x99,0x8c,0x32,0xb6,0xc,0x9a,0xde,0x0,0xcc,0xfb,0xa1,0xd8,0x0,0xb7,0xf7,0x55,0xde,0x45,0xc2,0x1,0xab,0xd1,0x44,0x83,0x9c,0x8e,0xdb,0x55,0x7c,0xfe,0xa1,0x8c,0x4e,0xba,0xf7,0x99,0x8c,0x54,0xc4,0xb2,0xa7,0xd1,0xd,0xba,0xa,0x9a,0xcf,0x55,0xc9,0xf7,0x55,0xe0,0x4f,0x75,0x4,0x9a,0xdb,0x50,0xba,0x0,0x63 },
              [0x189] = { 0xaf,0x41,0xc3,0xf5,0x9a,0xd8 },
              [0x18a] = { 0xaf,0x4c,0xc4,0x5,0x9a },
              [0x18b] = { 0xaf,0x4c,0xba,0xf3,0xa3,0xe1,0x50 },
              [0x18c] = { 0xe0,0x49,0xc9,0xfe,0x9a,0xc2,0x49,0xc8,0xfb,0x97,0xd8,0x45 },
              [0x18d] = { 0xdf,0x45,0xc9,0xe6,0x9e,0xe0,0x4c,0xba,0xe8,0x9e,0xdf,0x49,0xb7,0xfe,0x9a },
              [0x18e] = { 0xc0,0x41,0xb7,0xea,0x89,0xd5,0x54,0xc1,0xf7,0x7d,0xd5,0x44,0xb9,0xf7,0xa3 },
              [0x18f] = { 0xc0,0x45,0xcd,0x6,0x89,0xde,0x41,0xc3,0x5,0xa5,0xcd,0x52,0xba,0x0,0x98,0xe5 },
              [0x190] = { 0xc0,0x45,0xcd,0x6,0x88,0xd5,0x5a,0xba },
              [0x191] = { 0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99,0xc0,0x52,0xb6,0x0,0xa8,0xdc,0x41,0xc7,0xf7,0xa3,0xcf,0x59 },
              [0x192] = { 0xae,0x41,0xb8,0xfd },
              [0x193] = { 0xb5,0x4e,0xa4,0x7,0xa9 },
              [0x194] = { 0xb8,0x45,0xbb,0x6,0x78,0xdb,0x4c,0xca,0xff,0xa3 },
              [0x195] = { 0xdf,0x45,0xc9,0xde,0x96,0xe5,0x4f,0xca,0x6 },
              [0x196] = { 0xc2,0x49,0xba,0x9,0xa5,0xdb,0x52,0xc9,0xe5,0x9e,0xe6,0x45 },
              [0x197] = { 0xbf,0x4e,0xb6,0x2,0x79,0xd5,0x53,0xc9,0xf3,0xa3,0xcf,0x45 },
              [0x198] = { 0xbb,0x50,0xba,0x0,0x80,0xd1,0x59,0xc8 },
              [0x199] = { 0xbc,0x41,0xc3,0xf7,0xa1,0xb7,0x45,0xce },
              [0x19a] = { 0xb5,0x4d,0xb6,0xf9,0x9a },
              [0x19b] = { 0xd2,0x49,0xc1,0xfe },
              [0x19c] = { 0xcd,0x50,0xc5,0xfe,0xae,0xaf,0x4f,0xc1,0x1,0xa7 },
              [0x19d] = { 0xdc,0x49,0xc1,0xfe },
              [0x19e] = { 0xdf,0x49,0xb9,0xf7,0x81,0xcd,0x42,0xba,0xfe },
              [0x19f] = { 0xdf,0x49,0xb9,0xf7,0x77,0xcd,0x52 },
              [0x1a0] = { 0xce,0x4f,0xcd },
              [0x1a1] = { 0xde,0x45,0xbb,0x4,0x9a,0xdf,0x48 },
              [0x1a2] = { 0xcf,0x52,0xba,0xf3,0xa9,0xd1,0x34,0xb6,0xf4 },
              [0x1a3] = { 0xc0,0x41,0xb7 },
              [0x1a4] = { 0xbf,0x49,0xb9,0xf7,0x77,0xe0,0x4e },
              [0x1a5] = { 0xbf,0x49,0xb9,0xf7,0x77,0xe0,0x4e,0x9d,0xf7,0x9e,0xd3,0x48,0xc9 },
              [0x1a6] = { 0xad,0x43,0xb8,0xf7,0xa3,0xe0,0x22,0xb6,0x4 },
              [0x1a7] = { 0xbf,0x43,0xc7,0x1,0xa1,0xd8,0x3f },
              [0x1a8] = { 0xbe,0x4f,0xcc,0xd9,0x96,0xdc },
              [0x1a9] = { 0xda,0x41,0xc2,0xf7 },
              [0x1aa] = { 0xdf,0x49,0xb9,0xf7,0x77,0xe0,0x4e },
              [0x1ab] = { 0xcb,0x53,0xba,0x6,0x76,0xcf,0x54,0xbe,0x8,0x9a },
              [0x1ac] = { 0xdb,0x4e,0x96,0xf5,0xa9,0xd5,0x56,0xb6,0x6,0x9a,0xd0 },
              [0x1ad] = { 0xcb,0x43,0xc1,0xf7,0x96,0xda,0x45,0xb9 },
              [0x1ae] = { 0xb2,0x45,0xb6,0x6,0xaa,0xde,0x45,0xc8 },
              [0x1af] = { 0xbf,0x45,0xc9,0xd8,0xa1,0xe5 },
              [0x1b0] = { 0xaf,0x48,0xb6,0x4,0x96,0xcf,0x54,0xba,0x4 },
              [0x1b1] = { 0xb4,0x55,0xc2,0xf3,0xa3,0xdb,0x49,0xb9 },
              [0x1b2] = { 0xc3,0x41,0xc1,0xfd,0x88,0xdc,0x45,0xba,0xf6 },
              [0x1b3] = { 0xc1,0x53,0xba,0xdc,0xaa,0xd9,0x50,0xa5,0x1,0xac,0xd1,0x52 },
              [0x1b4] = { 0xb6,0x55,0xc2,0x2,0x85,0xdb,0x57,0xba,0x4 },
              [0x1b5] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x3d,0x75,0xe7,0xa3,0xd8,0x4f,0xb6,0xf6,0x9a,0xd0,0xe },
              [0x1b6] = { 0xbf,0x45,0xc9,0xe5,0xa5,0xd1,0x45,0xb9 },
              [0x1b7] = { 0xbf,0x41,0xcb,0xf7,0x99 },
              [0x1b8] = { 0xe3,0x41,0xc1,0xfd,0x88,0xdc,0x45,0xba,0xf6 },
              [0x1b9] = { 0xbf,0x45,0xc9,0xdc,0xaa,0xd9,0x50 },
              [0x1ba] = { 0xd6,0x55,0xc2,0x2,0x85,0xdb,0x57,0xba,0x4 },
              [0x1bb] = { 0xb4,0x55,0xc2,0xf3,0xa3,0xdb,0x49,0xb9,0xe4,0xa4,0xdb,0x54,0xa5,0xf3,0xa7,0xe0 },
              [0x1bc] = { 0xae,0x4f,0xb9,0xb,0x8b,0xd1,0x4c,0xc4,0xf5,0x9e,0xe0,0x59 },
              [0x1bd] = { 0xb9,0x41,0xcd,0xd8,0xa4,0xde,0x43,0xba },
              [0x1be] = { 0xc2,0x45,0xc1,0x1,0x98,0xd5,0x54,0xce },
              [0x1bf] = { 0xe6,0x45,0xc7,0x1 },
              [0x1c0] = { 0xae,0x4f,0xb9,0xb,0x7c,0xe5,0x52,0xc4 },
              [0x1c1] = { 0xb9,0x41,0xcd,0xe6,0xa4,0xde,0x51,0xca,0xf7 },
              [0x1c2] = { 0xbc },
              [0x1c3] = { 0xb4,0x45,0xb6,0x4,0xa9,0xce,0x45,0xb6,0x6 },
              [0x1c4] = { 0xaf,0x26,0xc7,0xf3,0xa2,0xd1 },
              [0x1c5] = { 0xc3 },
              [0x1c6] = { 0xb8,0x4f,0xc4,0xfd,0x8b,0xd1,0x43,0xc9,0x1,0xa7 },
              [0x1c7] = { 0xbf },
              [0x1c8] = { 0xad },
              [0x1c9] = { 0xbe,0x49,0xbc,0xfa,0xa9,0xc2,0x45,0xb8,0x6,0xa4,0xde },
              [0x1ca] = { 0xb0 },
              [0x1cb] = { 0xbf,0x50,0xb6,0xf5,0x9a },
              [0x1cc] = { 0xb8,0x45,0xbb,0x6,0x78,0xdb,0x4e,0xc9,0x4,0xa4,0xd8 },
              [0x1cd] = { 0xb9,0x41,0xbc,0x0,0x9e,0xe0,0x55,0xb9,0xf7 },
              [0x1ce] = { 0xc1,0x4e,0xbe,0x6 },
              [0x1cf] = { 0xbf,0x45,0xc9,0xd8,0xa1,0xe5,0x33,0xc5,0xf7,0x9a,0xd0 },
              [0x1d0] = { 0xaf,0x48,0xb6,0x4,0x96,0xcf,0x54,0xba,0x4,0x76,0xd0,0x44,0xba,0xf6 },
              [0x1d1] = { 0xdf,0x45,0xc9,0xd4,0x96,0xcf,0x4b,0xbc,0x4,0xa4,0xe1,0x4e,0xb9,0xdf,0xa4,0xd0,0x45 },
              [0x1d2] = { 0xce,0x47,0xa2,0x1,0x99,0xd1 },
              [0x1d3] = { 0xde,0x41,0xcf,0xf7,0xa7,0xcb,0x57,0xbd,0xfb,0xa9,0xd1 },
              [0x1d4] = { 0xde,0x41,0xcf,0xf7,0xa7,0xcb,0x42,0xc1,0xf3,0x98,0xd7 },
              [0x1d5] = { 0xbf,0x45,0xc9,0x6,0x9e,0xda,0x47,0xc8 },
              [0x1d6] = { 0xb9,0x2f,0xab,0xd7,0x82,0xb1,0x2e,0xa9 },
              [0x1d7] = { 0xb2,0x4c,0xce },
              [0x1d8] = { 0xb2,0x4c,0xce,0xb2,0x88,0xdc,0x45,0xba,0xf6 },
              [0x1d9] = { 0xbf,0x50,0xba,0xf7,0x99 },
              [0x1da] = { 0xc3,0x41,0xc1,0xfd,0x55,0xbf,0x50,0xba,0xf7,0x99 },
              [0x1db] = { 0xb6,0x55,0xc2,0x2,0x55,0xbc,0x4f,0xcc,0xf7,0xa7 },
              [0x1dc] = { 0xc2,0x29,0xa8,0xe7,0x76,0xb8 },
              [0x1dd] = { 0xb1,0x33,0xa5 },
              [0x1de] = { 0xb1,0x4e,0xb6,0xf4,0xa1,0xd1,0x0,0x9a,0xe5,0x85 },
              [0x1df] = { 0xc0,0x45,0xcd,0x6,0x55,0xbf,0x49,0xcf,0xf7 },
              [0x1e0] = { 0xb9,0x41,0xcd,0xb2,0x79,0xd5,0x53,0xc9,0xf3,0xa3,0xcf,0x45 },
              [0x1e1] = { 0xad,0x30,0xa5,0xd7,0x76,0xbe,0x21,0xa3,0xd5,0x7a },
              [0x1e2] = { 0xb0,0x41,0xc7,0xfd,0x55,0xb9,0x4f,0xb9,0xf7 },
              [0x1e3] = { 0xb0,0x41,0xc7,0xfd },
              [0x1e4] = { 0x8c,0x4d,0xc4,0xf6,0x9a },
              [0x1e5] = { 0xbf,0x48,0xc4,0x9,0x55,0xc0,0x49,0xc9,0xfe,0x9a },
              [0x1e6] = { 0xb8,0x21,0xae,0xe1,0x8a,0xc0 },
              [0x1e7] = { 0xbf,0x49,0xb9,0xf7,0x85,0xcd,0x4e,0xba,0xfe,0x55,0x94,0x2c,0xba,0xf8,0xa9,0xaf,0x4f,0xc1,0x7,0xa2,0xda,0x9 },
              [0x1e8] = { 0xb8,0x41,0xce,0x1,0xaa,0xe0,0x1a,0x75 },
              [0x1e9] = { 0xbb,0x50,0xb6,0xf5,0x9e,0xe0,0x59 },
              [0x1ea] = { 0xc1,0x29,0x75,0xe5,0x98,0xcd,0x4c,0xba },
              [0x1eb] = { 0xc1,0x29,0xa8,0xf5,0x96,0xd8,0x45 },
              [0x1ec] = { 0xbf,0x54,0xb6,0x6,0x9e,0xdf,0x54,0xbe,0xf5,0xa8,0x8c,0x2f,0xcb,0xf7,0xa7,0xd8,0x41,0xce },
              [0x1ed] = { 0xbf,0x54,0xb6,0x6,0x9e,0xdf,0x54,0xbe,0xf5,0xa8,0xa6,0x0 },
              [0x1ee] = { 0xbb,0x2e },
              [0x1ef] = { 0xbb,0x26,0x9b },
              [0x1f0] = { 0xaf,0x2f,0xa1,0xe1,0x87,0xbf },
              [0x1f1] = { 0xbf,0x4c,0xbe,0xf6,0x9a,0xde,0x0,0x98,0x1,0xa1,0xdb,0x52 },
              [0x1f2] = { 0xe2,0x41,0xc1,0xde,0x97,0xd8 },
              [0x1f3] = { 0xc0,0x41,0xb7,0xb2,0x78,0xdb,0x4c,0xc4,0x4 },
              [0x1f4] = { 0xc0,0x4f,0xbc,0xf9,0xa1,0xd1,0x0,0x98,0x1,0xa1,0xdb,0x52 },
              [0x1f5] = { 0xc0,0x28,0x9a,0xdf,0x7a,0x8c,0x30,0xa7,0xd7,0x88,0xb1,0x34,0xa8 },
              [0x1f6] = { 0xb0,0x45,0xbb,0xf3,0xaa,0xd8,0x54,0x75,0xe9,0x9d,0xd5,0x54,0xba },
              [0x1f7] = { 0xb0,0x41,0xc7,0xfd,0x55,0xae,0x41,0xb8,0xfd,0x9c,0xde,0x4f,0xca,0x0,0x99 },
              [0x1f8] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x37,0xbd,0xfb,0xa9,0xd1 },
              [0x1f9] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xc3,0x48,0xbe,0x6,0x9a },
              [0x1fa] = { 0xbe,0x41,0xcf,0xf7,0xa7,0x8c,0x22,0xc1,0xf3,0x98,0xd7 },
              [0x1fb] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xae,0x4c,0xb6,0xf5,0xa0 },
              [0x1fc] = { 0x91,0x53,0x80 },
              [0x1fd] = { 0xbe,0x4f,0xcc,0xb6 },
              [0x1fe] = { 0xbe,0x41,0xcf,0xf7,0xa7,0xb8,0x49,0xb7 },
              [0x1ff] = { 0xb8,0x4f,0xb6,0xf6,0x9a,0xd0,0xe,0x75,0xe4,0x9e,0xd3,0x48,0xc9,0xe5,0x9d,0xd5,0x46,0xc9,0xb2,0x64,0x8c,0x25,0xc3,0x6,0x9a,0xde,0x0,0xc9,0x1,0x55,0xe0,0x4f,0xbc,0xf9,0xa1,0xd1,0xe },
              [0x200] = { 0xc7,0x32,0xb6,0xc,0x9a,0xde,0x0,0xcb,0xb7,0xa8,0xc9,0x0,0xa1,0x1,0x96,0xd0,0x45,0xb9,0xc0,0x55,0xbe,0x49,0xbc,0xfa,0xa9,0xbf,0x48,0xbe,0xf8,0xa9,0x8c,0xf,0x75,0xd7,0xa3,0xe0,0x45,0xc7,0xb2,0xa9,0xdb,0x0,0xc9,0x1,0x9c,0xd3,0x4c,0xba,0xc0 },
            }
            local _l1IIlIlI = {}
            local _lIIIlIlI = function(idx)
              local cached = _l1IIlIlI[idx]
              if cached then return cached end
              local data = _IIIIlIlI[idx]
              if not data then return "" end
              local chars = {}
              for i = 1, #data do
                local k = _1IIIlIlI[((i - 1) % #_1IIIlIlI) + 1]
                chars[i] = string.char((data[i] - k + 256) % 256)
              end
              local res = table.concat(chars)
              _l1IIlIlI[idx] = res
              return res
            end
            
            
            local _I1IIlIlI = 709
            while _I1IIlIlI do
              if _I1IIlIlI == 709 then
                _I1IIlIlI = 1978
              elseif _I1IIlIlI == 1978 then
                do
                  
                  
                  
                  
                  
                  local _l1IIlIlI = {}
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                  local _I1IIlIlI = game:GetService(_lIIIlIlI(0x1))
                  local _11IIlIlI = game:GetService(_lIIIlIlI(0x2))
                  local _ll1IlIlI = game:GetService(_lIIIlIlI(0x3))
                  local _Il1IlIlI = game:GetService(_lIIIlIlI(0x4))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  local _1l1IlIlI = game:GetService(_lIIIlIlI(0x5))
                  local _lI1IlIlI = game:GetService(_lIIIlIlI(0x6))
                  local _II1IlIlI = game:GetService(_lIIIlIlI(0x7))
                  local _1I1IlIlI = game:GetService(_lIIIlIlI(0x8))
                  local _l11IlIlI = _Il1IlIlI[_lIIIlIlI(0x9)]
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  local _I11IlIlI = workspace[_lIIIlIlI(0xa)]
                  
                  _l1IIlIlI[_lIIIlIlI(0xb)] = {
                   Title = _lIIIlIlI(0xc),
                   Version = _lIIIlIlI(0xd),
                   LogoURL = _lIIIlIlI(0xe),
                   LogoFallback = _lIIIlIlI(0xf),
                   DefaultTheme = _lIIIlIlI(0x10),
                  
                   OpenKeys = { Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x12)], Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x13)] },
                   PanelKey = Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x14)],
                  
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x1400 - 0x0) / 0x8)), (((0xeb0 - 0x0) / 0x8))),
                   Minimized = UDim2[_lIIIlIlI(0x15)]((((0x1400 - 0x0) / 0x8)), (((0x170 - 0x0) / 0x8))),
                   Radius = (((0x50 - 0x0) / 0x8)),
                   TopBarHeight = (((0x170 - 0x0) / 0x8)),
                   StatusHeight = (((0xa0 - 0x0) / 0x8)),
                  
                   RowHeight = (((0x120 - 0x0) / 0x8)),
                   IconSize = (((0x90 - 0x0) / 0x8)),
                   RowGap = (((0x40 - 0x0) / 0x8)),
                  
                   PanelWidth = (((0x4b0 - 0x0) / 0x8)),
                   HandleWidth = (((0x50 - 0x0) / 0x8)),
                   HandleHeight = (((0x160 - 0x0) / 0x8)),
                   SideBtnHeight = (((0x110 - 0x0) / 0x8)),
                  
                   TabXTitleVisible = (((0x5f0 - 0x0) / 0x8)),
                   TabXTitleHidden = (((0x1a0 - 0x0) / 0x8)),
                  
                   AssetFolder = _lIIIlIlI(0xc),
                   Debug = (0x1 == 0x1),
                   ClickSoundId = _lIIIlIlI(0x16),
                   ClickVolume = 0.5,
                  
                   NotificationPosition = _lIIIlIlI(0x17),
                   PurpleDefault = _lIIIlIlI(0x18),
                   SnapDistance = (((0xc0 - 0x0) / 0x8)),
                  }
                  
                  _l1IIlIlI[_lIIIlIlI(0xc)] = {
                   Tabs = {},
                   ActiveTab = nil,
                   Saved = {},
                   Custom = {},
                   SliderReg = {},
                   ToggleReg = {},
                   DropdownReg = {},
                   Layout = _lIIIlIlI(0x19),
                   PanelOpen = (0x0 == 0x1),
                   StatsOn = (0x0 == 0x1),
                   _cleaned = (0x0 == 0x1),
                   _frameCount = (0x19 - 0x19),
                  }
                  
                  local _111IlIlI = _l1IIlIlI[_lIIIlIlI(0xb)]
                  local _lllIlIlI = {}
                  
                  
                  _l1IIlIlI[_lIIIlIlI(0x1a)] = nil
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  function _lllIlIlI.hex(_IlI1lIlI)
                   _IlI1lIlI = _IlI1lIlI:gsub(_lIIIlIlI(0x1c), _lIIIlIlI(0x1d)):lower()
                   if #_IlI1lIlI == (((0x18 - 0x0) / 0x8)) then
                   _IlI1lIlI = _IlI1lIlI:sub((0x2a / 0x2a),(0x2a / 0x2a)):rep((((0x10 - 0x0) / 0x8))) .. _IlI1lIlI:sub((((0x10 - 0x0) / 0x8)),(((0x10 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))) .. _IlI1lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x18 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8)))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                   return Color3[_lIIIlIlI(0x1e)](
                   tonumber(_IlI1lIlI:sub((0x2a / 0x2a),(((0x10 - 0x0) / 0x8))), (((0x80 - 0x0) / 0x8))),
                   tonumber(_IlI1lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x20 - 0x0) / 0x8))), (((0x80 - 0x0) / 0x8))),
                   tonumber(_IlI1lIlI:sub((((0x28 - 0x0) / 0x8)),(((0x30 - 0x0) / 0x8))), (((0x80 - 0x0) / 0x8))))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  end
                  
                  function _lllIlIlI.toHex(_llIIlIlI)
                   return string[_lIIIlIlI(0x20)](_lIIIlIlI(0x21),
                   math[_lIIIlIlI(0x22)](_llIIlIlI[_lIIIlIlI(0x23)] * (((0x7f8 - 0x0) / 0x8)) + 0.5),
                   math[_lIIIlIlI(0x22)](_llIIlIlI[_lIIIlIlI(0x24)] * (((0x7f8 - 0x0) / 0x8)) + 0.5),
                   math[_lIIIlIlI(0x22)](_llIIlIlI[_lIIIlIlI(0x25)] * (((0x7f8 - 0x0) / 0x8)) + 0.5))
                  end
                  
                  function _lllIlIlI.parseHex(_IlI1lIlI)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if type(_IlI1lIlI) ~= _lIIIlIlI(0x27) then return nil end
                   _IlI1lIlI = _IlI1lIlI:gsub(_lIIIlIlI(0x1c), _lIIIlIlI(0x1d)):gsub(_lIIIlIlI(0x28), _lIIIlIlI(0x1d)):lower()
                   if #_IlI1lIlI == (((0x18 - 0x0) / 0x8)) then
                   _IlI1lIlI = _IlI1lIlI:sub((0x2a / 0x2a),(0x2a / 0x2a)):rep((((0x10 - 0x0) / 0x8))) .. _IlI1lIlI:sub((((0x10 - 0x0) / 0x8)),(((0x10 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8))) .. _IlI1lIlI:sub((((0x18 - 0x0) / 0x8)),(((0x18 - 0x0) / 0x8))):rep((((0x10 - 0x0) / 0x8)))
                   end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if #_IlI1lIlI ~= (((0x30 - 0x0) / 0x8)) or not _IlI1lIlI:match(_lIIIlIlI(0x29)) then return nil end
                   return _lllIlIlI[_lIIIlIlI(0x1b)](_IlI1lIlI)
                  end
                  
                  function _lllIlIlI.create(class, props)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   local _IllIlIlI = Instance[_lIIIlIlI(0x2b)](class)
                   local _1llIlIlI
                   for _lIlIlIlI, _IIlIlIlI in pairs(props or {}) do
                   if _lIlIlIlI == _lIIIlIlI(0x2c) then _1llIlIlI = _IIlIlIlI else _IllIlIlI[_lIlIlIlI] = _IIlIlIlI end
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if _1llIlIlI then _IllIlIlI[_lIIIlIlI(0x2c)] = _1llIlIlI end
                   if (class == _lIIIlIlI(0x2d) or class == _lIIIlIlI(0x2e)) and _l1IIlIlI[_lIIIlIlI(0x2f)] then
                   _IllIlIlI[_lIIIlIlI(0x30)]:Connect(_l1IIlIlI[_lIIIlIlI(0x2f)][_lIIIlIlI(0x31)])
                   end
                   return _IllIlIlI
                  end
                  
                  function _lllIlIlI.tween(_IllIlIlI, _1lllIIlI, props, style, _ll1llIlI)
                   local _1IlIlIlI = TweenInfo[_lIIIlIlI(0x2b)](
                   _1lllIIlI or 0.2,
                   style or Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)],
                   _ll1llIlI or Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   local _l1lIlIlI = _I1IIlIlI:Create(_IllIlIlI, _1IlIlIlI, props)
                   _l1lIlIlI:Play()
                   return _l1lIlIlI
                  end
                  
                  function _lllIlIlI.corner(_l1l1lIlI, r)
                   if not _l1l1lIlI then return end
                   return _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x38), {
                   CornerRadius = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), r or _111IlIlI[_lIIIlIlI(0x39)]),
                   Parent = _l1l1lIlI,
                   })
                  end
                  
                  function _lllIlIlI.stroke(_l1l1lIlI, _llIIlIlI, th, tr)
                   if not _l1l1lIlI then return end
                   local _I1lIlIlI = _llIIlIlI
                   if not _I1lIlIlI then
                   _I1lIlIlI = (_l1IIlIlI[_lIIIlIlI(0x3b)] and _l1IIlIlI[_lIIIlIlI(0x3b)]:Get(_lIIIlIlI(0x3c))) or Color3[_lIIIlIlI(0x2b)](0.5, 0.5, 0.5)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                   return _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x3d), {
                   Color = _I1lIlIlI,
                   Thickness = th or (0x2a / 0x2a),
                   Transparency = tr or 0.4,
                   ApplyStrokeMode = Enum[_lIIIlIlI(0x3e)][_lIIIlIlI(0x3f)],
                   Parent = _l1l1lIlI,
                   })
                  end
                  
                  function _lllIlIlI.clamp(_1l1l1IlI, _llI1lIlI, _l1I11IlI)
                   return math[_lIIIlIlI(0x41)](_llI1lIlI, math[_lIIIlIlI(0x42)](_l1I11IlI, _1l1l1IlI))
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x43)] = {}
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                  function _lllIlIlI.track(_llIIlIlI)
                   table[_lIIIlIlI(0x45)](_l1IIlIlI[_lIIIlIlI(0x43)], _llIIlIlI)
                   return _llIIlIlI
                  end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                  function _lllIlIlI.disconnectAll()
                   for _11lIlIlI, _llIIlIlI in ipairs(_l1IIlIlI[_lIIIlIlI(0x43)]) do
                   pcall(function() _llIIlIlI:Disconnect() end)
                   end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _l1IIlIlI[_lIIIlIlI(0x43)] = {}
                  end
                  
                  
                  
                  
                  
                  
                  
                  _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x47)]:Connect(function(_IlIIlIlI)
                   local _1lIIlIlI = _l1IIlIlI[_lIIIlIlI(0x1a)]
                   if not _1lIIlIlI then return end
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x49)]
                   or _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   _1lIIlIlI[_lIIIlIlI(0x4b)](_IlIIlIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0x4d)])
                   end
                  end))
                  _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x4e)]:Connect(function(_IlIIlIlI)
                   local _1lIIlIlI = _l1IIlIlI[_lIIIlIlI(0x1a)]
                   if not _1lIIlIlI then return end
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   or _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   _l1IIlIlI[_lIIIlIlI(0x1a)] = nil
                   _1lIIlIlI[_lIIIlIlI(0x50)]()
                   end
                  end))
                  
                  _l1IIlIlI[_lIIIlIlI(0x51)] = _lllIlIlI
                  
                  
                  
                  
                  
                  
                  
                  local _lIIIlIlI = {}
                  local _IIIIlIlI = {}
                  local _1IIIlIlI = (0x2a / 0x2a)
                  local _l1IIlIlI = (((0x30 - 0x0) / 0x8))
                  
                  function _lIIIlIlI.play()
                   if not _111IlIlI[_lIIIlIlI(0x52)] or _111IlIlI[_lIIIlIlI(0x52)] == _lIIIlIlI(0x1d) then return end
                   pcall(function()
                   if #_IIIIlIlI == (0x19 - 0x19) then
                   for _IlIIlIlI = (0x2a / 0x2a), _l1IIlIlI do
                   local _I1IIlIlI = Instance[_lIIIlIlI(0x2b)](_lIIIlIlI(0x2f))
                   _I1IIlIlI[_lIIIlIlI(0x53)] = _111IlIlI[_lIIIlIlI(0x52)]
                   _I1IIlIlI[_lIIIlIlI(0x54)] = _111IlIlI[_lIIIlIlI(0x55)]
                   _I1IIlIlI[_lIIIlIlI(0x2c)] = _1l1IlIlI
                   _IIIIlIlI[_IlIIlIlI] = _I1IIlIlI
                   end
                   end
                   local _I1IIlIlI = _IIIIlIlI[_1IIIlIlI]
                   _1IIIlIlI = _1IIIlIlI % _l1IIlIlI + (0x2a / 0x2a)
                   _I1IIlIlI[_lIIIlIlI(0x56)] = (0x19 - 0x19)
                   _I1IIlIlI:Play()
                   end)
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x2f)] = _lIIIlIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  local _11IIlIlI = {}
                  local _ll1IlIlI = _111IlIlI[_lIIIlIlI(0x57)] .. _lIIIlIlI(0x58)
                  local _Il1IlIlI = {}
                  local _1l1IlIlI = type(writefile) == _lIIIlIlI(0x59)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  local _lI1IlIlI = type(getcustomasset) == _lIIIlIlI(0x59)
                  
                  pcall(function()
                   if type(isfolder) == _lIIIlIlI(0x59) and type(makefolder) == _lIIIlIlI(0x59) then
                   if not isfolder(_111IlIlI[_lIIIlIlI(0x57)]) then makefolder(_111IlIlI[_lIIIlIlI(0x57)]) end
                   if not isfolder(_ll1IlIlI) then makefolder(_ll1IlIlI) end
                   end
                  end)
                  
                  local function _II1IlIlI(_1I1IlIlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   local _l11IlIlI = request or http_request or (syn and syn[_lIIIlIlI(0x5a)])
                   if _l11IlIlI then
                   local _I11IlIlI, _111IlIlI = pcall(_l11IlIlI, { Url = _1I1IlIlI, Method = _lIIIlIlI(0x5b) })
                   if _I11IlIlI and type(_111IlIlI) == _lIIIlIlI(0x5c) and _111IlIlI[_lIIIlIlI(0x5d)] then return _111IlIlI[_lIIIlIlI(0x5d)] end
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _I11IlIlI, _1lIIlIlI = pcall(game[_lIIIlIlI(0x5e)], game, _1I1IlIlI)
                   if _I11IlIlI and type(_1lIIlIlI) == _lIIIlIlI(0x27) then return _1lIIlIlI end
                   return nil
                  end
                  
                  local function _lll1lIlI(_Ill1lIlI)
                   if type(_Ill1lIlI) ~= _lIIIlIlI(0x27) or #_Ill1lIlI < (((0x40 - 0x0) / 0x8)) then return nil end
                   local _1ll1lIlI, _lIl1lIlI = _Ill1lIlI:byte((0x2a / 0x2a)), _Ill1lIlI:byte((((0x10 - 0x0) / 0x8)))
                   if _1ll1lIlI == 0x89 and _lIl1lIlI == 0x50 then return _lIIIlIlI(0x5f) end
                   if _1ll1lIlI == 0xFF and _lIl1lIlI == 0xD8 then return _lIIIlIlI(0x60) end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if _1ll1lIlI == 0x47 and _lIl1lIlI == 0x49 then return _lIIIlIlI(0x61) end
                   if _Ill1lIlI:sub((0x2a / 0x2a),(((0x20 - 0x0) / 0x8))) == _lIIIlIlI(0x62) and _Ill1lIlI:sub((((0x48 - 0x0) / 0x8)),(((0x60 - 0x0) / 0x8))) == _lIIIlIlI(0x63) then return _lIIIlIlI(0x64) end
                   return nil
                  end
                  
                  local _IIl1lIlI = { _lIIIlIlI(0x5f), _lIIIlIlI(0x60), _lIIIlIlI(0x61), _lIIIlIlI(0x64) }
                  
                  function _11IIlIlI.load(_1I1IlIlI, _1ll1IIlI)
                   if not _1I1IlIlI or _1I1IlIlI == _lIIIlIlI(0x1d) or not _1l1IlIlI or not _lI1IlIlI then return nil end
                   if _Il1IlIlI[_1ll1IIlI] then return _Il1IlIlI[_1ll1IIlI] end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   if type(isfile) == _lIIIlIlI(0x59) then
                   for _11lIlIlI, _1Il1lIlI in ipairs(_IIl1lIlI) do
                   local _l1l1lIlI = _ll1IlIlI .. _lIIIlIlI(0x66) .. _1ll1IIlI .. _lIIIlIlI(0x67) .. _1Il1lIlI
                   local _I11IlIlI, _I1l1lIlI = pcall(isfile, _l1l1lIlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if _I11IlIlI and _I1l1lIlI then
                   local _11l1lIlI, _llI1lIlI = pcall(getcustomasset, _l1l1lIlI)
                   if _11l1lIlI and type(_llI1lIlI) == _lIIIlIlI(0x27) and _llI1lIlI ~= _lIIIlIlI(0x1d) then
                   _Il1IlIlI[_1ll1IIlI] = _llI1lIlI
                   return _llI1lIlI
                   end
                   end
                   end
                   end
                  
                   local _Ill1lIlI = _II1IlIlI(_1I1IlIlI)
                   if not _Ill1lIlI or #_Ill1lIlI < (((0x800 - 0x0) / 0x8)) or _Ill1lIlI:sub((0x2a / 0x2a), (0x2a / 0x2a)) == _lIIIlIlI(0x68) then return nil end
                  
                   local _1Il1lIlI = _lll1lIlI(_Ill1lIlI) or _lIIIlIlI(0x5f)
                   local _l1l1lIlI = _ll1IlIlI .. _lIIIlIlI(0x66) .. _1ll1IIlI .. _lIIIlIlI(0x67) .. _1Il1lIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if not pcall(writefile, _l1l1lIlI, _Ill1lIlI) then return nil end
                  
                   local _I11IlIlI, _llI1lIlI = pcall(getcustomasset, _l1l1lIlI)
                   if _I11IlIlI and type(_llI1lIlI) == _lIIIlIlI(0x27) and _llI1lIlI ~= _lIIIlIlI(0x1d) then
                   _Il1IlIlI[_1ll1IIlI] = _llI1lIlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   return _llI1lIlI
                   end
                   return nil
                  end
                  
                  function _11IIlIlI.getLogo()
                   local _llI1lIlI = _11IIlIlI[_lIIIlIlI(0x65)](_111IlIlI[_lIIIlIlI(0x6a)], _lIIIlIlI(0x6b))
                   if not _llI1lIlI and _111IlIlI[_lIIIlIlI(0x6c)] ~= _lIIIlIlI(0x1d) then
                   _llI1lIlI = _111IlIlI[_lIIIlIlI(0x6c)]
                   end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   return _llI1lIlI
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x6d)] = _11IIlIlI
                  
                  
                  local _IlI1lIlI = _lllIlIlI[_lIIIlIlI(0x1b)]
                  
                  local _1lI1lIlI = {
                   Light = {
                   _IIIllIlI = _IlI1lIlI_lIIIlIlI(0x6e), surface = _IlI1lIlI_lIIIlIlI(0x6f), surfaceAlt = _IlI1lIlI_lIIIlIlI(0x70),
                   _1l11IIlI = _IlI1lIlI_lIIIlIlI(0x71), _lIIlIIlI = _IlI1lIlI_lIIIlIlI(0x72), subtext = _IlI1lIlI_lIIIlIlI(0x73),
                   border = _IlI1lIlI_lIIIlIlI(0x74), toggleOn = _IlI1lIlI_lIIIlIlI(0x75), toggleOff = _IlI1lIlI_lIIIlIlI(0x76),
                   separator = _IlI1lIlI_lIIIlIlI(0x77), success = _IlI1lIlI_lIIIlIlI(0x75), error = _IlI1lIlI_lIIIlIlI(0x78),
                   _1l1lIIlI = _IlI1lIlI_lIIIlIlI(0x79), notifBg = _IlI1lIlI_lIIIlIlI(0x6f),
                   },
                   Dark = {
                   _IIIllIlI = _IlI1lIlI_lIIIlIlI(0x7a), surface = _IlI1lIlI_lIIIlIlI(0x7b), surfaceAlt = _IlI1lIlI_lIIIlIlI(0x7c),
                   _1l11IIlI = _IlI1lIlI_lIIIlIlI(0x7d), _lIIlIIlI = _IlI1lIlI_lIIIlIlI(0x7e), subtext = _IlI1lIlI_lIIIlIlI(0x7f),
                   border = _IlI1lIlI_lIIIlIlI(0x80), toggleOn = _IlI1lIlI_lIIIlIlI(0x81), toggleOff = _IlI1lIlI_lIIIlIlI(0x7c),
                   separator = _IlI1lIlI_lIIIlIlI(0x82), success = _IlI1lIlI_lIIIlIlI(0x81), error = _IlI1lIlI_lIIIlIlI(0x78),
                   _1l1lIIlI = _IlI1lIlI_lIIIlIlI(0x83), notifBg = _IlI1lIlI_lIIIlIlI(0x84),
                   },
                   RazerWhite = {
                   _IIIllIlI = _IlI1lIlI_lIIIlIlI(0x6f), surface = _IlI1lIlI_lIIIlIlI(0x85), surfaceAlt = _IlI1lIlI_lIIIlIlI(0x7e),
                   _1l11IIlI = _IlI1lIlI_lIIIlIlI(0x18), _lIIlIIlI = _IlI1lIlI_lIIIlIlI(0x86), subtext = _IlI1lIlI_lIIIlIlI(0x87),
                   border = _IlI1lIlI_lIIIlIlI(0x88), toggleOn = _IlI1lIlI_lIIIlIlI(0x18), toggleOff = _IlI1lIlI_lIIIlIlI(0x89),
                   separator = _IlI1lIlI_lIIIlIlI(0x8a), success = _IlI1lIlI_lIIIlIlI(0x75), error = _IlI1lIlI_lIIIlIlI(0x78),
                   _1l1lIIlI = _IlI1lIlI_lIIIlIlI(0x79), notifBg = _IlI1lIlI_lIIIlIlI(0x6f),
                   },
                   RazerBlack = {
                   _IIIllIlI = _IlI1lIlI_lIIIlIlI(0x8b), surface = _IlI1lIlI_lIIIlIlI(0x8c), surfaceAlt = _IlI1lIlI_lIIIlIlI(0x8d),
                   _1l11IIlI = _IlI1lIlI_lIIIlIlI(0x18), _lIIlIIlI = _IlI1lIlI_lIIIlIlI(0x7e), subtext = _IlI1lIlI_lIIIlIlI(0x8e),
                   border = _IlI1lIlI_lIIIlIlI(0x8f), toggleOn = _IlI1lIlI_lIIIlIlI(0x18), toggleOff = _IlI1lIlI_lIIIlIlI(0x8d),
                   separator = _IlI1lIlI_lIIIlIlI(0x90), success = _IlI1lIlI_lIIIlIlI(0x91), error = _IlI1lIlI_lIIIlIlI(0x92),
                   _1l1lIIlI = _IlI1lIlI_lIIIlIlI(0x93), notifBg = _IlI1lIlI_lIIIlIlI(0x8c),
                   },
                  }
                  
                  local _lII1lIlI = {
                   _l1ll1IlI = _111IlIlI[_lIIIlIlI(0x94)],
                   registry = {},
                   bgMode = _lIIIlIlI(0x95),
                   _1lI1lIlI = _1lI1lIlI,
                   _reapply = nil,
                  }
                  
                  function _lII1lIlI:Register(_IllIlIlI, prop, _11I1IIlI)
                   if not _IllIlIlI then return end
                   table[_lIIIlIlI(0x45)](self[_lIIIlIlI(0x96)], { _IllIlIlI = _IllIlIlI, prop = prop, _11I1IIlI = _11I1IIlI })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _IIlIlIlI = _1lI1lIlI[self[_lIIIlIlI(0x97)]][_11I1IIlI]
                   if _IIlIlIlI then _IllIlIlI[prop] = _IIlIlIlI end
                  end
                  
                  function _lII1lIlI:SetReapplyCallback(_Il11lIlI)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   self[_lIIIlIlI(0x98)] = _Il11lIlI
                  end
                  
                  
                  
                  
                  
                  
                  function _lII1lIlI:Apply(_1ll1IIlI)
                   if not _1lI1lIlI[_1ll1IIlI] then return end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   self[_lIIIlIlI(0x97)] = _1ll1IIlI
                   local _III1lIlI = {}
                   for _11lIlIlI, _1Il1lIlI in ipairs(self[_lIIIlIlI(0x96)]) do
                   if _1Il1lIlI[_lIIIlIlI(0x99)] and _1Il1lIlI[_lIIIlIlI(0x99)][_lIIIlIlI(0x2c)] then
                   local _1II1lIlI = _1lI1lIlI[_1ll1IIlI][_1Il1lIlI[_lIIIlIlI(0x9a)]]
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _1II1lIlI then
                   if typeof(_1Il1lIlI[_lIIIlIlI(0x99)][_1Il1lIlI[_lIIIlIlI(0x9b)]]) == _lIIIlIlI(0x9c) then
                   _I1IIlIlI:Create(_1Il1lIlI[_lIIIlIlI(0x99)], TweenInfo[_lIIIlIlI(0x2b)](0.25),
                   { [_1Il1lIlI[_lIIIlIlI(0x9b)]] = _1II1lIlI }):Play()
                   else
                   _1Il1lIlI[_lIIIlIlI(0x99)][_1Il1lIlI[_lIIIlIlI(0x9b)]] = _1II1lIlI
                   end
                   end
                   table[_lIIIlIlI(0x45)](_III1lIlI, _1Il1lIlI)
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                   self[_lIIIlIlI(0x96)] = _III1lIlI
                   if self[_lIIIlIlI(0x98)] then
                   task[_lIIIlIlI(0x9d)](self[_lIIIlIlI(0x98)])
                   end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  end
                  
                  function _lII1lIlI:Get(_lIlIlIlI) return _1lI1lIlI[self[_lIIIlIlI(0x97)]][_lIlIlIlI] end
                  
                  _l1IIlIlI[_lIIIlIlI(0x3b)] = _lII1lIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  local _l1I1lIlI = _l1IIlIlI[_lIIIlIlI(0xc)]
                  _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0x9f)] = _lllIlIlI[_lIIIlIlI(0x26)](_111IlIlI[_lIIIlIlI(0xa0)])
                  _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] = _lllIlIlI[_lIIIlIlI(0x26)](_111IlIlI[_lIIIlIlI(0xa0)])
                  _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa2)] = _lllIlIlI[_lIIIlIlI(0x26)](_111IlIlI[_lIIIlIlI(0xa0)])
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa3)] = _lllIlIlI[_lIIIlIlI(0x26)](_111IlIlI[_lIIIlIlI(0xa0)])
                  
                  local _I1I1lIlI = { registered = {}, capturing = nil }
                  
                  function _I1I1lIlI:Register(_11I1IIlI, _Il11lIlI) self[_lIIIlIlI(0xa4)][_11I1IIlI] = _Il11lIlI end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  function _I1I1lIlI:Unregister(_11I1IIlI) self[_lIIIlIlI(0xa4)][_11I1IIlI] = nil end
                  function _I1I1lIlI:BeginCapture(_Il11lIlI) self[_lIIIlIlI(0xa5)] = _Il11lIlI end
                  
                  _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0xa6)]:Connect(function(_11I1lIlI, _ll11lIlI)
                   if _ll11lIlI then return end
                  
                   if _I1I1lIlI[_lIIIlIlI(0xa5)] then
                   local _Il11lIlI = _I1I1lIlI[_lIIIlIlI(0xa5)]
                   _I1I1lIlI[_lIIIlIlI(0xa5)] = nil
                   if _11I1lIlI[_lIIIlIlI(0x11)] ~= Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0xa7)] then
                   _Il11lIlI(_11I1lIlI[_lIIIlIlI(0x11)])
                   end
                   return
                   end
                  
                   local _Il11lIlI = _I1I1lIlI[_lIIIlIlI(0xa4)][_11I1lIlI[_lIIIlIlI(0x11)]]
                   if _Il11lIlI then _Il11lIlI() end
                  end))
                  
                  _l1IIlIlI[_lIIIlIlI(0xa8)] = _I1I1lIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  
                  local _1l11lIlI = {}
                  local _lI11lIlI, _II11lIlI
                  
                  local function _1I11lIlI()
                   if _lI11lIlI then return end
                   if not _l1IIlIlI[_lIIIlIlI(0xa9)] or not _l1IIlIlI[_lIIIlIlI(0xa9)][_lIIIlIlI(0xaa)] then return end
                  
                   _lI11lIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0xac),
                   Size = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xae)],
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   Visible = (0x0 == 0x1),
                   ZIndex = (((0x1c20 - 0x0) / 0x8)),
                   Parent = _l1IIlIlI[_lIIIlIlI(0xa9)][_lIIIlIlI(0xaa)],
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_lI11lIlI, (((0x30 - 0x0) / 0x8)))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lllIlIlI[_lIIIlIlI(0x3a)](_lI11lIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.3)
                   _1lI1lIlI:Register(_lI11lIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb1), {
                   PaddingLeft = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingRight = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingTop = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x28 - 0x0) / 0x8))),
                   PaddingBottom = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x28 - 0x0) / 0x8))),
                   Parent = _lI11lIlI,
                   })
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   _II11lIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Size = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xae)],
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIIlIlI(0x1d),
                   TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _lI11lIlI,
                   })
                   _1lI1lIlI:Register(_II11lIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                  end
                  
                  function _1l11lIlI.attach(_IllIlIlI, _lIIlIIlI)
                   if not _lIIlIIlI or _lIIlIIlI == _lIIIlIlI(0x1d) then return end
                   _1I11lIlI()
                  
                   _IllIlIlI[_lIIIlIlI(0xba)]:Connect(function()
                   if not _lI11lIlI then return end
                   _II11lIlI[_lIIIlIlI(0xbb)] = _lIIlIIlI
                   _lI11lIlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   local _l111lIlI, _I111lIlI = _IllIlIlI[_lIIIlIlI(0xbd)], _IllIlIlI[_lIIIlIlI(0xbe)]
                   local _1111lIlI = _l1IIlIlI[_lIIIlIlI(0xa9)][_lIIIlIlI(0xaa)][_lIIIlIlI(0xbd)]
                   _lI11lIlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)](
                   math[_lIIIlIlI(0x41)]((((0x20 - 0x0) / 0x8)), _l111lIlI[_lIIIlIlI(0x4d)] - _1111lIlI[_lIIIlIlI(0x4d)]),
                   _l111lIlI[_lIIIlIlI(0xbf)] - _1111lIlI[_lIIIlIlI(0xbf)] + _I111lIlI[_lIIIlIlI(0xbf)] + (((0x30 - 0x0) / 0x8)))
                   end)
                   _IllIlIlI[_lIIIlIlI(0xc0)]:Connect(function()
                   if _lI11lIlI then _lI11lIlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1) end
                   end)
                  end
                  
                  function _1l11lIlI.hide()
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if _lI11lIlI then _lI11lIlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1) end
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0xac)] = _1l11lIlI
                  
                  local _llllIIlI
                  do
                   local _I11IlIlI, _IlllIIlI = pcall(function() return gethui and gethui() end)
                   if _I11IlIlI and _IlllIIlI then _llllIIlI = _IlllIIlI end
                   if not _llllIIlI then
                   local _11l1lIlI = pcall(function()
                   local _1lllIIlI = Instance[_lIIIlIlI(0x2b)](_lIIIlIlI(0xc2))
                   _1lllIIlI[_lIIIlIlI(0x2c)] = _1I1IlIlI
                   _1lllIIlI:Destroy()
                   return (0x1 == 0x1)
                   end)
                   if _11l1lIlI then _llllIIlI = _1I1IlIlI end
                   end
                   if not _llllIIlI then _llllIIlI = _l11IlIlI:WaitForChild(_lIIIlIlI(0xc3)) end
                  end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                  local _lIllIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xc4), {
                   Name = _lIIIlIlI(0xc5),
                   ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_lIIIlIlI(0xc6)][_lIIIlIlI(0xc7)],
                   IgnoreGuiInset = (0x1 == 0x1),
                   DisplayOrder = (((0x1f48 - 0x0) / 0x8)),
                   Parent = _llllIIlI,
                  })
                  _l1IIlIlI[_lIIIlIlI(0xc8)] = _lIllIIlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                  local _IIllIIlI = {
                   LeftTopCornerNotification = { _llI1lIlI = Vector2[_lIIIlIlI(0x2b)]((0x19 - 0x19),(0x19 - 0x19)), _l1l1lIlI = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19),(((0x80 - 0x0) / 0x8)),(0x19 - 0x19),(((0x80 - 0x0) / 0x8))),
                   _IlI1lIlI = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xb7)], _IIlIlIlI = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xcb)], _I1IIlIlI = _lIIIlIlI(0xcc) },
                   RightTopCornerNotification = { _llI1lIlI = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a),(0x19 - 0x19)), _l1l1lIlI = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a),-(((0x80 - 0x0) / 0x8)),(0x19 - 0x19),(((0x80 - 0x0) / 0x8))),
                   _IlI1lIlI = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xcd)], _IIlIlIlI = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xcb)], _I1IIlIlI = _lIIIlIlI(0xce) },
                   LeftBottomCornerNotification = { _llI1lIlI = Vector2[_lIIIlIlI(0x2b)]((0x19 - 0x19),(0x2a / 0x2a)), _l1l1lIlI = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19),(((0x80 - 0x0) / 0x8)),(0x2a / 0x2a),-(((0x80 - 0x0) / 0x8))),
                   _IlI1lIlI = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xb7)], _IIlIlIlI = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xcf)], _I1IIlIlI = _lIIIlIlI(0xcc) },
                   RightBottomCornerNotification = { _llI1lIlI = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a),(0x2a / 0x2a)), _l1l1lIlI = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a),-(((0x80 - 0x0) / 0x8)),(0x2a / 0x2a),-(((0x80 - 0x0) / 0x8))),
                   _IlI1lIlI = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xcd)], _IIlIlIlI = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xcf)], _I1IIlIlI = _lIIIlIlI(0xce) },
                  }
                  
                  local _1IllIIlI = {}
                  local function _l1llIIlI(_l111lIlI)
                   if _1IllIIlI[_l111lIlI] then return _1IllIIlI[_l111lIlI] end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _I1llIIlI = _IIllIIlI[_l111lIlI] or _IIllIIlI[_111IlIlI[_lIIIlIlI(0xd0)]]
                   local _11llIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   AnchorPoint = _I1llIIlI[_lIIIlIlI(0xd1)],
                   Position = _I1llIIlI[_lIIIlIlI(0xd2)],
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xa00 - 0x0) / 0x8)), (0x19 - 0x19)),
                   AutomaticSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xbf)],
                   BackgroundTransparency = (0x2a / 0x2a),
                   Parent = _lIllIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0xd5)],
                   HorizontalAlignment = _I1llIIlI[_lIIIlIlI(0xd6)],
                   VerticalAlignment = _I1llIIlI[_lIIIlIlI(0xd7)],
                   SortOrder = Enum[_lIIIlIlI(0xd8)][_lIIIlIlI(0xd9)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   Parent = _11llIIlI,
                   })
                   _1IllIIlI[_l111lIlI] = { frame = _11llIIlI, _I1llIIlI = _I1llIIlI }
                   return _1IllIIlI[_l111lIlI]
                  end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                  local _llIlIIlI = (0x19 - 0x19)
                  
                  function _l1IIlIlI.Notify(_lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   local _IlIlIIlI = _lIl1IIlI[_lIIIlIlI(0xdb)] or _lIIIlIlI(0xdc)
                   local _1lIlIIlI = _lIl1IIlI[_lIIIlIlI(0xa3)] or _111IlIlI[_lIIIlIlI(0xdd)]
                   local _lIIlIIlI = _lIl1IIlI[_lIIIlIlI(0xb5)] or _lIIIlIlI(0x1d)
                   local _IIIlIIlI = _lIl1IIlI[_lIIIlIlI(0xde)]
                   if _IIIlIIlI == nil then _IIIlIIlI = (((0x28 - 0x0) / 0x8)) end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _1IIlIIlI = _l1IIlIlI[_lIIIlIlI(0x6d)][_lIIIlIlI(0x69)]()
                   if not _1IIlIIlI and (_IlIlIIlI == _lIIIlIlI(0xdf) or _IlIlIIlI == _lIIIlIlI(0xdc)) then
                   _IlIlIIlI = _lIIIlIlI(0xe0)
                   end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   _llIlIIlI = _llIlIIlI + (0x2a / 0x2a)
                   local _l1IlIIlI = _l1llIIlI(_lIl1IIlI[_lIIIlIlI(0xe1)] or _111IlIlI[_lIIIlIlI(0xd0)])
                   local _I1IlIIlI = _l1IlIIlI[_lIIIlIlI(0xe2)][_lIIIlIlI(0xe3)]
                  
                   local _11IlIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ClipsDescendants = (0x1 == 0x1),
                   LayoutOrder = _llIlIIlI,
                   Parent = _l1IlIIlI[_lIIIlIlI(0xe4)],
                   })
                   local _ll1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x1f0 - 0x0) / 0x8))),
                   Position = _I1IlIIlI == _lIIIlIlI(0xce)
                   and UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19))
                   or UDim2[_lIIIlIlI(0x2b)](-(0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xe5)),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _11IlIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_ll1lIIlI, (((0x40 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x3a)](_ll1lIIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.4)
                   _1lI1lIlI:Register(_ll1lIIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xe5))
                  
                   _lllIlIlI[_lIIIlIlI(0x32)](_11IlIIlI, 0.32, { Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x1f0 - 0x0) / 0x8))) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   _lllIlIlI[_lIIIlIlI(0x32)](_ll1lIIlI, 0.38, { Position = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  
                   local _Il1lIIlI = (((0x60 - 0x0) / 0x8))
                   if (_IlIlIIlI == _lIIIlIlI(0xdf) or _IlIlIIlI == _lIIIlIlI(0xdc)) and _1IIlIIlI then
                   local _1l1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xe6), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x60 - 0x0) / 0x8)), (((0x90 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Image = _1IIlIIlI,
                   ImageColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xe7)),
                   Parent = _ll1lIIlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _1lI1lIlI:Register(_1l1lIIlI, _lIIIlIlI(0xe8), _lIIIlIlI(0xe7))
                   _Il1lIIlI = (((0x180 - 0x0) / 0x8))
                   end
                  
                   if _IlIlIIlI == _lIIIlIlI(0xe0) or _IlIlIIlI == _lIIIlIlI(0xdc) then
                   local _lI1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)](_Il1lIIlI, (((0x50 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_Il1lIIlI - (((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0x80 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _1lIlIIlI, TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _ll1lIIlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _1lI1lIlI:Register(_lI1lIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                   local _II1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)](_Il1lIIlI, (((0xe0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_Il1lIIlI - (((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIlIIlI, TextSize = (((0x60 - 0x0) / 0x8)),
                   TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   TextYAlignment = Enum[_lIIIlIlI(0xeb)][_lIIIlIlI(0xcb)],
                   Parent = _ll1lIIlI,
                   })
                   _1lI1lIlI:Register(_II1lIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                   else
                   local _II1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)](_Il1lIIlI, (((0x30 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_Il1lIIlI - (((0x140 - 0x0) / 0x8)), (0x2a / 0x2a), -(((0x60 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xec)],
                   Text = _lIIlIIlI, TextSize = (((0x68 - 0x0) / 0x8)),
                   TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   TextYAlignment = Enum[_lIIIlIlI(0xeb)][_lIIIlIlI(0xed)],
                   Parent = _ll1lIIlI,
                   })
                   _1lI1lIlI:Register(_II1lIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                   end
                  
                   local _1I1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x30 - 0x0) / 0x8)), (0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xee)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0xef), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _ll1lIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1I1lIIlI, (((0x20 - 0x0) / 0x8)))
                   _1lI1lIlI:Register(_1I1lIIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xee))
                   _1lI1lIlI:Register(_1I1lIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _l11lIIlI = (0x0 == 0x1)
                   local function _I11lIIlI()
                   if _l11lIIlI then return end
                   _l11lIIlI = (0x1 == 0x1)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x32)](_ll1lIIlI, 0.32, {
                   Position = _I1IlIIlI == _lIIIlIlI(0xce)
                   and UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19))
                   or UDim2[_lIIIlIlI(0x2b)](-(0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0xf0)])
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   local _l1lIlIlI = _lllIlIlI[_lIIIlIlI(0x32)](_11IlIIlI, 0.32, { Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0xf0)])
                   _l1lIlIlI[_lIIIlIlI(0xf1)]:Connect(function() _11IlIIlI:Destroy() end)
                   end
                   _1I1lIIlI[_lIIIlIlI(0xf2)]:Connect(_I11lIIlI)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if _IIIlIIlI > (0x19 - 0x19) then task[_lIIIlIlI(0xf3)](_IIIlIIlI, _I11lIIlI) end
                  
                   return { _I11lIIlI = _I11lIIlI }
                  end
                  
                  
                  local _111lIIlI = _lIllIIlI[_lIIIlIlI(0x2c)]
                  
                  local _lllIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xc4), {
                   Name = _lIIIlIlI(0xf4),
                   ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_lIIIlIlI(0xc6)][_lIIIlIlI(0xc7)],
                   IgnoreGuiInset = (0x1 == 0x1),
                   DisplayOrder = (((0x1f50 - 0x0) / 0x8)),
                   Parent = _111lIIlI,
                  })
                  _l1IIlIlI[_lIIIlIlI(0xf5)] = _lllIIIlI
                  
                  local _IllIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0xf6),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x80 - 0x0) / 0x8)), (0x19 - 0x19), (((0x80 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x5a0 - 0x0) / 0x8)), (((0x3b0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   Visible = (0x0 == 0x1),
                   Parent = _lllIIIlI,
                  })
                  _lllIlIlI[_lIIIlIlI(0x37)](_IllIIIlI, (((0x40 - 0x0) / 0x8)))
                  _lllIlIlI[_lIIIlIlI(0x3a)](_IllIIIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.4)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  _1lI1lIlI:Register(_IllIIIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  
                  local _1llIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)), (((0x30 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0xf7), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _IllIIIlI,
                  })
                  _1lI1lIlI:Register(_1llIIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                  local _lIlIIIlI = {}
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  for _IlIIlIlI, _I1IIlIlI in ipairs({
                   { _11I1IIlI = _lIIIlIlI(0xf8), _lII11IlI = _lIIIlIlI(0xf9), init = _lIIIlIlI(0xfa) },
                   { _11I1IIlI = _lIIIlIlI(0xfb), _lII11IlI = _lIIIlIlI(0xfc), init = _lIIIlIlI(0xfd) },
                   { _11I1IIlI = _lIIIlIlI(0xfe), _lII11IlI = _lIIIlIlI(0x4), init = _lIIIlIlI(0xff) },
                   { _11I1IIlI = _lIIIlIlI(0x100), _lII11IlI = _lIIIlIlI(0x101), init = _lIIIlIlI(0x102) },
                   { _11I1IIlI = _lIIIlIlI(0x103), _lII11IlI = _lIIIlIlI(0x104), init = _lIIIlIlI(0x105) },
                  }) do
                   local _IIlIIIlI = (((0xb0 - 0x0) / 0x8)) + (_IlIIlIlI - (0x2a / 0x2a)) * (((0x90 - 0x0) / 0x8))
                   local _1IlIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)), _IIlIIIlI),
                   Size = UDim2[_lIIIlIlI(0x2b)](0.5, -(((0x50 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _I1IIlIlI[_lIIIlIlI(0x106)], TextSize = (((0x58 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _IllIIIlI,
                   })
                   _1lI1lIlI:Register(_1IlIIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                   local _l1lIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x2b)](0.5, (0x19 - 0x19), (0x19 - 0x19), _IIlIIIlI),
                   Size = UDim2[_lIIIlIlI(0x2b)](0.5, -(((0x50 - 0x0) / 0x8)), (0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _I1IIlIlI[_lIIIlIlI(0x107)], TextSize = (((0x58 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x108)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xcd)],
                   Parent = _IllIIIlI,
                   })
                   _1lI1lIlI:Register(_l1lIIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0x108))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lIlIIIlI[_I1IIlIlI[_lIIIlIlI(0x9a)]] = _l1lIIIlI
                  end
                  
                  
                  do
                   _IllIIIlI[_lIIIlIlI(0xa6)]:Connect(function(_11I1lIlI)
                   if _11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   or _11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   local _I1lIIIlI = _IllIIIlI[_lIIIlIlI(0x4c)]
                   local _11lIIIlI, _llIIIIlI = _11I1lIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0x4d)], _11I1lIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0xbf)]
                   _lllIlIlI[_lIIIlIlI(0x109)] = { _11lIIIlI = _11lIIIlI, _llIIIIlI = _llIIIIlI, _I1lIIIlI = _I1lIIIlI }
                   end
                   end)
                  end
                  
                  
                  _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x47)]:Connect(function(_IlIIlIlI)
                   local _1lIIlIlI = _l1IIlIlI[_lIIIlIlI(0x109)]
                   if not _1lIIlIlI then return end
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x49)]
                   or _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   local _IlIIIIlI = _IlIIlIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0x4d)] - _1lIIlIlI[_lIIIlIlI(0x10a)]
                   local _1lIIIIlI = _IlIIlIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0xbf)] - _1lIIlIlI[_lIIIlIlI(0x10b)]
                   _IllIIIlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x2b)](
                   _1lIIlIlI[_lIIIlIlI(0x10c)][_lIIIlIlI(0x4d)][_lIIIlIlI(0x10d)], _1lIIlIlI[_lIIIlIlI(0x10c)][_lIIIlIlI(0x4d)][_lIIIlIlI(0x10e)] + _IlIIIIlI,
                   _1lIIlIlI[_lIIIlIlI(0x10c)][_lIIIlIlI(0xbf)][_lIIIlIlI(0x10d)], _1lIIlIlI[_lIIIlIlI(0x10c)][_lIIIlIlI(0xbf)][_lIIIlIlI(0x10e)] + _1lIIIIlI)
                   end
                  end))
                  _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x4e)]:Connect(function(_IlIIlIlI)
                   if _l1IIlIlI[_lIIIlIlI(0x109)] then
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   or _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   _l1IIlIlI[_lIIIlIlI(0x109)] = nil
                   end
                   end
                  end))
                  
                  local _lIIIIIlI = os[_lIIIlIlI(0x10f)]()
                  
                  
                  
                  
                  
                  
                  local function _IIIIIIlI()
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _1IIIIIlI = _l1I1lIlI[_lIIIlIlI(0x110)]
                   local _l1IIIIlI = os[_lIIIlIlI(0x10f)]()
                   while _l1I1lIlI[_lIIIlIlI(0x111)] do
                   task[_lIIIlIlI(0x112)](0.5)
                   local _I1IIIIlI = _l1I1lIlI[_lIIIlIlI(0x110)]
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _11IIIIlI = os[_lIIIlIlI(0x10f)]()
                   local _ll1IIIlI = _11IIIIlI - _l1IIIIlI
                   if _ll1IIIlI >= 0.9 then
                   local _Il1IIIlI = math[_lIIIlIlI(0x22)]((_I1IIIIlI - _1IIIIIlI) / _ll1IIIlI + 0.5)
                   _1IIIIIlI = _I1IIIIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _l1IIIIlI = _11IIIIlI
                  
                   local _1l1IIIlI = (0x19 - 0x19)
                   pcall(function()
                   _1l1IIIlI = math[_lIIIlIlI(0x22)](_lI1IlIlI[_lIIIlIlI(0x113)][_lIIIlIlI(0x114)][_lIIIlIlI(0x115)]:GetValue())
                   end)
                   local _lI1IIIlI = (0x19 - 0x19)
                   pcall(function() _lI1IIIlI = math[_lIIIlIlI(0x22)](_lI1IlIlI:GetTotalMemoryUsageMb()) end)
                  
                   if _lIlIIIlI[_lIIIlIlI(0xf8)] then _lIlIIIlI[_lIIIlIlI(0xf8)][_lIIIlIlI(0xbb)] = tostring(_Il1IIIlI) end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _lIlIIIlI[_lIIIlIlI(0xfb)] then _lIlIIIlI[_lIIIlIlI(0xfb)][_lIIIlIlI(0xbb)] = tostring(_1l1IIIlI) .. _lIIIlIlI(0x116) end
                   if _lIlIIIlI[_lIIIlIlI(0xfe)] then _lIlIIIlI[_lIIIlIlI(0xfe)][_lIIIlIlI(0xbb)] = tostring(#_Il1IlIlI:GetPlayers()) end
                   if _lIlIIIlI[_lIIIlIlI(0x100)] then _lIlIIIlI[_lIIIlIlI(0x100)][_lIIIlIlI(0xbb)] = tostring(_lI1IIIlI) .. _lIIIlIlI(0x117) end
                   if _lIlIIIlI[_lIIIlIlI(0x103)] then
                   local _I1IIlIlI = math[_lIIIlIlI(0x22)](_11IIIIlI - _lIIIIIlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   local _II1IIIlI = math[_lIIIlIlI(0x22)](_I1IIlIlI / (((0x7080 - 0x0) / 0x8))); _I1IIlIlI = _I1IIlIlI % (((0x7080 - 0x0) / 0x8))
                   local _1I1IIIlI = math[_lIIIlIlI(0x22)](_I1IIlIlI / (((0x1e0 - 0x0) / 0x8))); _I1IIlIlI = _I1IIlIlI % (((0x1e0 - 0x0) / 0x8))
                   _lIlIIIlI[_lIIIlIlI(0x103)][_lIIIlIlI(0xbb)] = string[_lIIIlIlI(0x20)](_lIIIlIlI(0x118), _II1IIIlI, _1I1IIIlI, ss or _I1IIlIlI)
                   end
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                  end
                  
                  function _l1IIlIlI.SetStats(_l1I1IIlI)
                   _l1I1lIlI[_lIIIlIlI(0x111)] = _l1I1IIlI
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _IllIIIlI[_lIIIlIlI(0xbc)] = _l1I1IIlI
                   if _l1I1IIlI then task[_lIIIlIlI(0x11a)](_IIIIIIlI) end
                  end
                  
                  
                  local _l11IIIlI = {}
                  
                  local function _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _IIl1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = tostring(_1ll1IIlI) .. _lIIIlIlI(0x11b),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_lll1IIlI, (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x11c)]),
                   BackgroundTransparency = (0x2a / 0x2a),
                   LayoutOrder = _Ill1IIlI,
                   Parent = _111IIIlI,
                   })
                   local _1Il1IIlI = (((0x20 - 0x0) / 0x8))
                   local _l1l1IIlI = -(((0x20 - 0x0) / 0x8))
                   local _1IlIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)](_1Il1IIlI, (((0x48 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_1Il1IIlI + _l1l1IIlI - (((0x20 - 0x0) / 0x8)), (0x19 - 0x19), (((0x90 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xec)],
                   Text = tostring(_1ll1IIlI), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   TextYAlignment = Enum[_lIIIlIlI(0xeb)][_lIIIlIlI(0xed)],
                   TextTruncate = Enum[_lIIIlIlI(0x11d)][_lIIIlIlI(0x11e)],
                   Parent = _IIl1IIlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _1lI1lIlI:Register(_1IlIIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                   return _IIl1IIlI, _1IlIIIlI, _l1l1IIlI, _1Il1IIlI
                  end
                  
                  function _l11IIIlI.toggle(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _I1l1IIlI = _lIl1IIlI[_lIIIlIlI(0x11f)] or (0x0 == 0x1)
                   local _Il11lIlI = _lIl1IIlI[_lIIIlIlI(0x120)]
                   local _IIl1IIlI = _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   local _11l1IIlI = _I1l1IIlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _llI1IIlI
                  
                   local _IlI1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x360 - 0x0) / 0x8)), 0.5, -(((0x60 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x200 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIIlIlI(0x121), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_IlI1IIlI, (((0x30 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x3a)](_IlI1IIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _1lI1lIlI:Register(_IlI1IIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                   _1lI1lIlI:Register(_IlI1IIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _1lI1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x130 - 0x0) / 0x8)), 0.5, -(((0x58 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x130 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x122)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Text = _lIIIlIlI(0x1d),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1lI1IIlI, (((0x30 - 0x0) / 0x8)))
                  
                   local _lII1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x18 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x80 - 0x0) / 0x8)), (((0x80 - 0x0) / 0x8))),
                   BackgroundColor3 = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _1lI1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_lII1IIlI, (((0x40 - 0x0) / 0x8)))
                  
                   local function _III1IIlI()
                   return _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa2)] or _1lI1lIlI:Get(_lIIIlIlI(0x123))
                   end
                  
                   local function _1II1IIlI(_l1I1IIlI, _I1I1IIlI)
                   _11l1IIlI = _l1I1IIlI
                   _lllIlIlI[_lIIIlIlI(0x32)](_1lI1IIlI, 0.18, {
                   BackgroundColor3 = _l1I1IIlI and _III1IIlI() or _1lI1lIlI:Get(_lIIIlIlI(0x122)),
                   })
                   _lllIlIlI[_lIIIlIlI(0x32)](_lII1IIlI, 0.18, {
                   Position = _l1I1IIlI and UDim2[_lIIIlIlI(0x15)]((((0x98 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))) or UDim2[_lIIIlIlI(0x15)]((((0x18 - 0x0) / 0x8)), (((0x18 - 0x0) / 0x8))),
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _I1I1IIlI and _Il11lIlI then pcall(_Il11lIlI, _l1I1IIlI) end
                   end
                  
                   _1lI1IIlI[_lIIIlIlI(0xf2)]:Connect(function() _1II1IIlI(not _11l1IIlI, (0x1 == 0x1)) end)
                   _IlI1IIlI[_lIIIlIlI(0xf2)]:Connect(function()
                   _IlI1IIlI[_lIIIlIlI(0xbb)] = _lIIIlIlI(0x124)
                   _I1I1lIlI:BeginCapture(function(_11I1IIlI)
                   if _llI1IIlI then _I1I1lIlI:Unregister(_llI1IIlI) end
                   _llI1IIlI = _11I1IIlI
                   _IlI1IIlI[_lIIIlIlI(0xbb)] = _11I1IIlI[_lIIIlIlI(0x125)]
                   _I1I1lIlI:Register(_11I1IIlI, function() _1II1IIlI(not _11l1IIlI, (0x1 == 0x1)) end)
                   end)
                   end)
                  
                   table[_lIIIlIlI(0x45)](_l1I1lIlI[_lIIIlIlI(0x126)], {
                   _1lI1IIlI = _1lI1IIlI,
                   refresh = function()
                   if _11l1IIlI then
                   _lllIlIlI[_lIIIlIlI(0x32)](_1lI1IIlI, 0.2, { BackgroundColor3 = _III1IIlI() })
                   end
                   end,
                   })
                  
                   _1II1IIlI(_I1l1IIlI, (0x0 == 0x1))
                  
                   return {
                   _IIl1IIlI = _IIl1IIlI,
                   set = function(_IIlIlIlI) _1II1IIlI(_IIlIlIlI, (0x1 == 0x1)) end,
                   get = function() return _11l1IIlI end,
                   }
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  end
                  
                  
                  
                  
                  
                  
                  function _l11IIIlI.slider(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _ll11IIlI = _lIl1IIlI[_lIIIlIlI(0x42)] or (0x19 - 0x19)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _Il11IIlI = _lIl1IIlI[_lIIIlIlI(0x41)] or (((0x320 - 0x0) / 0x8))
                   local _I1l1IIlI = _lIl1IIlI[_lIIIlIlI(0x11f)] or (((0x190 - 0x0) / 0x8))
                   local _Il11lIlI = _lIl1IIlI[_lIIIlIlI(0x120)]
                  
                   local _IIl1IIlI, _1IlIIIlI, _l1l1IIlI, _1Il1IIlI = _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _IIl1IIlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_lll1IIlI, (0x19 - 0x19), (((0x180 - 0x0) / 0x8)))
                   _1IlIIIlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)](_1Il1IIlI, (((0x20 - 0x0) / 0x8)))
                   _1IlIIIlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_1Il1IIlI - (((0x230 - 0x0) / 0x8)), (0x19 - 0x19), (((0x90 - 0x0) / 0x8)))
                  
                   local _1l11IIlI = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0x9f)] or _1lI1lIlI:Get(_lIIIlIlI(0x108))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   local _lI11IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), _l1l1IIlI, (0x19 - 0x19), (((0x20 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x200 - 0x0) / 0x8)), (((0x90 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xec)],
                   Text = tostring(_I1l1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1l11IIlI,
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xcd)],
                   Parent = _IIl1IIlI,
                   })
                   _1lI1lIlI:Register(_lI11IIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0x108))
                  
                   local _II11IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x20 - 0x0) / 0x8)), (((0xf0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x40 - 0x0) / 0x8)), (0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xee)),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_II11IIlI, (((0x18 - 0x0) / 0x8)))
                   _1lI1lIlI:Register(_II11IIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xee))
                  
                   local _1I11IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Size = UDim2[_lIIIlIlI(0x128)]((_I1l1IIlI - _ll11IIlI) / (_Il11IIlI - _ll11IIlI), (0x2a / 0x2a)),
                   BackgroundColor3 = _1l11IIlI,
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _II11IIlI,
                   })
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_1I11IIlI, (((0x18 - 0x0) / 0x8)))
                  
                   table[_lIIIlIlI(0x45)](_l1I1lIlI[_lIIIlIlI(0x129)], {
                   _1I11IIlI = _1I11IIlI,
                   _lI11IIlI = _lI11IIlI,
                   applyColor = function(_llIIlIlI)
                   _1I11IIlI[_lIIIlIlI(0xb0)] = _llIIlIlI
                   _lI11IIlI[_lIIIlIlI(0xb8)] = _llIIlIlI
                   end,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   local _lII1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)](0.5, 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((_I1l1IIlI - _ll11IIlI) / (_Il11IIlI - _ll11IIlI), (0x19 - 0x19), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x70 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))),
                   BackgroundColor3 = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _II11IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_lII1IIlI, (((0x38 - 0x0) / 0x8)))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _l111IIlI = _I1l1IIlI
                  
                   local function _I111IIlI(_1I1lIIlI)
                   local _1111IIlI = _lllIlIlI[_lIIIlIlI(0x40)](
                   (_1I1lIIlI - _II11IIlI[_lIIIlIlI(0xbd)][_lIIIlIlI(0x4d)]) / math[_lIIIlIlI(0x41)]((0x2a / 0x2a), _II11IIlI[_lIIIlIlI(0xbe)][_lIIIlIlI(0x4d)]), (0x19 - 0x19), (0x2a / 0x2a))
                   local _IIlIlIlI = math[_lIIIlIlI(0x22)](_ll11IIlI + (_Il11IIlI - _ll11IIlI) * _1111IIlI + 0.5)
                   return _IIlIlIlI, _1111IIlI
                   end
                  
                   local function _llll1IlI(_IIlIlIlI, _1111IIlI)
                   _lI11IIlI[_lIIIlIlI(0xbb)] = tostring(_IIlIlIlI)
                   _1I11IIlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x128)](_1111IIlI, (0x2a / 0x2a))
                   _lII1IIlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x2b)](_1111IIlI, (0x19 - 0x19), 0.5, (0x19 - 0x19))
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   _II11IIlI[_lIIIlIlI(0xa6)]:Connect(function(_IlIIlIlI)
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   or _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   _lIIIlIlI[_lIIIlIlI(0x31)]()
                   local _IIlIlIlI, _1111IIlI = _I111IIlI(_IlIIlIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0x4d)])
                   _l111IIlI = _IIlIlIlI
                   _llll1IlI(_IIlIlIlI, _1111IIlI)
                   _l1IIlIlI[_lIIIlIlI(0x1a)] = {
                   update = function(_1I1lIIlI)
                   local _Illl1IlI, _1lll1IlI = _I111IIlI(_1I1lIIlI)
                   _l111IIlI = _Illl1IlI
                   _llll1IlI(_Illl1IlI, _1lll1IlI)
                   end,
                   finish = function()
                   if _Il11lIlI then pcall(_Il11lIlI, _l111IIlI) end
                   end,
                   }
                   end
                   end)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   return { _IIl1IIlI = _IIl1IIlI }
                  end
                  
                  function _l11IIIlI.input(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _I1l1IIlI = _lIl1IIlI[_lIIIlIlI(0x11f)] or (0x19 - 0x19)
                   local _lIll1IlI, _IIll1IlI = _lIl1IIlI[_lIIIlIlI(0x42)], _lIl1IIlI[_lIIIlIlI(0x41)]
                   local _1Ill1IlI = _lIl1IIlI[_lIIIlIlI(0x12b)] ~= (0x0 == 0x1)
                   local _Il11lIlI = _lIl1IIlI[_lIIIlIlI(0x120)]
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _IIl1IIlI, _11lIlIlI, _l1l1IIlI = _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   local _l1ll1IlI = _I1l1IIlI
                  
                   local _1lI1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x12c), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), _l1l1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = tostring(_I1l1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   PlaceholderText = tostring(_I1l1IIlI),
                   PlaceholderColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   ClearTextOnFocus = (0x0 == 0x1),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xed)],
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1lI1IIlI, (((0x30 - 0x0) / 0x8)))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _I1ll1IlI = _lllIlIlI[_lIIIlIlI(0x3a)](_1lI1IIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_1lI1IIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                   _1lI1lIlI:Register(_1lI1IIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                  
                   local function _11ll1IlI(_llIIlIlI, _llIl1IlI)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1ll1IlI, 0.12, { Color = _llIIlIlI })
                   task[_lIIIlIlI(0xf3)](_llIl1IlI or 0.55, function()
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1ll1IlI, 0.3, { Color = _1lI1lIlI:Get(_lIIIlIlI(0x3c)) })
                   end)
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local function _IlIl1IlI()
                   local _1lIl1IlI = (_1lI1IIlI[_lIIIlIlI(0xbb)] or _lIIIlIlI(0x1d)):gsub(_lIIIlIlI(0x12d), _lIIIlIlI(0x1d))
                   local _lIIl1IlI = tonumber(_1lIl1IlI)
                   if not _lIIl1IlI then
                   _11ll1IlI(_1lI1lIlI:Get(_lIIIlIlI(0x12e)))
                   _1lI1IIlI[_lIIIlIlI(0xbb)] = tostring(_l1ll1IlI)
                   return
                   end
                   if _1Ill1IlI then _lIIl1IlI = math[_lIIIlIlI(0x22)](_lIIl1IlI + 0.5) end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if _lIll1IlI and _lIIl1IlI < _lIll1IlI then _lIIl1IlI = _lIll1IlI end
                   if _IIll1IlI and _lIIl1IlI > _IIll1IlI then _lIIl1IlI = _IIll1IlI end
                   _l1ll1IlI = _lIIl1IlI
                   _1lI1IIlI[_lIIIlIlI(0xbb)] = tostring(_lIIl1IlI)
                   _11ll1IlI(_1lI1lIlI:Get(_lIIIlIlI(0x12f)), 0.4)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if _Il11lIlI then pcall(_Il11lIlI, _lIIl1IlI) end
                   end
                  
                   _1lI1IIlI[_lIIIlIlI(0x130)]:Connect(_IlIl1IlI)
                   _1lI1IIlI:GetPropertyChangedSignal(_lIIIlIlI(0xbb)):Connect(function()
                   local _llIIlIlI = _1lI1IIlI[_lIIIlIlI(0xbb)]:gsub(_lIIIlIlI(0x12d), _lIIIlIlI(0x1d))
                   if _llIIlIlI ~= _1lI1IIlI[_lIIIlIlI(0xbb)] then
                   _1lI1IIlI[_lIIIlIlI(0xbb)] = _llIIlIlI
                   _1lI1IIlI[_lIIIlIlI(0x131)] = #_llIIlIlI + (0x2a / 0x2a)
                   end
                   end)
                  
                   if _Il11lIlI then pcall(_Il11lIlI, _I1l1IIlI) end
                  
                   return { _IIl1IIlI = _IIl1IIlI }
                  end
                  
                  function _l11IIIlI.keybind(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _I1l1IIlI = _lIl1IIlI[_lIIIlIlI(0x11f)]
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _Il11lIlI = _lIl1IIlI[_lIIIlIlI(0x120)]
                  
                   local _IIl1IIlI, _11lIlIlI, _l1l1IIlI = _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                  
                   local _IIIl1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), _l1l1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _I1l1IIlI and _I1l1IIlI[_lIIIlIlI(0x125)] or _lIIIlIlI(0x121),
                   TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_IIIl1IlI, (((0x30 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x3a)](_IIIl1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_IIIl1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _1lI1lIlI:Register(_IIIl1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _l1ll1IlI = _I1l1IIlI
                   local function _1IIl1IlI(_lIlIlIlI)
                   _l1ll1IlI = _lIlIlIlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _IIIl1IlI[_lIIIlIlI(0xbb)] = _lIlIlIlI and _lIlIlIlI[_lIIIlIlI(0x125)] or _lIIIlIlI(0x121)
                   if _Il11lIlI then pcall(_Il11lIlI, _lIlIlIlI) end
                   end
                  
                   _IIIl1IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   _IIIl1IlI[_lIIIlIlI(0xbb)] = _lIIIlIlI(0x133)
                   _I1I1lIlI:BeginCapture(function(_11I1IIlI)
                   if _11I1IIlI == Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x134)] then
                   _1IIl1IlI(nil)
                   else
                   _1IIl1IlI(_11I1IIlI)
                   end
                   end)
                   end)
                  
                   return { _IIl1IIlI = _IIl1IIlI }
                  end
                  
                  function _l11IIIlI.colorPicker(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _l1Il1IlI = _lIl1IIlI[_lIIIlIlI(0x11f)] or _111IlIlI[_lIIIlIlI(0xa0)]
                   local _Il11lIlI = _lIl1IIlI[_lIIIlIlI(0x120)]
                  
                   local _IIl1IIlI, _11lIlIlI, _l1l1IIlI = _I11IIIlI(_111IIIlI, _lll1IIlI, _Ill1IIlI, _1ll1IIlI, _lIl1IIlI)
                   local _l1ll1IlI = _lllIlIlI[_lIIIlIlI(0x26)](_l1Il1IlI) or Color3[_lIIIlIlI(0x1e)]((((0x500 - 0x0) / 0x8)), (((0x100 - 0x0) / 0x8)), (((0x780 - 0x0) / 0x8)))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   local _I1Il1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), _l1l1IIlI - (((0x2f0 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xc0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _l1ll1IlI,
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_I1Il1IlI, (((0x20 - 0x0) / 0x8)))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x3a)](_I1Il1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.3)
                  
                   local _1lI1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x12c), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), _l1l1IIlI, 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x2d0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lllIlIlI[_lIIIlIlI(0x1f)](_l1ll1IlI), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   PlaceholderText = _l1Il1IlI,
                   PlaceholderColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   ClearTextOnFocus = (0x0 == 0x1),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xed)],
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1lI1IIlI, (((0x30 - 0x0) / 0x8)))
                   local _I1ll1IlI = _lllIlIlI[_lIIIlIlI(0x3a)](_1lI1IIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_1lI1IIlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _1lI1lIlI:Register(_1lI1IIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                  
                   local function _11ll1IlI(_llIIlIlI, _llIl1IlI)
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1ll1IlI, 0.12, { Color = _llIIlIlI })
                   task[_lIIIlIlI(0xf3)](_llIl1IlI or 0.55, function()
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1ll1IlI, 0.3, { Color = _1lI1lIlI:Get(_lIIIlIlI(0x3c)) })
                   end)
                   end
                  
                   local function _IlIl1IlI()
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _llIIlIlI = _lllIlIlI[_lIIIlIlI(0x26)](_1lI1IIlI[_lIIIlIlI(0xbb)] or _lIIIlIlI(0x1d))
                   if not _llIIlIlI then
                   _11ll1IlI(_1lI1lIlI:Get(_lIIIlIlI(0x12e)))
                   _1lI1IIlI[_lIIIlIlI(0xbb)] = _lllIlIlI[_lIIIlIlI(0x1f)](_l1ll1IlI)
                   return
                   end
                   _l1ll1IlI = _llIIlIlI
                   _1lI1IIlI[_lIIIlIlI(0xbb)] = _lllIlIlI[_lIIIlIlI(0x1f)](_llIIlIlI)
                   _I1Il1IlI[_lIIIlIlI(0xb0)] = _llIIlIlI
                   _11ll1IlI(_1lI1lIlI:Get(_lIIIlIlI(0x12f)), 0.4)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if _Il11lIlI then pcall(_Il11lIlI, _llIIlIlI, _lllIlIlI[_lIIIlIlI(0x1f)](_llIIlIlI)) end
                   end
                  
                   _1lI1IIlI[_lIIIlIlI(0x130)]:Connect(_IlIl1IlI)
                   if _Il11lIlI then pcall(_Il11lIlI, _l1ll1IlI, _lllIlIlI[_lIIIlIlI(0x1f)](_l1ll1IlI)) end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   return { _IIl1IIlI = _IIl1IIlI, _I1Il1IlI = _I1Il1IlI }
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x136)] = _l11IIIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  
                  local _11Il1IlI = {}
                  
                  local function _ll1l1IlI(_111IIIlI, _lll1IIlI)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _llIIlIlI = { _111IIIlI = _111IIIlI, _lll1IIlI = _lll1IIlI or (0x19 - 0x19), _ord = (0x19 - 0x19) }
                   function _llIIlIlI:nextOrder() self[_lIIIlIlI(0x137)] = self[_lIIIlIlI(0x137)] + (0x2a / 0x2a); return self[_lIIIlIlI(0x137)] end
                   function _llIIlIlI:CreateToggle(_1l1l1IlI, _lI1l1IlI) return _l11IIIlI[_lIIIlIlI(0xa2)](self[_lIIIlIlI(0x138)], self[_lIIIlIlI(0x139)], self:nextOrder(), _1l1l1IlI, _lI1l1IlI) end
                   function _llIIlIlI:CreateSlider(_1l1l1IlI, _lI1l1IlI) return _l11IIIlI[_lIIIlIlI(0x9f)](self[_lIIIlIlI(0x138)], self[_lIIIlIlI(0x139)], self:nextOrder(), _1l1l1IlI, _lI1l1IlI) end
                   function _llIIlIlI:CreateInput(_1l1l1IlI, _lI1l1IlI) return _l11IIIlI[_lIIIlIlI(0x12a)](self[_lIIIlIlI(0x138)], self[_lIIIlIlI(0x139)], self:nextOrder(), _1l1l1IlI, _lI1l1IlI) end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   function _llIIlIlI:CreateKeybind(_1l1l1IlI, _lI1l1IlI) return _l11IIIlI[_lIIIlIlI(0x132)](self[_lIIIlIlI(0x138)], self[_lIIIlIlI(0x139)], self:nextOrder(), _1l1l1IlI, _lI1l1IlI) end
                   function _llIIlIlI:CreateColorPicker(_1l1l1IlI, _lI1l1IlI) return _l11IIIlI[_lIIIlIlI(0x135)](self[_lIIIlIlI(0x138)], self[_lIIIlIlI(0x139)], self:nextOrder(), _1l1l1IlI, _lI1l1IlI) end
                   function _llIIlIlI:CreateSection(_1lIlIIlI) return _11Il1IlI[_lIIIlIlI(0x13a)](self, _1lIlIIlI) end
                   function _llIIlIlI:CreateDropdown(_1l1l1IlI, _lI1l1IlI) return _11Il1IlI[_lIIIlIlI(0x13b)](self, _1l1l1IlI, _lI1l1IlI) end
                   return _llIIlIlI
                  end
                  
                  _11Il1IlI[_lIIIlIlI(0x13c)] = _ll1l1IlI
                  
                  function _11Il1IlI.section(_I1lllIlI, _1lIlIIlI)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _Il1l1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Name = tostring(_1lIlIIlI) .. _lIIIlIlI(0x13d),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_I1lllIlI[_lIIIlIlI(0x139)], (0x19 - 0x19), (((0xd0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = tostring(_1lIlIIlI), TextSize = (((0x60 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   AutoButtonColor = (0x0 == 0x1),
                   LayoutOrder = _I1lllIlI:nextOrder(),
                   Parent = _I1lllIlI[_lIIIlIlI(0x138)],
                   })
                   _1lI1lIlI:Register(_Il1l1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                   return {
                   _IIl1IIlI = _Il1l1IlI,
                   CreateToggle = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateToggle(_1l1l1IlI, _lI1l1IlI) end,
                   CreateSlider = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateSlider(_1l1l1IlI, _lI1l1IlI) end,
                   CreateInput = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateInput(_1l1l1IlI, _lI1l1IlI) end,
                   CreateKeybind = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateKeybind(_1l1l1IlI, _lI1l1IlI) end,
                   CreateColorPicker = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateColorPicker(_1l1l1IlI, _lI1l1IlI) end,
                   CreateSection = function(_11lIlIlI, _1lllIIlI) return _I1lllIlI:CreateSection(_1lllIIlI) end,
                   CreateDropdown = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _I1lllIlI:CreateDropdown(_1l1l1IlI, _lI1l1IlI) end,
                   }
                  end
                  
                  function _11Il1IlI.dropdown(_I1lllIlI, _1ll1IIlI, _lIl1IIlI)
                   _lIl1IIlI = _lIl1IIlI or {}
                   local _II1l1IlI = _lIl1IIlI[_lIIIlIlI(0x11f)] == (0x1 == 0x1)
                  
                   local _1I1l1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Name = tostring(_1ll1IIlI) .. _lIIIlIlI(0x13e),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_I1lllIlI[_lIIIlIlI(0x139)], (0x19 - 0x19), (((0x110 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Text = _lIIIlIlI(0x1d),
                   LayoutOrder = _I1lllIlI:nextOrder(),
                   Parent = _I1lllIlI[_lIIIlIlI(0x138)],
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1I1l1IlI, (((0x40 - 0x0) / 0x8)))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _lllIlIlI[_lIIIlIlI(0x3a)](_1I1l1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_1I1l1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  
                   local _1IlIIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = tostring(_1ll1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _1I1l1IlI,
                   })
                   _1lI1lIlI:Register(_1IlIIIlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                  
                   local _l11l1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x50 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x70 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x13f), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _1I1l1IlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _1lI1lIlI:Register(_l11l1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _I11l1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = tostring(_1ll1IIlI) .. _lIIIlIlI(0x5d),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_I1lllIlI[_lIIIlIlI(0x139)], (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xbf)],
                   BackgroundTransparency = (0x2a / 0x2a),
                   Visible = _II1l1IlI,
                   LayoutOrder = _I1lllIlI:nextOrder(),
                   Parent = _I1lllIlI[_lIIIlIlI(0x138)],
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb1), {
                   PaddingTop = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8))),
                   PaddingBottom = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   PaddingLeft = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingRight = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19)),
                   Parent = _I11l1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0xd5)],
                   HorizontalAlignment = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xed)],
                   SortOrder = Enum[_lIIIlIlI(0xd8)][_lIIIlIlI(0xd9)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   Parent = _I11l1IlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _111l1IlI = _ll1l1IlI(_I11l1IlI, _I1lllIlI[_lIIIlIlI(0x139)] + (((0x50 - 0x0) / 0x8)))
                  
                   local function _lllI1IlI(_IIlIlIlI)
                   _II1l1IlI = _IIlIlIlI
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _I11l1IlI[_lIIIlIlI(0xbc)] = _IIlIlIlI
                   _lllIlIlI[_lIIIlIlI(0x32)](_l11l1IlI, 0.28, { Rotation = _IIlIlIlI and (((0x2d0 - 0x0) / 0x8)) or (0x19 - 0x19) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x140)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   end
                   _l11l1IlI[_lIIIlIlI(0x141)] = _II1l1IlI and (((0x2d0 - 0x0) / 0x8)) or (0x19 - 0x19)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _1I1l1IlI[_lIIIlIlI(0xf2)]:Connect(function() _lllI1IlI(not _II1l1IlI) end)
                  
                   table[_lIIIlIlI(0x45)](_l1I1lIlI[_lIIIlIlI(0x142)], {
                   close = function() if _II1l1IlI then _lllI1IlI((0x0 == 0x1)) end end,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   return {
                   _IIl1IIlI = _1I1l1IlI,
                   _lllI1IlI = _lllI1IlI,
                   isOpen = function() return _II1l1IlI end,
                   CreateToggle = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateToggle(_1l1l1IlI, _lI1l1IlI) end,
                   CreateSlider = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateSlider(_1l1l1IlI, _lI1l1IlI) end,
                   CreateInput = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateInput(_1l1l1IlI, _lI1l1IlI) end,
                   CreateKeybind = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateKeybind(_1l1l1IlI, _lI1l1IlI) end,
                   CreateColorPicker = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateColorPicker(_1l1l1IlI, _lI1l1IlI) end,
                   CreateSection = function(_11lIlIlI, _1lllIIlI) return _111l1IlI:CreateSection(_1lllIIlI) end,
                   CreateDropdown = function(_11lIlIlI, _1l1l1IlI, _lI1l1IlI) return _111l1IlI:CreateDropdown(_1l1l1IlI, _lI1l1IlI) end,
                   }
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x143)] = _11Il1IlI
                  
                  local _IllI1IlI = {}
                  
                  local function _1llI1IlI()
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _I11IlIlI, _IlllIIlI = pcall(function() return gethui and gethui() end)
                   if _I11IlIlI and _IlllIIlI then return _IlllIIlI end
                   local _11l1lIlI = pcall(function()
                   local _1lllIIlI = Instance[_lIIIlIlI(0x2b)](_lIIIlIlI(0xc2))
                   _1lllIIlI[_lIIIlIlI(0x2c)] = _1I1IlIlI
                   _1lllIIlI:Destroy()
                   return (0x1 == 0x1)
                   end)
                   if _11l1lIlI then return _1I1IlIlI end
                   return _l11IlIlI:WaitForChild(_lIIIlIlI(0xc3))
                  end
                  
                  function _IllI1IlI.build()
                   local _lIlI1IlI = _1llI1IlI()
                  
                   local _IIlI1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xc4), {
                   Name = _lIIIlIlI(0x145),
                   ResetOnSpawn = (0x0 == 0x1),
                   ZIndexBehavior = Enum[_lIIIlIlI(0xc6)][_lIIIlIlI(0xc7)],
                   IgnoreGuiInset = (0x1 == 0x1),
                   DisplayOrder = (((0x1f38 - 0x0) / 0x8)),
                   Parent = _lIlI1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0xc4)] = _IIlI1IlI
                  
                   pcall(function()
                   _l1I1lIlI[_lIIIlIlI(0x146)] = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x147), {
                   Name = _lIIIlIlI(0x148),
                   Size = (((0x40 - 0x0) / 0x8)),
                   Transparency = 0.3,
                   Parent = _II1IlIlI,
                   })
                   end)
                  
                   local _1IlI1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0xaa),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)](0.5, 0.5),
                   Position = UDim2[_lIIIlIlI(0x128)](0.5, 0.5),
                   Size = _111IlIlI[_lIIIlIlI(0x127)],
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x149)),
                   BackgroundTransparency = (0x19 - 0x19),
                   BorderSizePixel = (0x19 - 0x19),
                   ClipsDescendants = (0x1 == 0x1),
                   Parent = _IIlI1IlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_1IlI1IlI, _111IlIlI[_lIIIlIlI(0x39)])
                   _lllIlIlI[_lIIIlIlI(0x3a)](_1IlI1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_1IlI1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0x149))
                   _IllI1IlI[_lIIIlIlI(0xaa)] = _1IlI1IlI
                  
                   local _l1lI1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xe6), {
                   Name = _lIIIlIlI(0x14a),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Image = _lIIIlIlI(0x1d),
                   ImageTransparency = (0x2a / 0x2a),
                   ScaleType = Enum[_lIIIlIlI(0x14b)][_lIIIlIlI(0x14c)],
                   ImageColor3 = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   Visible = (0x0 == 0x1),
                   ZIndex = (0x19 - 0x19),
                   Parent = _1IlI1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x14a)] = _l1lI1IlI
                  
                   local _I1lI1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x14d),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)]),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x50 - 0x0) / 0x8)),
                   Parent = _1IlI1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x14d)] = _I1lI1IlI
                  
                   local _11lI1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2e), {
                   Name = _lIIIlIlI(0x14f),
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x70 - 0x0) / 0x8)), (_111IlIlI[_lIIIlIlI(0x14e)] - (((0xd0 - 0x0) / 0x8))) / (((0x10 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xd0 - 0x0) / 0x8)), (((0xd0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Image = _lIIIlIlI(0x1d),
                   Rotation = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   ZIndex = (((0x58 - 0x0) / 0x8)),
                   Parent = _I1lI1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x14f)] = _11lI1IlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _llII1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x150),
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x1a0 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x410 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x58 - 0x0) / 0x8)),
                   ClipsDescendants = (0x1 == 0x1),
                   Parent = _I1lI1IlI,
                   })
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _IllI1IlI[_lIIIlIlI(0x150)] = _llII1IlI
                  
                   local _IlII1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _111IlIlI[_lIIIlIlI(0xdd)], TextSize = (((0x90 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextTransparency = (0x19 - 0x19),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   ZIndex = (((0x60 - 0x0) / 0x8)),
                   Parent = _llII1IlI,
                   })
                   _1lI1lIlI:Register(_IlII1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _IllI1IlI[_lIIIlIlI(0x151)] = _IlII1IlI
                  
                   local _1lII1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x1a0 - 0x0) / 0x8)), _111IlIlI[_lIIIlIlI(0x14e)] - (((0x60 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x1a0 - 0x0) / 0x8)), (((0x10 - 0x0) / 0x8))),
                   BackgroundColor3 = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa3)],
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0x58 - 0x0) / 0x8)),
                   Parent = _I1lI1IlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_1lII1IlI, (0x2a / 0x2a))
                   _IllI1IlI[_lIIIlIlI(0x152)] = _1lII1IlI
                  
                   local _lIII1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x153), {
                   Name = _lIIIlIlI(0x154),
                   Position = UDim2[_lIIIlIlI(0x15)](_111IlIlI[_lIIIlIlI(0x155)], (((0x40 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_111IlIlI[_lIIIlIlI(0x155)] - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)] - (((0x80 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   ScrollingDirection = Enum[_lIIIlIlI(0x156)][_lIIIlIlI(0x4d)],
                   ScrollingEnabled = (0x1 == 0x1),
                   ScrollBarThickness = (0x19 - 0x19),
                   CanvasSize = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0x4d)],
                   ZIndex = (((0x58 - 0x0) / 0x8)),
                   Parent = _I1lI1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0x157)],
                   HorizontalAlignment = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xb7)],
                   VerticalAlignment = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xed)],
                   SortOrder = Enum[_lIIIlIlI(0xd8)][_lIIIlIlI(0xd9)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   Parent = _lIII1IlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lIII1IlI[_lIIIlIlI(0x47)]:Connect(function(_IlIIlIlI)
                   if _IlIIlIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x158)] then
                   local _IIII1IlI = math[_lIIIlIlI(0x41)]((0x19 - 0x19), _lIII1IlI[_lIIIlIlI(0x159)][_lIIIlIlI(0x4d)] - _lIII1IlI[_lIIIlIlI(0x15a)][_lIIIlIlI(0x4d)])
                   _lIII1IlI[_lIIIlIlI(0x15b)] = Vector2[_lIIIlIlI(0x2b)](
                   _lllIlIlI[_lIIIlIlI(0x40)](_lIII1IlI[_lIIIlIlI(0x15b)][_lIIIlIlI(0x4d)] - _IlIIlIlI[_lIIIlIlI(0x4c)][_lIIIlIlI(0x15c)] * (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _IIII1IlI), (0x19 - 0x19))
                   end
                   end)
                   _IllI1IlI[_lIIIlIlI(0x154)] = _lIII1IlI
                  
                   local _1III1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)]),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x15d)),
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0x10 - 0x0) / 0x8)),
                   Parent = _1IlI1IlI,
                   })
                   _1lI1lIlI:Register(_1III1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0x15d))
                  
                   local _l1II1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x15e),
                   Position = UDim2[_lIIIlIlI(0x15)](-_111IlIlI[_lIIIlIlI(0x15f)], _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x15f)], (0x2a / 0x2a),
                   -(_111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a) + _111IlIlI[_lIIIlIlI(0x160)])),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   ClipsDescendants = (0x1 == 0x1),
                   Visible = (0x0 == 0x1),
                   ZIndex = (((0x28 - 0x0) / 0x8)),
                   Parent = _1IlI1IlI,
                   })
                   _1lI1lIlI:Register(_l1II1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                   _IllI1IlI[_lIIIlIlI(0x15e)] = _l1II1IlI
                  
                   local _I1II1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x161),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19)),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x2a / 0x2a), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x15d)),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _l1II1IlI,
                   })
                   _1lI1lIlI:Register(_I1II1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0x15d))
                  
                   local _11II1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x162),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x160 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Parent = _l1II1IlI,
                   })
                  
                   local _ll1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x80 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x1e0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x163), TextSize = (((0x58 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _11II1IlI,
                   })
                   _1lI1lIlI:Register(_ll1I1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _Il1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x60 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xee)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x164), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _11II1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_Il1I1IlI, (((0x30 - 0x0) / 0x8)))
                   _1lI1lIlI:Register(_Il1I1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xee))
                   _1lI1lIlI:Register(_Il1I1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                   _Il1I1IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   _IllI1IlI[_lIIIlIlI(0x165)]((0x0 == 0x1), (0x1 == 0x1))
                   end)
                  
                   local _1l1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x166),
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (((0x160 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x15d)),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _l1II1IlI,
                   })
                   _1lI1lIlI:Register(_1l1I1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0x15d))
                  
                   local _lI1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x153), {
                   Name = _lIIIlIlI(0x167),
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (((0x170 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(((0x240 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   ScrollBarThickness = (((0x18 - 0x0) / 0x8)),
                   ScrollBarImageColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   CanvasSize = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xbf)],
                   Parent = _l1II1IlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb1), {
                   PaddingLeft = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingRight = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingTop = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   PaddingBottom = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x40 - 0x0) / 0x8))),
                   Parent = _lI1I1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0xd5)],
                   HorizontalAlignment = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xed)],
                   SortOrder = Enum[_lIIIlIlI(0xd8)][_lIIIlIlI(0xd9)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x20 - 0x0) / 0x8))),
                   Parent = _lI1I1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x167)] = _lI1I1IlI
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _II1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0xa0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIIlIlI(0x168) .. _111IlIlI[_lIIIlIlI(0x169)],
                   TextSize = (((0x48 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xed)],
                   Parent = _l1II1IlI,
                   })
                   _1lI1lIlI:Register(_II1I1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _1I1I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Name = _lIIIlIlI(0x16a),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x19 - 0x19), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)](_111IlIlI[_lIIIlIlI(0x16b)], _111IlIlI[_lIIIlIlI(0x16c)]),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xee)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Text = _lIIIlIlI(0x1d),
                   ZIndex = (((0x78 - 0x0) / 0x8)),
                   Visible = (0x0 == 0x1),
                   Parent = _1IlI1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1I1I1IlI, (((0x28 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x3a)](_1I1I1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_1I1I1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xee))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _l11I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x13f), TextSize = (((0x50 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _1I1I1IlI,
                   })
                   _1lI1lIlI:Register(_l11I1IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   _1I1I1IlI[_lIIIlIlI(0xba)]:Connect(function()
                   _lllIlIlI[_lIIIlIlI(0x32)](_1I1I1IlI, 0.15, {
                   Size = UDim2[_lIIIlIlI(0x15)](_111IlIlI[_lIIIlIlI(0x16b)] + (((0x20 - 0x0) / 0x8)), _111IlIlI[_lIIIlIlI(0x16c)]),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x16d)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   end)
                   _1I1I1IlI[_lIIIlIlI(0xc0)]:Connect(function()
                   _lllIlIlI[_lIIIlIlI(0x32)](_1I1I1IlI, 0.15, {
                   Size = UDim2[_lIIIlIlI(0x15)](_111IlIlI[_lIIIlIlI(0x16b)], _111IlIlI[_lIIIlIlI(0x16c)]),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x16d)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   end)
                   _1I1I1IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   _IllI1IlI[_lIIIlIlI(0x165)]((0x1 == 0x1), (0x1 == 0x1))
                   end)
                   _IllI1IlI[_lIIIlIlI(0x16a)] = _1I1I1IlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   local _I11I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x16e),
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(_111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a) + _111IlIlI[_lIIIlIlI(0x160)])),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x18 - 0x0) / 0x8)),
                   Parent = _1IlI1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x16e)] = _I11I1IlI
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   local _111I1IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x70 - 0x0) / 0x8)), (((0x50 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0xe0 - 0x0) / 0x8)), (0x19 - 0x19), (((0x100 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0x20 - 0x0) / 0x8)),
                   Parent = _I11I1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_111I1IlI, (((0x40 - 0x0) / 0x8)))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lllIlIlI[_lIIIlIlI(0x3a)](_111I1IlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.5)
                   _1lI1lIlI:Register(_111I1IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  
                   local _lll11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x12c), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x60 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0xc0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   PlaceholderText = _lIIIlIlI(0x16f),
                   PlaceholderColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Text = _lIIIlIlI(0x1d), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   ClearTextOnFocus = (0x0 == 0x1),
                   ZIndex = (((0x28 - 0x0) / 0x8)),
                   Parent = _111I1IlI,
                   })
                   _1lI1lIlI:Register(_lll11IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xb5))
                   _1lI1lIlI:Register(_lll11IlI, _lIIIlIlI(0x170), _lIIIlIlI(0xea))
                   _IllI1IlI[_lIIIlIlI(0x171)] = _lll11IlI
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                   local _Ill11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (((0x1a0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), -(((0x1a0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x18 - 0x0) / 0x8)),
                   Parent = _I11I1IlI,
                   })
                   _IllI1IlI[_lIIIlIlI(0x172)] = _Ill11IlI
                  
                   local _1ll11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x173),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a), -_111IlIlI[_lIIIlIlI(0x160)]),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x160)]),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0x30 - 0x0) / 0x8)),
                   Parent = _1IlI1IlI,
                   })
                   _1lI1lIlI:Register(_1ll11IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   local _lIl11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (0x2a / 0x2a)),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x15d)),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _1ll11IlI,
                   })
                   _1lI1lIlI:Register(_lIl11IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0x15d))
                  
                   local _IIl11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIIlIlI(0x1d), TextSize = (((0x58 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   ZIndex = (((0x38 - 0x0) / 0x8)),
                   Parent = _1ll11IlI,
                   })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _1lI1lIlI:Register(_IIl11IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                   _IllI1IlI[_lIIIlIlI(0x174)] = _IIl11IlI
                  
                   
                   
                   
                   
                   
                   
                   _lllIlIlI[_lIIIlIlI(0x44)](_ll1IlIlI[_lIIIlIlI(0x175)]:Connect(function()
                   _l1I1lIlI[_lIIIlIlI(0x110)] = _l1I1lIlI[_lIIIlIlI(0x110)] + (0x2a / 0x2a)
                   end))
                  
                   task[_lIIIlIlI(0x11a)](function()
                   local _1IIIIIlI = _l1I1lIlI[_lIIIlIlI(0x110)]
                   local _l1IIIIlI = os[_lIIIlIlI(0x10f)]()
                   while _IIlI1IlI and _IIlI1IlI[_lIIIlIlI(0x2c)] do
                   task[_lIIIlIlI(0x112)](0.5)
                   local _I1IIIIlI = _l1I1lIlI[_lIIIlIlI(0x110)]
                   local _11IIIIlI = os[_lIIIlIlI(0x10f)]()
                   local _ll1IIIlI = _11IIIIlI - _l1IIIIlI
                   if _ll1IIIlI >= 0.9 then
                   local _Il1IIIlI = math[_lIIIlIlI(0x22)]((_I1IIIIlI - _1IIIIIlI) / _ll1IIIlI + 0.5)
                   _1IIIIIlI = _I1IIIIlI
                   _l1IIIIlI = _11IIIIlI
                  
                   local _1l1IIIlI = (0x19 - 0x19)
                   pcall(function()
                   _1l1IIIlI = math[_lIIIlIlI(0x22)](_lI1IlIlI[_lIIIlIlI(0x113)][_lIIIlIlI(0x114)][_lIIIlIlI(0x115)]:GetValue())
                   end)
                   _IIl11IlI[_lIIIlIlI(0xbb)] = string[_lIIIlIlI(0x20)](
                   _lIIIlIlI(0x176),
                   _Il1IIIlI, _1l1IIIlI, #_Il1IlIlI:GetPlayers(), os[_lIIIlIlI(0x177)](_lIIIlIlI(0x178)))
                   end
                   end
                   end)
                  
                   local _1Il11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x179),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), 0.5),
                   Position = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x70 - 0x0) / 0x8)), 0.5, (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x1c0 - 0x0) / 0x8)), (((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   ZIndex = (((0x58 - 0x0) / 0x8)),
                   Parent = _I1lI1IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0x157)],
                   HorizontalAlignment = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xcd)],
                   VerticalAlignment = Enum[_lIIIlIlI(0xca)][_lIIIlIlI(0xed)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x30 - 0x0) / 0x8))),
                   Parent = _1Il11IlI,
                   })
                  
                   local _l1l11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x17a), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   ZIndex = (((0x60 - 0x0) / 0x8)),
                   Parent = _1Il11IlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_l1l11IlI, (((0x30 - 0x0) / 0x8)))
                   _1lI1lIlI:Register(_l1l11IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                   _1lI1lIlI:Register(_l1l11IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   local _I1l11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xb0 - 0x0) / 0x8)), (((0xb0 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0xef), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   ZIndex = (((0x60 - 0x0) / 0x8)),
                   Parent = _1Il11IlI,
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_I1l11IlI, (((0x30 - 0x0) / 0x8)))
                   _1lI1lIlI:Register(_I1l11IlI, _lIIIlIlI(0xb0), _lIIIlIlI(0xaf))
                   _1lI1lIlI:Register(_I1l11IlI, _lIIIlIlI(0xb8), _lIIIlIlI(0xea))
                  
                   _IllI1IlI[_lIIIlIlI(0x17b)] = (0x0 == 0x1)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _IllI1IlI[_lIIIlIlI(0x17c)] = (0x1 == 0x1)
                  
                   local function _11l11IlI()
                   for _11lIlIlI, _1lIIlIlI in ipairs(_l1I1lIlI[_lIIIlIlI(0x142)]) do
                   pcall(function() _1lIIlIlI[_lIIIlIlI(0x17d)]() end)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                   end
                  
                   function _IllI1IlI.setMinimized(_11l1IIlI)
                   _IllI1IlI[_lIIIlIlI(0x17b)] = _11l1IIlI
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _11l1IIlI then
                   _11l11IlI()
                   _lIII1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _l1II1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _I11I1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _1ll11IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _lllIlIlI[_lIIIlIlI(0x32)](_1IlI1IlI, 0.28, { Size = _111IlIlI[_lIIIlIlI(0x17f)] },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x140)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   else
                   _lllIlIlI[_lIIIlIlI(0x32)](_1IlI1IlI, 0.28, { Size = _111IlIlI[_lIIIlIlI(0x127)] },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x140)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   task[_lIIIlIlI(0xf3)](0.15, function()
                   _I11I1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _1ll11IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   if _l1I1lIlI[_lIIIlIlI(0x180)] == _lIIIlIlI(0x19) then
                   _lIII1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _l1II1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   else
                   _lIII1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _l1II1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = not _l1I1lIlI[_lIIIlIlI(0x181)]
                   end
                   if _l1I1lIlI[_lIIIlIlI(0x182)] then
                   for _11lIlIlI, _1lllIIlI in pairs(_l1I1lIlI[_lIIIlIlI(0x183)]) do
                   if _1lllIIlI[_lIIIlIlI(0x138)] then _1lllIIlI[_lIIIlIlI(0x138)][_lIIIlIlI(0xbc)] = (_1lllIIlI == _l1I1lIlI[_lIIIlIlI(0x182)]) end
                   end
                   end
                   end)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   end
                   end
                  
                   local function _llI11IlI(_IIlIlIlI)
                   _IllI1IlI[_lIIIlIlI(0x17c)] = _IIlIlIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _IIlI1IlI[_lIIIlIlI(0x184)] = _IIlIlIlI
                   if _l1IIlIlI[_lIIIlIlI(0xf5)] then _l1IIlIlI[_lIIIlIlI(0xf5)][_lIIIlIlI(0x184)] = _IIlIlIlI end
                   if not _IIlIlIlI then _11l11IlI() end
                   end
                  
                   function _IllI1IlI.toggleVis()
                   if _IllI1IlI[_lIIIlIlI(0x17b)] then
                   _IllI1IlI[_lIIIlIlI(0x17e)]((0x0 == 0x1))
                   _llI11IlI((0x1 == 0x1))
                   if _l1I1lIlI[_lIIIlIlI(0x182)] then
                   for _11lIlIlI, _1lllIIlI in pairs(_l1I1lIlI[_lIIIlIlI(0x183)]) do
                   if _1lllIIlI[_lIIIlIlI(0x138)] then _1lllIIlI[_lIIIlIlI(0x138)][_lIIIlIlI(0xbc)] = (_1lllIIlI == _l1I1lIlI[_lIIIlIlI(0x182)]) end
                   end
                   end
                   return
                   end
                   _llI11IlI(not _IllI1IlI[_lIIIlIlI(0x17c)])
                   end
                  
                   _l1l11IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   _IllI1IlI[_lIIIlIlI(0x17e)](not _IllI1IlI[_lIIIlIlI(0x17b)])
                   end)
                  
                   _I1l11IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   local _IlI11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x186),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundColor3 = Color3[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   BackgroundTransparency = 0.5,
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0xfa0 - 0x0) / 0x8)),
                   Parent = _IIlI1IlI,
                   })
                   local _ll1lIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)](0.5, 0.5),
                   Position = UDim2[_lIIIlIlI(0x128)](0.5, 0.5),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0xa00 - 0x0) / 0x8)), (((0x500 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xaf)),
                   BorderSizePixel = (0x19 - 0x19),
                   ZIndex = (((0xfa8 - 0x0) / 0x8)),
                   Parent = _IlI11IlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_ll1lIIlI, _111IlIlI[_lIIIlIlI(0x39)])
                   _lllIlIlI[_lIIIlIlI(0x3a)](_ll1lIIlI, _1lI1lIlI:Get(_lIIIlIlI(0x3c)), (0x2a / 0x2a), 0.3)
                  
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0xa0 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0xc0 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lIIIlIlI(0x187),
                   TextSize = (((0x80 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xb5)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   ZIndex = (((0xfb0 - 0x0) / 0x8)),
                   Parent = _ll1lIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0xa0 - 0x0) / 0x8)), (((0x190 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x140 - 0x0) / 0x8)), (0x19 - 0x19), (((0x190 - 0x0) / 0x8))),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xb4)],
                   Text = _lIIIlIlI(0x188),
                   TextSize = (((0x68 - 0x0) / 0x8)),
                   TextWrapped = (0x1 == 0x1),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   ZIndex = (((0xfb0 - 0x0) / 0x8)),
                   Parent = _ll1lIIlI,
                   })
                  
                   local function _1lI11IlI(_lII11IlI, _1I1lIIlI, _III11IlI, _1II11IlI)
                   local _l1I11IlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Position = UDim2[_lIIIlIlI(0x2b)](_1I1lIIlI, (((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), -(((0x1c0 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)](0.5, -(((0xc8 - 0x0) / 0x8)), (0x19 - 0x19), (((0x100 - 0x0) / 0x8))),
                   BackgroundColor3 = _III11IlI,
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _lII11IlI, TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8))),
                   ZIndex = (((0xfb0 - 0x0) / 0x8)),
                   Parent = _ll1lIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_l1I11IlI, (((0x40 - 0x0) / 0x8)))
                   _l1I11IlI[_lIIIlIlI(0xf2)]:Connect(_1II11IlI)
                   end
                   _1lI11IlI(_lIIIlIlI(0x189), (0x19 - 0x19), _1lI1lIlI:Get(_lIIIlIlI(0xee)), function() _IlI11IlI:Destroy() end)
                   _1lI11IlI(_lIIIlIlI(0x18a), 0.5, Color3[_lIIIlIlI(0x1e)]((((0x6e0 - 0x0) / 0x8)), (((0x1e0 - 0x0) / 0x8)), (((0x230 - 0x0) / 0x8))), function()
                   _IlI11IlI:Destroy()
                   _l1IIlIlI[_lIIIlIlI(0x18b)]()
                   end)
                   end)
                  
                   _IllI1IlI[_lIIIlIlI(0x18c)] = (0x1 == 0x1)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   local _I1I11IlI = (0x19 - 0x19)
                  
                   function _IllI1IlI.setTitleVisible(_IIlIlIlI)
                   _IllI1IlI[_lIIIlIlI(0x18c)] = _IIlIlIlI
                   if _l1I1lIlI[_lIIIlIlI(0x180)] == _lIIIlIlI(0x19) then
                   local _11I11IlI = _IIlIlIlI and _111IlIlI[_lIIIlIlI(0x155)] or _111IlIlI[_lIIIlIlI(0x18e)]
                   _lllIlIlI[_lIIIlIlI(0x32)](_lIII1IlI, 0.4, {
                   Position = UDim2[_lIIIlIlI(0x15)](_11I11IlI, (((0x40 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_11I11IlI - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)] - (((0x80 - 0x0) / 0x8))),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   end
                   if _IIlIlIlI then
                   _llII1IlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)]((((0xf0 - 0x0) / 0x8)), (0x19 - 0x19))
                   _IlII1IlI[_lIIIlIlI(0x18f)] = (0x2a / 0x2a)
                   _IlII1IlI[_lIIIlIlI(0x190)] = (((0x70 - 0x0) / 0x8))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _1lII1IlI[_lIIIlIlI(0x191)] = (0x2a / 0x2a)
                   _1lII1IlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x32)](_llII1IlI, 0.45, { Position = UDim2[_lIIIlIlI(0x15)]((((0x1a0 - 0x0) / 0x8)), (0x19 - 0x19)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x192)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   _lllIlIlI[_lIIIlIlI(0x32)](_IlII1IlI, 0.35, { TextTransparency = (0x19 - 0x19), TextSize = (((0x90 - 0x0) / 0x8)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   _lllIlIlI[_lIIIlIlI(0x32)](_1lII1IlI, 0.5, {
                   BackgroundTransparency = (0x19 - 0x19),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x1a0 - 0x0) / 0x8)), (((0x10 - 0x0) / 0x8))),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   else
                   _lllIlIlI[_lIIIlIlI(0x32)](_llII1IlI, 0.35, { Position = UDim2[_lIIIlIlI(0x15)]((((0xf0 - 0x0) / 0x8)), (0x19 - 0x19)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x16d)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0xf0)])
                   _lllIlIlI[_lIIIlIlI(0x32)](_IlII1IlI, 0.3, { TextTransparency = (0x2a / 0x2a), TextSize = (((0x70 - 0x0) / 0x8)) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0xf0)])
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _lllIlIlI[_lIIIlIlI(0x32)](_1lII1IlI, 0.3, {
                   BackgroundTransparency = (0x2a / 0x2a),
                   Size = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), (((0x10 - 0x0) / 0x8))),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0xf0)])
                   end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   end
                  
                   _11lI1IlI[_lIIIlIlI(0xf2)]:Connect(function()
                   local _ll111IlI = _IllI1IlI[_lIIIlIlI(0x18c)] and -(((0xb40 - 0x0) / 0x8)) or (((0xb40 - 0x0) / 0x8))
                   _I1I11IlI = _I1I11IlI + _ll111IlI
                   _I1IIlIlI:Create(_11lI1IlI,
                   TweenInfo[_lIIIlIlI(0x2b)](0.75, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x193)]),
                   { Rotation = _I1I11IlI }):Play()
                   _IllI1IlI[_lIIIlIlI(0x18d)](not _IllI1IlI[_lIIIlIlI(0x18c)])
                   end)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   function _IllI1IlI.setPanelOpen(_IIlIlIlI, animated)
                   _l1I1lIlI[_lIIIlIlI(0x181)] = _IIlIlIlI
                   if animated == nil then animated = (0x1 == 0x1) end
                   local _llIl1IlI = animated and 0.32 or (0x19 - 0x19)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   local _11I11IlI = _IIlIlIlI and (0x19 - 0x19) or -_111IlIlI[_lIIIlIlI(0x15f)]
                  
                   _lllIlIlI[_lIIIlIlI(0x32)](_l1II1IlI, _llIl1IlI, {
                   Position = UDim2[_lIIIlIlI(0x15)](_11I11IlI, _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a)),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x140)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   local _Il111IlI = (_l1I1lIlI[_lIIIlIlI(0x180)] == _lIIIlIlI(0x194) and _IIlIlIlI)
                   and _111IlIlI[_lIIIlIlI(0x15f)] or (0x19 - 0x19)
                   _lllIlIlI[_lIIIlIlI(0x32)](_I11I1IlI, _llIl1IlI, {
                   Position = UDim2[_lIIIlIlI(0x15)](_Il111IlI, _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a)),
                   Size = UDim2[_lIIIlIlI(0x2b)](
                   (0x2a / 0x2a), -_Il111IlI,
                   (0x2a / 0x2a), -(_111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a) + _111IlIlI[_lIIIlIlI(0x160)])),
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x140)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  
                   if _l1I1lIlI[_lIIIlIlI(0x180)] == _lIIIlIlI(0x194) then
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = not _IIlIlIlI
                   else
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   end
                  
                   function _IllI1IlI.setLayout(_IlIlIIlI)
                   _l1I1lIlI[_lIIIlIlI(0x180)] = _IlIlIIlI
                   if _IlIlIIlI == _lIIIlIlI(0x19) then
                   _lIII1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _l1II1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _1I1I1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   _l1I1lIlI[_lIIIlIlI(0x181)] = (0x0 == 0x1)
                   _l1II1IlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)](-_111IlIlI[_lIIIlIlI(0x15f)], _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _I11I1IlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)]((0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a))
                   _I11I1IlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a),
                   -(_111IlIlI[_lIIIlIlI(0x14e)] + (0x2a / 0x2a) + _111IlIlI[_lIIIlIlI(0x160)]))
                   local _11I11IlI = _IllI1IlI[_lIIIlIlI(0x18c)]
                   and _111IlIlI[_lIIIlIlI(0x155)]
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   or _111IlIlI[_lIIIlIlI(0x18e)]
                   _lIII1IlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x15)](_11I11IlI, (((0x40 - 0x0) / 0x8)))
                   _lIII1IlI[_lIIIlIlI(0x127)] = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -_11I11IlI - (((0x1e0 - 0x0) / 0x8)), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x14e)] - (((0x80 - 0x0) / 0x8)))
                   else
                   _lIII1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _l1II1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _IllI1IlI[_lIIIlIlI(0x165)]((0x1 == 0x1), (0x1 == 0x1))
                   end
                   if _l1I1lIlI[_lIIIlIlI(0x182)] then
                   for _11lIlIlI, _1lllIIlI in pairs(_l1I1lIlI[_lIIIlIlI(0x183)]) do
                   if _1lllIIlI[_lIIIlIlI(0x138)] then _1lllIIlI[_lIIIlIlI(0x138)][_lIIIlIlI(0xbc)] = (_1lllIIlI == _l1I1lIlI[_lIIIlIlI(0x182)]) end
                   end
                   end
                   end
                  
                   do
                   local _1l111IlI, _lI111IlI, _I1lIIIlI
                   _I1lI1IlI[_lIIIlIlI(0xa6)]:Connect(function(_11I1lIlI)
                   if _11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   or _11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then
                   _1l111IlI = (0x1 == 0x1)
                   _lI111IlI = _11I1lIlI[_lIIIlIlI(0x4c)]
                   _I1lIIIlI = _1IlI1IlI[_lIIIlIlI(0x4c)]
                   end
                   end)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x47)]:Connect(function(_11I1lIlI)
                   if _1l111IlI and (_11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x49)]
                   or _11I1lIlI[_lIIIlIlI(0x48)] == Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)]) then
                   local _1lIIlIlI = _11I1lIlI[_lIIIlIlI(0x4c)] - _lI111IlI
                   _1IlI1IlI[_lIIIlIlI(0x4c)] = UDim2[_lIIIlIlI(0x2b)](
                   _I1lIIIlI[_lIIIlIlI(0x4d)][_lIIIlIlI(0x10d)], _I1lIIIlI[_lIIIlIlI(0x4d)][_lIIIlIlI(0x10e)] + _1lIIlIlI[_lIIIlIlI(0x4d)],
                   _I1lIIIlI[_lIIIlIlI(0xbf)][_lIIIlIlI(0x10d)], _I1lIIIlI[_lIIIlIlI(0xbf)][_lIIIlIlI(0x10e)] + _1lIIlIlI[_lIIIlIlI(0xbf)])
                   end
                   end))
                   _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0x4e)]:Connect(function(_11I1lIlI)
                   if not _1l111IlI then return end
                   if _11I1lIlI[_lIIIlIlI(0x48)] ~= Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4f)]
                   and _11I1lIlI[_lIIIlIlI(0x48)] ~= Enum[_lIIIlIlI(0x48)][_lIIIlIlI(0x4a)] then return end
                   _1l111IlI = (0x0 == 0x1)
                   local _II111IlI = _I11IlIlI[_lIIIlIlI(0x196)]
                   local _1I111IlI = _1IlI1IlI[_lIIIlIlI(0xbe)]
                   local _l1111IlI = _1IlI1IlI[_lIIIlIlI(0xbd)]
                   local _I1111IlI = _111IlIlI[_lIIIlIlI(0x197)]
                   local _11111IlI, _lllllIlI = _l1111IlI[_lIIIlIlI(0x4d)], _l1111IlI[_lIIIlIlI(0xbf)]
                   local _IllllIlI = (0x0 == 0x1)
                   if _l1111IlI[_lIIIlIlI(0x4d)] < _I1111IlI then _11111IlI = (0x19 - 0x19); _IllllIlI = (0x1 == 0x1)
                   elseif _l1111IlI[_lIIIlIlI(0x4d)] + _1I111IlI[_lIIIlIlI(0x4d)] > _II111IlI[_lIIIlIlI(0x4d)] - _I1111IlI then
                   _11111IlI = _II111IlI[_lIIIlIlI(0x4d)] - _1I111IlI[_lIIIlIlI(0x4d)]; _IllllIlI = (0x1 == 0x1)
                   end
                   if _l1111IlI[_lIIIlIlI(0xbf)] < _I1111IlI then _lllllIlI = (0x19 - 0x19); _IllllIlI = (0x1 == 0x1)
                   elseif _l1111IlI[_lIIIlIlI(0xbf)] + _1I111IlI[_lIIIlIlI(0xbf)] > _II111IlI[_lIIIlIlI(0xbf)] - _I1111IlI then
                   _lllllIlI = _II111IlI[_lIIIlIlI(0xbf)] - _1I111IlI[_lIIIlIlI(0xbf)]; _IllllIlI = (0x1 == 0x1)
                   end
                   if _IllllIlI then
                   _lllIlIlI[_lIIIlIlI(0x32)](_1IlI1IlI, 0.2, { Position = UDim2[_lIIIlIlI(0x15)](_11111IlI, _lllllIlI) },
                   Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x34)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                   end
                   end))
                   end
                  
                   local _1llllIlI = (0x19 - 0x19)
                   _lllIlIlI[_lIIIlIlI(0x44)](_11IIlIlI[_lIIIlIlI(0xa6)]:Connect(function(_11I1lIlI, _ll11lIlI)
                   if _ll11lIlI then return end
                   if _I1I1lIlI[_lIIIlIlI(0xa5)] then return end
                  
                   for _11lIlIlI, _lIlIlIlI in ipairs(_111IlIlI[_lIIIlIlI(0x198)]) do
                   if _11I1lIlI[_lIIIlIlI(0x11)] == _lIlIlIlI then
                   local _lIlllIlI = os[_lIIIlIlI(0x10f)]()
                   if _lIlllIlI - _1llllIlI > 0.2 then
                   _1llllIlI = _lIlllIlI
                   _IllI1IlI[_lIIIlIlI(0x185)]()
                   end
                   return
                   end
                   end
                   if _11I1lIlI[_lIIIlIlI(0x11)] == _111IlIlI[_lIIIlIlI(0x199)] and _l1I1lIlI[_lIIIlIlI(0x180)] == _lIIIlIlI(0x194) then
                   _IllI1IlI[_lIIIlIlI(0x165)](not _l1I1lIlI[_lIIIlIlI(0x181)], (0x1 == 0x1))
                   return
                   end
                   end))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   task[_lIIIlIlI(0x11a)](function()
                   local _1IIlIIlI = _l1IIlIlI[_lIIIlIlI(0x6d)][_lIIIlIlI(0x69)]()
                   if _1IIlIIlI then
                   _11lI1IlI[_lIIIlIlI(0x19a)] = _1IIlIIlI
                   _l1lI1IlI[_lIIIlIlI(0x19a)] = _1IIlIIlI
                   else
                   _11lI1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1)
                   end
                   end)
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                   _1lI1lIlI:SetReapplyCallback(function()
                   if _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa3)] then
                   _1lII1IlI[_lIIIlIlI(0xb0)] = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa3)]
                   end
                   if _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0x9f)] then
                   for _11lIlIlI, _I1IIlIlI in ipairs(_l1I1lIlI[_lIIIlIlI(0x129)]) do
                   if _I1IIlIlI[_lIIIlIlI(0x19b)] and _I1IIlIlI[_lIIIlIlI(0x19b)][_lIIIlIlI(0x2c)] then
                   _I1IIlIlI[_lIIIlIlI(0x19c)](_l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0x9f)])
                   end
                   end
                   end
                   if _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] and _l1I1lIlI[_lIIIlIlI(0x182)] then
                   _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x19d)][_lIIIlIlI(0xb8)] = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)]
                   if _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x19e)] then
                   _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x19e)][_lIIIlIlI(0xb8)] = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)]
                   end
                   if _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x19f)] then
                   _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x19f)][_lIIIlIlI(0xb0)] = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)]
                   end
                   end
                   for _11lIlIlI, _1lllIIlI in ipairs(_l1I1lIlI[_lIIIlIlI(0x126)]) do
                   if _1lllIIlI[_lIIIlIlI(0x1a0)] and _1lllIIlI[_lIIIlIlI(0x1a0)][_lIIIlIlI(0x2c)] and _1lllIIlI[_lIIIlIlI(0x1a1)] then _1lllIIlI[_lIIIlIlI(0x1a1)]() end
                   end
                   end)
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  end
                  
                  function _IllI1IlI.createTab(_1ll1IIlI)
                   local _IIlllIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Name = tostring(_1ll1IIlI) .. _lIIIlIlI(0x1a3),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x280 - 0x0) / 0x8)), _111IlIlI[_lIIIlIlI(0x14e)] - (((0x80 - 0x0) / 0x8))),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0x149)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xec)],
                   Text = tostring(_1ll1IIlI), TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   Parent = _IllI1IlI[_lIIIlIlI(0x154)],
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x37)](_IIlllIlI, (_111IlIlI[_lIIIlIlI(0x14e)] - (((0x80 - 0x0) / 0x8))) / (((0x10 - 0x0) / 0x8)))
                  
                   local _I1IlIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Name = tostring(_1ll1IIlI) .. _lIIIlIlI(0x1a4),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x1a5)]),
                   BackgroundColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xee)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Text = _lIIIlIlI(0x1d),
                   Parent = _IllI1IlI[_lIIIlIlI(0x167)],
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_I1IlIIlI, (((0x40 - 0x0) / 0x8)))
                  
                   local _1IlllIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Name = _lIIIlIlI(0x1a6),
                   AnchorPoint = Vector2[_lIIIlIlI(0x2b)]((0x19 - 0x19), 0.5),
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x20 - 0x0) / 0x8)), _111IlIlI[_lIIIlIlI(0x1a5)] / (((0x10 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x18 - 0x0) / 0x8)), (0x2a / 0x2a), -(((0x70 - 0x0) / 0x8))),
                   BackgroundColor3 = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] or _1lI1lIlI:Get(_lIIIlIlI(0x108)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _I1IlIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_1IlllIlI, (((0x10 - 0x0) / 0x8)))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   local _l1lllIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x70 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x70 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xec)],
                   Text = tostring(_1ll1IIlI), TextSize = (((0x68 - 0x0) / 0x8)),
                   TextColor3 = _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _I1IlIIlI,
                   })
                  
                   _I1IlIIlI[_lIIIlIlI(0xba)]:Connect(function()
                   if _l1I1lIlI[_lIIIlIlI(0x182)] ~= _I1lllIlI then
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IlIIlI, 0.15, { BackgroundTransparency = 0.6 })
                   end
                   end)
                   _I1IlIIlI[_lIIIlIlI(0xc0)]:Connect(function()
                   if _l1I1lIlI[_lIIIlIlI(0x182)] ~= _I1lllIlI then
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IlIIlI, 0.15, { BackgroundTransparency = (0x2a / 0x2a) })
                   end
                   end)
                  
                   local _111IIIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x153), {
                   Name = _lIIIlIlI(0x1a7) .. tostring(_1ll1IIlI),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   BorderSizePixel = (0x19 - 0x19),
                   ScrollBarThickness = (((0x20 - 0x0) / 0x8)),
                   ScrollBarImageColor3 = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] or _1lI1lIlI:Get(_lIIIlIlI(0x108)),
                   CanvasSize = UDim2[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19), (0x19 - 0x19)),
                   AutomaticCanvasSize = Enum[_lIIIlIlI(0xad)][_lIIIlIlI(0xbf)],
                   Visible = (0x0 == 0x1),
                   Parent = _IllI1IlI[_lIIIlIlI(0x172)],
                   })
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb1), {
                   PaddingLeft = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   PaddingRight = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   PaddingTop = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x20 - 0x0) / 0x8))),
                   PaddingBottom = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), (((0x70 - 0x0) / 0x8))),
                   Parent = _111IIIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xd3), {
                   FillDirection = Enum[_lIIIlIlI(0xd4)][_lIIIlIlI(0xd5)],
                   HorizontalAlignment = Enum[_lIIIlIlI(0xc9)][_lIIIlIlI(0xed)],
                   SortOrder = Enum[_lIIIlIlI(0xd8)][_lIIIlIlI(0xd9)],
                   Padding = UDim[_lIIIlIlI(0x2b)]((0x19 - 0x19), _111IlIlI[_lIIIlIlI(0x1a8)]),
                   Parent = _111IIIlI,
                   })
                  
                   local _I1lllIlI = _11Il1IlI[_lIIIlIlI(0x13c)](_111IIIlI, (0x19 - 0x19))
                   _I1lllIlI[_lIIIlIlI(0x1a9)] = _1ll1IIlI
                   _I1lllIlI[_lIIIlIlI(0x19d)] = _IIlllIlI
                   _I1lllIlI[_lIIIlIlI(0x1aa)] = _I1IlIIlI
                   _I1lllIlI[_lIIIlIlI(0x19f)] = _1IlllIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _I1lllIlI[_lIIIlIlI(0x19e)] = _l1lllIlI
                  
                   _I1lllIlI[_lIIIlIlI(0x1ab)] = function(_11l1IIlI)
                   local _1l11IIlI = _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] or _1lI1lIlI:Get(_lIIIlIlI(0x108))
                   _lllIlIlI[_lIIIlIlI(0x32)](_IIlllIlI, 0.18, {
                   BackgroundTransparency = _11l1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _11l1IIlI and _1lI1lIlI:Get(_lIIIlIlI(0xee)) or _1lI1lIlI:Get(_lIIIlIlI(0x149)),
                   TextColor3 = _11l1IIlI and _1l11IIlI or _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   })
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IlIIlI, 0.2, {
                   BackgroundTransparency = _11l1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _11l1IIlI and _1lI1lIlI:Get(_lIIIlIlI(0xee)) or _1lI1lIlI:Get(_lIIIlIlI(0x149)),
                   })
                   _lllIlIlI[_lIIIlIlI(0x32)](_l1lllIlI, 0.2, {
                   TextColor3 = _11l1IIlI and _1l11IIlI or _1lI1lIlI:Get(_lIIIlIlI(0xea)),
                   })
                   _lllIlIlI[_lIIIlIlI(0x32)](_1IlllIlI, 0.22, {
                   BackgroundTransparency = _11l1IIlI and (0x19 - 0x19) or (0x2a / 0x2a),
                   BackgroundColor3 = _1l11IIlI,
                   }, Enum[_lIIIlIlI(0x33)][_lIIIlIlI(0x192)], Enum[_lIIIlIlI(0x35)][_lIIIlIlI(0x36)])
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                  
                   _I1lllIlI[_lIIIlIlI(0x1ac)] = function()
                   for _11lIlIlI, _1lllIIlI in pairs(_l1I1lIlI[_lIIIlIlI(0x183)]) do
                   if _1lllIIlI[_lIIIlIlI(0x138)] then _1lllIIlI[_lIIIlIlI(0x138)][_lIIIlIlI(0xbc)] = (_1lllIIlI == _l1I1lIlI[_lIIIlIlI(0x182)]) end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   end
                   end
                  
                   local function _11lllIlI()
                   if _l1I1lIlI[_lIIIlIlI(0x182)] == _I1lllIlI then return end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if _l1I1lIlI[_lIIIlIlI(0x182)] then _l1I1lIlI[_lIIIlIlI(0x182)][_lIIIlIlI(0x1ab)]((0x0 == 0x1)) end
                   _l1I1lIlI[_lIIIlIlI(0x182)] = _I1lllIlI
                   _I1lllIlI[_lIIIlIlI(0x1ab)]((0x1 == 0x1))
                   _I1lllIlI[_lIIIlIlI(0x1ac)]()
                   _1l11lIlI[_lIIIlIlI(0xc1)]()
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   end
                  
                   _IIlllIlI[_lIIIlIlI(0xf2)]:Connect(_11lllIlI)
                   _I1IlIIlI[_lIIIlIlI(0xf2)]:Connect(_11lllIlI)
                  
                   _l1I1lIlI[_lIIIlIlI(0x183)][_1ll1IIlI] = _I1lllIlI
                   return _I1lllIlI
                  end
                  
                  function _l1IIlIlI.Cleanup()
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   if _l1I1lIlI[_lIIIlIlI(0x1ad)] then return end
                   _l1I1lIlI[_lIIIlIlI(0x1ad)] = (0x1 == 0x1)
                  
                   pcall(function()
                   if _l1IIlIlI[_lIIIlIlI(0x1ae)] and _l1IIlIlI[_lIIIlIlI(0x1ae)][_lIIIlIlI(0x1af)] then
                   _l1IIlIlI[_lIIIlIlI(0x1ae)][_lIIIlIlI(0x1af)]((0x0 == 0x1))
                   end
                   end)
                  
                   local _llIllIlI = _l11IlIlI[_lIIIlIlI(0x1b0)] and _l11IlIlI[_lIIIlIlI(0x1b0)]:FindFirstChildOfClass(_lIIIlIlI(0x1b1))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _llIllIlI then
                   pcall(function()
                   _llIllIlI[_lIIIlIlI(0x1b2)] = (((0x80 - 0x0) / 0x8))
                   _llIllIlI[_lIIIlIlI(0x1b3)] = (0x1 == 0x1)
                   _llIllIlI[_lIIIlIlI(0x1b4)] = (((0x190 - 0x0) / 0x8))
                   end)
                   end
                  
                   pcall(_lllIlIlI[_lIIIlIlI(0x46)])
                   if _l1I1lIlI[_lIIIlIlI(0x146)] then pcall(function() _l1I1lIlI[_lIIIlIlI(0x146)]:Destroy() end) end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   pcall(function() _IllI1IlI[_lIIIlIlI(0xc4)]:Destroy() end)
                   pcall(function() _l1IIlIlI[_lIIIlIlI(0xc8)]:Destroy() end)
                   pcall(function() _l1IIlIlI[_lIIIlIlI(0xf5)]:Destroy() end)
                   print(_lIIIlIlI(0x1b5))
                  end
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                  _l1IIlIlI[_lIIIlIlI(0xa9)] = _IllI1IlI
                  
                  
                  local _IlIllIlI = {}
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  function _IlIllIlI.SetSpeed(_IIlIlIlI)
                   _l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1b8)] = _IIlIlIlI
                   local _llIllIlI = _l11IlIlI[_lIIIlIlI(0x1b0)] and _l11IlIlI[_lIIIlIlI(0x1b0)]:FindFirstChildOfClass(_lIIIlIlI(0x1b1))
                   if _llIllIlI then _llIllIlI[_lIIIlIlI(0x1b2)] = _IIlIlIlI end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  end
                  
                  function _IlIllIlI.SetJump(_IIlIlIlI)
                   _l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1ba)] = _IIlIlIlI
                   local _llIllIlI = _l11IlIlI[_lIIIlIlI(0x1b0)] and _l11IlIlI[_lIIIlIlI(0x1b0)]:FindFirstChildOfClass(_lIIIlIlI(0x1b1))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   if _llIllIlI then
                   _llIllIlI[_lIIIlIlI(0x1b3)] = (0x1 == 0x1)
                   _llIllIlI[_lIIIlIlI(0x1b4)] = _IIlIlIlI
                   end
                  end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  
                  do
                   local _1lIllIlI, _lIIllIlI, _IIIllIlI, _1IIllIlI, _l1IllIlI = (0x0 == 0x1), nil, nil, nil, (((0x190 - 0x0) / 0x8))
                   local function _I1IllIlI()
                   local _11IllIlI = _l11IlIlI[_lIIIlIlI(0x1b0)] and _l11IlIlI[_lIIIlIlI(0x1b0)]:FindFirstChild(_lIIIlIlI(0x1bb))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   if not _11IllIlI then return end
                   _1lIllIlI = (0x1 == 0x1)
                   _lIIllIlI = Instance[_lIIIlIlI(0x2b)](_lIIIlIlI(0x1bc))
                   _lIIllIlI[_lIIIlIlI(0x1bd)] = Vector3[_lIIIlIlI(0x2b)](9e9, 9e9, 9e9)
                   _lIIllIlI[_lIIIlIlI(0x1be)] = Vector3[_lIIIlIlI(0x1bf)]
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lIIllIlI[_lIIIlIlI(0x2c)] = _11IllIlI
                   _IIIllIlI = Instance[_lIIIlIlI(0x2b)](_lIIIlIlI(0x1c0))
                   _IIIllIlI[_lIIIlIlI(0x1c1)] = Vector3[_lIIIlIlI(0x2b)](9e9, 9e9, 9e9)
                   _IIIllIlI[_lIIIlIlI(0x1c2)] = (((0x1f40 - 0x0) / 0x8))
                   _IIIllIlI[_lIIIlIlI(0x2c)] = _11IllIlI
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _1IIllIlI = _ll1IlIlI[_lIIIlIlI(0x1c3)]:Connect(function()
                   if not _1lIllIlI then return end
                   local _ll1llIlI = Vector3[_lIIIlIlI(0x1bf)]
                   local _Il1llIlI = _I11IlIlI[_lIIIlIlI(0x1c4)]
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1c5)]) then _ll1llIlI += _Il1llIlI[_lIIIlIlI(0x1c6)] end
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1c7)]) then _ll1llIlI -= _Il1llIlI[_lIIIlIlI(0x1c6)] end
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1c8)]) then _ll1llIlI -= _Il1llIlI[_lIIIlIlI(0x1c9)] end
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1ca)]) then _ll1llIlI += _Il1llIlI[_lIIIlIlI(0x1c9)] end
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1cb)]) then _ll1llIlI += Vector3[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)) end
                   if _11IIlIlI:IsKeyDown(Enum[_lIIIlIlI(0x11)][_lIIIlIlI(0x1cc)]) then _ll1llIlI -= Vector3[_lIIIlIlI(0x2b)]((0x19 - 0x19), (0x2a / 0x2a), (0x19 - 0x19)) end
                   _lIIllIlI[_lIIIlIlI(0x1be)] = _ll1llIlI[_lIIIlIlI(0x1cd)] > (0x19 - 0x19) and _ll1llIlI[_lIIIlIlI(0x1ce)] * _l1IllIlI or Vector3[_lIIIlIlI(0x1bf)]
                   _IIIllIlI[_lIIIlIlI(0x1c4)] = _Il1llIlI
                   end)
                   end
                   local function _1l1llIlI()
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                   _1lIllIlI = (0x0 == 0x1)
                   if _1IIllIlI then _1IIllIlI:Disconnect() end
                   if _lIIllIlI then _lIIllIlI:Destroy() end
                   if _IIIllIlI then _IIIllIlI:Destroy() end
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   function _IlIllIlI.SetFly(_l1I1IIlI) if _l1I1IIlI then _I1IllIlI() else _1l1llIlI() end end
                   function _IlIllIlI.SetFlySpeed(_IIlIlIlI) _l1IllIlI = _IIlIlIlI end
                  end
                  
                  _l11IlIlI[_lIIIlIlI(0x1d0)]:Connect(function()
                   task[_lIIIlIlI(0x112)](0.6)
                   if _l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1ba)] then _IlIllIlI[_lIIIlIlI(0x1b9)](_l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1ba)]) end
                   if _l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1b8)] then _IlIllIlI[_lIIIlIlI(0x1b6)](_l1I1lIlI[_lIIIlIlI(0x1b7)][_lIIIlIlI(0x1b8)]) end
                  end)
                  
                  function _IlIllIlI.setBackgroundMode(_IlIlIIlI)
                   _1lI1lIlI[_lIIIlIlI(0x1d2)] = _IlIlIIlI
                   local _l1lI1IlI = _IllI1IlI[_lIIIlIlI(0x14a)]
                   if _IlIlIIlI == _lIIIlIlI(0x1d3) then
                   _l1lI1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                   _l1lI1IlI[_lIIIlIlI(0xe8)] = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x32)](_l1lI1IlI, 0.3, { ImageTransparency = 0.94 })
                   elseif _IlIlIIlI == _lIIIlIlI(0x1d4) then
                   _l1lI1IlI[_lIIIlIlI(0xbc)] = (0x1 == 0x1)
                   _l1lI1IlI[_lIIIlIlI(0xe8)] = Color3[_lIIIlIlI(0x1e)]((((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)), (((0x7f8 - 0x0) / 0x8)))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   _lllIlIlI[_lIIIlIlI(0x32)](_l1lI1IlI, 0.3, { ImageTransparency = 0.92 })
                   else
                   _lllIlIlI[_lIIIlIlI(0x32)](_l1lI1IlI, 0.25, { ImageTransparency = (0x2a / 0x2a) })
                   task[_lIIIlIlI(0xf3)](0.25, function() _l1lI1IlI[_lIIIlIlI(0xbc)] = (0x0 == 0x1) end)
                   end
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  end
                  
                  _l1IIlIlI[_lIIIlIlI(0x1ae)] = _IlIllIlI
                  
                  _IllI1IlI[_lIIIlIlI(0x144)]()
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                  local _lI1llIlI = _IllI1IlI[_lIIIlIlI(0x1a2)](_lIIIlIlI(0xaa))
                  local _II1llIlI = _IllI1IlI[_lIIIlIlI(0x1a2)](_lIIIlIlI(0x1d5))
                  local _1I1llIlI = _IllI1IlI[_lIIIlIlI(0x1a2)](_lIIIlIlI(0x3b))
                  
                  local _l11llIlI = _lI1llIlI:CreateSection(_lIIIlIlI(0x1d6))
                  _l11llIlI:CreateToggle(_lIIIlIlI(0x1d7), {
                   _I1l1IIlI = (0x0 == 0x1),
                   callback = function(_l1I1IIlI) _IlIllIlI[_lIIIlIlI(0x1af)](_l1I1IIlI) end,
                  })
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  _l11llIlI:CreateSlider(_lIIIlIlI(0x1d8), {
                   _ll11IIlI = (((0x50 - 0x0) / 0x8)), _Il11IIlI = (((0x960 - 0x0) / 0x8)), _I1l1IIlI = (((0x190 - 0x0) / 0x8)),
                   callback = function(_IIlIlIlI) _IlIllIlI[_lIIIlIlI(0x1cf)](_IIlIlIlI) end,
                  })
                  _l11llIlI:CreateSlider(_lIIIlIlI(0x1d9), {
                   _ll11IIlI = (((0x80 - 0x0) / 0x8)), _Il11IIlI = (((0x640 - 0x0) / 0x8)), _I1l1IIlI = (((0x80 - 0x0) / 0x8)),
                   callback = function(_IIlIlIlI) _IlIllIlI[_lIIIlIlI(0x1b6)](_IIlIlIlI) end,
                  })
                  _l11llIlI:CreateInput(_lIIIlIlI(0x1da), {
                   _I1l1IIlI = (((0x80 - 0x0) / 0x8)), _ll11IIlI = (0x2a / 0x2a), _Il11IIlI = (((0xfa0 - 0x0) / 0x8)), integer = (0x1 == 0x1),
                   callback = function(_IIlIlIlI) _IlIllIlI[_lIIIlIlI(0x1b6)](_IIlIlIlI) end,
                  })
                  _l11llIlI:CreateInput(_lIIIlIlI(0x1db), {
                   _I1l1IIlI = (((0x190 - 0x0) / 0x8)), _ll11IIlI = (0x2a / 0x2a), _Il11IIlI = (((0xfa0 - 0x0) / 0x8)), integer = (0x1 == 0x1),
                   callback = function(_IIlIlIlI) _IlIllIlI[_lIIIlIlI(0x1b9)](_IIlIlIlI) end,
                  })
                  
                  local _I11llIlI = _lI1llIlI:CreateSection(_lIIIlIlI(0x1dc))
                  local _111llIlI = _I11llIlI:CreateDropdown(_lIIIlIlI(0x1dd), { _I1l1IIlI = (0x0 == 0x1) })
                  _111llIlI:CreateToggle(_lIIIlIlI(0x1de), { _I1l1IIlI = (0x0 == 0x1), callback = function() end })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  _111llIlI:CreateSlider(_lIIIlIlI(0x1df), { _ll11IIlI = (((0x40 - 0x0) / 0x8)), _Il11IIlI = (((0xc0 - 0x0) / 0x8)), _I1l1IIlI = (((0x70 - 0x0) / 0x8)), callback = function() end })
                  _111llIlI:CreateInput(_lIIIlIlI(0x1e0), { _I1l1IIlI = (((0xfa0 - 0x0) / 0x8)), _ll11IIlI = (((0x190 - 0x0) / 0x8)), _Il11IIlI = (((0x9c40 - 0x0) / 0x8)), integer = (0x1 == 0x1) })
                  
                  local _lllIlIlI = _II1llIlI:CreateSection(_lIIIlIlI(0x1e1))
                  _lllIlIlI:CreateToggle(_lIIIlIlI(0x1e2), {
                   _I1l1IIlI = (0x0 == 0x1),
                   callback = function(_l1I1IIlI)
                   _1lI1lIlI:Apply(_l1I1IIlI and _lIIIlIlI(0x1e3) or _lIIIlIlI(0x10))
                   if _1lI1lIlI[_lIIIlIlI(0x1d2)] ~= _lIIIlIlI(0x95) then _IlIllIlI[_lIIIlIlI(0x1d1)](_1lI1lIlI[_lIIIlIlI(0x1d2)]) end
                   _l1IIlIlI[_lIIIlIlI(0xda)]({ _lIIlIIlI = (_l1I1IIlI and _lIIIlIlI(0x1e3) or _lIIIlIlI(0x10)) .. _lIIIlIlI(0x1e4), _IIIlIIlI = (((0x10 - 0x0) / 0x8)) })
                   end,
                  })
                  _lllIlIlI:CreateToggle(_lIIIlIlI(0x1e5), {
                   _I1l1IIlI = (0x1 == 0x1),
                   callback = function(_l1I1IIlI) _IllI1IlI[_lIIIlIlI(0x18d)](_l1I1IIlI) end,
                  })
                  
                  local _IllIlIlI = _II1llIlI:CreateSection(_lIIIlIlI(0x1e6))
                  _IllIlIlI:CreateToggle(_lIIIlIlI(0x1e7), {
                   _I1l1IIlI = (0x0 == 0x1),
                   callback = function(_l1I1IIlI)
                   _IllI1IlI[_lIIIlIlI(0x195)](_l1I1IIlI and _lIIIlIlI(0x194) or _lIIIlIlI(0x19))
                   _l1IIlIlI[_lIIIlIlI(0xda)]({ _lIIlIIlI = _lIIIlIlI(0x1e8) .. (_l1I1IIlI and _lIIIlIlI(0x194) or _lIIIlIlI(0x19)), _IIIlIIlI = (((0x10 - 0x0) / 0x8)) })
                   end,
                  })
                  if not ((0x3c * 0x2) == 0x78) then while (0x1 == 0x1) do end end
                  _IllIlIlI:CreateSlider(_lIIIlIlI(0x1e9), {
                   _ll11IIlI = (((0xf0 - 0x0) / 0x8)), _Il11IIlI = (((0x320 - 0x0) / 0x8)), _I1l1IIlI = (((0x320 - 0x0) / 0x8)),
                   callback = function(_IIlIlIlI) _IllI1IlI[_lIIIlIlI(0xaa)][_lIIIlIlI(0x191)] = (0x2a / 0x2a) - _IIlIlIlI / (((0x320 - 0x0) / 0x8)) end,
                  })
                  _IllIlIlI:CreateSlider(_lIIIlIlI(0x1ea), {
                   _ll11IIlI = (((0x230 - 0x0) / 0x8)), _Il11IIlI = (((0x410 - 0x0) / 0x8)), _I1l1IIlI = (((0x320 - 0x0) / 0x8)),
                   callback = function(_IIlIlIlI)
                   local _I1IIlIlI = _IllI1IlI[_lIIIlIlI(0xaa)]:FindFirstChildOfClass(_lIIIlIlI(0x1eb))
                   if not _I1IIlIlI then _I1IIlIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x1eb), { Parent = _IllI1IlI[_lIIIlIlI(0xaa)] }) end
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IIlIlI, 0.15, { Scale = _IIlIlIlI / (((0x320 - 0x0) / 0x8)) })
                   end,
                  })
                  
                  local _1llIlIlI = _II1llIlI:CreateSection(_lIIIlIlI(0xf7))
                  _1llIlIlI:CreateToggle(_lIIIlIlI(0x1ec), {
                   _I1l1IIlI = (0x0 == 0x1),
                   callback = function(_l1I1IIlI)
                   _l1IIlIlI[_lIIIlIlI(0x119)](_l1I1IIlI)
                   _l1IIlIlI[_lIIIlIlI(0xda)]({ _lIIlIIlI = _lIIIlIlI(0x1ed) .. (_l1I1IIlI and _lIIIlIlI(0x1ee) or _lIIIlIlI(0x1ef)), _IIIlIIlI = (((0x10 - 0x0) / 0x8)) })
                   end,
                  })
                  
                  local _lIlIlIlI = _II1llIlI:CreateSection(_lIIIlIlI(0x1f0))
                  _lIlIlIlI:CreateColorPicker(_lIIIlIlI(0x1f1), {
                   _I1l1IIlI = _111IlIlI[_lIIIlIlI(0xa0)],
                   callback = function(_llIIlIlI)
                   _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0x9f)] = _llIIlIlI
                   for _11lIlIlI, _I1IIlIlI in ipairs(_l1I1lIlI[_lIIIlIlI(0x129)]) do
                   if _I1IIlIlI[_lIIIlIlI(0x19b)] and _I1IIlIlI[_lIIIlIlI(0x19b)][_lIIIlIlI(0x2c)] then
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IIlIlI[_lIIIlIlI(0x19b)], 0.2, { BackgroundColor3 = _llIIlIlI })
                   _lllIlIlI[_lIIIlIlI(0x32)](_I1IIlIlI[_lIIIlIlI(0x1f2)], 0.2, { TextColor3 = _llIIlIlI })
                   end
                   end
                   end,
                  })
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  _lIlIlIlI:CreateColorPicker(_lIIIlIlI(0x1f3), {
                   _I1l1IIlI = _111IlIlI[_lIIIlIlI(0xa0)],
                   callback = function(_llIIlIlI)
                   _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa1)] = _llIIlIlI
                   for _11lIlIlI, _1lllIIlI in pairs(_l1I1lIlI[_lIIIlIlI(0x183)]) do
                   if _1lllIIlI[_lIIIlIlI(0x1ab)] then _1lllIIlI[_lIIIlIlI(0x1ab)](_l1I1lIlI[_lIIIlIlI(0x182)] == _1lllIIlI) end
                   end
                   end,
                  })
                  _lIlIlIlI:CreateColorPicker(_lIIIlIlI(0x1f4), {
                   _I1l1IIlI = _111IlIlI[_lIIIlIlI(0xa0)],
                   callback = function(_llIIlIlI)
                   _l1I1lIlI[_lIIIlIlI(0x9e)][_lIIIlIlI(0xa2)] = _llIIlIlI
                   for _11lIlIlI, _1lllIIlI in ipairs(_l1I1lIlI[_lIIIlIlI(0x126)]) do
                   if _1lllIIlI[_lIIIlIlI(0x1a0)] and _1lllIIlI[_lIIIlIlI(0x1a0)][_lIIIlIlI(0x2c)] and _1lllIIlI[_lIIIlIlI(0x1a1)] then _1lllIIlI[_lIIIlIlI(0x1a1)]() end
                   end
                   end,
                  })
                  
                  _1I1llIlI:CreateSection(_lIIIlIlI(0x1f5))
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                  
                  local function _IIlIlIlI(_1ll1IIlI, _lIlIlIlI, _1IlIlIlI)
                   local _IIl1IIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0x2d), {
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), (0x19 - 0x19), (0x19 - 0x19), (((0x180 - 0x0) / 0x8))),
                   BackgroundColor3 = _lIlIlIlI[_lIIIlIlI(0xaf)],
                   BorderSizePixel = (0x19 - 0x19),
                   AutoButtonColor = (0x0 == 0x1),
                   Text = _lIIIlIlI(0x1d),
                   LayoutOrder = _1I1llIlI:nextOrder(),
                   Parent = _1I1llIlI[_lIIIlIlI(0x138)],
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_IIl1IIlI, (((0x40 - 0x0) / 0x8)))
                   _lllIlIlI[_lIIIlIlI(0x3a)](_IIl1IIlI, _lIlIlIlI[_lIIIlIlI(0x3c)], (0x2a / 0x2a), 0.5)
                  
                   local _l1lIlIlI = { _lIlIlIlI[_lIIIlIlI(0x149)], _lIlIlIlI[_lIIIlIlI(0xee)], _lIlIlIlI[_lIIIlIlI(0x108)], _lIlIlIlI[_lIIIlIlI(0x123)] }
                  do local _chk = (0x1e + 0x22) == 0x40; if not _chk then return end end
                   for _IlIIlIlI, _I1lIlIlI in ipairs(_l1lIlIlI) do
                   local _11lIlIlI = _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xab), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)) + (_IlIIlIlI - (0x2a / 0x2a)) * (((0xb0 - 0x0) / 0x8)), (((0x70 - 0x0) / 0x8))),
                   Size = UDim2[_lIIIlIlI(0x15)]((((0x90 - 0x0) / 0x8)), (((0xa0 - 0x0) / 0x8))),
                   BackgroundColor3 = _I1lIlIlI,
                   BorderSizePixel = (0x19 - 0x19),
                   Parent = _IIl1IIlI,
                   })
                   _lllIlIlI[_lIIIlIlI(0x37)](_11lIlIlI, (((0x20 - 0x0) / 0x8)))
                   end
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  
                   _lllIlIlI[_lIIIlIlI(0x2a)](_lIIIlIlI(0xb2), {
                   Position = UDim2[_lIIIlIlI(0x15)]((((0x50 - 0x0) / 0x8)) + (((0x20 - 0x0) / 0x8)) * (((0xb0 - 0x0) / 0x8)) + (((0x40 - 0x0) / 0x8)), (0x19 - 0x19)),
                   Size = UDim2[_lIIIlIlI(0x2b)]((0x2a / 0x2a), -(((0x50 - 0x0) / 0x8)) - (((0x20 - 0x0) / 0x8)) * (((0xb0 - 0x0) / 0x8)) - (((0xa0 - 0x0) / 0x8)), (0x2a / 0x2a), (0x19 - 0x19)),
                   BackgroundTransparency = (0x2a / 0x2a),
                   Font = Enum[_lIIIlIlI(0xb3)][_lIIIlIlI(0xe9)],
                   Text = _1ll1IIlI, TextSize = (((0x70 - 0x0) / 0x8)),
                   TextColor3 = _lIlIlIlI[_lIIIlIlI(0xb5)],
                   TextXAlignment = Enum[_lIIIlIlI(0xb6)][_lIIIlIlI(0xb7)],
                   Parent = _IIl1IIlI,
                   })
                  
                   _IIl1IIlI[_lIIIlIlI(0xf2)]:Connect(_1IlIlIlI)
                  end
                  
                  _IIlIlIlI(_lIIIlIlI(0x1f6), _1lI1lIlI[_lIIIlIlI(0x10)], function()
                   _1lI1lIlI:Apply(_lIIIlIlI(0x10)); _IlIllIlI[_lIIIlIlI(0x1d1)](_lIIIlIlI(0x95))
                  end)
                  _IIlIlIlI(_lIIIlIlI(0x1f7), _1lI1lIlI[_lIIIlIlI(0x1e3)], function()
                   _1lI1lIlI:Apply(_lIIIlIlI(0x1e3)); _IlIllIlI[_lIIIlIlI(0x1d1)](_lIIIlIlI(0x95))
                  end)
                  _IIlIlIlI(_lIIIlIlI(0x1f8), _1lI1lIlI[_lIIIlIlI(0x1f9)], function()
                   _1lI1lIlI:Apply(_lIIIlIlI(0x1f9)); _IlIllIlI[_lIIIlIlI(0x1d1)](_lIIIlIlI(0x1d3))
                  end)
                  _IIlIlIlI(_lIIIlIlI(0x1fa), _1lI1lIlI[_lIIIlIlI(0x1fb)], function()
                   _1lI1lIlI:Apply(_lIIIlIlI(0x1fb)); _IlIllIlI[_lIIIlIlI(0x1d1)](_lIIIlIlI(0x1d4))
                  end)
                  
                  _l1I1lIlI[_lIIIlIlI(0x182)] = _lI1llIlI
                  _lI1llIlI[_lIIIlIlI(0x1ab)]((0x1 == 0x1))
                  if (((0x55 * 0x3) % 0x2) == 0x0) then local _ghost = 0xbeef; if _ghost == 0 then return end end
                  _lI1llIlI[_lIIIlIlI(0x1ac)]()
                  
                  _IllI1IlI[_lIIIlIlI(0x171)]:GetPropertyChangedSignal(_lIIIlIlI(0xbb)):Connect(function()
                   local _llIIlIlI = _IllI1IlI[_lIIIlIlI(0x171)][_lIIIlIlI(0xbb)]:lower():gsub(_lIIIlIlI(0x1fc), _lIIIlIlI(0x1d))
                   local _IlIIlIlI = _l1I1lIlI[_lIIIlIlI(0x182)]
                   if not _IlIIlIlI or not _IlIIlIlI[_lIIIlIlI(0x138)] then return end
                   for _11lIlIlI, _1lIIlIlI in ipairs(_IlIIlIlI[_lIIIlIlI(0x138)]:GetChildren()) do
                   if _1lIIlIlI:IsA(_lIIIlIlI(0xab)) and _1lIIlIlI[_lIIIlIlI(0x125)]:match(_lIIIlIlI(0x1fd)) then
                   local _1IlIIIlI = _1lIIlIlI:FindFirstChildOfClass(_lIIIlIlI(0xb2))
                   local _1l1l1IlI = _1IlIIIlI and _1IlIIIlI[_lIIIlIlI(0xbb)]:lower():gsub(_lIIIlIlI(0x1fc), _lIIIlIlI(0x1d)) or _lIIIlIlI(0x1d)
                   _1lIIlIlI[_lIIIlIlI(0xbc)] = (_llIIlIlI == _lIIIlIlI(0x1d) or _1l1l1IlI:find(_llIIlIlI, (0x2a / 0x2a), (0x1 == 0x1)))
                   end
                   end
                  end)
                  
                  pcall(function()
                   getgenv()[_lIIIlIlI(0xc)] = _l1I1lIlI
                   getgenv()[_lIIIlIlI(0x1fe)] = _l1IIlIlI
                  end)
                  
                  task[_lIIIlIlI(0xf3)](0.5, function()
                   _l1IIlIlI[_lIIIlIlI(0xda)]({ _lIIlIIlI = _lIIIlIlI(0x1ff), _IIIlIIlI = (((0x28 - 0x0) / 0x8)) })
                  end)
                  
                  print(string[_lIIIlIlI(0x20)](_lIIIlIlI(0x200), _111IlIlI[_lIIIlIlI(0x169)]))
                end
                _I1IIlIlI = nil
              else
                break
              end
            end
      end)
    end, {})
  end
end)()

_II1llI_()
