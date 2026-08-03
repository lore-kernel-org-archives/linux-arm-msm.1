Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B036E49B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752936; cv=none; b=gbXklJOko+WRdnlv7OcQAeUJ1zww5w9fkcWm6Uog8whxx7hOOl7TiGzbHkMhtsFc8Sy8kOw+SzUOJJRMD43mcAvSFHzTmSHkMFTHNc49z/gov5E+j9UvZ6s576TfJGJt1w+AWVYV4lyiYMPJWorNbdctNXb4peN16uATFG+cIiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752936; c=relaxed/simple;
	bh=YI+SeCXwe3QTLmdnaISpUAOdff3psaCPzk+4QqEjGC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk+00IhVf16pCLXhoqEXmsfIGZanc2+jCzCE1Inc9EwSoTVYC//yeFnlA1KuAjS84En7NipKZ6GCcGzBZIb9xJcJwjlDbSuVsoYq6Fqb+YioxH1/hM4uhfxKl+kAs8cl1VFsxB1o06RsHfGIoefKFY1hkeBEI/iAlM8wUtONfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwiN0Mx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qha4TP7k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwiN0Mx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qha4TP7k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sYPx3790798
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=; b=MwiN0Mx5BKR/F6I4
	uqweJyOgADhPfHdriE3f9k5zS0JqcnsKy5R7j0+DUv6J8MwOJHO4OdgpONGuIidx
	IDAOGm3rxSyZBnNAZRIf+xMC+Z9++C2ejecIY53uwEo1dN0Fv9vLRcLK7tNcI9Lo
	z+KrSrhi6t43ppImzdh1TKgn6KX2EiwplpVcSoJTe0heLAz9AiXdPNosg/yUCEtf
	5wjgoCLo/7B30v7PIjWBHoWe1PEtarUI0OubhmAWW613doe96uD0wUwShV95IF22
	OROQ5UakQuQSUwj4VPK+YBYz5dTZQ/dwvKuUAMU2jhqFuhz/EE0Oe2Pd1HLBgo9e
	QPZhOg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0y15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:28:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso5480632a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785752931; x=1786357731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=;
        b=Qha4TP7k0HQ+QAMPFKft5zxzoU9pePk8WMQ/Cgb48mK+MNfzQw+GsZluWpUuEFZTFF
         kRIL3alZnsv/U68uex2o7MHtosvDp1JT918Y4hlLrm91VyXc+IB/HNpWk8WpOWwmY7fE
         ywvIFnqwT35iAQ92SH4tTpVZPWgQxx5dtRFmQca7w2qCBGfRg7Edg0FGp7cKTWpTtdAv
         6i3zWbObfDPKDsDINc/E4HMGS4w5KtuK4NP1jySUU25oTXuMuHMAmgLBT4yU1mHQRxt+
         Y+DhEDaIaDgbf1ni4wFadx9jaoVOO8rs7c28HrlcVkDjiyBBfTOzM2xXqZK5N1/MLMCS
         cWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752931; x=1786357731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awud7FmFVBbftdi8mV4xuz2E3JQyxCXhFkWyr+GNJ38=;
        b=Zd5xj5HfHqUpJMP9pzOCoGDVFksHSFOgvctUD4bU57g4XgOE/9cjww6fiq755OWET5
         UFKJ/jFqrAzTmE+skLYmV7OB6zX+TE1YK9d0UJRecuegWEc48w3iLrae5WUUVsm3cVUM
         reXqiwI9q9oX86/OTa5F4VhVOsFmdf5gJJEyMUD5OQv6HbH2aFJvvmaxbFLN2GavgDVU
         BTZvnA+eF4G4pzJ/D7FZ74ghGhJJtR12NN0QbxZiX1ra56rRKf06IDc59IQ9NrWiQltT
         x7qdpvWwNztVfwDP1187dZae5iv+6KTAqApnWZaRLV5KO6jxJ7GQ7ayVxVJcYklhd1m6
         jFcw==
X-Forwarded-Encrypted: i=1; AHgh+Rr87/BUghunnNCNoWw7UdffZGWD0jkJob1v/z06cp3Ne6qRv5I7fMz7QoCnynuWguEDUNhlBqwwmDHInECX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0S/ysl3FZVe/vXdRboq3wTiVMmjiE+slMYMVgYKhJoMPd8ixK
	/Jgdxyk3xz7rMbdtJNPz9eaAs/dkEHp7dfW2aLylP2kNlPzqsLSQF1bIXV8TvWIiqT9+9I9Ngkm
	HYrZ5L8f9HdNF8iB2mSkQtvGU1OY9a+/FE/7F7xnvHxVgUclO8rrlT3FtFaN0MpELoc3c
X-Gm-Gg: AR+sD125xj3tiNpm9DWT4VoHnj4dwXHJd4UpcZgMHhmnjSEdnXQFU0YVEbx5fP+xbsC
	DcI/nf2MWhs4pUqEuw9M6qj9zgP1bnfsZwuVI1c4ecVZJ7BoSSyO9L8TifYqJfTU63MahfQaL4/
	ZLnYcD3tlwMQmcacOXrBpKWWhejM3mRtV9ZrtFQi1aVH/pnVgOlYbZ3x4A0PcfouqkdKQ2WaUWM
	bNoToy+4iRvFAtwegynURYztG5ShyKP/SNqrgkdv0LDHiyup6QdPdbFHG2rQsd6KLyB8KBvGjTo
	vo7MqV9coVG2Cl5pxBD+1wlLF2duo0aUiq2PhQb7mE35lIiV0RlYEL/R/HcqNiv2OyBO7c1MR8I
	sPkOB6XD+s5cMLlxrki4+yeSJqPmk
