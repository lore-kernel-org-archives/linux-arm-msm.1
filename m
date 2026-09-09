Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B5559C97
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957791; cv=none; b=TwvaK6sUtZILqv/v0DxDK9WKPxDt09QIzVq9TzXubn81hIFeIzl//39qF3B9mOOmIup3q3DOTx3JMIbh2jMTnXhhKOtrdg4vqofHO8Jx4pFBqGBfiSssLE6a7sdtcjNMnwEct5B5mTa5xz+5y27Lq0x+Bl87CCQ/kY0/UT8g9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957791; c=relaxed/simple;
	bh=mzTZ/S7+IJMli97Pl3huO2xHKYlikMJEbLwPxRSRxlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPUPq9fzH8xM6WND4HvUABWT60dDtNZpSAx4UUvd1BWQoJnd0ETXBAyHu4BkoYTDhYK7ratPP8fJ39LBDfIQ0tOhRAIG7whCnZOaMERmAyh+8abm5NJ1+EO5nyGYYsLisOOUng4fzcj/vz6xDw5ABz+8I2nXAOZUUYrM8CUARVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klN1P6bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F++XpuLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="klN1P6bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F++XpuLN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCoWr1401027
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=; b=klN1P6bbHCPgPlve
	NnwHMq3xl3dQD5vMbBxlHuf2TFWL91G5renrlOXpc33xRUn+HtAXFRdVcLqCSWwh
	Z/MFSGwQF6nKrTjqTR6wBO4OUTeesnETVnqZWZ8ocsCG9OCLynhSHIZ5yYjC28SM
	UWi+Yo9Ye6HjBotQHrUb7TrBuH3hrkJhld5M0xy5dX7F6tNYcwVuuYsJxa5HJKFK
	fAZZPFTPBtXPojBkxIkCrVltGgEQjBjkxpofzSk6hbLA68KO4888N01/QGRmr3LD
	qqY1YPYBAYQGwBTfVbiRI3EIGPE+7NqsiZ4B+M2sYwPNkfOc9+lhd0qqCdhaFHot
	YfYWSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x037a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:43:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so73744985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957788; x=1789562588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=F++XpuLNWRsHLHVLzNlwj1NU6oFi9Xmzi0OuX77PXglFpBigtBuPwqYCvoTxrXDSmm
         Mzd6w8FNfbT+hxaXteEfI2HuPjPTZPCElNg0QilD0RVaVix9x2R4Cotvmy31UKyBItdS
         2gBhWjalHUuOVHvX2OJjYwR/Crhs9YnpWeCVpCTITh3UUSDKfq1GlIgSJjMWGDkQGrMl
         2YiDVf8mFPwCk0vBfSJxcR90TaafqJ3vd7eZ335NCJBfYQhbYJYSipJl7sJUJqBchMKP
         UO20s3g5eqNTL+uz0jBGJ3enxHDA8HZJLYp2YXlzfVAqd7vQ7S4u52QhNhtgwv2rmD8N
         pROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957788; x=1789562588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4h5BXcebG+P+PaqL01o6HAlbOlizJ6FcqLSIe5pdf4=;
        b=rQzlFhLukmFfGF5XoKIQIMn1/2lOva7wEd0Ew3MPkoGu3hBJk4K9mKK/wTcl/kqA3n
         BFUEmFRf1o1Txlni9PsH5J9Z67Z2tXdFI2HbKVM4ED7jlKVVS6jFllpUMiPctQ7Xvd9g
         hYZaoeLZ7EcNGUUi1hP8Yol/AEerd94F7b1zbSu2SWyOKCBoRCilMwR1c3HqiSDX1GB6
         X8HporqzMT4sdexItMvs6MEqYtY+wXUxzFrTn4O2LHyGraFtF7QriexNkw2pjvVweeO9
         5BJh7QKmfZTmfpYMt4MU2VC014ZK/Qy8BPds3b1pJJqUKv2ynvXlvI5KUyAT0nmlcVyw
         ab/g==
