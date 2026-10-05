Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDD4C0420
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213869; cv=pass; b=nNjtqEbW+0ubXQ2ZEReq/SVMJYZFs4pbnv0yEveGqIj30DzrQ+4l3bYewORhOXucB/1PanfdKy2TnsqmeZrce0VgHDfslZZ6GS0YfwiCD5UM0dQIzfduCOKTZSrLVjpG965tRuob0qB2BAEBPaJJpxIlNnoNCvidir35Lh6wIM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213869; c=relaxed/simple;
	bh=OLGMnE5xi4JqA9m/ehk7F59YO/dk9FG7LyH42rPyNag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JOasb4djaFj7Hw5fAGNC3VzCOl+NDajSU5yzWh4zgl75qI/J/3VoRX76XcCRJmBjncL9U3VdCQvGAxyZU2JG+niUPadFLyvJjGdxGPNeLEKDq+q4n+UxCY5A8PZUqn4hAWlrkQLH3Cg4eiZejlPl7EkNHHDTldhzI37i+bnXx28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vp4wdoGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGaH1GSN; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vp4wdoGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGaH1GSN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP4PO2651489
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 15:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=K+gBuRp8FD/UBbEBBaGmBTx+aseyx2HENXRSUxpGT8M=; b=Vp
	4wdoGtHDDY98/Vd6Qgm8b1obilsjsnu0lnl0hmZd+7svngU1Nc5BVk7Wnc/uCoDg
	0Z6Y49OZyCmYQEBIarpBtD/hYewmD/FokMwtQquc/kIMs8SoUntz97ac9jEpJ6I0
	fxi9jp4yrYRlK2ujvKot/Y6LLkoRoDgpSZcW62BiJa3jbmqjHrnQDlujQtCCf7ho
	FUZR4N30yHYmArdqUY0pwha2tvCP8frLlZnN1PsU58f7Hvox79lvvjNefbHGoctw
	Al3dEUKAvFG/BF8hubF+mpcjMcymtXxBTtTh/lJOz1tVpVro/E+eB5PuEhJOcLL8
	sG5ri/nQVfTvKZBvJrBQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvs30d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 15:24:26 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so2501727b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 08:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791213866; cv=none;
        d=google.com; s=arc-20260327;
        b=dVTsX9+yevrD5HcuunRsXZUSYu1AfFhYggUX3c9LWT1lyg5P0nm1TcUj8JKK3OG3kG
         JojGTNdlrss+CEOWizuS2cKSryCOwn4BzcH//TdG+FQjaf8iDMzIN54FsAyjEtKS/q9O
         lErUg6fcJlSllEmQjWko/HPQtbxtQutpAls3Fizy6be14wrpQrvHC0C1MTDA6FmrR3eL
         bjoPZZQTnquRb85mzdoeFwuhKqahKzEmIkLIa5yslU42BBsuwWKsyRM/HkUxODCY5UkC
         tNs0a+7Iw389ZDXY7Kw3jEEk3hiDk+0RzEsviZ6NBOJkioZlQ7i9z9uD1Nl6MVbRQc0E
         8K3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=K+gBuRp8FD/UBbEBBaGmBTx+aseyx2HENXRSUxpGT8M=;
        fh=PwE3WGzEBhpMqkXJGaOQ65F9bHjmP7sVxISV+V0pJ9Y=;
        b=pDSFLwQI4FI7ortP28ku7w5QfdjI8l5hEW+2WLTfjzuheDf9xg/3rcOIhGJaHwflcJ
         NrPDRh7m4Etrc9yE1cERlNorj6MUNlmSN5VjOh4TxUd8Pg8yz0CLao7qYiFN1N6FOAr5
         s78utIo6aDLPDAlm3Lg99wiRwkjfS+UCW3BBOAF3LmYN7wdUEueH26jYu5AxOrHGL8Yl
         p35kG6ex6QQmW8OYCOySjxzQexp4YjxYxUf4kL8JOR/757RnXBMiqrf8lCUo9mXWh6NN
         hsAcMyUowLEZ52p5to/37wRoms/V7JuCdBVJ5tlf4uGQX02A//J4u2ac+6OabFGC69OD
         chMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791213866; x=1791818666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K+gBuRp8FD/UBbEBBaGmBTx+aseyx2HENXRSUxpGT8M=;
        b=GGaH1GSNdSH1EtAGrp+WoA5Te1FlIwe8gIHKnVPcpzL/qZu2VsMHcW35e2xKYSK1cm
         w3nKFy9aiFE237X5YgJ7selMZ6dY4eWJ8DHsbvqvLfLJ8MXUMVfW6iw3HQT+7fVcoyCT
         aB4UNE/EDYGbGAxKlluv+8QNjscFps228dDomYpmOuMED7Dtt1JbCF1+aJPnTfvDizYY
         6WHH/c8QFtlnC6DuDG3JFdHwRMYvakSTLi01nhGD5Lc2a2MPInExk0HwyK5gSv0M4a9j
         /zg3OOaWkxQVrp/Bpk0yTc6jDf79N3je1J73myXhh3H3f0hrBlfCdZH3GOk1kWbp0YG5
         Syfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213866; x=1791818666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+gBuRp8FD/UBbEBBaGmBTx+aseyx2HENXRSUxpGT8M=;
        b=EYGIG083sgFMN9WFcOmBsG9jBB7nmoMQqbpO93boMZN9bBFhmnhqLamJa0iLOf7sYh
         glZ3l8L3emenlzw3+lNp6X3tqOEmimVddkXD+kE7WfFVBJkbfkKFL3qFbu7be8GLZrMq
         kRPPaFuRdmX+HMIMXFnp4PT21wkTuDd7f5sjGGI/s2pahAYyJ24cF421o6MgbhqFGotX
         AJ4FaP1F5pA4/TFFiH2wowfatQMuMsAsz6wcl0g2KGhdE0hW5gZMcFa/v+uKy2DgafHO
         7cCLlPdS5zPrL03fpooH7CMdLlp3egHwcPUEhvwBcNPHiThpqM47ZJjBKU6ILxcsqLwo
         X5ew==
