Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A114BC01A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966651; cv=pass; b=rerR6SiptmxFnG58O70J3vLs4Zr1PLFwGJ76sbRgrCWURvXtctnXS4GuYYhYNocw6lPCU4Q/dxpMqiF4nRbm3xbMHKrUcLJaAfVETgUSXBgzs2SSm5xBiZ+0R1/TLbWOzM04VhiytbM1T1PXYHe1I9R5GepAps8kGALG+7TUtHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966651; c=relaxed/simple;
	bh=uZkHDYTWWzJ9X5F+4Um7wb6CzaA/5jQIh7w7jPBSWI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZEAhRiE5xMFf55KuRWh700ApDyxSqHiL4N/30aVcE0XW0GggljQvb2vt+J7aCgs8Bw68uv0JeAAx4j9gCcomZej8fzfEv2NhjXbWf4wNFcW+W53rPB4gYpvn+AI+uHWjEnWO1ydy8pa29nW8/iAoBery916YwVtVwLOVOe6DqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtSL754p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6sIfZv3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtSL754p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6sIfZv3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692HYBZL2174686
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 18:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=; b=Lt
	SL754pESNV29m2MosTwDEM4lQEE7sfWr0ssqW+SEAz3hgIRe9p1nG88sPKmvXw2K
	SQkyWumfGRpafbwwxqCDMst3fSlZG1kpHelJujTJIidpHpOt5149w12mUYO9hRz/
	FWJzrxsPSqyJQg+dvzhCI4IY3tz6nd0YmOYNUsEb1fP2Si80692TsxBREVPIznH7
	lWTyV+Kyc7q0kcV6wztMhspOFwEJsIG64asbozq+Wb5ye0+s+4d9lwTpqBbUt4oX
	wBjc77tIsTvMp5ny49II/EZwUKh6NH6xVc7j8Ot/1RGmNaivNrhossfeHGHaLCQw
	1RT6ynU7DMGBhgZSRTXA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4kr9t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 18:44:08 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-806004ec379so381611a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 11:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790966648; cv=none;
        d=google.com; s=arc-20260327;
        b=O1/wglzhC+QJlOLjvZIRVr1SRt2oAjV23zsDNWStNHjAFTDV/pKYjKqS0/MafGlwwf
         vrXuSXgutt3nOCvx503FTOrWAF6dNbOuEUHq/pgj3FTk/MupzQoce0y811Wya+pVomoU
         B7MYdT4e9DmUl1gV6kMe0SHJF1/2LQyPuvUmq7q5KrwsUZgf9f7XHY3NKNkQZm8hn0GZ
         gKZbdk8T+eRX+WGKyJaQ8sbQOUOHNjUB8mogKiImy9+qZdYjyszdSvYnsWJ+AYDK+pJD
         D1r5E/LhW47EY7QwrTNwRtloCWSmO1/zaOPUMLjs62LKCGO7cgQxILod/URCwyMcKz9a
         kFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        fh=MxoLtxOP29Rs4yx6Zol6MMvFDxZy0VzYGmcuyY9FDr4=;
        b=dx5eNnN7OnGXrKz0qz3YshjvFQL3uDyzQ+4/U0c9V/knDV1R1AIFoKi/l8cxzFwh9y
         A+HtyRjJsse5dHx8I8VT3EmjzIBw1m/K5bVAb4dTMnOguUsAunH1KP45AMhoq6mNGQUw
         c20VfYaWa3L/dJopOmCHuNkQU3GEj6PWTkZrdIKKs5g0qG0sdKTZQsrIBwMTIx9mY35j
         /qnESd0weUbgPv6VQ6XHxnv7x86Wb5ud0rpMd6v6S8obhKTyT91Ag2hq2/aoYYpNBhbn
         uUvpexTCIUisKfSkjSWWMHL4QdS+84HNhbkcN0BSpMTlXFtDAJ1AAbZ7yypdvIA0BqKy
         X0jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790966648; x=1791571448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        b=L6sIfZv3LUqqgBfd0ywiSmGJp1S8fmCyocp14Q4rKxKTcfxP/I+QiYTyHrGTsznhgr
         djiqgvzXPDzdWCTts6gHExZ/2Q4OzN+3eYtSDMRDsZI0od0e8M8GDFmgyamlYA5L24AL
         CVakFnlNSqAYPA8tZr/Fz+nQk3qCUaBw1Z7NsUR2IQ4F6JBfOGkP1ycBvuj0/kqKteuX
         k7jUsRAnQGYmE+eKCT9KeWtV9dsUBVeXICp0Cj7NpcmNFRo9X8LpYGBzoB+ISTzKXGnw
         HWMt0bY2VLX9SxY85K7ufds6urNUzoJeozswZ5UDpQj3G2JtAk5MrnEZJ82oab8195bc
         RvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790966648; x=1791571448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        b=NWIKfcjP4H7I81A49khyqeZRwigcho9CyCAGIu9GzkRsqqLCwM2vb2GaUzENhSx1aI
         sjk7MPDZi1T/0PHeutRAP8eu/qi2S3HHzjtYmUKZos3h7wuWh4CrTZ3jfDvvGx8u2C+x
         5VNISHX7skLkDFJm2F7gnOWLLt/Ia3UUT3F/MxQjfCtfxmJk51jXKLSuszOMoCZwz9ne
         M7KF8wlmQDI7wDomsVboVAigjfvpaOI/APWhrQDOEPz6Fs9TpnYs3ooNnFfJKaOIMRB2
         Gjdyye5v1RGvmJENE5Dh2rv786p+jwFYWIpb5viEFmfItnqlxYit+82sSHpip1vO3rU8
         13xg==
