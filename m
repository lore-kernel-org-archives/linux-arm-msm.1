Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699379;
	b=3EddVrS64zjFYrpgHxFSTjMnS2mNjmC9gQYVSczFO0HofrXRGGWWEz42qkpl9zP7UphY
	 aDxZXpMPM1GOM2i8hOC9AG4X11kZYQdGjSuGuYXRSQ0N+TazkK9uZAjFboj/Fdg6ac6zM
	 KyKfmGczUTKjkSmbNq0SeHdTwxXyi23j/tRNE4U+eoVf1DB0ryAI77QvIXU1w1T1LqT7w
	 RiB0Gt1O5e6M+v5id+FK6jAwMNbkuRhlgq6UyPIUmLSBw0vZFOSq1eKyg92saa3bHAHce
	 hGstn+9qkE0SU/Y3+jNK8iTo5FBojVP9VxcTiXihOSlJLprl/LUfNYFmWbQEHdMPVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
	b=TYjIYZ5PDcvb66G2i2ngvCTCchfcv2XeUN32VOP8OZPX9Xd8ApDud4b1ocCJmyCFp/e4
	 ILEQy2AkzJKmqlE/Da2/758EekqmvnM7/jfbujmBCovo1b89znMzZ4m7QAOt0kuA7qWRs
	 ClGyUmimo0E/DoX34SD4CqR5awdv26q1quIx8opPuTE02ox48aAwPE5fY3p/BanQ7XQa9
	 lwtgkx7tX08ngtSMRyCG4ZVOAZ/lvm/tBdt9cuvY5NXYgpgY9CGpmtzReMBFqI+uHRHxn
	 ifdIrZi3LUN2tYoJzw9VIzEsfrh7Ntb4aeF58cTqf1zEEitgoHd0pAZTZxc5QTcgt8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvUdwu9P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB09606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB09606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvUdwu9P
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A382STC4002830
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=; b=kZ3AbXuWPVnIFJ73
	O739e4Nif395c0f6pBHTd7pycrx1UiErORl2JUqtk24WPwDngoqsf8ZqFqWF3nmm
	AFISxSw4C3dAure3DwRq+m1KyQku7/0KGtueKXZysYXs6kSG4qek8xyK+wrDfn3F
	8KYo/AvkQ+x6Ufr9gj+T3849nSh4UKiqdsupZZBdkKweqEMcnPYCr+9RU7JlxgYE
	ENpL2EtDVa7TZWfV3pRj2l7WlOAa5RVq0rpAW3aiTuNpZWQpNtKcP+50iDEbKZVa
	I9RbXZUAwxUCxMCTJ1uLnFVtChe4oEaYNb4YNWVTz4tTG1jggxzInktVfYe0/6wc
	mKUjrg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek3hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:49:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c84695584so11853966d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699377; x=1794304177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=OvUdwu9PXEkCdP+U3r6mvE4PA23jYV1AGLkAEOqhGGTvF9XBtZQczkaKGD15L+o21Y
         +Dp1au42mH4ssx5a3RnIbNgsEM9x9EcM3uWCaD5dP8XtDFXm674R8iUPFVwLE4DtLZaX
         kuoXNJ2PLlkNIKiCi517u8LlMdwKj8PrXknH9EQM/km/sUf2b6OPe3c+jor6UwZc5lim
         eJT7TUAh98Z5a9wS69K8LdKvWx7Li74M/YUnbmdJmvSLkEeOiEQWL7Nk2eESO0n8kNxY
         wv8B/qcbAXBBrLSXVhnqIIG6uf/KvHN7TpEtwwIvY34zJuZne2t8kMbR/qtB37tRfgVu
         Vo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699377; x=1794304177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=Orea6vkgS2bUaTxuJ8lq4P41NktRfYwS2Q9Pc4HocGwDf948yLmVCe0VIOM0nPKKsN
         k9dQawZfYT1ZuVWR0tFG1OE/syGGnIP16Hr9bxDaGhjPGkyisvdxIITnMgcYssCii1f1
         ds1wVdIAaIrtHoB1pohQJugSTR3t4hv4oihAcswMWnginy/tdOMoxSHtYYPjGY8BR5dr
         O4mEaYofMx5OVCm0ABU/w0wkn3k7UE5E7sylLl58w6cgH5GPGuBwf3PkhJbca8bMlXp2
         WJTn5hX0dqxXDePZE0AIBG6sgEhFEMx51hUfkZd/FC7ODsh6CAr5rKkmT0yLhP+BWN1l
         8Fng==
