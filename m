Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C74C9DE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405949; cv=none; b=QMHusslBABXnIvABqrOLn31twTkf6Y/BqWscv1RDseHnDdjaWBad26uCWT6/HlVrZqnXL3e/7BJZS0mB6mo7nBpPxwt6pEWu1QYFEt+P6V+3V1sMkBS8LXT6ABv6NkvoAvYcv6xfTJ1qpzAAILf+ew8aObV44IFgfHGnsJ9HJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405949; c=relaxed/simple;
	bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sND5ndAPJxNhMfIC3N/0xSeWwIOFyfuZeaZvNOMObLbJYz+POnC+XxeLWzl5TBAZL+9P5eQONHm4Sdi2+FitXG/vLQec/RNIKw8sV5axVBVThC5kaM8a/6zL//agI2Gb4r0WrY7+T8IaQdM6hn5sjwTEAJR6Msz1dtoNq4vky18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUt5B6Ut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdM/zkDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUt5B6Ut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdM/zkDx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtrZ2752277
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=; b=pUt5B6UtyVEue8dK
	i6HVuO/CQ2g4p7EkP330vUXL7uINxzn9e8uVakLcggpSEawoAGVFCZHTcZIoENx0
	P77BdelwTqWSG2/5bekVj4eKniMg5vPc/Leqec2Yuj/rzZWj2raIh74PA8zIy/Be
	gQfI2GFbflsAx8oywQ1Itkkj4pY+p1zA0Z71zGBs0tdZ9aD0VcYBZe/GmeKKGxIt
	/pKjm+c3LPWTpATqECgS2XkenB5ETNtKTm+azWoLmxfK1OqEgtRzIZZYIkt8BJ5v
	U4EMizY/tt9np+mPs1btFLZk0tE/CtJ99FHUCSaTnkGrhOzJHJqW/fz2/Lkdw6gT
	tWYI5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gmcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:32:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so70948485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405947; x=1793010747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
        b=AdM/zkDxelTEvuIcfYWfdMgCNo9uwrZPnbNSMq7oyAW1Vgm8aRjC4vivxe3GQzvpzx
         SA9Ji3tdgUNK7GjcFdq7zaMecywf68YruMRDiaoCLopLeNAlS3syb4feYb5aUcRlqCio
         7wEQgfTdab6ToE6Bu071AWHEj6FohT7Nkb3cTDVhFvoQiTE3gpm3Xak6uMHHF2VDplzK
         5/Q1dFlIpvutSp+EkCum826ZO9bQk5h3oLCHjYQE4QlUIqSDpybJm60KyIkRfaXR+oob
         o0UYRybrisCoAOD0e4yx3qCiPy2psaKzgnna3bKz1O7yG4TclN2wFH5yXZVBjvxaJCwX
         D9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405947; x=1793010747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpgRYqGBJFaTlw0Nu2YxpUpUPwy5exJAI3Mr3Bp0pFE=;
        b=sJ6JOhydd+YixC2ofd0mz5G/TQgepcaftwJIjs+Yn/olYaBlKJxuvtAjLqlo9JMEEd
         MbCI8a8bPPTjGiHG3OpXsjRzinoGc1TLQIaVoe8az+00qmgiUYmvDr9us/1zq/fYcoV6
         +v6+tb5pfOzAFPmTuO+8/nIO/fgcBX5UWWLqAcRQjhS4xSCWXUky+LbGR9+uasCTDcNg
         WwQDuZGhO92x2IL4VmCYgUt02Yeu7foPiaw396wpcsTzY9Uq1IaKF8WiTeVHCW9pfJRy
         LNCFbQ3x8x1I0RJWs5OhWTXjpeuanOFcOOC4nG/BdL6SpxbLsrN6MR8kP1eC4VxTc/nc
         MJVA==
