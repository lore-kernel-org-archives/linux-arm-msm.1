Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825412;
	b=q/hEnmdpwUTUIsioj3wjyxyQWaI3baf/Cin/dUt5FzQ+TE+8ei65DhFMubxV6eblx8wX
	 HtuOlJ+zzsPDo7XRIb1Y5eFf1aONlB7cf6mfbKBl2qH90ddZ3ClrLJCAPHjzkbKWLOc3U
	 5mX1lCm6PM+Q+8F92tada1hzguD4/gtlNjEg0Qu9AlXVogtwg64YqOhuIloDFMpBkGR9C
	 1hHJ88K+gFW06AA/r64vxoC8lDD8lmlrc1qX04VSJoO2poOQjHM0QUlz2QjNsYUCoY29a
	 kqKXYI5pnvPHpLDPUK9sRkn76+iDwgUQXMYfj2CwnO+FLRW6zVSK10LcHq9aX96QCdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
	b=iXAQvYR9ZkLg907zVjydnJnn2Wh5dRI0KL3gpDDNjfqLzMuzgvkkBcqthy17pf7qkPAr
	 T3CDLzrOv/VWJSSGaH/EWG/Xx/pBElc9zcnJSd6rCUv300NZTVsZJdP6zLqCN+QJcv0w6
	 S+RtOPVcnQf+THQKcOF8Qq4LM/DIigLNO+L3Fgsvew53xuUfIDcGXkBJzpTbgfHJbatqI
	 aoMiDHdQjxfE8TMJzKKr0+5Q0kpsZJIoOaRuB18/UWkiU4kLktYMGgyzKyvHGTtfb11OX
	 +XQYucx0Mh9Z92TiDt41w0QbJ7fRvXj3rmR/S7tvmpdpjatkVp0AGitQnM5qm7zsjHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0Ii6B8d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kv5UWK5g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A74606A888
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A74606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0Ii6B8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kv5UWK5g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG97Yt91161032
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=; b=P0Ii6B8dvzW1BWVr
	vF7QyOXiccvKYXQvu4cSlMXbJZhzPqaZml7m4cbtpoemL6floNqwNdb1T778fh/W
	1YnBzfTkItJlO5kCDcGjZ6QgRr5tzXKY0yJls/4rMcVpT2qT6kqfh6GcodW8o+np
	hFLu8yHjNwHCCtWoIe98zmlK29UsOryjtshI8VVlfPJFjXmvcRpM+RAnnVGlue94
	4eabt2dbek/AmU7omBipCsHYlQaTfT3PO94hkxHjopSb92UhxqeJKTeiaqVK/F6Q
	FjH9m9ecQjWqqNOCHE/98xi3eKdLxjd4v8veY0B+v97+KkFzjTYD1eKEqsAmpqFi
	scT6Rg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gamf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:36:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee2d612733so9936335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794825410; x=1795430210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
        b=kv5UWK5gXjfQeCZc1SoNrluIDPIs55Brc41K8tbEc3bsS74sc+VCuwC/6WrNv8w5MG
         F8pYRg2fKvo4gRcuTVZ8IKhLk7Uu+HARaITLV03Rdqiuj80016wl63DjeH/odlnL5oqs
         2SIk26JgufwxG1noiVsQPEcliDQOvz8Du5FIkTaku3XKE/ATRbc51RSj4YtRf3ga+8Vp
         JqXvdpcEb/Fz666tCfAkEwOrc3mGbMprRzimElqnURElThv1qKUkcK2kEmAoKrIIGNhq
         nkQnw1ecZ8IFRJzkqSYMvZlkbpWsAVNtLR+yZTKGaD9O4UreavCY7zBDxIfgCN4RIQtu
         Vl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825410; x=1795430210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MftvhOyh0JpsGoC/uKwPwUiWJJ5nnSYLJzRW3U35/uE=;
        b=AR2AHQVS3HvfTGwqRtoG8peyFk8fBXHv3NaudLKrsUEav3j/NE8ymF0WhXrJU5CvsL
         IpbH02TmoVmIsTuMR5R5Nb1e3TiL0amGx0xqcdPCzMdveGVX4LdB+7laorg1ggICz2NB
         Nt2WfptTYbtKamc61zukZWMfR1k1VexbQcE9m80DEmgS8s87ij/1T7PPDILD3RksrowI
         ILEMarj2wgw+Mdh9eRLc9DYyXNKAerqB9wcX7Kg82ddL/wl5cFguHn465hVDFvemYRxC
         b1wUC5R2897/2jtWGYkghtSiVYqNv7RLvlxUwVcDG0spW7eAXCf5JbXPXCw8y90mUlTh
         mO6A==
