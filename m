Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656444;
	b=00OUPjUC+tMF12UHKf9AtbG0mPGST8orcf4oXrhhFpoqyCfwAqaDaTmmLBfnqkx4ccgX
	 kjMfjlb6CluPhB8rP9iNbWHhJSmNip6FYRpEIpDthkJAV4GODZXsvt6DqMbg4NepDIcAH
	 VpkqUcUjPYA0T2hIEZS1JRhryILU69PA/oDv71J4FqXGkd/EXRUZdTxKrHz8IdQ88HkwU
	 UdRz8fw4kiM+owAaG+OtC4XtRot3NAx48ez/WiW5YhsBY7JYqHhrvjcZdjG/AjQb21pUh
	 VO39JpabFYtp437Zi/2I8TgOxMupS8g42YY1fRLzGXQ+HgkIs0uR8pREH4yNK+MG1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
	b=oNbfRZjiyaftO5iy+GB7PpUrsd40ziDfFP7acg05H0zSyfcAQiFpveckRthGT4heTft4
	 /GmdD4o3XRNTyQMCpoldZuCtP+sW5KzJpzE2ABAmfr2zb6YHUI2NPVGJLy1E1HJ2YhxIu
	 iNSBmrlm3jhA/YSSa1kZTZDS3/NDFHbRXof/V0PEIHrD6h3js9Q+Z0+3WqEcCkzSlIzya
	 rtX0/rAPzYn9aidyQwcAX7x9Kj38rFkqD9ArBqUZYtXhDMbQZNk+FQ6biVmJQYK4mOg1I
	 51jcCY5EtNfcriaAh3vd7CSDwfmd2ivPXTOqeJPRGeB5qOe0gPbZ1HtikK/Elqo6SXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744C606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E744C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJKWMTOV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7048m4110612
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=; b=JC+Id0HGcxwKpJD1
	ibh6qFVHKM9dmBjD65sOixx5xw554XLDnLtPjxnCKc+ShzclOWADpNIJG49iLWBY
	quC+72LO3omfkHpfHAHLHKv8pqZ758X3SJRAk0ccIM5AiS7ILJ9ptmSc88ztAzwt
	FtprcO4sGLGSdD1Ru5WtvqMzq7iks1uRitRccIpXHC9rtA+3XlwSZT3ETuY1kpVM
	LI/t/zOI+TXbmkQx3FhLQcNszGJ7NiYkcwmUYRvVVKo1noX1/cU/Soo29zTuDoSy
	vnD0+CBRANW4lTn5j7rdimZMClXa4ef3AazXwbhlLeXj7qw+DnHATqeSIlnGKFhR
	wcWDmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:07:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso21085285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656442; x=1793261242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=jJKWMTOVV3nF8upLCwyMBKBIDjk//0MvGPDAY1PVugNgL/kYMtTo7ynrvF3slv1kRt
         z+MvaiALYzVzIjTQ8N5Ci1FlLgAvxwk5mj7qByKTQHvYjSu74C70a4oUcn+1d9KB+5+K
         aDaLuCakiqKd8cT99gGji/aGSQbtfHkDRJpRjzK9BbZjyBWTKEnE9zZMsgsLMH3jzMHa
         sf2HOzm8/2DQPVyYusYiwoEKEmJNHQ8egrqtzdAmvWjejsWQN3TQ2jZhMesXmvl9FbZ6
         XLWVEvgJNTpvNlLw3OR48LAhigSj/tMs+OL6fPRDLurhdOgQU6vz5yjGKoig82/8Q/mg
         iwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656442; x=1793261242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=VCLBYdF/c7f8gQiulWzxec+id+uZKwRY8rbAGQtzrEbRU9jfblD4mDhXtijUJErW4w
         By96fmu9BLO+OQdgq7bL7tVlCJsNmf/0ZuvPkllbbAJywIqUCUpX0JHthAuWLKDfm6IK
         kTUG27zJig8tWWPS6Njy2o1ew5bBlG16JZ4KNU0dyB/8Kpcy14rSDlpVi98whpkEKvPP
         Gg5mzxipV09q0IswuJlJ1NNFyQSN3AKuoqp1m3RVeFDpjFP7Gg8pzblguR21FEEYUV7A
         EgxTr6YUJPErLDPuW6kGC/uuZXWb/Pdq5GqWaYyuY5ieqLdFLhhznIXrQM6eWMRETAxh
         kXlA==
