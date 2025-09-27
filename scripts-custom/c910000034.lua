--Cycle - Sword and Shield
--References: 1. Dogmatikacism 2. Mirror of Yata
local s,id=GetID()
function s.initial_effect(c)
	aux.AddEquipProcedure(c,nil,aux.FilterBoolFunction(Card.IsSetCard,0x2c6))
	--Change ATK
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_EQUIP)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(s.value)
	c:RegisterEffect(e1)
--Destruction replacement for the equipped monster
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_EQUIP)
	e2:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e2:SetCode(EFFECT_DESTROY_SUBSTITUTE)
	e2:SetValue(s.desval)
	c:RegisterEffect(e2)
end

function s.value(e,c)
	local ec=e:GetHandler():GetEquipTarget()
	if ec:IsSetCard(0x2c6) and c:HasLevel() then
			return 100*ec:GetLevel()
	end
end

function s.desval(e,re,r,rp)
	return (r&REASON_BATTLE)~=0
end