Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206884;
	b=mAuu42MObtTnqa33BL4bJMh8XKN3JRLUAzvC+Q1kXPxeo289wO5i6TrQ/uAkvMeQ6Sni
	 KchEe5UDn5O/Bhe2GEIUyquR2abeB1hOwIhq/ASK+joz69HfOZbhiHOzKQl3HqhGxoFMv
	 JH0rcsZRH7iSaP8jclKWiD5B3pfBrJXQoEOCL01EuTPeN6/wm67020nhUouzzAhyzdzlT
	 42v5/koy7tsUc2Ir+Blw61vlwRMonGCcbaESf0Xul2hTbVJ0zOv7VfhkyuSyhoQ6S0XPk
	 VCh6XuNn2QFtniGXA8dR5/cUyuMpysBWBRZFY3bkRGM5zGsEYDmjJ41HNB5KWMOIkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
	b=hYOvn7cHB0qNGKGysY2ZrsNDghH6Yq439Sgii7F/73QxpOnqaD7VP6uEvYj8lJF+nhos
	 zBdt8ep2XrGnp7JWKaictLprQfJdyWKBRrR4CtzJoqAgsNlm7eNyX/Y/kDrBrIcpy3a7z
	 cYgGfNwpQQF0+VYe878zF3VnVoGKJAxvn8Os0ALjjxLZRZ3o5QWh/dzo1vBw27gGRfWe0
	 lwWnlNjy0mEhBVL+FlpA318lQaA/c/Q18sa0HYlOlqCmZtti4zsykfAcfacnE9jZ8kEhH
	 mqpLlCk/hCVk9+OkwkEG+JMyRscEXbC5OGIRxBeq1ypuBywaME0bg8ojeeoOYqIcWJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40C606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 17:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA40C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAeuW423530
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 17:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=; b=Jzx7GOMmJNrKSDzA
	SZIMJVlTbepskOEAE+Hb7V9tnUdIkpaeibzz8kRu9nK/Ja0bsNO03bdB2n1rL+id
	CNAQSR9q8hfJAcfTbZ+pqoZirypDfFGYRwbn4qq6AoEZPPd+PX5sio6C7OPWkqyA
	YgPZEBeLYOA/GS3k2BuuoqC6BSqOwnmeOIrRpwXTQH3kGBTrF0XauvBjdC5fzHc3
	wE9FkXD6nsah7wag+mlQTghvc4L/b27AoP6AV2WPPXaVsGf/yS15B5fn3ewdcbmy
	rP/IJ5fnciCrt0w/AbStjPti4UpR6C2Bj4Wi2WxOplP/oWax2/3P3EmBjRGqmYGj
	Un3qbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp204w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 17:01:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so975714b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206881; x=1793811681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=agKUjk6f3Sy/lmN5tj3bgKBIs141dvlcU3EcvCKxtsgd8wlgDWdRhpaV10Tz04X+rX
         3oAWjlgDPitbhOOZlUI3PWJelbjdPvZijKSHHagAaV9renCJnyf49PuuEczfPoKYKDH+
         5rNbgrETQRNPXJg+MLqb7YF5AcLbSg/SEYWdjJsmcJCAq7ABFEPFd5lybAHueLTv+Uzp
         Rex3emZF0BmL2PZ5yOLo3PcH043lDxgDgxAbADAZF+2SjJw0QYHkBEVhTKaDfcgTByAM
         eqDXClpeRf/+L27ke9/V96FdsqbWljl58pTNdQ+igpLyi90SO5NqOCl120sT40PF9cSq
         8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206881; x=1793811681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=YEVWcljapfEGIMiqVEhTEe0xGq96RZb1E7yBaGuwjCzLDw06M+FWXEb+B6nlzsDXko
         hAn49jYKTD1ZRjBhjXXDMfhaHtrwAzWgCIKOdssgtPToZCsGNJ+cDB/6KFxDclnvSteF
         K2dkZxwYvIWiq8FD+49PQs0pDnwm9lePZ4JbamA8iWGrDUUK0k5J0TVxGqrT1y1E4OE8
         Te1YMKLpLBJ7qzRUwaq5LAZSWGCmXA6wB+XOy2slktBHJ0ZzZDJhI+LrZZiq4uWNLlBT
         WG0tuxicAzemUicuEcc1FjNNy8lBe2LmdT56b4nzdZS+CKkr1SHrIkW12YfxW+8l5gZn
         fnGw==
