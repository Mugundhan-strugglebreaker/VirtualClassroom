var start_btn = document.querySelector(".start_btn button");
var info_box = document.querySelector(".info_box");

var continue_btn = info_box.querySelector(".buttons .restart");
var quiz_box = document.querySelector(".quiz_box");
var result_box = document.querySelector(".result_box");
var option_list = document.querySelector(".option_list");
var time_line = document.querySelector("header .time_line");
var timeText = document.querySelector(".timer .time_left_txt");
var timeCount = document.querySelector(".timer .timer_sec");
var questions,online;

function asd()
{
   questions=obj;
   online=obj;
   for(i=0;i<questions.length;i++)
     {
         console.log(online[i].ID);
         console.log(online[i].QUESTIONS);
         console.log(online[i].ANSWERS);
//         console.log(online[i].Date_Of_Birth);
//         console.log(online[i].Place_Of_Birth);
//         console.log(online[i].Country);
         var ary_options=online[i].OPTIONS;
         console.log(online[i].OPTIONS);
         for(j=0;j<ary_options.length;j++)
         console.log(ary_options[j]);

     }
}

// if startQuiz button clicked
//start_btn.onclick = ()=>
//{
//    info_box.classList.add("activeInfo"); 
//}

start_btn.onclick=function (){info_box.classList.add("activeInfo"); }

// if exitQuiz button clicked
//exit_btn.onclick = ()=>{
//    info_box.classList.remove("activeInfo"); 
//}

//exit_btn.onclick=function (){info_box.classList.remove("activeInfo"); }

// if continueQuiz button clicked
//continue_btn.onclick = ()=>{
//    info_box.classList.remove("activeInfo"); 
//    quiz_box.classList.add("activeQuiz"); 
//    showQuetions(0); 
//    queCounter(1);
//    startTimer(15);
//    startTimerLine(0); 
//}

continue_btn.onclick =function ()
{
    info_box.classList.remove("activeInfo"); 
    quiz_box.classList.add("activeQuiz"); 
    showQuetions(0); 
    queCounter(1);
    startTimer(15);
    startTimerLine(0); 
}

var timeValue =  15;
var que_count = 0;
var que_numb = 1;
var userScore = 0;
var counter;
var counterLine;
var widthValue = 0;
var alerting=3;
var start_alert=0;

//var restart_quiz = result_box.querySelector(".buttons .restart");
//var quit_quiz = result_box.querySelector(".buttons .quit");

//quit_quiz.onclick = ()=>{
//    window.location.reload(); 
//}


var next_btn = document.querySelector("footer .next_btn");
var bottom_ques_counter = document.querySelector("footer .total_que");

// if Next Que button clicked
//next_btn.onclick = ()=>{
//    if(que_count < questions.length - 1)
//    { 
//        que_count++; 
//        que_numb++;
//        showQuetions(que_count); 
//        queCounter(que_numb); 
//        clearInterval(counter); 
//        clearInterval(counterLine); 
//        startTimer(timeValue); 
//        startTimerLine(widthValue);
//        timeText.textContent = "Time Left"; 
//        next_btn.classList.remove("show"); 
//    }
//    else
//    {
//        clearInterval(counter);
//        clearInterval(counterLine); 
//        showResult(); 
//    }
//}

next_btn.onclick=function ()
{
     if(que_count < questions.length - 1)
    { 
        que_count++; 
        que_numb++;
        showQuetions(que_count); 
        queCounter(que_numb); 
        clearInterval(counter); 
        clearInterval(counterLine); 
        startTimer(timeValue); 
        startTimerLine(widthValue);
        timeText.textContent = "Time Left"; 
        next_btn.classList.remove("show"); 
    }
    else
    {
        clearInterval(counter);
        clearInterval(counterLine); 
        showResult(); 
    }
}


function showQuetions(index)
{
    var que_text = document.querySelector(".que_text");

    var que_tag = '<span>'+ questions[index].ID + ") " + questions[index].QUESTION +'</span>';
    var option_tag = '<input type="radio" class="option" name="op1" value= " '+questions[index].OPTIONS[0]+'"><span>'+ questions[index].OPTIONS[0] +'</span></br>'
    + '<input type="radio" class="option" name="op1" value= " '+questions[index].OPTIONS[1]+'"><span>'+ questions[index].OPTIONS[1] +'</span></br>'
    + '<input type="radio" class="option" name="op1" value= " '+questions[index].OPTIONS[2]+'"><span>'+ questions[index].OPTIONS[2] +'</span></br>'
    + '<input type="radio" class="option" name="op1" value= " '+questions[index].OPTIONS[3]+'"><span>'+ questions[index].OPTIONS[3] +'</span></br>';
    que_text.innerHTML = que_tag; //adding new span tag inside que_tag
    option_list.innerHTML = option_tag; //adding new div tag inside option_tag

}


  document.addEventListener('visibilitychange', function()
  {
      document.title=document.visibilityState;
      if(questions.length!=null)
      {
      if(document.visibilityState=="hidden")
      {
          start_alert++;
         alert("warning no "+start_alert);
        
      }
      else if(document.visibilityState=="visible")
      {
          document.title="ONLINE TEST";
      }
       if(start_alert==alerting)
       window.location.replace("http://localhost:8080/Virtual_Classroom/StoreResults?mark="+userScore+"&total="+questions.length);
   console.log(document.visibilityState);
      }
  });


function showResult()
{
    var scoreText = result_box.querySelector(".score_text");
    var Total_marks=questions.length;
    console.log(userScore);
    info_box.classList.remove("activeInfo"); //hide info box
    quiz_box.classList.remove("activeQuiz"); //hide quiz box
    result_box.classList.add("activeResult"); //show result box
   
    
    if (userScore > 3)
    { 
       
        var scoreTag = '<span>and congrats! 🎉, You got <p>'+ userScore +'</p> out of <p>'+ questions.length +'</p></span>';
          //adding new span tag inside score_Text
          scoreText.innerHTML = scoreTag;
    }
    else if(userScore > 1)
    { 
        var scoreTag = '<span>and nice 😎, You got <p>'+ userScore +'</p> out of <p>'+ questions.length +'</p></span>';
        scoreText.innerHTML = scoreTag;
    }
    else
    {
        var scoreTag = '<span>and sorry 😐, You got only <p>'+ userScore +'</p> out of <p>'+ questions.length +'</p></span>';
        scoreText.innerHTML = scoreTag;
    }
     setTimeout(function(){ window.location.replace("http://localhost:8080/Virtual_Classroom/StoreResults?mark="+userScore+"&total="+Total_marks); }, 4000);
}

function startTimer(time)
{
    console.log("awertyu1");
    counter = setInterval(timer, 1000);
    function timer()
    {
        console.log("awertyu2");
        timeCount.textContent = time; //changing the value of timeCount with time value
        time--; //decrement the time value
        if(time < 9)
        { 
            var addZero = timeCount.textContent; 
            timeCount.textContent = "0" + addZero; 
        }
        if(time < 0)
        { 
            console.log("awertyu3");
            clearInterval(counter);
            timeText.textContent = "Time Off";
            var allOptions = option_list.children.length; 
            var correcAns = questions[que_count].ANSWERS;
            var answerContainers=option_list.querySelectorAll(".option");
         //   console.log(userScore);
           // console.log(correcAns);
            for(i=0; i <answerContainers.length; i++)
            {
                console.log("awertyu");
                if(answerContainers[i].checked)
                {
            //    console.log("-->"+answerContainers[i].value+"-->");
              //  console.log("-->"+correcAns+"-->");
               // console.log(answerContainers[i].checked);
                }
                 
                if(answerContainers[i].checked && correcAns== answerContainers[i].value.trim())
                { 
                    console.log("hai");
                    userScore=userScore+1;
                }
            }
            for(i=0; i < allOptions; i++)
            {
                option_list.children[i].classList.add("disabled"); 
            }
            next_btn.classList.add("show"); 
        }
    }
}

function startTimerLine(time)
{
    counterLine = setInterval(timer, 29);
    function timer()
    {
        time += 1; 
        time_line.style.width = time + "px"; 
        if(time > 549)
        { 
            clearInterval(counterLine);
        }
    }
}

function queCounter(index)
{
    var totalQueCounTag = '<span><p>'+ index +'</p> of <p>'+ questions.length +'</p> Questions</span>';
    bottom_ques_counter.innerHTML = totalQueCounTag;
    if(index==questions.length)
    {
        next_btn.innerHTML="Submit";
    }
}