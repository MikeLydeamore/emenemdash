local replacements = { "–", "—", "−", "\u{2011}", "\u{2E3B}", "\u{00B7}", "~"}

local input_dashes = {
  "-",   -- ASCII hyphen-minus
  "–",   -- en dash
  "—",   -- em dash
  "−",   -- minus sign
  "‒",   -- figure dash
  "‐",   -- Unicode hyphen
  "\u{002D}", -- hyphen-minus
  "\u{2010}", -- hyphen
  "\u{2212}", -- minus sign
  "\u{2011}", -- non-breaking hyphen
  "\u{2012}", -- figure dash
  "\u{2013}", -- en dash
  "\u{2014}", -- em dash
  "\u{2015}", -- horizontal bar
  "\u{2E40}", -- double hyphen
  "\u{2E17}", -- double oblique hyphen
  "\u{FE58}", -- small em dash
  "\u{FE63}", -- small hyphen-minus
  "\u{FF0D}", -- fullwidth hyphen-minus
  "\u{1163}", -- Hangul jungseong eu
  "\u{2E3A}", -- two-em dash
  "\u{2E3B}", -- three-em dash
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