X-Forwarded-Encrypted: i=1; AKwUvBzpaaYay9zt9cjJxoeMpl9fvymXGWAIo2qK2r99I5TLgMkrDg2mhlhq/gPanL/OWXLr8NgsclB9hgCdQ3w6@vger.kernel.org
X-Gm-Message-State: AFuF++koUqwvaKDC3hRxgo+lwd+sYtgZUypNiISvSrLJItU8mN1q7A7Z
	Hv5E3nrBHgRH5PIkYFCzIv8FBjo3tDNGkEqL4+8pvv0FB0WIvfGkHiXi4dQ1LfysdoYi0iSg5G6
	HtBpKSjcpa2XvHl8WTQsFCIjp/VpveFnoZhvZmYK1bvyu0iyYWCgmHTA9bP9ZXXFrcoUAUjGQFW
	/FZ63N46brVK6IyQa8dpvXEsh88h7vx0GSLEYD2fwiaIdOXMq17jQ=
X-Gm-Gg: AYBFou3WO1ROEXNmTeb9iUl598wQa5b7XEE2ECLmuDVAUnZpprjrBZApkXPi3ROEodC
	CPbcXocfManfIzRyOu4wk3iTYzdNJ9OnIMXOKuoCyHWSMZZelwWeQlxOcZqWtT9jiiLCMrKRBup
	7+7eQn6tO7VL1nAmG35jg6plquOSZPPrLlMj1ZrQJEZYvLCGqKumSY/xZZ
X-Received: by 2002:a05:6809:2011:20b0:4f8:4ec9:b170 with SMTP id 5614622812f47-4f84ec9b327mr2603591b6e.2.1791213866035;
        Mon, 05 Oct 2026 08:24:26 -0700 (PDT)
