Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561753;
	b=0skGFxWf9FJl3zJPJuBHKt6DcC18gEyYGOdA2xmCYL1gHPbyLqGyml/9xkYV8p7ArX4z
	 K1aJ8s1hNjyWPpI0b9e9QOmlY4bI+KyeogCH8PBss9r8HN1/LKdn1Tx+rmwB50y5FDsQh
	 c3CbXxvNBh8/R36lLzl6ro/TO7EEQH6kb1iSvnJcUriMmg/B9uEMP5hvzaoVT+TuO1Agu
	 jh2HeqUntyBZ1wyWM0izcFmxG6dA30dIwSbSLaiLhoHhZL3CqMGVXPRVX/60IcJcqDMox
	 gyf49B4uQa7TuYV5FKiwhv68Lr0oPxsW5AcN9JeIo1ZhLmPc9klx4ZiUjIyMhhTZFyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
	b=wceeJKx3W+cMQO8ifG+7kOWfY8zG9ohUwQVS2rfjMOO276z9Eg0Z0ZejSyIN0ILtbSRp
	 UadvqAuqdPI3pepae7QmDxoYp0sFPbgF3Kuj5ovw0aF4nxVcNHaHI+6XIoZGzl/gAUntp
	 vaOOJt3dl97dn5h2sHc2hPtiA3BiFnb8/VXWQxU5IykHs/xAQFeOW2XJF8NupyK4K4HoP
	 rTCsQMDIEfFRye5+iHTrhvNLlwAWVkshE0VUNSeFF53cCYdduOeFQxMvjh63jH2blgR3p
	 RxdxabSoTFbsM5NJIvTDEV9H+xjw20aKYmzwnkl5sEbmVi/r6D+ve6hM5Ih0US2YRDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMHfKpMQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CC606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMHfKpMQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j4OL248165
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=; b=WFKeXP7hTU7Qcmnx
	vSn8aoIPInIUlpFHSb6EP5or3x5IU8slSvFDU76IPfKvtA9t+VYSMTaPmc0kg123
	ruD23M9fCx01FhJ7RErYE+ij5FRr/z3GmoXZONnmGO1KfR5F+wop00b2PsyAHvSV
	4zkVK+DawGwjCJECk5+k5RjvQsdGrVO85IfhA2y0cgV0wr3GFEeGLDhBuy1eK5wY
	nx6na3l0gjNrEUgcF4JGihLMBFQSF2F5G4FO1bPcavA7JJqO8hok+p9M4fUuWb9J
	ERn9LSxq3EdKBbbXLaAg50sV4BZB3bFcVgcVMiUUFaO3xeSGHsZlmKRpupCjyXNs
	ksEiTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajj6qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0589ff620so268864b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561751; x=1793166551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=PMHfKpMQY4k9oE314192rW2EYYsIadp/ow5kYA7BYqq5oGt9yzxo09bReqCF996Csp
         H3yPWFGufQCwODVGAdOhTmZG2tYQ26GjcNPXDcChwoP0h0yE+3ONuZV/M2kwNjqC1YP3
         DP+CtPOTyeku5GAAXonhCv07qTTMgRyUyk7vwvZcdF+xPbEcwSI8iiPYKUKLqj//2Fcy
         7G3/M0ArT6ALv7ZTdxNgf8n9BF9WIGbhg3UlUbgMrEdkV3jZgWOm+hcqA+ZIJYTsewOj
         24d165pmNm/U9RgHcl2AumZ/aEIcUv8plQFnCMBp3jqfIgBnwwhWJP6D2/bI3kRRrI4O
         mB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561751; x=1793166551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=MvHYPJCT/M+NH4hdDdaox8X0YhugHFRaSQfCfbwAo/kvnadrPlGjgv4P0eK+i/nnho
         6bR+PYJgzRrx7hLcGXEYDyf4EXZfZBG1AMEaT5Tn84DLCQkAouloY7dN8GwTYEyMzJ0a
         ieOwcDm/efOrvnoTnTENwzr9czjQCbTbHe3bO4BCftJOkW/EQOOBzwulpYZeJ5+5dFKq
         gQzR8QfIeZGND55PT9CH9a3srzbw/f+514b7YuQ4lcVKgMgU3kMcwAdzpRIfUk4aVJW1
         3zPiqM6klx8pAk5xD70QM4KTPgzECXFz392CIcqXNqzA1d0505B4tR/8+KLXSIJAenhu
         u4bA==
