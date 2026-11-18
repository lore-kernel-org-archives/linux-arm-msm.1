Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027846;
	b=MgGGlOyXqW5TLtIWhTm/Aj+upQ1eWmb+Ui2V4UGrK/ss5qBFcrgSKVLt889zcG5OWWn6
	 mwN3wNKMayMvKVAic5m4Ln8a9ztei/WHj/Lb9FKnGJ5NkCt4MJtKtoC1BP8whQK+p8msE
	 7v9/bDZoxEWZurQdugO8I7Yj5Zlw+GIaf8iXdkQRDlwVtwml9cjUA7yLwXL73nUtkuXB7
	 OGbutfYv8ri7YCftVSvFPQpplsBFtIPolR0g7d+Pi9/d+GfysxOWhZLxOuR70GSQG3cht
	 CdfQ0QT9C1Yr75PUWvMjoiwLMkQMdaS6CitKjacgtccFhQCAslAx7+A1rDuLS/MkuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
	b=3F92zbOVZGZJ22mR9FlOhhZTQ04CEj3Twub4YZznqQR+RT7+sZli62I3WenTb0M26dAP
	 FqkgWjIniHcy+xJECpens77fGfL2z1b0eg1hjVQZqbVCf5d17DVr20BgyRoGpxUYoF7sr
	 mcSIuLG1VS09sTJQ+MfkPogD2xaaRzgvygCY8q8sebh6ebZHX4SfvRTVK8Re/+Yr0xrHD
	 2BbS83njDOAJnuTjbZzNY/hMw3msUxPFuvmBujnjXFHf6ID+g526LMSNI5vRMpZ6aqhqN
	 P7xOdjRWIVLeNTEo2gHtO6jZbGB5zxxWB4fhkbuli2t1WR9ljWN3CeBOyWzP2xH1/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3367606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3367606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHsP0uPW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MmTpeerB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGJ99240622
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=; b=iHsP0uPWNbZEl11k
	Q8Uuy0Ax70dRrgth9uQGkV9jWJCgNxJu9cKOmwRTbNJ+trEEMyMZextqDFnJkNCQ
	e9q1XghSK+7klBiQJvmB06OdHje5QRvR2J0hjMQlj8QgNQ9nosh9PV0YsmBpcA28
	0DpAHl4B/EhHU9XJUITKSdpZzktgBCPXflWFetqvKUnhoKdUZ8bmCAOI5qsr2fyy
	KuCwgX4DEYttanATHwSeMp4bL7LmzAbk3vsFY1aaI4hm50MArsxWoqSWmFQDMbEE
	K5nITVOPH93HT8ElbuFzXit7+26i+hjFvLlrO+295XTqZbGhvsQHLedkExmialxs
	R0bEUw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3krfyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:50:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3b74351a4so1389438a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027843; x=1795632643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=MmTpeerBx3ZM5y7+v0at/sAF7oavwOpRJD/PxgLjHXPCfCJm2zXoSVm0wWxn4rT8rJ
         OnpTGgL7lPPdqqeWDRfko9ohvnNXj5PXLeNV4BywFOZ2tzWtlgxc4ov9/vRHcfTLErb5
         egCWLaNbKhhkZBMaXE3InpTQSEvD2ZNwtFnl87VMeJnDQ0e3jgntyNXaQUHC1GIgfUUu
         dX1cspyYBWwzyOvMIYo/WI/UzTsZYue8ang1qDxi8IR/VZiPtVzOGmcfbzkI4bP2xoiY
         F26LfFTkHiC4e7sFfBC4VPSuGIxAD+pzG6ZozCzONLVgBZTsCyu7FFzufokm45K9DtH0
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027843; x=1795632643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6fSMtRefayhZI5g3aR9XsfohDmCy0PJvzpqSftD5bQ=;
        b=v0lAjEi4Xd0m/FMH7I3BS0jKQzgMBuGh0DWqkjfv6jVy+LjCUiPEawqrGhDabMslb0
         9Pgyor1YhZX22exC4S/0QA9LUB6dIysLHFp+Bt8azidypq/1KtVgMTz0SypujKJC05eU
         ZaUhVeUbeAPY0v6pzP9pY37LE3Rue7RfZPvYXKAwUucFIGDsD45oa/XwGcGoMYBw9i0M
         ciDfgxYIabArxFBTpeMm1p+4wj+Xb7EMA31pgC+QLUwv5KlqpDlpdb11Ov3zr4BBTO2+
         DN3H6QyYGCQaPmVmb7neR6pJ/yBf5Ap+28MqrBPR+3+P/4kLHjd3aCMWJIIk/b4TYNde
         Ur2A==
