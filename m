Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF042902C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439996; cv=none; b=QCRKL2vTA9hFjCx1cJ3TA52J4e+nG6wa9khpA9gYeLUFMOttRyIQ0nP/3LudTYW6CGddg16W6bdDw6Oz/glQOGmCZbqAth+2Mj2DmLmRIg7yHG2BwziUkN4AB+ikLSnuVEDSTRiD6h3/JvzrAsPPCLTFIHw3ZlFxIL7IP5nXdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439996; c=relaxed/simple;
	bh=LyUpJFKfESBHuLkCIiDNQZkrg1ABi7qIcSdkqeBKKZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0ulS2+dLVTSlsChFShGQ6X0tXAKXi7fwmNXTtw6Eil3aGYBT+FMNriTYchSebE2szWEd0cDFFWd90vrqMZx6wJX0Oj1Y7wlqQhOiLg/fxsIyXjbB0oWg1nCR9VGcKfG7X2Rbjv1pOme2IxRghxoXCSRkDrOu7808OzSeL2PT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4YtsrcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX/rYETL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4YtsrcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX/rYETL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7I8fm2687118
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vQMbBYKosM4bhsnucZvfevVV
	XwVTm2ddA2HEncy5r1Q=; b=W4YtsrcHS5KTk3OmKdZiG0dDZeKyHSCayC7uSbQa
	4kbmuzC9iyeFHwOL8eyaQ3soKvYupucQuYXK9g7ydYuSxArS8/PGD3A6EjQqpb3i
	cM5dx3IGYVls3S6Rnh0F0QiW+/sY121CFnUp2n2zLkClEEUf2BSGJtRXUplJEG14
	suxCPa/huS+r9UyQF5ixOXViFu7lus3XVJKBqGnDSf5k/vpZ2bAGpTd75VsLu+38
	6NCGHbtlL4PTax1a1wwlrB/Nnnmm+zqq+j8rpxlyBO+D1P3+N8IcnNF9foR8mtJn
	/9t3gENY3yZpa5uH4znixtbqTuPyGWCgdn/WpWgjcnTakQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjskfe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:19:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so26589041cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439993; x=1787044793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQMbBYKosM4bhsnucZvfevVVXwVTm2ddA2HEncy5r1Q=;
        b=jX/rYETLNg5KV2nInv0LuXHPe47v5L9JjbQixcNTheyvQmPZRzRy+KtUIFXJGjMb3/
         EuFFGiI5qO7vti0si/pt9OdIDesn6WWU/1JHUEbrFRNyqlzb7gRiaegdx1B5OGCwjz7b
         5DMJWmA1hl1WXxb6n/VupfyrEXYu7xAPwW8KwwTB5wRA9fLDEziDTwnQg8g0QH7pwWE9
         QUL7WaFCVKavgWzic6nNFVBkbiyM0CF0BvQwjxc+uzbhWVNwmr/8Bb7w4wkj3AHFTrms
         Yfux6UwPcCU8/M8/WSsCXD5MZquwmYxXsrtU35an1zxyP9omFdsmoHf3qKZNbFGHyBs1
         q2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439993; x=1787044793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQMbBYKosM4bhsnucZvfevVVXwVTm2ddA2HEncy5r1Q=;
        b=fwNstwQZ/d1u6KV4h8IClMv135Slh6P04QeSpaoASvocb0cZhJYHcBWjWtsikQwoRq
         dlO2pi/E3ysxlEmNgjQP8zm82+wIVrn3tfGfUngxUb+F6eSPqUWRuAtrBlv0HJrNMGpk
         WvDpbH8KlY7WPurht/MXRc9MohFVezFkSz6yu/ZL508BXN5QUhhyCck3ndkt0rU3c1vA
         IA+/UOMf00HfdcyUNVFxSO1gdODJH99BiTgApiVh/joF+4126gv4TM1NRwRlrFo1i8rK
         Igf88xg8poZSgbiGWyf2TsD8fRL0bw7YKpyIE1x1S+s7fnztKLFlOkj1DdaSmSwOw2s+
         DKxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW/9tPs51iAX9J2EksTrBEBlstx3rdZKxM7U2p3DKuimwUN82H5pRnsbbH1hN2ItFn0HUepmy26zdL/qa5@vger.kernel.org
X-Gm-Message-State: AOJu0YzRiiw6ZyWcfY1oY1om9t9osdeT2tRS2kJQHq2YwlhtrQOwz6dN
	govz1BGSMwcua8uRoY7FUHYXULPwhNEOTxmsbNPcA77CI2HQ00PNst4DviuItIgragV4JSJkkjx
	47PJzT8Wr+/X9drxgHQvZc19ayLYZvCh65qAxoocjpvld1iosKru1dKPyntltd6J+9Kum
