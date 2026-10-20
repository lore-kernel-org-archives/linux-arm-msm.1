Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477160;
	b=cjcxogp3rApgJAbu/W/a+ATcj/m0VOutslhpjmNcOtDs2bkVshMrplu1n+f46iH8B2Tb
	 Gr0TWJ/I+JUes9UL4FJorE7lvOA/xRakWonaZPc78GgxHeNlFF2kcpBh2QxPRil73b94W
	 rytDNt88vSHsI1YPXEa0NsG2YEpUUZ4A0R6q6ZwcDdSYcpfOE10CyrWuFC1wQLRHg7wPy
	 hW5PWW7gyqJ1cRo6rkHVH9VXrfezBQBxNuleP3FapQiIQ6AcTqlEbSKOOzxv65GVzLUV6
	 s/wm4xQl0UwGfMZ2RGJ1zbbZt80SqJCkpys6WUJAD7UY5haV6s1Kpvm9Zx3VYzd3AJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
	b=w2bAXYW4XsGYnAw/PXC9+jtx7MZNffe9P5FZdPm2FpklXWEVcpT/hG1pl1p2B3Th7Z2P
	 xfOGW/T02Xw+JdELmh/nzS5lM0B9ezldn6K1f+BZlVRMfwG5P8QVunTMr9hcjvPU0v+10
	 C53wIafDFJBRL3AKentNJ8Hr+lVcyYW48n++tw063xWNzPRpQEYro3oK0VW/ufTNXzF51
	 WEWqmrRRRn8hLYurrsPdwZLcLdAVIzf4XyFCMugrnr828El57tSPHE4JL9gp2QqsEN7tt
	 CZQ6Wsq3rhhCEHLz3Nap62DD7S7Xuo9yZ6PWx7hKue+Rl9xG0k4DnyNq0SoRgoEnm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hmKULjJG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUJRKQNP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C6606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417C6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hmKULjJG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUJRKQNP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6Ia3I1397628
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=; b=hmKULjJG91h85Eb+
	MfL31RtrWFg7XMCJzYHN3/oRNN/AW5rGAi6phBylb6dQtxaCvE8f9cFiTN1VQzFt
	qNeSlf5/usy5Dr8DUUXUOFQdQU3wInGz6PUmIRq0TTvKWRJX4PEGpnUxXIxpVC5Z
	ifVzNSoAOq5T5HkOOJjtOVXEGHKEz5Fd9tHQdyq9hNglfK1L1CCTdYbqtWp87416
	cWE3HRY0iteBKVFC4LZiZwF0C8ysGu0lMhasaYOrxw1HlKDNNHnwxKK5NKLUyJIB
	FZbThnKBmEWocSibznkXIqopJ3LX8YpW2f6r1tuVaZw8XeF7AiKzdOA5vB87RPKN
	8TMIBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ph68y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:19:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so59040185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477158; x=1793081958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
        b=YUJRKQNPqHMX6m0fVOCn0VGSalZiZGmaMFEMAwgm7Vi07cebkZXlffaPLSqxVAl2Nd
         LFUkVtTboYGn0SPopcNflP5zjKcwhQbRFnIfYX/cVLOqe+VYQz0MR0zB7SMKrDNJNOSy
         5Elk+u4i5Ph6N32q0gH9CUp0Ekvic3UxxNYOSCAG5yYYRwIY9cGKLMWS6azsNvUCyDAK
         F3G1N5SEpp2IekbMXMdxXASMl2diEqDK3iOf4Qh1WIZkM1cpHQTfC+khJc7KyjH1eaVN
         AIvVyg48FNsOMUkieOkB3aJ7djejXeR2dI3/L7epFJE0WF2tR4P6gjZEv9fTpKenMBLR
         aojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477158; x=1793081958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
        b=Snf+yhT44eT0I+TO3HpoRCQix9BCibc3fhWHIWurnjAY93SxhiPazUSLL5xxsCeGjv
         9apSmZK9/jcAyfvpOb7dS3rIbaWlRuyet2Z6TCGXw1uaq8p+SbjXV2/S2dlM0/K1SAzA
         MAcemCjwNzd4UA+XsPYu+cY2E6YhA907RJSb6hD8lYhU4SyEuVAyTVN8PPu8SXYeA6au
         58WEpq9Z0mxnDn/3BMb50spQeugfySlLGXGeX9tpAhly51X8ESFZNwND8xHG/5cunHf2
         7K4YPri4j1eSMYCU2evFa04B9jMsBKMgl39LAanw8jsVctX8v/0PPlBdL45gfn048F0J
         LkhQ==
