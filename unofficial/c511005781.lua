--Hibikime (DOR)
--scripted by GameMaster(GM)
local s,id=GetID()
function s.initial_effect(c)
--atk/def sonic maids +500
local e1=Effect.CreateEffect(c)
e1:SetCategory(CATEGORY_ATKCHANGE+CATEGORY_DEFCHANGE)
e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_FLIP)
e1:SetOperation(s.operation)
c:RegisterEffect(e1)
end
s.listed_names={38942059}

function s.atktg(e,c)
return Duel.GetMatchingGroup(s.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
end

function s.filter(c,code)
return c:IsType(TYPE_MONSTER)  and c:IsCode(38942059) and c:IsFaceup()
end

function s.operation(e,tp,eg,ep,ev,re,r,rp)
local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
local tc=g:GetFirst()
while tc do
local e1=Effect.CreateEffect(e:GetHandler())
e1:SetType(EFFECT_TYPE_SINGLE)
e1:SetCode(EFFECT_UPDATE_ATTACK)
e1:SetRange(LOCATION_MZONE)
e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
e1:SetTarget(s.atktg)
e1:SetValue(500)
e1:SetReset(RESET_EVENT+RESETS_STANDARD_DISABLE)
tc:RegisterEffect(e1)
local e2=e1:Clone()
e2:SetCode(EFFECT_UPDATE_DEFENSE)
tc:RegisterEffect(e2)
tc=g:GetNext()
end
end
