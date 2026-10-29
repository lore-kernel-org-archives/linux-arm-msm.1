Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274334;
	b=ntjB9Jnno6CEzjXbYkO74TaMMtyPZ2luzbDBNz9dTxClHjFD7vseX2GEKhWZVY42ORPu
	 87a/Sl7aAvVyLIvBmivIjbPtX50pV2eoIpj7t3b2ihtsor0CaMgyN01sgUWRhqIL87uQG
	 Fxom5sdgVvaHShSLNuHQOHiall07Cp0KTiZ6y7e1XpWusKHnq/N71AkaiQ2xsuJI66Ehc
	 r37ol15B77s+Pv+HGi67FXLMfgW86gRhRkmUm6oanzq9nXsFeWqvtJNt1PPCXqUqx4XoS
	 1TAgKYvjcysPaO7lERwrA3LjLF3lem1CapJXgbcmfDM0rn8YTs81F89A6IYFLNmKRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
	b=5O9vPowIDBKCr6YIJfYzb8O3ZqIMD3OGIiwax4PUk2TUjxVYz0YmBXykHG3tmC7t2G6K
	 2qk43al7djF3eb8qZ/U24yPNzfNTB61GLio8PwvantZ2WmiBf/GVkzp0mzYTKq/jrzESP
	 B9us6kQoNcrKDSvdCjOTyjJ2cVqr+UYjVZLcWkq8pJ0sOWFCapqq1XufI7MLkR+2qjLOW
	 mnRrIGmZ4A5bU+zdXOoGLnD1+t/z/TbxPA4YpYbIWWZS/PtFKSVmjL6G25K3SEiyAwqUr
	 fLDTM49ceby4+rmGtl52O17YIekyyee1c4mGpd/wtd9o04MBVJqMDrWDGj0py2mJX/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C1606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vvtZ3279853
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=; b=EDewjzYHcRMdlJLo
	VoGq91+Z+QOaXmM2eq6RMF1b3n+Zuc3wLUqFQZU15c8jb5G/dsFesPMWuBdWK6WR
	gc9pMK6TM/posn2sPLcSdoK13tRAraVKuczXAAAFVTTL1kgSyGZ6aHf0R/X3IEz0
	y9cZWih+vxDyalJLCyS9QisNtUjQ6eS68oWqhfkIYg0++A9dmYoQLPJsTovRoSqG
	pvLbYeKlx6eKtQ0T/mDbiGSNrB7aDz08+MRwYwXJbPQXxNzXsPXT1MUK09L9dcDM
	KV3YSjcE5YKvWb36JEATgBRakZPdvg2GeNOtVuAbYcCtEZ3bav5dLbj3ywHaVIFd
	gzKyJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nat8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so400751385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793274332; x=1793879132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=fPta+DZUfoRqdIsHPdNqc2ByeXobXmP91o0berZN0lnGB1/OT05KuQd4SJ68osHkJA
         rBsSyJd3f6pYSNY+z3so7BB+RTEQIIdoo3Dd5kC1R87Q4uCyLkj8R7RNymfSue8KYI25
         gZxYyJwrT4dGR47n7VWvx/El0ftBndX1Kv+fJHy99fxNk+vJhFNRcfXeB3uCpZ38g+lP
         EUzCVAimf7+8Nb1gdZ0cM0BeeQnyvWj72b+b4qzIezpbRTsG6YcBE3ltP8VuFOCrj3Lf
         RpAMPnnhzMpjpnqYiDulWwjMABAXmhS6ICe8jTn8+F6VBhqsKSrVvqpgn+a1lRwpd0PR
         X/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274332; x=1793879132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=ZQdVsLdQ6SmR1TOBFnix/29Thz681W3LFVDrg0o8S9st5l1X3t3vuc24Z8ZAXJnlJW
         c4X31baNr0wbWHMxZ3DBef4zibWHI8MYXm8XdlhT+ftw6ZYHFS1sZ0Ak0UbWJnnU88Ug
         YvQ5Q+qXIfM16U8TaZ8u1xBYJOWbG1/lDRF57upoUTvCMpq+t9DlKwdliv9fIYIfWjHO
         zfPlohaC6RVi/Y+4Q+AVV2E4yO8lWxdm0juLqOyEQqJx20cRVuiCWS5rtgHSLoaXo95m
         oc7d/XO1diHsYC4F42vrg2Pnjw4eR5+M5+7BcCEpTxATXwDm//Q+ZOXwe1y0uKev77QG
         jxag==
