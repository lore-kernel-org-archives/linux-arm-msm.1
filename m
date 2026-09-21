Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C3048820E
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988704; cv=none; b=fGYyli8Z8Sz0gysmT3XN36ebIdGSqDMWT5Q8VrZ7tn2MM11MD07rYaP+eXxbv7B3NtkJeDhu4pXPWsQmdphueTyAeMnIbe3pdtiEeP/NeLBItkRYm5vRY+rAndR3zFLZFx0rL30io6gD8k6mpsw67Ft2uaT1Oz82inut38rAiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988704; c=relaxed/simple;
	bh=dEVLPmqR/1id/BjfqO0m/HlR9Yn1n+ARu0Uww6iNWjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nidVlwRW/Gs7SxngBdGjBUK23t5nnhrPQWqANjYxSzq1youOaLgAGbbGum8ohq5Q70ye6+Akg/v6Ru6FKUkfuKRasYua8jKKeDhwJ08hIr5oBJOmpazWvF1rFc5gO/vCTSHEE9er1tL9wGrIIcqUD42YEfMA7nghdLkF0fsEdZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2JbeP3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3hgy5MY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2JbeP3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3hgy5MY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdvST3818662
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiBi4iP+L9EAQgTDAxCcxqJX2OiizfQ3gDJCjUFH4r0=; b=f2JbeP3Y0CY3WjY4
	+v6PHGf0Jpw5dtCZ6Cydo2OJk+XHGPJK7NCcjTIwZzlOKbuRY+qYfPrFUOoTMjDt
	iKm77onPxHICG25yJBy8/b7mPxi8YzlE4cSD7Uz7a56NYZLxAWBQGC8icUwDFLq2
	+UBETsWCwVEwdyLXOGTF0yxwP7At10IF5IvXgI9+0jvm2NLfTKqSRdMdH+ozNtQI
	u1sY0mEV9V8IqVVxIVS293w4X85xrxH5G9oG0tp4q+Lo5ySvp4b5pvmjK8DpW8Xp
	ieUGiCIM02hnhITQMf/EmvurYVHgmMBcLHfuJlPM0qsdmX7I9AG41OFqp6y04tzf
	K/GMMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79aap4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:04:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so55919725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988698; x=1790593498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiBi4iP+L9EAQgTDAxCcxqJX2OiizfQ3gDJCjUFH4r0=;
        b=D3hgy5MY0estKeB9JTTbOIu24HZVRkIFn8FJ1lOyrXtD4O7bGcb1UJ4uc4+kh4U55g
         3zGUMZQMIW0D5NzudYhkKRhNRr2rq4+s8g3v6nSR3ShQuXUJ+3cm8LeWgcwxAV2r9HJt
         5Mpq/LiEI3x7bn6N06bMNzJJ/Or5AZpoTvlRxDNg7UzCiFAAt+oVZhM2HWdAsSonYs42
         IyY9GfV6FJQWCgD0drWUire9c0elJjH1zcPqPTxdSj3TNmKKEPA0jwQzML2KBw1AwFYd
         4MyElry5VDKeqhFUSRdfPJaLwfEC1v5jAZsoaLtvXqeA+JYAXGRxgJgFY+f1H0q9Ba2A
         2CQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988698; x=1790593498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiBi4iP+L9EAQgTDAxCcxqJX2OiizfQ3gDJCjUFH4r0=;
        b=CIgEoIBl85RWR1GPouTaUDrW2ARjW9KvX4YBlmNF/+XFX2eQTs/pHqt5TC2wOI2/d9
         lVUUhf+UyevVFAuhIFewNoYM7RVMe1yTHtR+7wuHp9BcMOvX6pvu6EVkSuKeZQLK/Elg
         PSMd8+3Ecx10zfrrQi6rqQKIIgCqA3S4y/uj40WOnJ5OIrtzV1CsTsryyUPDv2e9Dw2Y
         EiwGiPC95bze5fiAg2yQhQ/m7cIdMLePjFKvVpw58AixGIPMbWIrLfrGW07UJ3o79mbg
         howYfnuJgJFf7vH2k9+HrLeLkLkNxtFjmcuCiByg1nbwNB9X4y9ngKVxbIvldN8VOFJS
         Xz6A==
X-Forwarded-Encrypted: i=1; AKwUvBwzlASMGXMt8+AePN7fc7Eob/ErSKYOZYeBwkRtpEhFNbJKeeBb0/Qo3AgI7OMBBdyhVHSrA9E0QbdXKIk8@vger.kernel.org
X-Gm-Message-State: AFuF++nOGCpesQmHYEGUjUJu1Sj81gkxB/8jzpIbZJWh398+Lu6r47Zm
	xvCV+xSv+FMDnhX1NtGKnoOf3foDLhN/UpFDQl3bcZ7DpLvgNLbslXXy49p+nri+2PyBcK/US+U
	xSXJUyUdvxO2aAKKKpUlFXXCfZtYoy+WMzdvi4NsqcmCRtKp1xpeyn8M0BnVBW3+suNGJ
X-Gm-Gg: AYBFou2d3Ax+kfLLQL8ycJsUi/BpUHqZZA8WSKP2UHGaWlHuKG4x3R+QtP9pmT180Ig
	zDKtz8InRJYmcc8ZK7I/FV2SABhLMe2uzC4cFnnoVBP1CKd7KZhak541oBvUil5s+DNLrPKXgbr
	1Ekua0xxbfOa3Fn3qUzKL3MSAM1AJhSCqFLg5H11rvMM/3xnrX57WvbY8ywzYDIT7/rgT3PQUky
	2nR4oTg2dtwzJIOyVcwgXriOk/MuY5FS1hBtOlB6euuRA0gvxMo2sVORZWdofxC6HorXfgv6T0V
	Ob+iqsmJBGXeoJUoWqCPLCz7jCq7YG19lO+JM/fCWKOwOvcmzL8p6wLMlOhwKLrxBELLmmJwUV9
	KEczIQ1afgAFGIVdPkXjH2dDTdqXr4pfe
