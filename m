Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573851;
	b=NvFWzzDjyFX9bJHbhaZ4Fh+IYIu+6sTjZop999BTNb7bOjZ7qsC+wyQYpNOmBiS288Zm
	 GBJaJqg1WRfz6Nla5LKOjYHUoLTaRDC5guJP3CsnN1O2vDBTsWyTf0kpdTRQ1Ksq/harT
	 wK7peVNsy1Xpro+QEU4ndeWZNa0r9EWcQp6fy0XCPS0Lg7vSh/tWVTRbvLUR3XrlPwVeB
	 2R5vVAPBe+aBmNRc4VFFwZsK6sX94FCGM/x1DE7EABceKiQTuwV9CbrnY2FFD68cNmONV
	 s2FK6df0QOWa2MOYpcoTBewgGyDZcQiXEpjNmn+2FXVRUs3xUuVUjqREPg/y93IRr1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
	b=lQj8ttZo49QTo9CQdyYXV7gwrW3/mmcNX4fkND4YW1Ssb0K2+uKjSf/9HxU8Mz/viImY
	 XF/Zj9p/C+toAL8wUoaJe44ulaBeJTT/1EH1Sg6hq4OjZAZm8xiooaI3OxEgFP/JgEOfd
	 3ZSImqCXDxfb/OqJ94voKmspRO+VsIclNp6cLLRCwuJSDAYXRKQBiD3cJu1Ei+lpxBS6A
	 3BkYBo0dG8grLXbUmB6oiGEsHcTTyBPcALe+VYWcDy0EAGWizYKkBKvcN7DXpeKfKHGHT
	 ALxcvvfABWLxG1itfi27FRXiVQ357M++qgaXoL46smgGo2p/sD4zO1BXKBBITcUX4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDMCEaBs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1F606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB1F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiF2H0On;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDMCEaBs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VRxi2795036
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6puuBI2ATZ/1hU0RMS24Pbs
	5fMXMv853wpEmKEbFSI=; b=OiF2H0OnLtVMFT2JYGZ0lp+VhxtsdXfI0ZS2tpNO
	6pxEI/ocEWQKgUj9DItROwzCGDh9+pxp8Hd7A15K/JVV7lxme7Zpqpq/rhwOhSei
	HFW/eBOkZpyRzblEK5s4haxyyABfXvVw3bScOsGsMtkZsdaOqpeT+8rIatNfQ2xE
	LAIY6oUfylQJYY8ocz5DVTmHG+Crcbwpg+sxZe2nmk2OUA8U5BG8qkOWaPtUqJSY
	L9PfZ6rh0vsVs+EYHojDG2B1DpxpGwOoZM0+Qey8WAf7RiOEAvhGnIGySKZHs/Gi
	OYtTCIZYz1mgUo7N57Ih9Ye9i4u4A7/kfmIhwt0LPjUCuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78a68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:10:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so89039785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573846; x=1793178646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=hDMCEaBsk/BPKodV8aRmU2pM9uvzXW5Jz0WeYWVUFVIyzBqS+WJWcf72dicW4LNkKm
         cSxPVN1EV0tjP5V5stCGXYXQkThxn5DoirohAu/gvxcXiTJUpRE6FA2zYY8Jy89RB49N
         L0C+R+wRxUVUr02Cn7MmflYY8QBq3JwUvNlYxjNY498wLKS+DrzHpTQoF8APdSn/cEA9
         1RuXWCARfG33d50vAAKt3bGoBPRYX4ZEPoOpdw3rsIduv4SeHdm+4kiV5rG3pa4Zalw6
         w2Itc7U6NSTRT8ZD5Q2eVvOWzIkh5M/v0soQ2HMdgc97KTI0cJYrRZRh5ehwwMDsNnr9
         VSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573846; x=1793178646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6puuBI2ATZ/1hU0RMS24Pbs5fMXMv853wpEmKEbFSI=;
        b=In+2lfrd84psgG6/HrdAqfoEjb9GHQZm3Kfnkm8O5ZRmRZv0CyWBLYSekUfK+AK0oe
         gYgmZMLkcHdJbBR9S6W3inVjiwVUgrMnQujqhznWkKW2kD0hPFNgHt0roZvSQhFpPWkx
         45AQgkKw5WaD38rfE/rHF1SNLgS+DdLYX/pV72WA/tTPJp2boa98FT3j5rAjMbCiBTdM
         iDgn18gwgnV914tQDhJyqu+9+H/pcskx0uQ+yed16Ii8AebDizzLVCc9DEmr2HwzrezY
         s0XK3+iXpAMNB2UTZnefzclLd09DX80cB65ljeGg88OxZE20VlLPjMjH1EOAh1CzVnDa
         j/dA==
