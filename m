Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45F4F6488
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569601; cv=none; b=HTYdOY26pMPwMfZ2fq2c+f1LtLFyvNmu2djFG2iJkg1hXgUEL6aJD4yXyGzW5+7rW2CzYs2YXXlx/N+teBYes8x/G/0I9bUu41IsjFIoj6Vx8y1gdRliXOn7ly/reXBHVoBw+h9m1XmlqXcQAXIIfIUBq+zoc0W+PD3jLjYvr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569601; c=relaxed/simple;
	bh=G+np0cc0It8i302KUloDocttjC0x6BgQYbU+cAG/nt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWR8Cxjn76OQCuD7Sf7WAEItUtyPp6Bz28lXp1CHYT9byGroTTKgeUGyBUTb9SjdaMXGEVfznTfugjVkdmK6CwvrOCjCmn/gzug8O8XxcyFMAFZpoLUhbVxRP6TSqb6RWU30xOYOr1pis4kgD1MCn8AoDh1iyNLg8tWnADTRHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmbpbGf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDZ6k1F3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmbpbGf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDZ6k1F3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYVGu2279296
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0oZAvYtD/3whDsCwaeMTxLwk
	6ROtRTkdevulCwSPy3w=; b=fmbpbGf6d6GKMkaSfdm+GsDbA4+vxi6oxOUStNxB
	a5CXoDbNwnIVIK8GjpT78iyZqM1N4LYRmu6tcst4CyETZENTH0+4N/xRBleb5EwC
	AGPi7jhmo41dPKqiz6110CUg89EZxbrCohzXClrRo/2t6S1gvbbfAkXo/WNzt9LU
	nPHpuZfiLEUlmZqRZsKR3RGqXv4GDwXR+xv7/ePF2hgy8rfk2adv7LZ3MictB6fm
	s7fwmr3umQgyGkoo9rwLYOf53q4NPFP83jmYqa6mikJ2aXCYJ+khY4YwuhUVHrAs
	CsGltqHtTCnW4v87EakeM9UDlzFuXwK3ldiXQUhHExcowA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnrqa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 14:39:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so2083397a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569599; x=1790174399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=VDZ6k1F3pRgvZpcxW3VFXlXxgzSO81RwsB3R1Pkb7bRtuKO9A4Jgdf074bWJWx0WLL
         8BeZ/lDtv5Szzk28pIJa9+CZQM0HXY6EgOX6xL7R5wutyXT9hWRK3kgemCyj+/D8FEBy
         /7OxRCxBXErsHbsYPOZHjomnkjNI8Ihs/g3T5K9Hj0AeGrKELRrbQmLRciemR747dGyw
         8fPEk/ditzrY7+vgJ0W9KEI/wuY1hJD5AYssZW9DgdqKYD53uIii988pCKFiO4mGacpB
         XHgrXEua/2mjGG8IKRAferHxEjzpq261IO6BRbYNx+7yHozrhjRx7sAEo9saREpSujq9
         bUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569599; x=1790174399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=glxTXxmnt+MnPaX5MDoMlgis41ipQaClQ8cX3Nel+itkdgJZWzUERDxGxccVZNboJj
         ATugho2McrbWTnbV/jOC63mO4W0DCGDd+WUva4VT/X60oJb8eEoJFwHoLYZqeYly77Yw
         wsolrzYkddJ+KR4QoNAEj4MBoQlp9T+ZNio3JoGH+p71+q5aB5BHh+JWvBlRqR49fYu2
         cof4j78kOrm2Tac8pC5mWeq64ktxGHFcwluE5hpz60vbYwcYMjLOYXVmqIllrM14jbby
         bBwN6Rno58yuALyMSjBBiXVv5l4ySxAqd+1dMV0B5edhUAr7SlneDtLrzQENWu6ehqr1
         ZLlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQWP2KxdJYNoUFgL6upC0/FFN0fv/hkj8+5Oed5BJWqG5NoGVKjbZ3ZVKqU+Z4XIznhoYMkDnUc6GKTBA2@vger.kernel.org
