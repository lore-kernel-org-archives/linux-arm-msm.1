Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BB32B989
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372941; cv=none; b=GwgRIC1zE7lM/lgDRmb7QpnjANQ778rr1s1zyouw7mLFWxmz7Yl9GgzE3BKKrDw6+fBminUhf35kWfU46V12pnVqxh5evxEKKKoYkExXhNLJh4nX4ZVSPJBmxMb3a2AurYfjR5BHfCwNK6De6KCY8DuqEI+LSb5Nlbzr4Pa2Jt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372941; c=relaxed/simple;
	bh=6g0HZESh399LAU/wAJ+ckaki2Q2fKAiBpVtfxYXqses=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clSlIJsihLVHwQVI+N3gnLfw+78e/IXJQrCgm1T5+lAvLrCmOE3HR0eNU2M1e+FCAI6mHxAbumXwo6UMOLGHNUwMIq0u50wMk2Aa8rfncVIeS2+tNSxJ5NUkUWeqKs+vmLSvk7TgEFD0AZRlM3NF3HEJ488IjecfauuX42lW6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVApbdzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx/4X3I1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVApbdzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx/4X3I1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SEpZ3351944
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlPx26cvgwY4RaZSyFHFEKKvtBm4/D1xS48mPtkzlJ8=; b=AVApbdzltLnnN0Wy
	u3jNUX1l3kfggAHIqezUC8yG4nSmm5tPshXvKDJQMrZy0ewsUzTV9rjA9MurKmVJ
	XMVyE1NDUcfrbqHhOUmBy9WYFMwEjkAjzHPoHhmVxNeQC/GuvKt4Xq/9rlwM7bNr
	VhMGL/ogibuYw4dj6fTv2cKZzzhGgxoGoQAqbXLko2e7+B7K7jDbMm1eWTFLTyFu
	JS+45hNXIJewwnlkPP0CPPK30DRYtpcgTevRaRyieMKZP3LS5hq9qorS2uOa0xiU
	/TN1zK+KnvFC9X9UWEs/Uvaxr2sj+x/Ex0t5+wbyo91paEKpSFQNWQtBghqlb9KR
	NdI2eQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0416-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:02:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-796bb209452so22738137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372938; x=1789977738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPx26cvgwY4RaZSyFHFEKKvtBm4/D1xS48mPtkzlJ8=;
        b=Cx/4X3I1/ZTsF9KS5Fgfkvo6U/A8lsYcj+1Qpfw6jgdfvNPgbyA7S6LQOCHqa/ifI6
         k/f0qialK2pqjL6zL5BJlSvoFSzmkwKcA6h5hd3eIrwyt0BAJSECkDQEXHrz2NE6h/2U
         G3UIDt0MwW7xVkO8JSOxzHKRq1BHLj62SNt5R/biGIQMNqbJLSzPD2ZOtakIRfEkZc/N
         Mcc/fPbAMv0ftOoRTW4Rp/2OCVb3qq16IUPKy4WGradJuwD+YOBhRKX6iiejZOqgzrwh
         KE6ARC7gmyixYZu1Jn09UCviAmXjZ3Yrorc9Ndlc6iLBBY/2DkfQMjIVnPizUyrIKOHt
         1YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372938; x=1789977738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPx26cvgwY4RaZSyFHFEKKvtBm4/D1xS48mPtkzlJ8=;
        b=T1BiL6o0Wa2FxfXywWJKMY9uI4kI9Ljt39XBGQti8lCOMxg7bqwbYNwuLDd/pm4yKj
         +hf3peXgZXTkZUAbr64bnufCb8oRzu4f2Egxdm28WN4qI2r3UCdPsGTdCFgSWAnCyxu4
         iLCdlRsBjB0IH3gLCnfgzPuLRmmAD25CcBpWP/xAJqqx/cxDuPW/gIsS2qVeP2V2ycYT
         1CzEipwYvZLUEbVlb9Ko31YGq2Z5vDvmN2+WpapEx1Q/79gRey/jPNZ6lp1jii662W12
         4sivTGYoOjO26tTk3mU1N4+FW0jEg//RSntwvF7mpRBgjiTf2qvEJ8KZGYtx1uqWe2z/
         21Lg==
