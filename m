Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581126;
	b=j/8LdsXYkIYjeBuvj9nM6Nc0+cgh4xmT9UWjLyWn4j3EMZ5oxsi7WztB80Kxo04NyFk/
	 2KXaf+SBSp9ICyPtjooEZjSlo+qpNnWtdh/yjgCapl5GqMrQh7leIrNnY65Nh5DqU5g+e
	 c9ll8HE0O+bN2r1UgGDgmEHX1CFgyViRp0pZfJj0WysM/nS08AWRHGa5p5rgmYWo07wKT
	 Ct1qSMBAe/NfIvrr19rbCT7kSocm7McmNwS+IGw5JcORvuudvD0L6E7pdJDsmK/GZzio8
	 L0fTPk85P6D8qlWxYnzyDshO/xfvV6snlkCAugtpA6B7ap24q5em+AvNxGtVdJkVyrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BhqWxozsyiUTpFxjsjQmHcLwxXaflg+Gr3ztNQxC8dY=;
	b=BFJDTpImmIOq7zjWH3lTRL/PUlK4uHtnwYUfLgM0cdGm3d1dCHLOUEnr7H9yFVRyRlje
	 Fg0V/SG1xtH/1bXlxYvkc4EnQli0DTd5seLAjPWv/ESyqYb2iF/HMAn4/IBHguwRP9D5r
	 PyzhB/VKwsdXd1mGh4X0aBhCwZnjOk5wZgyhOwkjmeCx1AIHlDZPZINWYQ8KoSCr8Pt36
	 NqSpuoqWpF1JHyFpnBBuDouBy58cCPx6/56HJ63UdGDxLDeh2l9+01kXScTxWrg9ZOVzu
	 nUYSfvoQfqwAu52YMyuFCxsise9KZidxBxIqPr9okMhvRvfqETt7grAU92ldUDOmqdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRznYfD5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OF3EoP7F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715FF606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715FF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRznYfD5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OF3EoP7F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJaPt2139125
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BhqWxozsyiUTpFxjsjQmHcLw
	xXaflg+Gr3ztNQxC8dY=; b=SRznYfD51cmJOHkZCLUn3+fnt7PUT+oKhTQ6wA6F
	YzS59A+bWg3kf2pZ4ZJVjj552V+d+T/6r5pA7LCT39x/ea5a/fTwzhdKrJ3NJ+lA
	NgIsI4uLZ2AFiSTcYDBDXC0NdzI7e3yxr56q4EJJPy2+z0hSZrsanAJKJXUjoQga
	qhrwstwWCHj68BWXP/iOad1jtBC6wVpijn8fc1Geag1aLJmzByWRUOW6kTriNHcb
	u/AHn3uzTc8byCogE1JJLqeDOkeB7kAGfuPai5gy4X1/VLE+PaHS9BH17YDenS4r
	B5YPrvn9JtcXohGThz8jd+qRYI3Rytg/KxN4L4KLCW6Sxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9pa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:45:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so247996085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581123; x=1795185923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhqWxozsyiUTpFxjsjQmHcLwxXaflg+Gr3ztNQxC8dY=;
        b=OF3EoP7F4pr0TF5eWbXsLjB7BYMArXc2ml5BCy7h83Z+MoKa64VVvojWWbWLOs57z7
         6+UHdzGLEwHycYvIA8DHS5ajdWL31F2qTEPbYEBpj2WIVkeDCh3w3HV8GiRcx4+BK7UC
         +VRpL2tqMEYMPECsmmiBTjCBeE8gZUeWEOO6FB9Nkg+PUdYeNkXvOK5THFjTXpjMZLzQ
         jH7Dn9G0XAR1KbqqhEFafwKL8ycNFktYG92P5M2d5JxsmTfjRaxUZe9CsdbZa9Zszk42
         dyZ9LcaA22QjL3O8clu1K8ZZzwWY58/RJerp38MU27Nl+7d/c6InYfU0H6S7/u2hEHHg
         ucig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581123; x=1795185923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhqWxozsyiUTpFxjsjQmHcLwxXaflg+Gr3ztNQxC8dY=;
        b=rQ4Pv61j9jaIXhCvyOoZbeGNMXYayzyqbiuZzdmJJIEWBOAn8cSV+vdzsXr02lW/aR
         4+six+g6UwGOkjaw4xwDVybS83lxA/h0Q6rNui+SCzbv8X/fue+DnKwbSvzu0jVMABZN
         d1ed5fxWuYyrNKm5NA98rY3Hm8GaZaGluS7nREaG4IYY+nippsfUtvxCgc5A1U8wKalT
         Pq0KrwNjaBOR1NhfBBvsoaUCiyogj70KbR4oIF6pLmyAP3YrpCPNSJ/idGsYg74UMpKT
         MjGxGn6IrOEyqRkbgciEJTkW/Yg78rQ6NuUlHdWtDznmZXKODARhZX2cAiSTNNyfl3uz
         +NEg==
