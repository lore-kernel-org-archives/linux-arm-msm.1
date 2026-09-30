Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0234848B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764446; cv=none; b=RY/7vaBSJ8QTX2FANmoxnu+xbCyhoWweJax2PKGWN+g4zI+NCWTTBoSDmap3U+oBai9v46PzAHWtB1ABrPpGF37IjcL5cBzr0s1VkhEhBZiHze8/fIuRr0W5lHNDfoVHwLDOl1CwcNFziNMq0uZAEpwlsgVsc6pnJLGgYbq+KyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764446; c=relaxed/simple;
	bh=B5M7ExAdSYXfY9Ds6hbircikXslMTP7HxDS17duaV3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nue3bwt+W/JjhECni+jRLSVxWmLwLViLRof62fZsQxjkF/q07XClmgW/9cQk2xBeZRVTU7s9Gl6/VzKfKU4XwBZNz/b5nb45yXZUxkczZ6lQcsy5/uqInFAVPwdepv5ekgHDbkNIiBOn0a5JQY5qr7ZlvHuKGDIrbR/RaA7FkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcuLfzas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDJvBFU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcuLfzas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDJvBFU7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dOqc2213405
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=; b=mcuLfzasxShQJgwb
	mMbKqSxFaxJ79aQakGIq9OtLRDQi6rPc6aLJ2alM2KjKJayGEjR3hcE7TadMmAUp
	ZBsE7OQ13BrqwC7nCT4cN7SaPS1szAs/jTaq99+p8EKaM8Dv/O+7uAa/CKJl8SuR
	D7bVPAp+cD/oUvG+e1/hDfOB2oBCJuJeB6UuhPZHdcq/vS7qK8kPTOOtnKn9+yA/
	y0sTaugqJX2ccet6gdX4OhEGQUKzCtYmDA2Ul75joLl10Y3zBoa15Q2yxLVLwOAm
	qqqePi2Edm1AyDfvrsBpDWsoX8HNbTzO8fVQXLxc7Y1vh+0e4AIyJ07YNzUWBxiO
	n3sSVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj046-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530e0def61aso16748641cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764442; x=1791369242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=DDJvBFU7IX9+poGrYkO3rPzkXlhgqdtTjVsRyLpoUMDqGSSfK0uhQ9IWCE+5NLyRK6
         QysDosrttDZxi7+X+kILwc7BHnJKpjRiA67S8F710Zwv76KrYORUNL1mPbZqzuGeBl2J
         I4cPHH6MqrW7nw04lCP8bL3d+VffhPx/envs7GajmWbD/ru1bSRBBKrjmL/+MHlI9bJX
         xoMVpcemXrRfoLdl5kdaCQWVB/NqaEQY0e8QZN/S9lryK99ZuzaiFmS6r82yj5M3fzpo
         Uh5Klwt0URkp4ueiOkp64E8/k3DGZglWHddydd76nBFYT94NThfszADCxjvDqFN5qi+b
         W4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764442; x=1791369242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=j+OztK+LwKLTfDhxMwKxKlDixELsLctH5Z+NyWZHwaTtcpMc3RjOCQjDUxIyQhgqbV
         b11xf9wwxm4t56s8Xt3ltY2dPrWn/JoLkTnlvJR5IrNz4gxsfm4V6F4Cjf+jgnHTCZM+
         viIr0vBDZyf1SiJylfNOMOGKelu4+7TMgmkrFIDW0drXKjX0lsGK992DSf/kI1Ho+oyP
         sx7+smn2sdvnI2f63MfgH7cQRd0/Fwbm96/mGkD7X5M4+vogpW1+EuhKDEESbo2y4P4S
         I8Lt449o1s3okXa7C5jM7Psr5oLyLLJpje1ccf48GGNcV98kD4+bu74H3XqPYnaIe7ly
         3yFg==
