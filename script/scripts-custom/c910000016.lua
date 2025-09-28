--Necro Cyclops
--Created by Helio'Star
local s,id=GetID()
function s.initial_effect(c)
  --atk/def
  local e1=Effect.CreateEffect(c)
     e1:SetType(EFFECT_TYPE_SINGLE)
     e1:SetCode(EFFECT_UPDATE_ATTACK)
     e1:SetRange(LOCATION_MZONE)
     e1:SetValue(s.value)
  c:RegisterEffect(e1)
  local e2=e1:Clone()
     e2:SetCode(EFFECT_UPDATE_DEFENSE)
  c:RegisterEffect(e2)
end

function s.filter(c)
  return c:IsSetCard(0x2c6) and c:IsMonster() and c:IsLocation(LOCATION_GRAVE)
end

function s.value(e,c)
  return Duel.GetMatchingGroupCount(s.filter,c:GetControler(),LOCATION_GRAVE,0,nil)*500
end