X-Forwarded-Encrypted: i=1; AKwUvBzx+bB7Rl/DzUOIZSBDYxRvJChmetUWaSrfR41z/D1uT6L5yLwnsESXs1OD0ye74wYgnGXWGJH1+MP+0fyu@vger.kernel.org
X-Gm-Message-State: AFq9FYIoIUWA+/a1UYf/A2n8NG5gT/aBFcADdrt/ugDkpsN5bpgAyGTv
	xu+Y7RFeNolyNfSbMGyypI+kXCCW8QNnHhdNnTq4T0O5rnCv9tVp7Y6zmcmukX1hIoadEmpDX0D
	DBO+oPZdKKQTDHRuqPdgDlpxk6ma9mi8M7P/bQlSqc42BgtOwfJ0mlziLGhPRfxkuPAPI
X-Gm-Gg: AYBFou0lwCwBfBKEODmmRFy7g+HfJFBLmSDvNTi3kDg7DNtCUIYbwSa8FSSKqJ0m/Ig
	250V61uUu7iMPs9RVG9lzftz0zEsjJ4ll3MIbcDwTru1du2/TkULmveAj+zXtRpq7mOZk/grkII
	u4U80DB1O9BFSYhMiWZC9E50gJ5N7nldBbMkZID1HIlhZwLiwHFCdDIOv5SQDSyIKEX6nwKz55J
	TP9RgbMUotzkcU3daon4r6AwKoMpQuZYiXhLxOrPy2tdrv653LYRDhpnBwMi8gOnUhPWXZ5pMHk
	3WjK0t7YPGAnBTBUMLbq/E4QKDEwbEQnPtBg6Z5uDK+1dJu1P86RzRAVPhWzyleZOP8pAFrERoH
	9llMnkxPzIAP0Cq8/qhCsVuzkEKlXCX3KlvE8a4Q0cf77xyy4TWA7qodWDrPUlb4hqdHjiTLBHf
	z+dpJKlOAXxw3l
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723489785a.8.1793274331942;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723485485a.8.1793274331265;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm102028895e9.0.2026.10.29.04.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:45:30 -0700 (PDT)
Message-ID: <cbc783dc-cc2d-420d-8e80-3a39744218ce@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 13:45:28 +0200
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
Subject: Re: [PATCH v4 0/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FPZlw_L9I2KdzMJ7EolqP1bPdS2RZ0-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX74wndPN9jyDu
 764wcy5i6pdXmXV4L1VVpScE2OJiucHTzD53tndlHCQo99PeX2oLhgKMOHkb9vnyukJrSAzDL78
 ANyvQDkytTkP5/GUY8Sj+xhMhSYTEq1kwjGRlDlsHpV4cfWerjJtP130ndobg1OO3MuHYO3jRbb
 HXgA0BwwJ3bJiiZSjSTTjGfXWdWYNBkeWCnttpiGCREv0MuUR4DiwASZGhmqz9qw5cUQgEZ2RV2
 HmdUNr0z8O97xLMjEcGwDrIfCUH6+URl/0NNrDEAnMpeqXKUQtrC3mTz9nrkl91lJTMwCKvAEwH
 SljRxPNqG4XLFt3cdkmf5LodWmfVYamwnw5OXd6QCgRg1OU1IzUo3upCM4EdSPvXj+jSZej54Lf
 OxdCDFqLsJtcqgpirF67biRiERQ2aEcsRTapf8oAKVcw+di1M7VAfjOnC0MzQY6M8Cxdw2bv5CL
 8qaEBtejE2cOnkNWCLg==
X-Proofpoint-GUID: FPZlw_L9I2KdzMJ7EolqP1bPdS2RZ0-5
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae331dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sgnbebFuhaldx4-h5P8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX+D4mOa191G2d
 HOOr2lcDWfvSrxWMjTYN6KtbYs+4S9sOhP1EUllgZs7lAT0DsopOwzAHRfjQgVRoE3hmNc5lEpd
 SXoUTacM9XyanK6u2uVD/7Bs5kbg3Y0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

Hi Atanas,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 10/28/2026 3:23 PM, Atanas Filipov wrote:
> On SM8250 several VFE clocks are fed by one clock source: the AREG
> clocks of the two full VFEs share the fast AHB source, the two VFE Lite
> share one core clock, and all four VFEs share the camera NoC AXI clock.
> Each VFE sets such a clock to its own rate, so the last VFE to power on
> wins and can lower the rate under a VFE that is still running. The CSID
> also sets the VFE core clocks to their lowest level when it powers on
> after the VFE, and nothing sets the camera NoC AXI rate, so the camera
> NoC runs from XO and two concurrent streams stall.
> 
> Two examples on RB5 (QRB5165):
> 
> - VFE0 streams the CSID test pattern and VFE1 then starts an imx577
>   stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
>   at XO (19.2 MHz) and one of the two streams stalls. With the series
>   the VFEs set it to 300 or 400 MHz and both streams complete.
> 
> - VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
>   then starts an imx577 stream that needs 400 MHz. The two share one
>   core clock, so VFE Lite 1 lowers it to 400 MHz under the running VFE
>   Lite 0. With the series the clock stays at 480 MHz until VFE Lite 0
>   stops.
> 
> This series lets the VFE own its clock rates:
> 
> - Patch 1 moves the minimum rate computation out of the VFE clock
>   loops, with no functional change.
> - Patch 2 keeps failing when the pixel rate exceeds the VFE core
>   clock, and clamps the other VFE clocks to their highest listed rate,
>   as the VFE clock rate tables need not have the same number of
>   levels.
> - Patch 3 stops the CSID from setting the VFE core clock rates.
> - Patch 4 sets the VFE clock rates as minimums with
>   clk_set_rate_range(), so that a shared clock runs at the highest
>   minimum of its running VFEs. This applies to all SoCs.
> - Patch 5 lets the VFE set the AREG clock at a fixed 400 MHz.
> - Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
>   lets the VFE set the camera NoC AXI rate.
> 
> The camera NoC AXI clock is also used by drivers outside CAMSS, and how
> to aggregate their requests with the CAMSS one is still being discussed
> on the CAMNOC interconnect series. Patch 6 only covers the CAMSS VFEs
> and fixes the concurrent stall today.
> 
> Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
> pattern generator, on single, concurrent test pattern plus sensor, and
> concurrent dual sensor RDI captures on all four VFEs: all streams
> complete, no shared clock is lowered under a running VFE, and the
> camera NoC AXI clock runs at 300 or 400 MHz while streaming.
> 
> Also tested on the Lemans EVK (SA8775P) with imx577 and the CAMSS TPG,
> on single and concurrent test pattern plus sensor RDI captures on all
> seven IFEs: all streams complete and no shared clock is lowered under
> a running IFE.
> 
> Changes in v4:
> - Keep -EINVAL for the VFE core clock and clamp only the other VFE
>   clocks, without a warning (Bryan O'Donoghue, Loic Poulain)
> - Use clk_set_rate_range() on all SoCs and drop the vfe_clock_ranges
>   flag (Loic Poulain, Bryan O'Donoghue)
> - Add Suggested-by to patch 4 (Bryan O'Donoghue)
> - Drop Reviewed-by from patch 2 due to changes
> 
> Changes in v3:
> - Replace the CAMSS clock domains with clk_set_rate_range() and fold
>   the rate ranges into patch 4 (Bryan O'Donoghue)
> - Fix the VFE AREG clock at 400 MHz (Bryan O'Donoghue)
> - Collect Reviewed-by tags
> 
> Changes in v2:
> - Split the minimum rate computation out of the clock loops into its
>   own patch (Loic Poulain)
> - Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
> - Split the clock grouping from the AREG clock change and add an
>   example to the grouping commit message (Bryan O'Donoghue)
> - Rename the per-clock entries of a clock domain from user to vote
>   (Bryan O'Donoghue)
> 
> Atanas Filipov (6):
>   media: qcom: camss: factor out the VFE minimum clock rate
>   media: qcom: camss: clamp VFE clock rates to the highest level
>   media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
>   media: qcom: camss: share VFE clock sources by the highest rate
>   media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
>   media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 182 +++++++++++-------
>  drivers/media/platform/qcom/camss/camss.c     |  44 ++---
>  2 files changed, 136 insertions(+), 90 deletions(-)
> 
> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab

