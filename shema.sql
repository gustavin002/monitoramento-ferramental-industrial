create database monitoramento_ferramental_industrial;
use monitoramento_ferramental_industrial;

create table tb_galpao(
id_galpao bigint primary key auto_increment,
    nome varchar(100) not null,
    ativo tinyint not null
);
create table tb_usuario(
id_usuario bigint primary key auto_increment,
    login varchar(50) not null,
    senha varchar(100) not null,
    perfil varchar(20) not null
);
create table tb_ferramenta(
id_ferramenta bigint primary key auto_increment,
    nome varchar(100) not null,
horas_uso int not null default 0,
    vida_util_maxima int not null,
    status varchar(30) not null,
    id_galpao bigint,
    id_usuario_responsavel bigint,
    foreign key (id_galpao) references tb_galpao(id_galpao),
    foreign key (id_usuario_responsavel) references tb_usuario(id_usuario)
);
create table tb_ordem_servico(
id_ordem_servico bigint primary key auto_increment,
    id_ferramenta bigint,
    id_usuario_tecnico bigint,
    descricao text not null,
    data_abertura datetime not null,
    data_fechamento datetime,
    status varchar(20) not null,
    foreign key (id_ferramenta) references tb_ferramenta (id_ferramenta),
    foreign key (id_usuario_tecnico) references tb_usuario (id_usuario)
);

-- ==========================================
-- 1. INSERTS: tb_usuario
-- ==========================================
-- IDs gerados: 1 a 12 (1 Admin, 6 Operadores, 5 Técnicos)
INSERT INTO tb_usuario (id_usuario, login, senha, perfil) VALUES
(1, 'admin.master', 'admin123', 'ADMIN'),
(2, 'carlos.operador', 'senha123', 'OPERADOR'),
(3, 'ana.montagem', 'senha123', 'OPERADOR'),
(4, 'joao.corte', 'senha123', 'OPERADOR'),
(5, 'marcos.usinagem', 'senha123', 'OPERADOR'),
(6, 'julia.prensa', 'senha123', 'OPERADOR'),
(7, 'lucas.torno', 'senha123', 'OPERADOR'),
(8, 'roberto.tecnico', 'tec123', 'TECNICO'),
(9, 'marisa.manutencao', 'tec123', 'TECNICO'),
(10, 'felipe.eletronica', 'tec123', 'TECNICO'),
(11, 'andre.mecanica', 'tec123', 'TECNICO'),
(12, 'bruna.automacao', 'tec123', 'TECNICO');


-- ==========================================
-- 2. INSERTS: tb_galpao
-- ==========================================
-- IDs gerados: 1 a 6 (5 Ativos para uso, 1 Inativo/Soft Delete)
INSERT INTO tb_galpao (id_galpao, nome, ativo) VALUES
(1, 'Galpão A - Usinagem de Precisão', 1),
(2, 'Galpão B - Linha de Montagem Final', 1),
(3, 'Galpão C - Estamparia e Metalurgia', 1),
(4, 'Galpão D - Caldeiraria e Soldagem Industrial', 1),
(5, 'Galpão E - Laboratório de Eletrônica e CNC', 1),
(6, 'Galpão Antigo F - Desativado para Reformas', 0);


-- ==========================================
-- 3. INSERTS: tb_ferramenta
-- ==========================================
-- IDs gerados: 1 a 24 
-- Atente-se às ferramentas com status 'Parada'. Elas terão uma O.S. 'Aberta' associada abaixo.
INSERT INTO tb_ferramenta (id_ferramenta, nome, horas_uso, vida_util_maxima, status, id_galpao, id_usuario_responsavel) VALUES
-- Galpão 1 (Usinagem) - Operadores: Carlos (2) e Lucas (7)
(1, 'Torno Mecânico Horizontal Nardini', 1200, 5000, 'Em funcionamento', 1, 7),
(2, 'Fresadora Ferramenteira ISO 40', 4100, 4500, 'Em funcionamento', 1, 5), -- Desgaste Alto (>90%)
(3, 'Retificadora Cilíndrica de Precisão', 350, 3000, 'Em funcionamento', 1, 2),  -- Nova
(4, 'Furadeira de Bancada Industrial Heavy Duty', 2100, 2500, 'Parada', 1, 2), -- Parada para Manutenção

-- Galpão 2 (Montagem) - Operadora: Ana (3)
(5, 'Parafusadeira Pneumática Industrial Shulz', 850, 1500, 'Em funcionamento', 2, 3),
(6, 'Pistola de Rebite Hidropneumática', 1420, 2000, 'Em funcionamento', 2, 3),
(7, 'Torquímetro de Estalo Digital Snap-On', 980, 1000, 'Em funcionamento', 2, 3),  -- Desgaste Crítico (98%)
(8, 'Prensa Hidráulica de Bancada 15T', 100, 4000, 'Em funcionamento', 2, 3),

