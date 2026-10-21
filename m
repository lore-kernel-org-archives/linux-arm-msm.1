Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601977;
	b=HtRYqxAMgGbgzTDU3Ao+DokgTDMH6Ra+h86rHUJsAk7WFbL1ODPvuStzC7M88DTdu8ym
	 vNBEn212J2HOBoZR8Tuo5nxqG7J1iGPvco3aQWlMumxVjV8NCp19c+3XdLVrXdEaL3HYk
	 JoErECuuANT6HB1us2jPPiQ/xZ53IJ6o11kak961NoyiIU2VFo+KZMmKPguXWdX/T6hIu
	 YW2UPzuEy4o0ccwBuvWce9lVIqXyyfvEgNiUZMLXzuyEIK8tDFF5Fp8fNEWMjX9lGi68W
	 Au0SymM5wkEEqxoUppK7Z4U0+DJNk8Y9ggva9EcOjVZ/rVvOp2CGXX10K4CEyAkSy/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
	b=hnpVuwfVrJavILJWh61sM0Y83U8YfqkDiBpvympdAqbhUuwA9/T5fcMjeYy2gxQ7BSBq
	 88bzxo97wve7YAxgEiKsbSKTmrcjCwd128IaLBe/L0N/1Eal7ZIWJYc5sWkHs2FTVmh7J
	 fqFC4mjA6anI2kYAsvI+ckmNcZR7ien8WTTUvl1jNHsZXC9bsSLK/OB4fElWjhENat2iF
	 kcgaknybf8y2+CIE87PSdeFevbfsSzxHjyq1NHYHR9y5ybYpT911hMR85jJMG0s3Lzs8G
	 9wXMua+ZeDSC2zSywADzqBipvIw9vul0Wls2moKErwGGxBZDlweUbVfx2RgtheP2Kkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dnASCy/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkIrAuGl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34B606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F34B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnASCy/7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkIrAuGl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU53G3727264
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvpaENdKCnnkQmf53UEghOPi
	myZ9+7YOOkdrXXfDg88=; b=dnASCy/7EH0UDeGsa0W7Ssi91Z3ZvpExgD2rNKUR
	I0RbWjFoJgqR6Bogy6MgisEdQTYfTplJhVR9M+o3ggRfQEHqg/29sHPQdpirdN8V
	wImMxzTTWfcsxwMqsn7+au6uM+taaAPXPAumj9+97Bw8cT02VvgKtMq0y+VLlU/j
	cygHY4qBl4uxsitNV3j2tRz5d99UMlJbMB0vOjegHpjAaRvzSAJr/qyZdh9QGg6H
	VuAuHo7MhJyaOZDGDjqBPSXhXh6YinFLskGJ44c4rRyekLV+GS7RuDcoZPrDpr1b
	m3TVEgGwlbSHoxXP+rLt7AJa2h0TCuOkU4fEx1NqyiVvTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7a72y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:59:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so166110185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601975; x=1793206775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
        b=jkIrAuGlMpx0PcU2czvYPbcb+vQSPzeBXEK4FLb60DmYyvIK5LT0x7BEc3nIM1zzOT
         bIGmiyZpNxYwKJoZWanA+xux3kglo5tcA4mHb54fXpN5JjyxkxAybG30NWe/dVFg0JMQ
         GaQ49KPBDurl1uhddTK7SvC7HvSUntHcVUJXr9H61HYMvO5rIWfhRhVgp7SBL5JRf1n9
         3RsbM1pUZm6egIH9zSjAeiC6grZDdy/7YLu5gA8K3QhFXUGMzyZZS3cYgayYBaTtGr4b
         U415G5pupHKO1ddve32rqEH0j+VCGjWSch+e2POCNTqkm/7vbs8g6Stb5a6JFFD4I5GK
         EY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601975; x=1793206775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvpaENdKCnnkQmf53UEghOPimyZ9+7YOOkdrXXfDg88=;
        b=eBLQKHzMLPJKgsKkUEEdgzKwHmyFxu/bfi3RrClnN2q/VtXkWZaceLSW/rWr1hXTL5
         e2jQL1L/yljAEp/iO60W5HfsEB88dnEnF2TlNApJHQSn2nzvaXgqCg/yuF9KaGFA943B
         GfI6cA4+5JTqL/gE0ltmpuJ65+Tyin8Fxto4KzTqVw4iIu7ymmRKP1rl8wywWXSQVOhx
         owpKRybk0OgvT7loqnFlJQcDj5XApOnwmBrpRNczF1FVyTBJAvDSnvJketFUH553Qxto
         eFoPciaxqtjROse2KSDrLbPeMVBjnS/MbI3Lnj0gKa53XU69L4bDsKE57mYcRnioJ9uz
         P8Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwZfCkt1tVX4JsUQazxjcRTfE88NTpQ4FrcrTuulm6ITFZ10gvcEHXvsfDUTWXyVO37W/Rqyed77U4P92kb@vger.kernel.org
X-Gm-Message-State: AFq9FYJhdsL+v9fL7JY8YIcfmiVqaH1Czyrqwr87qWiDbUpU26hmOk0m
	yvdEkbeDkJhaSTTJnVq0ahZkeRqGuv1L1dbbQxdDCC9zihqZqrqwsm12wVgUN1SU8W9B8EbaLKC
	l3b9PuYPpVk30KpVV82uP6oZdNTxbc6FyAs7baNK80dBBTzZGA4GU4dmCOMu+lUN3/bHB
