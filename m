Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0643B4A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982931; cv=none; b=G5guF9MxIRmPcmC8fq4Vz5mJ566XFIj1l6sCOzY6Uk3AFbATsrhwC4nWLYgP2yekIVw9Hi0GimuJ94J0Hb/sDVUN1O6OBQOuUNoQro1tdOXS0H8atwX97k4YHUAafmk5rNrz6HVD6LConjEJaJvB0NLRqjHT3HHBRudR96PUPuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982931; c=relaxed/simple;
	bh=gRcbiXfBc1xHk1KGU0otuDcHYmR9hB18zsIsMVxfBQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riz1RIlnKH+4I7YosDr0iLnXYdpmnFcS/lVH155ByPR2MZJ+sleFnOwOooGd0Uqi6KyKP4G9nM29HVrY8VFPDVCTmiN2dZmwy+nRoEWNSpuSMWgcNL/aoBHeh0kVzMMm9XRHvnsaFp+AOACko8by49AezP+GBllX2nBwJBPEWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqf7ThK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCl28YUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqf7ThK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCl28YUK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYwbu1530652
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=; b=iqf7ThK8DyslyJpE
	rqqCR3RIH0GrLpJeT+sokLZUFxkBvQz5kh+10LmMNHRvTFo0+T672KVs+ZpQ6PTv
	vroMTmApAEuDU1yg/+0IkgDT/dSaJCHzjNZd1IXqEske4nXRw0cmNBaojohN6yKc
	2VvlUFWMRr32RaxYvPiLP1Y2k6M+88gCeHRWU/HHJP3UKWkYNGVglRoBm+6W2nSF
	iLIkkUz5fPm0d806tN5PmavJSuixsetC1tP1UXOyIxN+fomPdibsIxPuWZWGqR3H
	omfCTWGRW0ubsPXppYyj1e5ijG5qkFubilT8heEDZrKIfMcWePYeWbNiGwkjw1Np
	UxLAUQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke265q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:08:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7386e55c63cso65689137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982927; x=1787587727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=;
        b=KCl28YUK/ciH3Uzb+QLV5Cu5b8sbgz0OVnrYPu1uiN4e51Czgln1hznRW8VBO2XMv8
         pQa/+KXXS5AkRNJ+7MGGYtRFEzuYLegJG3gjLLBMeTUDop/yymEys4T+0j1vyXYfwN3s
         xMsVTBJduo2claH1bWH+zuYjCixR5QavJHW46j7UAlfxVRzubtla9Nz+9qnyRtV6Tba8
         phC5evGJvPGtqLa8X4v/qN5rZk2LFHIj3g2EAHujA9T7c1fyJJOg3t6JIFC2iFnwaBLs
         pNZHDvEauxEUBNwy5oQoAlLgX1VHMuc0RxsUsy7skYnfNZPWxmwm9RGp3Z+rxJSYI+qN
         YKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982927; x=1787587727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IiNHZhXD4zVpU84b3/87tpD7H4RzexzgSBw04b8Zzk=;
        b=HCdocNoCYh5t55aqBxDnd0C9sIWd0J/T+on7Zg+QADE9gdtrm6qYPGFlEJ3XdkgZ3Z
         l/pWwaIcOhjDajkYDoWVDpkbQ27bRJ58r062WlD5QM3uoFOCRNMjrq+PgJfBhyaWQLPk
         SsADnNSfA58GRl8Q/UvcSILjkbn95aBN9rR7xMckZDyBsHSF/Tab3JM+ZW31ghdkTagj
         6Vyh0O1QwX+ESxNcG7Y0I1DumdST3aTqlQIlmOR5W4R3XNMF+iZxi/8/hsTtbPwywbC+
         Xb+Fya4WSv/lV3ML97c9KJHq17H6cet8NFK8gI3/R4Qcwt/tsqpCqyaxe3h+azAFNg9x
         IM4A==
X-Gm-Message-State: AOJu0YzjNBxkxJyyM6szMk+ng45qOjrleqnN/d7PXjX9MYub6Hht1iFk
	yH5AXKk2YaKvNuMF4fCMGB6pcC5AzUsQZuHlWb81HQUUYwg6fnCMXAobLD5ht3euTqgAUQwemoB
	QQXPwziuHpC2dj2B6JTlo/K+wIolPcbTY1N7paQIF2Z2vsn0JVBeLObl3F0YYIE2CsymO
