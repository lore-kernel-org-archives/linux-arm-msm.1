Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07B44683E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456846; cv=none; b=GJSioY2en25B/5StRsZg8ypLpe+zSKqhPcsmr7PCD5ONRt5mWSfD39wZP3Ght1Iyw9OSWZCGbA1Zj6+4qdDtMvuqtdx7mAnVbaULcHfVCK+vfahYhxy+SvmD1/S3Ablg58yDkXXKm1iNiebwKtIu4/b3pq/kkf6wU86cxtzwF08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456846; c=relaxed/simple;
	bh=la/+tx1dOHPD+VlPydRWMql5eUCXdnq1cqeMdb+SB8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRvruSixqN78OkAnjK5veqBxINFx+2cuBakEBOvcn8B5w4apgFZSlo49fyd8vAj0fGjD9h28OThJHo52mriVbKk6wXqQUE0a69EOSd+IjvS9JwWVYNmMy49pviAjBDASk4DTCug8lmcM5APJCa1Mi2bZ2LKFnYVOFhZxhxhDvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3EQmU45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIGfoCS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3EQmU45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIGfoCS9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWfuX409875
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=; b=B3EQmU45sIm6Cklb
	NywaXCc9/I4jZ4FBkXVv0L58XmTPCUQWshMvoanxIcyKyUTa+djc0cz0EbIe5iEn
	V7906s2wNkXaAACleuLSJ5V1tgJwyUF+AZOBHK4KZzpKb7UtdGOvKEQGuZxAa35e
	8f9iGnetnW6Bp2oxk5TgZIbe9+Ie3RyPI/Gm208WQevUEwhsLpPrR1EhhrpnOoLb
	biCOjnr5cdIQNHXxGcyc0PEo4UoCuxbaPMyRz0g+gtyTPjyJlfil1v2DGYwojH5E
	Zuol57Cb1j8jaN2aEZT6Ge4UmyNl/5jac/5ylM/5Ftg3j4aqoklTjwBhmfRp0fJm
	l64I6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra4yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:00:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso59123315ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456843; x=1787061643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=;
        b=gIGfoCS9kVA3zsyUOjWW4+kTxNMEUU3k+wGovSU41J8elYYX/rI2JVPU67MRmIq+XB
         BDWLKSDa6MOHDiYWOG7n5pc3Lg1bt+o7iUTEotXiZ7Kjl0G+Gmjzu4AjO0dOBkTs3qN4
         FQZzSj0pFIllOiF1frAVGZG1+WURnsVH9os2faIsTRZtyRsdhyKNbnWBIZ2pZMUJIfoo
         EtasRU31lnBuIGivuGejT9HFgRFv1ZlQaj9N0mGvE/MJWL1GxVt7zAw66P9UgCdBiQGh
         87F5DyxiDk6tAVpxl26pJXJhGki2PK3yC/jF9//S8NH4BWBy1WJlnxEA254ojkgdjlVE
         cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456843; x=1787061643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=;
        b=BIO0Gv+J9iO7+qvGAFv6Xx4FKzKJ2ddKGxqfZuPHT98EFS574SNzJfDQ6ECtw/2BNT
         uaqMs4CUgiJq5wioQBH3Vppf1rQ9PibxEceDf1z2yaK3ObEJvDQlSiUen993jGx31Bfq
         0YqL15p+zRj2bhiSjhZQsvEqUi6rJavZsVO0fJWDhk/Kubb6euRgATA2vVDToRJHOZbq
         HvZYtcnx0dYMeHZfjU64RxIp0P0kV4MGEOq8WMhZrU2AXpfbBow6qcVe0vFWKdHlbVBy
         /TbpyrEt0hljp9Ifp2ZqOWcioqwAtMaBwNJKmMNXWPPVM6n17TAqLPQUgl3E0eX63v2/
         fJrw==
X-Gm-Message-State: AOJu0YzeVJRa55TjqPHW/QDGMivwV/sbjuh8QxxuiK0rStroYj3HDSWz
	SDGOSIwNXA3tmMAo55fMNCcoql1jynGBmaUOIaf83si6lnrw9jTJLfwyv3jG2CB5R1g/Et8bG+Y
	cVppZB04mMKmpKQNa30dP0OIufXAOexmo2Axrktw3CSQ5APZAlXalYOS4UDJx674Gagtz
