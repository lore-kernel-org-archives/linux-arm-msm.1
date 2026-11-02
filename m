Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625274;
	b=1Y6XT+mTx3uM/8nz9sDuZPwObb9T4KeasMSor/gIjbwx1c/X+0V6benedIT6QK8/W1Qu
	 Q9HvcdqLhX6EwOAiRM/F7sQM2OcHU98jMGgfOXnlaj1zJGzVdwyaxeYhESjzx0zgSrt3p
	 vy31mobARZlR6bm+3mmbpNIkB0OskiChPxHTj92oAEOVmXWo9ltlpcrP29CafX/MC4IoV
	 ikwwdOpzFvIj7xH0gvAknHn5QRgCGyqZ3nFbOXGasl/fkCoT5fn/VxyVfOpWrVzTJF8lx
	 vkJr/uqLqlYDsOo8VatqZenP9KbShrf6CyAogz4UhL0ar0fHNnkuncBeGtfU8+N34Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
	b=wrGLsc/iKFaApigM0ncu+DSlmnjvU1GCk7cCA4VoPbupfPw6t6Hu79cal3fDJ4uG9d8M
	 mmrPMuCUdLbIol6kNSasCBpuzQ2SSK0qU8nBjLJ8dkf79XQ62E934ywHub695wv+4nNyP
	 FCuoz6l4k2tVQ/boh85AsyFBjeb4+3C4L8MjtKB7rCuG1FOu1g7CcBgddA9b1L8wjDPAj
	 XpGyQk9SzC3COk1LAS3KL3xqu34pImqNv3+zCxSBqgrXpfEMVYNAa/p+6IiCpY3/tckXo
	 lxV5VD1/nQliwB8CVAsSfChaLLtVsPRkbgoOlUpEuCuN5Vft12qHdxsikl9uBjjZw1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FE606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAQQP757061
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqtLM2a2ytKYSIAtErO6FqAV
	i/KPJ3AWszNVgliwiz8=; b=MgzXnOOsvV4OwGyBIi1oroFTmcVswy2tnA84jEMK
	0vPTXjs3wezeQzuPwW7Tci/cpr6bBp4tV9ArEGb5BmzHWkTeZOfa+PelSfDhgXjU
	7uKMnCPMafq/aa9hgOM3Bi6d0IWg36toRiMTFg7Dau/XOrDT4vbwk9EJyRCris8C
	eKTQf0DrvFMkDuYKv5oWTnuei6xvjan+CUO/wTHTAu19B9YMDqBNGELVNKaxCSNY
	kB3Sg8ghJqYkrS4OCw1EodhpmGr1mS5iImh9cN1qiasKEu9V6IBcbpxqgCZ41O7U
	rEmAFHrQ/bgM0rbdg2aSvUb7WMx70YgpQhzsr1jMFJN29Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sr4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:14:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc694cb4adso537009137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625272; x=1794230072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=agnzEdPQvaDmVv86RMRQy10rqSWTRQmibhTTUUv29ER+mmLJnGcEDu8DZTMllJYllq
         FpjZWrBcvakp6eoLRbo1vyW5azB+2naiPXGX4yQesbL9Qpi6uEnea2e8yRBgzGt4h9iT
         8ghxZAwvFy3Ld3G51HVGbileMnrsfVI3yWjCGbao+aqBvSUMgJFhnV6qILah7t0bsONt
         JEB/k9ZUWuBhpaRfNWIHySapejvTLEznof8hm6UVmgLeKaXOnYWCi7EbLCBeOTOUXOuj
         vMW745X0LmNWixawdqcnNpJwBORaT7K6DwGYgGfUoIJ9aOx3gyV3kdAttdc7Jnr+bVAA
         uq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625272; x=1794230072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=T5qJIT1KAS69VOfsgC1RGbY/He+WJC34lmumskUr1Bagfr+SNZ0X9a/kZZclaW/Z+4
         OyzgHCgxPvwZexpSM7cAjtOid0u1KZloHfp2ZEF1aycqMtdGmnAriDcyj9k/aQrUnqH3
         PI8EbWeSXOOss/z3vgq1xaGzGdJqQhJckh9Qbdf93e6Sk4bCMsXkyvY9uhe9KHYnYdcq
         xeUv0jz0DXN/Td3dwhyIX3CKrXrRjeXBlx+pBgQ2WMReHb6CoTCgWoDeGAHlsZMVxFoU
         1jZLGr8jES3jD78DJbhmL9J86mBIkijKTFu9ryNiLaCuJfyZYDpwcsl19+AeHbph8FWW
         j3YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMc0YMKMihRVe76yv2THnje3uE75Mke9fwKgSXesEIZ7K3ypxVVKb4+J3ltMU+6xTj2oVmHzdcJR8NIs50@vger.kernel.org
