Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656901;
	b=Rc6H7d6ZKuiaQ6Rwldm8tF8CTVpGz+qBPvorSM1/gLkijRL1TkOfiepJf0A0HH2D+qoT
	 v0BzyNF+8cOG1Pvr2riZzTYYd1bRgwfae5MePxA3urRD/cTB9gIASvESw0lsdnLtzaE+g
	 Z78qK8KwzuJi2rx2TzPYsDZImF1fPlK7zH9UHcjH2QKhoi9OQDM5TdxgDpJe7Q1SsK05T
	 7EoZ5mhFohjQUSmOgwWrxJFcDn4fWAcwVIvfsrJFyaf9UoUql9FPe8nDHhd4p3a8lRuQg
	 9iYadsti3m4PgUart6HPzAOZD/Gk5m1zJ6L8MKFPySu6kXVN5HgGvx2rfniXmTGXWhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
	b=00DPLejMIoQOgzkC1RoNDO/M/T5yDacBqUwRFJkYw3zML89X8dqz/+ukI0vuGNlbhos3
	 IqODNkT/21mobDWeSlLYyDg6iCeBLnAsKGhJmpj2Yobb9hLE3ENaqiQcQwYRxSZsOtNxN
	 wzb+bqFfTwbkNEbRQhmhSOjZd/Sq3ZknzJmPtsi+CCj38470Rb16ZUy92lK5rL+baLQN9
	 8qFaFKFlMVoO3llgKiY+Zv/PmJ9lkZ8cWUMvT+EcJNapW564bIV/J9diYDI9qlaQA1FW8
	 twY51v54XddMcxyOOoflwXg9td1FOoK71vhiq61ApRB/Zm0gKq5MjrwxaoXLlfB9kQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC50606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC50606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlWHBvr2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706954136656
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=; b=h0htjNc1Gi/TTbwB
	2XaQK37cydh256mj0l2Rc0f+BGpNaxoxQoc3hEBAJiR7L3RhAtuyzKVwwDMbLSnV
	VUuVpIM6jVR+bqd0f0HzxHl74JKQJye2ntDhuLTDGdvPa5P3o1scr8nYIFij6S1S
	FuYvYcp+PvVTbmR4BuLvOquJqncLx2xoD7pv7k2CRu+tatmn2nP/UhSVv5D4fX14
	bzLmCHY2bJ5MA4by3LwBTlXj5fvFUqFaZwiVek1eGkKeaDKlE3ofgWNBgzuIXH2C
	gJ0GBSlNIJa4VNvuzs6L0EZH1OltbNx5X/PnBopbQ32Zd0hdIc9n6i5965OENs41
	fSzl5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9d8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:14:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so39525885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656899; x=1793261699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=QlWHBvr2SOtc3LhdVgVZ83IOTkjuV64keRaSqkKYHPGD3rwCb9LE5lU1trMFm0SYcL
         Bapm5usmdK6QthVgWxT2txhW3aFU5dUYFRb7ZGniPZStcV93dLkPCg9u51355cf1hox3
         ej+DaxaKPXkF9xe6pU77GmmvC15gcenx7s+RzHDjKgqBN9omCOfThTs8cYjvVMtco8F3
         QEULofhSZBOwk75mpjj0tZQqhlL+tEd3FfZMh/UFatGpDOGgPexOBm0RoYok6AadsKr6
         t6gFerEujX1bo+iuiUd98bllFeKYMvmMi36CuggqRjT+7tytlufVG+hOxvYjNkjUZvl6
         gfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656899; x=1793261699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=P/bkFPPonqMuMGjGNCev3DhHgF3JpPPNHcvA179gzWE4FAzZRNxikQ08m4fjw/Y1RW
         HycaWA2hapahUwAF2W3sbKK/eckOSH2izB3hJtEWU5PAwvYNIZZ/oRKEj/O8XZQA5nK5
         q0MiYaP6BIhE/CV34j4gdjrObbeqWtR5WmTGD1u7/EdgiUrIb4jYNJSAdZURQZAHMdCh
         DiS1g8J8c/8TjBqfUDBnVNcDdIi8YwSLKiLDpn0OjaaLN3PU1mVcSDPs1V4Mnma8OdzZ
         VsDVyoBwuA6aAsJ+M7pbIgTkt2qxf156FgMtmOkyvNGrBnwKbmDP/Tu1wGvV3MZbW9rT
         Dlfg==