X-Received: by 2002:a05:6809:2011:20b0:4f8:4ec9:b170 with SMTP id
 5614622812f47-4f84ec9b327mr2603566b6e.2.1791213865417; Mon, 05 Oct 2026
 08:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
 <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com> <CA+KF4bJSyuhB4OGDU-31riOMZK+4ubtLSPpTf8qgkW3pt6nXrA@mail.gmail.com>
In-Reply-To: <CA+KF4bJSyuhB4OGDU-31riOMZK+4ubtLSPpTf8qgkW3pt6nXrA@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:24:13 -0700
X-Gm-Features: AclHuK-mmsEZaxj_x6teheAh1It8QjlccHsJuxFTdfftJBrzQnwwKcoa3Lw1lPo
Message-ID: <CACSVV01JuE85VnNm8rmTo7b2YOCLWZKkW4n3RCXm7P3cY3GO2A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
To: Roman <roman.demidov.nn@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3c12a cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HH5vDtPzAAAA:8
 a=zCo_tC22IKUfHdO8KQgA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: Gwz89sLRKek1ErHWxIhGXZwuZG4Zj6tH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX6NBRuXD2H4y6
 mbkvo/Wx5iWPqnEFVOFKlaHeFeeeUBGmlHBCTYbMVsog6tNjILjDlPyYLAjJhbbf7GFbt2N3HJK
 ttstsUVhtHD3izdbeH+dTHglKwOgBKNuYfTfDX76auFG6eQGAO6EXiCjmfxxgKVZFj+dMlTq8kz
 GE3m11PfJ3TIQouznLqoFMxRTanvycDOwe8njt8iVZ74uYEBjzjC+Wn0GDq9f/0QRKFyZj9239n
 iCxo5US9/52aVC1sVSsZ4YTYKY0W1/Eyw4BCCYluugIQdEA2fYz/+Gfi78J5rzCwxpfij4rOzRb
 dtJRquuN+nuI37F1aVNNpbuZcblVAGRDLGkVieI4lfCrXalEiVQWkd0sUvpQ6/Ev8ZsDjFIPOh9
 o6rm2ZfXCemN88Sca/jYRFL6IEGY+LsiG+uvq9wUVqsODS++oj7CHPTU1SXGq/RVI74knifYr6d
 yaHhlUBv9n4szLYNAmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX324xSCcHdstF
 Avyq5xer7vMCfuCYWcYdI82V+wlCCD+hKc7zKVXL1SxOmNOAViIkJbzM/2AgbNyB4Ul76FZiqV4
 xfzVmy+3O2EHDWoG03tBRgZvf1ZC7a0=
X-Proofpoint-ORIG-GUID: Gwz89sLRKek1ErHWxIhGXZwuZG4Zj6tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060

On Tue, Sep 29, 2026 at 2:29=E2=80=AFAM Roman <roman.demidov.nn@gmail.com> =
wrote:
>
> Hi Rob,
>
> Thanks. I did consider guard/cleanup here.
>
> A plain guard(mutex)(&a6xx_gpu->gmu.lock) would remove the manual
> unlock/err_unlock, but it would also keep gmu.lock held until the
> function returns, i.e. across msm_devfreq_resume() and
> a6xx_llc_activate(). The current code drops the lock before those calls,
> and I didn't want to change that as part of this fix.
>
> scoped_guard() can preserve the original lock scope, but the error paths
> still need to unwind the PM refs and clear the OPP in the right order.
> Doing that with labels inside the scoped block and a success label
> outside ends up more convoluted than the current linear unwind. We'd
> still have goto, just with extra nesting/state.
>
> I also considered PM_RUNTIME_ACQUIRE(). The auto-cleanup for
> pm_runtime_put() is nice, but it doesn't remove the goto-based unwind
> for the clk_bulk_prepare_enable() failures. If the GPU clock enable or
> GMU clock enable fails, we still need to unwind the previously enabled
> clocks, clear the OPP, and drop the mutex. So we'd still need a goto.
>
> That said, if you'd prefer I switch the two pm_runtime_resume_and_get()
> calls to PM_RUNTIME_ACQUIRE() and keep the explicit clock/OPP unwind, I
> can send a v2. Or I can respin with guard(mutex) if holding the lock
> across those calls is acceptable.

