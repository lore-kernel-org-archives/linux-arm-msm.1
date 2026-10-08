Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180A3D9674
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444181; cv=none; b=DCiZjCSRXx+B5FIdGzX2BpnjA5yKpvfhXLbyjajyU7/YEtpWWzTXfda7Sir4eQfwnA4QY6yHzWy1bKTyBb9HKCvxxYeCPSnKXqysVeTZte46K3P/YuYiGycyO0N6IGsQp0V71Gyyl3Yh34gD1kGPw+tvMjIY8E8wurBiE4kw4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444181; c=relaxed/simple;
	bh=i8uF9NLjlipi2g+SaY1Sbhj1L5kPCa+uJ+n1WEcSgbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbV9CKsQFlW9OjuHfLjvyhGoOVbbCJO1q9oSwWbwj+xfa2V4ZJLNHPuBRHaETwY7Q/D8+fpCohmycZ7lXj1bBa6nu2UJR+0Tkqx5FU0isg2i06vE84LUeyX5FFeU9Qt45JE0yp9pyxIMHp0WqJIpbM9923UGrtZ9vSvBKDVokOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEp9zmEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2YkhCZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEp9zmEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2YkhCZL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KcVU730891
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 07:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=; b=aEp9zmEkzBjy027b
	3NOlmj9O5D02wFd3a9dizNSmWW3uKE9tsrg6bJkbfQ2+nb9feFwHVCv+RYRVxz3U
	D/B3nkhBXr+hAg8uDnhWmRW7W5rxfnUVPWXwaKhwb/ufF3xSC+KESO6Mc4xIBdX6
	v+mLbHD0FhCExY/CaEbkftAQAYUcsJ2SyVv58i9uQq1UvMIam/nMjU0xwIikN8qR
	RENfY5j5VlewuE8gsIOgP7S/rB6zkBtP2JdDOjfAs1gcMYJ51FV8YdjY6KTXALB5
	7WTgrkI18bA73TTOOiN3YtC6n63vZbgqmr+qgcLrAtwNktTb36qvcnJP4i3M4x8w
	4I4ueQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31mxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:22:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so51586585ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791444176; x=1792048976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=;
        b=Y2YkhCZLDeQJPoobZCXFJXwL3TsFw89elbfe5rCoc+LFa2yw9s4Oss3p54qZTU1lQm
         wmwDx37B/M8WhPQzxCynFKnSvVoT9gVT6+baSVyGb2Igcar9rsCL5ELIU5USL1yDXNbU
         Kxf32VwT/s6HIbvWtJXYp4hbQL3IOV3Tswj3w2huj1614eDEXeQbqTeOn4t9DOyl7iTf
         t5p48YEOhzYsvtE196eY1Qgaj77wQCTZZKTpKUyDN+4t7B/OIsDNKx1MZX9WYKymSxZX
         4DyZxcqyiSFaVhtWpb+V2f0LxtsqPrCWtBdn3z2D6S7U4kQ2H6nPyFDto0buGg/8hEuC
         90tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444176; x=1792048976;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppMBDp/pJ4xxrQFK4q3LpnADbn6+L74//XQw3GBFLzM=;
        b=yetSUre4GWB2BvsNj5ubj4xzRKFo8VpUaGMlCQ5vieVYt6LpMc/N4xofNRalmLy8we
         krFonp4gpJTk1JA/nx/071S5anJAITE+CYulyrZkTQbdslqYJ0WVn85eWZZ6UhJy8Hvt
         zhBs5ZRlegqT22nZ7SfrLZb/xALJnJRRvyiQrk2jEoLkfD9X6tgxds7ZqIFAwXTBYKZb
         w0WxwpwP4UPEHQ/H10fGPqZ8ZKwUBRuOp9ZW8frGdpZpGyC9X66XbDkA0p0NGb/z0EGq
         EqF/3SiURc4L/0kr/R5iZRxMCOB738ye/W75Mxi/YgI2SmJEBVgTcE1VFZ/6AWuELT0L
         U/qA==
X-Gm-Message-State: AFq9FYLmqdf7vtg0byujLWkk19NUPtq4Yt95qwISwM5RrU5YVTruJL7p
	RV+9VR27Sh6WtYt0nUCE628XB6BjIYzttH5mP3r7Gwh8NMw/H4VvqiO5IeeNi4k0P505IjD8dVB
	vpSa86xvIR7/IXhvzZTsdtVxJolaVyzqv4FOOMGqffAgOc1b0v/g4cf19ffMnuzKcP5FC3/pjtI
	BK
