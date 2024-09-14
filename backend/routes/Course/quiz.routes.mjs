import express from "express";
import {
  addQuestion,
  createQuiz,
  fetchQuizQuestions,
  getQuestion,
  getQuestionsByModuleAndCourse,
  getQuizType,
  saveQuizAttempt,
} from "../../controller/Course/quiz.controller.mjs";
import upload from "../../middleware/fileUpload.mjs";
const router = express.Router();

router.post("/addquestion",addQuestion);
router.get("/getquestion", getQuestion);
router.get("/questions/:course/:module", getQuestionsByModuleAndCourse);
router.get("/getquiztype", getQuizType);
router.get("/fetch/:courseId/:moduleId/:quizTypeId", fetchQuizQuestions);

router.post("/createquiz", createQuiz);
router.post('/savequiz/:user_id/:ass_id/:module',saveQuizAttempt)

export default router;
