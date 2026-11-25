Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607836;
	b=Ins0KoGarQtJijKG9itWxV5vAuFXbsMc8RM3zEwwg7SBCFUsGjbPqX9njKuJZzLRvOJz
	 vMSbVEd0iXVmbZO1if6s1xp1/gfDtv32x6+2S75D0OnKkZ2110UUzJlOGz/+0tByBDG/1
	 JpwWGSX/SY6IGFQuiMdflR7eM2dmyaOWb5qi/KWVGpSik4hFOTey619sD4K4F5xVId6fG
	 GbJYPQDhMszq9j91s1exjTACVq0T4ixCIJ8FkmEe1vqoRl61PXSS1UGWxUjnD1AinV5M/
	 3z3a92pxVyFmbrdoNJi8tkXF+3kDTfTmSzMIuhR5/ix8Qht0r7IIGCKUiVSB9ZtfiMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
	b=jeLqTlx38WKFqDAKkPwHsny24jCzXj7IjjAN5r/nM+pSIpSvQPevBD5sAUJJkcxBRL4z
	 Uvf0GfdgPQ/URNk0oWsfc6rwB8tvfl4+qehAl0M2hh8ohZweR5To8L50yA681b/pooofg
	 lSMmTXAnCr+0SQ78FK/CPv4G2q1U2xhto3a23RctoKA9xifDup6vnlb3qXQR5CHLDJsNm
	 P9fPSTV0zdskpq/FlCdQ/qdAb55Rb63qajDNzx8+zSBPY761w3PbHit9uCvjXZyDxjkS0
	 tdv64k0JIpo2ZbUETJyY97t4t+LxrZS+w2GBSXhCjODyxONp99WCk55saF8pWNUyiIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD4606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAD4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bf0qJbMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEUYaFJk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mesU796853
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=; b=Bf0qJbMgIQfinrCm
	T7S1xHwVE75BX50Rkepre02UkLvICu2sBavOAP4WOGy0HbYWHM7q9+ATKrzJWMir
	A2APG+eMge4rxnMXZsWS4PJrcUrihtQyKvLCe4FVaqwQPLJJnx5FJorHoactzt/g
	SH53X66n2WkioAm1+0GZ4vEQVX7BNOG5TKciRIK6JoKXg+UziF8LLuNZcyxejlkk
	aodkDvWL+zApsaqYIAbhPD8raCpv1xu0iIX2mskDC2tOtzFnlLv8fJ59OTzKGRfI
	2BNdxGy/hgTEsEPMw5fEmcyuSnEBn8n0Bf91sSlieVKg0TpUM0kEisIOvd/wSV3t
	ESQegg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtj13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:57:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495f7e03b9so55734185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607835; x=1796212635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=cEUYaFJkJ8xh+J/fvjneJvECXkk5ZJTzDv4XCeXAkUzoCvW4pzfhcXZEjKW5cy8aCz
         T31qceAtj2rndvQrkZDGE/+vUZVdrXdss0zZGym366II1JgdYK7c/cI20WDF4fvX1dUQ
         Gz9jcVoMvWNRlQqVqYWfn+yra+8ZQjj6p1ECjp8uUjywNN73c9nba02yLguBm9KK+HED
         rXADdRrtBBRVytcOFmpPZgAQtJbT6AhFtLQ+RutBPpwJ8nW84sITyo7XeBAdzESHdlLM
         Ld6w6tUzh3HOaD2nLLWiMoJQGbnRVaRVp8EsWhsVq9Z/Q12QCMFiNt7b+JM+GZQbKuNg
         NDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607835; x=1796212635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIaM91otGd4vtySupJsEK/JbUTZeMbmkY21CbOPjPac=;
        b=EaQWpbFEgQZYzOC4wqcS05/Yr8gzYa2rY3K3SzR0j3LFu6GKH67rmGn7ir072I40fM
         /EawVgyZxZVJwrnF5dzfgx7ivdl4O5+tC6QEeQzyGIKrs+pQlM9/BtNbI28NVF2DGUhy
         Gp6o8z3Uh1n9LB3BH/UQHzrD7eBiWj5XO2AfUz9vt8e7jmEMgQkFVvhl/Sg+orfA8Jl8
         4ptEF7YDv6ea/E1fzQWAVJYq1bQ19lXTT/w+owuDYAwuCcN/b1OQF4HJFh9sBV4qC3Mk
         YLNO6OhoSDRA6DkYBiECd+FBtHK3Q0jEwVnpIvXzERJNkCicQ1xGlzOj1lXv4MSXGamU
         P16A==
X-Forwarded-Encrypted: i=1; AL+hErEMqgwX5Dv76ME+sAHpWPzg+OQlYZ3yv2S00Y82xIi/MjaQUIzHL/gxnp1cYHbTxwPY1Clj6OZweHAVQTp2@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Wfm2h0fjqrjKngToOcyYRL29DuDvnttkl0WT8YIvYfG1qNCi
	tc89AgVJXSVCWIM5bBQUScPWB4NYHnaSWH08wQHjXyYRYHHGcXnyzVD9zyWp3XKPfSVwDYglPc/
	jr1BV8ANq790c+TSy26l3Q3Z3mj38Tyjw0KJDpT5UJcJeQLR3Zztj29UmNOkwIVrOFDfI
