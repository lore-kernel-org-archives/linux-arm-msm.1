Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E14353A8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727865; cv=none; b=GrGvM+NYdAtxSxchDMCAb3JZmLi4TklR+4zl2bq9gZUVAGh+PRXDtDbAnB4Ei/qbJtDM9r3q+ELQO8oW4oPL8TUKCYX+5KiQ8onFzk1gsaaBHFObdGEJO5slsHhyL2DbTUJLCvmzwsoz1IIjPZup0fcmgEFT26kdn/U+hxiSxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727865; c=relaxed/simple;
	bh=JFtJ6zkpzpjWERBTY3MFeh2brvW3XChrGsQfXeCZzW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxNNxPgZ1o7mrGj9HCuNUYq/xcKuclW4Di/q9JTLarM3fgo3dh1J6zV7tl8vPU3JvxN+DK+63KeSw1HWfqHx1wXnj2vxojErQGEdmhRspPEfxhVDHfuabbpa3mIkHRO2Ar+uopkjKFXoRCJD9s6xIZLPp4jZF3JBhS7/ecTX0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pismn3qJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abRZ1Oys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pismn3qJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abRZ1Oys"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRAk891389
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GIYdoPwmlp7SGGM3Zke7zv5s
	UTlikc1HJ43uNZXOXg0=; b=Pismn3qJPSfTO0BiitkZhgBvnpO3ySI2znI+O3ZV
	Ov3IyKoKlZumsAOUsdIKT4xFm0Eg15T5GjXaI6xf+22/7z4HgV+ojKmiHTvWqsrP
	zrwxvHY/3stUpZ/uVvgsMPufeuYKJTesqIfcpLZ7B/3eJiS4Xoqn/YKK93R7MeHc
	33coLoq+RliTOVxCrdMi3Y4MKZAHBvAH1xAh+FbniqUBWqpLD7XJl0RfNeKi9QdD
	E/RkPm3qgoWpVZtwgKzmCPiD3M+vIo/ziiG2fe+gv7x6A+BupKHFdEppwEsBgqQ1
	uzB3nlbwfO9VoixGtzXCDoRnB4r3TLMyvtKtqy7KO6C1rg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm103j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:44:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso30742111cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727858; x=1785332658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GIYdoPwmlp7SGGM3Zke7zv5sUTlikc1HJ43uNZXOXg0=;
        b=abRZ1OysdcDVGVaXTfcn0wdnac6bh1u1gDhoIyd5t+ZAB/4tJXoeURExh5O0fRSupO
         SpdICiV7TIFqFCuKHWshSoMOS7bDiSZYdt60k0qTe3eQJB1RTAsae24LHBJwXjOK1Spt
         sFqGTxh92GjmmHQw16bB4BL7hTvBAaGmBinHIFUU74Www2uRaQOCVcf/ZgwFesV+WRBq
         oFvNXyyUlXn1mFXAAjxD/usZGG4fsmkPnlwOybJn5FVbRgLhMa3nIOu9pgLmLzb3xOiy
         QMW9uNEbOSIibsO/bGH43sf84XZKTX1GPL3gcjhKeQhngiSjphxIMDKpoheHgtJ5lBwE
         X2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727858; x=1785332658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIYdoPwmlp7SGGM3Zke7zv5sUTlikc1HJ43uNZXOXg0=;
        b=jdGxqxlRlRF4RKCuPOAqymNCvWckpAUxpH4DgBJXD6wCwv4+ipbK1Y5Vkt5GXztHaJ
         c+oFTRz5zPccxsNQLBMeQyL3d8x6+Bm1YuqmMEhFmju5w6xuRXZAElVb+gOhu0+WAYRY
         dt+8Mr9Uprqnav+3UuyjrFjernRlUS+VGgwtPO9FiqvLyumZ98Uzz0TQ2EAU5Ao8tlmU
         YrtHlmhJ2xHDrn7BqCcDCL5pADhA99KxY2rVgBdZOTmO/J3QEe9K5FA53kVlju3Smml2
         OLwlnrVkaYWJ/D4/B75kgfNYLklXdRpjMBnspgjpVX5LLa2La3EFl8xJFD/dc3nss7bx
         n5Pg==
X-Forwarded-Encrypted: i=1; AHgh+RrEIagePE1Xrxxa53LWkt625SzevM52V/DhuELxChERYdwd64yFPqy2z3dYeJhoxZpBoRlap3D+9Mj6M8QG@vger.kernel.org
X-Gm-Message-State: AOJu0YzIm9JFI6MBMA+Gh89tUxXlNIkt6gw6JwWoyX+tkJx36tMSTG+p
	z8VevGlxnzphqXPkT90utnpzMmQsQOMn64y9vpuSsT3EK+tu5yyuE1xZRAEVMhHMtP2OGlgh08x
	sbn1SgwWKi9mNeUDG5tPWPGRbjdxTeBKcyQBr5opiVWvkRpGMq7yiJrMaiBXIlxeWq72+
