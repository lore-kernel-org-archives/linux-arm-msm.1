Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E93CF039
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122953; cv=none; b=RbHJVKwofWgbBAax9v55282V6qVTb1SpiKK7TXJJp8wUs91qFnARPYxPUF9iBVGr5xIyU+E8WMU8TXOJ77MLkG+/QdsPtivvAlRM+YeU8VQAHyBRm75XUjDWYy9egmw2w3bKdF2zaSQstM3gideNmoZm8aoATdb8xqS7F6DdyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122953; c=relaxed/simple;
	bh=TXxeThOPsalMuxEKHxFq3CVipBw0fSnOB9//e0evp3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0KEVSWOhbJOTLR4UhJjRpCdurFv48wNJSSQ6TB5bmW6araKuKEkRNipP1AcuARWKoeXKRwNFKj7Pmgj4Zf1D7cgDbTUxpiKHXfxWABHDJdMH3ebJ0lOx81C+CVEoOZe30wGXwy48hbXyKk3mUVjiar+9E8+MKSw3UXynm6wqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFkpjJUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkUse6h9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFkpjJUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkUse6h9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZWSs534532
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=; b=MFkpjJUIeuU6UyUc
	hC6X9Sz2GHRSl5E9rmU0EMzBglkeL+ABNGrTod/Y+69le3Dy8FhCHj8uJ3kTUnXu
	0GSKdSIr4xq0edIZsbTJWSCNvmlbtsWQHkBUfdwoOqAKHdvRQq9fY0W8geG9JKrp
	BslIeRA0UpmLxPU7K+4X8VGD79pGOcnt+xh81/SyzPrRnhlgLeTFj3oLtiGwHHf6
	7Bb/fOeZ7Avajrl+GxfVSaSqNRFlxkCheDRn2WVSvA0MLDwbhAYMafrWumy3Vn7y
	4c2Goq8PpliUnILT+tqBCSZGxElRabVIPjAuXWplPqDE1gSh4XJlODjZRYonB4j3
	EFWWnA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1u8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:02:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso1055027a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787122951; x=1787727751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=;
        b=dkUse6h9MeQqWVK2yVRpi9C9/HIKFHBAvHj6q0E4KpDf3gnO7mA07GOBRRjAg2WJq0
         ylWJSqI2O4OwS+1/n5ZUiJ/OFpzLIQomA+vYuvDavNWdvLyyzJtupJ9+IzKSZrBvX58i
         Fq3QRGzxxQKRiQbKVMYt8XwgUtF6j3SJyUqozPPtpm/YYnAnvht60fRHuQCDy5742UEM
         uBsVmBl/RYHfas6BhmNbliqU09peATUNQQtUMXBD0TMim42A8K7hqneZsHpmrH+nDGIn
         CW9qDgKEKY2WKiSY8rN26F5e4rv9mGjD4eHpC7urwJw34P1eTa0b/fJTAtCa/VXD/pJH
         lciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122951; x=1787727751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=;
        b=NczLCSZpo5HMYx4br0JgHP0z8xUXvRs9oM3CbhGrg4mBcrhcAGl2sj/Jk1amiCwJnr
         foRaYn/CO67yLRHRSSjwXCFqBWmTRW0uFyJ55qNi+h5AH2/2DDrT17tvCKuRobxlD8Dl
         pveQ/4qXuDYtJuUktoQ+lzXDZhaaM5REFIPTMtOMtTMQ/ipP+jcbm3Qcxr/toh8Oizh9
         nehxEPhNI6eJElpuy3BePKvp3LMPOsF7umtWCyA8IjC9ZMkPVsNrYc8QnS/Pi6l9eJnO
         rTnoF4inGOOqoi4cnxyhHckN+cSwOof3Ep2Bi4d7ppHxdOpOS392QSFGgnMErdMMOoQG
         6cAQ==
X-Gm-Message-State: AOJu0Yzjwugzw/PmnDDTck1kD7gCPumYFWUmD8hHtFGjgJ8ucGywWcNr
	+sRLbR0XcZUHFq6+A/v3KPms5Hr2q0T3IXRCxyxL8ZTWPNZuNoa9A5IC1XsyFDzvsdhbq1Ne9i5
	9MIgqpZOGjD6i8P09HtglQYGGWI8+iRZevAIoWx3hdKpv46HC07FfAvdMcIXoa00erUWW
