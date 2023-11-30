/*
  Warnings:

  - The primary key for the `Professor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Grupo" (
    "nome" TEXT NOT NULL PRIMARY KEY,
    "matriculaLider" TEXT NOT NULL,
    CONSTRAINT "Grupo_matriculaLider_fkey" FOREIGN KEY ("matriculaLider") REFERENCES "Aluno" ("matricula") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("matriculaLider", "nome") SELECT "matriculaLider", "nome" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_nome_key" ON "Grupo"("nome");
CREATE UNIQUE INDEX "Grupo_matriculaLider_key" ON "Grupo"("matriculaLider");
CREATE TABLE "new_Professor" (
    "matricula" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL
);
INSERT INTO "new_Professor" ("email", "matricula", "nome") SELECT "email", "matricula", "nome" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE UNIQUE INDEX "Professor_matricula_key" ON "Professor"("matricula");
CREATE UNIQUE INDEX "Professor_email_key" ON "Professor"("email");
CREATE TABLE "new_Avaliacao" (
    "avaliador" TEXT NOT NULL PRIMARY KEY,
    "matriculaAluno" TEXT NOT NULL,
    "matriculaProf" TEXT NOT NULL,
    "grupoAvaliado" TEXT NOT NULL,
    "nota" REAL NOT NULL,
    CONSTRAINT "Avaliacao_matriculaAluno_fkey" FOREIGN KEY ("matriculaAluno") REFERENCES "Aluno" ("matricula") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Avaliacao_matriculaProf_fkey" FOREIGN KEY ("matriculaProf") REFERENCES "Professor" ("matricula") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Avaliacao_grupoAvaliado_fkey" FOREIGN KEY ("grupoAvaliado") REFERENCES "Grupo" ("nome") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Avaliacao" ("avaliador", "grupoAvaliado", "matriculaAluno", "matriculaProf", "nota") SELECT "avaliador", "grupoAvaliado", "matriculaAluno", "matriculaProf", "nota" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE UNIQUE INDEX "Avaliacao_matriculaAluno_key" ON "Avaliacao"("matriculaAluno");
CREATE UNIQUE INDEX "Avaliacao_matriculaProf_key" ON "Avaliacao"("matriculaProf");
CREATE UNIQUE INDEX "Avaliacao_grupoAvaliado_key" ON "Avaliacao"("grupoAvaliado");
CREATE TABLE "new_Aluno" (
    "nomeAluno" TEXT NOT NULL,
    "matricula" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "nomeGrupo" TEXT NOT NULL,
    CONSTRAINT "Aluno_nomeGrupo_fkey" FOREIGN KEY ("nomeGrupo") REFERENCES "Grupo" ("nome") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("email", "matricula", "nomeAluno", "nomeGrupo") SELECT "email", "matricula", "nomeAluno", "nomeGrupo" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");
CREATE UNIQUE INDEX "Aluno_nomeGrupo_key" ON "Aluno"("nomeGrupo");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