X-Gm-Gg: AR+sD10Q3gF6kP+6sKTRgk6MQ+7ftLBfjgEz/IX/D7TqC4n14xnloQ64ywn7A087kqH
	SYXMZ2TIs8qZitCxde7Nz1qyv9XOjZq5otsQGuz5oghgg8PyiDm9Vk4+CjGFWwVOnYRDTEbSk2A
	HSh2zvrQlOIQIne++HcHt2QeuutCVoVGiTE9f5GE0lgx4vgpVLoxfDoraLlPlhImc2KzIPbOXhD
	4w93RAHHmRpyVucUJR3U69kzb0uX8MZ8l8cumY4zdomlJIwevA7LsYu3aciW5DqgpaPRIL2sJXW
	iA0b6M50vTNQZGHS/4hTmZ88ynUAw1zab24XYxTC8R+X9nqVhtaqBCmlpbUiKGpZ1ri26iW5NV+
	/Tjo1Fg5PplEND8jaR1ufEaJ+
X-Received: by 2002:a05:6102:a4c:b0:745:17b0:10cc with SMTP id ada2fe7eead31-76f2df883ccmr1649148137.4.1786982927149;
        Mon, 17 Aug 2026 09:08:47 -0700 (PDT)
X-Received: by 2002:a05:6102:a4c:b0:745:17b0:10cc with SMTP id ada2fe7eead31-76f2df883ccmr1649134137.4.1786982926613;
        Mon, 17 Aug 2026 09:08:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2cdcsm77637766b.18.2026.08.17.09.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:08:45 -0700 (PDT)
Message-ID: <79c3c201-395b-4a89-bd4f-0e64a59a1fa8@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXx74wtE0xSLjr
 q8kYiWnq2TkrlwCxBKnscM8H7lcxv+XMxF1YIQBi9wjqkMdMcwdCAKF5+D8YhWGEMdJrGHwDcs8
 CU9O6RS+8kMgsOAq1bw7WRPGRUjgyKOWBrCC6cCz4LsLz9ZBlbU2heOa4EWayeVv1xhmqIwcRrU
 JJLpV8Le2C3uaWyN6SqzcOkgf/QlleyYfXdn8xVEfWjgxURkPnS9E85v8dR5+xoe5hDXN0dmHKe
 WZu87XZc1W4xulHiJ6PrAz9NnQdLGRRCaHxW+dwpU2q79+U1TZH3HtdmsyylgAIzyTtKlp+XAi8
 Fxkri2tIw1Ukz0ZNvKCJhxxpgM+4/iw+1QLLSXOPBLRAcrX2u0jdMzVljgrUCVeGKyvcXSo+/0H
 iOSzmnwqM2I0lD/UEMHmUTHllWhbg0QsCKWzYZaGICUm7pSwDfEQBkBNteHT1PcxVpcILxie9ZK
 o29g8hAMx5UqLV1qiQQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a83320f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=mdXfIj6UjNWI-6idB5UA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 51PV04i_GwOwcNZf-qyi1r-yNe1CsZEx
X-Proofpoint-GUID: 51PV04i_GwOwcNZf-qyi1r-yNe1CsZEx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX82QRW16o7OOt
 1w0MBx8p/bLPPXMeLQfKcbEgv/hAkUf8krFKB0nCFSOK6GqLoTkowmEJT6/NhEnfmQmeKgu+2nx
 0fNmnO5pMpxCnLlBXfPHFss3JfqbI5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123

On 8/10/26 6:55 PM, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		framebuffer0: framebuffer@5c000000 {

Please add a \n above


> +			compatible = "simple-framebuffer";
> +			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> +		};
> +	};
> +
> +	backlight_dsi: backlight-dsi {
> +		compatible = "led-backlight";
> +		leds = <&led_backlight>;
> +		brightness-levels = <255>;
> +		default-brightness-level = <190>;
> +		/* Backlight controllers can differ between panel variants */

Should we at least enable it now to make the backlight level controllable?



> +		status = "disabled";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_n>;

property-n
property-names

in this order please

[...]

> +&usb_dwc3 {
> +	maximum-speed = "high-speed";
> +	dr_mode = "peripheral";
> +	/delete-property/ usb-role-switch;
> +	phys = <&usb_hsphy>;
> +	phy-names = "usb2-phy";
> +	ports {
> +		/delete-node/ port@1;
> +	};

I think if you assign the supplies to the qmpphy none of this should be necessary

Konrad