X-Gm-Gg: AYBFou3p721yuMfgjtoGEy54LiXFnKwW4ubMkdixoJluhITdGjLFudBlDz19/VejlRm
	/M678G9RHu75IAvkY9kvKRBRFWUCK8MWhYDx7gs2SKgNwa9C0FF8EyqNppfdCAsU+GWbh6CBKTg
	M6gM2OFA5DdyVEcaae9Yz1Y63iwXjiDh1HsmMBQOi2s/KWjIMGQ1nXqQ+w15wOUVUpV2QJhTVmS
	kNcKJdXGwD1Jmqx8uJtJ9Gp99wYKCbFnsUsC2pXF5YsS3x2ageWfsGI6wMV2jxGPIFNBi6EZkVB
	pFGw6hLCJ3/11GPedbUeVeYvygsvGJPVjNSQIQhzODQ7SOzOy/jHuEQnhs5r5RwnJMJs3C7nfdB
	FgR502mPZObNegyUugwoxykBNaOFrNV2w+Wi2M6MXwJZGOpDp2u996QbhJ2kqR+v8yYmlLpz6c5
	53QV4MAAWoz8UZ
X-Received: by 2002:a05:620a:4443:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93f57f06a3emr520455985a.2.1792601975230;
        Wed, 21 Oct 2026 09:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93f57f06a3emr520451485a.2.1792601974583;
        Wed, 21 Oct 2026 09:59:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1233f91sm627678e87.72.2026.10.21.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:59:33 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:59:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
Message-ID: <rbbosxqd6dverme4gr4lzcsj3cjbrxioxxrrkjbn27gj6a6ag4@7ajznwvses2h>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
X-Proofpoint-GUID: EBVh2z0SYB-Afu0KP6rAV-XPWfGo-5om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXxTjMR0r6UGt/
 LHnQDoOY20BEpTheZzIeRoHoe6J1RBbpbF6LfK7P6sgEUJReIqCII83QwVdLogaw3axt5ArLuBD
 23x8Y14BED0X8x48cveZyDSP6VixbmYhvE8V1gVOf4advQkwyhUiN9Hy+kuOhlgJfunNUfGV6iD
 JsFd/2cCPR5PaLiMDJpHNyhCclh2Oce/cMOcq/E7jVOUMrBHOaH71O7PvIuqRRzjnRhB8asHBFh
 FeU72uDVXCpTHln3azIo4bxGKjbgk1jE8aWDjOWqgf/7CXLw3LaIMn0b+zJCkOI41iFJFHTn0d6
 yCe48Xvtw5kNC5MR1UrH2CI705h/cKb75Elu5xxAVqM0lRNp104fLfCJoO6nb6bbA7BAfTe8Sgd
 rR+27HVCYwXtRwpWYj1V707MCtnxwu0ghaizSi3cKb+UltEKaO3w2hL9sqBQed6haB0kC1+S0TR
 d5qu9AmLVgs9WjGoqKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX0cqaxE5nc5tx
 ctwzlWRyJKi0y6LYiKKSHTeo1xtNbn/XXqBeSqpYalBfsIqdgSruitEf0a/k4NG/hMdp2FIMsbr
 o459IvplIkXMnb1TkVEkdU6bHXx/UPE=
X-Proofpoint-ORIG-GUID: EBVh2z0SYB-Afu0KP6rAV-XPWfGo-5om
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8ef78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0XkAg80coZZ_RUxBgWAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Mon, Oct 19, 2026 at 11:05:08PM -0300, Fabricio Akio wrote:
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
> well. A GPU resumed with GX still on keeps its state, and the CP keeps
> its ringbuffer read pointer. a5xx_hw_init() then rewinds the ringbuffer
> and writes CP_ME_INIT at its start, while the CP goes on from its old
> position, executes stale ringbuffer contents and hangs:
> 
>   timeout waiting to drain ringbuffer 0 rptr/wptr = 23/C
> 
> Soft reset the GPU in a5xx_pm_resume() once it is powered, so that
> every resume starts from the reset state. The downstream driver resets
> only when it finds the GPU's power left on; resetting a GPU that was
> powered off changes nothing, and on A508 the reset takes about 2 us of
> a resume of about 1.5 ms, so do it every time.
> 
> The reset also clears the busy counter, which msm_gpu_pm_resume() has
> just sampled as devfreq's baseline. Take the baseline again after the
> reset, or the next devfreq poll subtracts the old count from the new
> one, wraps, and sets the GPU to its top frequency.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Changes in v2:
> - Take devfreq's busy-cycle baseline again after the reset, which
>   clears the busy counter (Sashiko)
> 
> Tested on A508 only; the reset runs on every A5xx.
> 
> A stall with the same signature, the CP's read pointer past the write
> pointer just after CP_ME_INIT, was reported on an A509:
> https://lore.kernel.org/linux-arm-msm/20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org/
> This may be the root cause of the A509 stall Paul Sajna reported there.
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 17 +++++++++++++++++
>  3 files changed, 33 insertions(+)
> 

This matches the issue I had on MSM8998. For now it's:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll update this with the T-B once the board is free from the previous
set of tests.

-- 
With best wishes
Dmitry