X-Gm-Message-State: AFq9FYJIUaELV6Yp+IXWo7Gk9SpLt4ZxE1p1gERb5k6nfWAVceVbViDc
	yh+1lQBt5u/e6D+5UfBHqZSrv57Ub4w/TgCXNy5+xCCRWAuHcZ5SsUZdOUzhMTPzP6l4Yhy99EY
	E9yq+HkxbUyGTjbEVTpsP0pW44d/8XlsJ7c3yhj4KMAgynuN0CmvWtiYXwpwuwQLL51eL
X-Gm-Gg: AYBFou387nkUELLS1g/KUXt1a0gzxihm03DrW9OEdPEUUBsjOnkt0Xr9xUsh8CHzRQI
	inCVPccHW62SMD0IMcs+2aHVp0vdfI5gkrnG8Ex9pNMQGDmVcWSR7Wtnco1jCx2lakXdZWGAVcM
	y6qp5Wtsu387DMKhB1EOBu245b9VYaWxyp1jQxEpgRx+eWzJCtutGr0u5dkSUfrEJvftXcoNYhl
	hbNEW3WIXKSxDFFFX2B1toOEYOZewiu5r4c2+zasAu1wQA4Amr+wjSCMbQSM74pQZCCRfxmdt0T
	JTVJhD6ihuFWXnsVLx5NgEPpdLXBvA0aMj9PUJKX+1+83GXRmorepweM1A5doXT9p8MP4RS2Z7B
	sHlMa12Ji9WQDMRkDxlFKzg==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008990485a.1.1792656442380;
        Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008985485a.1.1792656441987;
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1627775a12.13.2026.10.22.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Message-ID: <52029ffa-1bd5-4243-9550-85cb00bde8c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:07:17 +0200
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX+0wXdCwN3vzs
 wdCtgGST2qK7bULt4xit/dbcXj4MFC71u5uh1K+5goDeImQL+CeJ9mqcks7U+60Pfd1U/xZk2Qz
 j9mQLHk1LCsuWSI4mCdrUL4yKUDhTd++iDco/q8idll0udK2azERCfq2jhstZ0+bdTyHJ4bwzlq
 nf9Npoq+sfbwAt8FavD/tavaE0JAGlVjMWzkbjkQWJg+qw7ptzsIlT9dRPxQcdiqO5LcnVIWeH1
 jEuabDHSxhsmPtuEuV6HoqB2kuxHxWi+NIgigzO1fPNN7lDK2I+s7YNVwYiGaz0tF4uJZVbfo2i
 aFta9GCFIaJ6QVF6s2/YMVT/OfMe5shOz4TmrJUHGzGoe59pn1xEWm/ghXAA4xFrbWydXGgXtrC
 TJa46rl+H5S42muble4LIblshLGPJPfuGGbjlw+xEv5EUELN/sukYVUc+giqOn7HRmdjZ6MxD5v
 bulITG8GNAIiaEdawTQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c43b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jboVpbf-MrRR0o0IvX0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j2ds12942_ulGI06iY_8bZH2YiZzwHYM
X-Proofpoint-GUID: j2ds12942_ulGI06iY_8bZH2YiZzwHYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6ZwjH+8+jCcl
 Nh4qT7xCKOdNE8DPyjLGlrenExjOOLkxuAhAYIxPy4TFHVmw7oeaCNtD0Aq1iUo3oTZGCfL2ASj
 7TZAhByFadCAXDaXPkYJmtQ0NUzZOl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, Anand Tiwari wrote:
> Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
> LVDS daughter card is connected to DSI0_B2B on carrier card.
> 
> There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
> connected through I2C5 with reset and interrupt connected to
> GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
> using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
> GPIO on TLMM GPIO2.
> 
> Disable the default HDMI bridge and connector in favour of the LVDS
> panel.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