X-Gm-Message-State: APuU4Z8wgxxOj0ThTD1HjXTO5y0M8ZOP/hTz7qYjZE/9nXw7d+4zwf/s
	kx9PUrx0GBTAmELmPFIZSuSL/gSaEs67NE6fSyWEAig/CyaEkpHk3ghP2AMVmjeLqrVvTek7fcC
	FPXFMMX8mfkM5UueY/gNbtCIbHGe6oBu60szs0z3o0t2RDHnzuCLuaw/xc880VrCXGyih
X-Gm-Gg: AYBFou1F7E4x0cQ7HrJ47f52EnLAIE0wA3uPwQz1DmSwWtqc+059PoBgpWoQuAW0BVk
	gF3ogLxiCAGNUx4fFRq/MyKdaY1HMimWOVStNSOea1g6jREzLO9sg/X44GdzWEqcXa6P2N0EuXu
	SD2NrDfzGJRQK4WEk2m1/LrzAw+HS7ljXmDmQlTgsWrIEeJbdlnyIUgPZ3Tl6Oe3+4r0OgCHVu7
	YwH2b4CINba0mS1hzJRw1HVEXknMeNoFntE5OB00RS8kzT3ggeCbwev6Pk8XGyJNyfozGelQkoz
	ZLV62A9DVimzNHNcKyYfZZM6yxsYY0SFTu36dAlKDpqYjrQYU7rZ0x4LiGLjjN2kiJWUjtOAEXd
	QoqtoVn4AtBgIozMuUBGY8VHJ/FCeOOCjQDOH5jH8AJy5m4pAuGZHG2opQ38aTJFzrSw98g==
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850426d6.1.1793699377522;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850016d6.1.1793699377101;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm68701366b.13.2026.11.03.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:49:36 -0800 (PST)
Message-ID: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:49:34 +0100
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
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXxRSEvNgib2wB
 zZLv5TlxVzJsF2oyAxOabkLNGY1wTlaacp0pWj079mmY4b/sn6DhCTeQFqPjIQ04P48pmCoKEvs
 nEMQouHDJcLL/tQRXPyT+IrO+gXALW4dGiml4M6QAGwIljrkezzeqXgT+uiAzuuMRTp3fMRvzSh
 GIuoFur8xUOUq2MtZGvs1odD+wpkpDNNB6iikOa9Gq2DHWBoKS9bSYxsalcoVeQlnIJpK/brhlW
 l3kZOrvA5oc9PzeVAksGa+nYAuqHaCIjybLdTDPxgTOjlVDl3ffMO7S2MZHjcEa57xiczaf+4De
 aoIY8lSR4VCWSN1iK7zWCrPysziEBSXWXjqDIBbZeYgAqiui0S7HTAcfKxADOoOSQB5nWfdnYP9
 wTdjBpmG6r79IA4+jMpIwgR5I8O6nlm/8YcLBuZMwROExz1rncOXB8IRNZCfzI3UIzf/YtOuYYj
 jtjJLt+M6Q7DOZgL96Q==
X-Proofpoint-ORIG-GUID: Edx3s_zY5TzOxxVXPySvdz3Gc5At-zz1
X-Proofpoint-GUID: Edx3s_zY5TzOxxVXPySvdz3Gc5At-zz1
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9ae32 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=U0MhLFlXrxXVFuOl:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_AXJYLjol3WrTOYx9vcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXwPm/aU3AAYbG
 gJwh2/ZSavTXMWXGCXfOQBX7HT+FK7morkqG3u8WuGHuTRWmITbXT9bf6RsOQewEOaE78arb7CN
 4Abqjr/hmVzxaxFbJMOt77jOnfBhJ7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 11/3/26 10:48 AM, Abel Vesa wrote:
> The alpha value of the Zonda PLLs is signed, so for a rate with a
> fractional part of one half or more, clk_zonda_pll_set_rate() programs
> L as the integer part rounded up, through zonda_pll_adjust_l_val().
> 
> Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> zonda_pll_adjust_l_val()"), that function adds the rounding to the
> requested rate instead of to its quotient by the parent rate, so such a
> rate change writes the rate in Hz, truncated to 32 bits, into the L
> register.
> 
> Use the quotient again.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---

https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/

Konrad