X-Received: by 2002:a17:903:1a8d:b0:2dd:c100:7cbf with SMTP id d9443c01a7336-2ddc1007d83mr99114205ad.59.1789988697535;
        Mon, 21 Sep 2026 04:04:57 -0700 (PDT)
X-Received: by 2002:a17:903:1a8d:b0:2dd:c100:7cbf with SMTP id d9443c01a7336-2ddc1007d83mr99113765ad.59.1789988697073;
        Mon, 21 Sep 2026 04:04:57 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm30282459eec.16.2026.09.21.04.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:04:56 -0700 (PDT)
Message-ID: <81962aa0-a6b8-460b-a9d3-c325a453de48@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com>
 <20260920-humongous-raven-of-charisma-bb99ed@quoll>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260920-humongous-raven-of-charisma-bb99ed@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab10f5a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9oknD-2m-boB601hatYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfXz8khwPU3j7zX
 LOFGXW3de15XmFiyYH9NwgEu2+hRkNnWc4+H68jEqwt1tuyA1MkjyhARFI3c09qmxkwpY4mr335
 kbXlElSA/sNxb8g8RN9+rCBUwXCGvkE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfXywv1vS24dOrQ
 cX3zp5d5XOakJtUABnIDLoM6XKFyGBGIaRpK8l+7H471v2L57E3CwP+iTUf1x7DVYPFrAZgml8J
 aIheo5vw/LkknLXGvRO7wTcXjRWYMh0oo0KkMZXSZuNStJS3ZSehYU3Rgm4xyvkk7HpE1ttJ8lO
 SYyUW9ToMyj2D5s5+nH9tEzvjf4DtMSV5EI/HcmKC8tEyp98lx6lT9RPvcUM4USHy/rg4Qt6x4t
 Pss8YwURaT/iqJ7xq+wLrN8s905/0uJ2esOrCZJLPnWgcnQ65ey/reboVTq2DpYQru8ieqYl/dF
 LBioISDQV4t0tUjzaZBUcPqPTvtuMcr/UtS8mWDTERS4Ofc+7mJtxZmw6vOn0MQNXAYOnd39swu
 doglysFRAQsZaT5+BK2vbfOZ3za/hP8niUAh8oFnF9raFyIOcgC63BSq9GL/Ekc5Elm22eMeI5H
 sklaS+pJ3BVrmZUp3Gw==
X-Proofpoint-ORIG-GUID: 5mrWKJA4ScqyfFuKhvE5smQ3areuTBQs
X-Proofpoint-GUID: 5mrWKJA4ScqyfFuKhvE5smQ3areuTBQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210160


On 20-09-2026 04:06 pm, Krzysztof Kozlowski wrote:
> On Sun, Sep 20, 2026 at 08:32:29AM +0530, Vishnu Santhosh wrote:
>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>> domain with restricted access to system memory. BAM-DMUX DMA mappings
> Then this is specific to Shikra and should come with its compatible plus
> constraints per variant.

In v1, qcom,shikra-bam-dmux was used to select a different RX-buffer
allocation strategy. You asked me to drop it because the generic
qcom,bam-dmux compatible should cover that use case.

I followed that feedback in v2 and used memory-region plus qcom,vmid to
describe the optional firmware/security configuration instead.

Could you please clarify whether you now want qcom,shikra-bam-dmux restored
specifically as a schema discriminator, so memory-region and qcom,vmid
can be constrained to and required for Shikra, while the driver
continues to match the generic qcom,bam-dmux fallback?

>
>> must therefore be constrained to a designated region that can be shared
>> with the modem.
>>
>> Add an optional memory-region property to reference a restricted DMA
>> pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
>> remote execution environment that is granted access to the pool through
>> SCM.
>>
>> Require memory-region whenever qcom,vmid is specified.
>>
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47b55d57580af209038 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>> @@ -72,6 +72,24 @@ properties:
>>         - const: tx
>>         - const: rx
>>   
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to a reserved-memory node compatible with restricted-dma-pool.
>> +      The BAM-DMUX device uses the pool for DMA mappings.
>> +
>> +  qcom,vmid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
> Drop

Agreed, will drop minItems in next revision.

>
>> +    maxItems: 1
>> +    items:
>> +      minimum: 1
>> +      maximum: 63
>> +    description:
>> +      VMID of the remote execution environment that is granted access to the
>> +      restricted DMA pool through SCM. The local execution environment is
>> +      retained automatically and must not be specified.
>> +
>>   required:
>>     - compatible
>>     - interrupts
>> @@ -81,12 +99,29 @@ required:
>>     - dmas
>>     - dma-names
>>   
>> +dependencies:
>> +  qcom,vmid: [ memory-region ]
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>     - |
>> +    #include <dt-bindings/firmware/qcom,scm.h>
>>       #include <dt-bindings/interrupt-controller/irq.h>
>>   
>> +    reserved-memory {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        bam_dmux_pool: restricted-dma-pool {
>> +            compatible = "restricted-dma-pool";
>> +            size = <0x40000>;
>> +            alignment = <0x40000>;
>> +            alloc-ranges = <0x80000000 0x80000000>;
>> +        };
>> +    };
> This wasn't here before. Drop.
>
> Best regards,
> Krzysztof

Agreed, will drop changes to example in next revision.


Thanks,
Vishnu

