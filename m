Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C747A893
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584160; cv=none; b=Uk8d1gvR2xj9ejJLk1MTwkMNcwbRcxLrNBSj+YmkivKNxA1WqcoIEBtbD+Fz8Ryh6+rFRfUJJ3UbpTFctbEMYJkdvs7kE99THu6jdPBcDlrAyvNab18/71Xf1q6BnMZRWKlrqmOm6DAJ1aKgw5veXkY6miS6wpSCxzVMEDkxe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584160; c=relaxed/simple;
	bh=Zw5zXhOLVqkbc+ncf2hBP8AcxwwgRaaxjEW5W6koMro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XInByA9O+j6SNXWw7euc1IDMCClhrDreYnw3wABz4FjiHI171Ob183U8T5YnDRLYM56Ta1ZRV5MULMP7NKVhqLDAdIkOPxbhY4BcVKDgxI2A1FLBBljnCWeoQOPYgw1eodKJ8NZz6Kxqqq2LDkuc0RiOFrZFc7QDXamiZIY3C2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBuhpJQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxDIyuQz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBuhpJQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxDIyuQz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xNPg136945
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=; b=jBuhpJQuH44rdrAq
	wvTI1RPbP/mnbkm35Ej7ZxBm6iMOc6gwmtEOdX9PWzdc3/Z/8R8LnQRfUSBiRO/p
	BPLmwXqNFqyRDlPG4+bQQJkPY0asEWsZ/Q/PZGIEEovI3Y4XpRCz0Yy3K+ldCrsh
	L++SiejYXDtKXYZNUAjNCBB4Q6iUoNfSzqOokC8WRub7Kk65U3Q00P+2TKEkp+GM
	37z1nGO3wBFt5Cvlm2fO2eaA4UpIIr+xBrOWIPpiRl5WX10fGenUrSreobh1/vL0
	NSLHkH6dO9mUdHFB7l0u1GvDyysJp8ibSJSzokOczQurYyUmwixaqoN1eAb0AdOf
	WXTSSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq17wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:29:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so48740085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584157; x=1791188957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=;
        b=TxDIyuQzYaR2k17AS5h6THgg139iVfrGp1T0agaHR0VvBi/PDUq+GK3wC/qsrScduK
         l8RlcyKgVV7OdUvST40QtC1pMH22AQCv3gf98C58jOg3JoUGC23rt+3CniDLrz6djrhR
         Hs8MHNmGj9U5zAq9L/4LlKuhATNn6LbV546E8PmiM9y82UnfeYAZ2goQKu4NpC6exN9y
         hTxFHpC5LpA8cEPsA8i99/piBR7YU36trkAk8dN30iqBftfFgwHfst06Pqvbr63YkFNt
         a1Q8+LpxnijA3nmxtis8GSk4BgqA/EinCfioeQm0ynElP0k1gRFBDZqkkTyAbzN2oWTc
         GEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584157; x=1791188957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xndBd5gqizhYMvRqH0U4waQTYqgueSPfdyK8EMU99k=;
        b=txH5b82LBq1bps1HolFLxxgEsEfYhYiR2Il2nxFfvjg1khdofu7iEA2ZWAw4dfYJ9o
         CEE1CFizabomN5zQAor+qsvxBF3r5GgOghF9Ryd3bae8NYoDb0axRP89+P7Cb+vh4G13
         2LPBE9smKHNYJh8UGTOTRAba+cDn3tMHtZEMy3R4G8wOyWr/CjivmO1208wuPItAmUVL
         GPacxEtA7a7qCJLj1vbXtyz6l9wIlfqAaOC/Nrz3mtApW8xdDafW6lHUe/e8sfbSwuam
         NA5njvyDc2TU568lRAseMm6jeY0IaBJRavZr9fa7NCDn/l6Gf96FBnZ/0yieqckgv2e7
         Y/VA==
X-Gm-Message-State: AFuF++nUdQ8AfGq5S+INU0ZH2g5qBf2+pR01zVZNopPjomg8YZjncThj
	LsdpCuuUCmH4xkC+H+Iteh6hd2LwvoncAZ76rjEI4oDA9el/DBPG9RS3hEst9GEQdowfnzZ70U2
	aQpVsscPIO9iMLi8HXLMTT56lnIsYzZDwCJZF9y4PrwOasDm+YsYwxWEBDyl0KaPh9R5W
