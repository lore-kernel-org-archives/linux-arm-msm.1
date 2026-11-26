Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705307;
	b=H/JOUjw7EXgLnvDvCRkOk+5PqgED3ZIB/RsOjnn+d3nwQQFoQUzetQ4eBz0fEXzY6hs4
	 0wEALlYw48dv+RhfWGq/314mtc2O2VdLQnD9VGM6OoCNTYRhM388WnZHA8oHktrubSd/z
	 43VvqZPYTrpfkezD8lT87MY85vNfaUJv5O5XC6a+4fMlKEXPu2ISGGCqX5o66IICJbrOI
	 DmjungMKXSnEYDGi8PSfNQjlPiwag2jyKSAN7bmcHk4OOnygkjvM3Qq4WbnWlRN3fCIUo
	 ZXo49JvGaJCaKwR/7g+10VLbpX0RRRbnoFJ2g13Bjq9ITqEXI1IouEfjwkM1fb0GFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
	b=OGfyNN88abD/TbEalfixfSlxa5iqs1S9Lo2GC0I8IESCiKgqNEBjFuEh7yrzfpvF+DBQ
	 vQY7LlZaWCMAJRUNSdJQn+Duw9r9W8+uNcywJro9XAfvMVOANgsnWq67osziWKCaDTq0q
	 33h9DyROynKKXGRchVXbWzQ77eDI9o2aJuMosQSraMOkcOtLPchGuI1KmLStTKCezgm/Z
	 WXm+2i3yiejbzCkIYd2l/tVnkPMbqNYsHOWR7py6yzO73vmTp0KGfFSEdEH1f1Q7L5TaT
	 j6F1pkT/YWJu64ZvPwkNXlG7f/+GGcfNyf8Up9KJv3fdVTaf6xIyTA0zjL534xAfNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DF606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWclrFBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cM1leVt6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVx1P3299200
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=; b=lWclrFBylEkYJmnz
	uQqsbH3qxDtNpVUljF7B2i5IowP3/Oz5hHlLqH2U8Iyjwo1ACDZJplStp2qvZkyY
	zBA9II2Mz9JjOZQGYlv+5Z6DuuuBpaanwklVZ6x7e/++ESCfR1/Laypp6cMYICX3
	ajwQ4hQXebB8lLxGlADQnuWmKjmzAsREYHp7ecQW79cKIGkSlndiYEFMaDmRicVL
	TcqeI8UcjjWNIoTakZqg3iJTrQlVoIjWRbaXZ1A0PAZhogBCX9AOnz902WUl8VWR
	Lk46w7/BeCv5eKvATozGYNgNfetjve280PVTyMjT7zXWV1v2iZX+NFXNEPOAy4cn
	VJvQ2g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02rc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:01:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso318813e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795705305; x=1796310105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=cM1leVt61HZ4VV3DoLtiB+baFd/YUABW7QazNIaiArAaQ12dDZTeKtStL2UqwY7OH5
         GDIz58YvKpRoumvSKRj83IRoMyrKu/GaGlU8isWOKnYkBWRb2VM6214/Kjm098/HrBlC
         77pLAdxoQMPdVFzpnf9SXpXfvP6MqkRF54aT0bFB0kFYM+GPbHJCBwK5aMip/VqpQkDv
         vW8CUEysjNEumNq4Ub5qRrt0UCVn72HCCUZVd39zntCSewwXIKpnvVik/wQ6L8Kq5MhM
         C6pB94yj4otSTSLr8+jnpXssGPM9UDi58RUDSc76x9B5cHst0vJurOEOBIlts0UTmxgp
         EbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705305; x=1796310105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCBvJWUUzh4EABV/c2ZfxvfD28hjPtQ33YkZR/isC78=;
        b=TPhbVpPDU++6KeE+ch7fAJ7gMC2osGJ9jJBFq8wKXLnCkG2/hS+WIwGwh8RXTEvGKl
         8LYHTi3erKjxrw0s0AAcWH1vFSXg/Ejap2bjlGZePYSa7rzk4YYgMXaTUQoTfaKd6D3M
         yVIWcERR8MFjx4XQKPEDeZ6fLnfEzM+ylUdDoGu+jJkcKQWjxMb5JV3p+fpDfQtxUfeE
         brwwCi7ei3EdfxlguYTM8k8bQQtSzANqb6efUlSLamPEV2U5jY2W7wPzvHAdI3G8yb0C
         gAqenQ7/ka3BUlOcwHkqTjdolavP86UQNLLvQYRrMk/ktxqDhBqA3h/Y9ycPP+x3+VIE
         bC+Q==
