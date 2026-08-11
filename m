Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C45EEC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452612; cv=none; b=HZGOGuvDM7vDWiAMpNVyqtPQfRyR9UNn7pgmEEXNncqgV1G6t0K/Yv8HjnH7cG3pwzYHQe6rTihPK1rkF97YFcGSDfkxYWM0pyyIUz9MT7cisDtydx8Yl9mczKSefk44Yk46Py0GnUDygdP1EhR39Cd6M4qYyoUKOKb+NPd0bOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452612; c=relaxed/simple;
	bh=2OcAgz33248GamsAfDoB2Iws7P6zHsgqIJllr4DM0+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEx8StXMigEpVWIZCr8nJwFArbToGkK2xwt9U4zV/S7aimMV3wnp+6nAtL3RZgJBSUlhEXx4iJLc7nBIGNKdBuyJvWq8MybGpd3u0IKFFYb8wrlvuks2UGQFEborrCGbIh8mSA1ANV5AoJ6SrLZ2Qv74XbI7gnVSXqTxtkv2Q3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DymhSDYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kh+YQ3J0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DymhSDYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kh+YQ3J0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRPmQ307154
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	097edRWsiQ9Z18NqZZRnbThudqXeGVr6Y8SEWPWOcbk=; b=DymhSDYznOeoHwQT
	viKpMfkGO2bbXtZgPt72DgA1smMz2+d95n7zPw0cDPOGxas0Nkr+kNUyCb8cyAp4
	bGZrjebuv4jak6F9Cp0zX9T5ScbdgZOJnVS++0UEv81oWwfJxSJewJuVCaujd6yU
	kUz9VoxiYWkY96MsOrlt24NberrmyjZjShiQU1B9D1V9BvhulWV3BVHUDqVYmlsx
	hpQ9Dr0nTCs+io6m8LSUXbwg6Ak3hf4cBfqvI0Fh+/0I5jDMrhD0HQgih4UIqSou
	E2ImRZDLOkjMpsEPzrCaYxksSUlTy0E3Ovf0UypajelTIA6h8kzGpMIoxcHIaBxU
	vN1C3A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjsm651-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:50:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f7002f9afso2950802b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452609; x=1787057409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=097edRWsiQ9Z18NqZZRnbThudqXeGVr6Y8SEWPWOcbk=;
        b=kh+YQ3J0eEEhq1Mw8NzHcifYATdiFsMQVtOWm8I50iboPqwkNc57hoS4K0Mqw/ATse
         AGGbDzG/zdhwojL+TSLBeIX5fh7fCRhV8kAv0uz+pazGRWFRopXZZv3aax1IzeAr6ci2
         BhOm3Bth7xIecGbyRiVUKxrUksDwaIvM5fjKV0NBJFNedGbb0FwNLz6ruNnUb+IEKBLY
         bq9T7V1dkO+kx+OxwaozCiDnYQ1WkPhvcHaUcH7+V2u8K8/wY6NBRDMAmoRhwAI3QC3d
         JiGqHZdFCSFGpgsos1i71h6vxE0RDBzxBgq/PfExY2OQ7aXbvvtw7AuYTogWhset2SlI
         y7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452609; x=1787057409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=097edRWsiQ9Z18NqZZRnbThudqXeGVr6Y8SEWPWOcbk=;
        b=e4VD6aYGHlJH6l2SP1Dnr3NJYQ3PSgwlIfeLjCpV8C5PDsBXMbFkMMTBHt5xGQcD6Z
         SZMeYxFUhcZH38exm7nFWANywS6RP/Whi//eHAQ9Qd3jKl2dvkOcvu5jmB/+g+XKFWnQ
         OlodL9Q88GSP5/p9w/MJic2DVd+FKI2ePZQWC30rrUTLZxtF116r7gzSdk5eYMPo+6K2
         LCFrYGUeaq6+GfukJr+qd0GI72cyApNJTRalFQuJj8Ttw792iwXJBE5xZ0Xles1yMtC8
         V/658qy027WHMhVbo0802rsSTohrwY2iZUtUUAp8XwcIe6R3rN224h/ROLDJK9daJnWn
         3Tng==
X-Gm-Message-State: AOJu0Yx/fsf2qYNF9yym1ag0JtU+z0a1BSB9pOKDIRy5fR9ts5Ov1M7j
	4fVsDgOINw3hZ/ptIsonrfrhgfTh92BY5sTZg9UdDMIUrcEt+EySbzhoIqogHY/SnakzCohgVFT
	qnO+7qKCd/BzV7MFL+kS63M9h0sbUQlAa2uZIUYvKw7UMnnDcM5xQtV8fFEhdhWscnHXn