X-Gm-Gg: AYBFou1YgmPKyUshc/bUvt4VRd21ZKfNpF1VZXO7QA+G67nKLoitm/WyaQI2fSkRcI5
	gKF1wME84+kYPtzWHv6KQ+vM424EL0Bs/c8sW/AdMcz/aUlW8G0BLEvgRZhKo1KTzlktRDSi7NB
	deweM9ZGhu2o4WzJixTr/mW2N/NEbP6/NnrsxO/CAoWkdOi8JEJjUvLRDiCM0p1ugG/Js+2OEuh
	KvTP/Fz3X66p3dmvC1HoIrqT/72nk5whqSY2s5DQep8wULAWC51vnaBtdILfM8pG8IDmTc/ZxN5
	0z3qglwHA/ymBp0Eldyqyo3QX0PHT9aQrjd6ZrRfsiQ4F6Rkku3NUjnQW3fFBrzyI2fULdsLLb1
	1+a8dmmwIn9hCXitqDloNBQ365zo=
X-Received: by 2002:a17:902:f786:b0:2e8:b4a:43a4 with SMTP id d9443c01a7336-2e80b4a45cfmr10534355ad.34.1791444176225;
        Thu, 08 Oct 2026 00:22:56 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2e8:b4a:43a4 with SMTP id d9443c01a7336-2e80b4a45cfmr10534125ad.34.1791444175481;
        Thu, 08 Oct 2026 00:22:55 -0700 (PDT)
Received: from [10.64.68.122] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604b53294sm20934665ad.83.2026.10.08.00.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:22:55 -0700 (PDT)
Message-ID: <894b56d6-ab39-4920-ba37-94a5bd0cad5d@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:22:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
 <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOSBTYWx0ZWRfX0iqp5SYCn9jJ
 yliryeIlCMXfnfx9LslDLy+0qoish0WygqfjYG01Y1xJn5uCpV61qNOeGeywVX3KVnOQQVYkwon
 1b3p7KidbuJpjLfbVoXGdyPHoz0wCr5B1LVNIURwjV9fxP4PgKDPBOGUoAkqU7zYlPijbYVRUPt
 +bSt+e3vC7gBNeLmMOpsJWQhLndYPBomumGLEq72AdnzmJ54L8Ty4R6sXPnwcGFdNGkl3TsaMJI
 q30xQrfNzg2mUqpGixVP/dnRfHY4qo18zMQyusn7fI73dGBMu2CuGTPzTz/hu0F9yAhw1u2rqXa
 THUD+bs91VjQz3a5Kf25EK/JsXxHcTjTmKidRhe7B9q8famOynmveFWUVlLVw0rgdC0WOgcceJA
 q0BQEMQ4BqGTLWnTyusofAHBr6ynDxG4ntu17anWB1LxVJV+wR2FqiA4EPCSUHjvA7DPzjeTUlz
 73ehH/GZ6SpkFax4bpw==
X-Proofpoint-ORIG-GUID: p3GYK1mZ-PYHqhLR77YmXCc2UKkbO_dN
X-Proofpoint-GUID: p3GYK1mZ-PYHqhLR77YmXCc2UKkbO_dN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOSBTYWx0ZWRfX3kmfXOBlQyO7
 tjFEimTxgz7DIhOHX1Beu1BGRBMDn11dOnzNn1Orn+EdehV65nttY+X9vPHON18wg89o4vHwDnk
 tDSXmyb9wZMjhk33+YhKyJXLcQvA/X8=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac744d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HdoDP85nwEVMDcDmVcQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080029


On 7/28/2026 5:53 PM, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
>
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 09527dcf957672b4b9658988359e79d8a432fd93..abec577c062d53952528f3bd0330638ea53b83b3 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -3894,6 +3894,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			phys = <&ufs_mem_phy>;
>   			phy-names = "ufsphy";
>   
> +			qcom,ice = <&ice>;
> +
>   			#reset-cells = <1>;
>   
>   			status = "disabled";
> @@ -3939,6 +3941,17 @@ opp-300000000 {
>   			};
>   		};
>   
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0x0 0x01d88000 0x0 0x18000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>;
> +			clock-names = "core",
> +				      "iface";
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +		};
> +
>   		cryptobam: dma-controller@1dc4000 {
>   			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>   			reg = <0x0 0x01dc4000 0x0 0x28000>;

Hi Bjorn,

could you pls help to pick this DT change?

Thanks,

Wenjia Zhang

