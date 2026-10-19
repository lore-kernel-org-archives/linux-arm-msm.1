Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445897;
	b=yJ8xq9bTV9aeF0WYkG8+I2f5UZmffNeg4joUGMsTwVHgneTLMpeCKMGy8KBQiuzNaO00
	 8t5pD8TuT0mxbtyUG4bHXFqrUIMOpb245pNo76Yr8KrupZRPW+96OVOFQ6NjmJpQwZhKq
	 0cpjsIB3necC/h2+Xx7PXIecODzC55Cb+QqXszyJdJxA4tviZOCLgGxKuEGv5RZ/vf0tc
	 Nq9thPKr73aTEXSUfd0VKviF7HY58jIgH10nGrvTZrSZtY5nJvwn95GwESCKRa9zhMYLU
	 uzIP3x1TgSl7bHAkdnVdMpaQ5eX5b1AAPbWfSTqQ6E+K7STvaaBcBuM/OjzoGzL/UWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
	b=kFbHGAI8aLOSUaTkuMYsyL3GwVZoUqZVrcBaqkXznTY4DOr/jNrKk8UVvQMzTI71mWAg
	 KVWOP/jbVWNv+A1pj4XWg7qSQjjraTzGw7RlofdxtOVGzmwQ2C8pULG2XL2CTkTRaSYBV
	 FlWp/+dR3CawvzWOzLigEtHjoyICT/wV8nlE1L1tJpY7SIPUiq+enMM3rIMK6ntzhdQL1
	 m1HK7/d+q90vesf/YImKgKQkZ+wXvKfIXq9+FAs4lzaBronkJahfY9fzci2IdziiNi1ey
	 mBdDcJdQOJCnsSI3/tu5HDRP50IEb4KLpbn1C9SpKPuSEI75p7k3qod6i2xJS4RDwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8505606A324
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8505606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o62xQRKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMY9gFz6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLa35j2892357
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LIfePWjFQJh8/rC+L/ZgDno6
	4sd5DgcUdBm59T9ASBU=; b=o62xQRKEwBqTayFhXRc18GP26keaM0344wrBcb+6
	ddzEapubovvQW+XWoS0WwJj0Qiwzwp+gq+AjOG+Ulnjg8KHStHPTHdP5mhGqrhpO
	frJMuNazXWvNSDszNJ5ytyaiZ9gxkzdKetzn/HL3RUMu/rY0rkDjWkukRy41mxPQ
	Qj6ESj0r0mHLDgkkdchLLsU64qeVnRO4WuHinxrGrhmH96fPo8v0HhIMbMlrwoic
	A1faZqSnjp5uLhPyfKVuL7DRx+j3Varn8a3ixfxAFiO9z8oVQ6aWXkSr1HmJpUQ7
	FJTKVfKJYgn4RgjwlHwFvviTTGzOT+zKy/IP4wHEfWd3SA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4a0rbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 21:38:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so957242185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445895; x=1793050695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=jMY9gFz6oVSBVWCJxAWnJYu2u1iT7MQQsB4R+kvfEg7yhGUc9v3BRRpvafR3MAEAop
         VK13ahZtPJWaKy4D5WrHNJB3RS69rYO8dlGqj0XpUtIGVeIxBAh/zTfCpTWUpHPAnYxC
         qWxPd7zvUsl3UP0rhG58z6Ht3wSaW0Nvl8RywZEzW/cH8SrCWZAxb6mi/kmy/D7v3CKr
         f4czSyDAjxWwDsIaqVt1Y0/457gHa/6VJ3FpiyqfWEplzGB6zddTePshBKyCv5RgccLH
         f4e4OZOF2G3pZmyajmG/AjYzfnAwqn7magnEN7WknayaWE5XjbdlUU7mK1B5Ff2N1kUd
         pFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445895; x=1793050695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIfePWjFQJh8/rC+L/ZgDno64sd5DgcUdBm59T9ASBU=;
        b=I9EhihAVEZfezmphCeXlDa49F1Splg8oup46vX//M1ky5t/oEIV8l9rYf7l5uOo0IO
         OgXPuqgL3qP9Zjof2GIh0+4C3wt0h+6AfoXpQSdTink41Oz9A5jP7GKvUKwwF4SLulHn
         sowDfu180ZCk4+ENsksuh+5QF2GvwkeFInM7UXD/Q+8BNTN/7krpRUbBbXHzTJBvF0AH
         4sHibHDH8KkIhD7QO8Nz/yhbx5/wEWV7bQzRnsdPBAboHV7OJv0XYc5kecFXnBcwq54A
         3/tOchwNYdZu+/BOTS+gIbQu+65ZNLn8lxzgkbUCEwnY/Izl1RAn1NO6yMAUtOyu4IbF
         dnhA==