Ahh, right, holding the lock across devfreq call would be bad.  So
disregard my suggestion, I think it turns into a bit more of a
refactor than what I had in mind.

BR,
-R

> BR,
> Roman
>
> =D1=81=D0=B1, 12 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 04=
:55, Rob Clark <rob.clark@oss.qualcomm.com>:
> >
> > On Fri, Sep 4, 2026 at 5:58=E2=80=AFAM Roman Demidov <roman.demidov.nn@=
gmail.com> wrote:
> > >
> > > The return values of pm_runtime_resume_and_get() calls in a6xx_pm_res=
ume()
> > > are not checked, which can lead to hardware access on suspended devic=
es
> > > and PM reference underflows.
> > >
> > > Fix this by checking the return value of each pm_runtime_resume_and_g=
et()
> > > call and properly unwinding the previously acquired resources on fail=
ure.
> > >
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > >
> > > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > > Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++----------=
--
> > >  1 file changed, 21 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> > > index f9de9329dee3..0cf205ea744b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu=
)
> > >         opp =3D dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> > >         if (IS_ERR(opp)) {
> > >                 ret =3D PTR_ERR(opp);
> > > -               goto err_set_opp;
> > > +               goto err_unlock;
> > >         }
> > >         dev_pm_opp_put(opp);
> > >
> > >         /* Set the core clock and bus bw, having VDD scaling in mind =
*/
> > >         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> > >
> > > -       pm_runtime_resume_and_get(gmu->dev);
> > > -       pm_runtime_resume_and_get(gmu->gxpd);
> > > +       ret =3D pm_runtime_resume_and_get(gmu->dev);
> > > +       if (ret < 0)
> > > +               goto err_opp_clear;
> > > +       ret =3D pm_runtime_resume_and_get(gmu->gxpd);
> > > +       if (ret < 0)
> > > +               goto err_put_dev;
> > >
> > >         ret =3D clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks=
);
> > >         if (ret)
> > > -               goto err_bulk_clk;
> > > +               goto err_put_gxpd;
> > >
> > >         ret =3D clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
> > >         if (ret) {
> > >                 clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_c=
lks);
> > > -               goto err_bulk_clk;
> > > +               goto err_put_gxpd;
> > >         }
> > >
> > >         if (adreno_is_a619_holi(adreno_gpu))
> > >                 a6xx_sptprac_enable(gmu);
> > >
> > > -       /* If anything goes south, tear the GPU down piece by piece..=
 */
> > > -       if (ret) {
> > > -err_bulk_clk:
> > > -               pm_runtime_put(gmu->gxpd);
> > > -               pm_runtime_put(gmu->dev);
> > > -               dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > > -       }
> > > -err_set_opp:
> > >         mutex_unlock(&a6xx_gpu->gmu.lock);
> > > +       msm_devfreq_resume(gpu);
> > > +       a6xx_llc_activate(a6xx_gpu);
> > >
> > > -       if (!ret) {
> > > -               msm_devfreq_resume(gpu);
> > > -               a6xx_llc_activate(a6xx_gpu);
> > > -       }
> > > +       return 0;
> > >
> > > +       /* If anything goes south, tear the GPU down piece by piece..=
 */
> > > +err_put_gxpd:
> > > +       pm_runtime_put(gmu->gxpd);
> > > +err_put_dev:
> > > +       pm_runtime_put(gmu->dev);
> > > +err_opp_clear:
> > > +       dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > > +err_unlock:
> > > +       mutex_unlock(&a6xx_gpu->gmu.lock);
> >
> > this does at least look a bit less terrifying than what came before...
> > but maybe
> >
> >    guard(mutex)(&a6xx_gpu->gmu.lock);
> >
> > to simplify the locking part of this.  And I think at least some of
> > the runpm stuff could also be handled w/ guard/cleanup stuff?
> >
> > BR,
> > -R
> >
> > >         return ret;
> > >  }
> > >
> > > --
> > > 2.53.0
> > >
