Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653C42047F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888480; cv=none; b=V2N9RnvC9X0b5f0MibVCtKyMO75zifm1qPeN87VnwPbwdtT2pfW5Uewb+khXn4/g2gBdvTZz7nruSEkVB//b8Q+g5LGunleBww6e94V6NK1FjTgaqy1Ya50MJKjEUDDZTkvvg46BWdf36bBRq1kRN2XBW1ZqGnKZgTGUZZ2u3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888480; c=relaxed/simple;
	bh=RajtyGnvqSZANrMBnJyOPLjvBP7Bm9/LvSNzKUVqiCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/Pb6qf8qqWPoMn5wDXtV6dqr64Rux7WDOC8/Sj3OUh/CyyHtgAAR85BMe48/1Su4Qo1909mvyixCcO+mYcSx6CMFelhnX04Y5O2QXEw0oq9T4G7AQc89WFCzU1AtV25hE0tDLkoq5EpTPCoKpf467NKIGQWRnYiMRmAlMSyupU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRzELO4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLVr/ZPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRzELO4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLVr/ZPf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADexK2721099
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=; b=ZRzELO4zyihGjziS
	72Nlcb3z3s0+7l5QxHhHql8T64UTRRfr1tJSs5oO4pvzdqFpnt0Q0lSz1yZCJ1Rk
	zPoFELxhAyJHMfDzMoWWYVGS19pSgrr1AucfANF9QRSXjew499/Kjhdy/8+WRkXS
	VyJmFHZe+EE72oXZMUjURfNlPTnMjJ9wev1IGseM0595zRpY4m/6a40E3neQGXiX
	C/qCPH4AQGM6lcR3PpoRLJwHYa0/V/7rE1ChdCFBWCj7UNWP57rV10MMBTxlyKlN
	ELS441cdSCt5nL6YxPCa7G+Isc0y9CTYr0wcf4P0qmng5npxp/IjnLE8UooRoeuu
	kgqN2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag23t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:21:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e1da97175so427405b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888477; x=1785493277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=LLVr/ZPfIo1S21wiks2ymC2lz3TtY9qpDiAAKuLRMgfw4+KoqlpIK7zR4husOYJgnV
         A6D2RTP2UzvQ5iZSygdNgSw1GfAoZn4HlVJB2jovEosubc8Vqxwg0coUWekxXZkJw5Jc
         3i+iYe2d7BjFLAUAtDG/qHKwv2riVMQekabuJUo/98J8m0BZg2cdvLkgUZFI1ewDyjpL
         JPyHDruv4lE89znd8Vaqu7+LdFiNTHDIqdcAc7w15HbU5pka72cADxN8dJbHEEBg8iow
         Tz1yMvEyi+tPeWLgpuWOh+0UZEhJaDc0uRSL1sL7C3AsqkqcbkkCgzqXjWf5PLnFU75A
         JWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888477; x=1785493277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=QZl+PzbscM/5GEiHo1hRVAdZzjxs1DicJ3dcc43m5rp6qthDvO1L5ci7Lk9BICy1+M
         0ccJHh155vUxW58usdCyDd/9ECuRXVYdp89WDIHU8rWig/RGuJwKJ5O1VW2utYwCA2Lc
         5I2kNJ1QgkRFX3vA8smS9LhDGgikp0p8rdpbdy9Yoi6Os0Ll7ghzuq+nsSR5YBohj5w0
         X6G/a43Lz7RrZ+gecw8NpO8fgq/6hOVHvQ3sOLYLRYfBvvgtnm28UM6tjCK4b3TvtA8B
         wsCMelPAvnTSrhnuYa6N3ymrkhgfvRAsnLm/PlvQ3/HK6spKoXbi1pIUjV+owk41MuOi
         mkag==
X-Forwarded-Encrypted: i=1; AHgh+Rp+R3BPduHVTHK4wyGQlWNhP9hm1aKrzt+kF458Phi51/ia3m9OwW/XU5CDtodPhZVe4mGEeEO6LVyu7J9U@vger.kernel.org
X-Gm-Message-State: AOJu0YxsxymkMEtWQCDSN+ludNbVU5BjmNNa4kW+964gTeR/TRpQ151R
	odGdZwpwRw9owJh78fKxrf6IoJabrRKEUFcvlj/qndS1oPF40LZeAkPlQbfS65ZRK/mbQGGu8We
	Xpyo6aySXjW2Qh5RhylxICE3XNkmqlDhwl5F/pHxI9jSXtCfp8Wnc39UScw9kCTUdVQEu
X-Gm-Gg: AR+sD13vMA2lYSLwdaA5SJWr5mS+VyI040e1ovi+h4yI4RjSNPv/zWIWv2JiPQjYglL
	djDbDMfyu+bHpRIzi/oCFErfHCrXQQAU4+yrjbmVEI6Geil6Fs6CGj0wAE0xhOoSrRHU6p+2ARw
	p8l/8t6rErXajGpBx4xUxkxVKWNTl0gNazjXLqDpjVApULKbyhiombP8P5JDit51c/2YPCT3cVj
	+xvllCrOqWCcMN/RTX1RpKoyFnAkXGawA8HU/vCec/oqXsa7MMamqKw2Pq99mgxBYHYHVXDcHK2
	UemOs9ILaLaJ1vqwW5AqG6o8pAde2i9V5H9nO8y2XmFdf0Lgpk72HTBHTmqgu2JvCY/LC5fYrwH
	0949tHovb9NZiDZ73I7lcL5/5wWawfn8=
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265034b3a.71.1784888477618;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265010b3a.71.1784888477145;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4451448b3a.48.2026.07.24.03.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:16 -0700 (PDT)
Message-ID: <950e7499-fc8b-44fd-999b-d3197bc92308@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:51:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX+zalycTW/EGI
 jbLUpWWA2o75/q/mqGEy0fC58d17XicyUZJxx3WZstFOjGTWccc0i8YEdNWgK/k7xvvm3hzzzAU
 u5N7OP04VsbkcewdY621j5T7x88ZjV4=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a633c9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: piou15-KwGuS7exUQ8e_ENvGGcv3FXE-
X-Proofpoint-ORIG-GUID: piou15-KwGuS7exUQ8e_ENvGGcv3FXE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX6t09SRoEbeTU
 0KhD0bc5onCbZz2QOTPXhX5uI5xrO0cqY9a7SGTHhhWunDfgX5ITLTwbIOGKAnYuxMviM3rzdTy
 v0XvXAx2265f//PaNmovrxSQmdmVvrA7E23LPg1IsiNoWWQdARqjCR4ligoPDwnrF1xb8mzlNiH
 wEZqgkOt5LcAl1YH5DDWG2GP6roIopcq11tdj1fWV9tz0ABdVnTj0c3g53lniKTWEUqs5q/pV4Q
 HWdbwCZzQRtHUfgtRzp7dPTVUv7yRyW+qI9BhXF0wfliF03f09Ir3+GjQfZKXAsTA42p5JQoZak
 no/v6eyJZwBP13VIfkRGKcE+8vIFz+/ryMNhSH1FnXLRZYNPq07LlacCqoQ/2ABFzKHWYvCwmVW
 yhhD6eeVqjBdtrQ8PL4RGPaUVvEYI6qML2e2EBt+egLLN5JZo0ctNvNons4POvwxZuxN6lf1gO7
 LWriJQAFKrLAqfFgJTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093



On 7/17/2026 1:01 PM, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