-- Galpão 3 (Estamparia) - Operadora: Julia (6)
(9, 'Prensa Excêntrica de Engrenagem 100T', 4500, 6000, 'Parada', 3, 6),        -- Parada para Manutenção
(10, 'Guilhotina Hidráulica para Chapas', 2900, 5000, 'Em funcionamento', 3, 6),
(11, 'Dobradeira de Chapas CNC Newton', 1200, 4000, 'Em funcionamento', 3, 6),
(12, 'Conjunto de Matrizes de Corte Progressivo', 800, 1200, 'Em funcionamento', 3, 6),

-- Galpão 4 (Caldeiraria) - Operador: João (4)
(13, 'Inversora de Solda TIG Industrial Lincoln', 1850, 3000, 'Em funcionamento', 4, 4),
(14, 'Máquina de Corte a Plasma CNC', 2200, 2500, 'Em funcionamento', 4, 4),    -- Desgaste Alto
(15, 'Calandra Hidráulica para Tubos e Chapas', 950, 3500, 'Parada', 4, 4),      -- Parada para Manutenção
(16, 'Esmerilhadeira Angular Heavy Duty Bosch', 450, 800, 'Em funcionamento', 4, 4),

-- Galpão 5 (Eletrônica e CNC) - Operador: Marcos (5)
(17, 'Centro de Usinagem CNC ROMI D800', 800, 8000, 'Em funcionamento', 5, 5),   -- Nova
(18, 'Estação de Retrabalho BGA Digital', 1150, 1200, 'Em funcionamento', 5, 5), -- Desgaste Crítico
(19, 'Osciloscópio Digital Keysight 4 Canais', 300, 5000, 'Em funcionamento', 5, 5),
(20, 'Gerador de Funções Arbitrárias Tektronix', 150, 4000, 'Em funcionamento', 5, 5),

-- Ferramentas Extras Variadas para paginação e volume
(21, 'Morsa de Bancada Articulada Nº 6', 500, 10000, 'Em funcionamento', 1, 2),
(22, 'Soprador Térmico Industrial Dewalt', 750, 800, 'Parada', 5, 5),           -- Parada para Manutenção
(23, 'Politriz Angular Industrial Makita', 600, 1500, 'Em funcionamento', 2, 3),
(24, 'Multímetro Automotivo Fluke True-RMS', 1100, 3000, 'Em funcionamento', 5, 5);


-- ==========================================
-- 4. INSERTS: tb_ordem_servico
-- ==========================================
-- Histórico Técnico. Técnicos válidos: Roberto (8), Marisa (9), Felipe (10), Andre (11), Bruna (12).

-- Ordens de Serviço Encerradas (Histórico de consertos já finalizados)
INSERT INTO tb_ordem_servico (id_ferramenta, id_usuario_tecnico, descricao, data_abertura, data_fechamento, status) VALUES
(1, 11, 'Troca dos rolamentos do eixo árvore principal e lubrificação geral.', '2026-01-10 08:00:00', '2026-01-11 16:30:00', 'Encerrada'),
(5, 8, 'Substituição das palhetas rotativas do motor pneumático.', '2026-02-14 13:15:00', '2026-02-14 15:00:00', 'Encerrada'),
(10, 9, 'Afiação das facas superiores da guilhotina e sangria do óleo hidráulico.', '2026-03-01 09:00:00', '2026-03-02 11:45:00', 'Encerrada'),
(13, 10, 'Reparo na placa de potência inversora após pico de tensão na rede.', '2026-03-15 14:00:00', '2026-03-16 10:20:00', 'Encerrada'),
(17, 12, 'Calibração dos eixos X, Y e Z e atualização do firmware do painel CNC.', '2026-04-05 07:30:00', '2026-04-05 12:00:00', 'Encerrada'),
(2, 11, 'Ajuste na folga do carro transversal da fresadora.', '2026-05-12 10:00:00', '2026-05-12 14:30:00', 'Encerrada'),
(14, 12, 'Substituição do bico consumível da tocha de plasma e teste de pressão do ar.', '2026-05-20 08:10:00', '2026-05-20 09:40:00', 'Encerrada');

-- Ordens de Serviço ABERTAS (Manutenções em andamento neste momento)
-- Importante: As ferramentas listadas aqui (4, 9, 15, 22) estão marcadas com status='Parada' na tabela tb_ferramenta acima.
INSERT INTO tb_ordem_servico (id_ferramenta, id_usuario_tecnico, descricao, data_abertura, data_fechamento, status) VALUES
(4, 11, 'Motor elétrico superaquecendo em alta rotação. Necessário rebobinamento.', '2026-06-17 08:00:00', NULL, 'Aberta'),
(9, 9, 'Vazamento massivo de fluido hidráulico no pistão central da prensa excêntrica.', '2026-06-18 07:45:00', NULL, 'Aberta'),
(15, 8, 'Empenamento no rolo compressor inferior da calandra. Encaminhado para retífica externa.', '2026-06-18 10:30:00', NULL, 'Aberta'),
(22, 10, 'Resistência interna do soprador queimada. Aguardando peça de reposição do fornecedor.', '2026-06-18 11:15:00', NULL, 'Aberta');