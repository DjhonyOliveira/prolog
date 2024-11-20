objetivo(ganhar_massa).
objetivo(emagrecer).
objetivo(melhorar_condicionamento).

experiencia(iniciante).
experiencia(intermediario).
experiencia(avancado).

disponibilidade(tempo_limitado).
disponibilidade(tempo_aberto).

treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(intermediario).
treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(avancado).
treino(perda_de_peso) :- objetivo(emagrecer), disponibilidade(tempo_limitado).
treino(perda_de_peso) :- objetivo(emagrecer), disponibilidade(tempo_aberto).
treino(condicionamento) :- objetivo(melhorar_condicionamento), experiencia(iniciante).
treino(condicionamento) :- objetivo(melhorar_condicionamento), experiencia(intermediario).
treino(condicionamento) :- objetivo(melhorar_condicionamento), experiencia(avancado).

recomendacao(hipertrofia, ['Agachamento: 4 series de 8-12 repeticoes',
                            'Supino reto: 4 series de 8-12 repeticoes',
                            'Puxada na barra fixa: 3 series de 8-10 repeticoes',
                            'Rosca direta: 3 series de 10 repeticoes']).
recomendacao(perda_de_peso, ['Corrida: 30 minutos em ritmo moderado',
                              'Abdominais: 4 series de 20 repeticoes',
                              'Flexoes: 4 series de 15 repeticoes',
                              'Agachamento com peso corporal: 4 series de 20 repeticoes']).
recomendacao(condicionamento, ['Caminhada rapida: 30 minutos',
                                'Circuito de exercicios: 3 series de 10 repeticoes por exercicio',
                                'Burpees: 3 series de 12 repeticoes',
                                'Pular corda: 15 minutos continuos']).

consultar_usuario :-
    write('Qual e o seu objetivo? (ganhar_massa, emagrecer, melhorar_condicionamento): '),
    read(Objetivo),
    objetivo(Objetivo),

    write('Qual e o seu nivel de experiencia? (iniciante, intermediario, avancado): '),
    read(Experiencia),
    experiencia(Experiencia),

    write('Qual e a sua disponibilidade de tempo? (tempo_limitado, tempo_aberto): '),
    read(Disponibilidade),
    disponibilidade(Disponibilidade).

sugerir_treino :-
    consultar_usuario,
    treino(Treino),
    recomendacao(Treino, Recomendacao),
    nl,
    write('Plano de treino sugerido para voce:'), nl,
    write(Recomendacao), nl.
