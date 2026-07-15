Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E593C8C43
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103119; cv=none; b=oJdiM5BwSxcu4IUZCyubewU/SNG66Gc1iX8l0L+HDnXXAfkEMiQQUyIAkmAC1RjSR3xq5kllnA/lSPhFgttjxZ5FArRqJ63S7mhWuOhRkbi8xQNDbLE4VZ5DA37sgdyvfgapZ0npxYLEBOnBrNfdb1IJUO90Lswspn97qHM5LFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103119; c=relaxed/simple;
	bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7BiSiF9H537Skj6inMsTTW80od5ch07CuXnnxi+YThjF3Q12ojYW0wlt0dKzODt0ESfT1cvSNxX4umwm35ArZHMcZvp0KWM1GZyX3ijGvLq6exYnR6zQEByUQ3h5/txW1hOy9bsaR9W2qyY6aP1Hr0caVIT6aBj3Yse9j5STKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2WS63Ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG6vH4WT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2WS63Ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG6vH4WT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l76U2679739
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=; b=B2WS63OvFMmtHXUB
	BxrUqzEQxoKZYvtsum9IcOUP1tqNDNEcu2pf9LZDaMVeJA7nVTgCCaZieHfAZr3z
	0ykb++CHV0InE7TJe0FI4A8Svd3cp9MIGQtqgGu82FYWvz1nNYuLf2i5flPkehy8
	LoSx+BPy1W/XobhdPoKkO7wTtlZH1rvyL+l1rwHhC52oQKuEct9GgoYNL4evOw9k
	N0go0UvDgBbJK+0ltA3kjkcy+GJSLFraVIlVXzmdzi9Zpq2JWQ5wuWOAvHqQpWnI
	2WKX5Umjr2GRuxkGdXkcnSzO/6lBcB3+VQ4zYBoqIJPuPxzacf9pxXI+0l/SrSqM
	epH/mQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuur31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 08:11:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so78352751cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784103117; x=1784707917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=CG6vH4WTD01bgiYJmJtUR4HG7ZUtpnmWEaXNF0Q7gXdfta8GmPFM3Z18/NO26NWRjG
         A+biH7TUnLidKrv0bl7F8/eaABros33Da7ViF32NjxOH/aBOogg3R40X5C5xXGIcYTmB
         nvQZS1T9FAWRCDXJgknTQbaF8ICXAgsoUAqZEh9zfikQkVfh1IB5c3Mt0AaZADu9hnbu
         DZ9TquPGeQLtM9u+KbZdkKBs+yiRLOsccdlcP+j7eU2awiu4yRQs30U1wlxe4az+ykXR
         sc3nV+q6t7W/halIA8GaS5+GJyfdlYuygh9FqiSvW+hm4lzT0Y3w447wPndEaupslpFy
         VmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103117; x=1784707917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=FsTmxh7IxlWssEKrfMnFCy4yK34ibFXNI1Zlhf5yxDCItfEFfg845nGFZCaIh6ypqf
         wOs3vfi/f85FrkPQ1JPvSUoHY7WQIo9eGC4FwFPA/iUvSsQOarMh0n8od2WVeU5pxuUn
         kN6ZrWbTc3tu6wKQJXu8v+FrNWnWV/yIqrIu0FU39Uz5eN+Cr+tIeEtCrUXypLok/E9H
         +e/O42b3pd5ISgz+gp2haM1FG5RcLzGqFq0CjdeCe0foTtwmO8UvdYLzhfJdwz4zn4Iy
         LIE1MWuo9ojMDKfJlZX6yCkSoWKZl5Vnk+uDClnW441H/X9UlrOeFYbNjPiIX5yiOB7n
         maAg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9hGvYqFwpot/0d+wTI8gVde9wgWd98zse8AX3nbDph9SzXxaduqUiT4NHst3zczR81d3kewPdBgyZuged@vger.kernel.org
X-Gm-Message-State: AOJu0YzWP5i4I8mar+WMt2M/mEcDdvFTDSSKQvJh54Ds+xANi51Sb0vt
	1P7fOP1EC8mLTPyqrPB8HmGfPFfSpz48TTlBzBxglDniOiz1m1PNfCx88Ejyzw+AWgVaUHZX9gQ
	GeQ42UqlL34UUI86gxV3UMBR62xx3jtTsyAoUfOI43D05aCUUpJwo4c+63/1lJXl2waON
