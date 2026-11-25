Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612794;
	b=iGEDQ4iTrvIMzbTNUhoKdLtQRTrGEN8IJkvATqrjuF7fJfhdb9MtVcBQzCUdoVEx+nZj
	 PcIdavFa2nd+x9EXHk7psEoYp68oImFIIFDAPEJ/DUhyhm4DUCwAM7Hq0VVojbuRwg2iE
	 /5+990vmPBAqwFoGJMqtzN8XoqxjIilzYb1xwWyduoz33Txn9P9dkUx2FNpB8AXGZAB59
	 A4z5rVeOTRV2Q5B75/8MK99Y4DqaJuewrcbU4SF/D67dBcRzMssUlAamWZCeyyRFjnT4c
	 SQgzb1zbAUK02b5yi3LBVuLvKy1A14O9zaLWoHM5T8COedDup4ySoGyjviKmnhIvkTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
	b=cBkNuqKDADnMN6w5afoMct6hbZWXa1jaouWzNjKwCyhsHh41IPDnVFi0okfd6k1OqAxd
	 4D+rve4yr8igDxDJzcFQAirUQpAnoAc9YqkSdbbT5tJ78YoMhfOqvWxf64i7qrErxRFJE
	 t1lJR9bkZWem14ddav35Ud8Oi5mYXH50geyuZDgduAaBoAGRgxOXdxotLgvGERgVEhKHa
	 bj9A9kbInt+baDLJdDYZVtOIo1dodR5cSpbhkap7ItmZBy/Z7CC2JqXzwf/K3k6bMG0nk
	 sUsoKp6P8BUvsNcGinPmGPL2OqHnXJ0XauEnXz7BawP4Z/1Rg41LVaCgvbjk8IKZtmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ILuQghNM;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9B606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D9B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ILuQghNM
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfe7a31dfso4297991fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612792; x=1796217592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
        b=ILuQghNMwvkL0bm9aeT569/Ym7SzQa4pqK08RYBZT4EzBUF2+k8lhxS/smdjZKhSRF
         JBy6h/wKV8UV4DUaR/eJqD4yozp3+S/GMh2WTs0aM1OXCyQ8KGS1MDCorERJ3bq133Hb
         jM01FDGQGFBWbrkxjCqI1geFLIiVRGznW5blhrWgcqluY9mjPoJ3gl5PrKe2pCdlSRXL
         K/+VqRmkWzjBKf6WJvM0ateaBp//iCaZVvpp3S8iK5xqH+Y9mmMYpXlgk1pm2D/cKUnC
         0TSfBL6fE6kGdixXJk8f710+rW4pyXpxPko7Fyi3naHt1zaynDac1j6LsrnJFYZD53hu
         Fk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612792; x=1796217592;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl956CFnusiWXQc3uAwBS9T3Hg6fgxOgNH0XW3/nmQA=;
        b=L711XKwatTJDqpae8LDCQg43Yx/ovYfQ6vUuCExLMXH7NY3ydpc9MxM3SAd54kqpSb
         57O3ye9JEET6RBWPD19BEGGlM9DwHczfD3nC6LWe3wBAA+DjQM7HYHG7J8+ZREhPbV/r
         h4wPgWsOzjz1imSFgEzsq5yGGABYFHsGt4i0Ko7XimOhDJsgOnPUMterEPnVJ6MIGgtc
         muCXJnZzgBaATfyiVLqBCaC+MDibhIA5bvB7eA5LNWwLbQpYY70YBaSVWlreIS7JKrtd
         pN0BCG/ZKClu5fA3lLXedN6D3ZNllCmsqBjqo2J8+kgwywMxTUuBm3zlkeHUvkGs69S9
         SNww==
X-Forwarded-Encrypted: i=1; AL+hErGqBBeKwBv90ROAxiBnThQIAngqyDPMFjBQ65fEQr5cQVtNv8+xks4o+d3o6glLeVRfYTlwuXhsvG9GLFPU@vger.kernel.org
X-Gm-Message-State: APuU4Z+j4Wt2HEPbS6+hSNBou3sAeVjvaeJsDxWlpHejAp6yRaLYUs+n
	FkGEYVQi7XpVpsivKytpBRbszcIcWik+WCu6WlzcOZSwcppLd2jiYMsHt7XM0XRo1B0=