X-Gm-Gg: AR+sD12sjAr1HbZZb9+E74OsvCQsLMB46j5UMeaveznxo4znq4wQymNqs7tfDKl4Di+
	xS7owrtCtdAejxtrDF1YGBADocglP+ZXvUk9fEG5+MFSNBmUaJtfbm5DHTPgUlAmc9nDnIwv6sa
	c3yprrRCYnf8d5FKlau1zmXuSkeLms99Azv91GmoJx82v9zIJqckaK+rPJmbxPiSN1MGeu03YMc
	JJcjvJfy29eKZumd+rO4xgRhw2TZaKBjY7vM7taHNXvqQGCERsUBeyh6JZT+MlWw8qY9ciQvSm4
	BeM1azLOodq5Fk60OjnEl2C+oLPqZ1DxyrKV4GwZHa4pg3zQdKnInd4kVjsdEeOpB9m4UBp+XRI
	D5x/EFBT4GNdl4BYGA3iEdKwYifFQYKCH7e5lcQw9YIxeHAIPqoqNNGI3BdpkITZfUh9Oieyi6X
	aQSQ9oVSIbw9RnsgAe5c+THksFHZg=
X-Received: by 2002:a05:6a00:f0e:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84fa8840175mr3319464b3a.22.1786452609251;
        Tue, 11 Aug 2026 05:50:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:f0e:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84fa8840175mr3319391b3a.22.1786452608686;
        Tue, 11 Aug 2026 05:50:08 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa959267dsm724538b3a.61.2026.08.11.05.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:50:08 -0700 (PDT)
Message-ID: <176f58b1-5115-4693-a019-15eb6a9e6c76@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 18:20:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
 <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfXwcdREKqw/Fd2
 L+RvnfpMtXcCn+LYBvuM6VVOMzP/ihub7NxWo1O+5dBhB+Wnqfceia4LxNjgrsR+ZxL9TnFLHR0
 IknDlPuFug66CedPhzjUZXfDbN7zP9c=
X-Proofpoint-GUID: 4SbZaCPsEUD4AtBe3zs-I1UERjqaL_Ik
X-Proofpoint-ORIG-GUID: 4SbZaCPsEUD4AtBe3zs-I1UERjqaL_Ik
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7b1a81 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M0gveGMr4LHezVfZ8vIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX9b0gHIiBf2EQ
 p5vZ0Yg+txlM7ivK/QVhkPUbYv7Ge6vHjwrYGC/S7o3hrMENlAST8u2xkcxLMCat4tm91Gw6I7e
 MqD/FMbDBGybp/AfQiV7jeyl/wrcKaD9trtL1S2a2NtyQuqoH9GqJZ4I25X/GakjVzSJxDKhRxx
 ZJW5qtDFKbOVp/LGGq0CHMDVUPrtVkVxw/q6SDa5EMrmXybO5W2/5Gx5231E71O4pUuNmQvH86s
 E26pYcvWhF59G845E4l4Qx3NpvGdsKzcgkaqoCV07hj8jqQHJB2ZC3tg2u/i3F6ADdPqcTNTWL2
 vfsJDCV/WjLrRho46G/YEDnU1o5+Gw1uLc0HMtPes+atiggSwbsNdnMV5sUPg+v4c4wbgbV6Rwh
 HP5oIAyb8eIW893W2Kxi1jbgdwEzO6yfbR/Z50pW6usts/phEBZsrrDf65+WobaFg6/4arU3tcW
 TappuCXT8lk6zXnAjuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110106



On 8/10/2026 2:59 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>    - internal eDP panel (samsung,atna33xc20)
>    - 2x USB Type-C with DisplayPort alt-mode and USB
>    - chassis HDMI output
>    - chassis USB-A host port (usb_mp multiport controller)
>    - internal eUSB2 host with the Elan fingerprint reader
>    - NVMe SSD on PCIe5
>    - Wi-Fi and Bluetooth
>    - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>    - Adreno GPU and GMU (Freedreno GL on Mesa)
>    - audio playback and capture
>    - real-time clock
>    - compute DSP (cDSP)
> 
> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
> 
> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
> glymur.dtsi SoC nodes that are still in-flight; those series are
> declared as prerequisites in the cover letter.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1039 ++++++++++++++++++++
>   2 files changed, 1040 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..146955de4606 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>   
>   hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 000000000000..8d0fe276bf83
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +#include "smb2370.dtsi"         /* SPMI2: SID-9/10               */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +/ {
> +	model = "HP EliteBook X G2q 14 AI";
> +	compatible = "hp,elitebook-x-g2q", "qcom,glymur";
> +
> +	aliases {

[...]

> +&smb2370_k_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_3p1>;
> +};
> +
> +/* SID-11 (smb2370_l) does not enumerate on this board; keep it disabled. */
> +&smb2370_l_e2 {
> +	status = "disabled";
> +};
Please drop this hunk. smb2370_l_e2 is already disabled.

See:
https://lore.kernel.org/all/20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com/

-- 
With best wishes
Gopikrishna