X-Forwarded-Encrypted: i=1; AKwUvBx1SmWWgwOPl5iJrfLODZiLDWEs44LYRNnY/7Yy/cYbYsL2cES3C7InktGku9CY59BwZKBOeddM73Zh2P5f@vger.kernel.org
X-Gm-Message-State: AFq9FYIzDA6SHLDHSa9LsSWEiIilGFSN/Cp1f3mEEfeIvuy2+INgiKR/
	Pew28sDoY8Vieecbh7I6W73K29APG2/OApeev6OTwmxQ4z0w77497CURtLeJ6qq3zqzWz2Dh22t
	fNrDRIWY2AtxaUZReivVf+YEMoe1P47iy/KZ/qpF6Q94f4eauu4jKp0isRLcgREkR5A2x
X-Gm-Gg: AYBFou0lpbSRndArbQkynuhpKYwPYSVRAK7lD/tsORzKaGEoU0SmKB327myNzksR2e0
	tqYlAOi9X7ilXzwB0m7+99i0vM4FM8pIT9iOvztn3leek3ncE4pfRoXne029AxQvMwLRnGOsgZI
	1vgniaGUV6xbIUrVmahYZK3VPZkhDMXGodHh/Wlbco4HPrNHEAz7+0WZaA30mlF2ztoxUVd78ql
	o6rr8RW8ybiI1dcHMcUbmt7hXA13KRC/Aj003Cicz5TfpmfN9At25VkBlNpPffXgPbCUMLnhVfh
	hd+uApkpn/O5si3vAlmrvFAboGJG58uK+YRYUY9gdrxR60c/1oO+AaZu9opIY7d7Bxn24F2B0AQ
	bWBIwo4zIJhmBolespblo3qA/
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773626b3a.25.1792561751028;
        Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773611b3a.25.1792561750583;
        Tue, 20 Oct 2026 22:49:10 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49c6sm415288b3a.17.2026.10.20.22.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:49:09 -0700 (PDT)
Message-ID: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:01 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>, Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
 <179248663855.32151.9955864156939592299@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <179248663855.32151.9955864156939592299@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX/OLt8j+vFtWY
 9ZWE6rIGDADawWlf1hk8wCA4vS1FTu8yfkiYg8iG3j/PnbSTPcO6fyAgFF2wNoa6dytVRAio4iY
 aHNE5Wqm1dp6144p6QePsAx6dBUfeDIHpeUI/5bVyRxwgkIIzM2mQr8KTp59QFahc/DgopElQbx
 RRVjHf+Zh90MO7lD1RC6lYk1alx/MDGnS/3dBRgQBMmur35fpSmAzo7Pj3JcQcAeedkNWu2ZlLG
 N0wd9sG4J2AIgXM+Cllwq1wpUPBDljSJVwU8WTRsuO7pIfSrehy7fL4UA0cddFL5qE0/FhXkHAG
 NcVh9TOwuKIok+/khunZnhe3i1I98WBIlqj0IsXtpq4zRZx7qEERpLmiv7meRkHusdWPOLENriU
 mB3EFA4CKvR9MufQTLvlDbKwnhrGg7FwYln3G7S1uMY0dEJSdyhuOH/TmMqgZxl39oJDxxdvSM8
 Yxv24mztrgoGpNZlsVw==
X-Proofpoint-GUID: cyqy9RkqbCaoSjVdaSOxKP8MUgpTDL2D
X-Proofpoint-ORIG-GUID: cyqy9RkqbCaoSjVdaSOxKP8MUgpTDL2D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXzqes3y8tlPxV
 zrNYckxzX0THyWo4BTqovuh/tlQhGVL6i5f3Fz1DMU5I2hwyhtbBywotY8/8Dc1q+DUu9havAH/
 jdSJ8iTK+tUXpNsGU+aTBRH3Rrsvtfg=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad85258 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cjh-xzagbiWEAgRDvXgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022



On 10/20/2026 2:27 PM, Oleg Keri wrote:
> I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
> firmware built in, so the GMU comes up at 0.6 s.
> 
> It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
> vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
> of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
> -> rpmhpd_power_on), and from that point both rails are stuck at max until
> rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
> calibration on a rail that won't move.
> 
> The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
> boot matches the first good one step for step up to the ninth level. There
> it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
> "ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
> simply the next message we send.
> 
> With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
> 0.6 s just works, CLX tables included. Three boots so far.
> 
> The wedged GMU after a failed attempt is a different story. Retries after
> rpmhpd's sync_state still die with "GMU firmware initialization timed out"
> until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
> what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
> recovery, not the cause.
> 
> The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
> code and TCS slots on its own; preloading them before the first boot made
> no difference.
> 
> Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
> something keeps gfx.lvl high on the CRD after sync_state. Could be a second
> problem.
> 
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
> -	if (pd->state_synced) {
> +	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
>  		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
>  	} else {
>  		/* Clamp to highest corner if sync_state hasn't happened */
> 

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Could you please send this out as a fix for v7.4? I will respin the gmu driver series and revert this
bit there. But that would be v7.5 stuff.

-Akhil.

> Oleg

