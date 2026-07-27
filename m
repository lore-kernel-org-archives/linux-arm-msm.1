Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A0C374A1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163642; cv=none; b=FryLw5fKNw4SIwwLK3YW/wga+eiHyzRspD1vqPJ0k/lsRsfot8x6vMLv2GWq/mIc/bP7AIS5E64eWPSjidzXQ6QaDVCCTj5VUY1bKGo+MHCpDZcfvK/aebA+i/gf6+RuUG3tuoZ7nGi0JfnnQbn/JgJj2msV6vjLZlaTcb+tjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163642; c=relaxed/simple;
	bh=ZoOBAVuzzUEBayIY5FdUSy9hYrqYBElShK7awRqiR1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgsgsEQr3IBIYnwCDneb49D2cjr+TQSPSR7MPeS+aBBVv1ArYmtx56VoXo7JrC1DYy5on5uac7WwokZwxdiDf7+agd5wDbC2nm+Hip3jp/EeNElkPRmibl8LNPqF36MU+0atFksjiZedjkkgD8HtNOliU12r94x0nJtLFNVKlvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUHR2G7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ir2JNFld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUHR2G7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ir2JNFld"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlTxe4065529
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=; b=SUHR2G7WyeYlRs/N
	i4tIA7dNcavko6rq+jD9hZSjYgVa7ATMqsUANEhi0rQay9ruucByCUtamjl7/AKh
	4C0RCJv9c7Cx6wHPh2bMoz2SbVpp4gOAm7jd4ugwbNsY8Igx8d+yKL/mjdglNlr3
	PDKIEZC9lCDPWO3+HxzzTzf9UWC8tHteaxZtc/voKB2amKnaglZpEu62Gs1SZgTt
	fbv+Gx16xqfW4Pnhf+egZ97LaUwj4fYXZ6GC+JtnCv23Ye5+J22xIfo6pFySAFs2
	drZqM/WuoIxCMGc4Nn2Z8V58uxTsJMxkvVtZfNlB/Y4ZYypwSDCH86V+GPeycfVy
	H01DOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuymw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:47:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso8096385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163640; x=1785768440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=;
        b=Ir2JNFldLbxo5KUpTQenW6w8/V7EWMTV7ufE3MK7O3FQXuSb7LDpDHrLIXhOp5DUJz
         HBOszbNtoeDPLUkViSjtHTRkC8JEA5j4EliAa2tKRPy0qn5z2mdAK6awN6rZ4MrBFRer
         +q/3uEbIsy8JgwZfvomV/nf0U5UtBzqHZGaoHokCbVB60rDsusStf4JmHeyZzIQtPnNO
         czzY8FMnn74QI6yrghtKBcjnp9SFn3FjD6irh5gOU+ATyb8cN+t/lGiey686FZJuFbOT
         Bm2lUIaWyCoXBlBohkI/JZYo+mfhzEuGdj40MK8kMCVaas6VLWG1XKyMN0tO4DUlyMYo
         Sblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163640; x=1785768440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=;
        b=f6wockcSrffMF9Kkyi1Dl30npn6qtUfv3+/OV/+rCxRq+hGyfnsnTPRy0rVR2fXWPF
         ZCBSNCRcXQPZIfwt0MKTx1PvqwjWMry2ATrUHvHEq60Ueb4OJ1yL3UUTeI2JYBRARhPi
         2633DjmmxRWGKIqiSoIdYosiCtzB0BqEhVdrCzZwfRdWBsKYkpWmbkM/h58fSfjacyIB
         PN1Pz42jBuxjRAiMC17dQF8AGsBzuWUeBkR3PtAeciLVXvHsJq+Lh4cJzZJ1J8DeBcbD
         QJR/GA4aaT6E6TaCPrO4Ui70UDLYKQ9VBjEmhttDDJ+VeSBvE9ouB+FHZgUXaRaUDGBQ
         cRPw==
