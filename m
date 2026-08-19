Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65521426D2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130652; cv=none; b=U6Qq1lQq0gWtHoIs7KN6qSIQSeJLx54TBDSdJKoDHUMzsBMK1E99Zrpk/P6ob0XJcpw29axVhJmbA/hfN8fCdXOg5RHODybUb0cQgVGbtPrYOZyRcQtTtG8iTPioJMGCfQcCiSq2VTeg+4n3afO8TiQiQdOpMuEs7tnq/oD41HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130652; c=relaxed/simple;
	bh=l2RDjRd9f3n09xOgreFDMimJorkbpGJMohrbwuuPX6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxonlMOs6VT3AXBwXmVxIFNIEHQ7+rWzjQpNYRW1Gjl16t+mMfHR9zR4VL6B2b/oy6W6YyiLhuRbfJtPJvBnIHfBvVUxwiO8r0G//iUNxsVyfRevMuqBplCAwbqnXk4zcL2y+1my1ThVOcDYb8M5RCCcnjRYV4Z0qFnztvTiZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIqoJlgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLJmudiE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIqoJlgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLJmudiE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZGNC3671347
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=; b=MIqoJlgziFnPJYKX
	2P3aeZJJ1EnU18pwsmHVuQZat6n/RFX9/jJ0r5rDtOceksoXkksVXkj2l/UQ7vf/
	ZE3DtB/8P/9wiNu7/jLP6C8bWPvuODrT1rNV5Dp97w24u6PIrh6+hLplQHUibeLu
	tiAKj61u+PyeHQ4nGu0hED1Ewa+rLx/hXxRZoKIE/YAc3ydeHPSp1Tl7Id+gSRQ5
	7vKgs9Mb3tN0+DAdGTm0kqbTI1nareEPaqA+7VfZ+XwVdgrNKV1ZyASeR5ZjnjgV
	LmYsVauwzg/Oju5jN2jmfInBrfxPMp4u4lhhXRD/50BfEGqCUgNIoqdmuXASj+dD
	9wIdwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfttcv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:10:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3954def0191so1573727a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130647; x=1787735447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=;
        b=KLJmudiEvd0TVqpy5Hhu1Y22a2zQPVhclzqTedFw+UIXrOGXoO6joHSgCcYCdmVu8S
         Z2pd31VPnaMvzfUZpB+W6jGTLE/+LjGeSJZC/ZvDDuvRisfD1g1AiLbfhNwTr51+j4n3
         C33KV+ikfZ0ZgYKk6wIflgnUsFAx4H8cMTBvRD7lcF9pxV7tWkxQ4/MrCmRUetuJLnw/
         45bY7yL4Cti/ketfUP9+es2xO3am0I0KxIaW6EC4bzy37qCUH5Unr305oU5jmbi4oq0Y
         +5fIeuUTFANiF5P7Vt58y7h6h3QU9hJsaPtUoMgiUvGEAJAUpP96MsDf1NkVnSKahB52
         CpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130647; x=1787735447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MMKp0GDiCPnl181kXWr3csvjn76r0+S61NLsry6PfI=;
        b=EnlOeOrJG5mkMfL2fPz+XJ8GbhV27oSNrfWaIAO12l7WLrbgLZQCjUwVf4Ha7kI+xu
         hOGN9rZeD1tAjdyfTTrAVGoWdi757dWX2k6MPKTAqfveDxU5tumjJcMsJwsHMGCXCjs0
         QWNBjMmP+i2Lu+bVcpdCxsYSe1xrujG6ZwE4Ea7mpSgoSXKBlzdzkYRCvbXwqsU52toV
         KTLPm09iErQDhX0If0RLQ52d/XnAvxBN6w2JzA9kA6kYUCtwmnOVCFgKORJc4ok4v0Rv
         Zg+I8dcTxVOxKbct0JwX4ADET+Mo712py6AphTghXcuEqhIKtBHMdSdGvbRPa/Fi9nf+
         UDvQ==
X-Gm-Message-State: AFuF++l4nBKJ+UNr/2FFJ2caMetr6HtJP7jUIDPph/P0tIzqpd42zO/8
	6qImwWbkXDwogka4hP3Vt2pe51BYYPFj1QI5/Delqz0VZ+TBuKCYzmtPAejqt2S30d3slgqVNe0
	3kCThbePl7+QfPoUYTWEMHcp3HG9Sd9W5UYQLb75tqzXUiA7IUPgi1kkeA5vC+Po9kIdP