X-Gm-Gg: AR+sD11cDrMswbvo2gkVjcv6WZC0rskG3I65j5uGnZzSxBCHredAUPKoK+Je6Evuzzt
	L5kbqt3iQf4dCOrsq5NrlkwsbSvMSxQBrzzhsqWnn6RjmESc3xUyjGQHifJbcV0H7TvxZBRn8bK
	hBXy31K4k3w7VQqf6o7/Xf+BQlHiS5GmDWSu6p5rFIjjlqPEE9AHLDnwxOVbDafldJ+FdnY1nKg
	owyGBG4jpmyX/RqHq0tvuYzTT/U0aaRcbAZj4l9ZYrClPNv5gRnUg3MgShvKRhnvAL7HpqUea5a
	rrkVeZ5w0tSBQ97sxocmBCJRIDKXuxs2qi47ETYQRnJ/FVc7tofxHVcQeK45Rs+/mPTUXHsg/CT
	lSCSmIy/ylTaOapfUxKxJyoeCyqa9bgaMR6ALgyTwarmyOZErZWd9BZRS8Cf3NUd014wj5Q==
X-Received: by 2002:a17:90b:3145:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-395810af13bmr4215883a91.16.1787122950779;
        Wed, 19 Aug 2026 00:02:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-395810af13bmr4215812a91.16.1787122950272;
        Wed, 19 Aug 2026 00:02:30 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb321dfsm1585421a91.16.2026.08.19.00.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:02:29 -0700 (PDT)
Message-ID: <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:02:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX0Q2jI840W14O
 oWrjspK65O1jNUc4af1G2217UzPGhJaaa3J5/LAjvQ6czGGya5u2frHj/PkGeUQpACukOPME9KL
 K3vsVE2zruXZY0KfpEEiYhQGOzVxsoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX+w6HZeajZZ6n
 lhrrwgM3e6zyytQCXlQmi3J+OhI0UEYLG/l2sCBMSL3rz9KjKYgBH3QWt7bqJ0joEjP1U+ybTKx
 vqg/3KIdipct7m8bedEbzaehCcHXNPNZEhjPWrv5UdLQ+pIF87mV8NSTgMrS1LGu+M2thdmBUys
 zZIHl9pZXEq1s9fu37oZAFDzOwQWQyZTcORa17dI2WNzmZq9i9JnZGG4PXrpUHy/7xUMeJZDuil
 YzR1b1wSIZlEt9X6k+bae0gAJEFUybM3QCIfo7muiKqAs96yAzfqyoWwpYkPbJID4j1LeYNRKJE
 t83kzf4FwKs9fYrufG3HR+AHAXcj+TSWRDLrmJdLDpJz9xTjxGOANwfW0CEY+5zK/girtCUIwzO
 jSUE+NJJsvbhnDIfLUrhRoSCTlGu+OTrshJfmVia27h4qGyxlQQbqZmIqEcZemlS7b5TGf0VWeF
 Dz+6j2O6DCkB5xL/iVg==
X-Proofpoint-ORIG-GUID: _IqXO6wPvMmGoWFT4FVTa4LXCA1dMapB
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a855507 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Urc9x3V8Au4Xlx3QvY8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _IqXO6wPvMmGoWFT4FVTa4LXCA1dMapB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190051



On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
> On 19/08/2026 08:28, Yijie Yang wrote:
>>
>>
>> On 8/19/2026 2:09 PM, Krzysztof Kozlowski wrote:
>>> On 19/08/2026 07:42, Prasad Kumpatla wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ff8a35df7862..00d9a493fe76 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -175,6 +175,9 @@ properties:
>>>>                  - qcom,kaanapali-qrd
>>>>              - const: qcom,kaanapali
>>>>    
>>>> +      - items:
>>>> +          - const: qcom,maili
>>>
>>> Heh? This cannot go alone.
>>
>> Keep only the SoC compatible string and exclude the board for now, as
>> the latter is not currently used.
>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
> 
> No, read my message there - this should be rejected! I even wrote:
> 
> "But if ever this commit is used in argument "oh, compatible without
> user was accepted here by Krzysztof, so I can do the same", I will
> simply NAK such future contribution without reading the rest."
> 
> So NAK because you did not even bother to read what I already stated!

In patch 2/2, pd-mapper serves as the user. Is there any other reason to 
reject this binding?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

