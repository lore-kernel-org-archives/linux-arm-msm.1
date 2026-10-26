Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008531;
	b=WtC1FcTELEE5goJqRUJuDIlaUPLQcpuyXQIvT+Fx7lBjTCGtLJjEQ/DTgm0sB6GvBGdi
	 sLdadhx77fSyBlfdKkeysFYP6ZH6fe8shZr+A2n+Y75XiOSc6c/g/TRi9CFlEXsrCn+ib
	 qyrDG9TdzIEmSIxn8rsjSIpR85RUx1oFYMYwyGGp5bQGdw9M+sw2wHZJyP6yjTQiIUwJh
	 X/OPEN4VWiIl0PWUTxBVqx6TvyVTRWKq/FgtzHd0KeccmOQl+T3hCS51ZR9MupnqiiBg2
	 QAjQUSM9l6Q8rcKvqo0iS4jxJ43616r5l9McpWQDptFzuRC4CkCcieafqxQO35QT83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
	b=iZAySuOsaM1bnfJutSGHAdDFV7UWSPFgK5oNIOdhxVcZWF6iK2RFgJSt/ErTkDeWmW6p
	 PFXtO3eOs3QcnbXhHAiYdQSq3dvF3/B4MwVXIT9ttMsTl2UxInA3EMZm/n2nZGWLPvm+P
	 TgAFLUe5V+/nRAFgF6YwLm4lRYV08jyqQ2aFLiwg00gpzizDhdzY2ugaHGt477cM8FP6J
	 Gn4MVhGR6tz2nGCc4s58o4zdSM4zdSA6sO0F/X+uDwwaMShisnji+XkSioaM8rNzSw62U
	 mwbIgbzhQPIc77Aq6oTjp7/rrNB1CaP4vh0Y+IPL9VxX1Vv/RQed2YRYqI1fKnmfGMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWT5cY73;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeMWEZRN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70751606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70751606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWT5cY73;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aeMWEZRN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avo42727082
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=; b=FWT5cY73LYPpV905
	WS4jiollJ/3aJTO/WUKXZt/iLngIwbjcfcRg6kOIMoYR0kTxcZykNFSDQJpBSIHJ
	2yc6nJjSoJDYRP0WPNjgB06MGCpLw6kOFQbNmo0OaYF9upCihH0ar70EPjRbOTT0
	oZeW+FYFyOvMPbVUy50KfRLzkEErDj3Rwd2C0BrE1H8USfmph4yl0DmzLHLJBdMc
	IWy608I7ORG4R1VnMsvh0esdRTaBsC/8bmaDEiHnvAl0wffuzGArg9+D+IaQaL/n
	c1LpyNAdGQhw7sQnVn7Rh8gs28uxsTDiO0Uy3SqKpmSfuYlXwpOuJJ6lcfcYEqbT
	lDWWCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nxb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:55:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so8146031cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008529; x=1793613329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
        b=aeMWEZRNkhNEau4Sdeundt/0BSG5SNXkVjhi2hH6wALJk1k6N6KHK67ggS4bcZiuNJ
         co9CFSA+i9u0iz0aYL/c/SpkBZwiebS/nZeC4PVCYr9xoIHeSCpJJjOc3Y/gteUykj5l
         Sq2nEiq/FbwCJpwsF5fbyeyK657xPzY+uq2OP22FjT5woSp1WyQwAY1hf6LpNOaWWFMm
         c7nPud3Apk1BRAxdOqL7Fbacl/ZY2cKAUKOP5USpDLZTGkw/tobfnMqKxTLftey/EiVU
         QNrmo+ZbQLJi3W+oX96vxF2wAwhaga67kVJJPtSmWNEQZEZgXYnH7cXwgLA6U4p0KtoG
         PunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008529; x=1793613329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eVMbuoHp1d3jFS1u8g/b+NSl629Wv469YVA1Y04lCg=;
        b=CEtZ8X00KADzGnorC2opkqzrxqLeXz8Ueo3ZzmSq3ck37lMc0e0vk0SmUv84CdF5oH
         FCX1qsIdJtdLPcsQwTyG/PQrJnUHISzs0n6A0TcvWaEHmXv6rAKhFYJ5BGrBQBmR67yp
         KnJrrJjdQuKo/5495tT7CDgTJAJxmjn2xe0AMD0ajjlCNb1n0v1NgYxZAC4W8v/5IXay
         ycyminM6hprOv5suCSuHldGI2lz1Egs6OwdDek62wkxLqV25c22tyGToU/PhtON0GLJT
         YNBtbsTNbK0pSM73eqzF7ADiCKd/3y8CvTmy5BXPy1+K6JyFdziwRlOInhb61OT9Svy3
         WmFg==
