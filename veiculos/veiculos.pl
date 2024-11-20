problema :-
    write('O carro não liga? (sim/nao): '),
    read(Motor),
    write('O carro solta uma fumaça escura ao acelerar? (sim/nao): '),
    read(Fumaca),
    write('O carro não vira corretamente ao dar ignição? (sim/nao): '),
    read(Bateria),
    solucao(Motor, Fumaca, Bateria).

solucao(sim, nao, nao) :-
    write('O carro pode estar com algum problema na ignição, leve o mesmo até uma mecanica'), nl.
solucao(nao, sim, nao) :-
    write('O carro pode estar queimando oléo'), nl.
solucao(sim, sim, nao) :-
    write('POssivel problema no motor, leve-o a uma mecanica o quando antes'), nl.
solucao(sim, sim, sim) :-
    write('Possivel problema elétrico, leve o veiculo a uma auto elétrica'), nl.
solucao(_, _, _) :-
    write('Não conseguimos determinar um diagnóstico claro com essas respostas.'), nl.