X-Gm-Message-State: AFuF++nV8MZPPy74hLnaHyiJEQXvNIV+MX4cwbNhf9/gpVdACrZjM3X+
	XV6lkzMDFvIIczQMPKASyGO1eOTidiloZjstccrmfiOCrJaOmj3Dz77Fa0nZwTgjshuUi52DEw+
	YnrFPoqN1QNHlVD51QMM1xlfF0mVajTPftqgmCxpoqoVseyBN+gYdQD4SXiAjHKrPmt5E
X-Gm-Gg: AYBFou2yaJtB1gNLtpbSxaQS4H9TxduqBEaG8c5VCBqsbWjRii1pA5lMDP31a8bsI6b
	UuMoHxBHnR3T9491DNo8AknuPzF8dbiwSKYdnoD31N+KiQVbc6OiA87beufKG/gpcG+f2/1SZZ6
	FIUc9t38EMz1lsM3rvIz+f2bKvXEdeFlhJ/AO80nlGyOhWxoWDseQr1hetOWYwk1JAIBBqTpp/0
	icAAac4KDKd3QxI8aj/FsgokjaCxxYlaagQKcnWZ7i6EuItd81syOcna4/mqLDaBP9vHKhYtixG
	GMDQ1Lq6dmn8CQuVxPM4SRtcmS3bGfY0ntWpvcIg6RIeeYP/elJPLgyl/r9N3Le01SHLj+7CfSK
	0ixnrDzAh/1p0bE8MEyDv6A==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr192598137.0.1789372938391;
        Mon, 14 Sep 2026 01:02:18 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr192593137.0.1789372937939;
        Mon, 14 Sep 2026 01:02:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm387483066b.43.2026.09.14.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:02:17 -0700 (PDT)
Message-ID: <dae821cf-3869-4414-b590-d93197d6a322@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:02:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7aa0b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UIDDT-_cQcoNCxQDPBkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Oq13MYjjre4hJOFZDNS6F-Mruz8bXcU-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExMyBTYWx0ZWRfX/BBxLPmBTVeT
 2B+TuYOdRdF97vRdVwdM+fZHXZoYAnUoK1qVjktbi+hEKtQdLoh/ZIyEbRFHwTD8jq4VYJnuzdE
 /NwIcfVpY7kOYyv9DHN1qIPUH1hE+eE=
X-Proofpoint-GUID: Oq13MYjjre4hJOFZDNS6F-Mruz8bXcU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExMyBTYWx0ZWRfXy/J6A+CYyVUB
 4mbYbHO0+N2R7B5XuE0RqG30Tf1TtE3S2lb60cwCVY0pIlNQ5vAMMBvjSSMnL/h+KvCSz89y6j+
 cLhNv3V6z8+hH2R4zArhBanz9qHpCa9tY0gMa/RJPxxes8upsDhE5gEd231f0Gy7rEf7iN55vGY
 uJQcKRYmNBzOwTF4ExT5lPvvvRb2fzMNhDNYQ7yA91czOHhFfSlR26JmnxWKQBr3v6jEXuhO1Bu
 oZVL6ubvIQiOMYIjkkhEk7nXbGdnaQiF8fLeDlowDplAUixilOSSw0Jq2XZ3ZHwtYtXMOQ/9fId
 6afbkIwaENMXdqCqBwd3GWso+PcKo8y0UrzNFUKGq83Z5i/bRoHzmCQ/LIZz/JHFsETktjdcVSF
 nnExxGiCIWaVb+wpnYC3a2MFUiwxpQUnka7mohaY2vPia2Nh0psudATCFSHbi873+3IDvyu1fK8
 6f4Owmu7P//nNLBr2bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140113

On 9/14/26 1:24 AM, Dmitry Baryshkov wrote:
> The MSM8976/56 family of platforms doe't have a separate cursor plane.
> Instead the cursor is a part of the LM block. Drop the erroneously added
> pipe configuration, letting LM to provide a legacy cursor instead.
> 
> Fixes: 1860f2a8b8b1 ("drm/msm/mdp5: Add configuration for msm8x76")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

The HPG agrees, the SWI disagrees.. possibly just a leftover register
though?

Konrad
