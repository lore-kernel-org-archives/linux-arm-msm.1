Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EFB3DE430
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912625; cv=none; b=s6OUlSJM4nvUrTZaMgfYNmVvM4rU/gm9AiNIkDgOWUaNHI5lx+8sHlX9Z73ypPYKPwacOfsSKSuIAIuYOzp4xh5YaGDHmXv8+BbNWiH1EBL2UlxRQTPpBzyud1waXIKcbLuKqvTEUnkzrRug6tLmKgF+WsMhww9cNct5t4/HJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912625; c=relaxed/simple;
	bh=aOvHieyRqnQ+hfiE9N5HW0gzAL0FOhHrQWcuVqahewU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5vXlmrLj61KOAdQgLdkd1i/vGiccmAgBBME6zTurAmvrM4VC7D+8EQbUgpjqpImhpYGrTsu7RjQ/OshG1x4HW12GNMLO/yw0di5+rUNP6lfOIvcTPnhNfzfg2uq58yjgy/z5aFmUco/U6HJybZrQNUcYUy5Z+2g7IwRxPFH93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtdPLMEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kqqa0iXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtdPLMEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kqqa0iXS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755ksKt1680437
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 06:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdO5tJCvugSOddlXmuAd+t2BQy5hXWlPiDSJwuRMdKc=; b=HtdPLMENjHb/Ac9c
	mjpR5R616iB6AVYQKtVBroVdvrzqg9awIxPj2R1XjCdCDa21f9x+TwneCV87x9Yp
	nBM1gkIjmr55jGuPSWZvCBx+xikZP+jagjjH+jQDNE/TmkYNr5b6S413M0XZSN2o
	khLl5A83WG7LeDKPZHW6qwesS1nztAEszoFVMUHeSZM5J+VHZyJ+ltDtIsTj3Lou
	vG+Y3lyle+eLuKl9HaXW+xvsunAemBWbwn+9bFlPeLuEoXmYoT36VTWbcz7OdOJp
	7DpWlSTAGdqZkS/o7Ivd1hBztARoXf0ZKHH24fUlGT7RhekLM6TZdNHq1kHBUYDs
	kZOdgg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u3csa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:50:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso743106a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 23:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785912623; x=1786517423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdO5tJCvugSOddlXmuAd+t2BQy5hXWlPiDSJwuRMdKc=;
        b=Kqqa0iXSgrljjiGt//fJj9FRE/iXUtxWtUOmtRkBiufW4+0RssRh65qtayNLVsNUsE
         ls88rsAlYRcuphMmnpwJ9elLD8O1Y0S9a/WM+UpHbfd2/Iuf0vQmyYOvKDzV622yfmRG
         nSuvTTL+mjqWm1yDU1wZDMvNVGUx76n2fB9VTnWK1TrGA6UpbRauAamZ+EmtzYHNy/5N
         4lkZxpPe3yzvicZwA45a/aCj3GsQ4x7LUlbiXaV5+XDQIn6utJSqvRhfJHQYqqExADKv
         0l41INrCkOwbB8PcSCEvEIMf7WCZg1Mx5F0tdi1U+/RVJREmuncz3VsSO58DvfKS8Wwm
         LncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912623; x=1786517423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdO5tJCvugSOddlXmuAd+t2BQy5hXWlPiDSJwuRMdKc=;
        b=b7uivL9rIuez52v0AEjqXErdbFs5FCQSmje4Ys1FvJKONvRWE6mZP+tUJ15zOfHHnt
         zcklBhA2xPzqUQmJxOdwA47uv5wmdARfa5QwF7KGybfBfcB5aj0yrP7Sj6ljepUk5jFY
         oWquvtmqVrQ5M9wGPK5Y+7abAprmM/i6U8/A3q7MTFEzwowIMlG/GUZhrNrnUv7JRrt5
         Lfe40VCf9LUu4owq1APX+HwHtz3ExBaXfpvJ+Sg0SDKx/iSexLbATloSqncA/com6uro
         Xxe1VXRizmw80i9/Wv2iv2H3aAJAo1o1nieAHzpyicg2SK3lxAZg6j/se1LDY6kio96U
         Opnw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6h7CPkpKWVzJcfDqShfDvub7BWPeE9tXMRbbmtLcqoj0w9u5NE71QCqMIQWAJzhJNBTdC01C49BLdAhvx@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+X9QShA02tfRlNLHLCjW0ztdYuv6Y6xgJgiGaNHxQmQQk3Yz
	Bz45407LvZM/EbLub0vSO46ATf9+TX3XKH5NBfJz/Qq4k384LrnbWGjiED+pkEvoJD7mqC7XRzS
	DtpYtXDBi3AUrMEoWNO78GtN9Y+gsbbe+Z+ehSwuTneyn9lYwoEehtWAFXvE8yUmd7hAW
