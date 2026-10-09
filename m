Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C934C547055
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520011; cv=none; b=Q1eaqBGFI7MXOgxnOQpFhMRN8xwuve1uXbEc0VHDesXzqP2hscXgZSiavAychEm7JlAynylXtU9SLYF1Xoh1TcbKyQ7R4R2r1tlStKDiesnI08gDrAZdMeiIiyCfnUTpvv6X0mSHTCNri2ju+4SoBH9lzPtxTBgzioTGDQVg8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520011; c=relaxed/simple;
	bh=iHO4b/uaO+gCN+zq2Bsard44BMW+7Do4OTbQ9oIW7i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ypr4UXEiYmg6rpl845CF54tiJVof/D6SIVZsngo5RNPwkdkH0ovl2BaY5MBn2tu/wCFAA3ILJvu3+7RyVvKM8qgZpIFK7/D+DHidpcoWHTqLZRlrUVKWPZWd+Qnp/ZTicwEXbRqG1nT3tf58hPDcul8NIpHS7WoW2lkiszPcJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdAWzzNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsKQCCz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdAWzzNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsKQCCz1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HDvD1712618
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=; b=gdAWzzNtcPZmV0a7
	bwfl5SBDpVIKI31yt36Xq8zLvBJ6/ZqQlFIcx6tXZ/YkYB1jsefLVLld/yHY4aUD
	bP9rz6z2Lu4w1R3dVWIJF0h2XTAxkWL1hw7Wpg+bzVuG5ryn5bDDAgDJjg1kjAOX
	1UPKTXMAMC267AkfyAIYOuzxxcOIjPJ7O+lgRVzEfdGYdBc4YJraco7M1352DwHz
	vYS4xzRLuvDmEYc26bQVyeGYrzY1dcPzzjMDE+5XtulzlyxbTWRmFtvo0KZX1SGg
	rzcRKhBA0yfuHsa1aV6je06BvcFwudenyI4lNtbthjSGvRKnGOouU9een+Grd3Bm
	Mg83lA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw9vbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:26:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so6969537eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791520008; x=1792124808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=;
        b=WsKQCCz1VFspcB9bXA+4WK5tiRnwkIc9ZLoA0l06DeBCeg+2HEON1qIuqvbSV+TC26
         zDCZmHIV9Fxzt+JIX1wu47J1vicf4tD37E1uSeleh+JtHRte99C7jhaAHj3/xpAJUfAc
         /Yw5+hb16mkoevDaUkPUYIt9gV7+ufQORL37BMxrfmmMlF61a83cfeWL18Yoty+EJttN
         eMvtDTlXjPRP/er2idAChSJYTWDwMhdJI47Dh8sluB7KgL88hLTEEhndS6Z7UKre2BRh
         fVsA1oLQXDdpfLnEgJcKnMN+de/lPyEwXBkU2m2K+i7syVfXE7EdGmTPphk+2mGWNi8Q
         XqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520008; x=1792124808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=;
        b=xquU2qvTRjjWih/7om4Mmy0TN3SVwmVhMTD+iTaGQGDl07ZpjP7M7nlzlY9GGMdK/e
         C0ji479+moBwMu/itzbl6/TFtNPSWHJw+5K4gwYSbdApGWar9iSZtOqL3CnGSXOYrYxM
         VjwFpG3jx/VBQq3yw0kulIxnpD32DXnxIML3wYUw0cnkGExVqq7b2+ozgAA9CQwwoEuY
         ne1xworPASsarOTp/LiS54Mzsg3wMIDWsDRoUSugdLBe5/DzTZMNcdI+gUyk1QhASqmT
         eiKOdloMj6x6PpxmNlN5cooif2+k+8zHAQE/pAlcLxjsfzxic3+PIDTICD3G+2hU34kF
         HF3A==
