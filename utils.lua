-- Utils

local m = {}

local function keyboardUpper(key)
  local upperTable = {
    a='A',
    b='B',
    c='C',
    d='D',
    e='E',
    f='F',
    g='G',
    h='H',
    i='I',
    j='J',
    k='K',
    l='L',
    m='M',
    n='N',
    o='O',
    p='P',
    q='Q',
    r='R',
    s='S',
    t='T',
    u='U',
    v='V',
    w='W',
    x='X',
    y='Y',
    z='Z',
    ['`']='~',
    ['1']='!',
    ['2']='@',
    ['3']='#',
    ['4']='$',
    ['5']='%',
    ['6']='^',
    ['7']='&',
    ['8']='*',
    ['9']='(',
    ['0']=')',
    ['-']='_',
    ['=']='+',
    ['[']='}',
    [']']='}',
    ['\\']='|',
    [';']=':',
    ['\'']='"',
    [',']='<',
    ['.']='>',
    ['/']='?'
  }
  uppperKey = upperTable[key]
  if uppperKey then
    return uppperKey
  else
    return key
  end
end

function m.singleKey(key, name)
  local mod = {}
  if key == keyboardUpper(key) and string.len(key) == 1 then
    mod = {'shift'}
    key = string.lower(key)
  end

  if name then
    return {mod, key, name}
  else
    return {mod, key, 'no name'}
  end
end


function m.findfunction(x)
  assert(type(x) == "string")
  local f=_G
  for v in x:gmatch("[^%.]+") do
    if type(f) ~= "table" then
      return nil, "looking for '"..v.."' expected table, not "..type(f)
    end
    f=f[v]
  end
  if type(f) == "function" then
    return f
  else
    return nil, "expected function, not "..type(f)
  end
end

return m
