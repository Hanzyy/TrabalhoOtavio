-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Aluno" (
    "nomeAluno" TEXT NOT NULL,
    "matricula" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "nomeGrupo" TEXT,
    CONSTRAINT "Aluno_nomeGrupo_fkey" FOREIGN KEY ("nomeGrupo") REFERENCES "Grupo" ("nome") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("email", "matricula", "nomeAluno", "nomeGrupo") SELECT "email", "matricula", "nomeAluno", "nomeGrupo" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_key" ON "Aluno"("matricula");
CREATE UNIQUE INDEX "Aluno_email_key" ON "Aluno"("email");
CREATE UNIQUE INDEX "Aluno_nomeGrupo_key" ON "Aluno"("nomeGrupo");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
