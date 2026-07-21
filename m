Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A946A61A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648247; cv=none; b=S2ufoccFVM9kLtDdbJtsBOa2Z2jwBlUxputmq4G2luSMh10VBfhJGHdLMXKr0UYfD7ePhaCdp3HYb/0pvsUhSV5rom8R3MrzWY9iHxbq3qApi8PLdmm9HisLW+V9clZfM0ScOI/YqKppBKraGM6UzTVuVv7tDOa1YFSET7VJ3/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648247; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRM/6rKkN1JbKg5snJd9PBvRoikwLSacy/HqBqXAhjOiBOGhDYUx15zViu33IMXiAhmj+GG6GggWa8++WG+1+/YFLG3S0/7VhxS/9WVcqJ75jBQk0AmklN8lnekiK3OXV5hFXmUkzVvW55Rb5xcViCaKJuQrOT6YlSLQ4j0aR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRgzXZ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dprId3sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRgzXZ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dprId3sz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfuXf1804780
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=CRgzXZ99PQVB+j5E
	6gBPhY/UisNIR1ZgYnJDzxxGDm7keJaX1rzARE0cWJUsrkclyhBdaTY2Fqqp4Vbo
	cAOhGhzPP4XsQ/Iw6cAUb652RhGelMk9GNG2OW7NKBrrVwuAvHaxfI4m332FMdhH
	vde7xhGPt3Ab65oHhBCos8pBuGJXGdnKmXKnXQnrdUKqQVTWIRdbemlE6PjqjoMY
	bPPGgjx/LOfWkeQzlt+iDDYytCnUn25fvLL07GKFBSrfGe1+UuBqs8yxf10+4B/t
	PoD3eXPJQtU+h1CmRBbeALcNlIl0ZxBJkSxPEpDyXgiO/KsDXS1OY3vDha98DQxe
	uBu8Lw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9hr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:37:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so23825431cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648244; x=1785253044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=dprId3szEgMfSll7HnD/i9T1W6LPw0cQJMc/QK3Q6XxrNEiqW+oVUbQBs9pI0iCKBm
         P9+ojIb5zkWNdyEbzUlewnvXl5YPKrA/RaMKv7wuVO9To6R9P+UvKQmt8YBJcEpb3Vuc
         23mPhMFSl9Uy/udFxoGoHHurEvIj2QwmhsddBD3gPXCImhNZQ7tC0+TQVXophgpRc1w+
         MAatMvg4B4S7VQfyhe2uVo3kCwf7OpeGBdSahZEcMzEETLrf72wKavimfBXA/DG0HBku
         G0NZjc/gk/szdKQtdWUYUKLoeEqwlVH5AOi8sr7E+IJM9jEz3lHcbMsD2HOMFSKSsk4+
         niqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648244; x=1785253044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=pNPCx5oZCVc5YmXovv8lIZcDbfoQYYuI5HeopBaFez25LXHrEk88khcuxbgw52MQu6
         Fr7XhNtGxXQ/GMR6MLgG0L7P+tYMekxMKUFvikuF18+K+SEVUw/dgYIdUvTcMv4dWkA5
         WEw7Yvem/G+E8C0CSXMfoJGopnKImnc4RkQJQiyIyE3ZZBeBBzn3oJsXjMsPln2lrRBV
         oap8rqeL4GN46gR2XlTy756jjAWSyFTYXjZjjhPHv+U47xLwGdWm5HvL7F7M7/l+9i7S
         +Eq8j0l71MY0iifuXKs6GprMAPFSqQQM1kuYnLVhFT6NVOD7rhmTwZvkhS/hhAMl4G2G
         iheQ==
X-Gm-Message-State: AOJu0YwJ0XIDv1I2M92Wl8U/5BVdt0XbUEWe3G52+Ub7OU66I/Sxz3Oo
	tju60y6Efpp+Xi/VcZTumrB8bkw8cTRxMfO0GslfW5bjhre4cntUiO+Ckgt2EBBBaXzqiGvlv5w
	v/gVQm6YhFR4sCmh6lBwVD3rQEhsajzOK5TYG/ICOeMUYU4pL8nC4dhEh+yPkJ7X205Bc
X-Gm-Gg: AfdE7cklJFb7v4GZy18HciHvr5BfUeVB/npcA3h1Mpz4reSgUJ2EvdAV6bM/hoAhIBt
	Lu2gO561Y4S3E8zwh0fCpdlaPkwBNrU7w61/W0MJpeWyXpgCqHtWo1x+YddU2q0+j+lryjj93U4
	t1lh/o9E0eyywK8LEU/Ka9So6Fu2UZena+Rgn5DwW3n6pif+qeJ3UdgkLuOnZ/I6yLg7iOloudI
	uWT7fjFWKsJYaZJ+4TtcA/Jx7QpvN0G8IVhv5YPJWZcrQDZDaYBMNbeQnmQP9qxBAXU2ZIrDF7t
	lB0AkpplUhuNVIzxh2wIe7ChpOLQhdcSv7er3FMeEdJK824jJIVbfY/FgMWB2qgeT9cXmC9SWvV
	APWpvd9342Xg5pfrc8eY+EZiu
X-Received: by 2002:a05:622a:9cb:20b0:51a:8945:312d with SMTP id d75a77b69052e-5266f715889mr22372671cf.0.1784648244263;
        Tue, 21 Jul 2026 08:37:24 -0700 (PDT)
X-Received: by 2002:a05:622a:9cb:20b0:51a:8945:312d with SMTP id d75a77b69052e-5266f715889mr22372471cf.0.1784648243819;
        Tue, 21 Jul 2026 08:37:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adff3sm601948666b.2.2026.07.21.08.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:37:22 -0700 (PDT)
Message-ID: <e102fad5-9d26-426a-ba2b-3a85b861f7ac@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: spinSfTAGq84o9S2lm5ojiGp1CqnAYrZ
X-Proofpoint-ORIG-GUID: spinSfTAGq84o9S2lm5ojiGp1CqnAYrZ
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f9234 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfX88XtNWR4JoRG
 yrIM9hXiSKz464nSjj8ddt7SaMUOXp9NMag88xehJOivAbi/mRlsqcr0ChOZ4vLknY7nZ2sLxYx
 actiRkoPB/Zm/6B57EYBmF056pSLgwnUB2oeRbPFhnvcSeeecGIkhCBE9kWsACA0DW8itk8SR7p
 VzSDoiev1MGH5ZLzYv8ZCvggd/Q2w7ssJ0psoQAs3rnhTrfpvnIy8cFk8rO5skHRuhTPI19MOSy
 YIfztlKB+i9iykfOvjbIn//W4YTDsv6PzEGQse3idXDeu+qiA8tuZnkJhDJdYWlsFruDUc/oGkI
 aFGDIq5PidNzLEo8BqKv/3aSeHEmFK3vF0GH39gYf7qwqb8AaGMPzesNuxwzVjrnMDnECW8OqoT
 xQyB4rAShvCFsTsRjOCIO31x6p+gLKQ/rKApC+cAmKhRHHSBk241iFGlpbd+uifsZNiizYVBjdR
 XkO2O4aoJhDwaD31feg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NSBTYWx0ZWRfX7G+6NQ8u1DLX
 HiP7QYk7w53v7s+1Q00CmhJl0dabQ9zWoOnMCwS/i9KznV1Ruh/1nHh/en8JPMcqA1Y/Xowmapq
 bybSutqgvldZIhtEonXplYXjQETY99Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210165

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
