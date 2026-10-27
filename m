Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090330;
	b=KjmWv6dbkIZluZbdI4I5Yqy0j4mjyLBoBcwGBpvG0YrvAZbs3jssraVUT3fQ7foTNOiX
	 JcDugSA5yhJ2O1r9vhLE+xu/eeBN+IUeSJJ4Mlq1byrMJkJZfwU+rfsF1MM6VxL/fbSRz
	 PhRN4zuTIO6CdR4WE0JJCr3CDwS3uaF6DUYKLpqWnrxtocAotTR6l3afeny93NH0lC5Jw
	 hBXWKHBAjzS+i+BJ3O+Fejlc8+fBeDSg5/otmwXL5QKlf1mXOEHZwWGvl4qDdKAjJ4KSV
	 zFq2Va/K397ALZtNN8Kity2Cfey8x7sCaSJhiWTzqog0rqBbRZeZZVI3RriYVxmqpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tCevJgHgVtmeh2gqNvFY7OysU/HWbClxaONfWkB5jUs=;
	b=cW3nDocFGy6dYeJqhz/S5qjpMDQf8OdBYqG//cj/Q3xJdKv4HMpn4NsFPaVUQBWeuUE6
	 qGh6Qgyd01uwXWVYhw0Z/ZIgJk9ZQ1DAZ2vAuHPb2PFC20iuFXLYa+PaaKnPAI2jNwMTX
	 +TpMJr45tASGXxLG5AdL/Y7o0bMB5+7Wd3NIKr89qpFSyXj8vA0xcv1ubeST2g9ZMxiLe
	 lYP4xIpNwOMv7X4qogwySTREKC0ukmncw75VwvdIoBBa3OHuD+cJ3K0R93SpiTK1ozJ3c
	 pDMtQCHmwUuiN3JiqNReqqMsTgI5KecDU2F6HwAJwJIuSBXlkZajN4Mbxr7MG3lz6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnArjqQ6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9cV4OeT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3A606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HnArjqQ6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9cV4OeT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YuRJ2349826
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCevJgHgVtmeh2gqNvFY7OysU/HWbClxaONfWkB5jUs=; b=HnArjqQ6xT7TOgVC
	5vrviWDQS5RDoht69gEanS8cHgoYFqg/V/d5deoNZwrx1dqbpA8llfUHoAV1rmEe
	Q0N4QSNuFedAdEobgZGjCtnUu1rJ0Ue13/hWvINwfbY+sEKbT3grJwTc6exJiqU0
	88q2pU8jgZKzu5qsl52baqsuEvThdsU2j3Ow0L7vWrD5n12Jrb50L6bryY3ASMZS
	l+KG8oAOnVEyHXicY1fSTvAQL3Wx2xu1suwv5fHImCuoC/nh8Bin4gPxMV8nQxn5
	Q8C/AhQH2WWflcuDCbIOCbGmF0YZna8OyK3D9HnZXDpmY9J9l9jckmvFS6WuhK3K
	418N6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919j76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:38:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso100640885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090328; x=1793695128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCevJgHgVtmeh2gqNvFY7OysU/HWbClxaONfWkB5jUs=;
        b=V9cV4OeTLGQgGmQVbVOHfTkLuKb69S4KUr57Wbex1E7JI5U09cW/GBUCZAr8sunHdR
         WVfrmDOveaYG+zGGrZE1KPI6yiZYsSvNij6zxXyBt2BGijqT/wXTomnG7ld92FWhkTJE
         VE8/BUgPPSX+TZBV3CaqU2H6aXz68L1z9ktkPhIY48jmahhC7d1ggsm5NlD1HhUGzjhz
         sgVD3n1Qgrr17YqnkPG/eWqht+pA9To2hRxcvr5ElbYJNJdCoJ/NjvqG9ZDXH9tsLy9i
         mJpq6ObfRx14OWabFMYy33pfcW6IJpX+LWKpraBto6He6+PM2s1VDVRMrtxrayXGtMJm
         DDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090328; x=1793695128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCevJgHgVtmeh2gqNvFY7OysU/HWbClxaONfWkB5jUs=;
        b=hJ2drdV2ddAeAycoga5Xcz5b5SFQGutXB8a3JAn0reC0j+a5x33crFz/nYnQDAahMb
         CthhK9eXvtXllMyj0D5fGoy+xGM9g/Tn0Ukug82RQILG+rIZm6JKRmz9i9Ww0AkcE2nz
         s4j1eS+A4ER5YKNwXjqLvRhg8Hv+MzEaeHYGGqyz41W4v2KHe4tsM5YEpzsgeDQf130k
         Y4RqNHrE7RsRHzmRgkqprV2x0Nknun9NCxKjfWbY1usXGZuhGz0v3Waqec49Hi2YopTu
         c61Fruw6A5l694dV5oPSZ9ElJ9y98J3YBqLK32w+jGwcg7dvf9BmLW4y8Xeem5xTqVY4
         HHog==