X-Forwarded-Encrypted: i=1; AKwUvBz2TiKaS1tmXTVypEBZx1DRzt+nrysVL9Dj9YHsoLF1SG6wF0h5l4p9eNFofefLjCXUP850DC7WnRovsDta@vger.kernel.org
X-Gm-Message-State: AFq9FYKgC5GeM1YFhvT7VDWAaR2LpipwLtDVzndbS+5uhTrjgtZHzG5r
	GAqMPlvUEk36JkMVIdYl5Yy6j+9RaJT7dNJxu84HtuqfQ35cb0J0BbUjsCbiGs/KjcO7rttr9Tl
	T4mnKBw99FsgHWeRJgDWbxrhMFk0aQzIrLsk3mNSjel7Kt2W9sBYbPYSXW6fCfU0XiyeV
X-Gm-Gg: AYBFou0Bk6hgIPhz8/oRlH8VZ4NrgQbZx3pZTMo14BBjXgb7EZw9A8jduHHdQWj1/rn
	G4hr7zzOzbAfOYCxcqEpTIy9txhVwcRHtnIWpltjo4d+/mE9IG+PLv+oQ7ajgQNH2R4Bhdy8z71
	7mXtdWuuiENepVB8+ccLEwiRvVA7/VkHBD9x2xik4b7QzlGSGVVYqAMxTxmEh4Hl56AMHn3dsQq
	zAikroJELAnS2dMPpAds3jFJxDETAt8dizFjoH5EUq5w21NOKeI9AQLbyUPD6FYCW01MqFD/2bP
	XWNdcRNXqgYdjXNUiDabNAUt4FEIb7l/H54hWP4v9tSQDmfArz55t6kx0PaSFWevOaeW/4n7zEr
	N4tm3o7MAiqeli4zs
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317713585a.3.1792573846362;
        Wed, 21 Oct 2026 02:10:46 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:2658:7e54 with SMTP id af79cd13be357-93f57f06332mr317710585a.3.1792573845821;
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm4195689f8f.59.2026.10.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:10:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
Message-ID: <3j6nufnupwtmqsf6jwbwgcpdyklw4yja4jdxsbz5eitjgooclb@rpngddb3zcvy>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: WUgw_2FJ6IaUMS1eHpRmYk4I1sL9p9k5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyXkALtL/C4qx
 BuJHfAab82P9/dVADWsxB24p6jct+Zu6H3kZQquN+3jKtf4eB2ebQA2QgMaN7cd0Ma8SI6mmmkP
 BTlF8dGSt65qiLnPIEkJtsxn9aGIMuffMJdYZSqld2FBHLZaCjD45e5Qg1iNs/U+1mt7uor2Bmp
 4if2ogDioaUElxar6fZrplOXA12WmOGw5Ww5Vu4bH7Pn4FXlcf5YsXAxDNc0+bDUf4YvuJcrBuk
 hVuM707dPXbOjoUHLwmWdMA+6dXQ1zDjNb/kIcIGvRF3I021czUHTvEEkjLz5wXKKSaTTRpt5lv
 5pTm8WcKQHVkB9YOjoWb1Hw0aTPxIZfwQRpf2nTsVR2DbLCrI12Pdo5cLc6dSyzseEUI2ZL7D4O
 Buw+Fm15P/PyhHE/kJhPymV8dzMOKyi1y2ThB6solqVrn9yFrMXMmHFyycwHYPt5fU5wcbdCL+J
 uuEJJjgA+4bZ7y3uygQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX2lQ8I8i1i2Hs
 93AbPmdOZWC7jbdRa46KrnkenHPqON88OtFbBACeAONBcZv7612OH8CGosR/rO1qTHzYZw0lvWw
 8dmh4roQqrFX8sZnsnE5d2xBw874yFk=
X-Proofpoint-ORIG-GUID: WUgw_2FJ6IaUMS1eHpRmYk4I1sL9p9k5
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8819a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_V8OVpiSj6jlPu8_cr8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

On 26-10-21 15:36:30, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along

Nord 

> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With the comment above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