X-Gm-Gg: AZFdTZcXkvd9a0hy7OIGfaEugQBF5GXx8CHcFzn3KVc1s8aPWgNHBxoI9IXgd/r6ahk
	cKlDqgkfEm3IT+uFNeFGydxeSShkDehpe69YOkPP8NKEIz6DUETSbGUcpKKOb6pY/X8bB7Rwcb0
	NLVmO6xRVMM02O5ZT/NtE8S2Nz1ArNwyqi3SUG1wDLs6lIHAhCpXpjO3Cl+PHySxQp9rHj7nWis
	2zCz+PMW2UP5eAVbgdlSglamtLw6LPnzuPVu5KQoRqX2KOGwEMrquS05jm00ZVR1K19v1l7mj8o
	mycyv9ktT0s1R1BVnoGMy7w9hCRFq0xd0rOQOk/Pz/baWIrzdmPv6MBa5uGlTWEvi5VmGRI32OZ
	go+hmlIfxyoia4RFR42T9PpFclRjOnzoEAkxl8kki7roZIfN4rBBJLJVWH2aUT04P2oVotLSIZg
	k6qTIhNJ/q5Ocl7+hGSDsfigzaSdVC7KpQyLqkOt7iyvxS8zo8o8oovN5wyWmGouNoxXFb1GF3l
	43RrbGxc22H+RdRc4Dono/czbuofwR8T3XiSBuDoUepk6u7WEeiNVNUFRyzNTRSUCse/fErrT5Y
	HIRSBGVQZ+vbK6N3JbN1dq7bF5w/qUFN9j7hKTbP5+Wg887hn5NiHcIUQ3wqw/lu+qIzDchO3vo
	QvG9cOzzyuhh8p9se2IyEtNRujkxZ
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id 2adb3069b0e04-5c1bc76a33fmr7069607e87.2.1795612791602;
        Wed, 25 Nov 2026 05:19:51 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0177f7sm4448777e87.33.2026.11.25.05.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:19:51 -0800 (PST)
Message-ID: <c4c72389-2a8e-4278-8667-cdd4d8f72225@linaro.org>
Date: Wed, 25 Nov 2026 15:19:50 +0200
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
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 11/14/26 13:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 72 +++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index 75927e1f7b9ab0316781c64dbcc82d3394c414f6..c92a1f3c47bd5cbae26854614682c3bc7daa0398 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -7,6 +7,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include "sm8750.dtsi"
>   #include "pm8010.dtsi"
> @@ -858,6 +859,70 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> +&camss {
> +	status = "okay";
> +};
> +
> +&camss_csiphy3_in_port {
> +	camss_csiphy3_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy3_out_ep>;
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	camera@56 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x56>;
> +
> +		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk3_default &cam3_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		vdda-supply = <&vreg_l4m_2p8>;
> +		vddd-supply = <&vreg_l2m_1p056>;
> +		vddio-supply = <&vreg_l5m_1p8>;
> +
> +		port {
> +			s5kjn1_out_ep: endpoint {
> +				data-lanes = <1 2 3 4>;

'data-lanes' property can be removed from here.

> +				link-frequencies = /bits/ 64 <700000000>;
> +				remote-endpoint = <&csiphy3_in_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy3 {
> +	vdda-0p9-supply = <&vreg_l1f_0p88>;
> +	vdda-1p2-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&csiphy3_in_port {
> +	csiphy3_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn1_out_ep>;
> +	};
> +};
> +
> +&csiphy3_out_port {
> +	csiphy3_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy3_inep>;
> +	};
> +};
> +
>   &gpu {
>   	status = "okay";
>   };
> @@ -1081,6 +1146,13 @@ &tlmm {
>   	/* reserved for secure world */
>   	gpio-reserved-ranges = <36 4>, <74 1>;
>   
> +	cam3_reset_default: cam3-reset-default-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>   	sdc2_card_det_n: sd-card-det-n-state {
>   		pins = "gpio55";
>   		function = "gpio";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