X-Gm-Message-State: AFq9FYLawz8QkisT6h0PtAQlTmYC5zYqagoToOgQRpzzCXIFxtBhcNFh
	TEOLbL455qif3AeyCm19nOIo3F4mnF6BrYM+nhvJOrlzkvZIWsZFRpBM4x6hu06f5GH1kAvF+wK
	vwRhugEDopi/t7xhDg3f2G6ucAPJUb6ioOIgcyw1JzpNejrRI3HLQVor7qLXkaG3bND0m
X-Gm-Gg: AYBFou3Q3bfYp0YRleT8DyyZBJHYq/UzakWTcVfzvTkzBHHOGEU/YwUiHS2DFP19i8R
	xkvPEtEfnVQnGmuhHXGAIKvqK1vMrFPj2NfdS0OObUUpV4UU++2hqiTaSsDdbCAmrBL+0rdNufy
	mOGaU+52o39vCdg0JEYlgTS20ts/mfGs8qyu7LJB3XcG+/cmBPyYGbTaUataEptOp/7Q3f0gAqO
	wcu3RrEUCfBJljm4beYLviyRmFlDa8boY5FBVeLYQKU/GlaPqjL2ufyzellUdenD6YNRk94MHSA
	nIuvGGEUL7hnoqRKrkK5A8QvvPvvXRHBL3Um6LBBj+3tWGUUX9D5103TWqIYsiCw4X5TSCV143m
	8sQeGEHdmPDc1THEn1D/mJg==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970997285a.1.1792656898939;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970994985a.1.1792656898555;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm80367966b.32.2026.10.22.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:14:57 -0700 (PDT)
Message-ID: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:14:54 +0200
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
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX0OUHZLgu+sBd
 Bt/NDRWf3MRRChE4aTQaeT2QCPdMiCLg0aBAzarC4Smh1uE5iSLjCeuHwQXqXW8m6N0sXg3++ew
 LdYdI3+3ZvyEqZoPEwZr/JK4JomYpmU=
X-Proofpoint-ORIG-GUID: vrT8bDzHOfSfQ7swaAR-GmH0MH4esKUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXyTqw8ostT5d4
 cxvzVG9fRikCqGHivq8CjseGvIezSnArBVb1Avx1tZKC2lrKPBygR2hPwG/m3lenYzXNhWMed/Q
 yk1D3oXyn6BsOJen+jnhqQbDoKh8mSa0WXiRtKJCfBSCKAoZARC9sej/0kHlIqNq16+1I+4RJOV
 EaurcpbncnM4mmNvqPf3aeGO1jdiIESzrVOgIcdkQnvNZvgJXf/yxCkoq4GzcH827wk30Xr0nm2
 TjncjXII7lNq7GzP2ZFJLd/XLklz4nr0gwj9fwOG77y1kjs7091UNT4J3KLWp8QD6WT0QODmI4Y
 6xQmzild2a0HwSc7IY1t1ZyCSl4LWycqI+qFhOPWH8IeXhPTWfkU9DS0m19TL2rPJOw1aQw9D1t
 HhEvLEBT7Fi+Znrb4SMjKEEXM2yIB4OrTwPdqoGImohZqdsTD13J1zhr3tbR692KpkiIq8hT5xS
 zdV5Dj4jIdruKwripoQ==
X-Proofpoint-GUID: vrT8bDzHOfSfQ7swaAR-GmH0MH4esKUY
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9c604 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XF8Mg0B5h9f6Zh5FesEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> DIP switch. There are multiple daughter cards designed that can be
> connected to this PDISP1 DSI0 B2B connector.
> 
> The below B2B display interfaces are enabled by default in base DTB:
> - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> - CQS/CMS: DLC0697 DSI panel using a DLC daughter card

But if they're daughter cards, they should probably be overlays too?

Konrad
