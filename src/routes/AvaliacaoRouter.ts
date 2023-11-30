import { Router } from "express";
import AvaliacaoController from "../controllers/AvaliacaoController";

const AvaliacaoRouter = Router();

AvaliacaoRouter.get('/avaliacao', AvaliacaoController.listAvaliacao)

AvaliacaoRouter.post('/avaliacao', AvaliacaoController.createAvaliacao);

AvaliacaoRouter.put('/avaliacao', AvaliacaoController.updateAvaliacao);

AvaliacaoRouter.delete('/avaliacao', AvaliacaoController.deleteAvaliacao);

export default AvaliacaoRouter;