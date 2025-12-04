local replacements = { "–", "—", "−" }

local input_dashes = {
  "-",   -- ASCII hyphen-minus
  "–",   -- en dash
  "—",   -- em dash
  "−",   -- minus sign
  "‒",   -- figure dash
  "‐",   -- Unicode hyphen
}

local function pick_random(tbl)
  return tbl[math.random(#tbl)]
end

function Meta(meta)
  local seed = os.time()
  math.randomseed(seed)
  return meta
end

function Str(el)
  local s = el.text

  for _, dash in ipairs(input_dashes) do
    local pattern = dash:gsub("(%p)", "%%%1")
    s = s:gsub(pattern, function()
      return pick_random(replacements)
    end)
  end

  el.text = s
  return el
end