X-Gm-Message-State: AFq9FYJX6cA5+jakurWz8Do+WGPs1PBceBe0+XV1L0TqeigqV4qfx1MQ
	bDrCRGoLMa7my71Etj4pEKGEnFbKiTfM0bezlgLddZTjbIwYB9YOT065Abx4x1auSufndlkXG8i
	HMgLp/KMtrZ3I6e1PA8OXRxMfZNZgHbAUjU4zy3p+WRsh2wopd3Md2LUJO8dEAaBVXphQ
X-Gm-Gg: AYBFou0PgXypIBDWIzznZCmvxXEyJnKhBFCYPR3JMmnzDuyWtlYm2N2Ei+9P8om8Gfj
	07iUBmzDRDtdIw84lZDBFuWriy28c4qTLaE7MxIDvJf6hfVjgD4IyRyD3oGIVo9kcCSPUDbzDOv
	+sVWV5HYmvznVYs9shVrvSnlLesdeMJRpZD7bFTw3FCjaqglym/+n3pjVGDBhv6dIBAaQ6zC140
	b8cSXKgjWyadm+BVg9VbtoMPOVRi1Kd9yeJaEs1/c/Be0pM4lUFaXCrt8mtFGDseYTJQL3HSZkg
	e6wsrFSa2X4MnMA/tywWIIcvE/nf95S1CBWfpazSLfwrLLDJtImlgssmCaJrEPAMkNYv3oNpcDO
	r2duNKPrmJ3gyU1kiP/e8vHSMMQX7NfATeK57unyrysgPwcGSaprjn8Sxgvcasi3KApwf+/ADKk
	hSVLjPkkeXOQY1DOWKPUYl1Kwygnm6HeEtdvU1zQaN
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367981637.7.1793206881008;
        Wed, 28 Oct 2026 10:01:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367961637.7.1793206880510;
        Wed, 28 Oct 2026 10:01:20 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm1097859b3a.20.2026.10.28.10.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:01:19 -0700 (PDT)
Message-ID: <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:31:14 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
 <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zUC-jhLioENPFnpWCa2mkTwu_TGgBsBJ
X-Proofpoint-ORIG-GUID: zUC-jhLioENPFnpWCa2mkTwu_TGgBsBJ
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae22a61 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tH_81DuvWQRpzCUb49oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfXziCSPeBFGeZd
 sYfSnAyZmLn9eUvQU/of7EZjyqHg7oPHriGgzIFEZekUL+w/CbtCoQzn274BKfTRRr6rNilR91j
 bepgLCm73sZe4/ySL0UYMg4q4s6Obmpesw4T8oVYF453haA9xvZdpGqxAv8JRhxVmu6RfNtO+IU
 SwM036nFDjReyx45W3Y1Kv/IbKh6Bef649w64rM2ZzNAj0flEqL0T99ckB2tHTdruUrKcKAW2uU
 KFhvWidMyvc65xq7dQyPL0pazAEIwfdaPRxM2hU9uCavrJth244oDOmKnE7gxaRrvQaKIg7Ohn5
 48R3WS7e0Ds+/W1/phuCJKtwGDxBoGWjaBrIgrN99rKD8D61j5j3RPj3ikwCl+0ROPanTftAL2V
 T3FXiO+6CBjeRePhawZmeYN4/z5A6eeGkGddbO9xzJj3VlYnBdhNnAEyV74KyZnJVeuPwVEEejR
 jkdDAo4UM3UGrsqFcpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX4LShDo0oj9qf
 c0i2WT+9jnMAmnaHo3wf4vlevrgt8/mm0jsnSgKqGWFahW7WTj0jQQbsFYZy43FAiW/rqBrMsdE
 RlFzEPGS9ohLTxVI7AfkiLNmSXdkvT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280067



On 10/22/2026 1:51 PM, Konrad Dybcio wrote:
> On 10/21/26 7:28 PM, Krishna Kurapati wrote:
>> Both USB controllers on Talos are DMA coherent. Add property indicating
>> the same.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:
> 
> - kodiak
> - lemans
> - monaco
> - qdu1000
> - sc7180
> - sc8180x
> - sc8280xp
> - sdm670
> - sdm845
> - sdx75
> - sm6350
> - sm8150
> - sm8250
> - sm8350
> - sm8450
> - talos (fixed by this patch)
> - qcom-sdx55
> - qcom-sdx65
> 
I am sure for the following:

sdx65
sdx75
lemans
sm8450
qdu1000
kodiak
sm8350

I can send a series for these patches if that is fine.
But the others I need to confirm.

Regards,
Krishna,