X-Gm-Message-State: AFuF++lAllbvHWXoQqeAqrceKgNSlvN8mzGiljwn/Di/MNvZSFq0zZ3m
	UyM+ME6Zx2bViMfO3nIlwM8+Sdq5hG+14zUC2V5LSK7k4dxgAIAYZFdIPCz0XpG/sXvvFz/RLV3
	8wO3X238rANDCXFA9UZLvgxbaNFCb4Cu1zKg5qNgZnzpI8ynncOyM8UW/IQAUPcrcxEh6
X-Gm-Gg: AYBFou04VTJkknqwjIGXSQv1IeHsJFRkymr3bPP8zgZ8l3dzlGd70JfrgAgvbUYqW9w
	RfNC5WFUH9oriEvF3nMn0D5Xn4Fv9tOsLMkCp718mrCk0t8Dd0RUvJ5Ooti/3UQf/NwbPkUPAVA
	2T27qJ9cKHZ9FK8fdNlwjjDnnqbhuwYIHArnbWsDtvY+mrxY7DBUHC8bnVD05v3FPxgTcTXQ3Fx
	4P/nB+x545jCySWZ1OmBksTUcBop+w37H9iv4Vn+Tm4DOrtyz6a9fOBNdXPNvtqG3WNxJPtPsm6
	vU4iAccSME5KnemGRGPbk6lgKOIlFFZrz4zacBc2Yvb3bjHMV8tfC5CRL8C/Up4MJgxztHMaJl6
	7mCLfFWmThYy7Li0dcBybtpxaqY/dHHk424XVmNNnXUs=
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229572637.21.1789569598987;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229498637.21.1789569598494;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aa9b03asm1782560a12.2.2026.09.16.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:39:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <aqqqOMS6QL3gxF58@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
 <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8GKucJcMCflAVxIXLjs043GoOZAVivGm
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaaaa3f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SqxCJjNS5mIqFQWAgecA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX3mDSuzAlmy1O
 Fx7hdHf4a1hDa8yLNZrkmI+gsOHV7cm2uABIKZYRKIl5n3WE+SO28NI57FyNjkr6SuzRsiWM/dy
 HJYNRXJUK4iHeSBDRjjq1fUiZLQH8i9q4+JwEFfwvem664FgRUE31idb4bIcm8Sjur0zhAUE5Q7
 IDggNeBQUOFfRCEGL5luGy7YrtphRR5Db1rgoqEyaQW3ONzGDgnIVPuYok3Uw9tp5ITGq8rEry9
 h/UQEgrY7NULlEr06dHXdB9yQKc+0/HX6Hia2wQzXrvaVRws+yTzBtMZ9kuL4jD3rdM0PiKErLr
 YGA18jtJ8f1E5pN4TImjjeUmt1+/wffvVpAFmdIm8InZcw1WoLZ5DVgeMDvxpFDiAHyidD9l4LO
 N/oGvgUuahANXOwuHjk5JBSgEX181SgqKgvdnb4H2sd+/6Cn1+1wNYcZmkQwjPzckBNxVdwRiO+
 oX4vYoB7yFKbbFzIxjg==
X-Proofpoint-GUID: 8GKucJcMCflAVxIXLjs043GoOZAVivGm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX+xyki6D/fvvC
 KI7Cx6Kj9EjicapTUjs3DFB7oKDPc9/L4hccqxOh5Qkslhle2hCLUtT6a1ExvocTl7Y5ontBJmw
 JJQ2ELI+hbNRsw87/D6j0UQ4jvJCFC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160198

On Mon, Sep 14, 2026 at 10:33:06AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the base nodes for the three DWC3 USB controllers. These carry only
> > the SoC-invariant properties and are disabled by default. The extension
> > for the embedded Nord variant and relevant board files will add the
> > platform resources and enable them.
> 
> [...]
> 
> > +		usb_2: usb@a200000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq";
> 
> There's also a hs_phy_irq @ SPI 908

You are right! That means the binding for "qcom,nord-dwc3" needs to be
fixed as well. @Bartosz

> > +
> > +			iommus = <&apps_smmu_0 0x14e0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> 
> This is a suspiciously short list of quirks..

I will double check.

Shawn

> > +
> > +			maximum-speed = "high-speed";
> > +
> > +			qcom,select-utmi-as-pipe-clk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_1: usb@a400000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a400000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 919
> 
> > +
> > +			iommus = <&apps_smmu_0 0x15c0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_0: usb@a600000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 131
> 
> Konrad
