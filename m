Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313C3F7874
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130332; cv=none; b=EkxaTrCRya3W7Tg+vnN+u8oqUJplHys0KixD58P+6WqzQD9NVUT7RVJa4oA3Gapxb3tQxKR7TwwPF5wCHr0rWgREll/OkhIrAnk++siwc7uDg8Sseid6NiMfykSlhe95v11JfOktD77nQs2dG7s/RhfbHNVrZ1/hlDDm4ksUVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130332; c=relaxed/simple;
	bh=ScThF5OwdcUEP6NgJMhRBD3QrSyhO08o9ylgYv6pjII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btz3dbk7EN2WEF3qKL5zLxFSeekath4RZigwcNGS8XTekcY+wfjd0KkW+oVbHn+7hxpWlMN8aAUb2WvPaMvzTPC7OjadoinyJr/dbwwvalSr95DfUmsSeD6IZzO0IEQR9Vs1/N781jLGt2kW4oziWuQduFiXzN/banb+6uViTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLaGO4u1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9GenXer; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLaGO4u1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9GenXer"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z43s3267413
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDqijI1fa+DA0xyHFiVX0V3OhG8nt69X8gIBkxYk1vM=; b=hLaGO4u1ElrepNpQ
	If/QkkyKbGgwhvwXF+qtEbeqz6IMjLqbbiPeXusGLz2Zxwx8i51QOPI+YIWuhEsw
	aOhJpO3EAQ2lKz8+T3pJ6mREKSeBhuJDMLgg7dq7YdjqbE4xdWVaMYiCG5fYg3on
	tB5YbYIkK1Ph/lNTfo6xiZCK0fll7wkEE5tF4BFnmPk9H828l/Hi/CWN/DGpeq0y
	VL0Bea47R8+Tv1EJsGLyWVrTQd1RhH1TIdV2bcn1PsGL/AmVpCdImTpnTCKYIfMg
	uJqZaUHiG7wXKsVXemx0QjVXqQNpX/QieavQmH9TNmhJC2zDSZL+SQ1E2e411lR1
	30gNqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffj99m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:05:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so29279585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130328; x=1787735128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDqijI1fa+DA0xyHFiVX0V3OhG8nt69X8gIBkxYk1vM=;
        b=c9GenXerg1+pPy4FkK4L4qfe0xyRsnYtLcIxbpkQkGwW6z9tggLgsRoJYVSJ0G4BEG
         m1lOZra2HdeEScM7F/I9BZgEMjJ/5Pk9qWa2PQVsNOJf7GZGpkVWTRojQunchTjJi8go
         Dmyn3MLrz8tzLZA/EuHO4cJ13TY3DircNnWrCIpZWY6vUbykGQdWILwrjdKc+Jrzi3MK
         4tEKwaj9bBzUbGjYVkYbavwjYLK8bs++xBKGFZ02rWgEHgTJqVIUQ3YSLk1FQplGyJ9a
         Ju24ZTXqGAWOoq6vCnBM4GrwA9of2dhgSF0qcxHvre8wcUO+dHF20tLCfK1pJ38trS3u
         bLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130328; x=1787735128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDqijI1fa+DA0xyHFiVX0V3OhG8nt69X8gIBkxYk1vM=;
        b=DPUh4z9SNUCFcdNlmfJvEFYeZjl+aum72Q9etwdKDCndYhFaZ1P5foyHQpPPaBwDJ+
         IYoL/ZMKIKiCnoQ1hoYQcHsXdajwabGhjNnAv5zVRYuQplkHUEkRKPu6V0V3IV9NrJEZ
         HQQaLc15LBOo8eZSscoWopyrya95TCP7zTuz/mKjbbOUEXS8Wt+xYxARNnqettBLVNxb
         NyVT7E0GxtVi4MrdcrwYnZM8uzUbjw+PRpfv7KQSWjUfbR7u9Ef63GToetQ4Kax1keJy
         0DdkFeyUwRk2hoy2uM1uMXsxD5iHt0OCmLBmTMW+si5sT3HMCjkuYJGFfSrdD7qAtH5x
         hrdA==
X-Gm-Message-State: AOJu0YxGvI4tJGxpSdTb+2f/pii5EUlB8iNcn5pX2oRS0IrxHOqb07sR
	EpCtoVXEFRC66oTIkTVtzPyy0FT2Uz0dlDSbK3TTrV5X/F8/UQ43i6RI1pH6tyP6O1gJArj2Hmu
	hVN8HTu8Xtsi9xrTvd/8QFs7lAQJiRFbrl/SG8GqflVtjPycU86hPgJlxCkQ04atQ5r73