X-Gm-Message-State: AFq9FYI0283mGYVXpK8sJWtTDswi6KjDMfGifvBs8pAmXcW+lpl49h2Y
	0ueSG/lOHb/W3lDA1XTg472tiML5uCDv3N2s/e2pnyLW2crvp6+54U0q9v2XPwRx+yreg4bVpx7
	IBHbi5UWDRB+WGm7YK7wMrC0U/Hu/cVn/dGvApvI8+kpsfk6fVJo0v9CJeKj6PU5XVOu3
X-Gm-Gg: AYBFou1mTmaioK0RUgRaXCX2v9QFTdhMXr9228zYM55WVRsfD4X1HtkR9cdx67QPziG
	42OlFx7kzN4nY1G9ohF31KnpI3KztyDmQNz6xHha86/VPe8iE0AQTQ5Pz+yrfW4Sp1VaZHPHlOd
	DivmPrreYRtuvnfWQq1pT+arn/qOEQ/750zreK7sENEaiMmQOcoZ6NdkE6mwDViJebsPS7DqM9k
	b0TvLXQvU3XXq4U/E0RdvvJthpKOdo/UOqJme9GfDZIbaUMa2TzozqMXrHlyisOAyTi9OXZX6/r
	YGjGWyrY7OJ8bzX3xqp+Szr1ed9t4ET+ithQaak8/f/eg4h7T3PwbjY6XddFi0QyhcWmZmLhaBR
	SfXxP0hzaingQnBj19SbEBA==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1993128385a.3.1792477158423;
        Mon, 19 Oct 2026 23:19:18 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1993125685a.3.1792477157890;
        Mon, 19 Oct 2026 23:19:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm448275366b.22.2026.10.19.23.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:19:17 -0700 (PDT)
Message-ID: <3dd32c54-eb1a-410f-8c42-9152e87ecb2c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:19:14 +0200
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
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
To: fabricioakio@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad707e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=IPAj4E8Ak8Ehd_2eMQ0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o8B9R9YUkS1Gr-Swzfl2LMq1TM_dd4Sj
X-Proofpoint-GUID: o8B9R9YUkS1Gr-Swzfl2LMq1TM_dd4Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX/EHL/o7AASI/
 xEn0QJGFDI8XYNU8OUO0KFHdhVnSuuRkEBdQA06q+nRbQxgaji1snkk1BAMyJGb/H/M4l5nNN6P
 ZL5ATLXihYSmVFj4uJcwKzKiQ97bWRDWyGtQby+rgMVs8Dts4/rulZqFvtrSjmwCDr3yQLavbgR
 3s4wytPREzrPlvPRzuJIWyaEdpxkmXDs4vrZBSGGyZ/Ry/d6t7UADfuRHCh8ImWw50Amw+54W7K
 EnXzZgiHKWCJxMzSJCitL5MGlCL+FIxZLUECTR8lJjqayuUcWVapCxNJ28BHz75WKy4rlFmPzuL
 CHxOe3evo1o8GcLAoGm+J7aWFbXObmq4SWAxjP1ht3O4fpNM2e5o3OknsmE8M9UawmsIFDgOJLn
 5m7qQMOQsanrkewNkhjJG/z+s1P5kjfRuUYpzZViW37Cfqs5d6KhK00g1+ajvRT/+iErdsn3qEr
 ajv1UnVJ/QwXZJgSFJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfXz5BX6GFSAxhX
 riu2EGcuXsGsI892wFiphDPZaZhMY3k41U/9HAHzwmWm/LW6AE7RPj+L9NGW6xwdQsL7cXIQT7G
 byehqS02ec16yB2INKjwYfvyr02qJc4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 10/20/26 4:05 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
> well.

This is because the DT part is a huge slop (artisinal free-range
grass-fed slop from before AI times which I partook in.. sorry!).
The ultimate fix would be to land:

https://lore.kernel.org/linux-arm-msm/20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com/

on other SoCs we scrape by with overzealously assigning various
power domains, as all of the power requirements are managed by
RPM and other pieces of firmware. On msm8996/msm8998/sdm630/660,
that requires a long chain of HLOS-programmed values:

- VDDCX/MX from RPM
- GFX_LDO
- MEM_ACC-GFX
- CPR3/H-GFX
- GPMU on the bigger SoCs

I believe Dmitry is working on getting most of that in order and
should have something to show in the near future.

Konrad