X-Gm-Message-State: AFuF++l7B4pO1b3XX9cfVbgdF+ItS88fsin9futxxjPrw4fIBuEberr4
	85WcsnjLMA3StMthr6wKkRizKxDM6SzvozylgtdsCmTKjwnJ2JC2d6e6tewWR14Z7i2HAc0eqph
	S2JZP7XnZDEWC7XMGbrTtq9GcipN6ynsFaUZ+rlc4/OddzACPOvEOd1780su/rU7L4nm2
X-Gm-Gg: AYBFou3LFsPJnpHii1VK/rVnfu1elPpYTmQp57U7JdEIQLHtdHd483JORAh3L/CSgZ4
	0O42cMD+HokOpkFKj8kNEgpvDWszUFdZRDoMrgIFanOs3IJsOqGoXCk99ct5BtBxi+ZNoevG3O6
	6GPmyX3Lg2+Hk7v6cASJfNOOfMaQWGnk3JOx4ugbwbe0H5CvsnylXYh6AkqmYVllQR3brQQ/+dW
	WMPn0v3MUBtAZx+I2F19Z+WIOWZX5IlcIzQZAbUqgYI3/ehmGzPODo5n0JGzmIUnDpo8WGt6zva
	D+ZN/UoS3OO4rSlEVQIUvqH8G5Og/LJtdSR1fgM6yNweD5A/Z1HY0vl7XpWqs6ojo0irnv97o/U
	T1HdpCm3wOKg71CG3de8gyw==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186916185a.0.1788957788114;
        Wed, 09 Sep 2026 05:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1186912585a.0.1788957787673;
        Wed, 09 Sep 2026 05:43:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9679sm6609508a12.20.2026.09.09.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:43:06 -0700 (PDT)
Message-ID: <2f950735-91ef-4e43-a5e3-1375585dc43d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7ZLxiuv_jQjwKiCcb56H1_WXJ2o37ePe
X-Proofpoint-GUID: 7ZLxiuv_jQjwKiCcb56H1_WXJ2o37ePe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX8dFxii41l9lm
 WRFLLhzU67+EW/UxcuFkY45Kh/UxW08Be8Fd6Oli+iVaq0mrJ5SSB6Gssp1wpvYtuWgPagPKFbL
 zEvQLdqDzXKI5tBKWlPoyXed16j7z5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX+XbNsqdGZYU+
 o68OxC5vMB+P6iVU1/IBZlY3gUylKG+CKUXJ4Nt4GROGZoj0+KaPCqJbtY/pqry5PbUpOa2XNkm
 ReJlzBhvW/vnzHcNc3Jxb4590TBlISzN07VaJkA4Vgzw4j3bV0NObKM95DXOgJbCJmj2yy2cjMQ
 iu1CFAE2dDLXN1laBuAgd3RPQORIbLKTv+2zRvsG6kBaGqFKZqxk8aFsw4BOc0zJR9C/GmT8QpW
 WgZ23u4ApUaEVUTmU+UP5E32GvsPujLsjp1moXrSrWz5MOKGOQKeGFD31Q0GS6nnpafmii+ub3O
 11yYQ9p6TjV+BRCh2ZAsv2T+q4+bbUbVL9D/UyUJDieRiM6cvAZ3z+PNEufnlxkUOwEGdAsdrsL
 OGALyJDEC31idf1cNE70Pj6vO0wWhQ9ypMW9u6ZuCt+5Pn4f3mOqMUD217jOZvebxRk3AkH2aX9
 VNtiWjXJjIMgASrXIkg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa1545d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=cUeywdAnc2UWe6fb0OEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090142

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


[...]

> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
> +		};

This port should be defined in the SoC DTSI

[...]


> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible = "ovti,ov08x40";
> +		reg = <0x36>;
> +
> +		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_rgb_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		orientation = <0>; /* front facing */

include/dt-bindings/media/video-interface-devices.h
MEDIA_ORIENTATION_FRONT

[...]

> +&csiphy4 {
> +	vdda-0p9-supply = <&vreg_l2c_0p8>;
> +	vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			csiphy4_in_ep: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&ov08x40_out_ep>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			csiphy4_out_ep: endpoint {
> +				remote-endpoint = <&camss_csiphy4_inep>;
> +			};
> +		};

Likewise, define in SoC DTSI and only override necessary properties

Konrad
