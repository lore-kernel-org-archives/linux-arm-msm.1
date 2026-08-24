Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585D3EF0C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562074; cv=none; b=kM2I0nFBq8DFJs01nPys9VtjimBu86tfJKvkS/1A+h1nP8nckvCIFvOnyCA/o+ss9pKCesjRIIbyJDXCsfVKp+104GZ9q0yRAKVvXsfxMEc3KgltoVNT+idyR7ADbSrwIJYn3mdlG9/GnVy0309NdI9Kcx0sSSpsQRGR+L/Mx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562074; c=relaxed/simple;
	bh=w5+J7B2KEp+CELJiqcP8nOu7rSEfk9xpU6MwU9YptYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go/aoQbe4oT42n3GJ56hq8/ux5/W2B35dmqiMOOJCVKFd5jCGTOQ/r08n4NZv9qvig9Ldq06un+Gu5MdZqBEG7E8nPkUy8YA9vENtZDzVrIeqz6UW/bFktqScXsxrPR7wRvCSS/wG6pv6BxvWarTkILRuO7YJgIMbahDbqiaMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz0t2KBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewZ+vy3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz0t2KBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewZ+vy3t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R2wA1477630
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=; b=Pz0t2KBSlVnjmoRr
	Mo+GW7tYI1V2/TIPqrGRpHEYseGTaMRVM95Jy63dASalkzZocbv3/XK2qxw0zirr
	l8mkUcNuvWg+dc3H2oq+D4YzhPlgg380mzt3MKVDjFWE2P3qIgUIT4EOmMZNhUSU
	almrcW/CUOWNBzlsTaEGUkeDZA5cnAn2t9m6jS7P9e6oDpv83eJpLY8HioKE/ZAM
	KOcDtMRb1yR2GMML8QokrX8MlEf1/MyivcfijafNHguKLZXQRbyQBkHJGpX+nnTf
	x3aypLqUvopI4nPuhxkIfhZmC2bxjcpCvyNNAZ6OA22FWgYn4c2hpceiM76LINvO
	Y5Yx5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528p3ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:01:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7674812ca4bso45776137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562072; x=1788166872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=;
        b=ewZ+vy3t+Chg40QatmfIWPL+p8FAKJPJkbH/i2o0LdzDZ4bR5XudLCK2hE+KiuL30J
         dEqL5zXMLq44SVFq3wWI8T7N1kZ8ju8iMGNFw7/GdEdzkORpHEysymdTSaFkkyN7FSH3
         8laFcsJnjHhZkzkCdgoqu1m7ZXRoEj0gUeYjwxA9wuoWFuz9jQW7brC3Gaxk6YNqFSDa
         Q5vN3s10ZIaQqkpQ/j6HQqlxeR59oRFDilZofkW25S3lw9S5SZ9+ynATqU0+fFi4er6t
         r4PkHfr4ZMESWZozR19ZJRHtQhzMRCAOp1J8VckfVMZDSpiMr8CzKtvPH3ImbwEeaGCo
         Y9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562072; x=1788166872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nq580rhORxpw9+EdKXXeZOx42xe2bsQS/OhlKVQqL8o=;
        b=HmtN0jWnCkoDh1681tjQe6BN9HxSjzu2QRBvz5Qzg1smdGRdrp7HtdGZxYwWg1Qs1/
         hw5Lhbmjfm/IgsnjA5QDACRlaoMy9v2hWZqngWHrAs0Bs9l8OayHftrBilSHSjzJ64I0
         wvGwv/jNsVt4mQZGR0cf1LgNE5gtBBTodslRE/gf71zJTguXlFHX5N1WI3oqSYqsfmpV
         PTGi4OHXOrRDABY1R7ea3j/5IvAUOcNScYLd+P3y4d231+so2K1mTwCmUfFKOyT9MNVx
         7VJpmi6dLkYaMJtRZx5ZkdmnSDnTI8CkWT4hoH0Y6+YxVoWsh5FhyRU3LOKDl5Y9FTXi
         Rc4w==