X-Forwarded-Encrypted: i=1; AKwUvBxhQRolLwocM1FPsO/r52C9f8zcox4ckTyTcxobBwse02jGkaeVvyo87PKGNKZZG0uGnnQ6LToo8Nrcqa8F@vger.kernel.org
X-Gm-Message-State: AFq9FYJZF9qwOHPzFNoCXO7Ram5CaizomrWXW/ep07+IEtD2A5W1D8ta
	yREe6qpIygq0kGmuT2NRdtBVF9WRBMZUDcdH0CYu1euSo7E7yRqvg+w1PBaVXr39sWrhYpEp/4J
	/FM3xyhed7MfuIaaCazAzHMd3EvR/spny6fsoDxbPiS1xx+GIw1Bf31ZySq41ywgDVKIK
X-Gm-Gg: AYBFou3ZEbjcbEBU4ZGdBPRXSpJtcHPAKtdFt99GsmHp2yyDQdKwpCvqPWZYJgvTqb9
	AjUkVEVh0RowXt6f9JuHO7CQ7rAg0OF9y1aKevEqFJmT/T8zklrpxnRAS3/onVtI0H9RtmjsgRE
	Q5/q9P9z6dflKDGUN451mZNLPz12UlEi3BbfrI1PupZVhdk7kCPk32FQob9NwpYnQF2Yd5CgjCL
	YPG4A+hpGz9RFHxL77qOQU78Xawly+cmb+RxsWAKd9x7oOzkXDJkS/vaQ+4KX/MMVqpmQLZnEV0
	XFhxW0wk8bndBluyLBc4aTcmHFZjEazYqbvkXnVwYo/3mhU0thZIECF0U9RM6Dd7178zTXXfFec
	OdYvK1y43Ex4jcK64nn49vQ==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1334611785a.2.1792405946502;
        Mon, 19 Oct 2026 03:32:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1334606385a.2.1792405946016;
        Mon, 19 Oct 2026 03:32:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3607079a12.37.2026.10.19.03.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:32:25 -0700 (PDT)
Message-ID: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
 <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX9LTBBrqimGzn
 trZzhVTQAR7SbVQfYfG8oUP9/+oC1tMsT7sd+GUsy2ozWz10krSnaM11UFYPlVC50hCFo7ovWUZ
 +X+TAAcRrdfjny6L8qxX9o3f9c/UwcC8T/eZeyQezGb0fqukbBkGvWyL3HqIJ4id8k9+1Q+SJcx
 drzLmUQiZakI7q3z94X2v9ZGWPwdpl634bDWXRkDgzOTFl2LzsoCUElAvAv8tJJfVNdVwspTvxw
 mMOty4mcpr29UN18or5A2L5ZrA9v8QoC4bM5l98TvZyxuYQJsSYuodja7a4kzeQLXSuYP8GpDvU
 X9sz5a4q9lvt2SYqWRUIIFWgLSM+fNNW9Eey/5d/S/bfqUiRTH8o06MmYnQHY4wOGTy12M78qX3
 VI/Qfdf6gz9o9ZHT9xxHVURjP2/Bxd71qK1kE6yI3hf2Hh2zGH3kLXOqqgjT+Mnhjk24GlcKWxy
 zVHtCGA1I9M/zRl0czg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX5PXFVs525hYT
 5VN0uZ65QUY25uxmMyThM6XGWDAujpMsFEuaCyrdIonfCSou1ni25Irysy0AGDfsTv2fz5cVivo
 fqBW5QBQpJcQWmbom0RhdDnPTuxiS6w=
X-Proofpoint-ORIG-GUID: ihQQV721LKoW62TyVkr_uAkq1oEVZ_18
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5f1bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UWTLkw_F3LfYAFS6jcEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ihQQV721LKoW62TyVkr_uAkq1oEVZ_18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/19/26 12:31 PM, Konrad Dybcio wrote:
> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>
>>
>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>> Hi Konrad,
>>>>
>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>
>>>>>>
>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>
>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>> ---

[...]

>> microsoft,surface-laptop-8-lcd13
>> microsoft,surface-laptop-8-lcd13p8
>> microsoft,surface-laptop-8-lcd15

(FWIW I don't think there's a non-LCD option)

Konrad
