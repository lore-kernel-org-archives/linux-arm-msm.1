Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961409;
	b=aSeEL2rBdnC1wH8o6XPr886mn68ewJyZ2zhrzA1pq2zvjSt7U3+aA+l7iTf/t/XcVmFK
	 UsliiWQvsiOG2rg2QItJLajbOD5sWqgTZfflLlYRWlZ3HqcrmLdy/AvzkDP3Gvfgi33Gr
	 5a2MBfXNYjXhtQEpbEWZMWDozBnLHLhBNEahQSRG5fKAotFteNnC855kccM/IayTS4akl
	 6jJXUXyeSkuDiKDPCGGtbUaMENE1aW0/sSYIdBoM5js9ho2YCFkao+nmd/8z7iIXJp7Uu
	 YqlGXriHyG3M1gzSay/7dKDHPHPU9SmMhRWcDL2E1/gMd1uuHnRK4ZZ0TErW8WqIV9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
	b=go/fBeRroohEXFfEglpUL9Ey94F1feVYkasae4Yl7651s8TfuoKT33V3lAVDslrEkpUA
	 ZNYl97x4p77ij6KACYfUdJREVox4E1LoLXyAq5/hLnLWh4qmHFzcQqkmwhn77TuEG/SPA
	 GmozP6SB/7glDuCXdV04xgwi368gG2Go/ZwDPSNFUbPCLDvhc2g62EZg6ejca0rTytMOC
	 ar8mBDU9fT8XxvJta/wXi3Pe2T+yNXXS0zltdmgXf4Mqt3tFR9Tz9XbOo9SAYMj02OInN
	 QYl3FpUTLMj+DrcZ5C9VWW/ax5FcJcSQeKeMKOJddPbiM4TagF6JzEBEMoQ282I6Z3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OVlT2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDpPcUah;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8842606A337
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 10:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8842606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OVlT2c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDpPcUah
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJkd2593315
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 10:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=; b=c9OVlT2cojNESEDS
	7dgR4tpP8A1pHJdPy4VqU9/FRLrrTPUmE4cccbo4wWLPouzpmNA01u/vrILyoa1j
	HfenqI8h3LZrkrDLW4SGnb9sJsidlk/n6s9NpFXi2F9nZGR8hWEAv1XVe2Mpt13q
	uQM6+WYfEsg83lIvvG6tSLyQaYZsa4wIQZuDOGa1b0ER3oiwdkLu7WG8F0lC5QwP
	bQWeLetbYrYWjs+T9cYLDoerCe1Af6n+SGBGhJdK9ZLFlPeNuL4+COssbxpSwxG8
	br0pt8iaDCXqA/m9xoqG2awHNYSrxPgLOn37NLOw/t+Pgl5JZJIneSwt18hckR/n
	AoqxnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paabyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 10:36:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so508311a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793961405; x=1794566205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
        b=EDpPcUahnJsI3pgdxkd2tYEtkSGFQ6Qe4naxryX4npp/2pG8rR+MJ1oXK9fL/kiwa6
         JoZ5QmBY6bWFLSuDWv1oMn7PrtUytmb7PGZjCgqkkCKAsdXGV217UVtgsDIsPQ1dfO4q
         fgFMNI5H01e6159jI8W9GO/bUcsZBFeDigmMzLDJy/bcd8kV36htz6HouHc/yKZpzbHD
         lPc6Uk+rYQn86mLXpLKdq6ceHWD19bzb1KelP3rebKIk2nh8y/5ok6G0yCmEexdKCfgx
         eWL/as6JM/2Yqx6ifzL4AdUca87V50JR5GwJCPVhBECHWLEck/Chm8v7Bkz2N4loiLCs
         1baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961405; x=1794566205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
        b=cqmC7ue7g/l38do711CJ7NQkKYRqj8WMMJZDYVF+qFlfwd9jES+zK2NpQ1lQOes9As
         L7VNyVHSpD+lJrYoa3pk3j/hybcsXqI+jHzE7OnP8gbuPdGdKwJeA9fh7uQNSaqT/4wT
         sFlMQdqhA5WtV7KOXXHkyoWpi94bIv3FhQ+O71D0hc4IXloRNsNtCU7E53AOT4IKzQw1
         q5tcyI5eXDs/u7nLk16OvNCjyRJqsLR68NQeXNMiFUCVYa/7TqdOlNpAjJyzmwuFVji9
         WEoh7+KEpiQxakgfHCfpzvq631YeEAfEo18gjVN0uMZaWJonm28HqT+hktI0pkNkkulY
         pxYQ==
X-Forwarded-Encrypted: i=1; AL+hErFeEwZvPbEKOCRlvHUpJ8VbY+DwKKPNd6tsTuRrkcipBQn7SIFm6haZwzCW/M/+JRPyAAaZ5psJcqiXtpIx@vger.kernel.org
X-Gm-Message-State: APuU4Z+LPPvqFIUO1Bo7dunLquUGMFeVQlYLNKS0NPAyNf+YeC0Fgj/T
	lppDK1F5ZKGE2Yqc9YfRjQiQJFZs8O1BRK83zcDxT8q/6/bip2BuFM8zhE7b30Lna8f/3mTfgZP
	39friXNkeNo25/72Cvzip1MbSley9EJxYEuxWwbWSMizD3v/wpsY8nx0slX2k5+4aqz5H
