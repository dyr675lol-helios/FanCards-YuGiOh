--Elemental Cyclops
--Created by Helio'Star
--References: 1. Oneiros, The Dream Mirror Earking 2. Doublebyte Dragon 3. Ancient Gear Frame
local s,id=GetID()
function s.initial_effect(c)
--Must be properly summoned before reviving
    c:EnableReviveLimit()
    Fusion.AddProcMixN(c,true,true,s.ffilter,4)
--immune
    local e1=Effect.CreateEffect(c)
       e1:SetType(EFFECT_TYPE_SINGLE)
       e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
       e1:SetRange(LOCATION_MZONE)
       e1:SetCode(EFFECT_IMMUNE_EFFECT)
       e1:SetValue(s.efilter)
    c:RegisterEffect(e1)
--If this card attacks, your opponent cannot activate Spell/Trap Cards until the end of the Damage Step
    local e2=Effect.CreateEffect(c)
       e2:SetType(EFFECT_TYPE_FIELD)
       e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
       e2:SetCode(EFFECT_CANNOT_ACTIVATE)
       e2:SetRange(LOCATION_MZONE)
       e2:SetTargetRange(0,1)
       e2:SetValue(s.aclimit)
       e2:SetCondition(s.actcon)
    c:RegisterEffect(e2)
end

function s.ffilter(c,fc,sumtype,sp,sub,mg,sg)
    return c:IsSetCard(0x2c6,fc,sumtype,sp) and (not sg or sg:FilterCount(aux.TRUE,c)==0 or not sg:IsExists(Card.IsAttribute,1,c,c:GetAttribute(),fc,sumtype,sp))
end

function s.efilter(e,te)
	return te:IsMonsterEffect() and te:GetOwner()~=e:GetOwner()
end

function s.aclimit(e,re,tp)
	return re:IsHasType(EFFECT_TYPE_ACTIVATE)
end

function s.actcon(e)
	return Duel.GetAttacker()==e:GetHandler()
end