X-Forwarded-Encrypted: i=1; AKwUvBxJKNO2H2+/Jj3dpLoi00FnQDnbL8c9/l+Lgp/PMcQLtqgwliWSN7NJP6SNhX783byD9tYgm76ZIL7R9ZHE@vger.kernel.org
X-Gm-Message-State: AFq9FYIZM3mdzRamon1YcdhIT4HyktABhLexls4tBFcGHeR22TkVAxet
	KyYrefmuP99AJ1JtsOe2oX6C+OvWZHvWL+9+rZVIFCP5Hf/SIMQOhQaVa/q5einTcKG0ykYxYEZ
	9k+k/+F2nPPYzzGo26oQrwJlDfpI8YnJwQJRQJPkB0D7Iloy7ojbMegxPl1hdScdsIH1c
X-Gm-Gg: AYBFou1ncFnb2myGnTIu005xD9HZLgef/V4lsFOOvLrISlHcpJecQddNvhssyc8xMiA
	PorsC1ofY62R257PcBbTG8/g3Z5VN1Qi6Z45i/CFprwShNS3re+JWNytEMBqhdgDqcgEVixGGHh
	jiDxGtFuv1W4AVKXSlMERriQL3xTeeOOzFkPkwDZwZkm1/OWBPgZL1dHiEbH9gwu0/VDypyEC3n
	9PuKm5vDPWmBn7AvscUe1FgugFIzNDTk9t/WoJowRfdtOtgZpd7rn+31ufrE56ZAiG1TGX4KVOd
	6tyuzQcbhKUwNTZNdl25nE9w+vSMgbDoce6FIZvATWYSpKsv4ZbYj1PBhl8paKH/MCPP2VaMLA7
	ZMZE3kaNued9cP2XLg9WJgQ==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr1322133485a.3.1793090327688;
        Tue, 27 Oct 2026 01:38:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr1322130485a.3.1793090327200;
        Tue, 27 Oct 2026 01:38:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm4511350a12.21.2026.10.27.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:38:46 -0700 (PDT)
Message-ID: <0c734aa2-e844-42e4-bcd7-c41350cf3f90@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:38:44 +0100
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
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: Amir Hanip <killdeath104@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027075116.41673-1-killdeath104@gmail.com>
 <20261027075116.41673-3-killdeath104@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027075116.41673-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tUSaPPdKaPMSknNqxT82e9OA6_ZOPgf2