X-Gm-Gg: AR+sD13DUf1Jb43+Ne+tKnU2OwWGXomo+tvc3c0UcA4vqhyfovBhbRNAZnh8ZYsnGeW
	5Tke5wgq3k1OhH+PS6M8Vm8OirxX/94LwdaS8wVh+D87r4R+uq9NwfEUJBrc524LYlH4ezw/ZGo
	0l7hGm4+iy3tIUK5T89i/py4Z9CHDnWN7keRUvECIkhZMqhUTFZTZU2CIwNbSMlUySD0fQPZmZc
	HEJkye8uBdEZ+5k/IOa53EbAeykvj6anJ/UfArcbzDa3K9avGe29qe8t+w5kPpMDO7hY1TMZsKb
	n1y3RO4RnzR/JxvHMfYfxsxns9k5iPU3ew0iWpwQbktozehWDGe9Hp2riZyU3oOrlzxrYU62lJw
	EvxUroifBzUL0/kj4b3SftQ2EbDAno68lzh9c5AhrIFyAbxusBa73QEnEdKvXDiyk4nL/PIy2na
	StCQdHitGBYMhd9w==
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr211249511cf.34.1784727858392;
        Wed, 22 Jul 2026 06:44:18 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr211249091cf.34.1784727857758;
        Wed, 22 Jul 2026 06:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f4a728sm482968e87.75.2026.07.22.06.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:44:16 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:44:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <b2pbwtqd5mf5d3sbbadx3e5o3ohys4mmjv5dxc3grycuuqjvgg@rh5veftljlrt>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
 <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-lvds-support-v1-1-1f1aca3213ba@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX5UbFipwqU2yd
 Ql2dK2EDfvyJlKXzYuESPoaRyC5LMBqx4QF4me0kQQNL7lIvrT5PUUU8Sg+UgzCtGjsc5kNUnDt
 40mb8mr7r8wXPV3uvoUi+YRab1VN9Os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXzrV13n7Pus/H
 ccl0q63SEx/adf8hcVMs2vmWCy3u+OyHSIJlXvS8JNtyB8UcAuTRGqCTpAD8yJCeHVSulIkICYm
 sT3PiqM+J770tdcXQ51WGDeQi1KlKaFUNvE8kc52HomnbsbGtUKtqFcY9WuljnHM+GSm3PRjtf3
 c1mYTSBT/hH+x0t7MYS85yAfCzB5EUIb2EcatOUzzdaorEUAoub6A38O+iFkfJzF1XZ3d9DGssf
 f0IsUTWQ+cfubeMWki3F9hvbJHmozQ4mh0+/vuWps8mMyycnwx2nAGyipXYtpsvZ2Vy6Lw3eeR1
 hqni60IldX6mp7U/ZMidQv35c5fahFSWh3bjyTEbWn5PfGR8wykVYx1diIOgqK4Cp8gw8r4LstI
 w8Kf3ipcayyjVPSF/YYuLY/ru06D8/AXRVoYsAOJqa83OGCkv+EYZyssjXTiJfEX5INH/PYbMms
 mo7vkLIrp0k36pQ8myw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60c933 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hb4hLJ562k5UIXpG1yUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: SiWY6Zu1Th_3l5k3L64yHl_hebsmLoVO
X-Proofpoint-ORIG-GUID: SiWY6Zu1Th_3l5k3L64yHl_hebsmLoVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

On Sun, Jul 19, 2026 at 11:35:06PM +0530, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node describing the 476x268mm 1080p panel timing, and
> an LCD display bias regulator supplied through the GPIO expander.
> DSI power is provided by vreg_s4a.
> 
> The overlay is built as a composite DTB combining the base
> lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   4 +
>  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 127 +++++++++++++++++++++
>  2 files changed, 131 insertions(+)
> 
> +	model = "Qualcomm Technologies, Inc. Lemans-evk Mezzanine Lvds";

EVK, LVDS.

> +
> +	panel_lvds: panel-lvds {
> +		compatible = "boe,dv215fhm-r01", "panel-lvds";

Thinking about it, does your panel have EDID? Is it readable from the
device via the I2C bus?

My major concern is that if the user changes the LVDS panel, they'd need
a new DTBO.

Would it make sense to implement EDID-based handling (like it's done in
panel-edp)?

> +		data-mapping = "vesa-24";
> +		width-mm = <476>;
> +		height-mm = <268>;
> +		power-supply = <&lcd_disp_bias>;
> +		status = "okay";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			hsync-len = <44>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +			de-active = <1>;
> +		};

[..]

> +
> +&i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qup_i2c1_default>;
> +	status = "okay";

Empty lines before the status property (here and later).

> +

-- 
With best wishes
Dmitry