X-Forwarded-Encrypted: i=1; AKwUvBwvN07NsVjjC/khxNfoTxRoI3fdcW9PoqtqJbAkrgqtJfCW9rqPhpj+IiYbrMjX3tUgMS+vd50HkcDqweDP@vger.kernel.org
X-Gm-Message-State: AFuF++kmT3n1KldDJVlhwNpllbnp/wtJuD6iYS5jNzORyzJrCnu+iNBi
	RYwETK9FHEnHqJMvjTnPPh+5SOHkONf7hpyMTezTg5oB8cfm7ryXuIzUd0XpExXNm6R8uFydxYP
	Kokldy5AAw6syOSOHDV12r/TgYEHX7yMPDBB3FQOKeBRPS6MsfcwoN6Tx09aq2B25PPF5/P6hh4
	oJT5L7BNWM2Nb9WUPhELujCE3fDacPOuuWbzz8ly1U1oo=
X-Gm-Gg: AYBFou3w9UOTxbllLoRuWWHzv4cgNC97MkM4UsuAR2xSnj1wAvLJ31rm2GsN6OtaSiy
	pzi136wJsgEWZSiN3AelCQx3iIHwsK152mpQFKzCebnD3d+Ettp4xvNEyAIOoGp0+HF5ARLIJtg
	Vib7qIitw5MetererzlAUdrkF6+r4XJd/6EbSMuqgivx6TXF0A/MYFiThC
X-Received: by 2002:a05:6820:207:b0:6d8:d3d:de6a with SMTP id 006d021491bc7-6df35c3999dmr2503460eaf.73.1790966647911;
        Fri, 02 Oct 2026 11:44:07 -0700 (PDT)
X-Received: by 2002:a05:6820:207:b0:6d8:d3d:de6a with SMTP id
 006d021491bc7-6df35c3999dmr2503443eaf.73.1790966647508; Fri, 02 Oct 2026
 11:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
 <179096555582.4050.16689195326008531646@gmail.com>
In-Reply-To: <179096555582.4050.16689195326008531646@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:43:56 -0700
X-Gm-Features: AclHuK_1A84ea1UaaxIckCd9ugOaiHEjc7V1vuwTcIvjWzRFw0FRu-Vm12FS3cA
Message-ID: <CACSVV01iV3g4uZ9WnVFuOMEiqdQcOudXXr39+5m8yE0XqC7X1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6abffb78 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=j9aERBNnXM6nCbgg6pwA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: V4-aaMCPqTyYsVIV2A0hUY0nbEd-Jt77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfX79peHeFShZts
 HIpFP6vhDyOv256Lsz/NBabyxI1mkTY3XT7FJs1oJ3a6ErfNiN0Xqo5nxtquxF83+jw0pEajo4c
 hGm3zH12EFAoJJeQM+8Gow8n+rHyRoNz19FSSP788qdcB7nmVKXqVyqEOdlja+KqRYhVdx/gY4+
 WIURLdI7XzitG41ihhInY0EKAf4j5fRWQFmyi5rlC2PTUOo/cZJZN+8mWlU3hxw9rOcmEASG47N
 Arch7NYUmzCBk10GDIyfy4eBvM3/jjCyPcDERXgHGq8IGjDK2OA6wgc4vEmvKd8NCJKVbvCu+TX
 XZjXEMxcEYvzvpjA9DzYRqI33jWaurdwJ0krnNCqsytvRPNxXvThnkearsiBL3LEUlAYSH/SU89
 BoS6fZHoaGIhe3640Y9FRjGvnYGsvmgvAIZTwj8Sarxd8ViFvTfThnMTR+B2/qq/TF8csxaX2NM
 A1bTMxvkkyISB5B9TaQ==
X-Proofpoint-GUID: V4-aaMCPqTyYsVIV2A0hUY0nbEd-Jt77
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfX7MmYhQMaEnDn
 Ov0mq0dRBgB4uxJ1ckbaDF2nSyFpTD68rQiXgMIgILiq1SliYcy/pxk0jgLbwXii+1ku32bfqnS
 1LdYDByVS5N9xJRMZkcqRblctgdQPIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020074

On Fri, Oct 2, 2026 at 11:29=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> On Fri, Oct 02, 2026, Rob Clark wrote:
> > Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
> > so gpu is initialized later, I guess when the compositor starts.
>
> Here it is. The kernel is built without modules and with the firmware
> built in, so the GPU is brought up right at boot. The GMU firmware is
> gen80100_gmu.bin from linux-firmware (v5.2.38).
>
> [    0.620358] msm_dpu ae01000.display-controller: [drm] Using Transparen=
t Hugepage
> [    0.621120] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0xc002000=
0
> [    0.625910] [drm] Initialized msm 1.13.0 for ae01000.display-controlle=
r on minor 0
> [    0.626015] msm_dpu ae01000.display-controller: [drm:adreno_request_fw=
] loaded qcom/gen80100_sqe.fw from new location
> [    0.626115] msm_dpu ae01000.display-controller: [drm:adreno_request_fw=
] loaded qcom/gen80100_gmu.bin from new location
> [    0.626994] [drm] Loaded GMU firmware v5.2.38
> [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt=
] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for r=
esponse
> [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* gpu hw init failed: -110
> [    1.652389] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.652401] platform 3d6c000.gmu: [drm:a6xx_hfi_stop] *ERROR* HFI queu=
e 2 is not empty
> [    1.858322] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb fr=
ame buffer device
> [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
> [    8.187443] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.187650] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
>

Ok, now it would be interesting to compare the same from Bjorn's CRD
vs zenbook..

BR,
-R