X-Proofpoint-GUID: tUSaPPdKaPMSknNqxT82e9OA6_ZOPgf2
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae06318 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=a5lUmXSiMASnYcKtJU8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX5T11sbIMtF5i
 krkkXTI4QaGPohIKmF7n7YVuU1QP96ksKQbxK6QqV++8LDXnWPt4f72A+17jBjpkPQ/zF5R4Wyv
 CjLyat5kGJODEo7b5r6Lf7q4R14jgckx5qEna13fcUwZtXa9cQoaLmArbNQOf2IpBee5JQD8W+4
 VK6FGcdc6n9mNnwOOTlUf290VpQFhfpl03RusT5F/4bWBLwNoXMnrUBUXfbOZbp1xVRrUkENaXL
 wwniYy31dmfkuDDzOTBAKP7EQPkWWHSHsZ3hyF5BF4Z1qwRi558MiOZ+hEkzyxdqwxre6uBh33O
 Qz6KslAkXA98Ka4lJmg//ddbnpp4f2pELQBANLw7ElCnga9qgGSXWyjqa8mjPVcFty7sbwHhnTA
 UtU46bIB8VuWmurSZS3peiGaWSMjIi4kcnwB3n52J6h3M5yoSNsFPw7QFo+nrpQaVvghtLu+tIM
 V7nk4NLpwjVnBFoFKbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX9aecRfoTQL5O
 duxPn/ZtfjBZE2sRFKDCBZrrKs5sXJzi2RC4MaslJ2B/oez/pyBmAdrnLhjYGgl1iGfKAuTYHJl
 zkpr0Ce3Va/Zj8OgAL9Npx4oL0RLRbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

On 10/27/26 8:51 AM, Amir Hanip wrote:
> Add initial device tree for the Xiaomi Poco M3 (codename citrus),
> based on the Qualcomm Snapdragon 662 (SM6115) SoC.
> 
> Currently working:
> - UFS and microSD
> - USB host (OTG)
> - WiFi
> - Bluetooth
> - Remoteprocs (ADSP, CDSP and modem)
> 
> WiFi, Bluetooth and the remoteprocs need device-specific firmware,
> which is not part of this series. WiFi additionally needs qrtr,
> tqftpserv and rmtfs running in userspace, and the Bluetooth
> controller needs its BD address set from userspace.
> 
> Display panel, touchscreen, and the GPU display pipeline will
> be added later, so the display is currently only available through
> simple-framebuffer.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 516 ++++++++++++++++++
>  2 files changed, 517 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e0..02e87dd78 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -386,6 +386,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-citrus.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb

Any chance these two are related and should share some portion of
DT?

[...]

> +	wcn3950-pmu {
> +		compatible = "qcom,wcn3950-pmu";
> +
> +		pinctrl-0 = <&sw_ctrl_default>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&pm6125_l9>;
> +		vddxo-supply = <&pm6125_l16>;
> +		vddrf-supply = <&pm6125_l17>;
> +		vddch0-supply = <&pm6125_l23>;
> +
> +		swctrl-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +
> +		regulators {
> +			vreg_pmu_io: ldo0 { regulator-name = "vreg_pmu_io"; };
> +			vreg_pmu_xo: ldo1 { regulator-name = "vreg_pmu_xo"; };
> +			vreg_pmu_rf: ldo2 { regulator-name = "vreg_pmu_rf"; };
> +			vreg_pmu_ch0: ldo3 { regulator-name = "vreg_pmu_ch0"; };
> +			vreg_pmu_ch1: ldo4 { regulator-name = "vreg_pmu_ch1"; };

Please unroll these scopes

[...]

> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm6115/xiaomi-citrus/a610_zap.mbn";
> +};
> +
> +&pil_adsp_mem {
> +	reg = <0x0 0x53800000 0x0 0x2200000>;
> +};
> +
> +&pil_cdsp_mem {
> +	reg = <0x0 0x51a00000 0x0 0xa00000>;
> +};
> +
> +&pil_gpu_mem {
> +	reg = <0x0 0x55A15000 0x0 0x2000>;
> +};
> +
> +&pil_ipa_fw_mem {
> +	reg = <0x0 0x55A00000 0x0 0x10000>;
> +};
> +
> +&pil_ipa_gsi_mem {
> +	reg = <0x0 0x55A10000 0x0 0x5000>;
> +};

Let's use lowercase hex

[...]

> +&pmi632_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1000000>;
> +	status = "okay";

Let's keep an \n between 'status', file-wide

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <14 4>;

Do we know what these correspond to? Usually that's NFC eSE and
FP scanner - if you happen to know, please add some somments
(following the style in glymur-crd.dtsi)

Konrad
