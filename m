Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8F442B34
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389821; cv=none; b=RP9NHPAZD49o21UvXdd4t5jwinlX6wBtUSI9LcgPYqVBUJgnbne/KuDURfSZHX8ocvSGzb4D8mE0p6AhRkVzLk/zIGzL1elGN4s8MHGN2ZZP0h1BToORa4RD+b1CEGtvhVzxllRq6iEmSWGD6+2Q2IlyvFFHcA6/Ry6hmD9Kz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389821; c=relaxed/simple;
	bh=aRDV4NQWV4NsgjCi9yU3FrOsRVicWQRjtrrzW8lU/pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBfvwWjSg8DL4OdOf2dztjrb//vRtJrKSB4KHUQ1GpeG1vJDcnBOLiuqSDHKnAvgGh0tcKKkpl+Z7LzXTj99oC85/GHDcu3VPLXRgEkOxbst/hBa0MiV7Ql09GO3WYfDTI4Z7sooGuvUXxvfXNFe8/IYnuBHMl/TN63S7KndIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGiimiNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICBPubZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGiimiNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICBPubZC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AIwVmM2512008
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=; b=iGiimiNmUw9bKts3
	5QOSmQe6o4VlH5+n3AWthUul9VWWn33sDrZy/Qzp/UhzdmWjHAxBOkN3jR/b9zfh
	jeBQCAfcgRzshqrw/YORCOe2Sn7xvkq4gvzl+++UQOWkfvp8B+GBcdOeQ6gSC+K1
	CKSaK+6KjIjGA65B4OSn0Mp6OVWSm3+vdB+59JCieNyVmfWyY/YRkuUdLtN63JCb
	0jJoZsd8B0sIA8BFsTGZQgnmC1aF37FMknngEXyYWXdfJPshC9H5T87G+74Ox8LL
	KTMzSAbXTnZP5BCrJrCzIYH2VfepJAwgvBJWgTSxiOU+WPyupchIVGKNmCBYh1Zq
	ZDVH7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjtgkx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 19:23:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d004f13426so33936255ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786389813; x=1786994613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=ICBPubZC/DnXemTKu34nAZ2re/R97UErMvAdBPHI+jW+KNlC7fLUZbb1cEMdJV733f
         XLUfEBRxC18tCnqKbg2qQk7L6Dxk1NXVeNrCnB0jyPFy5En07ISqp7/AKYdFX1TJjqXL
         3T7+4d+9O/1RqiGgtqXryekGZZAeNdiVljHZqX6vbih0sFoSDZYLTpd+ivfRSwXt+S7I
         sLKVkycjPtOzLE65mqE0aAk7dfOsG3UODvIiMLGvlgMmA3IkMGp4Vyvz4fg/lQC4AWPQ
         SNP++MNcbmnrolzxE5bSTa50q55V/gOdV1Avw0eHUnxirf+6ncMeqyGC4jQ/5FNBpJDG
         sPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389813; x=1786994613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEE6eSLV/vfoLlOy7nis2uUfvC8WaM6ptAHuOkuMCto=;
        b=n+HS+qk9X4t3epO0uAQhNPzoPgqOGICyXP/PmbTDHZQJxlSdejwkc2DZWxQbRcBJiD
         Y1BXIgRMRclSf1FWmZei+wsh1FjkpjxzNcv2vx+aNDjkcRk4eu5siAwmeHBW15D0gxjE
         qKlOPsMY0kn3CAIZeYKWPrWKxMOANaiMVduISFDK+/FBGj9ZOA4aGVKjTS/ouCiQw5qq
         pO0CvBXaisDReE3JKfLIYAGjk2OtJgm8evjqFBHIMbWcKWb8pQhwje+6Ws8PjOfL6u46
         hvVrXFHxAbqkjtCqMFkk/RbKasOaR8HHekY799KpCOiz6g44YL8tRlJSVnxfqlyKqluu
         IuCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Kf/4rhKMipIVw8FBxnwgAxanVBduwo/n2+CwEuCubn9IeUe3T5NwaaIkSwY64fSG1poGWXSM9YJY1OLD@vger.kernel.org
X-Gm-Message-State: AOJu0YzLCEiLYzEiRAMM4DTjxTv+CoPnW2Ildk6gS9BPEJBcl/I3bwM3
	WgBbkXcXBl51Q+N+0SAyJNnEypDeDiFlh/03iFWRMgnvVZlQ6D3yHOsPSzFYwtW1nrlzgk5JBLw
	MVtxxjM/FktQQAVd560H0bHo0RbG8FBR8PFXpo2D38NS6bQ+JjQfBjJAopDQ3R0UetEA0
