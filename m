Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413689;
	b=J20UlKdG/FL87o5qbEqZPA6B4AFh3t9jLOgOlHSeFU+206DjYfO13vAl+ka3vJrrveU8
	 u8gW80W1F2QVo7mLZjPm1M3dfB5EyESdpyKeaFcDy9EOGQP6w4TB4KDDrKTvJarnqspzX
	 uHV0C6JcWR1BnCrmmZZqAZtI5GOURUL0BbaRy9Xf6YTOzF+Z2z62cpOoPE1ugy6wBzUlc
	 uCCPQ/dRE11myXJTLiHNzSWT9BzMsCX5IfZJxx5DtVSXWs7EQkHg9g6JrQirMCQjFQ2ds
	 UA6hAodMWbYcWunV0c+EVg6Ba0euDrzufjPlBsLhWNYvs3Mx75wwUWlXcBGAqEQThvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
	b=trr/fFJw5MOz29zHuvc4d86bc6psqD4CbV5+7yScKT+6l8X3E6W6n3lXlX87I2uqEIYp
	 FrFpqG0XIFmerUJLUT8NyPnTe98VRuwaXGPM3zkZYk4h8FSCzPYXGRDK4KOXSwjVH8aSF
	 Whh0PuDeJzt/0sG2wQTyLvt79ZU9Dhq+OkMweHKS6Nx7bWzfWDlE9ccmlBDumF9qvb1wW
	 NOHkoh21deRxPQUaITuU4ucGGVFy5GvHlaL7Ru/ICXpQKUvM5J/fKyzirYoMlP1zxnmvq
	 MlfVOR4QHtRDgwd36QnAn7RssVDW6UrmCwzXFhD9ojhd8MyfyNkscIHMpoNF3DUfuDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XY3RLwAd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUYtlpQI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E9606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF0E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XY3RLwAd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUYtlpQI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN519dh3780385
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=; b=XY3RLwAdMNJLfOoQ
	33PUtc4h41WLDZBNOHlBUAW5DD/OCUG8oUOuE9bhRti4z1EG+tQL+WALKvOVTFnG
	5IsWyzs406U5JUR+cLkupOaEmv2c1fwoCkD1jRke5NfPIfXeR7XQ+t2dIgMv9p7/
	o/sCeDU57fUf3asVmJyhB3uk0qRzSiuYB4+1cE8SLRFuUV8Bsx1UwojHvxbGLV8S
	rQXLspbDKX3BghQX1rVUN2R2PhqgHdbfA2Mw8Mmdd+BQABkK31QW3V4aKHz2qsXt
	xoKBSgrGsa3Xr79Evj8/qfel5UW0akjGP8k2CDPrGRwf/PSo58SjpohAtKPS0Iiz
	qXba7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk5868-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:01:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so1594639a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413681; x=1796018481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=ZUYtlpQIRO968iMCf4w/j1FSgNQaOCR64fmaDUsz/8FdrQJyUtPe1w556E5FTDFSXq
         rToQCOijUa+v2egSiEWiRmHm3bK0X77L5jz4koBQVJRjDyKg9s89VllQz14kRpWC7uuq
         oOhm/0blNqPA4mc9stH1zI/5Mp7E5kr8BBBUzR0w1MbASyvdqU9CCGPzyraC/+KTNkXP
         kfRcGpjqRMc9jCHDkxKYaw/fvN9feeIGKXfL/N1B8JM8Ekwezjj2l0gCV8OenAgpOq3m
         B0xo+bzjzYKmbmWrzwuA9/CrvwmXN2cDPf4fSXiab9mMNmak7ybmypBU62ZvlfdnGlHH
         o45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413681; x=1796018481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=nPrsSSkZt9cVbY5pV7TUGNpuxEmxu0EFGF8TJ93VXgjNf/ix+bhajuRCCzqiyw/T/y
         o6ejHfOoousvZXBrdHn1/anm7d2RgKWHmdzY/rUThkhEbpcS6O6VPfkjqcCqLEP7zAJ4
         gia1HecGMk+RXEQLFqQjgMa0j8tzQtG1KOETExOYVPqgCbJ5QyaX1ScN3isWBExBh0iT
         H6PJTJvA0/V5S+y2wg8E3NRAajqSrvT1nvUTEetWYS6ToNFiSqNAHlaBmkCK7e7oSBUW
         uTDfFjP/kadnidQgW9TWAH9WLyGhNWgh6C5i3iaJvsEi/hpDfxN2r1i8xO7WGus/3Wqw
         wxyA==
X-Gm-Message-State: APuU4Z/aZD6oDsx39IZsJHiQ5v3unKnwKA/l/HRyp/hqIFC2+fefw+jR
	KxOFJwAGEVNyzlM1JCQuSnynSan35+LulzuzQTBN5VVgRzM3QjJ/v3Dy21GIOpYYl5+68AG0YJk
	UkrKoK0oATTyrJCIMho+JC5uHOeKMDTMW5F1UwyEH0vFaTAiJYfDN18mSA3nmS1u2pgQj