X-Gm-Gg: AZFdTZdzNEIjOAVZmYVKk7Rxu7r6qNQkepuf2LwhdganbY+vKvOEOgWKaqzRWCyl6PG
	AsHcekpeBdfQnzvU1pixNxzHJHHzjAZFoy0z5DbNwRS/7HEN+I0FQ+uLjHkDyv17ajIWktOQf6B
	X8fYonmZbR53G6iR0oRX136YEUAZYyo0Yy7zD4FyqNZUmGe7kcL1n3pkS62qKyLb13KF6tVWhHn
	NYmBWydbGYjAqKPxRv+Y0mkJF2V9nxXk4MpH5cDhvK+zYP8d/POctAagMvkjeqsnfc/uKZrU33F
	WGqpWrthl7o2AWbjqbepupOKsXrnJQgJx8ebAHxNaviFTSOjLPGDSWMTk8A1IqKLNoGf0GM5CYL
	GMuE8dwQJpkMbn3mO0xWXyvA2NASRLl3DqDLLBiFcsc/uyE0wYgIAFvh+y9kZlAlhtkvU9RM=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064945585a.6.1795607834511;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3064941185a.6.1795607834035;
        Wed, 25 Nov 2026 03:57:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc244asm621335166b.55.2026.11.25.03.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:57:13 -0800 (PST)
Message-ID: <f4d667b0-8a92-48f1-a033-3ba12e0e85b4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:57:10 +0100
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
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
 <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
 <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <361c05d6-b5b9-41a5-a33d-b12f534e5893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX1yTIBCJWJ/vo
 L8T7Hg55eS5D1xyB7aAfoDejHuMCcRDWDSI/EFxEJ1VcuZQZqiCaPml1yGB8Pt2Ibs6BLyt9nH5
 DW6SJ6fhK/t+8xi/+zcgurwe2ZDDYwhfpG+lja/t3F5plv16UNx4gL9m1RA2JnA9EXRA46W+XIk
 kZoeBZItPf6SQqdreU8urJZfW/6GMqkMBXIz2JW1GxRe89TuPellrF652ecx3/38m1yDnvF5cSE
 z2U7QHqekdFJdIKo7QP2ZWBFiXvSE6ItXqM4+u2HRy/RmV5SVKNxO1Xg+vMgnSIt07az5ssXr5+
 PvJlVxcViz1zXIylZYRZob2gVM/Sqi2rjDRk+KbvIZjfxPPv/+vTOv7Pllv7fS4eDLzkaz5+Ih1
 kUyQAeiibZ9HQD22d1tLW8MZPUKK8exOu1HkwBuI21CNAJirJ5Oy6oPCpAbNaQqpJvJt+xRmghy
 T+l1dhXDII7cSbqr0wA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06cd1b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BrYspsXIrGSGt3-AnOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nTUKCha-McHzC-r_0hmf5oI3UU1WmkT6
X-Proofpoint-ORIG-GUID: nTUKCha-McHzC-r_0hmf5oI3UU1WmkT6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX1zI1KCsrPgQZ
 o42pQJbQE+70i3LzGLri0fSOB5fsN3WSqQwaJxmS99d/sIJ8qMsInLaq1ElBblylIWWeWWthXFB
 CXk+tgqIXzPTTjFu+f7kY/ypyoxhbaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/3/26 11:58 AM, Ziyue Zhang wrote:
> 
> On 10/28/2026 10:37 PM, Konrad Dybcio wrote:
>> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
>>> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
>>> LDO supplies for QREF to provide a stable reference clock. Without these
>>> supplies, the PCIe PHYs cannot work properly. Mark them as required for
>>> the affected compatibles even though it breaks ABI.
>>>
>>> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
>>> compatibles. refgen-supply is required for QCS8300 only, as a workaround
>>> for a hardware issue where QREF actually depends on refgen3 rather than
>>> refgen2 as documented, so the PHY driver votes for refgen3 directly via
>>> this supply.
>>>
>>> Signed-off-by: Ziyue Zhang<ziyue.zhang@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> index b353b7bfb839..bd4c98784142 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> @@ -94,6 +94,11 @@ properties:
>>>       vdda-qref-supply: true
>>>   +  vdda-refgen-supply: true
>> There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
>> defines both.
>>
>> Konrad
> 
> Monaco and Lemans only have a single refgen(vreg_l7a) supply. There are
> no separate 0.9 V and 1.2 V REFGEN supplies on these platforms.

VDD_A_REFGEN_0P9 L4A
VDD_A_REFGEN_1P2 lemans=L1C monaco=L6A

Konrad