X-Gm-Gg: AR+sD10rCxxA9WIIPEXyjo0Oz2xGPY039x5XYNKgms/qQspD30K6mIRcWToSnN7K5fl
	oeJordGWwkXP6jX28kevS7cdbndvVxcrb5IRFHrqVSBVM8nxzMpf32zWrc2hQ0SSiE1LTsdEEim
	AFnWcTjxKn+ncQxMyX0Av7tLDxK/AoqWFT9ypwj6MG8M7ZjRV8IqqZVLwdcY87IOZjczTkAQPmk
	CcMmFTez32+qGNC7BuDSPz6QQ8OS5ssjut57hHdz3gNUILwOLJ5XVj/zxH4GOo0pEv7JubGDDRR
	c2A9jkecoSjrYOOw7gmVCjQFzzYpdk5PuIfhBfed8jYsXRjQ6ob2DCJSekQJNSPrlKPCk9kZPOS
	DQjF3hRQQjBbdJIoa2X9pRo6NHBAIVQ==
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137885ad.18.1786389813571;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d3004508bamr47137255ad.18.1786389813150;
        Mon, 10 Aug 2026 12:23:33 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm79472110eec.18.2026.08.10.12.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 12:23:32 -0700 (PDT)
Message-ID: <cb5b70bd-0dfd-47fd-9544-a2c505c4f415@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:23:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
 <20260807-shrewd-white-mayfly-a8bfea@quoll>
 <20260807135239.GA48030-robh@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260807135239.GA48030-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX6x90Ha6vCVEs
 nDv6CIvHRtiiiPGHv+PAWnqL7cDsIc2QOG2GswxOUZBypGpUQcPQErlNxri5SAAvuDLDavNBMF1
 JCUpu8ioEcextVJkHp8YUrLFCYuUwSsvxO75nfemOT7LvWEJUegEwfGmaqR0eqI/55iJyruD2jX
 7dyWP5xbdwNDGC64tqPljbm3r0dSv/Extgd19OHwLlBAlewNHJZfJYaHr5dOS35rFQl1Qhdxk8g
 NG4o5Q5JLSnMU0IYn0T7uSaKaOlWJuibJx3lilXqgXLYSJTjDuvfFSoRkTRg2gky5ElRVCJYcTn
 MCc9mWq4kYwK+0ssKzcL2CuSwCC2jcKNoidsTqhUYq2KShqDjjqJ8gRh/iF5ncuP5S7TDkaK5Qx
 zrf+/Tl/TF6QoBWm6aqbCg+vYZkJaNNNtdtB9bHPbCxJ/X+YhLNo56pFjdZtX/Tb9vWkycB6Gyz
 tagL1DfM3itNK35mKuw==
X-Proofpoint-ORIG-GUID: qRKIxB3lZMS_sWz1GoMLcmlBKBwgx6M1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE2NSBTYWx0ZWRfX6lDdJ+EXdQIq
 lvpNOQF1eVdMEs6+UioJCstqXonUZddmSMYIK5dxAXwqQ52Kro1TkTwFlNiD6G3YTBhSsSCxi+f
 iXZua6VrCPWX+8JbNas+6bRiP1vb+Ww=
X-Proofpoint-GUID: qRKIxB3lZMS_sWz1GoMLcmlBKBwgx6M1
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7a2536 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3weD0my5navHwqW7PqcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100165



On 8/7/2026 6:52 AM, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 09:20:26AM +0200, Krzysztof Kozlowski wrote:
>> On Sun, Aug 02, 2026 at 08:15:26PM -0700, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
>>> EUD on the primary UTMI path only, while SM8350 supports EUD on both
>>> primary and secondary UTMI paths.
>>>
>>> Each UTMI path connects an independent USB controller/connector pair and
>>> forms its own role-switch domain. EUD routes traffic based on USB role.
>>> In device role the debug hub is inserted, while in host role it is
>>> bypassed.
>>>
>>> The existing binding models EUD using a flattened ports representation.
>>> While sufficient for fixed device-role configurations, it cannot naturally
>>> associate a controller, connector, and role switch with a specific
>>> EUD-routable path. This is problematic for role-switch capable ports and
>>> becomes more pronounced on SoCs with multiple paths. In such cases, each
>>> path forms an independent role-switch domain and requires per-path role
>>> awareness.
>>>
>>> Model each UTMI path as a separate child node with its own OF graph. Add
>>> an SM8350 compatible for dual-path EUD topologies while retaining the
>>> legacy ports representation for backward compatibility.
>>>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>>  .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
>>>  1 file changed, 127 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> sashiko correctly points out the oneOf logic is flawed.
> 
Thanks Rob and Krzysztof for the review.
 
I'll address this in v6 by making the two representations in oneOF section
mutually exclusive.

Thanks
Elson