X-Forwarded-Encrypted: i=1; AKwUvBzL9fBYQByhDSZOprkyQlUi/0l5dshzwEW++x0kuDMxzLASpetzhzRseuqs6AJW+R8SDG14sbfi+wn78hgc@vger.kernel.org
X-Gm-Message-State: AFuF++lvbmuKLKAIIsn4BUO+o5icUZtqh0RJVYjrnujimB5m10YaXchC
	6oqfM68hUyNUJrZDBY8sklDqVUxbDbhQ7RyCX3eS0iZchOl8ZNXJySF1oot8LTv069aLHMiWslI
	ooTZlWhRUkI06dwnEELhUpB97aAldHFEJ9j4dAZvVQ1p7Se3lTjvC2dtmd2c7u0lP2Oto
X-Gm-Gg: AYBFou0J3rlotg8WXSyJnFUHW0pbKbmLwP1e3xseplb7JI/vNA9NPSzAi2ezlE4WJF1
	5f8EBWH7DjsEnamCsXwVsHXNx37xhd+PIGG8axU2wk2tf1Q/05SfUt3CJYKawQqF+SV8mlxzRfn
	nMqGM8q1GlNLesXuIho7BmEJqrIpufXwWAQ5SgxHyuG+Do8w1eCn2e3YOOMe65+OB5Z6IVh7Af0
	uzqSNeYtBWvhErkWq01TD0xcksF/VNiRi6oWxY2XzdTPVSSNmNMTBj6DRRFq2aU+BZy0eMpq2Ae
	PPAZA5idWcKakcNAljk++mO4+chizBdV0OR465CDl/JNPJofGG3+TleCIyXeAQ7DI86T0a5Dshe
	tdpuLpSP3y8qsP5OA3ocwNQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132549085a.0.1790764441811;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132543985a.0.1790764441219;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42da8sm44604666b.19.2026.09.30.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:34:00 -0700 (PDT)
Message-ID: <4f56045a-a2d0-4c3f-8e69-9ef8d933be8c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXw8qpcVqOxxgR
 pTSWQXqBcp/8MQAX7P0GM2zWErSDPtReSuuEIwWDI89Ay09tmrT9dW2OqVka4CAmJUpGsJDMLm5
 /wrLEQ22wgw7/OcauV5vW7D7aJu7XH4=
X-Proofpoint-GUID: UFPsvrl_aAsmOyWOaMBo9mei9X6RHQNb
X-Proofpoint-ORIG-GUID: UFPsvrl_aAsmOyWOaMBo9mei9X6RHQNb
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abce59b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ekhMd59VzrWsTOqxRA4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXxgHQ9Xbupulq
 t6mOP03k6iRCFa7+vylnZYbUSKuWwq8mfosTXBzTEOOQdvUHkQQ6Uv8kdXSzp7TLqKGSlw21PvO
 OUdZooUpuLMvyhGuy5B4o9tcLw1QcHd8tFG3BcJdlREYvHN2U1lFLZqapVY8xMT0sN5E68kNuvY
 QKtoWBme58YIaXkrP6rBV0N3zL1DPvPCcMdbldHs03ccvNwsCQfw5dmeVRQurWuwnYNvHpqSA81
 8Edh17PcoXem15wIw6Xu2IerA+2VSWnH0MqVLJ822kVe4ypmXGxhx7rOZTzbO/oRPuCD61QIvhe
 ww4UEi/iQAPvP/4zlIE5K7TVu3gjElnYpLPSzYYih9IKNf73uxbejmVN+4mvlKAt/OO1q/k3g8v
 DpBlLZksXMA4YDTStUwuQ0GNJj8Tqc2hfS0iFpz2k0tv4Ai5ngQ9s+qNRuTXbnJ+vRDbMOEeBMt
 55ZEZGcZ030dil1y6nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300042

On 9/26/26 8:33 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does 
> not restricts specific streams with specific addressable range. The 
> non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
> pixel stream can address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Please address all venus/iris-enabled platforms once this lands

Konrad