X-Gm-Gg: AR+sD10VhCtZMnDaTFssU/e8jjZzyBKaELO+qnVLGtM5NII9/WuAjjsEKQVjSprnCCP
	AY5Mia2i8hUcZwQTRJgJPCeSjPekRdg7mizUOc4B5RqIgV6RsgR/1raTzdWDDViKMt1UXSDLdLQ
	fvkd/mMTZfjKpysLQFzflxMu7skTBaAYkBliuSenl0pWUOvoG5yFPFWp/jVvbtxQNkGFDJeZdv+
	vdqDP9Ku9n2erfEviYFcXCexVg8l8w1vmt+Dj011u9i79pkpHe+ABZ9G1YA+2HN6SK7YDr0iYxI
	Vo5C8McPpLXmMW8OjCs8nW6GVsUj1EqtiIF9bJ7J6hFkh4hRZkSnv3VhvJlO6XiOl0PJ05JV8yW
	hNZpO0M/DBL9FEnkBYoR3K/3dbsxHeHejV2I=
X-Received: by 2002:a17:90b:2d84:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3903c58ece8mr4640115a91.12.1785912623281;
        Tue, 04 Aug 2026 23:50:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d84:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3903c58ece8mr4640078a91.12.1785912622825;
        Tue, 04 Aug 2026 23:50:22 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffa549sm3523546a91.5.2026.08.04.23.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:50:22 -0700 (PDT)
Message-ID: <08b636ca-a804-4dc8-9271-5a46583c60b4@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 12:20:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
 <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
 <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
 <7089bf29-acdd-49c4-a32e-82e266019910@oss.qualcomm.com>
 <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72dd2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=a89UX3q09JS4BkR68CUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ckj0Lmql5GH27sc5fB3R6ApiQeh1y76z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfX90UL6/KtvrRm
 +H/k1FqbnkeM5KzozqPlKWRn1KUY4Vn0VbrLXPL2+hhCOn0JF77hZzasiGEbs2vZ0+zPiAnYScu
 6zKPcduYmOoR3/SufnuPKp2dM3ylfLw=
X-Proofpoint-ORIG-GUID: Ckj0Lmql5GH27sc5fB3R6ApiQeh1y76z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfX2ShwMl02X1bi
 zTkpSrG6Uw+yOmfx69WR7A6v6V2O0lxL4/G3fHyndIJcVMnHhHuK9tZrjax6NaIEMpbyi5sivpO
 U6NzgsqrB0rRZpSlk6b1isZAizA5COqhTt36dL5uOqy479YZ4cUDoHF9G43p53OCjK4GLlO2dNB
 QJ2hJ8IAJli6eY+SlXuCaQLxHeheYENFOJHmFSj9sG6O4LehY1xXgc9PiK1Y5hphpbX7Q1dvIY6
 5EREop+Dz8LRA9JpKCmyZSPB2FKcV+cvRRzRFNraSki71qpSjH7xGLHDCkAtkTqD3BXSaJTnEuG
 EgtXtEraSshV3mCwKPJxd0jTVi6IVziKdfxkLAWy79UjJiRoyxEO6zr3ol9b/N1Cgf3hrFNe4iX
 PEuJgTNCRLTLUwnKwED3EEDAvkm++ux8pwR3l7XWECembHqg7CjU1Of9ud10US6hMg+3+fs2ySC
 P/iAyoAcbOdg4ulZ0mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050051


On 8/5/2026 12:03 PM, Krzysztof Kozlowski wrote:
> On 05/08/2026 08:29, Prasad Kumpatla wrote:
>> On 8/5/2026 11:40 AM, Krzysztof Kozlowski wrote:
>>> On 05/08/2026 06:40, Prasad Kumpatla wrote:
>>>> On 8/5/2026 1:46 AM, Rob Herring wrote:
>>>>>>     #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>>>>>     
>>>>>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>>>>> LPASS_ as saskiho points out.
>>>> Hi Rob,
>>>>
>>>> Thanks for catching this. The change has already picked, so I'll send a
>>>> follow-up patch to correct the typo.
>>> You received several sashiko (6!) replies immediately after sending yet
>>> you did not respond to them leading to Mark picking up this patchset.
>> Hi Krzysztof,
>>
>> Thanks for pointing that out, and apologies for not following up on the
>> reported typo sooner. I had noted the issue, but unfortunately did not send
>> the fix before the series was applied. I'll send a follow-up patch to correct the typo.
>>
>> Thanks to you and Sasikho for catching it.
> It is not about a fix. It is about replying that you have Sashiko
> reports with valid statements!
>
> And what about give (!!!) other comments beside that typo? Are you going
> to ignore just all of them?

Hi Krzysztof,

No, I do not intend to ignore the other comments, I'll review the remaining comments
as well, reply to each of them, and address any outstanding issues as needed.​‌

I've been working through Sasikho's review comments and addressing them in
subsequent patch revisions where applicable.

Thanks,
Prasad

>
> Best regards,
> Krzysztof
