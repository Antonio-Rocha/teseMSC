%__________________INICIALIZAÇÃO DOS ELEMENTOS DA REDE____________________%


%%%%%%%%%%%%   ESTRUTURAS   %%%%%%%%%%%%

base = struct('X',{},'Y',{},'MensagemIn',{},'MensagemOut',{});
veiculo = struct('Base',{},'X',{},'Y',{},'Mensagem',{});
veiculo_m = struct('Base',{},'X',{},'Y',{},'MensagemEntrega',{},'MensagemFinalizadas',{});
vsim = struct('Sim',[]);
mensagem = struct('ID',{},'ListaTarefas',{});


%%%%%%%%%%%%   BASES   %%%%%%%%%%%%

br = base;
br(1).X = 0;
br(1).Y = 0;

b1 = base;
b1(1).X = 6;
b1(1).Y = 6;

b2 = base;
b2(1).X = 15;
b2(1).Y = 5;

b3 = base;
b3(1).X = 14;
b3(1).Y = 16;

b4 = base;
b4(1).X = 4;
b4(1).Y = 13;


%%%%%%%%%%%%   VEÍCULOS   %%%%%%%%%%%%

vbr = veiculo;
vbrsim = vsim;
vbr(1).Base = 'br';
vbr(1).X = 0.6;
x_vbr = vbr(1).X;
vbr(1).Y = 0;
y_vbr = vbr(1).Y;

v1 = veiculo;
v1sim = vsim;
v1(1).Base = 'b1';
v1(1).X = 6.6;
x_v1 = v1(1).X;
v1(1).Y = 6;
y_v1 = v1(1).Y;

v2 = veiculo;
v2sim = vsim;
v2(1).Base = 'b2';
v2(1).X = 15.6;
x_v2 = v2(1).X;
v2(1).Y = 5;
y_v2 = v2(1).Y;

v3 = veiculo;
v3sim = vsim;
v3(1).Base = 'b3';
v3(1).X = 14.6;
x_v3 = v3(1).X;
v3(1).Y = 16;
y_v3 = v3(1).Y;

v4 = veiculo;
v4sim = vsim;
v4(1).Base = 'b4';
v4(1).X = 4.6;
x_v4 = v4(1).X;
v4(1).Y = 13;
y_v4 = v4(1).Y;

vm = veiculo_m;
vmsim = vsim;
vm(1).Base = 'b1';
vm(1).X = 6;
x_vm = vm(1).X;
vm(1).Y = 6.6;
y_vm = vm(1).Y;


%%%%%%%%%%%%   MENSAGENS   %%%%%%%%%%%%

mensagem_opr = mensagem;
mensagem_br = mensagem;
mensagem_b1 = mensagem;
mensagem_b2 = mensagem;
mensagem_b3 = mensagem;
mensagem_b4 = mensagem;
mensagem_executar = mensagem;
mensagem_m = mensagem;
mensagem_vm = mensagem;


%_______________________INICIALIZAÇÃO DA SIMULAÇÃO________________________%


%%%%%%%%%%%%   AMBIENTE DE SIMULAÇÃO   %%%%%%%%%%%%

figure;
hold on;
xlim([0 20]);
ylim([0 20]);


%%%%%%%%%%%%   PLOT VEÍCULOS E BASES   %%%%%%%%%%%%

vbrsim.Sim = plot(vbr(1).X,vbr(1).Y,'bo','MarkerFaceColor','b','MarkerSize',7,'DisplayName','Veículo BR');
v1sim.Sim = plot(v1(1).X,v1(1).Y,'ro','MarkerFaceColor','r','MarkerSize',7,'DisplayName','Veículos');
v2sim.Sim = plot(v2(1).X,v2(1).Y,'ro','MarkerFaceColor','r','MarkerSize',7);
v3sim.Sim = plot(v3(1).X,v3(1).Y,'ro','MarkerFaceColor','r','MarkerSize',7);
v4sim.Sim = plot(v4(1).X,v4(1).Y,'ro','MarkerFaceColor','r','MarkerSize',7);
vmsim.Sim = plot(vm(1).X,vm(1).Y,'go','MarkerFaceColor','g','MarkerSize',7,'DisplayName','Veículo Msg');
brsim = plot(br(1).X,br(1).Y,'bx','MarkerFaceColor','b','LineWidth',1.5,'MarkerSize',9,'DisplayName','BR');
b1sim = plot(b1(1).X,b1(1).Y,'kx','MarkerFaceColor','k','LineWidth',1.5,'MarkerSize',9,'DisplayName','Bases');
b2sim = plot(b2(1).X,b2(1).Y,'kx','MarkerFaceColor','k','LineWidth',1.5,'MarkerSize',9);
b3sim = plot(b3(1).X,b3(1).Y,'kx','MarkerFaceColor','k','LineWidth',1.5,'MarkerSize',9);
b4sim = plot(b4(1).X,b4(1).Y,'kx','MarkerFaceColor','k','LineWidth',1.5,'MarkerSize',9);
%legend();
%legend boxoff;


%_________________________VARIÁVEIS AUXILIARES____________________________%


%%%%%%%%%%%%   LISTAS DE TAREFAS   %%%%%%%%%%%%

lt_opr = cell(12,5);
lt_finalizadas = cell(20,5);
br_lt_recebidas = cell(20,5);
br_lt_enviadas = cell(20,5);
br_lt_concluidas = cell(20,5);
b1_lt_espera = cell(20,5);
b1_lt_finalizadas = cell(20,5);
b1_lt_entrega = cell(20,5);
b2_lt_espera = cell(20,5);
b2_lt_finalizadas = cell(20,5);
b2_lt_entrega = cell(20,5);
b3_lt_espera = cell(20,5);
b3_lt_finalizadas = cell(20,5);
b3_lt_entrega = cell(20,5);
b4_lt_espera = cell(20,5);
b4_lt_finalizadas = cell(20,5);
b4_lt_entrega = cell(20,5);


%%%%%%%%%%%%   ÍNDICES   %%%%%%%%%%%%

id_lt_opr = 1;
id_lt_fin = 1;
id_lt_brrec = 1;
id_lt_brenv = 1;
id_lt_brfin = 1;
id_lt_b1esp = 1;
id_lt_b1entr = 1;
id_lt_b1fin = 1;
id_lt_b2esp = 1;
id_lt_b2entr = 1;
id_lt_b2fin = 1;
id_lt_b3esp = 1;
id_lt_b3entr = 1;
id_lt_b3fin = 1;
id_lt_b4esp = 1;
id_lt_b4entr = 1;
id_lt_b4fin = 1;
id = 1;


%%%%%%%%%%%%   OUTRAS   %%%%%%%%%%%%

lista = {'Mapeamento','Patrulha','Reconhecimento'};

v = 0.025;
a = 0;
mover = 0;
timer = 0;
prio = 0;

init_vm = 1;
init_mov_vbr = 1;
init_mov_v1 = 1;
init_return_v1 = 1;
init_mov_v2 = 1;
init_return_v2 = 1;
init_mov_v3 = 1;
init_return_v3 = 1;
init_mov_v4 = 1;
init_return_v4 = 1;
init_mov_vm = 1;

vbr_proximo = 1;
vb1_proximo = 0;
m_b1_proximo = 1;
m_b2_proximo = 0;
m_b3_proximo = 0;
m_b4_proximo = 0;
b1_vproximo = 1;
b2_vproximo = 1;
b3_vproximo = 1;
b4_vproximo = 1;

mover_vbr = 0;
mover_vm = 0;
mover_v1 = 0;
mover_v2 = 0;
mover_v3 = 0;
mover_v4 = 0;

v1_executar = 0;
v2_executar = 0;
v3_executar = 0;
v4_executar = 0;

msg_vbr = 0;
msg_vm = 0;
msg_v1 = 0;
msg_v2 = 0;
msg_v3 = 0;
msg_v4 = 0;

stop_v1 = 0;
hold_v1 = 0;
stop_v2 = 0;
hold_v2 = 0;
stop_v3 = 0;
hold_v3 = 0;
stop_v4 = 0;
hold_v4 = 0;


%_______________________CICLO DE EXECUÇÃO DA REDE_________________________%