X-Gm-Gg: AYBFou0fjkJ5IEfIayxUT2hsKPXtzc+Nm191WmoXqu9ly8iYnBpE8f+Qrtt/9XQI6fj
	Q9jKC+qPkU5ylnZfm+YnFSqa5qpFd2aAOEiDAkyFOVbThnjRiIVtyYtfeawsXJO/SusPgHV04m/
	+KRPC8Q+1rqTnjzN3xdXM4OZn28Hw//vsSRPZqvZmwwYsgWHJDoog0uXoHl+Bk7DdUgoUF2bqlK
	kghkg4532kVUW32Pbdrmh1hZ8v68goxSR1phDTj6IHA7VJDxXi1JReemfyyvwrcOKehF1zt+S0r
	LuQVX33AJd6QxgYQZKZo+H/1AoQQ5yIQzIlAcmZ0WXCc8UOVpOl4/c4pPOl3gaRh0CE81R+YhWF
	5WH5K0+QCaOtNGqkQwrZo41M3JMLe1YTIOelbIjeA31J/4bPeOSRqwSp57I+iGDyUCQPf5dWMdM
	Q=
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr1991651a91.29.1793961404875;
        Fri, 06 Nov 2026 02:36:44 -0800 (PST)
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr1991632a91.29.1793961404355;
        Fri, 06 Nov 2026 02:36:44 -0800 (PST)
Received: from [10.217.219.8] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c66fe1sm2885209a91.7.2026.11.06.02.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:36:43 -0800 (PST)
Message-ID: <90ad258b-00f3-45b2-bf7d-5865a9d66258@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:38 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document bindings for
 Nord SDCC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
 <20261102-sdcc_scmi-v1-1-244dbd893051@oss.qualcomm.com>
 <20261104-sticky-perch-from-sirius-d3ebb3@quoll>
Content-Language: en-US
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
In-Reply-To: <20261104-sticky-perch-from-sirius-d3ebb3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GHAyawXZGf9N-RxuZHJUP6rOy0xPOtmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX0mk7SW5Smxwa
 qYkGCJuCPaHfCkCSrwW9zbfKpyhwzTuhPuX1WlR1HRmsVNcXV6VuaNL4HUvE/cWSshSNAi24xrI
 Mf3P1dithsLqRzOD3gMevCRXHUGIwQClhok3Z6DfbsYGKvjMosnOEgWVs2zI/DKpRweDSAxKIXC
 Xl83Ji0zswmSFs+W9nWS+s8xeC1jCQbTI6smZMBp8/9ei22sT3QtgILgBd98fptTdz+9BoRyHbe
 B1tPOnmEa4Oq0AM4SFiFacBHM6zv21LsDivT9jH/IwV7jQ1TPSM9QCSPGvQSySemNfm+MUT0Kca
 g1aQTtQPbc5c7JdGnNOC5jZqjac1CtIXd581rbEu0HJqPexefsS3cZF+yzgfPvfKUGhJQLdEO6S
 OIqSAw3lZeKkMJ7ASlUjoRhfkZ68WGDoeHMhXCPbNhXo8ehNesIg+X2iI+tmeQAXl+8/flbzprT
 /QSo+ZYwCsRgZowuwSQ==
X-Proofpoint-ORIG-GUID: GHAyawXZGf9N-RxuZHJUP6rOy0xPOtmZ
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedadbe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=f_B6lkSkO6dyqIEesxIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX9MVvJk9lWdff
 D2+6X28ekbtIMRj0wqrJfb1YMUm1Hfgt567BlqRcjR7RedOS8SxbpyaFJfb+laIWpG8dsgWJJ0P
 MH9tA7JxLN4YgO7jHdDON7dM3GaH30c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060042



On 11/4/2026 7:28 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 02, 2026 at 07:33:41PM +0530, Anjana Hari wrote:
>> Add Device Tree binding for the Nord SDHCI variant of the Qualcomm
>> sdhci-msm controller, where platform resources are managed by firmware
>> through the SCMI power protocol rather than being directly accessible
>> to Linux.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
Acked, will address in the upcoming v2 patch.>>
>> Unlike existing sdhci-msm variants, this binding does not require
>> clock, interconnect, reset, or regulator properties. Instead, platform
>> resource control is abstracted behind two logical power domains:
>>
>>    - "power": controls the SDCC rail power state. The kernel requests
>>      power-on and power-off transitions via the runtime PM framework;
>>      these are forwarded to firmware as SCMI power-state messages.
>>
>>    - "perf": exposes the supported clock frequencies as OPPs populated
>>      dynamically by the SCMI perf domain driver at probe time via the
>>      SCMI performance protocol. The driver selects operating points via
>>      dev_pm_opp_find_freq_floor() and dev_pm_opp_set_opp().
>>
>> Both domains must be listed under power-domains with their names
>> declared in power-domain-names.
>>
>> The compatible string "qcom,nord-sdhci" selects this variant at probe
>> time and causes the driver to attach the two power domains via
>> dev_pm_domain_attach_list() with PD_FLAG_DEV_LINK_ON, ensuring correct
>> suspend/resume ordering between the SDCC controller and the firmware
>> power domain devices.
> 
> Do not describe driver. How is it exactly relevant here for the hardware
> description?
> 
Agreed, will be addressed.>>
>> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   | 89 ++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
>> new file mode 100644
>> index 000000000000..c512628617b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/qcom,nord-sdhci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Nord SDHCI Controller
>> +
>> +maintainers:
>> +  - Anjana Hari <anjana.hari@oss.qualcomm.com>
>> +
>> +description:
>> +  SDHCI (SD Host Controller Interface) present on Qualcomm Nord SoC.
>> +  Clock and power resources are managed by firmware through an SCMI
>> +  server, so no clock entries are required in the device tree node.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,nord-sdhci
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: hc
> 
> Where is CQHCI?
> 
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hc_irq
>> +      - const: pwr_irq
>> +
>> +  iommus:
>> +    maxItems: 1
>> +    description: phandle to the apps SMMU node with SID mask.
> 
> Drop description
> 
>> +
>> +  dma-coherent: true
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: perf
> 
> Best regards,
> Krzysztof