X-Forwarded-Encrypted: i=1; AL+hErGzbL864NgCBwrFz76heE2QX0jJ7MZuYzoVSI9w/ip1Zlymk6115/zCTjUmqnXkxlCQ+ZosFBN9WD7GxQEy@vger.kernel.org
X-Gm-Message-State: APuU4Z9JVqnZlo0geMNkkTPfSCCXD2iY+EZ/h/ExKQRGnLP5ZRHG3yLj
	kfUfEMl4H0Htn5ZaFJKQrnu3ZL/Fe8s1BBwM4ywdlt50G1sHZlqSsJF+4xfN4rXw3p/6TnoesIZ
	p7VCF0ms+JrJbxVCD89rxYAmOI8c3UEPe0jMEBciBMdlzt5lpOK+jHUJctU9kXFtAbCRn
X-Gm-Gg: AYBFou0awo3T3WywLjKGIedICDZkznq+SiM/f4ZGb3PEEr0jPCmyHAkfrDs2SWyNxxP
	dT6VyCTmyFE2hgT289eE37BVMK9zbSwuIwGZKrh8n9zFSgXWL4vkcInvtZnO+0HtAqaVED4Op5I
	HnZ4p3iEnD1cRzt8RIak56I6wfJ1rGqcW3lOGJD9A2ymN+fRDBnpdbKYxoUfhsoBhJj6tzLmL+F
	NraVN4WZoiPizhVrlQKw3VomwHfN5pttFHEEx6e/dPv/xb9jf+G+7MAA6CJNeWJMfLTjncyrPfh
	rS9JjTzXnzJ6Aj9oXdsGAiqKlbqrRLZwqO1lXF0Swifg6bLkkobTq/a9pJP9bzNbtdRlqX4g4OP
	grCwOiQjMc3FpeXxsRquO1hO/qE6WMJdwG++V2v3VulFXlMY0EKUhdmLykoMjfsQYndyWmqKybl
	eC/Ax2gj+6DT2EFHf1DNTVg91F3DBaX+91+md2zxk6rUydzHeJk/ThLRG97C78gw==
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr441993585a.9.1794581123440;
        Fri, 13 Nov 2026 06:45:23 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr441987885a.9.1794581122919;
        Fri, 13 Nov 2026 06:45:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f73sm851343e87.2.2026.11.13.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:45:21 -0800 (PST)
Date: Fri, 13 Nov 2026 16:45:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C
 support
Message-ID: <5ykqzqoeywcr2cuvwe24ezl2nxrfrtokne4rxxnkht4yik5lmd@cmt26dcx62gs>
References: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfXxq0Nt8DllOdY
 0sPG3WLnThHv/MU/eMHT8TQ6MGm3xSiTT6g9XQOJ/3idKiO32b2MhcqhRXHfRzGZYEh0A5Yz9HN
 ZH/qHxqBHY2AySsw7E4qEWN7MRfJKFPy7PiFyKcEUlD6BS6waYUhQM1yAgw3pSafJr/bliqUt/J
 8tLrQJFg2YkOq0Wapz5KEINE+KA8YWlyvVtpx0SLTzwkv8ln1BdVujaikgW5u58WWB8LBNiqdVc
 T4jFyt5UUIqFq9hr7EHnXBpnh38t+re4RkR/clnqNvJmND4KgideDMUvZelnO6Thc14espOy2S8
 Oc5ODaamnI1rhqW6OX4fml0atTyaJyCec9aWhV3l/QEv2AU2ZHE5MS2NkLsUfpn5IXo0IvsQ0LU
 Qf8a3ViJfxSam+ZlhOvvonjxZBdyAD+WIHt+Bns8OwDtm4FzFhNztC4UXc0te6lm38PhqDTRkTR
 TR+6R64rQUD1fNGDRLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX0xjU/sjKZQB2
 tKp7I8n9FdDl5opuyb8Ka/X3zWVAN48233BeMaywjdrdWpPraPXfXc//rlg7O35ik43E0UjWEE8
 UiqFrz6dR9amQgJWBHpdq95NZbzFyaw=
