import { Router } from "express";
import AlunoController from "../controllers/AlunoController";

const AlunoRouter = Router();

AlunoRouter.get('/aluno', AlunoController.listAluno)

AlunoRouter.post('/aluno', AlunoController.createAluno);

AlunoRouter.put('/aluno', AlunoController.updateAluno);

AlunoRouter.delete('/aluno', AlunoController.deleteAluno);

export default AlunoRouter;