Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825B559C9A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957987; cv=none; b=eX42D/nWdcxX5501SnGk+BS5w8ILWEAq6FZ0pBW+0wzu9fkgZN6EYpgtlcWn8ZGXhM/hSuo2Tvm6IsTasGrEJ8BfcWT1Lt/rPY18GN9f9rFOkm1Ne96GleI70CfRodig4nziGEpjo9NEpevTIp7AcAxSSuL++hDDQPEyDF8N/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957987; c=relaxed/simple;
	bh=yI0YtwwDoRq46cm6dlAsPClpp9C16ia2CjUjaVPn11M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pT1SUUGYx9jOZpv2pTwHmSzvg3ehm6ozOgdIqWr9vPKdpmrkUY7qQ2sYt373XPg+nYvy0IhQICyVyszeJTLJliZ34WEgNHpnoWQPHcZNLRaKSIQtgfkOAm2Jgtn5qv4WSDr4an2WJNDrGj2n+G/GYR3tdxaNFIGPaFqTbOAs8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkkJeDvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fn43Svxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkkJeDvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fn43Svxq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUBjg1723429
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=; b=dkkJeDvQdQ3LR3Mu
	2R2KM1Rqn9gxAo8WifsUlLYIdBz/yVuTja/aKb4DseodKUcbyr9FCsnAgcTw2rVE
	PdNnFEEdM3JXy713aNWi+Lz+jovQn9zxDcWUp2I8Zkslr1OoTU8K1vL9c6At/RGQ
	+j0HEZgsxELhJjlOOVqEuFPvLslwlrWNwmbJHCv2+/vSFV9DxIQVTSJtHXsk1b4t
	CnDjS9ccmHDX//Y91u9ZhhZj8P/hNbcKOsGJI9vETDw8bbhh0Cjox+CCkT2hJzbq
	d4DoRXwEcsf7b8dS6g8iaDN9odOPE7Au7hes4KNL6ZiXhm8yjqFP4HKrb73APElJ
	lm5Fhg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrk74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:46:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ea2f5863cso54184241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957976; x=1789562776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=fn43SvxqC5a1IYePtyAibLj10CBQTvhMez2KPj0HGMnj4m/t5iO8v/o7zA9b2w717g
         zC4MiJ15X2J6zEldF/AMmkG2ggZP49lJhH8jb8WaQvIt4JYycf3Xi49nftdzh/3pkuDj
         bfmQNwO19uwDkEItEyd5gMm5t4Yv6xWBw4DjnneqB2891KwAvnptvryX8V5OC7EY13KO
         EynIuZ1T/ahkQUiVn6FeFD4yI3fg8+bofetSSynbL4WAq56hXT4V809kwd3UrwNyIpZf
         dVisZmU33lBghVKIF5UKWCx1FopIS+T+kzwJ6EZ84eo/s7tjJgh2BEb9IuA4FHwz0HTq
         6O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957976; x=1789562776;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rx/vpo0zvv0ttoTKgs+GGM/ZJwxjq76fMb0r1Xbs2U=;
        b=gYpBxsHYKqVRftWppk8M6ZZs05Y5UQrO6j6V9kb00X7TrUtY+AWwLZCGfZHTZ72ACr
         K7/brlx1EuKWFlpB33zrFsyGkFy9Wjf7TlWZudU13Al8hHHKMXRqumsQ9V4uu7KYAD2R
         trfqIlBGaX9dYqtShxiZp79viZMywKZ6mFRlOAeKoY7spdh6/SmG70JhoT3GZ8fd0zjt
         vasqE97SGczxNLI1vkNpJt9l0e+BTIHeu7I8VN7ECbwzBMOjT+jV97wrTSpoUYgCcOcC
         FKNMdio04goC/GHxoRZdovSqrgsLdKGKllZMKZNxDZob2H6NUr6UcNkUScDlu8JIBPmT
         8jUw==
