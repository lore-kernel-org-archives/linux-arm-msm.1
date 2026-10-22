Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656422;
	b=fc4dSY7uuNLXKNWNCMOjNvCucuIjjRwQz2Dfr53WxgyTSjaOX7ioQG3zYylb0McqlXl+
	 oWA2HW6Lg0WDKPnrQzHaptwbazaA4iZmfzMADp+AufACjfSe0m4FKINywxscJ6h+rNWtW
	 riHh+hvZ2zWpMQVU/EiqF9U/SVrnLDLsTrB+042Sn2YdXveJY8EfFThPTAf0SaJ2Vc1Ux
	 An2fzoDfWyTJpXVh5h95sXxB0u5zPCBPZ3AoS+3yNoUyKVx29jjiqHXLUh4l9d5WkDdKA
	 bc4fsEyHaR4sQbe8/Pphz2mEoubLOA9XGWqe3oS7gNHqs/6z6xwj2r+/CZ+SOvH7frg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
	b=ix5lsFfupC1Hnl1D8qHWs7nhEoGAhtH7eylw9cRKRz6tWZAdCVYBfa/yUv3D5Te8FGuj
	 HtftLHPqK0AsOreg5tSZchN4nutwgH1K48TBuYkpGBgwmP4OCEsteFFWLTWXuDXBmt4Tr
	 tgfCZq9kUQ4wtRGPlF8lZnmdjZVOeM8rMHnCbMf+bPuJIvlsbe1AWq2Q/P0cT0vwCaAwm
	 SDDQzo/RH1QhUzHhU5o0vnmacZj1A26KcoaF+6szsvVJUflDOU/884IPxoh523cSfDQuz
	 hwzoyVdeazELa69rFw+ktoWilqCnNAChsV/FBL2UKhUtXViECv0oA23RMDQaOgxEVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KSoBzz/v";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D8606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KSoBzz/v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xvIP1560115
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=; b=KSoBzz/vOnEAcmUR
	NE6MOuz4yfbn8o0Cg0oqrDxDbFHNIf47o9B19dlfrRAtxJF0Cj2afROVAAlXLC3Q
	Edl+nwOeTVEm+h+0YuZgEk+TnJVp/jSthZwtSR+VRHbw2l7/MRJEMg3YC59U2nlC
	9xLyJ68E0sLepg7YeeIggd3O9+zQeFEqLu1sytKEwW5nGw7p5/Bqwub9MHynFBvT
	yjczSTOAvx5krExocE4+DjrOS42RRJOpZpr63xMCGS6dB11mSid32pLt2bNgg0Ag
	UGP82t2ubSDBY/gGGnXp/sWuznB4vn2n2AS7rKs7j5yDOCCcmaGmMd0oing/kaIG
	QVzd9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so45213085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656421; x=1793261221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=DVQNk9ic6Flw/hmULVWsSbjiJqhBL3zTrNt8pJnrM4pqWJb5JcfPbIxkdWGx/AyxIB
         X+zaEOWTpESuZnaA42a6or79U3OQMTRI74xYnR0eDxhWixFvgRbC4Zl50y3YZU0odiNl
         VhNM5CxNp8ldKe/Gw9XzNyyjSFWo/AqA6Renj1p50s10SfLvtyxWwUX4eeNogHqRTP28
         69MKKStFWNqgr80Hx1Yzamrt2vAtvi/QhJr+F28u4Zgbq0X5KAqBYy8EQuIjR6QhaZeD
         jKSR73KSOKGHR+Z9eEUPOUBmtTgmDFOUaK7bFIQUWMCXjf3qSpQOnL80cy5ee/Tu877r
         fvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656421; x=1793261221;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=ls/qB2/ie4bPvq5bY1ptVPHLtUfG9soLLAiFe9J4AZLGVwkIgx1gv01bV8aFY5ftcK
         hM1ssFvsQwy1NnyK693rQppwXI81bVZF4JtPKXXg9VW0HRrOpxh2FHNdnrYL+0ztTDn6
         XmJhlSy4vHA6ldcDOVv2rkISLO/MJK6mQHmR89S7QSwElw7iMUAond5pRMxWKKK9zE+F
         tf5QgDnQLvDsbEncJaMpf3AxChAHqSBVC4014lhqgFw0B3FHxD/OE7rJxZgcZyEIyZ1e
         RPawJ/+Bh6oSa3gzaJe0MX2NRfQsY3YjE6PyDdL9nSyE98/IpiRyh+DvMytdadqY4u6s
         j0zQ==