X-Gm-Gg: AR+sD13eEHTQMCYzCD3Ei8iEvOCVwJae4SRbKB7rsrGnGbuvWshgB+hSb9Ik/GTB0sW
	G2TE3ul0dhKHsL2GV3l0ad8wmCLX+/HWzvKuwOdMAexFdnnBNcFDEmOHJ315sefELnkd8wpn9V9
	HHio6ShpHNoHps2y8vGmupUbZdaA1b673eKUzbCzBuv9Ji9afHtX3lgp3hnomPfaK2jvKrplMsu
	O7k3Gu/G/ZjtuNyU2O2vw1M2GWkbeUz0L+Zv+dhBdNfgXOWFY7Q6jreNmcz5/PrC400HN1kiFRx
	MU4WzN51PKtdWNwlxUvF0zGH9ZPxhZvZhCd95LWtSSRe7gkOqGOMvbAMEr08CoBzda4SlsZPAfB
	RCz/SzSwL03sx0HinXBtRyRvx
X-Received: by 2002:a05:620a:8802:b0:930:a08c:cf9c with SMTP id af79cd13be357-9371e6803f4mr218530585a.2.1787130328520;
        Wed, 19 Aug 2026 02:05:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8802:b0:930:a08c:cf9c with SMTP id af79cd13be357-9371e6803f4mr218526285a.2.1787130327979;
        Wed, 19 Aug 2026 02:05:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c4ac06asm46898066b.33.2026.08.19.02.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:05:27 -0700 (PDT)
Message-ID: <7e66a373-7a3b-49ee-b8b4-8577544ae0ab@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
 <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
 <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
 <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
 <7808f348-6f9f-4fb6-92ce-74aedd6297d7@oss.qualcomm.com>
 <3598b276-b2db-4457-bb90-95bb231fa499@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3598b276-b2db-4457-bb90-95bb231fa499@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX9JXdyMItcapE
 kUj3qai5NodXL1LPJn3ZeTiYXlf0WJVMH6zQMyKAjsOeDrqvoXtAMt2FD1koaYf4Md2YeGwpKq3
 qv1xv/5h6Qw8TCusN+1SlWPFshf+xQc=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a8571d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=CnoU1jg4nAEKJrG2xSYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BurzwJB-nwTC_BEfpjwEyloSG4AqXnxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfXz6zn1bq1Kejs
 dgmjWo1XQFJUgWXus3lQDw0O1qnL2tq1OoDciFqwJWWk1dAP9Grg2IExx7PBuK+JFkED53w0Qx/
 ySr+gRCDu+pzZ07pfNl/HJioDekBZAEPPzRYA6NMshsbaLs3xfNehYMYGL/vJWu7/kyRgSnpA/t
 6BekZ/K6LShqtVHjDrhLBUZnEq8L0yxEBTqOjxJupZb6eV+XmKvAfkT3YBFTz4lvHnD+2fm5KHn
 2EMc9JiETDaefAYJTmRS/x5S3hohzms9XOtO5PE2Lj0L75UKFFGvNorrb2j+f4g6Rke8k7phJ0W
 FYhH1f8G9RpWph7uhKBLLm+ZrcJtqSNJz6OAeLkxfwWPYbLLl46b3TMp7r6M2n7kxEyxMzyLYYS
 gcFqIep/Jg4BrfcGQeCjTpjGOgDmO2ejRzEwkqdITHHarjXNeeBQgFgYNQEk7BILWmB1QT2cy7w
 3Tq8hOod+mXRW+aNJzw==
X-Proofpoint-GUID: BurzwJB-nwTC_BEfpjwEyloSG4AqXnxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190068

On 8/19/26 11:04 AM, Krzysztof Kozlowski wrote:
> On 19/08/2026 10:56, Konrad Dybcio wrote:
>> On 8/19/26 9:02 AM, Yijie Yang wrote:
>>>
>>>
>>> On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
>>>> On 19/08/2026 08:28, Yijie Yang wrote:
>>
>> [...]
>>
>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>> @@ -175,6 +175,9 @@ properties:
>>>>>>>                  - qcom,kaanapali-qrd
>>>>>>>              - const: qcom,kaanapali
>>>>>>>    +      - items:
>>>>>>> +          - const: qcom,maili
>>>>>>
>>>>>> Heh? This cannot go alone.
>>>>>
>>>>> Keep only the SoC compatible string and exclude the board for now, as
>>>>> the latter is not currently used.
>>>>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
>>>>
>>>> No, read my message there - this should be rejected! I even wrote:
>>>>
>>>> "But if ever this commit is used in argument "oh, compatible without
>>>> user was accepted here by Krzysztof, so I can do the same", I will
>>>> simply NAK such future contribution without reading the rest."
>>>>
>>>> So NAK because you did not even bother to read what I already stated!
>>>
>>> In patch 2/2, pd-mapper serves as the user. Is there any other reason to reject this binding?
>>
>> This defines/allows a top-level compatible of
>>
>> compatible = "qcom,maili";
>>
>> which is missing the board part, and that is strictly required.
> 
> Not sure if you are agreeing with me or disagreeing...

Agreeing - I'm saying that we need the board compatible to be present
in the tuple, which the submission doesn't contain

Konrad