X-Gm-Gg: AR+sD119rsE7yak9RCQWwFd6Y6Z48FhKu1uLwKre0X79IbB9doNe0W24YnvBzyotkVe
	bZ3SbcX9Tv1iiBygEsONSY9MOaJorHawRmRsXYUa94PCPiWCfkA+hhq6x/IplX8GkLW5JoDOKjp
	pni56fbhoYiLXTTFK7nAtGwzHSV1n0Luwt/+hRQ9f9MKXj1FV5WB54qUQAqDnIp9QeLB85WqLRr
	Mai7/W+flSNFc6/BObfJFnywx/7rFWfz22+iFaGLi3o4TU8HHNXHpRkFKNVBLAwBqLeJfHa3G1W
	zFnh1c8uSrhtVzpwDexEuqH5z4fYz7QDZZT/hq1HJr4H7ynjfg+CRxaM/SvXqvWBLmgROohRohN
	hLmBs//QcCq64HreiWkdWFzkhOKwQsZZIJI3jmJNngsszbXul2QWvgS7tRyTGlr8IH97KjA==
X-Received: by 2002:a17:90b:1f82:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3958108a4c6mr6209017a91.12.1787130647322;
        Wed, 19 Aug 2026 02:10:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1f82:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3958108a4c6mr6208941a91.12.1787130646918;
        Wed, 19 Aug 2026 02:10:46 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm1985820a91.17.2026.08.19.02.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:10:46 -0700 (PDT)
Message-ID: <54ead445-4b48-4c99-8670-5357451c1827@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:10:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
 <7e66a373-7a3b-49ee-b8b4-8577544ae0ab@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7e66a373-7a3b-49ee-b8b4-8577544ae0ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a857318 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=uKfpDHMw6nCf4ZIY2h8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfX3IRdFeCQzHTb
 SeEMx5iMssNXlrIKsNyuIT4fwEq95thHbuZAxnw9KNp36EvvvHx3ROMue3kcJKGhHt+xb1miSyA
 /5Q7Y4W3jJ/mreiVTpL4feMzAc2u1nU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfXyn9MRJt+ba9p
 SNeLZ+XUSMPAVcVmX6J8CF+3G9A5LwwZC8XsYxaK/zzvCq5d3kTQFAt2bZ0ruTWLHir+S83a3sy
 IlTy3lgQNPo/qmpWv306cGvw8XOEpbrhEwsY6WE4OplJyqGsaiKRT/AMp0P5W28xmkAIw5yVWYt
 1iFktFzhYiahq9wLZzGdmCcm3ugq8M1hsRMBlX6rP/V9EIJII5nZaOV0ChL6uU5JS+0gtSWqRT6
 AKBAD+ZaUh0gfNCz4v2dy18gGw2buRt/c5qD1L4r6yM8GXUkqWG5XZOB0xzii78lZ/zVl2e1wDI
 MmDwRDw24IQB90Mw8o0h/ZGvmtxG1jLppYvSr9aGpMg9MH5CbdVtz02Q9a7nxXF7xc3WTCdCGex
 Momt5LyOdcjV1gUaMxE4DsMfxTPldZWpVKleFlVkr6Qc5Fuvt8D9+8uugNYXOldP9LW/6XDtSmU
 dRaQDc1+suosiB8ZVvQ==
X-Proofpoint-GUID: TU5UN71KfRNZNgCSg154jeiJft730AOo
X-Proofpoint-ORIG-GUID: TU5UN71KfRNZNgCSg154jeiJft730AOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190069



On 8/19/2026 5:05 PM, Konrad Dybcio wrote:
> On 8/19/26 11:04 AM, Krzysztof Kozlowski wrote:
>> On 19/08/2026 10:56, Konrad Dybcio wrote:
>>> On 8/19/26 9:02 AM, Yijie Yang wrote:
>>>>
>>>>
>>>> On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
>>>>> On 19/08/2026 08:28, Yijie Yang wrote:
>>>
>>> [...]
>>>
>>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>>>> @@ -175,6 +175,9 @@ properties:
>>>>>>>>                   - qcom,kaanapali-qrd
>>>>>>>>               - const: qcom,kaanapali
>>>>>>>>     +      - items:
>>>>>>>> +          - const: qcom,maili
>>>>>>>
>>>>>>> Heh? This cannot go alone.
>>>>>>
>>>>>> Keep only the SoC compatible string and exclude the board for now, as
>>>>>> the latter is not currently used.
>>>>>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
>>>>>
>>>>> No, read my message there - this should be rejected! I even wrote:
>>>>>
>>>>> "But if ever this commit is used in argument "oh, compatible without
>>>>> user was accepted here by Krzysztof, so I can do the same", I will
>>>>> simply NAK such future contribution without reading the rest."
>>>>>
>>>>> So NAK because you did not even bother to read what I already stated!
>>>>
>>>> In patch 2/2, pd-mapper serves as the user. Is there any other reason to reject this binding?
>>>
>>> This defines/allows a top-level compatible of
>>>
>>> compatible = "qcom,maili";
>>>
>>> which is missing the board part, and that is strictly required.
>>
>> Not sure if you are agreeing with me or disagreeing...
> 
> Agreeing - I'm saying that we need the board compatible to be present
> in the tuple, which the submission doesn't contain
> 
> Konrad

Okay, will hold this binding for now.

-- 
Best Regards,
Yijie