X-Forwarded-Encrypted: i=1; AL+hErFv8IWZTprDMrmf5sThQlNHNi5LH2QlnPy2lhjZPOU6R3czNLZP7fGYxBVOGHrp/LMpyb64rfozGj6O4kix@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZRSDEdPAvQleiaiajDW7vemDjbFUIi5nShFNW3cK2usdKn2Jk
	83U6sNIvC0bMloIKWJFUdR82GqeK6dRWUWTmD1c/9MUh+dC8704gXL+Q0LW2tJgoc444HbHmn6a
	S6HA0bkiy/ln/Wdp1s4WU2/UsKBfFY0TxNYlds9fdgXBMAwgcvXgFhpBLM4aKkP1pccrq
X-Gm-Gg: AZFdTZeLLsQnT2gXDak0w9udQMoimq+mOia42q579BpZtzxSBYltogXLV3Tg1kCMzhH
	MlHqgqP8/gn1hBURJYlVQK2vViO4XQ97J53yfCJU1cctvWBt4FsNf/Xm6++sOjwCEUMVDYqunYJ
	PnfQGsLJtYfxkjTC6t3fbMk5OBfhcrEmxZWxmC+jOE5qIW62nzncfEfOYWzD1opK/jwxXx8WhD/
	oBfIIjdAySCQzF4wbmQIsrAstc/VB5hruvUGWmao3nr8dt8hZQUfcDNhlzIaTa5CnI+7+JqnlHd
	MnOXLXXZ03AEtz0m3udTUWLMyUWYUP0TDvmGck4JF5ifc2qlq4iuvVWAx3LNUj97QFLXqdvv7OZ
	n5wldhEaZQSawd36oxEOrtH5WOKYDFsUwdXGZjwxR8q9OifMmDbhdJXT1LZoXdUJ+Ih9Ml5g=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275359e0c.5.1795705304696;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr13275286e0c.5.1795705304183;
        Thu, 26 Nov 2026 07:01:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm790932366b.4.2026.11.26.07.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:01:43 -0800 (PST)
Message-ID: <00422583-53fb-47a7-bcfc-f517b84283c2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:01:39 +0100
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
Subject: Re: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b0849d9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-NiRQLekuLvWmI5UBGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: ipLwOyuK5OmxCquTtLnhc2U4mb9fXjqF
X-Proofpoint-GUID: ipLwOyuK5OmxCquTtLnhc2U4mb9fXjqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX104/TEXvdZxM
 U9M3juTUAwhnXJpovsMcKKYz2jT/YB9xxv1sQeA+yt7H2e0HJIi7dab5f8FKdgXroxynalASrlJ
 ZP7yuugJGq88E9KffZl6O2DD7HLEBc474OL+JA7PAfIeyDUVhSH55BSgfV6RM5PKjCId2esSBpO
 9szA+u2B9e6Suc72v+mm79E+lM040R0f9g1EOPNlXFUuF6X2bD08nh2SEwl/zveDiZbX+pFFdni
 0DVtEVfPqawsDfEcJiFBqZotvfPZLHYrKWeymMQlE5qTKHhLE9BjDJlZCc5EBOpbH3225gCOnq/
 08xd551K35Ij1f2hTIBwReS3RNqor4Qi8Gb4ZJEjTiXfb9QhLzgJzzLvUvav+aF97CQciAT1dE1
 IafaCvH4cAhY02/gsoUsSE43h2uaAdwDuTEjBV28F41OF+VLVaojPyDPkJDuOxZdjpEKrknomss
 LjoVli3pKkCrF7jVZ3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX+vhMTkI5XCdr
 ZfvHUuh7em/538qYbHHzqMnBY4akRyQHi1XvxbHozeFVzmqUflWx3qjydP2nF6LxpxvkvmZzGdv
 FWraJmqBIO25xn6dYlhd9eoXs1keK70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/16/26 2:16 PM, Nabige Aala wrote:
> Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
> on all MDP_INTFn_INTR entries being sequential — MDP_INTFn_INTR() macro
> computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
> Appending INTF_9 and INTF_10 after the tear entries would break this
> assumption, causing DSI tear interrupts on existing platforms to map to
> wrong interrupt registers.
> 
> Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
> MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
> block intact. Add the corresponding register entries to
> dpu_intr_set_7xxx and dpu_intr_set_13xx.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

The subject should be more along the lines of "add missing INTF9/10
interrupts". Then, the commit message should explain the reasoning
and effect.

Konrad