X-Gm-Message-State: AFq9FYL79DoAI4eYeW2egDqNf2VSm9H8RL6OjiBFzWm+nUOIYP5DPdvu
	xqDE5i/GQpVG94lLswDvN70hU3Oiqc8hRiu4IKdAthhYByKVAcqEvn9nnkjF7KIHHG3iLKGq4KQ
	SX7+B7HIi9MKdk8OX+gg7eBw4RO0bTmC38X0XLMqLJyxw2nVQjWXUdie9cWnBH7KU/tBp
X-Gm-Gg: AYBFou0euXZwyHIJRtZFPW4PLWBBG0fv0tmfHKuQL8IHMX+O9QCbTutOvLYHKlbRiZ8
	5Hiu7B8fnQGxqjVFr8KcmuskFgceDVEae+TlDLTZ5ODy1PugoFgWNCi4C26nxnJ95ci5Aw0CxK4
	uH8KX62n1mZHl4SUzQN31UqjWfVwDdyZq3kSXDy13ahfmdM7XH/66JyZ37JHPESaJRl4ZxcN9tw
	8bzPHJB7gWYUvj9W0YBnGSYjtXnVbEnPmvHMogJ5V2mRmXvBHMExh+tIjd5xQZYCFHLDeRW3bL6
	0e+RCbm6y1GQ4Zw8L6rbgFQ4Mmofm+qF24p26WHNkevk+fsUEGaF8t1baCPzsQTRvN4XHsJv53Q
	kbd7pqmXsaZIabAvu8qxkKA==
X-Received: by 2002:a05:622a:e2d3:20b0:535:1a83:1251 with SMTP id d75a77b69052e-5383b5b88c4mr95942041cf.4.1793008528649;
        Mon, 26 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:622a:e2d3:20b0:535:1a83:1251 with SMTP id d75a77b69052e-5383b5b88c4mr95941781cf.4.1793008528118;
        Mon, 26 Oct 2026 02:55:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d5f3sm3471088a12.10.2026.10.26.02.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:55:27 -0700 (PDT)
Message-ID: <188545e7-c317-4f7a-b4d7-27eb3a4cbd07@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:55:24 +0100
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
Subject: Re: [PATCH 8/8] drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BnjrsCa2KvOJwxAkuM9J1h7nK1mmTg9f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX6OTCzoPanpFV
 n5KTW9fxBwJkuedGgJoXhS1xLvY0m9y+HJH6kDonXQNWGwt3l6g9mcP6ckYoQ2dkQ6A/BG73wq8
 MjVAK8aTi5ulM3l0NLKc62mGVzr2sHQ=
X-Proofpoint-GUID: BnjrsCa2KvOJwxAkuM9J1h7nK1mmTg9f
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf2391 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nkdzZAihEXyvZ3FekmAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX9sFqG282A7H+
 giq8nAVPaNVMbUAP2H1VEauqcUcws46IFLtW2ja2bm3PFhgMvsuUAE7rp9bbbmS4K7Au8oyAt0q
 XzPjD9yMZj5pjiRK70jOC+XWWTDbRS8KsNxT81cOcHaCeNdZlXlCxdTUXIbLyy0zPlS5lEqYEdc
 +hzkPjugM6UToIda/m9bHG0mwAz58OMMiWeXN/C78LUfsz7rIVkU92UoDtYfoDfvAG7wmih3iS5
 gCQ/h5qXUrMlo150ZjvcVxPr1T6ddoiYWmuIrtLBQfO7laAjE74z2P2XbVTGGyrexwgD8/JOLAr
 JsvB8x0MlgvvYoCJP4cIiM9XQNlNR8uUBc2l2ckHwUXnyh4k9Hq70twrlHo8TdDCQipuMs63Yi1
 SToKOJ6ZjRMLG9P5rv/Dx432Q/1doT+9UGoecXvRcyFh6COBxRHNJH7uNA72NTVRCdra2D7b42Z
 0byqnS4F5MP+6sFhvow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> Update the catalog to add AQE firmware to the Adreno X2-90 GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