X-Gm-Message-State: AOJu0Yxhxd1lddlNDsNzIFvZ8tcu19j4iAGen6imIMS5euf0EbC2NYGB
	c0oHqs/wsVxsbhrRrT29zgWBvla49Qldy1ggzp+ePsTlCt3mcrgU1C49UJThGOMzUIqfIztWeK+
	P3P9B+62v8yJAzUSr7K7j/jiLsezjnkAesAnZJbk4Bp8ysfsgIgC0P1kKV1ruai0cZQUr
X-Gm-Gg: AR+sD10gFKNL4wbXOYAsqswyrAA8F2uybt7achwP2FIpsdnMg6LNqivjDX2re1nHkC0
	rM979cYpKjU0sOQRzspFwbwXERd/Gw64DwpYQb+SKeIV3PEqdxoNZmA9Hhg6vtIqhElgxdZQM4P
	WwoylTYS7rEtiGAoZCiB92RKbGB+45V7UpCGVxkrKtj/OytdAk6jor/1ahez4MLnuSGHKO4fZT5
	ba1Kvvg7n5bMc3xUvuugKuiU2DrT79kLD46KLxDc1QkzZkzPk7u1MAJx8RGtQhSqg5e47LvQc7q
	rRGouuW4OK4CaPwC/p1229u0yJwIrCkHo48WisbIcih+ZKVanYuttIZifaxwIVERI2W7tpDX8Vt
	a3ruccYTzP+UGwRHttYCgoUWO
X-Received: by 2002:a05:620a:a493:b0:918:588c:d095 with SMTP id af79cd13be357-932fc0eefe6mr37201285a.8.1785163639703;
        Mon, 27 Jul 2026 07:47:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a493:b0:918:588c:d095 with SMTP id af79cd13be357-932fc0eefe6mr37197985a.8.1785163639289;
        Mon, 27 Jul 2026 07:47:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2217313csm13939121fa.7.2026.07.27.07.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:47:18 -0700 (PDT)
Message-ID: <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX/cLE7zIuoAL1
 YZKMtirVZu2bbDujar8ePxdBNYfMdXFdd/OOtUNwXrRf6A8t/xj85enrYM3H7NB3F/393TpZBUO
 kI3GrdHt1upV4gl6S4TSZ/lWxR6gqnupiVV0S8tC3yxcs7FYViOGBoRM8GRMPzqYXxdeFxB17je
 h75T6Yj5zqCw089eti0CXZARFtruC+aaMiGT1KtAJQxkl6uDdfIQXewDUfohapwMBMaOb9uQVXd
 dPAhIDDBQxNwR4nNlSXzDri4xpZlBZkrJf7OCMM/nkWnGqxlOSiIZKcmGpof+xDM1CD+z0OxLCK
 U3b4BNM+xgyMzlV+1f3sy+66k3iJRZpdvp6lqLMJ15a828MDhHkviabmmeDNkWlK201ybrrBJAm
 XB0NwzP4ZlzprBDTksfXZPeMLax/itIzLMtbo+o/yxk9X9iZqv58I3T9acWgUgOue9/3BlR7J42
 zUjZv3yyd97QCfCsIyg==
X-Proofpoint-GUID: tGuWA-e_gBxhXKiUPAnpBtzAZ1QxEvae
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a676f78 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z9rpH-K2X6tSt-NJzkgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX10ikgo59xpfz
 Wq3I9YGKtVLkb+9xl6+rVJ2Lf/cyF/4SKBiJ4812qpN5GC5TsKGO49hZB6ZwDScjr02AbIIi0Iw
 6hkzVaEVxniC2PPkxD6cku8NciiTkBo=
X-Proofpoint-ORIG-GUID: tGuWA-e_gBxhXKiUPAnpBtzAZ1QxEvae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/24/26 12:01 PM, Qiang Yu wrote:
> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 6125617de82a..0aae613a33ad 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -28,3 +28,11 @@ &mdss_dp1 {
>  &mdss_dp1_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
> +
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +
> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;

I'm guessing you also meant to enable it here

Konrad