X-Gm-Gg: AR+sD13eYSW4gteXj/2afuV8yJyKRpKbXSrsB7+GDdJqiBPMife8LT0R/E8jaeTT1PU
	Kyg1eXrEfSQ1sQdXkaaWnZwVCJ7VKHGYNb8vYG1gwTMWxwvLCmiO3ymWPiyTXyFqwNpi1D+wvV+
	Ijc3f7ORkImJpVBVo3PAOKOPnyYYA/oRpTq0Sk1MGYaxvlaaIwDtxS6jIK2V9LGQHQ0AjSR8MBO
	iRZXTDOWGpLENfam4/64x76RSYS8/kvwgU8IPML76W3QzeuTp6gHJxjVqy9ap3tsZ5OoZZ0LctF
	ZKmlGnGg/ytx928FqtcCpHzwYyvlFewvS1d7eM8/RPaC1w31SMFCkj35Qi59TxcWR78z8rXpnz3
	XYE4sbE3bez5cCK8qJAlhrhD+oYkQ+bV5LbsvDUCUZaKn
X-Received: by 2002:a17:903:2308:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d32bfc5a1amr8918615ad.9.1786456843048;
        Tue, 11 Aug 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:903:2308:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d32bfc5a1amr8916675ad.9.1786456841948;
        Tue, 11 Aug 2026 07:00:41 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f458casm8834495ad.33.2026.08.11.07.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:00:41 -0700 (PDT)
Message-ID: <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 19:30:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfXypS+EWXY8NHv
 39fGtbvigLiHz8ahKTFDDf+tcEEuYZs5k9yyArwI8apRNICML2MzcHn61NJqmNPQ8/oc8J5DA4E
 xTQbtAgpGWDUblVsG+9fuKItRBibP7jf89/JD1GIcDrBf43G/cbkPJP/svmzvjD2KuI5GTCfWRO
 t5a7Ppn1BgN/NZeTTuxxKcjmKVgiaR0id8suCQAIYpU1xfY1z/I4FIMbMhCZaIyFHl4cGLxPiWz
 k05fRGxWfMadf//icRNkErPYA58cVOeui8ZLzSNuJxdRV6uGvDCrK2fc+cchdxLJO8Fcp9Q+m3t
 sMta3nl8nT9EtKehJKr31f3Mn/hR1qbRpxMpWnHRHI0s4ITsh+NX2LR4mxlP/TKXRE1UkdObiS0
 pSmxEDMxPPvSIECke3AWXRxOQDNfRlCO5xUSrl8/uFiADLrCGl19WtyJLF9BYQqE1aCrhKY0QYg
 wsO2KD38Jsg3AN5Zdrw==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b2b0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2y_uGkg87WrGdd1x8YcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uVeJKRls0Hn4LIvlr5Q5UveNgogaQNJz
X-Proofpoint-ORIG-GUID: uVeJKRls0Hn4LIvlr5Q5UveNgogaQNJz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX98QrOgeHQvj4
 rn1d8y+IaOtHlnvnW/PMZLuKLZHTzk97y8tM32gv0XdZb/Gmh/w/FLUrxz85Kh/UBtOneUV45m+
 ZJvLSXefnqrcV+xhm8kKMgqZJOVWus0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110116


On 8/11/2026 7:06 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.

Should we move the TLMM definitions to the board DTS file rather than 
keeping it in the SoC DTSI?

>
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.
>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 4fc627b47fe7..a8a89a9c8160 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -241,6 +241,8 @@ mdio1: mdio@90000 {
>   			reg = <0x00090000 0x64>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> +			pinctrl-0 = <&mdio_pins>;
> +			pinctrl-names = "default";
>   
>   			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
>   			clock-names = "gcc_mdio_ahb_clk";
> @@ -427,6 +429,22 @@ uart1_pins: uart1-state {
>   				drive-strength = <8>;
>   				bias-pull-down;
>   			};
> +
> +			mdio_pins: mdio-state {
> +				mdc-pins {
> +					pins = "gpio36";
> +					function = "mdc";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +
> +				mdio-pins {
> +					pins = "gpio37";
> +					function = "mdio";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
>   		};
>   
>   		gcc: clock-controller@1800000 {
>
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
>
> Best regards,
> --
> Luo Jie <jie.luo@oss.qualcomm.com>
>
>