while(1)

    
%__________________________TAREFAS E MENSAGENS____________________________%


    %%%%%%%%%%%%   TAREFAS OPERADOR   %%%%%%%%%%%%
    
    if (isempty(lt_opr{1,1}) && timer == 0)
        xy = {'X:','Y:'};
        xyt = {'X:','Y:','Tempo:'};
        p1p2 = {'X1:','Y1:','X2:','Y2:'};
        titulo_r = 'RECONHECIMENTO';
        titulo_m = 'MAPEAMENTO';
        titulo_p = 'PATRULHA';
        tamanho = [1 50];
        
        for i=1:1:3 
        %janela do operador (TAREFA)
        [tarefa_id] = listdlg('ListString',lista,'PromptString','Selecionar o tipo de tarefa a executar.','SelectionMode','single','ListSize',[200,100]);

        %tarefa do tipo RECONHECIMENTO
        if tarefa_id == 3
            %coordenadas
            coords = (inputdlg(xy,titulo_r,tamanho)).';
            
            %área de trabalho
            if (str2double(coords(1)) < 10 && str2double(coords(2)) < 10)
                areatrab = 1;
            elseif (str2double(coords(1)) >= 10 && str2double(coords(2)) < 10)
                areatrab = 2;
            elseif (str2double(coords(1)) >= 10 && str2double(coords(2)) >= 10)
                areatrab = 3;
            elseif (str2double(coords(1)) < 10 && str2double(coords(2)) >= 10)
                areatrab = 4;
            end    
            
            tarefa = {'Reconhecimento',str2double(coords(1)),str2double(coords(2)),areatrab,'_'};
            lt_opr(id_lt_opr,:) = tarefa;
            id_lt_opr = id_lt_opr + 1;
            disp('Tarefa:');
            disp(tarefa);
        
        %tarefa do tipo PATRULHA   
        elseif tarefa_id == 2
            %coordenadas
            coords = (inputdlg(xyt,titulo_p,tamanho)).';
            
            %área de trabalho
            if (str2double(coords(1)) < 10 && str2double(coords(2)) < 10)
                areatrab = 1;
            elseif (str2double(coords(1)) >= 10 && str2double(coords(2)) < 10)
                areatrab = 2;
            elseif (str2double(coords(1)) >= 10 && str2double(coords(2)) >= 10)
                areatrab = 3;
            elseif (str2double(coords(1)) < 10 && str2double(coords(2)) >= 10)
                areatrab = 4;
            end    
            
            tarefa = {'Patrulha',str2double(coords(1)),str2double(coords(2)),areatrab,str2double(coords(3))};
            lt_opr(id_lt_opr,:) = tarefa;
            id_lt_opr = id_lt_opr + 1;
            disp('Tarefa:');
            disp(tarefa);
       
        %tarefa do tipo MAPEAMENTO    
        elseif tarefa_id == 1
            %coordenadas
            coords = (inputdlg(p1p2,titulo_m,tamanho)).';
            x = 10;
            y = 10;
            
            %divisão por quadrantes
            if (str2double(coords(1)) < 10 && str2double(coords(3)) < 10)
                if (str2double(coords(2)) < 10 && str2double(coords(4)) < 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) >= 10 && str2double(coords(4)) >= 10)
                    areatrab = 4;  
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) < 10 && str2double(coords(4)) >= 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(1)),10],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(4)) < 10 && str2double(coords(2)) >= 10)     
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),10],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                end
                
            elseif (str2double(coords(1)) >= 10 && str2double(coords(3)) >= 10)
                if (str2double(coords(2)) < 10 && str2double(coords(4)) < 10)
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) >= 10 && str2double(coords(4)) >= 10)
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) < 10 && str2double(coords(4)) >= 10)
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(1)),10],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(4)) < 10 && str2double(coords(2)) >= 10)   
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(1)),10],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                end
                
            elseif (str2double(coords(1)) < 10 && str2double(coords(3)) >= 10) 
                if (str2double(coords(2)) < 10 && str2double(coords(4)) < 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[10,str2double(coords(1))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) >= 10 && str2double(coords(4)) >= 10)
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[10,str2double(coords(1))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) < 10 && str2double(coords(4)) >= 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(4)) < 10 && str2double(coords(2)) >= 10)    
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                end
                
             elseif (str2double(coords(3)) < 10 && str2double(coords(1)) >= 10) 
                if (str2double(coords(2)) < 10 && str2double(coords(4)) < 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,str2double(coords(2))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[10,str2double(coords(4))],[str2double(coords(1)),str2double(coords(2))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(2)) >= 10 && str2double(coords(4)) >= 10)
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,str2double(coords(2))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[10,str2double(coords(4))],[str2double(coords(1)),str2double(coords(2))],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                        
                elseif (str2double(coords(2)) < 10 && str2double(coords(4)) >= 10)
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                elseif (str2double(coords(4)) < 10 && str2double(coords(2)) >= 10)    
                    areatrab = 1;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 2;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(4))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 3;
                    tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                    
                    areatrab = 4;
                    tarefa = {'Mapeamento',[str2double(coords(3)),str2double(coords(2))],[10,10],areatrab,'_'};
                    lt_opr(id_lt_opr,:) = tarefa;
                    id_lt_opr = id_lt_opr + 1;
                end    
            end    
            
            tarefa = {'Mapeamento',[str2double(coords(1)),str2double(coords(2))],[str2double(coords(3)),str2double(coords(4))],areatrab,'_'};
            disp('Tarefa:');
            disp(tarefa);   
            
        end
        end
    end
    
    
    %%%%%%%%%%%%   LT_OPR =/= {}, MSG_OPR   %%%%%%%%%%%%
    
    %há tarefas na lt_opr, ms_opr ---> br e atualizar br_lt_recebidas
    if(isempty(lt_opr{1,1}) == 0) 
        mensagem_opr(1).ID = id;
        mensagem_opr(1).ListaTarefas = lt_opr;
        br(1).MensagemIn = mensagem_opr;
        
        tam_lt_opr = sum(cellfun('size',lt_opr(:,1),1));
        
        for i=1:1:tam_lt_opr
            br_lt_recebidas(id_lt_brrec,:) = lt_opr(i,:);
            id_lt_brrec = id_lt_brrec + 1;
        end    
        
        id = id + 1;
        lt_opr = cell(12,5);
        id_lt_opr = 1;
        mensagem_opr = mensagem;    
    end    
    
    
    %%%%%%%%%%%%   LT_RECEBIDAS =/= {}, MSG_BR   %%%%%%%%%%%%
    
    %existem tarefas na br_lt_recebidas e vbr_proximo, msg_br ---> vbr
    if(isempty(br_lt_recebidas{1,1}) == 0 && vbr_proximo && prio == 0)
        mensagem_br(1).ID = id;
        mensagem_br(1).ListaTarefas = br_lt_recebidas;
        vbr(1).Mensagem = mensagem_br;
        
        mover_vbr = 1;
        
        tam_br_lt_recebidas = sum(cellfun('size',br_lt_recebidas(:,1),1));
        
        for i=1:1:tam_br_lt_recebidas
            br_lt_enviadas(id_lt_brenv,:) = br_lt_recebidas(i,:);
            id_lt_brenv = id_lt_brenv + 1;
        end    
        
        id = id + 1;
        id_lt_brrec = 1;
        br_lt_recebidas = cell(20,5);
        mensagem_br = mensagem;
    end    
    
    
    %%%%%%%%%%%%   MSG_VBR -> B1   %%%%%%%%%%%%
    
    if(vb1_proximo && msg_vbr)
        b1(1).MensagemIn = vbr.Mensagem;
        vbr(1).Mensagem = mensagem;

        tam_lt_b1 = sum(cellfun('size',b1(1).MensagemIn.ListaTarefas(:,1),1));    
        
        %correr tarefas e guardar em lt_espera ou lt_entrega
        for i=1:1:tam_lt_b1
            if (cell2mat(b1(1).MensagemIn.ListaTarefas(i,4)) == 1)
                b1_lt_espera(id_lt_b1esp,:) = b1(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b1esp = id_lt_b1esp + 1;
            else 
                b1_lt_entrega(id_lt_b1entr,:) = b1(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b1entr = id_lt_b1entr + 1;
            end  
        end
        
        id = id + 1;
        msg_vbr = 0;
        
        %mensagem b1 -------> vm (INIT)
        if init_vm 
            mensagem_m(1).ID = id;
            mensagem_m(1).ListaTarefas = b1_lt_entrega;
            vm(1).MensagemEntrega = mensagem_m;
            
            mover_vm = 1;
            
            init_vm = 0;
            id = id + 1;
            id_lt_b1entr = 1;
            b1_lt_entrega = cell(20,5);
            mensagem_m = mensagem;
        end
    end    
    
    
    %%%%%%%%%%%%   B1_LT_ESPERA =/= {}   %%%%%%%%%%%%
    
    %há tarefas na lt_espera e b1_vproximo, executar tarefa
    if (isempty(b1_lt_espera{1,1}) == 0 && b1_vproximo && msg_v1 == 0)
        mensagem_executar(1).ID = id;
        mensagem_executar(1).ListaTarefas = b1_lt_espera(1,:);
        v1(1).Mensagem = mensagem_executar;
            
        mover_v1 = 1;
            
        tam_b1_lt_esp = sum(cellfun('size',b1_lt_espera(:,1),1));
            
        for i=1:1:tam_b1_lt_esp
            b1_lt_espera(i,:) = b1_lt_espera(i+1,:);
        end    
            
        id_lt_b1esp = id_lt_b1esp - 1;
        id = id + 1;
        mensagem_executar = mensagem;
    end
    
    
    %%%%%%%%%%%%   MSG_V1 -> B1   %%%%%%%%%%%%
   
    if (b1_vproximo && msg_v1)     
        b1_lt_finalizadas(id_lt_b1fin,:) = v1(1).Mensagem.ListaTarefas(1,:);
        id_lt_b1fin = id_lt_b1fin + 1;
        v1(1).Mensagem = mensagem; 
        
        msg_v1 = 0;
    end
    
    
    %%%%%%%%%%%%   MSG_VM -> B1   %%%%%%%%%%%%
    
    if(m_b1_proximo && msg_vm)
        tam_lt_fin = sum(cellfun('size',lt_finalizadas(:,1),1));
            
        for i=1:1:tam_lt_fin
            b1_lt_finalizadas(id_lt_b1fin,:) = lt_finalizadas(i,:);
            id_lt_b1fin = id_lt_b1fin + 1;
        end    

        mensagem_m(1).ID = id;
        mensagem_m(1).ListaTarefas = b1_lt_entrega;
        vm(1).MensagemEntrega = mensagem_m;
            
        mover_vm = 1;

        id = id + 1;
        id_lt_fin = 1;
        id_lt_b1entr = 1;
        lt_finalizadas = cell(20,5);
        b1_lt_entrega = cell(20,5);
        msg_vm = 0;
        mensagem_m = mensagem;
        vm(1).MensagemFinalizadas = mensagem;
    end  
    
    
    %%%%%%%%%%%%   B1_LT_FINALIZADAS =/= {}   %%%%%%%%%%%%
    
    %há tarefas na lt_finalizadas e vb1_proximo, msg_b1 ---> vbr
    if(isempty(b1_lt_finalizadas{1,1}) == 0 && vb1_proximo && m_b1_proximo)
        mensagem_b1(1).ID = id;
        mensagem_b1(1).ListaTarefas = b1_lt_finalizadas;
        vbr(1).Mensagem = mensagem_b1;
        
        mover_vbr = 1;   
        
        prio = 1;
        id = id + 1;
        id_lt_b1fin = 1;
        b1_lt_finalizadas = cell(20,5);
        mensagem_b1 = mensagem;
    end    
    
    
    %%%%%%%%%%%%   MSG_VBR -> BR   %%%%%%%%%%%%
   
    if (vbr_proximo && msg_vbr)
        tam_lt_concluidas = sum(cellfun('size',vbr(1).Mensagem.ListaTarefas(:,1),1));
        
        for i=1:1:tam_lt_concluidas
            tam_lt_enviadas = sum(cellfun('size',br_lt_enviadas(:,1),1));
            
            for c=1:1:tam_lt_enviadas
                if (cellfun(@isequal,vbr(1).Mensagem.ListaTarefas(i,:),br_lt_enviadas(c,:)))
                    br_lt_enviadas(c,:) = br_lt_enviadas(c+1,:);
                    id_lt_brenv = id_lt_brenv - 1;
                    a = 1;
                end    
                if a == 1    
                    br_lt_enviadas(c,:) = br_lt_enviadas(c+1,:);
                end
            end
            
            br_lt_concluidas(id_lt_brfin,:) = vbr(1).Mensagem.ListaTarefas(i,:);
            id_lt_brfin = id_lt_brfin + 1;
            a = 0;
        end 
        
        prio = 0;
        msg_vbr = 0;
    end    
    
    
    %%%%%%%%%%%%   MSG_VM -> B2   %%%%%%%%%%%%
    
    if(m_b2_proximo && msg_vm)
        b2(1).MensagemIn = vm.MensagemEntrega;
        vm.MensagemEntrega = mensagem;

        tam_lt_b2 = sum(cellfun('size',b2(1).MensagemIn.ListaTarefas(:,1),1));    
        
        %correr tarefas e guardar em lt_espera ou lt_entrega
        for i=1:1:tam_lt_b2
            if (cell2mat(b2(1).MensagemIn.ListaTarefas(i,4)) == 2)
                b2_lt_espera(id_lt_b2esp,:) = b2(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b2esp = id_lt_b2esp + 1;
            else 
                b2_lt_entrega(id_lt_b2entr,:) = b2(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b2entr = id_lt_b2entr + 1;
            end    
        end    
       
        mensagem_m(1).ID = id;
        mensagem_m(1).ListaTarefas = b2_lt_entrega;
        vm(1).MensagemEntrega = mensagem_m;
            
        id = id + 1;
        tam_b2_lt_fin = sum(cellfun('size',b2_lt_finalizadas(:,1),1));
            
        for i=1:1:tam_b2_lt_fin
            lt_finalizadas(id_lt_fin,:) = b2_lt_finalizadas(i,:);
            id_lt_fin = id_lt_fin + 1;
        end  
        
        mensagem_b2(1).ID = id;
        mensagem_b2(1).ListaTarefas = lt_finalizadas;
        vm(1).MensagemFinalizadas = mensagem_b2;
        
        mover_vm = 1;
            
        id = id + 1;
        msg_vm = 0;
        id_lt_b2fin = 1;
        b2_lt_finalizadas = cell(20,5);
        id_lt_b2entr = 1;
        b2_lt_entrega = cell(20,5);
        mensagem_m = mensagem;
        mensagem_b2 = mensagem;
    end    
    
    
    %%%%%%%%%%%%   B2_LT_ESPERA =/= {}   %%%%%%%%%%%%
    
    %há tarefas na lt_espera e b2_vproximo, executar tarefa
        if (isempty(b2_lt_espera{1,1}) == 0 && b2_vproximo && msg_v2 == 0)
            mensagem_executar(1).ID = id;
            mensagem_executar(1).ListaTarefas = b2_lt_espera(1,:);
            v2(1).Mensagem = mensagem_executar;
            
            mover_v2 = 1;
            
            tam_b2_lt_esp = sum(cellfun('size',b2_lt_espera(:,1),1));
            
            for i=1:1:tam_b2_lt_esp
                b2_lt_espera(i,:) = b2_lt_espera(i+1,:);
            end    
            
            id_lt_b2esp = id_lt_b2esp - 1;
            id = id + 1;
            mensagem_executar = mensagem;
        end    

        
    %%%%%%%%%%%%   MSG_V2 -> B2   %%%%%%%%%%%%    
    
    if (b2_vproximo && msg_v2)     
        b2_lt_finalizadas(id_lt_b2fin,:) = v2(1).Mensagem.ListaTarefas(1,:);
        id_lt_b2fin = id_lt_b2fin + 1;
        v2(1).Mensagem = mensagem; 
  
        msg_v2 = 0;
    end
    
    
    %%%%%%%%%%%%   MSG_VM -> B3   %%%%%%%%%%%%
    
    if(m_b3_proximo && msg_vm)
        b3(1).MensagemIn = vm.MensagemEntrega;
        vm.MensagemEntrega = mensagem;

        tam_lt_b3 = sum(cellfun('size',b3(1).MensagemIn.ListaTarefas(:,1),1));    
        
        %correr tarefas e guardar em lt_espera ou lt_entrega
        for i=1:1:tam_lt_b3
            if (cell2mat(b3(1).MensagemIn.ListaTarefas(i,4)) == 3)
                b3_lt_espera(id_lt_b3esp,:) = b3(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b3esp = id_lt_b3esp + 1;
            else 
                b3_lt_entrega(id_lt_b3entr,:) = b3(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b3entr = id_lt_b3entr + 1;
            end    
        end    
       
        mensagem_m(1).ID = id;
        mensagem_m(1).ListaTarefas = b3_lt_entrega;
        vm(1).MensagemEntrega = mensagem_m;
            
        id = id + 1;
        tam_b3_lt_fin = sum(cellfun('size',b3_lt_finalizadas(:,1),1));
            
        for i=1:1:tam_b3_lt_fin
            lt_finalizadas(id_lt_fin,:) = b3_lt_finalizadas(i,:);
            id_lt_fin = id_lt_fin + 1;
        end  
        
        mensagem_b3(1).ID = id;
        mensagem_b3(1).ListaTarefas = lt_finalizadas;
        vm(1).MensagemFinalizadas = mensagem_b3;
        
        mover_vm = 1;
            
        id = id + 1;
        msg_vm = 0;
        id_lt_b3fin = 1;
        b3_lt_finalizadas = cell(20,5);
        id_lt_b3entr = 1;
        b3_lt_entrega = cell(20,5);
        mensagem_m = mensagem;
        mensagem_b3 = mensagem;
    end    
    
    
    %%%%%%%%%%%%   B3_LT_ESPERA =/= {}   %%%%%%%%%%%%
    
    %há tarefas na lt_espera e b3_vproximo, executar tarefa
        if (isempty(b3_lt_espera{1,1}) == 0 && b3_vproximo && msg_v3 == 0)
            mensagem_executar(1).ID = id;
            mensagem_executar(1).ListaTarefas = b3_lt_espera(1,:);
            v3(1).Mensagem = mensagem_executar;
            
            mover_v3 = 1;
            
            tam_b3_lt_esp = sum(cellfun('size',b3_lt_espera(:,1),1));
            
            for i=1:1:tam_b3_lt_esp
                b3_lt_espera(i,:) = b3_lt_espera(i+1,:);
            end    
            
            id_lt_b3esp = id_lt_b3esp - 1;
            id = id + 1;
            mensagem_executar = mensagem;
        end
        
        
    %%%%%%%%%%%%   MSG_V3 -> B3   %%%%%%%%%%%%    
    
    if (b3_vproximo && msg_v3)     
        b3_lt_finalizadas(id_lt_b3fin,:) = v3(1).Mensagem.ListaTarefas(1,:);
        id_lt_b3fin = id_lt_b3fin + 1;
        v3(1).Mensagem = mensagem; 
        
        msg_v3 = 0;
    end    
    
    
    %%%%%%%%%%%%   MSG_VM -> B4   %%%%%%%%%%%%
    
    if(m_b4_proximo && msg_vm)
        b4(1).MensagemIn = vm.MensagemEntrega;
        vm.MensagemEntrega = mensagem;

        tam_lt_b4 = sum(cellfun('size',b4(1).MensagemIn.ListaTarefas(:,1),1));    
        
        %correr tarefas e guardar em lt_espera ou lt_entrega
        for i=1:1:tam_lt_b4
            if (cell2mat(b4(1).MensagemIn.ListaTarefas(i,4)) == 4)
                b4_lt_espera(id_lt_b4esp,:) = b4(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b4esp = id_lt_b4esp + 1;
            else 
                b4_lt_entrega(id_lt_b4entr,:) = b4(1).MensagemIn.ListaTarefas(i,:);
                id_lt_b4entr = id_lt_b4entr + 1;
            end    
        end    
       
        mensagem_m(1).ID = id;
        mensagem_m(1).ListaTarefas = b4_lt_entrega;
        vm(1).MensagemEntrega = mensagem_m;
            
        id = id + 1;
        tam_b4_lt_fin = sum(cellfun('size',b4_lt_finalizadas(:,1),1));
            
        for i=1:1:tam_b4_lt_fin
            lt_finalizadas(id_lt_fin,:) = b4_lt_finalizadas(i,:);
            id_lt_fin = id_lt_fin + 1;
        end  
        
        mensagem_b4(1).ID = id;
        mensagem_b4(1).ListaTarefas = lt_finalizadas;
        vm(1).MensagemFinalizadas = mensagem_b4;
        
        mover_vm = 1;
            
        id = id + 1;
        msg_vm = 0;
        id_lt_b4fin = 1;
        b4_lt_finalizadas = cell(20,5);
        id_lt_b4entr = 1;
        b4_lt_entrega = cell(20,5);
        mensagem_m = mensagem;
        mensagem_b4 = mensagem;
    end    
    
    
    %%%%%%%%%%%%   B4_LT_ESPERA =/= {}   %%%%%%%%%%%%
    
    %há tarefas na lt_espera e b4_vproximo, executar tarefa
        if (isempty(b4_lt_espera{1,1}) == 0 && b4_vproximo && msg_v4 == 0)
            mensagem_executar(1).ID = id;
            mensagem_executar(1).ListaTarefas = b4_lt_espera(1,:);
            v4(1).Mensagem = mensagem_executar;
            
            mover_v4 = 1;
            
            tam_b4_lt_esp = sum(cellfun('size',b4_lt_espera(:,1),1));
            
            for i=1:1:tam_b4_lt_esp
                b4_lt_espera(i,:) = b4_lt_espera(i+1,:);
            end    
            
            id_lt_b4esp = id_lt_b4esp - 1;
            id = id + 1;
            mensagem_executar = mensagem;
        end
        
        
    %%%%%%%%%%%%   MSG_V4 -> B4   %%%%%%%%%%%%    
        
    if (b4_vproximo && msg_v4)     
        b4_lt_finalizadas(id_lt_b4fin,:) = v4(1).Mensagem.ListaTarefas(1,:);
        id_lt_b4fin = id_lt_b4fin + 1;
        v4(1).Mensagem = mensagem; 
        
        msg_v4 = 0;
    end         
       
    
    %%%%%%%%%%%%      %%%%%%%%%%%%
    
    timer = timer + 1;
        
    if timer > 3999
        timer = 0;
    end
    
    if mover == 0
        pause(0.01);  
    end    
    
    
%__________________________ATUALIZAR POSIÇÕES_____________________________%    
   
 
    %%%%%%%%%%%%   MOVER   %%%%%%%%%%%%
   
    mover = mover_vbr || mover_vm || mover_v1 || mover_v2 || mover_v3 || mover_v4; 
    
    if mover
        
        
        %%%%%%%%%%%%   VBR   %%%%%%%%%%%%
        
        if mover_vbr
            %definir destino e trajetória 
            %br ---> b1
            if (vbr(1).Base == "br" && init_mov_vbr) 
                x2_vbr = 6;
                y2_vbr = 5.4;
                nb_vbr = 'b1';
            
                xvec_vbr = (x2_vbr-x_vbr)/sqrt((x2_vbr-x_vbr)^2+(y2_vbr-y_vbr)^2);
                yvec_vbr = (y2_vbr-y_vbr)/sqrt((x2_vbr-x_vbr)^2+(y2_vbr-y_vbr)^2);
                
                init_mov_vbr = 0;
                vbr_proximo = 0;
            
            %b1 ---> br    
            elseif (vbr(1).Base == "b1" && init_mov_vbr)
                x2_vbr = 0.6;
                y2_vbr = 0;
                nb_vbr = 'br';
            
                xvec_vbr = (x2_vbr-x_vbr)/sqrt((x2_vbr-x_vbr)^2+(y2_vbr-y_vbr)^2);
                yvec_vbr = (y2_vbr-y_vbr)/sqrt((x2_vbr-x_vbr)^2+(y2_vbr-y_vbr)^2);
                
                init_mov_vbr = 0;
                vb1_proximo = 0;
            end
        
            %atualizar posição
            x_vbr = x_vbr + (xvec_vbr*v);
            y_vbr = y_vbr + (yvec_vbr*v);
        
            x_vbrR = round(x_vbr,1);
            y_vbrR = round(y_vbr,1);
    
            set(vbrsim.Sim,'XData',x_vbrR,'YData',y_vbrR);
        
            vbr(1).X = x_vbrR;
            vbr(1).Y = y_vbrR;  
        
            %terminar viagem
            if (x_vbrR == x2_vbr && y_vbrR == y2_vbr)
                mover_vbr = 0;
                init_mov_vbr = 1;
                msg_vbr = 1;
                vbr(1).Base = nb_vbr;
                
                if vbr(1).Base == "b1"
                    vb1_proximo = 1;
                elseif vbr(1).Base == "br"
                    vbr_proximo = 1;
                end    
            end  
        end  
        
        
        %%%%%%%%%%%%   MENSAGEIRO   %%%%%%%%%%%%
        
        if mover_vm
            %definir destino e trajetória 
            %b1 ---> b2
            if (vm(1).Base == "b1" && init_mov_vm) 
                x2_vm = 15;
                y2_vm = 5.6;
                nb_vm = 'b2';
            
                xvec_vm = (x2_vm-x_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                yvec_vm = (y2_vm-y_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                
                init_mov_vm = 0;
                m_b1_proximo = 0;
            
            %b2 ---> b3    
            elseif (vm(1).Base == "b2" && init_mov_vm) 
                x2_vm = 14;
                y2_vm = 15.4;
                nb_vm = 'b3';
            
                xvec_vm = (x2_vm-x_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                yvec_vm = (y2_vm-y_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                
                init_mov_vm = 0;
                m_b2_proximo = 0;
                
            %b3 ---> b4    
            elseif (vm(1).Base == "b3" && init_mov_vm) 
                x2_vm = 4;
                y2_vm = 12.4;
                nb_vm = 'b4';
            
                xvec_vm = (x2_vm-x_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                yvec_vm = (y2_vm-y_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                
                init_mov_vm = 0;
                m_b3_proximo = 0;
                
            %b4 ---> b1    
            elseif (vm(1).Base == "b4" && init_mov_vm) 
                x2_vm = 6;
                y2_vm = 6.6;
                nb_vm = 'b1';
            
                xvec_vm = (x2_vm-x_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                yvec_vm = (y2_vm-y_vm)/sqrt((x2_vm-x_vm)^2+(y2_vm-y_vm)^2);
                
                init_mov_vm = 0;   
                m_b4_proximo = 0;    
            end
        
            %atualizar posição
            x_vm = x_vm + (xvec_vm*v);
            y_vm = y_vm + (yvec_vm*v);
        
            x_vmR = round(x_vm,1);
            y_vmR = round(y_vm,1);
    
            set(vmsim.Sim,'XData',x_vmR,'YData',y_vmR);
        
            vm(1).X = x_vmR;
            vm(1).Y = y_vmR;  
        
            %terminar viagem
            if (x_vmR == x2_vm && y_vmR == y2_vm)
                mover_vm = 0;
                init_mov_vm = 1;
                msg_vm = 1;
                vm(1).Base = nb_vm;
                
                if vm(1).Base == "b1"
                    m_b1_proximo = 1;
                elseif vm(1).Base == "b2"
                    m_b2_proximo = 1;
                elseif vm(1).Base == "b3"
                    m_b3_proximo = 1;
                elseif vm(1).Base == "b4"
                    m_b4_proximo = 1;  
                end    
            end  
        end
        
        
        %%%%%%%%%%%%   V1   %%%%%%%%%%%%
        
        if mover_v1
            %executar tarefa
            %RECONHECIMENTO INIT----------------------
            if (cell2mat(v1(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento" && init_mov_v1) 
                if b1_vproximo
                x2_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,2));
                y2_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,3));
                v1_executar = 1;
                else 
                x2_v1 = 6.6;
                y2_v1 = 6;
                end    
            
                xvec_v1 = (x2_v1-x_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                yvec_v1 = (y2_v1-y_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                
                init_mov_v1 = 0;
                b1_vproximo = 0;
            end    
                
            %PATRULHA INIT------------------------    
            if (v1(1).Mensagem.ListaTarefas(1,1) == "Patrulha" && init_mov_v1) 
                if b1_vproximo || v1_executar == 1
                x2_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,2)) - 0.5;
                y2_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,3)) - 0.5;
                v1_executar = 1;
                elseif v1_executar == 2
                x2_v1 = x2_v1 + 1;
                elseif v1_executar == 3
                y2_v1 = y2_v1 + 1;
                elseif v1_executar == 4
                x2_v1 = x2_v1 - 1;
                end    
            
                xvec_v1 = (x2_v1-x_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                yvec_v1 = (y2_v1-y_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                
                init_mov_v1 = 0;
                b1_vproximo = 0;
            end    
                
            %MAPEAMENTO INIT----------------------
            if (v1(1).Mensagem.ListaTarefas(1,1) == "Mapeamento" && init_mov_v1) 
                if b1_vproximo 
                p1_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,2));
                p2_v1 = cell2mat(v1(1).Mensagem.ListaTarefas(1,3));
                x2_v1 = p1_v1(1);
                y2_v1 = p1_v1(2);
                v1_executar = 1;
                elseif v1_executar == 2
                y2_v1 = p2_v1(2);
                elseif v1_executar == 3
                    if p2_v1(1) > p1_v1(1) 
                x2_v1 = x2_v1 + 1;
                    else
                x2_v1 = x2_v1 - 1;        
                    end    
                elseif v1_executar == 4
                y2_v1 = p1_v1(2);
                elseif v1_executar == 5
                    if p2_v1(1) > p1_v1(1) 
                x2_v1 = x2_v1 + 1;
                    else
                x2_v1 = x2_v1 - 1;        
                    end
                elseif v1_executar == 6
                x2_v1 = 6.6;
                y2_v1 = 6;    
                end    
            
                if b1_vproximo || v1_executar == 3 || v1_executar == 5 || v1_executar == 6
                xvec_v1 = (x2_v1-x_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                else
                xvec_v1 = 0;    
                end
                
                if b1_vproximo || v1_executar == 2 || v1_executar == 4 || v1_executar == 6
                yvec_v1 = (y2_v1-y_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                else
                yvec_v1 = 0;    
                end
                
                init_mov_v1 = 0;
                b1_vproximo = 0;
            end    
            
            %RECONHECIMENTO---------------------------
            if (cell2mat(v1(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento")
                if stop_v1 == 0
                    %atualizar posição
                    x_v1 = x_v1 + (xvec_v1*v);
                    y_v1 = y_v1 + (yvec_v1*v);
        
                    x_v1R = round(x_v1,1);
                    y_v1R = round(y_v1,1);
    
                    set(v1sim.Sim,'XData',x_v1R,'YData',y_v1R);
        
                    v1(1).X = x_v1R;
                    v1(1).Y = y_v1R; 
                
                    if hold_v1 == 300
                        hold_v1 = hold_v1 + 1;
                    end
                
                else
                    hold_v1 = hold_v1 + 1; 
                
                    if hold_v1 == 300
                        stop_v1 = 0;
                    end   
                end
        
                %terminar viagem
                if (x_v1R == x2_v1 && y_v1R == y2_v1)
                    %realocar destino
                    if v1_executar == 1
                        v1_executar = 0;    
                        init_mov_v1 = 1;
                        stop_v1 = 1;   
                
                    %chegou à base
                    elseif hold_v1 == 301     
                        mover_v1 = 0;
                        b1_vproximo = 1;
                        init_mov_v1 = 1;
                        hold_v1 = 0;
                        msg_v1 = 1;
                    end
                end 
            end  
        
            %PATRULHA--------------------------------
            if (cell2mat(v1(1).Mensagem.ListaTarefas(1,1)) == "Patrulha")
                %atualizar posição
                x_v1 = x_v1 + (xvec_v1*v);
                y_v1 = y_v1 + (yvec_v1*v);
        
                x_v1R = round(x_v1,1);
                y_v1R = round(y_v1,1);
    
                set(v1sim.Sim,'XData',x_v1R,'YData',y_v1R);
        
                v1(1).X = x_v1R;
                v1(1).Y = y_v1R; 
                
                hold_v1 = hold_v1 + 0.01;    
             
                %ainda não passou o tempo da patrulha
                if hold_v1 < (cell2mat(v1(1).Mensagem.ListaTarefas(1,5)))
                    %realocar destino
                    if (x_v1R == x2_v1 && y_v1R == y2_v1)
                        if v1_executar == 4
                            v1_executar = 1;
                        else
                            v1_executar = v1_executar + 1;
                        end
                        
                        init_mov_v1 = 1;
                    end    
                    
                %passou tempo, manda regressar à base
                else  
                    if init_return_v1
                        x2_v1 = 6.6;
                        y2_v1 = 6;  
                        xvec_v1 = (x2_v1-x_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                        yvec_v1 = (y2_v1-y_v1)/sqrt((x2_v1-x_v1)^2+(y2_v1-y_v1)^2);
                        init_return_v1 = 0;
                    end
                    
                    if (x_v1R == x2_v1 && y_v1R == y2_v1)
                        mover_v1 = 0;
                        b1_vproximo = 1;
                        init_mov_v1 = 1;
                        init_return_v1 = 1;
                        hold_v1 = 0;
                        msg_v1 = 1;
                    end
                end 
            end   
        
        
            %MAPEAMENTO--------------------------------
            if (cell2mat(v1(1).Mensagem.ListaTarefas(1,1)) == "Mapeamento")
                %atualizar posição
                x_v1 = x_v1 + (xvec_v1*v);
                y_v1 = y_v1 + (yvec_v1*v);
        
                x_v1R = round(x_v1,1);
                y_v1R = round(y_v1,1);
    
                set(v1sim.Sim,'XData',x_v1R,'YData',y_v1R);
        
                v1(1).X = x_v1R;
                v1(1).Y = y_v1R;     
             
                %terminar viagem
                if (x_v1R == x2_v1 && y_v1R == y2_v1)
                    %acabou de mapear
                    if (x_v1R == p2_v1(1) && y_v1R == p2_v1(2))
                        v1_executar = 6;
                        init_mov_v1 = 1;
                    %chegou à base    
                    elseif (x_v1R == 6.6 && y_v1R == 6)
                        mover_v1 = 0;
                        v1_executar = 0;
                        b1_vproximo = 1;
                        init_mov_v1 = 1;
                        msg_v1 = 1;
                    %realocar destino
                    else    
                        if v1_executar == 5
                            v1_executar = 2;
                        else
                            v1_executar = v1_executar + 1;
                        end
                        
                        init_mov_v1 = 1;
                    end
                end 
            end   
        end  
        
        
        %%%%%%%%%%%%   V2   %%%%%%%%%%%%
        
        if mover_v2
            %executar tarefa
            %RECONHECIMENTO INIT----------------------
            if (cell2mat(v2(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento" && init_mov_v2) 
                if b2_vproximo
                x2_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,2));
                y2_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,3));
                v2_executar = 1;
                else 
                x2_v2 = 15.6;
                y2_v2 = 5;
                end    
            
                xvec_v2 = (x2_v2-x_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                yvec_v2 = (y2_v2-y_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                
                init_mov_v2 = 0;
                b2_vproximo = 0;
            end    
                
            %PATRULHA INIT------------------------    
            if (v2(1).Mensagem.ListaTarefas(1,1) == "Patrulha" && init_mov_v2) 
                if b2_vproximo || v2_executar == 1
                x2_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,2)) - 0.5;
                y2_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,3)) - 0.5;
                v2_executar = 1;
                elseif v2_executar == 2
                x2_v2 = x2_v2 + 1;
                elseif v2_executar == 3
                y2_v2 = y2_v2 + 1;
                elseif v2_executar == 4
                x2_v2 = x2_v2 - 1;
                end    
            
                xvec_v2 = (x2_v2-x_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                yvec_v2 = (y2_v2-y_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                
                init_mov_v2 = 0;
                b2_vproximo = 0;
            end    
                
            %MAPEAMENTO INIT----------------------
            if (v2(1).Mensagem.ListaTarefas(1,1) == "Mapeamento" && init_mov_v2) 
                if b2_vproximo 
                p1_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,2));
                p2_v2 = cell2mat(v2(1).Mensagem.ListaTarefas(1,3));
                x2_v2 = p1_v2(1);
                y2_v2 = p1_v2(2);
                v2_executar = 1;
                elseif v2_executar == 2
                y2_v2 = p2_v2(2);
                elseif v2_executar == 3
                    if p2_v2(1) > p1_v2(1) 
                x2_v2 = x2_v2 + 1;
                    else
                x2_v2 = x2_v2 - 1;        
                    end    
                elseif v2_executar == 4
                y2_v2 = p1_v2(2);
                elseif v2_executar == 5
                    if p2_v2(1) > p1_v2(1) 
                x2_v2 = x2_v2 + 1;
                    else
                x2_v2 = x2_v2 - 1;        
                    end    
                elseif v2_executar == 6
                x2_v2 = 15.6;
                y2_v2 = 5;    
                end    
            
                if b2_vproximo || v2_executar == 3 || v2_executar == 5 || v2_executar == 6
                xvec_v2 = (x2_v2-x_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                else
                xvec_v2 = 0;    
                end
                
                if b2_vproximo || v2_executar == 2 || v2_executar == 4 || v2_executar == 6
                yvec_v2 = (y2_v2-y_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                else
                yvec_v2 = 0;    
                end
                
                init_mov_v2 = 0;
                b2_vproximo = 0;
            end    
            
            %RECONHECIMENTO---------------------------
            if (cell2mat(v2(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento")
                if stop_v2 == 0
                    %atualizar posição
                    x_v2 = x_v2 + (xvec_v2*v);
                    y_v2 = y_v2 + (yvec_v2*v);
        
                    x_v2R = round(x_v2,1);
                    y_v2R = round(y_v2,1);
    
                    set(v2sim.Sim,'XData',x_v2R,'YData',y_v2R);
        
                    v2(1).X = x_v2R;
                    v2(1).Y = y_v2R; 
                
                    if hold_v2 == 300
                        hold_v2 = hold_v2 + 1;
                    end
                
                else
                    hold_v2 = hold_v2 + 1; 
                
                    if hold_v2 == 300
                        stop_v2 = 0;
                    end   
                end
        
                %terminar viagem
                if (x_v2R == x2_v2 && y_v2R == y2_v2)
                    %realocar destino
                    if v2_executar == 1
                        v2_executar = 0;    
                        init_mov_v2 = 1;
                        stop_v2 = 1;   
                
                    %chegou à base
                    elseif hold_v2 == 301     
                        mover_v2 = 0;
                        b2_vproximo = 1;
                        init_mov_v2 = 1;
                        hold_v2 = 0;
                        msg_v2 = 1;
                    end
                end 
            end  
        
            %PATRULHA--------------------------------
            if (cell2mat(v2(1).Mensagem.ListaTarefas(1,1)) == "Patrulha")
                %atualizar posição
                x_v2 = x_v2 + (xvec_v2*v);
                y_v2 = y_v2 + (yvec_v2*v);
        
                x_v2R = round(x_v2,1);
                y_v2R = round(y_v2,1);
    
                set(v2sim.Sim,'XData',x_v2R,'YData',y_v2R);
        
                v2(1).X = x_v2R;
                v2(1).Y = y_v2R; 
                
                hold_v2 = hold_v2 + 0.01;    
             
                %ainda não passou o tempo da patrulha
                if hold_v2 < (cell2mat(v2(1).Mensagem.ListaTarefas(1,5)))
                    %realocar destino
                    if (x_v2R == x2_v2 && y_v2R == y2_v2)
                        if v2_executar == 4
                            v2_executar = 1;
                        else
                            v2_executar = v2_executar + 1;
                        end
                        
                        init_mov_v2 = 1;
                    end    
                    
                %passou tempo, manda regressar à base
                else  
                    if init_return_v2
                        x2_v2 = 15.6;
                        y2_v2 = 5;  
                        xvec_v2 = (x2_v2-x_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                        yvec_v2 = (y2_v2-y_v2)/sqrt((x2_v2-x_v2)^2+(y2_v2-y_v2)^2);
                        init_return_v2 = 0;
                    end
                    
                    if (x_v2R == x2_v2 && y_v2R == y2_v2)
                        mover_v2 = 0;
                        b2_vproximo = 1;
                        init_mov_v2 = 1;
                        init_return_v2 = 1;
                        hold_v2 = 0;
                        msg_v2 = 1;
                    end
                end 
            end   
        
        
            %MAPEAMENTO--------------------------------
            if (cell2mat(v2(1).Mensagem.ListaTarefas(1,1)) == "Mapeamento")
                %atualizar posição
                x_v2 = x_v2 + (xvec_v2*v);
                y_v2 = y_v2 + (yvec_v2*v);
        
                x_v2R = round(x_v2,1);
                y_v2R = round(y_v2,1);
    
                set(v2sim.Sim,'XData',x_v2R,'YData',y_v2R);
        
                v2(1).X = x_v2R;
                v2(1).Y = y_v2R;     
             
                %terminar viagem
                if (x_v2R == x2_v2 && y_v2R == y2_v2)
                    %acabou de mapear
                    if (x_v2R == p2_v2(1) && y_v2R == p2_v2(2))
                        v2_executar = 6;
                        init_mov_v2 = 1;
                    %chegou à base    
                    elseif (x_v2R == 15.6 && y_v2R == 5)
                        mover_v2 = 0;
                        v2_executar = 0;
                        b2_vproximo = 1;
                        init_mov_v2 = 1;
                        msg_v2 = 1;
                    %realocar destino
                    else    
                        if v2_executar == 5
                            v2_executar = 2;
                        else
                            v2_executar = v2_executar + 1;
                        end
                        
                        init_mov_v2 = 1;
                    end
                end 
            end   
        end
        
        
        %%%%%%%%%%%%   V3   %%%%%%%%%%%%
        
        if mover_v3
            %executar tarefa
            %RECONHECIMENTO INIT----------------------
            if (cell2mat(v3(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento" && init_mov_v3) 
                if b3_vproximo
                x2_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,2));
                y2_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,3));
                v3_executar = 1;
                else 
                x2_v3 = 14.6;
                y2_v3 = 16;
                end    
            
                xvec_v3 = (x2_v3-x_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                yvec_v3 = (y2_v3-y_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                
                init_mov_v3 = 0;
                b3_vproximo = 0;
            end    
                
            %PATRULHA INIT------------------------    
            if (v3(1).Mensagem.ListaTarefas(1,1) == "Patrulha" && init_mov_v3) 
                if b3_vproximo || v3_executar == 1
                x2_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,2)) - 0.5;
                y2_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,3)) - 0.5;
                v3_executar = 1;
                elseif v3_executar == 2
                x2_v3 = x2_v3 + 1;
                elseif v3_executar == 3
                y2_v3 = y2_v3 + 1;
                elseif v3_executar == 4
                x2_v3 = x2_v3 - 1;
                end    
            
                xvec_v3 = (x2_v3-x_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                yvec_v3 = (y2_v3-y_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                
                init_mov_v3 = 0;
                b3_vproximo = 0;
            end    
                
            %MAPEAMENTO INIT----------------------
            if (v3(1).Mensagem.ListaTarefas(1,1) == "Mapeamento" && init_mov_v3) 
                if b3_vproximo 
                p1_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,2));
                p2_v3 = cell2mat(v3(1).Mensagem.ListaTarefas(1,3));
                x2_v3 = p1_v3(1);
                y2_v3 = p1_v3(2);
                v3_executar = 1;
                elseif v3_executar == 2
                y2_v3 = p2_v3(2);
                elseif v3_executar == 3
                    if p2_v3(1) > p1_v3(1) 
                x2_v3 = x2_v3 + 1;
                    else
                x2_v3 = x2_v3 - 1;        
                    end    
                elseif v3_executar == 4
                y2_v3 = p1_v3(2);
                elseif v3_executar == 5
                    if p2_v3(1) > p1_v3(1) 
                x2_v3 = x2_v3 + 1;
                    else
                x2_v3 = x2_v3 - 1;        
                    end    
                elseif v3_executar == 6
                x2_v3 = 14.6;
                y2_v3 = 16;    
                end    
            
                if b3_vproximo || v3_executar == 3 || v3_executar == 5 || v3_executar == 6
                xvec_v3 = (x2_v3-x_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                else
                xvec_v3 = 0;    
                end
                
                if b3_vproximo || v3_executar == 2 || v3_executar == 4 || v3_executar == 6
                yvec_v3 = (y2_v3-y_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                else
                yvec_v3 = 0;    
                end
                
                init_mov_v3 = 0;
                b3_vproximo = 0;
            end    
            
            %RECONHECIMENTO---------------------------
            if (cell2mat(v3(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento")
                if stop_v3 == 0
                    %atualizar posição
                    x_v3 = x_v3 + (xvec_v3*v);
                    y_v3 = y_v3 + (yvec_v3*v);
        
                    x_v3R = round(x_v3,1);
                    y_v3R = round(y_v3,1);
    
                    set(v3sim.Sim,'XData',x_v3R,'YData',y_v3R);
        
                    v3(1).X = x_v3R;
                    v3(1).Y = y_v3R; 
                
                    if hold_v3 == 300
                        hold_v3 = hold_v3 + 1;
                    end
                
                else
                    hold_v3 = hold_v3 + 1; 
                
                    if hold_v3 == 300
                        stop_v3 = 0;
                    end   
                end
        
                %terminar viagem
                if (x_v3R == x2_v3 && y_v3R == y2_v3)
                    %realocar destino
                    if v3_executar == 1
                        v3_executar = 0;    
                        init_mov_v3 = 1;
                        stop_v3 = 1;   
                
                    %chegou à base
                    elseif hold_v3 == 301     
                        mover_v3 = 0;
                        b3_vproximo = 1;
                        init_mov_v3 = 1;
                        hold_v3 = 0;
                        msg_v3 = 1;
                    end
                end 
            end  
        
            %PATRULHA--------------------------------
            if (cell2mat(v3(1).Mensagem.ListaTarefas(1,1)) == "Patrulha")
                %atualizar posição
                x_v3 = x_v3 + (xvec_v3*v);
                y_v3 = y_v3 + (yvec_v3*v);
        
                x_v3R = round(x_v3,1);
                y_v3R = round(y_v3,1);
    
                set(v3sim.Sim,'XData',x_v3R,'YData',y_v3R);
        
                v3(1).X = x_v3R;
                v3(1).Y = y_v3R; 
                
                hold_v3 = hold_v3 + 0.01;    
             
                %ainda não passou o tempo da patrulha
                if hold_v3 < (cell2mat(v3(1).Mensagem.ListaTarefas(1,5)))
                    %realocar destino
                    if (x_v3R == x2_v3 && y_v3R == y2_v3)
                        if v3_executar == 4
                            v3_executar = 1;
                        else
                            v3_executar = v3_executar + 1;
                        end
                        
                        init_mov_v3 = 1;
                    end    
                    
                %passou tempo, manda regressar à base
                else  
                    if init_return_v3
                        x2_v3 = 14.6;
                        y2_v3 = 16;  
                        xvec_v3 = (x2_v3-x_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                        yvec_v3 = (y2_v3-y_v3)/sqrt((x2_v3-x_v3)^2+(y2_v3-y_v3)^2);
                        init_return_v3 = 0;
                    end
                    
                    if (x_v3R == x2_v3 && y_v3R == y2_v3)
                        mover_v3 = 0;
                        b3_vproximo = 1;
                        init_mov_v3 = 1;
                        init_return_v3 = 1;
                        hold_v3 = 0;
                        msg_v3 = 1;
                    end
                end 
            end   
        
        
            %MAPEAMENTO--------------------------------
            if (cell2mat(v3(1).Mensagem.ListaTarefas(1,1)) == "Mapeamento")
                %atualizar posição
                x_v3 = x_v3 + (xvec_v3*v);
                y_v3 = y_v3 + (yvec_v3*v);
        
                x_v3R = round(x_v3,1);
                y_v3R = round(y_v3,1);
    
                set(v3sim.Sim,'XData',x_v3R,'YData',y_v3R);
        
                v3(1).X = x_v3R;
                v3(1).Y = y_v3R;     
             
                %terminar viagem
                if (x_v3R == x2_v3 && y_v3R == y2_v3)
                    %acabou de mapear
                    if (x_v3R == p2_v3(1) && y_v3R == p2_v3(2))
                        v3_executar = 6;
                        init_mov_v3 = 1;
                    %chegou à base    
                    elseif (x_v3R == 14.6 && y_v3R == 16)
                        mover_v3 = 0;
                        v3_executar = 0;
                        b3_vproximo = 1;
                        init_mov_v3 = 1;
                        msg_v3 = 1;
                    %realocar destino
                    else    
                        if v3_executar == 5
                            v3_executar = 2;
                        else
                            v3_executar = v3_executar + 1;
                        end
                        
                        init_mov_v3 = 1;
                    end
                end 
            end   
        end    
        
        
        %%%%%%%%%%%%   V4   %%%%%%%%%%%%
        
        if mover_v4
            %executar tarefa
            %RECONHECIMENTO INIT----------------------
            if (cell2mat(v4(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento" && init_mov_v4) 
                if b4_vproximo
                x2_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,2));
                y2_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,3));
                v4_executar = 1;
                else 
                x2_v4 = 4.6;
                y2_v4 = 13;
                end    
            
                xvec_v4 = (x2_v4-x_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                yvec_v4 = (y2_v4-y_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                
                init_mov_v4 = 0;
                b4_vproximo = 0;
            end    
                
            %PATRULHA INIT------------------------    
            if (v4(1).Mensagem.ListaTarefas(1,1) == "Patrulha" && init_mov_v4) 
                if b4_vproximo || v4_executar == 1
                x2_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,2)) - 0.5;
                y2_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,3)) - 0.5;
                v4_executar = 1;
                elseif v4_executar == 2
                x2_v4 = x2_v4 + 1;
                elseif v4_executar == 3
                y2_v4 = y2_v4 + 1;
                elseif v4_executar == 4
                x2_v4 = x2_v4 - 1;
                end    
            
                xvec_v4 = (x2_v4-x_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                yvec_v4 = (y2_v4-y_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                
                init_mov_v4 = 0;
                b4_vproximo = 0;
            end    
                
            %MAPEAMENTO INIT----------------------
            if (v4(1).Mensagem.ListaTarefas(1,1) == "Mapeamento" && init_mov_v4) 
                if b4_vproximo 
                p1_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,2));
                p2_v4 = cell2mat(v4(1).Mensagem.ListaTarefas(1,3));
                x2_v4 = p1_v4(1);
                y2_v4 = p1_v4(2);
                v4_executar = 1;
                elseif v4_executar == 2
                y2_v4 = p2_v4(2);
                elseif v4_executar == 3
                    if p2_v4(1) > p1_v4(1) 
                x2_v4 = x2_v4 + 1;
                    else
                x2_v4 = x2_v4 - 1;        
                    end    
                elseif v4_executar == 4
                y2_v4 = p1_v4(2);
                elseif v4_executar == 5
                    if p2_v4(1) > p1_v4(1) 
                x2_v4 = x2_v4 + 1;
                    else
                x2_v4 = x2_v4 - 1;        
                    end    
                elseif v4_executar == 6
                x2_v4 = 4.6;
                y2_v4 = 13;    
                end    
            
                if b4_vproximo || v4_executar == 3 || v4_executar == 5 || v4_executar == 6
                xvec_v4 = (x2_v4-x_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                else
                xvec_v4 = 0;    
                end
                
                if b4_vproximo || v4_executar == 2 || v4_executar == 4 || v4_executar == 6
                yvec_v4 = (y2_v4-y_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                else
                yvec_v4 = 0;    
                end
                
                init_mov_v4 = 0;
                b4_vproximo = 0;
            end    
            
            %RECONHECIMENTO---------------------------
            if (cell2mat(v4(1).Mensagem.ListaTarefas(1,1)) == "Reconhecimento")
                if stop_v4 == 0
                    %atualizar posição
                    x_v4 = x_v4 + (xvec_v4*v);
                    y_v4 = y_v4 + (yvec_v4*v);
        
                    x_v4R = round(x_v4,1);
                    y_v4R = round(y_v4,1);
    
                    set(v4sim.Sim,'XData',x_v4R,'YData',y_v4R);
        
                    v4(1).X = x_v4R;
                    v4(1).Y = y_v4R; 
                
                    if hold_v4 == 300
                        hold_v4 = hold_v4 + 1;
                    end
                
                else
                    hold_v4 = hold_v4 + 1; 
                
                    if hold_v4 == 300
                        stop_v4 = 0;
                    end   
                end
        
                %terminar viagem
                if (x_v4R == x2_v4 && y_v4R == y2_v4)
                    %realocar destino
                    if v4_executar == 1
                        v4_executar = 0;    
                        init_mov_v4 = 1;
                        stop_v4 = 1;   
                
                    %chegou à base
                    elseif hold_v4 == 301     
                        mover_v4 = 0;
                        b4_vproximo = 1;
                        init_mov_v4 = 1;
                        hold_v4 = 0;
                        msg_v4 = 1;
                    end
                end 
            end  
        
            %PATRULHA--------------------------------
            if (cell2mat(v4(1).Mensagem.ListaTarefas(1,1)) == "Patrulha")
                %atualizar posição
                x_v4 = x_v4 + (xvec_v4*v);
                y_v4 = y_v4 + (yvec_v4*v);
        
                x_v4R = round(x_v4,1);
                y_v4R = round(y_v4,1);
    
                set(v4sim.Sim,'XData',x_v4R,'YData',y_v4R);
        
                v4(1).X = x_v4R;
                v4(1).Y = y_v4R; 
                
                hold_v4 = hold_v4 + 0.01;    
             
                %ainda não passou o tempo da patrulha
                if hold_v4 < (cell2mat(v4(1).Mensagem.ListaTarefas(1,5)))
                    %realocar destino
                    if (x_v4R == x2_v4 && y_v4R == y2_v4)
                        if v4_executar == 4
                            v4_executar = 1;
                        else
                            v4_executar = v4_executar + 1;
                        end
                        
                        init_mov_v4 = 1;
                    end    
                    
                %passou tempo, manda regressar à base
                else  
                    if init_return_v4
                        x2_v4 = 4.6;
                        y2_v4 = 13;  
                        xvec_v4 = (x2_v4-x_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                        yvec_v4 = (y2_v4-y_v4)/sqrt((x2_v4-x_v4)^2+(y2_v4-y_v4)^2);
                        init_return_v4 = 0;
                    end
                    
                    if (x_v4R == x2_v4 && y_v4R == y2_v4)
                        mover_v4 = 0;
                        b4_vproximo = 1;
                        init_mov_v4 = 1;
                        init_return_v4 = 1;
                        hold_v4 = 0;
                        msg_v4 = 1;
                    end
                end 
            end   
        
        
            %MAPEAMENTO--------------------------------
            if (cell2mat(v4(1).Mensagem.ListaTarefas(1,1)) == "Mapeamento")
                %atualizar posição
                x_v4 = x_v4 + (xvec_v4*v);
                y_v4 = y_v4 + (yvec_v4*v);
        
                x_v4R = round(x_v4,1);
                y_v4R = round(y_v4,1);
    
                set(v4sim.Sim,'XData',x_v4R,'YData',y_v4R);
        
                v4(1).X = x_v4R;
                v4(1).Y = y_v4R;     
             
                %terminar viagem
                if (x_v4R == x2_v4 && y_v4R == y2_v4)
                    %acabou de mapear
                    if (x_v4R == p2_v4(1) && y_v4R == p2_v4(2))
                        v4_executar = 6;
                        init_mov_v4 = 1;
                    %chegou à base    
                    elseif (x_v4R == 4.6 && y_v4R == 13)
                        mover_v4 = 0;
                        v4_executar = 0;
                        b4_vproximo = 1;
                        init_mov_v4 = 1;
                        msg_v4 = 1;
                    %realocar destino
                    else    
                        if v4_executar == 5
                            v4_executar = 2;
                        else
                            v4_executar = v4_executar + 1;
                        end
                        
                        init_mov_v4 = 1;
                    end
                end 
            end   
        end       
        
    pause(0.01);    
    
    end
end    