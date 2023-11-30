import { Router } from "express";
import GrupoController from "../controllers/GrupoController";

const GrupoRouter = Router();

GrupoRouter.get('/grupo', GrupoController.listGrupo)

GrupoRouter.post('/grupo', GrupoController.createGrupo);

GrupoRouter.put('/grupo', GrupoController.updateGrupo);

GrupoRouter.delete('/grupo', GrupoController.deleteGrupo);

export default GrupoRouter;