X-Gm-Gg: AZFdTZf+Xal2iTEeFzWXsbGJUZ4ZJrJn9qOtf+VF7GQm4+aATrJrXIeezoN8blkVuC1
	U9oFpAP4A+OMyMlJvtdX6yk8mo+JIgXuo2c9qPHmpCxAHTZnOVl9EQgQFXnUyhwVd3GusSNfrbI
	pE4TU+iIOnuALlxDgMGtOQMNHYOa1HfWTz5lpiiT3AaRKc6U+gm50AYyBDUQTDdLwaQlgRFWTRG
	zz2TrZ9lRcnqG5Gch8gBnGOSNwojMicoBEqMIfSaM17oEgWlWLjv+I4AZ265d825MBOtsfdwog6
	biBSBfPlWJFivpX/yz/+cmWlBfqUNBTv1dkBeShC5Ogocu/xQrITNACFT/roV8cjVFDkXxlvQ8R
	MAJ8Xl/EQbpM/CF+EpTjBlFZzOAkuv/LPTtrvdhCgTrEbf2vBTM0YLBKqjeS1pyHNGfv+HQ==
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780749a91.6.1795413680949;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780713a91.6.1795413680447;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm16426806a91.17.2026.11.22.22.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:01:19 -0800 (PST)
Message-ID: <20276ae3-9b8c-46b4-9ddf-ffb39bfc3b0f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:01:12 +0800
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
Subject: Re: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
 <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8W8vBzI6WSdg5TIP_2HM148Jdv-KNy9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2XIiWC++oRta
 sPRrUS2Vy176T5aqX48z//5jWDkBF3wg4SADjsgceCvdl/IE/vd3BtmRaoF/+g597JlZNwo/LgD
 E0b4b/W/XACTYyG0C4HRewbhGeLtxmPjHCvNolFA2R4gS0K37AVDg4/fIGghXbVuc1VgNK6Kpa3
 u/sJGH0psTz+hgAAyyjM9+DGui3fjEJx7JPz3U8u9JJY2dC/U7gq3LQrBC0NG7JPsZAzfsQbKs5
 pqSW2cEcjgJfX5Tq20GPW/97fF+Mr7JZEfi9lNjmSkYqV/eRUBkLWF/Uu3xZIxhvxbkwAiaEChh
 jG5k4eIkuiA32POD/B4Ixb8DO0+Qhw6Gu90YLbfNbdn3RmdpiBm35VjtFbj64yGF5LTkrAHw5L4
 kplZaDSEP5RTt7yIC0QfZgrmgZblYxU4N2gWwPl/jfIumxYeG+qpyjr4NfIJ0Pge684hzdBTIaH
 YPpViq2eH2aEoI6fNrA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d6b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q_CrVRYiZK5X_reCBHkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXwwi6Bn2pU0o5
 Pv5ZOmLE7A56lY7CM9K9Ho5aMViLiUJ7NFsD2pTxw6z7+5SN4biYN3l7DKsVNQl9rQPPvkWsinr
 ZAaXpgJkw63si8KrZwRuN+OLj4rhNwU=
X-Proofpoint-GUID: 8W8vBzI6WSdg5TIP_2HM148Jdv-KNy9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/19/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
>> source, for platforms where the STM control registers are owned by
>> Qualcomm Embedded Co-Processor (QECP) firmware instead of the
>> application processor (AP).
>>
>> The node describes only the STM stimulus aperture, the MMIO region the
>> AP writes trace data to. Firmware controls the STM through the Qualcomm
>> Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
>> phandle. Firmware also controls the block's clocks and power, so the
>> binding has no clocks or power-domains properties.
>>
>> The output port must have an endpoint so the source can be connected to
>> a trace sink.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> new file mode 100644
>> index 000000000000..f365ce2450ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QDCP-backed CoreSight STM source
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  The System Trace Macrocell (STM) is a CoreSight trace source designed for
>> +  high-bandwidth trace of software instrumentation, made up of memory-mapped
>> +  writes to the STM stimulus aperture.
>> +
>> +  On Qualcomm platforms where the STM control registers are owned by QECP
>> +  firmware, this binding describes an STM whose stimulus aperture is mapped by
>> +  the application processor for data writes, while enabling and disabling the
>> +  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
>> +  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
>> +  than exposing the STM programming registers directly.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,coresight-stm-qdcp
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^stm(@[0-9a-f]+)$"
> 
> That's RFC, so maybe you do not expect review. Explain in cover letter
> as the most important part what do you expect from us.

Acked. I should focus on introduce the design idea in coverletter for RFC.

Thanks,
Jie

> 
> Anyway, drop, I do not see how is this conforming to DT spec.
> 
> 
>> +
>> +  compatible:
>> +    const: qcom,coresight-stm-qdcp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: stm-stimulus-base
>> +
>> +  qcom,qdcp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the specific "connection-N" child node of the QDCP
>> +      provider (see qcom,qdcp.yaml) that owns this STM's control registers
>> +      and services the firmware enable/disable transactions. This must
>> +      reference the connection child node directly, not the top-level
>> +      QDCP provider node itself.
> 
> No, the QDCP is just part of this device.
> 
> 
>> +
>> +  qcom,qdcp-source-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint64
>> +    description:
>> +      QECP firmware source identifier for this STM, used to address it in QDCP
>> +      transactions.
> 
> Drop, we don't allow instance IDs.
> 
> Best regards,
> Krzysztof