X-Proofpoint-ORIG-GUID: YrGy1lF4C_ZNr6Ox0-WgN0-Dl7EGZpOG
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af72284 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GB_fNi9pDqyhg0ZszycA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: YrGy1lF4C_ZNr6Ox0-WgN0-Dl7EGZpOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On Mon, Oct 12, 2026 at 06:41:13PM +0530, Akash Kumar wrote:
> Add support for the Cypress CYPD6129 dual Type-C PD controller on the
> Talos Lyra EVK.
> 
> Enable the controller on I2C5 at address 0x40, configure its GPIO86
> interrupt and wakeup support, and describe both USB Type-C connectors.
> Connect the connectors to USB1 and USB2 through USB role-switch
> remote-endpoint links.
> 
> Configure both USB controllers in OTG mode with usb-role-switch support
> so that the CYPD6129 controller can manage their USB data roles.
> 
> USB1 is routed to the daughter-card board-to-board connector. Add a
> fixed USB1 VBUS regulator controlled by PM8150 GPIO10 to provide and
> control VBUS for the USB port on the daughter card. Configure the
> corresponding PM8150 GPIO pinctrl state and keep the regulator enabled
> for the board configuration.
> 
> Add the TLMM GPIO64 VBUS boost enable as a GPIO hog. This enables the
> 5 V boost converter required to generate the VBUS supply for the USB
> daughter-card connector. The boost converter output is set to 5 V by
> the feedback network consisting of R2403 and R2401:
> 
>     VOUT = 0.6 * (1 + R2403 / R2401)
>          = 0.6 * (1 + 75K / 10K)
>          = 5 V

Too many details. Describe is as a regulator instead.

> 
> The changes also add the I2C5 alias, CYPD6129 pinctrl configuration,
> wakeup-source properties, USB endpoint connections, and the required
> VBUS power-control GPIO descriptions.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 119 +++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
> ---
> base-commit: b7e62b4d28bc0d2f16f03904616da78e4478aa88
> change-id: 20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59
> base commit link: https://lore.kernel.org/all/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com/
> 
> Link to Driver and DT-Binding change: https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
> ---
> 
> @@ -59,6 +73,68 @@ expander3: gpio@3c {
>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <86 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +		wakeup-source;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status = "okay";

Drop

> +
> +		/*
> +		 * connector@0 is the USB0 Type-C port with SuperSpeed support,
> +		 * routed to usb_1. connector@1 is the USB1 Type-C port with
> +		 * USB 2.0 HS-only support, routed to usb_2.
> +		 */

Just add /* HS only */ to a corresponding controller.

> +		ccg_typec_con0: connector@0 {

Unused label, drop.

> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port_0_hs: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};
> +
> +		ccg_typec_con1: connector@1 {

Unused label, drop.

> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port_1_hs: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &mdss {
> @@ -74,6 +150,15 @@ &mdss_dp0_out {
>  	remote-endpoint = <&dp0_connector_in>;
>  };
>  
> +&pm8150_gpios {
> +	usb1_en: usb1-en-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		output-enable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> @@ -94,10 +179,33 @@ tpm@0 {
>  	};
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio86";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	vbus_boost_5v: vbus-boost-5v-hog {

Should become a regulator.

> +		gpio-hog;
> +		gpios = <64 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "vbus-boost-5v";
> +	};
> +};
> +
>  &usb_1 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

Default, drop.

> +	usb-role-switch;

=> talos.dtsi, separate commit.

>  
>  	status = "okay";
> +
> +	port {
> +		usb_1_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port_0_hs>;
> +		};
> +	};
>  };
>  
>  &usb_1_hsphy {
> @@ -109,9 +217,16 @@ &usb_1_hsphy {
>  };
>  
>  &usb_2 {
> -	dr_mode = "host";
> +	dr_mode = "otg";

Default, drop

> +	usb-role-switch;

=> talos.dtsi

>  
>  	status = "okay";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port_1_hs>;
> +		};
> +	};
>  };
>  
>  &usb_2_hsphy {
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
