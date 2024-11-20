diagnostico :-
    write('Você tem febre? (sim/nao): '),
    read(Febre),
    write('Você tem tosse? (sim/nao): '),
    read(Tosse),
    write('Você tem cansaço? (sim/nao): '),
    read(Cansaco),
    diagnosticar(Febre, Tosse, Cansaco).

diagnosticar(sim, sim, sim) :-
    write('Diagnóstico: Você pode estar com a Gripe.'), nl.
diagnosticar(sim, nao, sim) :-
    write('Diagnóstico: Você pode estar com Resfriado.'), nl.
diagnosticar(nao, nao, nao) :-
    write('Diagnóstico: Você provavelmente não tem uma infecção respiratória.'), nl.
diagnosticar(_, _, _) :-
    write('Diagnóstico: Não conseguimos determinar um diagnóstico claro com essas respostas.'), nl.