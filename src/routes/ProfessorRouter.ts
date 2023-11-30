import { Router } from "express";
import ProfessorController from "../controllers/ProfessorController";

const ProfessorRouter = Router();

ProfessorRouter.get('/professor', ProfessorController.listProfessor)

ProfessorRouter.post('/professor', ProfessorController.createProfessor);

ProfessorRouter.put('/professor', ProfessorController.updateProfessor);

ProfessorRouter.delete('/professor', ProfessorController.deleteProfessor);

export default ProfessorRouter;