X-Gm-Message-State: AFuF++klmkYA1yvEFr7AkvXY+6MkprJuIexoLO5YDNhSTEEJNocHARLE
	3pSsEiobjlZfZc/A0O/oneaSxttxpQmhSL8GkWzysyGQ+eZtqTpvLoHaHlK/3Qt5/eyhbjyjzaa
	dLQrGEoasNcqA0akas4TvldSZ7iCCSkwJvOZnXJdxSVreity1qoVxpHHSypSE5kr5eh85
X-Gm-Gg: AR+sD13KvE9gJdCl7dvBSrpqiHlBQb6DUnXpB1MWXIV1djHcC9qTNCPnFMsOlVaRTT3
	Wta2d+QX6vrGRhUo1MyvLVXEsOoyTfsSSOUSHAQysz2xm5dgYJn08B6OxWNKH2aaQXIqOiaWFT8
	xjO4Rhh8+GcFroomSn7Xh80Y/B25Hfx0IICm0L2WT4iq2a4VMM7K5eK8hc3PjAfvnnTAJRHb+Qc
	TAzZ0LZPU/PGk8wTZGPoq/VDKgNgSa8CwpSXFWZBjvAToLTJgqKyJ4xCv6uJJsPCfl4xaUNVsrf
	79cq9848RqQOzs1c3RiPCmFOxHuPwWNVEynCqpDKtP5rFDh9XInLduqVwo8r/lEccTD0o5He2tj
	tLaC7sIqVZmxs5yM+DM6ruxvm
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3587204137.0.1787562071243;
        Mon, 24 Aug 2026 02:01:11 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3587190137.0.1787562070637;
        Mon, 24 Aug 2026 02:01:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm9009507a12.1.2026.08.24.02.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:01:09 -0700 (PDT)
Message-ID: <e2aa5f6c-fec6-4be1-b0f0-09bf67347e81@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:01:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8c0858 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=b9ymU4C9UEAgf2vefAoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 22pgAx8T7gPZmJCWaUWkCu9x46VusKEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX9XCp+/szMx3S
 m3aR0S7FDPxqlWPLMqh/sI5oa6mVgjiGtiO3C/a44EYu4wNQcW+8NApy05vd4MiG8NlLIepOevb
 kYEVg62EF+qY2wjNkp1IXO2SXkiEtXRsNL+ilsp2K/qJHx2PatGSOnPELaxSafAvEHRZHW9Qiyy
 0RKPeLiU/ggCRQAmHZFlXyLiyc6+TV27IhGLQBEixWubPeDDcbxmq5q4Riry/ChIt0oKCIFkURU
 LVXPdT1C4EtFVbRPXTe5NawFsyBEodwX5eHG1N1PqhXJu5VTEK6Oc4KvwW98FpNXWkcu/Z2v2Wf
 8wKCbpLSEaL0gJdZfnjBthfcI8t8EoBK6en16ApMryUjOYBDxobj0H/2p5lXIGUlhy6ho5DYsvP
 8axrqCRo99ak4rXJaAPzGK9skvsfWVi4PcamES6ACWQaN1lkmAqn+KHwObh1LyMAYLeOXYRJ0Y2
 hxA9i7rv/wLsLBZopAw==
X-Proofpoint-ORIG-GUID: 22pgAx8T7gPZmJCWaUWkCu9x46VusKEG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX3MiW6DBoc0Ts
 Wm97y1n3AbYEVFidjWB3hqdLBzQP+XjKl5RNVxlkQmeAOO6+x/bfzk1HwHPJKv4hUlZJHjBdt6Q
 s9/CUeEr1rpwihrgcuzblsUVD49WUMA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 965649db36f3..c98889a7c26c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -604,11 +604,21 @@ usb: usb@8a00000 {
>  			clocks = <&gcc GCC_USB0_MASTER_CLK>,
>  				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>  				 <&gcc GCC_USB0_SLEEP_CLK>,
> -				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB0_AUX_CLK>,
> +				 <&gcc GCC_USB0_LFPS_CLK>;
>  			clock-names = "core",
>  				      "iface",
>  				      "sleep",
> -				      "mock_utmi";
> +				      "mock_utmi",
> +				      "aux",
> +				      "lfps";
> +			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +					  <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,

This one should be an interconnect resource

Konrad