X-Forwarded-Encrypted: i=1; AKwUvBy8TFw5wPRlZFjwmgcMRuhuAD2LvkWkAq9MsX67vvqWd/nQN1CNxL/YhfGU/BwfA+pCWuLS4CB5dJAsyKNb@vger.kernel.org
X-Gm-Message-State: AFq9FYJM8kRMuFJMpzVNk93qRB9hsyoRztBnKvOfPNzJwXlyQNkT0118
	itNRaEno41+KmzqJ6HwvLDh/LGwG5f2yrOl7H0Qn6IYZ96MeXa2jKMhFcJAM+s2B9K+nn/iHLy0
	CPdjC/Lw6L2QDTYb1xHaLF4HLPRjPA/4NeM9F0HLlKzaj8a+sANaeqJ6RNfLZYLu+iqTQ
X-Gm-Gg: AYBFou2Lgy+NXNVFZfa0Dy+urdhuYsaBUI+tWm+rLy5vvKhoLCGnxTHGmOWbsE0glrx
	Qud+Oi6mw0HDCdMIkSjHn/B78IP+8n0W2ukLVW1ErzFdvnfrLdl4bLvKiuKcEoWbNgSJxdCnp4b
	LgHca5rNTb8RdL0avk/J9m1nC/E8OhBUWCPRvJcSkpTEAhsBFIKbSxqRPC8LJjmd4QAz+vaV8Cg
	z5BDVeZbCLGznSNPjtMkp7ULVD0iLiEnO8VyEPLw5Lahqw2J3VgE9F6G2zLUrvp/ucO1vvrhPVW
	DIbeZIl4GNWT2HzEapM+2oRCUFCa4aGSmZ7HWnDkvtICC+2obqvbK5WNMHvYsPMO6KOPhf1URCx
	/XMLMFudg/oT1IaLwg9p6EGQHwvDcWIinAWxKwAx+cEzeteU+3Py30j+QM8FVZqHj/74pK/og0k
	zIShMgucv5s8Ch
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478803385a.5.1792445895060;
        Mon, 19 Oct 2026 14:38:15 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f29ba04bdmr1478800485a.5.1792445894600;
        Mon, 19 Oct 2026 14:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a533900sm2290916e87.50.2026.10.19.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:38:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Message-ID: <5bs72nbd44ppib66n2amljtayro2ghnpek2xvdbioz5k265nbk@if7gqck2u6fa>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
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
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX0MkCpj0C1Nes
 W+h5hRMuIbcMtxLu8l8wT0kkTT/jrEMHuZ//dJwB8MdIh/ynPuUDiIINAoQpBeKBK6XiIPOvFZQ
 RDyBYC9alH/hevm4/tEzfqyaCaKEQNg=
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6ad68dc7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RWtv8NoYLioABPu_pB6cEpHVgVmiSxko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX2S8iLqnr0qY6
 15KqARMj6UWwB0C+dFb6aJukr21ZK0kEAUyGZXKcqF7PY2S3VvftqZ6uCsoREhhXb1FXTaHNnBL
 GhC6Npr22PziXX/ybCzhxyVrWOLUxw/5d677Zm4fPktyi1SwT2gH+OjqOlSFlTVzcptljOEjd61
 FEBS6EGBJoW4OPPJo9UJucklQeAyW8UBCOJn4gUyPCok+u/HZeD89JGh7rpaofRaqT4pitGwLwS
 JO8uGOgp3pJs72ESCxoySGEO94qC20NMirSouGpMGgRyQbWWaCp9jiPOWZbetk5RHzjqeM7Oyt9
 zEoVm0cL2CNFRmmR+Npxi2Z8R6FvuQes6/QdFjKSS+3iwWErSlNE3D2OwoNajqtb6jgXpBE4XGu
 7NtCicbSFQRMWsq2VbV4FlULqzi70HyLPYnGEzDFtT7A6ACULqygfvVCiGe43cUiygPQchx0i7K
 7uvh2FR9adFYHtvi+3g==
X-Proofpoint-GUID: RWtv8NoYLioABPu_pB6cEpHVgVmiSxko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:56PM -0400, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