X-Gm-Message-State: APuU4Z+hFLo1pIH6ngS7Djv5P5aHyHmrf46VbxCl0fap16Nk8unMNQbc
	AwjXoPBtyMqB0I0RarlIa5pcO6zs1HMvoMEpns95EVtl/p1hPfCi2MUGHExxAEKt43OZMf5PUJF
	7gkyqZ/LnjwMbvYBPyZ63qr1f1wZYjiALHvfrMd3Ue6C/yC/XD9uBHOnbR/SilEmvjbuA
X-Gm-Gg: AYBFou1PrAra7l/fTVX8nASTuMem9WhRQvPNjG5KfQ7QXJ3f3+tAK31f1z6ngkyu0+D
	VZTwflO8kCEHsR/JUrAgfC+Uxmu7vcS3wUvdYM4+GTCt+HUN7tQr96yf6GmHtYbLwpRiaib+IF5
	Az/AaIQTpTuYVpnAwBgQnZ+mId9fuW9VwI0VFY1bkA/uvDzF/zCh78eoaLhRcFBPkcUeWyblppq
	zOKByMIFWoxs9xjTeZecy7j690GnMLQQPBDm16p2qU4/Pw9/Vj8AVTRIML+Kks8qoBrMV1C6Dlt
	dkWDkmLhYuxS2dVCHfThACbaJ++vpChZmdbwZFTT85bdWA4Hj5dBr/UIxSbNq8VClcGIBS+ne7J
	9Q7SeUjSTqcsxaZnOvypIeo5XlfyCfuXgb/+T5SlKsohUN9bRqFizFvbIbswr/xI=
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482926137.8.1793625272290;
        Mon, 02 Nov 2026 05:14:32 -0800 (PST)
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482923137.8.1793625271709;
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm19577646f8f.25.2026.11.02.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Date: Mon, 2 Nov 2026 15:14:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add
 WCN7850 Bluetooth support
Message-ID: <vao2jrq2ftiyj3sz3jkwoyu5ec4vrnvflfmpjuiwor5fwxuix5@7kgukgpijjcq>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xzIbwMJpI1OyjkTIsY7r0btm0LC6eOfR
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae88cb9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=63jK1YcbmW3W_hZ9q7UA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX4V7bN9ZHVJnY
 09v4+qZsFKQf+dPQ8x/Ozeix2Z1leSEEYN2pLBWhqWmBOZBla31YQP689VPCRMtzjwUbMas43XM
 9Nax9aOSa14kKhLQeA2y8HjNPWmliQ6Daes+4u5kSls6PVsC8h5Z9hG4Zxrg3QnxgSeBZo4iuKY
 lU82tFbXeX6EnT5qo9xKP8tS9BRgkqc8beh5joaKIh3135GhV5TV/Vfszu7ZPd+MWvjztnfUTPY
 DGp0DuwkHZDaHX97i8TSwYCxhUG+FusuD7Ef0M2TItwFxqk+lHjFE74+Ac3JLDSxPD+JqL0n2vh
 nFKuJel1vQwQvgKKxZbI+/VOihkZgXk22D9WzRLTmJDCL62XbFZ4SWDuNmg5zJ2/P1918+G9QZt
 RPthlYioEyGyqoIWpWoLrUqnieZV4ZzmabM7++U3856BHcdETIwUpGyu1DGi3I0bEh9RjsIKO0f
 ukJ9+wxy8rBzGIwQvog==
X-Proofpoint-GUID: xzIbwMJpI1OyjkTIsY7r0btm0LC6eOfR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXwx406PExP8TD
 SMXnQDTynzN+wli0Ug8cAmvs+Ju8Y+TI5UJvBG61HHkuHNQtloScGNDXuL2xpl1ewOJCAFBbgk3
 sQCw7MpGibim4cndtNnB76n/rv8G1p8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-31 22:24:31, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> The WCN7850 module on the connectivity adapter card exposes its HCI
> interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.
> 
> Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
> describe the Bluetooth controller consuming the PMU outputs.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
