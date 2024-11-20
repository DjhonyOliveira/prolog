livro('1984', ficcao, [politica, distopia, sociedade]).
livro('Sapiens', historia, [ciencia, humanidade, evolucao]).
livro('O Poder do Hábito', autoajuda, [psicologia, comportamento, mudanca]).
livro('O Senhor dos Anéis', ficcao, [aventura, fantasia, amizade]).
livro('Uma Breve História do Tempo', ciencia, [cosmos, fisica, universo]).
livro('A Arte da Guerra', historia, [estrategia, filosofia, lideranca]).

recomendar_livro :-
    write('Bem-vindo ao sistema de recomendação de livros!'), nl,
    write('Escolha seus gêneros favoritos (uma lista como [ficcao, historia] ou um único valor como ficcao): '), nl,
    read(GenerosInput),
    formatar_entrada(GenerosInput, Generos),
    write('Informe seus interesses (uma lista, como [politica, fantasia] ou um único valor como politica): '), nl,
    read(InteressesInput),
    formatar_entrada(InteressesInput, Interesses),
    findall(Livro, recomendacao(Livro, Generos, Interesses), LivrosRecomendados),
    exibir_recomendacoes(LivrosRecomendados).

formatar_entrada([Primeiro|Resto], [Primeiro|Resto]) :- !.
formatar_entrada(UnicoValor, [UnicoValor]).

recomendacao(Livro, Generos, Interesses) :-
    livro(Livro, Genero, Tags),
    member(Genero, Generos),
    member(Interesse, Interesses),
    member(Interesse, Tags),
    !.

exibir_recomendacoes([]) :-
    write('Nenhum livro encontrado com base nas suas preferências. Tente novamente!'), nl.
exibir_recomendacoes(Livros) :-
    write('Baseado nas suas preferências, recomendamos os seguintes livros:'), nl,
    listar_livros(Livros).

listar_livros([]).
listar_livros([Livro | Resto]) :-
    write('- '), write(Livro), nl,
    listar_livros(Resto).
