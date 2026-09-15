Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2224B1469
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488131; cv=none; b=KP6MqdWXLb5QkbwVqOrU34jyOBOjWPZDcWyF8+e1lmZpfiDgaB/Hn+HesH5kb6kx3A5S8jcXQ/KueEOgJ7Peio1wd0FrWzS+ug5S8/VGChsrGzuY2K8qJVArG9x1mODIZ4YW6ZArjwgduDqdmBdhieqO+h+vPdEtglGlllhcvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488131; c=relaxed/simple;
	bh=NKJuB0TIpLrtUCM0wUQ3aJBmWdnBf3WJenqkw3nEnrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWkBY0LDsIGyzMwh9y6G41sFt9dS6Z8nwZyZFlN4Yr+qmtCcpP0sjra2yhdvd5YbU1n+Qo1h8Qq78UDOJdBnDT5g6YrUwVF59iuC5wwwR3IqYnHqENC38wily0byk+XqwpQvrQJF2PM1fjEYWWaZROUsJnCyQgV5vAS196UeOiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eycpzX0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLZDE79e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eycpzX0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLZDE79e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAT5C1014262
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=; b=eycpzX0VnxykGJNS
	EGyXe31E4ta5U+T4OafNRm4SfX1w/Yy3tHqqklKVLnR0f8SEdqgeBxstJGqnAtqQ
	yu9wKqyYDEDwHcTDeDZiIw5iomem/kVVz7MFsfXzjadCiAXVMMOh8JDPSwSCuryE
	dTS847DBS0+ewmjo1q7xah/LjqiRpu88PjLWJP6ga/BKj8qSGHtu1SlbSdRYMLcm
	eBp0M2Ko0an+f+/+iAMZ9Jr2CpzClirqCsy5qfDgKUBPX1bhEkIiC+Brh5jDrQ3v
	XRoouy2cIZD3f5gGim5wqpDmmS/F593l1GMR1RPK5XAA5aS9pvoJ8Yal/PWS1XWk
	ycCb2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea2t0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:02:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd753a52bbso25811495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488128; x=1790092928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=GLZDE79eqAsBTa4Zb5SwepVYwKnF8OiN+EgBISHQXJSG20xYo4EEw+ngUFSVF01zCP
         1g3v1N0HPNr/jxo63y5m+vx4b04MUPo7NwhJZFmg9XyOO+psn9WFRjhtCokV9KC/sPcB
         Dj+On+R58SGzBcGLHq8LH4eMBr9U8G/1/ueB+Jeze6rCcnYAx39P8wKyUcA8NrIbNsOn
         GhVU4HX+/jbhB5XyQiOe8cy+/YfeMtDE3PZjG0TX6vBnwS/7Y5zk+CJoHOZjiqTYH3VY
         3zjUjDmyXn5PnF2GfwOEH3tvORLRLOd3oxfywDCZZ/B0eMZ5s3ZtRjXZCOnGeUqKzNaJ
         sO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488128; x=1790092928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=AKWKDbZyn67u6UFtZ12X6Umtjc/ib2LuJvJ/QcU2aC9wKZZBMmIphFPVQa32T44dI3
         FJWxYM/tIyQkmh+4P4sWNNYLU4nngGWo/Vk1UWmnc9v7kqSbkMH2iSuwTN7cTJtavvkT
         2xKUA7tGfOxdRFsQ+drUu95h5T5v18J/VhNLd0b5MruEasel0cWTrNtisnbuizkMvrep
         vRPJ1xZNRWBiyYCI86dx8XHTwcP+whj/wIo+NVHTCs4WsY1L6CnoypkN9mRjB3bPBRll
         zdOrSJownqUbhgSxsXptq3VUQWJUE5LqUGBUiYJs02Al+ywO9XbPViwHb0Ybaz2oOQJg
         QMWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY7o0FpzXc4lPY/oeqDLWAEcOnQqAcdP/DZAQNbcd+dvkTIiwcej/E7RXduLMbvgdDKmJMliNqPcvoWpHQ@vger.kernel.org
