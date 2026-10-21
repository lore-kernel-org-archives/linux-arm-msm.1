Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576981;
	b=InVc5PhWyKOcvtEw5Mm6lxOygotpU/AVRDdsH5R4YZq1NjwR56FEH4jLWNfk14kQ1ktm
	 ofgqGobXl93s8FxcbGQPE3QrF5wCaFpSM2SLbBqKGIjfBMjU8WvsOPkDnwtMekansVlL4
	 3+7/hcEDkt0dK7kNX6msVtuPdjOmsJ8UYZcPhket2KmBuc3bfG4rxaNQsq06yfvQ6QzuV
	 iSm6Ybj0EZtEv5+ewwg+4ZZrpjRyqc+LCrVswCRvHcNcRlA4KELlyEcz7Urr/bA6Ip0m0
	 FC/3LyMlARnqXYE+kVXlJnG2uyk+st/1nmZEUXTmVwlMcGH4GF1xBlaI1dkS1B3Hj0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
	b=jvPmJd1z45PV1d2PF4uu9lJCIS/OXiqytQU+TBbC7iYgfNBaqBhVZ8f0XGCey/MMERp4
	 426GHyN7r+KWm0iQriVi72X/jroZsc+0n64Gw+MjXWJWeLZcf7/sfwRkZvHjQks2EFdXe
	 91/ODapaOyDpPwG3Y32/Sp/G4B+HhCi+VbKVUuNQdhWMMBYm02wA5E52sE5mj9enV/xNP
	 I9AldipIkjws4hTpr3aKOHFARgy0S8KMBIYq6VyphXEk2/wxG+Ya+timBT46CMNyjah/t
	 Xj46vfI+MGxxpOiG5msfrcV1NrXrWHV9uW3IVZdAa19EWt226+2hbJ4pnizGf5l3Qxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC0D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j29V756429
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=; b=WvU7kcap9XqJMtST
	USaqpwLUys0DdKOCxbZP88ZmtcjdHlcEpZdmefik4Ek1zq3Thp0cKKuOUhNfvMO4
	vlp33xGWhiQhcwYStNLzhN9pa7I9dT/ze9ArceRHOpcjAvqGtSoFUD+hvVxfIjA8
	pzXWTWZwDjoqF46bMnCDbfjoId/GEvNkMrBmTAcAdtEaG7hsXSOY9x12zgjiA5ln
	8353l454XfmLqbm/DR282rMpDOJ5ymJJLSdTEhceAGA21waUms/7IcdfV1tdFDC4
	glO8HzBCwTXTj4bZektUdKwwfMGn3MVJpc46ipUrh4sXXvOOF8iy5GKy60IqQp95
	ryEswQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ubqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:03:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so17944985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576980; x=1793181780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=h5ILwTqzvKWBy3uFMSdyFHEbq0I7ec0UXAS6ECZ08urWd3x+VUhYcQB2pVwofDKIxd
         8V9BHFWy6YzHblJ2I6bVDaWMsavpUZxWmUtc4iYNkZ6OzCyzh3RK8PnDxfm/B9jIbDKV
         ACOs69hzj/wcWrShAz579nObwUaiY9f7Q7/tJ+hPPimb0vBZpWHSollJsnmtd/FM6MFA
         K8/cbGgI1dcH/Os4wMb+DdHiiP4bEM1IjGkzZCXiQGvsRV5jjPWjHInuW7t74c3IXkwj
         0mXLCsPndmjq5ArCc46mbZZnX6GSZHWZLGX0fCsq01wYYpAgOWUO+d6fTBIamRnaLg0Q
         3U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576980; x=1793181780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=pnYnyeQKLz39zrfNtfygqIEoXLx4KdtLdyf9r/cFkgk1IfjqG0dB5KuCI89dtrbmsO
         ax951ZlUZlJpqrZJAzjmxrI3YQgkL5ck+D1u5pV00p4EtxIy1EDL7ndwRkzZf761N1Vy
         TdWi2gscnOzFgKBnb+ifvwV6Gg/PNBqxfCWA5jB1xHClc8G158vzDezNc+l2StqUyxKo
         lOxZ92GVB6a3v5hrjoaRmnaoHyu1PIIYP7Ba2fqLvnsDYOyghpYchtz+5e6Xaf+xM5e1
         U4ob/DvsgID8ko5GkWnVaGhUK+rrBs/yRcQg0Su1d8HQCukLtCyfjUNV6OfV5LgRS71G
         5TOg==