X-Gm-Message-State: AFq9FYLpDc9uQct4iNP5avD7P7YIQb3WqqrvR8RF/eRvFC85z0XaSj+3
	ymi/9HrMH5aKTZ+BwBRVDg0xw0zY6tRrW4T9OYfimAFmqguhLlk+VMhvi2VneJKHs4iUfLs+WmL
	0SI2x6Tb+pMvPJb4c8gvyYmmu3qmEb919r24aj9IOnvkKAb7RzrWZLAlffudvNJL6SeUq
X-Gm-Gg: AYBFou1vmjfMWKUiNpG6PwY/XwwLil/RzKeWX4PVT7JV9CkZpkRdocsc+W/HYbein0Z
	eH/RFqXEg2W2+D5kNK0QIzgGRzJfezM8PNJYecT3rmvezr3dql+wOVf94LwGyJ9pfVjjbAw8TiS
	ryIIlZPbta8SsVWfT3ciu+L0rLRKOeolTOXBhuLqLB+SNRsrNpinCdOwbigWwWYru4JTKfZQnha
	hgEYYc1xfOOZinnZqDMLDO4kAe9ys3aKtyoag6ZQpwE3E0JcTNzMk4/eBFok+fed+B/ucJfrtKk
	mQknqfkL/vAgQ23lok3NWTuZhVYl84k/BLuxOLUg/X7SNW1rP0RIYeMbNjMc1fzvcyVEQEMLxUA
	undbX+Wph24jPNDMV4cUjow==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969074685a.2.1792656420694;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969070485a.2.1792656420159;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm77789966b.20.2026.10.22.01.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:58 -0700 (PDT)
Message-ID: <1064a495-cec7-4a0e-a007-3b434576ebe0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:56 +0200
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/o+6iq9qf4yG
 xXhyGazAB/VGToWrcAw0XmER5qQ55J30LvM+pHXJph0PknePpAqTTZTbVPLKO1PEktWXVSbxUm0
 kmI3ICqliHHtfGyX0w8Pqi1BtA+aEe7/apYaemO48djR25xEY3bK890vlFPAmYPm7CSvodz3rPU
 ot0o/1RWFyVf2kNDA8a+AoI5bT2D1wrRRkBgiHSB983xEWdmxm5BzsLK1cWlNFj8ZGpQh22Mi/j
 IoKy4eyIs7ymPUL7RQbnjwoIOBOn9krQWSNDFBkGBtvJ2JEy13QwEqKOd2eqFScipdtqByaDuCw
 Rgjcn4jauzf2aJoSj9+m4sJc54QzPeFNEKfL0aZ3tJgnKs+hmsaomptvGZlpnkDR5Vwudlffz7b
 zcNcsNY6AtCM5aLp9LLvGaF/uHxeXUVLOcvLSX792pG2EziHUCMRNKL2aXYSHF2E51RXE32Y97S
 4fOOJ81AlLfawIaCunA==
X-Proofpoint-GUID: aBEZYlJ6WPoYzR0S2byEVbHOuhB4OStU
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c425 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aBEZYlJ6WPoYzR0S2byEVbHOuhB4OStU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX5NXQaRoAnHMF
 ytCg6p9yrKu8U7ozeCgJeS5ataN1/JOeH6QM5MUzO0Y4+hyj82sQg/+i6CtjFDnjVOK3C5Yf3UO
 RnZMFwcSg6u20qVlpfPi8dgBuohvxn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
> DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON, for enabling this 22pin connector.
> 
> Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
> panel power, reset and backlight, and the Goodix GT9271 touch
> controller.
> 
> Disable the default HDMI bridge and connector in favour of the
> Waveshare DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
