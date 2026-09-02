Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC34ACC89
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368354; cv=none; b=TG+X7hyg4X5rFfD96GdBYy/MbqNhzwfqIkisbFsJr8O9WJ5hweOAWSgiSVVW1iUHHn3BxhHEgVMAlGe5x22TqDbGLeWLHSRX7rln0MgrRqNRRXPSV+Btpie3QMOE8e2vOyOquI0ORtIO4tmYgVkAomcDeWGnxsEU8X1Gwm3K99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368354; c=relaxed/simple;
	bh=MzkVNcbwJx3DdBFKW/Eg+IrelBGsrxW6GRwxoH136Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kds3Tf3KdpbomYqBzwoJDhcGAdBS2v2ltS4YPHvBRao3acA1rxulSFM1l23JI2fDAdCAFKhTi5uvxNCdMmZUuujWFyLI+yTpWesMqpH+D8cKwHvnqjZjQ6U8AI2F/8ZA/KM3cmDQS/xxHEG4CAW5ZTH8cgHMgIPeIiC/I37vr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CblRizxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTLlmaVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CblRizxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTLlmaVu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GfcaF1494808
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4VWeAjn1O5Hn8350LhDD1vBbMv3y8ytANZiqJ99qoeM=; b=CblRizxDKb9FG0XW
	H11mWHUVzpftvuGmRF39QBJF9RoVPXqKi+xTjlvAA/BcZ/hWjth8MqfUMd8CxbvG
	wS0PSsKXRbixISZwJJ1Gf7Hb3P5glHzcM7QyiqbweX/kLVhb0BFIv6UC+tv+hNkr
	+dn5lVh4uWZLcrkAiPj4oA43UEEiayPi9LDgXF8cyOSqcSUhVOBJtGsMpMU2ab5z
	GXOBkzWzkgE0Oq0x+r+Yx3tfUgeXr2B9LxzGPIZl0NK6+f43BIS+wmSVWiZIqvPy
	dPzPzmHQggO5mc8uKyWmait3j2ytp1iNHEbvFo7pNzy7jQQ3jWKoPX3vU0PoF0xj
	0JXX8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4rvu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:59:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso2478057a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788368350; x=1788973150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VWeAjn1O5Hn8350LhDD1vBbMv3y8ytANZiqJ99qoeM=;
        b=QTLlmaVuCOpMYQSkPZfm3MifvPdI8nlNOlPXZT5Yex2sTN4FY9Gs4xTC9sq1MMtZnq
         f2tKu08kr3SGXImCSMaat1NDsv9ELiFpxTWQZk51NgAJALQJ5Kt8n7yrolGDsd2RZ3Ne
         RvigTpzs9Zfj1lLo2TaV8b+ITK682kFw1Z5dxS0erPAvbVH8N1OCwkqsSPJxor5KX7WQ
         8IQkwekJAhgcNrSHNfZZ3kbSBVvFR8fs2xmH4FqaLgEanULLOrxuc+sy/WQLTHX9O01X
         1Ibizy+v4zV0C3i1razkZpocJS/0ns//KMYnbB59cE0+94w5zpMzurlrTh3cZpTngKxt
         99Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368350; x=1788973150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VWeAjn1O5Hn8350LhDD1vBbMv3y8ytANZiqJ99qoeM=;
        b=feIU3blr8BJk3NxR5vHuOqQ3a99lOxq/A7rlWhTztr3o83vkblIsgLmI55RFgXOmVY
         v/ixTOulIZxctqe9RLs9tzmB4WjUNEmBNM8T3+JOtymNA/u6H7MWUqAmAmQGSk5wfmuu
         RbqPKP5xOGRDb0nLQuw/iThYC6W24Yb+gn9vEkw2UFzwnOLDmPr/VCuQ1SMy3VkIt05g
         xy1KgS2hfgY8GXt1kTselpc7p6fBLIhOtbSrJkNjxqZ6WopgCwW69FNeaHT+HRQcXVgw
         rXK1wdqtzMomEpUdGD7IvY4NGQ+bRSpOuZ5h2E3mAqk6GhD/0v9nqd+EJFX0ooa/YKce
         XQBA==
X-Forwarded-Encrypted: i=1; AKwUvBxgUnnH2OwPr52MUTIwolF2cMigSDNW65y8yyRCCHQzgWy0zJkZiUIga2AdCawS5Tfqa1DHz580XIr0P4jT@vger.kernel.org
X-Gm-Message-State: AFuF++mrmdrPDtmoNXXAQ4EL9ebQct39qpvXeT6Gdxb0wxflC0fw2lkw
	Qo3dr7yJb1Pdj8MT/TQp3Df2Doqv8yvWOWVZINZl9uvas22L5/kVUDNvf4yFOLWrzYYbuiKJmy2
	mNoEu2fM9QWCPRRb9iIGwjKYYtmrXcHMeRs7q7zerdr0d6hX2R6U3a03S52OZ1KjoEuiC