X-Gm-Message-State: APuU4Z9SfJERZy7esvyIWDEBxjpJIeIhRHIFvUoXk0Vrx8l8VOpjIk+Z
	lIzkCiNoO4Lek2dPoG9hvkeTMBoxZtBbKjA9T0DC2CPFWEKfsxrY8LCgKdvIo6T4XLtlMXMldve
	WUngCpO0U9HMhtmF7geN0lFtnD59aKpfYKWDLtJjHPR7fp4tCrisBSaZ5NxEy1/hw4Lj4
X-Gm-Gg: AZFdTZfYFZjaMZGRLk+ZS96+n5w8ze32Sf+Htt9aZTQZ8wvvJsZZ9GYsmIAWDwBM50v
	3nZxkfANd9Lz6pn3nqg9HZxbBNQ37WKjHY3ud06awV2cvKRfDEUjZKl8zCno+jpZi5P4o5Lgj2M
	Ffi1qEIIe1c7Hx//eJugd7DSisoL3lJ+NpbdBIGNdu/jC+Alk1PthD86uCLdP0hy1gPvmlq+dTd
	A8chXNAJu5BmNdSYAVv4+cm8TsHt9P9GmNPS8hXJv43Rl2qVozOVwo5YPhn+xGrD6RVBZsZSVMy
	TY89bwy8bkMRG7jkofbDXmngc4tYl5ezKEtSs4XsozoUgZWbmXK8yApjclyujkS3bpnxeH8MldP
	grK+nbp//o6/Xv5epIxa/IvyAEcPt4ZcRuk5BcPR422MsYYBwiF4XIb/M09iBT1gbHGCp0zKWZg
	==
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522903a91.10.1795027842653;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
X-Received: by 2002:a17:90a:fc50:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b3d07598f0mr3522890a91.10.1795027842199;
        Wed, 18 Nov 2026 10:50:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6bbe469sm469942a91.11.2026.11.18.10.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:50:41 -0800 (PST)
Message-ID: <3b9e65b1-2b7e-4310-924f-ca190a0ce91d@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:20:33 +0530
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX65/mLTrIumYf
 IhfjL4Lo0nuv2tNxy86/AMYX4+U0GgRVx0KBcSqZVaiWGEVTZJY5bGfITeGlcgykd9R1zt0Djvx
 JkhMAoyVsAukUQgG42Te4pzMJsE2sqdoG2xvD5trz0YAbisqcna8p7QYsxpukmNfkBpz6oxFvqo
 gEspIVoViSXOlqJ7VSG3LgKQ94sojmQJfuB/WXndLFj/DVWuo0wTGupoBNKECK2tCa+ITQdgdQZ
 NqPK7Uao2OzIxAaj90DeD9ez20BQwRME5j6w2uPy8c3g8Ie+UuNytOmNFdu2q70U/zFUcpq+js3
 TCBo2229ghoLCsWTwcSQhf4y3b+Kj98r6+8XSSBgVmXPYrcmwrIfEPiC/MmJuRED7cKbxFN32lE
 FUY+WcLFjGWhaypkcUKPwBggbUYsSWfBbFlp1MCWep4VeZi+WIb1Q2ARH8YPOiSm6RYwHwdd9RV
 W+n3kZooTjkLPtVOKsg==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afdf383 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX3kBuFTjgQ9gZ
 JtCH1u3Bq5s7zkL2zYWmrqRtmGjwg9t4NMQSvJMjqycYvCBBb+adah+epHdJV3axWTgGWvZhrDd
 SfleCAl/RzC9imjmIdjytxS8Q8vhdRo=
X-Proofpoint-ORIG-GUID: f2Uw-AgbzZL59T19BC7zFlVWAeqgLOYw
X-Proofpoint-GUID: f2Uw-AgbzZL59T19BC7zFlVWAeqgLOYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..ebbe5e23d173 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
>  			compatible = "qcom,adreno-07000400", "qcom,adreno";
>  			reg = <0x0 0x05900000 0x0 0x40000>,
>  			      <0x0 0x0599e000 0x0 0x1000>,
> -			      <0x0 0x05961000 0x0 0x800>;
> +			      <0x0 0x05961000 0x0 0x800>,
> +			      <0x0 0x05960000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> 