X-Gm-Gg: AR+sD12QVxnU635hSfUfMFIx6shoYY43G8e+5f/OvEovWCDwJpIDtOeJxr2LccvZw72
	c0tWXNJREDB1kLp8hnms3HOWXOelMNvOywQn1pf3ETufcSR3M4u2dXv9hAh1YHiE413u7Fu4Ou7
	dfrDeYXN6ZAkKVnOjZku9OdR/ngiRpLVUUUeU0nasWFGW0l0uAMx2nX1zbQ5IXDCM/U8SW9IDmd
	S/KwUtON7ognoNB7IDlkelhLzTHueFCbCuGzpRPJIMf46os0+gNC936T8QdF6ifXiKJwXtecaEH
	SZgUOqV8LEd8k+A7xN++NblUiqypihfg5UvNgNXBlB4AUYObJuVBcr8QRatAh1ueXA5oZbLcSb+
	Xmf2U35V8uG2WrxMy0ER/i6zxU8396UMdd7U8YpanZeuLpTcliX0UqAe4s3YFEh6tinPcvoaqrZ
	auwMAqXyLcm4WDuA==
X-Received: by 2002:a05:622a:a18:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d585dea65mr14209651cf.28.1786439992845;
        Tue, 11 Aug 2026 02:19:52 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d585dea65mr14209461cf.28.1786439992397;
        Tue, 11 Aug 2026 02:19:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872d9d1sm162976e87.60.2026.08.11.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:19:51 -0700 (PDT)
Date: Tue, 11 Aug 2026 12:19:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Message-ID: <6tyswguhuemcwmvkcuwd5ssk2xj7s57cufogkzk2jgisnygqos@dwvsicvnylf4>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-next-patches-v1-7-79a779d76173@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfX9DOkrXv0/3B/
 N4sGjqn5hofHJT10P4nc4D7xy4TSEtU0QDKLhtDRNcRqGKAGmisTF0xq097qmCCjahe8Om3LjVI
 r12LY1KdKfc9dtscFh+/ApIFNDLFwq0=
X-Proofpoint-GUID: SRZA047BEl2DLVdROV2J4ge-CPC7PW8O
X-Proofpoint-ORIG-GUID: SRZA047BEl2DLVdROV2J4ge-CPC7PW8O
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7ae939 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=8dPnOhcq9ZKN02hjC8wA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfX00s0dct2D2kb
 H87I46x1lC13h+kQbk0pBRZrTcv3ULPHbkDju5mmq7lSnz4WdmtDKlbdPVXcflgI3TWRxZvIVzP
 qAA9jjkimwBa0maxwHMu6KYYDIUUWW0sXEEf5Q4lDNc7OLsdYMg+y9ZEns21Vw1ZcGyAN8ElC1m
 lKd8/mT0v0R83vzVzx7X2pJdhKRuecp8g/h84D2PWsGLyGSzRA9KjlyKDFk+aHPmUGbGYmR0MqB
 b8xljWaLroY4rb0EM+Cyt9j6aHZlWO7UQnMyjT4ODRyPn6TI4O9avBBA/9hQPKZA7UaQXhH9R9U
 +N0mEi/Omnb2SdaZAJdynudn2DOTNplhO18dP78za3qK/Jk1rZn0tUJq3XGqXiDKcpQ6TMlaZCN
 R3cMFvijDJRDdhaMeek1JnDaWgcoRzCmiEkVEHV5jdf9PK6K4yNVdGbB/pneJeywF+Cw2uh6AVR
 2hYLIKNxWlbAqkDn/WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110076

On Mon, Aug 10, 2026 at 06:55:40PM +0200, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.
> 
> Supported functionality as of this initial submission:
> 
> * Display via SimpleFB/SimpleDRM
> * GPU
> * I2C peripherals (Backlight)
> * Power Button, Volume Keys
> * Regulators
> * Remoteprocs (ADSP, CDSP, MPSS)
> * UFS/SDCARD
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts | 440 +++++++++++++++++++++++
>  2 files changed, 441 insertions(+)
> 
> +
> +/delete-node/ &pil_ipa_fw_mem;
> +/delete-node/ &pil_ipa_gsi_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &pil_adsp_mem;

Keep them sorted, please.

> +
> +	vph_pwr: vph-pwr-regulator {

Nit: regulatur-vph-pwr. But current name is also fine if it's an only
regulator.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +
> +&usb_hsphy {
> +	vdd-supply = <&pm6125_l4>;
> +	vdda-pll-supply = <&pm6125_l12>;
> +	vdda-phy-dpdm-supply = <&pm6125_l15>;
> +	status = "okay";
> +};
> +
> +/delete-node/ &usb_qmpphy;

Just 'status = "disabled";'?

> +
> +&xo_board {
> +	clock-frequency = <19200000>;
> +};
> 
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
