(() => {
  const $ = (s) => document.querySelector(s);
  const app = $('#app');
  const toastEl = $('#toast');
  const topics = [
    {id:'1',name:'Diferenças de linguagens de Programação'},
    {id:'4',name:'Hack em Geral'},
    {id:'2',name:'Erros da Computação'},
    {id:'3',name:'História da Computação'}
  ];
  let db, state = {screen:'home',name:'',topic:null,questions:[],index:0,selected:null,score:0,feedback:null,playerId:null};
  const esc = (v='') => String(v).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  function toast(msg){toastEl.textContent=msg;toastEl.classList.add('show');setTimeout(()=>toastEl.classList.remove('show'),3200)}
  function pet(){return `<img class="pet" src="assets/clippy-removebg-preview.png" alt="Clip, mascote do Paragon Quiz">`}
  function header(sub=''){return `<header class="topbar"><h1 class="brand">Paragon Quiz</h1>${sub?`<small>${esc(sub)}</small>`:''}${pet()}</header>`}
  function button(label,action,cls=''){return `<button class="btn ${cls}" data-action="${action}">${label}</button>`}
  function render(){
    if(state.screen==='home') app.innerHTML=`<section class="screen home-screen">${pet()}<div class="content hero"><div class="hero-band"><h1>Paragon Quiz</h1></div>${button('COMEÇAR','go-name','full')}</div></section>`;
    if(state.screen==='name') app.innerHTML=`<section class="screen">${header()}<div class="content"><div class="name-panel"><label for="player-name">Como devemos te chamar?</label><input id="player-name" class="text-input" maxlength="80" placeholder="Digite seu nome" value="${esc(state.name)}" autocomplete="nickname"></div>${button('CONTINUAR','go-topics','full')}</div></section>`;
    if(state.screen==='topics') app.innerHTML=`<section class="screen">${header(state.name)}<div class="content"><h2 class="brand">Selecione o quiz</h2><div class="topic-list">${topics.map(t=>`<button class="choice ${state.topic?.id===t.id?'selected':''}" data-topic="${t.id}"><span>${esc(t.name)}</span><i class="radio"></i></button>`).join('')}</div>${button('COMEÇAR','start-quiz','full')}</div></section>`;
    if(state.screen==='quiz') renderQuestion();
    if(state.screen==='feedback') renderFeedback();
    if(state.screen==='result') renderResult();
    if(state.screen==='ranking') renderRanking();
  }
  function renderQuestion(){
    const q=state.questions[state.index]; if(!q){finish();return;}
    const options=[q.alternativa_a,q.alternativa_b,q.alternativa_c,q.alternativa_d].filter(v=>v!==null&&v!==undefined&&v!=='');
    const isBoolean=options.length===2;
    app.innerHTML=`<section class="screen quiz-screen">${header(state.topic.name)}<div class="question-area"><div class="progress">PERGUNTA ${state.index+1} DE ${state.questions.length} · ${esc(q.nome_dificuldade||'')}</div><h2>${esc(q.texto_pergunta)}</h2></div><div class="answers ${isBoolean?'boolean':''}">${options.map((v,i)=>`<button class="answer ${state.selected===i+1?'selected':''}" data-answer="${i+1}"><span class="letter">${isBoolean?(i===0?'V':'F'):String.fromCharCode(65+i)}</span><span>${esc(v)}</span></button>`).join('')}</div><footer class="quiz-footer">${button('ENVIAR RESPOSTA','submit-answer','blue')}</footer></section>`;
  }
  function renderFeedback(){
    const f=state.feedback; const label=f.resposta_correta_texto||f.resposta_correta||'Confira a justificativa';
    app.innerHTML=`<section class="screen quiz-screen">${header(state.topic.name)}<div class="question-area"><div class="progress">PERGUNTA ${state.index+1} DE ${state.questions.length}</div><h2>${esc(state.questions[state.index].texto_pergunta)}</h2></div><div class="feedback"><div class="feedback-card"><span class="feedback-tag ${f.correto?'good':'bad'}">${f.correto?'CORRETO':'ERRADO'}</span><h3>${f.correto?'Você acertou!':'Resposta correta: '+esc(label)}</h3><p>${esc(f.justificativa||'')}</p></div></div><div class="feedback-actions">${button(state.index+1===state.questions.length?'VER RESULTADO':'PRÓXIMA PERGUNTA','next-question','full')}</div></section>`;
  }
  function renderResult(){
    app.innerHTML=`<section class="screen result-screen">${header(state.topic.name)}<div class="result-content"><h2 class="result-score">PONTUAÇÃO TOTAL: <strong>${state.score}</strong></h2><p class="result-player">${esc(state.name)}</p><div class="btn-row">${button('VER RANKING','ranking','blue')}${button('JOGAR NOVAMENTE','restart','secondary')}</div></div></section>`;
  }
  async function renderRanking(){
    app.innerHTML=`<section class="screen ranking-screen">${header(state.topic?.name||'Paragon Quiz')}<div class="ranking-heading">PONTUAÇÃO TOTAL: ${Number(state.score||0)} pontos</div><div class="ranking-layout"><aside class="other-players"><h2>Outros jogadores</h2><div class="other-list"><div class="loader"></div></div></aside><section class="podium-area"><div class="podium-ranking"></div></section></div><footer class="ranking-footer">${button('JOGAR NOVAMENTE','restart','blue')}</footer></section>`;
    const {data,error}=await db.rpc('paragon_ranking');
    const screen=app.querySelector('.ranking-screen');
    if(!screen)return;
    if(error){
      screen.querySelector('.other-list').innerHTML=`<div class="error-box">Não foi possível carregar o ranking.<br>${esc(error.message)}</div>`;
      screen.querySelector('.podium-area').innerHTML='';
      screen.insertAdjacentHTML('beforeend',button('VOLTAR','back-result','secondary'));
      return;
    }
    const rows=(data||[]).slice().sort((a,b)=>Number(b.pontos)-Number(a.pontos));
    const top=rows.slice(0,3);
    const others=rows.slice(3,10);
    const podium=screen.querySelector('.podium-area');
    if(!top.length){
      podium.innerHTML='<p class="ranking-empty">Ainda não há pontuações registradas.</p>';
    } else {
      const places=[{rank:2,cls:'place-2',row:top[1]},{rank:1,cls:'place-1',row:top[0]},{rank:3,cls:'place-3',row:top[2]}].filter(x=>x.row);
      podium.innerHTML=`<div class="podium-ranking">${places.map(x=>`<div class="podium-place ${x.cls}"><div class="podium-avatar">${pet()}</div><strong class="podium-player">${esc(x.row.nome)}</strong><span class="podium-points">${Number(x.row.pontos)} pts</span><div class="podium-block"><b>${x.rank}°</b></div></div>`).join('')}</div>`;
    }
    screen.querySelector('.other-list').innerHTML=others.length
      ? others.map((r,i)=>`<div class="other-row"><b>${i+4}°</b><span>${esc(r.nome)}</span><strong>${Number(r.pontos)}</strong></div>`).join('')
      : '<p class="ranking-empty">—</p>';
  }
  async function startQuiz(){
    if(!state.topic){toast('Selecione um tema antes de continuar.');return;}
    const b=$('[data-action="start-quiz"]'); if(b){b.disabled=true;b.textContent='CARREGANDO...';}
    const {data,error}=await db.rpc('paragon_obter_perguntas',{p_id_tema:Number(state.topic.id)});
    if(error){toast('Erro ao buscar perguntas: '+error.message);if(b){b.disabled=false;b.textContent='COMEÇAR';}return;}
    if(!data||data.length===0){toast('Esse tema ainda não possui perguntas cadastradas.');if(b){b.disabled=false;b.textContent='COMEÇAR';}return;}
    state.questions=data;state.index=0;state.score=0;state.selected=null;state.screen='quiz';render();
  }
  async function submitAnswer(){
    if(!state.selected){toast('Escolha uma alternativa.');return;}
    const b=$('[data-action="submit-answer"]');if(b){b.disabled=true;b.textContent='CORRIGINDO...';}
    const q=state.questions[state.index];
    const {data,error}=await db.rpc('paragon_corrigir_resposta',{p_id_alternativa:q.id_alternativa,p_resposta_marcada:state.selected});
    if(error){toast('Não foi possível corrigir: '+error.message);if(b){b.disabled=false;b.textContent='ENVIAR RESPOSTA';}return;}
    const f=Array.isArray(data)?data[0]:data;
    if(!f){toast('A correção não retornou resultado.');return;}
    if(f.correto)state.score+=Number(f.valor_pontos||q.valor_pontos||0);
    const options=[q.alternativa_a,q.alternativa_b,q.alternativa_c,q.alternativa_d].filter(v=>v!==null&&v!==undefined&&v!=='');
    state.feedback={...f,resposta_correta_texto:options[Number(f.resposta_correta)-1]};state.screen='feedback';render();
  }
  async function finish(){
    state.screen='result';render();
    const {data,error}=await db.rpc('paragon_registrar_jogador',{p_nome:state.name,p_id_tema:Number(state.topic.id),p_pontos:state.score});
    if(error)toast('Pontuação calculada, mas não foi salva: '+error.message);
    else state.playerId=data;
  }
  app.addEventListener('click',async e=>{
    const topic=e.target.closest('[data-topic]');if(topic){state.topic=topics.find(t=>t.id===topic.dataset.topic);render();return;}
    const answer=e.target.closest('[data-answer]');if(answer){state.selected=Number(answer.dataset.answer);renderQuestion();return;}
    const action=e.target.closest('[data-action]')?.dataset.action;if(!action)return;
    if(action==='go-name'){state.screen='name';render();}
    if(action==='go-topics'){const n=$('#player-name').value.trim();if(!n){toast('Digite seu nome para continuar.');return;}state.name=n;state.screen='topics';render();}
    if(action==='start-quiz')await startQuiz();
    if(action==='submit-answer')await submitAnswer();
    if(action==='next-question'){state.index++;state.selected=null;state.feedback=null;if(state.index>=state.questions.length)await finish();else{state.screen='quiz';render();}}
    if(action==='ranking')await renderRanking();
    if(action==='back-result'){state.screen='result';render();}
    if(action==='restart'){state.name='';state.topic=null;state.questions=[];state.score=0;state.index=0;state.selected=null;state.feedback=null;state.playerId=null;state.screen='name';render();}
  });
  async function init(){
    if(!window.supabase||!window.PARAGON_CONFIG){app.innerHTML='<section class="screen"><div class="content"><div class="error-box">Não foi possível carregar a biblioteca ou as configurações do Supabase.</div></div></section>';return;}
    db=window.supabase.createClient(PARAGON_CONFIG.SUPABASE_URL,PARAGON_CONFIG.SUPABASE_KEY);
    state.screen='home';render();
  }
  init();
})();
