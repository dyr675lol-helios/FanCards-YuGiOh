--Anphibian Cyclops
--Created by Helio'Star
local s,id=GetID()
function s.initial_effect(c)
  --Draw 1 card
  local e1=Effect.CreateEffect(c)
     e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
     e1:SetCode(EVENT_BATTLE_DAMAGE)
     e1:SetCondition(function(e,tp,eg,ep,ev,re,r,rp) return ep==1-tp end)
     e1:SetTarget(s.drtg)
     e1:SetOperation(s.drop)
  c:RegisterEffect(e1)
end

function s.drtg(e,tp,eg,ep,ev,re,r,rp,chk)
     if chk==0 then return Duel.IsPlayerCanDraw(tp,1) end
  Duel.SetTargetPlayer(tp)
  Duel.SetTargetParam(1)
  Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
end

function s.drop(e,tp,eg,ep,ev,re,r,rp)
     local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
  Duel.Draw(p,d,REASON_EFFECT)
end