X-Gm-Message-State: AFq9FYLDc4AR3y09mNS6095JTGaT2gKGZSQuTx7uw5fyOssuy6z+JJHo
	CkdNbcuOtaXKr5ECXeZjEhqb+qpZxcI+3C+zg08coRBKiiqE6NIvY3nB8dkzmbAyDXd212+W5LB
	woaOXypgavgAuCHcMWLx2/T1zuqoLU/LfvoeEa2B2CMgTv2+5YEf+xOaBJtcquJA4yFj4
X-Gm-Gg: AYBFou04sHk5CNEgi2IJWZ4LCEea4GGmkAiz+u+5brA/o+wklSz1mzJvbO2/3E0MbM5
	IQyrpzuJ7/nqB2rvSFmg3XptQwLZhKDW/jsnZrouP3rjVYjqw5yGSxOZG+tDormM03Eh5RpgKwe
	yvltxIAR+Qw264xOFcwKnyId0MpnjeCHb5y45N17d1S+yVaV94mC4i3feUU9CxUQqsxxjLz5KLy
	QF+br+ZdtgElbvEqognyuva0hMoPY8+KQRnTj91OGZieoG5B5ZE5sr3XtEb7K1nzyj/qugKSnxR
	uSjtC1k217L1eNprAbv9lRmwH9voaHTEGgHiiEbXxyU0bdJ+drNfUjEyELjNTycQqfw+Q6cXAiQ
	tjoDRDNlSrvIh5mU4Y7kIKg==
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374434385a.1.1792576979664;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374430785a.1.1792576979215;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679ba8687sm59684266b.11.2026.10.21.03.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:02:58 -0700 (PDT)
Message-ID: <a3293a8a-ee94-4cb9-8cc4-03ce64c1cbff@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:02:56 +0200
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
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lK4EOFAGsemw1PxYgGRwfYvKWQCYIsIf
X-Proofpoint-GUID: lK4EOFAGsemw1PxYgGRwfYvKWQCYIsIf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX5L5nPuDkgdXY
 0P+2+Vs6HFULqBmZooRRCJCCClTNGNzavEpB/d9sT6W+UtvwHeL/RRBq8b4KcPG3V/1SAxAt5G9
 Or+ItpBtB/dZbVgKAJPg4l1JqJa9D3s=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88dd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BbLh709dquJP9IyRttkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX4qYRpS+ht4kS
 7yyiSsHsC3jRWGhRDfuc7EnjpOBenEMbyk8GrdF/bJZY3g0qkLWxIw+MqRJkyjd2Sh8VpXGH89s
 d61USQ1x0y9/55jDlf4IFvlFyqQXPeM3ewiw4HS/fZ6jnmWHfe+5RT+5bkT7ZOz/289tcB2c2by
 0KQXb8ejWKt96qIOmXwv564g4pYX7KQmqHC6r2Ju0htdevtW3mUeKWpDTBi2Rua/5Z3jW0zBtWE
 c3KhuUeLcAaMpPhgN565HbGeBXK9segZdZxCkpsgvWv5+TALMr3rx+LnOGmFlis1CdE/6dwaEfc
 w9d+gsYCaSiQ3ghVsfJs8JJ5ABrNBc6G+KdUQg/1i/AURoSexD6CMmma1KX4ALWvUen/qolcjpk
 WDG2twkOQzr6h0GD8t3lRGcr1gKxlU+HYlLkQGmc0i4E/nqXrUGugoT8GYT0tfuEQIL7zPyJTe+
 BMceCdHT//jNLJopycA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/2/26 3:55 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