X-Gm-Gg: AfdE7cnKibx1bnmNChZ80D0ksaNbCYsgQbvSKwqbuyGaLcPcyz0AfzmATyZEH6ATFYV
	hKodeZ11RqHXc3mWkBix2UzVqBiIRNrqVBju3OAMlUL0Im94GAApiPP7XlXZu9hf4bZHmB9P8Wo
	stlJJfPqal5QbDdKcl8VAkTuwOgGTmwSKZAnQbV8wE1mYvh9fErP7ta6H0UXOdYjbp69oJoRenN
	nnS82yYkQKlBbNJcItRQOFSRyWRvh2lYpT1qxurIGO9QemZgmUJa1gkhMmUjlNmPcRAPD2gyIhR
	TItT/Os1NR0jWV9YTg4Rj9VGaMf/iAeX1UNrJ/EYoMfWFZ9YrF68ErqTjqdtbrirugDB6Hyh3OQ
	EwjAlLkQ5wKkrkQtviHVqaH1LMrVcxIMCegIejw+BbgZ33d2BJSucAxjCPcsB6mRQM/HMjn5Ojt
	95kPL64knd
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17804051cf.9.1784103116635;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17803691cf.9.1784103116215;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm1142891566b.25.2026.07.15.01.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:11:55 -0700 (PDT)
Message-ID: <61d147cc-9baa-4304-b03a-beb342faf690@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:11:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <alOpwQx-43WNPHcL@baldur>
 <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j-C6xwVHhUPJqIDyHEpxnx633qPlC0Kj
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5740cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PfuqhoIL75c5hKM3NgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX3PKUcuOIfrnm
 nxa5tnuq/3vumQnYVSbb5AzwkPSzY67siggV5/14hFp885xR/9NBRMdH1ILA4AD03UDTI35pBgT
 KiseKWMKwKN+ynyAy6xOM5ks/lIn/MO20vNWhm5a7Jctqcdk6b5Etik3SoOc2GT7JgiUyK8hr9v
 n/qqoGxirMgOLDKncY5W7Gkr1t94lVeYeO85WVrPzg5Ao16zVuYAEGGOYR+9y7zAWHHLuhJ7R9W
 w4xBe44ev/Ft6E2ySDJ7TuxQ3tkNVVk2xVvhGZSS4XG22WvZPkdIV6i4cunEoOUKMP99kBGizq8
 P71HORl/1dZ40Iprn8f6Jxweav4FSlOBqxcjpon+8J1mEzKDlqDzpCVo94D1orbprGSLpm2APDh
 wLabU9rvaFtPF/FGm2qzkHf1g6afOc2LAdS6Rn+fxL3qVQWo8cToTxcDhqX2YRUTrxt0URMiB9e
 W5HfoRmp+gsBj0wCf4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX/ba5JRnkcvRm
 hAs4vUWdTfLmhlDxfSK6ROk7qqgSAoj6f1wfK9ZruaTMH2+CJ4Ly5jD1cixRJSW2Vb0nZgGQplk
 9y1TY4jGiBKFU5UoLGjx1mnQSsMe0xY=
X-Proofpoint-GUID: j-C6xwVHhUPJqIDyHEpxnx633qPlC0Kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150077

Hi Bjorn,

On 7/13/2026 11:38 AM, Atanas Filipov wrote:
> On 7/12/2026 5:55 PM, Bjorn Andersson wrote:
>> On Mon, Jul 06, 2026 at 10:11:11AM +0300, Atanas Filipov wrote:
>>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>>> present in SM8250 (Kona) SoCs.
>>>
>>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>>> that performs JPEG compression in memory-to-memory fashion.  It is
>>> separate from the CAMSS ISP pipeline and has its own register space,
>>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>>>   1 file changed, 151 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> new file mode 100644
>>> index 000000000000..e4c16388ef07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> @@ -0,0 +1,151 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm JPEG Encoder
>>> +
>>> +maintainers:
>>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sm8250-jenc
>>
>> I suspect you find it obvious
>> that this is the block than is used to enc the js, but I don't.
>>
>> We have space, can we please use some more letters here? How about
>> inflating this to qcom,sm8250-jpeg-enc?
>>
>> Is there a qcom,sm8250-jdec as well? Is that a completely separate
>> block, or is this IP-block actually the qcom,scm8250-jpeg block doing
>> both encoding and decoding?
>>
Just to add that it is separate block and is doing only encoding, jpeg
decoder i believe is not available as hw block for this Soc.

~Gjorgji