X-Gm-Gg: AYBFou1hRdpKweYEU2wYhhP8CTfoF9PzzpdKcREjux2CrIxZdI4DaMx+9++EPI82CUP
	Z4RgodYLNHE6lvSEskRfmY7eo1AMbWj0luzAIyN4RyIvhmNQyNbDapGQmyCE/jHCq324dm3ByDV
	G0SiLxvB7qRAWiAIDid7s5HRs+UNHIuOGNcEAF+ARV2PxwiUsUiUYiVL5/buA8CYfBRrrm6lq+h
	HIMzKVzmVKCo8+NFVeJrKJOHZkew59TO9Xd8X3hGKmhFpaZy2jkYQnzQHCC44/ztoKZ2tRow0yN
	A61lnSrRgYtM3UVXnxS+P9rgO9cPCKYjK0BKQVpql4r67C5JNU5dmmv5XS+LNebIiDcq86NuzJg
	idELmVc5mXcobfu6A3tJEl8XqCAZlyBIXO1s0OoALdF3gDZeOEAPJKxJCeBNPfUyVnYTY
X-Received: by 2002:a17:90b:2750:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39aedf5d887mr9659888a91.1.1788368350216;
        Wed, 02 Sep 2026 09:59:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39aedf5d887mr9659802a91.1.1788368349630;
        Wed, 02 Sep 2026 09:59:09 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm276064a91.17.2026.09.02.09.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:59:09 -0700 (PDT)
Message-ID: <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 22:29:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0OSBTYWx0ZWRfX9VuIHTXR1deB
 kxUP8Eax9MlTpF1RHOv9EjxwBYKRdIA95w/LORPheIRfKtu4A2+fvt81SwmQOydnz128uKMEA0N
 4k1wJhC1uKfveC/ajA2VXVpzOuqzbhpH5rP8uRQsNan44Fhd1XX9I+Yu1CYHAw0RHYnxOeKTY23
 zBhSJRSGhdgznJOqt9M1JbXNRcQYIT7fTQeEF2LpyaVXvkmMNUe52k/3L8Vo8A6PP62wr+d9TXY
 hwAPH5YumGYsl4s1hfSky18Y682kcccws/a9RZDpWPCT7po4qGqK+VDnJfu0u/8s+2CwsFbHqH5
 lOxBkCKmwgXQPvINUiSx4hVbXWjJV9NoPsv4J1Tf+3NHXsuQ1+R5xy7v5KLUSW3qglM0GayYbSC
 GyUMGxPeQjKlni6TbkJcsJ5WpMZcPjvbA3fhG/970YsadxkPgFe49Puc9LqusjYHuUAyQex5JrN
 /B7gCY7jIQLv43Y28kA==
X-Proofpoint-ORIG-GUID: manJA5BrpVLbGS9RyL8TDpGUgayr04Wy
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9855df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=2sMs7eQfJahgYk7ien9XMw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K0I1-hzHb6ZjckI3NYUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: manJA5BrpVLbGS9RyL8TDpGUgayr04Wy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0OSBTYWx0ZWRfX2Dn7lYspDLNl
 RGM4ZSL2cmEAhrq6GLZiE28auDdFOkCPVAYiy8Chb6nOBWijaJvkE+5os1ziXE1Z/k7/mmF32DT
 agD8ugBhKw3Zaihu7i7ZYmXtHz4mXBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020149



On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>
>>>
>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>> present.
> 
> [...]
> 
>>>>>                  - qcom,eliza-dwc3
>>>>> +              - qcom,glymur-dwc3
>>>>>                  - qcom,ipq4019-dwc3
>>>>>                  - qcom,ipq8064-dwc3
>>>>>                  - qcom,kaanapali-dwc3
>>>>
>>>> This changes the ABI without an explanation.
>>>>
>>> As per the harware specification, the controllers do have both
>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>> info. Will update the commit message accordingly.
>>>
>>
>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>> incomplete? Lack of context here is not helping.
>>
>> If they have these IRQs but it does not matter, then it is not a good
>> reason to change ABI and you should just add the clock as optional to
>> the end. Was this binding already released? I think yes.
> 
> IIUC the intent of the patch is to allow specifying the currently
> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
> Bundling the DT change would have made that easier.
Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in 
the DT along with the usb binding changes. DT change was posted separately:

https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/

Regards,
Krishna,
