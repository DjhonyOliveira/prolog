% Fatos de evidências
impressao_digital(lugar_crime).
motivo(financeiro).
testemunha(visto_discutindo).
relacao(intima).
alibi(joao, nao_verificado).
alibi(maria, verificado).

% Regras para sugerir suspeitos com base nas evidências
suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
suspeito(joao) :- testemunha(visto_discutindo), relacao(intima).
suspeito(maria) :- alibi(maria, nao_verificado).

% Regras para sugerir teorias com base nas evidências
teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
teoria(crime_financeiro) :- motivo(financeiro), impressao_digital(lugar_crime).

% Consultar evidências fornecidas pelo usuário e sugerir análise
consultar_evidencias :-
    write('Existem impressões digitais no lugar do crime? (sim/nao): '),
    read(Impressao),
    (Impressao == sim -> impressao_digital(lugar_crime); true),

    write('Há um motivo financeiro para o crime? (sim/nao): '),
    read(Motivo),
    (Motivo == sim -> motivo(financeiro); true),

    write('Há uma testemunha ocular que viu alguém discutindo no local? (sim/nao): '),
    read(Testemunha),
    (Testemunha == sim -> testemunha(visto_discutindo); true),

    write('Há uma relação íntima entre a vítima e o suspeito? (sim/nao): '),
    read(Relacao),
    (Relacao == sim -> relacao(intima); true),

    write('O álibi de Maria foi verificado? (sim/nao): '),
    read(AlibiMaria),
    (AlibiMaria == nao -> alibi(maria, nao_verificado); alibi(maria, verificado)),

    write('Analisando o caso...'), nl,
    sugestao.

% Sugerir suspeitos e teorias baseados nas evidências fornecidas
sugestao :-
    (suspeito(Suspeito) -> write('Suspeito encontrado: '), write(Suspeito), nl; write('Nenhum suspeito encontrado com as evidências fornecidas.'), nl),
    (teoria(Teoria) -> write('Teoria do crime: '), write(Teoria), nl; write('Nenhuma teoria específica identificada.'), nl).