X-Forwarded-Encrypted: i=1; AL+hErEj5G9z2MqaViESCPLH4Q+ZLNrTMa1uG6Af2TNyeT1KAzj3BuTjG2HlExP48C1pzyxLnw6CBG0XBodiNwPl@vger.kernel.org
X-Gm-Message-State: APuU4Z9pBHWs15xzzsIPFneXti7LF1l2pHVPDw43K5PPzGBns3F5W7lb
	hWHc9l3F5/ZNj/mRHPkzgEe37dRbmplW8QGiyPjvJtvqbfuwG3KtX5krl0jL3ZNde0KwV2J+OxK
	8J2CMMsgQjhwKcHjt3vfBI12C9Om0A3ytC+F0NQDgb8BN3dmSA8UDUgiyZyw303YZa1ta
X-Gm-Gg: AZFdTZfgz/QFjBFg6RlL4hpGYH44lTz51FvYKR4hSpMRojDKavcvKpJc8Tuw5Qjwzbh
	oeTaQWv6tA1fXUwwTQhDUefS043AxgoK0o1YF5CZhCZlk9Ec+zScRi92eOv9Qb1/sIzbdt0Olm/
	7bWQMQjLjn6ol8AmRohEUpRMKSu9MYM8DxTmpCcDSmxWSIq6+qoDtZ8ykD1c5Rgt4ei+FzNJjbO
	mpcCs/IrTScz18mul4gRfDYQk1y8AUYpJASFAdneye5VgcJbEgK3zgCjc68mYlNYwBU8d/YXtUo
	JxETBt47vu0ps55XP/+9nCRToiOpgIVkSEBSUmjo9AtvV795oOahmfPqZdV8ad8ZvtE+YpXVnO8
	lKLT7YTkTXCcTp9h+GZrxOWMllbSpcEBTTL0CSB0bajmnuZU6SeJiGA+7bESzPrJL+zVN2Hy9Ge
	ATmKc=
X-Received: by 2002:a17:90b:4ec5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b1b0b8f9cfmr5958538a91.16.1794825409867;
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
X-Received: by 2002:a17:90b:4ec5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b1b0b8f9cfmr5958521a91.16.1794825409384;
        Mon, 16 Nov 2026 02:36:49 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4adcdesm36374645ad.10.2026.11.16.02.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:36:48 -0800 (PST)
Message-ID: <0d4fa5af-e406-4761-aa58-534c3c6a043a@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:06:42 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
 <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
 <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afadcc3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=y5txsNG1kXPmV2KDPIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX+KoKRJP5EaRp
 3J48pLvhDzcc8/iayeE1wSeqjFvKtwLyiqwe7uwCN24KKfO2szdBqucwW8AwKcSvZaktUbxZcsJ
 9a5mgBoVNDu1/Z/5L7FszTLVNLbfY5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MiBTYWx0ZWRfX5+Y4OTuqL0S7
 S7cDXtFI0qOJhIqLHT4jwP6NFMjSZpEZdy073+qPDYai15eLRxHkVRs98NIoDaHlpbSeYjPlmW9
 mPcIrCkxvyeqBSkri1Q12qSbJjNTRW5hrUSVXERBwF5a5qCdymSdYpzdRj3MeGF4qPMcOV9OPRf
 5YYTnpQA1GdDLvQHE5WRXNuOtVnMxsZTeMAx5w+nQL7qg4OpAwTYgVkDjepU9O3W26YtEPX+ezO
 mWzPzhrzylGXc20qdWZhw1/pCSix9pSgsbY+ZgdvytZqNhoBnlEYmTREbuCPyIDANz72nL4dm4P
 z8405lfR8haswghnhtJ4STw7vrMpwhF4/ebO1Cn0G03N7FxLtS+11m+P2C3ZwRFUit+y2urC1X0
 TOMI2R6+pMST14gkxkG+pfciBnt5pDeHY0iAwA5EcFQCNYA8QZ8U7RXDLjLQ1uy+M4Bmpvibh6F
 9dYHRG5ySeXf60E+ujQ==
X-Proofpoint-GUID: yGrrsVXKM3Uo7jKNwjeEUhJE7O5F2R9J
X-Proofpoint-ORIG-GUID: yGrrsVXKM3Uo7jKNwjeEUhJE7O5F2R9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160042



On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>> protocol ID for QSPI.
>>>>>
>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>> we add bindings for it?
>>>>
>>>> Hi Krzysztof,
>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>> submits transfers to it.
>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>> I will clarify this in the commit description in V2.
>>>
>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>> Linux.
>>>
>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
> 
> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
> 
>>
>> The third argument of the DMA specifier in the dmas property selects
>> the peripheral protocol. The GPI driver programs this value into the
> 
> Yes, so the third argument can be value of 6 because it has no meaning
> for the firmware.
> 
> Again, follow standard DT bindings ABI rules, you don't get an exception.

The existing GPI DMA driver and binding uses its third cell to identify 
the client protocol. The driver takes that value from DT and programs it 
directly into the channel's SCRATCH_0 protocol field.
Its mandatory to maintain protocol ID-9 for QSPI.

Other protocol IDs which are not part of upstream are for AFC (6), SPMI 
(7), HID_QSPI (8).

> 
> Best regards,
> Krzysztof