X-Gm-Message-State: AFuF++nWkj8iej95W1cl5lIoKiBXUhdml/CDLyQrLV9wVHHbsVJKUkpm
	zlNqI0fTVi2KqIbPKtuhOpVrndpD43A2PectSaMQBNWFpMvJiIBzQOi8VHSiiORqHzdDCwSWoSB
	9bdzvDAE8dZKmqaWA5ksYyPTrKZYrA0n1l+DYQRd2R8pjOh5MBSY5OnTQ5PJJFD+e4RF/
X-Gm-Gg: AYBFou1yAMK+fdcyg6g1BUILbgme78pNEiBfjiuH4F0fJI/b5Em2+wo57boO/Jzknij
	qhIR0Uis4kXh12qeftTNHU4eKg/uXIhQkaZT1l7Na2DJQ3PdRFRaRsLPi8b/edwx0WEPJrt5nQv
	g+0/h5vMKw8Hj3TQ/3fvzprs0hPGzVRJ7lQ/HkKSaiMbF8ORDjUt2oI8H/2X1kuJCmIlHYiMRoX
	iQfRmJmG6OESqNDWYLaTeOmAnoRVFCo3scVr5GpJlb+DBzw7IgKuDdiivrfjIE/2N0+T1g3+P6h
	cdZNdXOs7jNaYa4AzksaLoDUJspGK0AJUTRmCftQtiQ90O19dlQhH6PuhHYITcqDOLgoF0c+aL+
	JO452/1FmTijAVgDaHoJw0Q==
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328301137.0.1788957976214;
        Wed, 09 Sep 2026 05:46:16 -0700 (PDT)
X-Received: by 2002:a67:ebd5:0:b0:790:563:8d1b with SMTP id ada2fe7eead31-79005639f22mr328244137.0.1788957975073;
        Wed, 09 Sep 2026 05:46:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260cb7a18dsm762361366b.0.2026.09.09.05.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:46:13 -0700 (PDT)
Message-ID: <ae3a76d2-9c46-43c1-8521-398ca23b36e0@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
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
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hk0AD5tKQScdQwRiGZPnYo0WfLeMHSe-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MyBTYWx0ZWRfX3rx6u9qed6lZ
 LYlbTqeJfsyUM048/p2NXRVw517CvVVTJxNZ+N6YLvfkT74HfFpY2Cjbo1R6aOzZDzTeIa3L1uE
 NKz0+1VWhHih/CeuWDoj3EgAjzNA3Zo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MyBTYWx0ZWRfXxGURQ5Ao47JT
 epyJWrSqp3TPDsMIMSKIwa0BKuJt9QEuomTg79sMn1gpakbT3AflcO/ybJJt2RyDBGH8/bTaB7O
 1rj5Qejk/OlbC2Gf7JEmTFgJ3hFCbnGGMHuSsGOIJM66xckhgv1kae7XF0aUunDiIKWR0WAnRVD
 A8NadL2gvVZnraKaqN8sBNGoh21JbbfEZ4A1xS5mhdlC8ELQYxn1uKDWYflIjDbdRcF/QDJDcsW
 HNWPyRJailS1YKjs9N4rVm04U79d7YtHmxnstDPVdXW2SfiZvyX08cz8hndaUYYx51vbjxvYOFW
 7J/Z3jE1pktLm35n2uF2m8b/Zj60Y2T/XrVh5ZzH/tGvZUz2GqTRdPhrY8wam1rSRHZeRs6LKpc
 YsFxVsy9ZixKhYVDVJagjOqPqIpq9pMaa9yVydLs0B5lb07cczDYg1U7aIcBjOTxGQyGW7VGSD7
 7EfB+x7bdnGsc1B6lDA==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa15518 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BxjtONQi-ztXtwshH1IA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Hk0AD5tKQScdQwRiGZPnYo0WfLeMHSe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090143

On 9/6/26 4:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block

"x1e80100"

[...]

> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",

Stray \n above

[...]

> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",

And here

[...]

> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",

And here

otherwise I don't think this is going to get any better without
holding this hostage for another N years pending a rearchitecture
of the drivers so

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