X-Received: by 2002:a05:6a21:a03:b0:3c3:8bab:80b with SMTP id adf61e73a8af0-3c92a8be67amr9529960637.61.1785752931541;
        Mon, 03 Aug 2026 03:28:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:a03:b0:3c3:8bab:80b with SMTP id adf61e73a8af0-3c92a8be67amr9529932637.61.1785752931082;
        Mon, 03 Aug 2026 03:28:51 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm39291548eec.31.2026.08.03.03.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:28:50 -0700 (PDT)
Message-ID: <e8846903-1c1a-4e11-9a7c-9703536e50fd@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 15:58:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Marc Zyngier <maz@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <87ik6i6i22.wl-maz@kernel.org>
 <CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>
 <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
 <86cxwoocol.wl-maz@kernel.org>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <86cxwoocol.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a706d64 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=Hgul2LAUnyHK3LffZBEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: r4CZ6X1Ytr2XeJxaX2AhnCzNMfTlvaGg
X-Proofpoint-GUID: r4CZ6X1Ytr2XeJxaX2AhnCzNMfTlvaGg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5MyBTYWx0ZWRfX+ssET6oUy9/u
 u2k+1mZkSYnBZny26lBn8x2g8jjn+C4jM5XXI83umskLt8k07/HXUZr+0Ne6Hf58/HBzPJrCG+V
 F7kwLxI+Dou86Qbn6e5c3FKGpHXBKTU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5MyBTYWx0ZWRfXxnep2pCUuO9D
 jXFP8x2ncQ68aYbWhyT65xTg92B/3yq4FUyx1Gye0aGfK32tH98wnz2AVAgn3ctNhmF37ulgPiS
 AfB1OXdsKPHnPWvOlncTv+o+1FAQxm422DY7rprtoPMuvCNfwDRwz5ugXB5AbHG2t0XQMIsgWWP
 w4U3h+1C9DknMRa3lwQiqkB8NIu3tTlx28uJAbZ9Q85542BWYpEw1jFxD4aUHxtZWPo/hynh/mE
 KsNlIHgvZj7aEp/N9O5p2ikg0FqpwwD9pEshIdoa+GRtpXPHtW8QBC6321IoGeiIXu8Op19TEhH
 Uwxqccx5ZyPYVTlJKeBr+nJLrSzuTRa7Jeys0MKFp/c7JvSB84Ja3iMR1+/Qt7kxOU8aFo2TjR9
 CPp8Y09cLYSOIIrLET2iMWS/BgktlNy1RGUyWLQonK2dx/WwCzR+X9npGjijrDc57unTbBJCLrP
 mrbzkUSXOvUlj1/O30g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030093



On 15-Jul-26 2:24 PM, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 07:38:59 +0100,
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>
>> On 13.07.2026 17:11, Marc Zyngier wrote:
>>> On Mon, 13 Jul 2026 11:25:41 +0100,
>>> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>>>> Remove #power-domain-cells property and add power-domains property for
>>>> MPM device.
>>>>
>>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
>>>> @@ -68,8 +68,8 @@ properties:
>>>>          - description: MPM pin number
>>>>          - description: GIC SPI number for the MPM pin
>>>>  
>>>> -  '#power-domain-cells':
>>>> -    const: 0
>>>> +  power-domains:
>>>> +    maxItems: 1
>>> What makes you think it is OK to change an existing binding in an
>>> incompatible way?
>>
>>
>> Ulf suggests that this has been modeled upside down in the initial
>> submission:
>>
>> https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/
> 
> Sure. We have collectively fucked up a lot of bindings over the years,
> mostly because of the lack of accurate documentation and people not
> giving a damn about the correctness of these descriptions. I'm glad
> that Ulf is now able to make it right.
> 
> But that is not a license to invalidate DTs retrospectively. We don't
> update DTs in lockstep with the kernel (I *never* do), and something
> that existed must be supported in the long run.
> 
> Properties can be deprecated, but:
> 
> - they must be kept in the binding
> 
> - drivers must still honor them if they are present in the DT

Currently only two chipsets have #power-domain-cells property mentioned in MPM DT node,
agatti and sm6375.

Agatti - does not execute CPU cluster LPMs as of now, so not handling the #power-domain-cells in
driver will have no effect in functionality.

sm6375 - Being an old chipset I am not aware of its status. 

If the driver honors the #power-domain-cells property, even the CPU level idle states will fail to
probe on these devices, due to the reasoning provided in cover letter.

With these patches, the CPU level idle states will function properly, so will cluster level
idle states if enabled.
In addition to that, the fallback mechanism of registering for CPU PM notification when power-domains
property is not mentioned in DT node will take care of the RPM notification when cluster idle state
is entered.

As suggested by Konrad, I will add a brief explanation on the need for this bindings change in this patch.

Thanks,
Sneh