X-Gm-Message-State: AFuF++nUdlIEMAzlmqzMd36wmRrWEyjmZ6hLGyVFExJ3X9lohOvpfJjR
	j0NAXVYKa2xRJR13QSYctc24o9HmSOisLD7TexzvsqGefYgp37BkNTSpzwd/lO+vSBzoD8ASvxO
	lrBy0g2Wrurl4jWmRhfqpr9w7hAe46vQb9K8Bt6qCrZO26g0/NplJCvGougi4ra6TXuvO
X-Gm-Gg: AYBFou2TGtWZoVB73Mg3TuhYcEF0UJOF8O9a4KkYPed8KWlF99K7vnx4MRt/x0eE/sM
	bDXO0CsTTxep5aN6rRUmDKRF/JdKKI7kWOeT+lskCLqB1EApRQMv2EwqoFlkBWH8WtaKFQyAspg
	e3/uzsxepHGcmKK2iQP5CDF1n11uQPtWkNVy/0BUIUxiB2jWYXdjLFnRwpZCOvnmvY+bzP8w5t0
	V7OaBX/nMY9frvVemCnXqSPGP91y3QkABvYx6YBzEMCZ/Z6x1erQfPDrTuCRID+04Y+N5T70/6G
	jFHhRyM3kGUB3wu5MKt87uXEO6GtqVs2qWG/argjr4W58lfY/eYOJoUDujc5yHbTPKrTv4K5qf/
	+lnx6waXwWF1z1gCjYEwJc/FLJai8thUV0nFQ3T7K
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819835ad.13.1789488127778;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819005ad.13.1789488127162;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm69974165ad.2.2026.09.15.09.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:06 -0700 (PDT)
Message-ID: <f67b20ec-4c5d-4fb6-aa91-f3ab616e80b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
 <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ursJFVPpv0T6sckGg0HJTEnGFteHumyX
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa96c00 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xBKF7SBF3-SEUEZML9sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ursJFVPpv0T6sckGg0HJTEnGFteHumyX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX1Nc1wHnXa3lz
 NrSzyZHE7b/T/0WIntVfC21PaEkpq+OJldzsuckumF2lu+wrqyBkPuQYpH6mNqW74wwe92AkOMf
 HzeyQZB1bFem/blnteAaMGPyBUF4iSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX0XxduqTjYiSD
 78ySDLDpzpmd9Zp5dchzznaouNboL73in09jdiov6aN/NfWXOcm9qIA/weubybR0H9P9B3ZQNaf
 AztgU8z408tz8fVQ46rAGOMMxxCAqfJB+vuQKYRkf9XjrD0ZQFx7NKd9nBgipNPvWhdU7iMa0p3
 5iB7cT3PwKumLZIX+kvSFGQWBRAHSBSBDsPw9RERCckY5OGRBBkj4sv2h67cXOAuutHySegBb07
 2LbmUlMw1/SGqJaSKysTq+T1Jh4oFLjQBFizI1/iMuM6isac11WsExavsK7CfpQ8q+Zblkwm1ft
 j8YF2g8lZWAPR49XtiPuUbyB6CgODjOA/sKZuBPKYtQLKvvXZChC4jNMmlFPKXYOuscIJIwu+CI
 9JEjoqeXz/Kd3X+hp6zVLhH5B8QWIyy2b2iKY9FpJfJ5X30dsp7QZLD5jZQge5uj7EVKKl3fyTL
 9ply8o5r0LMpU4ApKlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150233



On 9/9/2026 8:24 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm Nord Ride board
>> specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP
>> sound cards, thus keep them in existing qcom,sm8250.yaml file.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 1536fcd96d68..bdbaa8c822fc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -38,6 +38,7 @@ properties:
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>>             - qcom,glymur-sndcard
>> +          - qcom,nord-ride-sndcard
> 
> I wonder whether we can make it SoC specific like qcom,nord-sndcard,
> so that it servers both Ride and RRD reference boards.
> 

Ack,

Sure will move to qcom,nord-sndcard.

Best Regards,
Rafi

> Shawn
> 
>>             - qcom,qcm6490-idp-sndcard
>>             - qcom,qcs615-sndcard
>>             - qcom,qcs6490-rb3gen2-sndcard
>>
>> -- 
>> 2.34.1
>>
>>

