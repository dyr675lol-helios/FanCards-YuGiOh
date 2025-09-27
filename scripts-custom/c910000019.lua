--Infernal Cyclops
local s,id=GetID()
function s.initial_effect(c)
local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.econ)
	e1:SetValue(s.efilter)
	c:RegisterEffect(e1)
end

function s.cfilter(c)
  return c:IsSetCard(0x2c6) and c:IsMonster() and c:IsLocation(LOCATION_MZONE) and c:IsFaceup()
end

function s.econ(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.cfilter,e:GetHandlerPlayer(),LOCATION_MZONE,0,1,e:GetHandler())
end

function s.efilter(e,te)
	return te:GetOwner()~=e:GetOwner()
end