X-Gm-Gg: AYBFou08Sn2pzIAupwStocxJ3BxBtYUrjb+OTTvvWYAlEVFjEjKzNbIQEgLWhJiVi95
	7cn5RDWPQj10H7IzPChq1lVVdKN+hz5v6EOCpHZyp0lHcKKSzawCN6HUBN74GzTVMlVJD/NJXbZ
	QbF/gL1wiDYsw7X1/Yc2DY71Tr+tnb63k+zQQvSd/llVlrwRKB6a5I2Z1K/VypWvCAF3cDeR8Gm
	FWRNr01aARjzzg16W7HCcrBk6PiZAIgOIhK07bKiOs7mTa8h0sdEc1d0qIV5RmZfqrRI4Dr85QZ
	zDsJNQq+JCRsu/C0ghstsbyMBf/SxkAht9Dq5icf2en6maSZ1FWlaCtQ6nTlvqL8HfBu6fOuXZ5
	hwT+9Nt+apMQ4HG9/nxrTXg==
X-Received: by 2002:a05:620a:404c:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93c43d78ef4mr1813620585a.4.1790584152251;
        Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:93b:ee2a:b67c with SMTP id af79cd13be357-93c43d78ef4mr1813617885a.4.1790584151740;
        Mon, 28 Sep 2026 01:29:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd69d4f65sm128311666b.22.2026.09.28.01.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:29:10 -0700 (PDT)
Message-ID: <89c68705-bac5-40d2-b53b-bfc818900487@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a3xx: fix VBIF halt mask for A306/A306A
To: me@samcday.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexandre MINETTE <contact@alex-min.fr>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-a306-vbif-mask-v1-1-2bae5e81c05a@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JEQi9ov_8RWTwIs9hZdv2Pp_SKZcKOZ5
X-Proofpoint-GUID: JEQi9ov_8RWTwIs9hZdv2Pp_SKZcKOZ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX/yKrTcOnfMJR
 6G0CkiIoZfxyF5xpBR7XQsPTGHKaR1FXT5GQBFIy/KhY9Y5eVOLkxgP+b05It4D9GJGsAZedcqZ
 Pk7Yi1Dpeemtn8v4UveCAA+Zmq4LbHQ=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba255e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Oh2cFVv5AAAA:8 a=lKQ-AihTAAAA:8 a=EUspDBNiAAAA:8 a=ZpghvvjZZmtfGsAZhOkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfXzX4meGONrIfR
 3o4nyOIVuc9bZ/P7pOFR4FQlZtQdiJ3liUNxNPHYUfLWB/6Rv/SjHvB8Ey8ezd8oSS1eaA9pB5F
 xf0R/xCwdTdILBMi+0ycpPkqRTDW1ZXuyukWCyEKUTOesuFlvH3l7hvFlIuzbWM6n3XQevVvpjn
 o5myz5A8TFSplxcq47RRBBsZJeRDhSPIFE7NGHo3ldw7HQf/hwnHRijijc49AenCvEfj5DsDSdk
 HXBMK7R/oOWEVdDxTgnENw0C+qU5EPE+ikUq8g0Y4L6F3o7A20Jf3ejHFD54/Kbf1Ej1M+CJiBi
 sbDKGwBpSBnOp0Ld5oQiw+oXoCOAZ7hDFinLVcYxgMCaMrv+dw5pOyRkzMwA2IUen+gSzxM30pp
 eSUlQobfv3E1crzD4caBCs1LBXD5XGMJzk8gd3dcaNdEiKAbNmi/fiNkaQNmXepZe37MdFvsv4v
 PpyvmYkBsXdv1xNsYiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033

On 9/26/26 8:17 AM, Sam Day via B4 Relay wrote:
> From: Sam Day <me@samcday.com>
> 
> A306 and A306A implement only three VBIF XIN halt request bits.
> Consequently, waiting for the full 6-bit A3xx mask times out and
> prevents runtime suspend.
> 
> This issue was reproduced on a DragonBoard 410c: the request reads back
> as 0x7 and the acknowledgment as 0x00070007 - the poll eventually
> returns -ETIMEDOUT, and a3xx_pm_suspend fails with -EBUSY.
> 
> The downstream kgsl driver corroborates this (see link). Since the
> single-character difference between A3XX_VBIF_XIN_HALT_CTRL0_MASK and
> A30X_VBIF_XIN_HALT_CTRL0_MASK could be confusing to read, the narrowed
> GENMASK is instead defined inline in a3xx_vbif_halt().
> 
> Fixes: be0e82b8e0c9 ("drm/msm/a3xx: Drain VBIF before GPU suspend")
> Link: https://android.googlesource.com/kernel/msm/+/c90c7feeca2f5839ad6824f816c0bd207602a2f4/drivers/gpu/msm/adreno_a3xx.c#637
> Assisted-by: LLM
> Signed-off-by: Sam Day <me@samcday.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