X-Forwarded-Encrypted: i=1; AKwUvBx5slDVlo24569iQp7ze6fUrCRMGXMgHPDF+H4KzZyiV9g2GnG0Xoyy8FX1bwW73CIC+Lok3lQj3KAr/vtj@vger.kernel.org
X-Gm-Message-State: AFuF++mj98vOEH+oLXlDKBANRPZRhBmrhp2T3bXfQjErhwiv1VD/P0MG
	SZW9Lf9yRzS3Y/U4dmB4ZbPMksEabujo3e3IHJ9CiZ1IvyVpAZBjymDSPJY3CkO7ZEdYXSS8/oC
	nZ2HhqfklTZqxC5PMrig5UEcROPxM4mX+/fecpxXZsEcoc1ogLvcnBz+q2ZLSxIwcCu/2
X-Gm-Gg: AYBFou0Du4cvvGyrrwokRNFcVLDuAqMs7XOahBiNvvtNfcY4ROTV5vqVqe87vRjRqtX
	eyyA887sbJKFmMf0inG9KYumQMuVjIB+PKiymJFeb2k+TmuoDcg0fDp2dD2a02trZUlCVXnwMzD
	NGE7CoSZYVqjeUkzoFXI6sc8mYjmNTKPLq2lRG9AHTon/ghkrXgZlZifsN+n+faTck5djEBsJPA
	kP3d4VfJjJwuZP/asc2Kx41lpU3Cf7IEktO/7j2GLhUnm6JnYq2UenBmm6THW7plLmYU4iUGVGa
	KontPMpUt785rg1iSOhT+P7P02mSWKsARFFO7cRinalLoKxp54abJETpsRW1DRBtsAvMCfuPSF0
	EbHDlYY61rj+Py1i9S9iO6Y1Vug==
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr1098600c88.11.1791520008198;
        Thu, 08 Oct 2026 21:26:48 -0700 (PDT)
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr1098573c88.11.1791520007645;
        Thu, 08 Oct 2026 21:26:47 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm2624403c88.19.2026.10.08.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:26:46 -0700 (PDT)
Message-ID: <148c0577-8153-44b8-b26f-681b71f62647@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX4OQlzOBkMw/h
 dpq/q9fpvoEqjOPzY9M4OQitrDY3XKtz7UoJQ5WeIpUEAtm+mjo233ayA3CcMbWug+Eh4ueIquP
 MdStsNHoYkKihNNpchfh3z0d28PrBkTXOtUMZ+OzYqg0ngshGG2CIEgaZdaRC6nyEV6SW3JT03w
 Og9QP7+PqTy4wcNLdcxyRG1aaJYMN7sdj1s/W2gtNDlBRqQYR2eRAkQMCDsiRgnSPptFw0gtGz3
 b5/WQWpFL0Omu3ZpqEOyTB3hSSUJpZsPjG0rSoyVZfRvoCBaHavD2GOFL39Xru825cerf7QXo3u
 K5xCmGy6PFklUXG52EkqMixnUzewhpGyOPki+jfHxpEI13vkjXGWjP6vo56Gnn/ajd4rRcq8yRZ
 eg+lBx2z04Sc+P/pFp/jNSjWQu4tD70U1lFe4HU9i5R5t0lAyl6tWhOB9s+u5DtP8skLqatFqta
 CPVhrScRSA2TYsixyaA==
X-Proofpoint-GUID: eP_yruS1yBjREQH83BmxCgT6dUSVdLbf
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac86d09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=k7uThIiA5Jd16I7bieEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfXwHmTMF+1Pc9M
 JPLFM6qNjG+mAWdzShCZizZo5k+uv7hMfAQczR91bZ/AAyfNYaulMnu5s3xKPdYEpbA0vbSTDRb
 /U1dQZ/OwEBN4Z9I8FeG2OnC5uDEwgQ=
X-Proofpoint-ORIG-GUID: eP_yruS1yBjREQH83BmxCgT6dUSVdLbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090017



On 10/8/2026 2:26 PM, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..5cf90c77838e 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -799,9 +799,9 @@ negcc: clock-controller@8900000 {
>  		reg = <0x0 0x08900000 0x0 0xf4200>;
>  		clocks = <&bi_tcxo_div2>,
>  			 <&sleep_clk>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> +			 <&ufs_mem_phy 0>,
> +			 <&ufs_mem_phy 1>,
> +			 <&ufs_mem_phy 2>,
>  			 <0>,
>  			 <0>;


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

