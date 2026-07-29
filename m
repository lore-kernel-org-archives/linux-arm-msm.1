Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4811408018
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317760; cv=none; b=WWFVjwN+pQl61lTKphhhvvhr9Z6jGqTffK6bwy98XgUfK/HeZS+TPw4K66p+/eY1wVxHyM1F/H3MZOZ8BCTKYv0D55NVEy/1mIuBsnodvF3THKADkgWU0vF+iolpVohO2ro7v9aaihdZdUXf2jQg0AXHpr2KvF/goPhb7Vhdig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317760; c=relaxed/simple;
	bh=ZaCWRqfKbgTlsT8GVdWkwsueyAjzupW1Bye9aozkzDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtcZ98WavcaN5oDOXYjNwGG1gaWoqOVl83p2+k0YBojN0hXxJCMv6nFnQoXlX9q87krK7rA7J1aa1hz7DVZR1QQ4+rCHKx0iOzSil1aOOkmc+24AOA4uKEgA0+x6AwumlHiOl9vzvJTGE6Uq17IiZJn4tI1kXemWG+7jzyTg1lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gedWuyZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/alw/y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gedWuyZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/alw/y9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fTKf2327966
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=; b=gedWuyZ90FVwJ4LR
	1OJ8Yp9KMWBt931TwFiFI0gdWq02yPVmph03m3tmfcIZhVSu1Nx4eWyExezzcbW9
	+ARsUwpC4mtDdacnZ9NoJIpFNeqKGDb5Xwc2rc7ZWRtTk+LmpfQUu2tXoxuQDKtB
	UUR3r5GBEjdcqG4IyuMr6b9ZjckvhRMq6e0BSOZNjqxPw3/kWk7uEE/9RUPa801q
	dfv2Zx8BUKNznSo2uu7aqu+Lw5nfqngej5K0XZ5f9m5xgTfBqQk76BGvqVBADRvJ
	BBN6Zz4L0h/ix++0cYmKQiuIMSNabAbh8KVjYW0DPL3zynNzBu8ORgpjmbdJHLiN
	MOuGrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1gx8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:35:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so831771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785317758; x=1785922558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=;
        b=I/alw/y9lUf8KXAOZWtSsAwBMmi/OZPvBXMu+ijE3oHNsD3eSlNyjSWziQXRXYAkuP
         UgE1dc8cQQ8cQiETXinuSHZeUchZlReDXtImXEwi10cImK14QxXmvMzFtZxiJ22T6xQ6
         VOYoTAfoyHRhr+54EV9TAS6TeM92NG7bjI1TO8j0t3wOgJO24xtb41I33Dy5DUtktRMU
         ZQIV1xwE6H7l2YwCJ1W4rM/SWQownaN+7g6hnbJ99qszWsK6Nt3s0ZyQZ2+tNkrHL8Mt
         LJAMoD4SeCkD0XqT9YMLL4/AQMZIuYduN9VXYp1CJDJdFQM2D06+ZTpKDnzpKjhZcBG/
         e7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317758; x=1785922558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+r4+xWdHMzsyfScjCV/VxoiA9AqoNvSqUiB8FzN+vwI=;
        b=PTaqRFKDC1Dgs3AjdwiYCplspFUUsYFeyAQD+frTJ4hFLTOSW1nykuNCbHCwgqxE0z
         399HvrY3dHEAg/KKXLK7eFrxmUnrTdTyYri9y8z3eDDrYKUhRYCzrXQP67D+7WotUIlt
         XV2vRZ674FKjWG5QAOsUCD3rR/RhRPaqI/gtjdJdhhfldlrXo4GFk7kw+z4GBPxlb43d
         7HUsHS/2nVnOp4wL5JcpsErv4GerQn+1lWZRs0scyCta+2AWDILCQoYdeC0hCgPcy7ZA
         GzF3JD88tqqIh71yI+tHeNqpZBKvGmI7nBRkBvaxFcQYvqQ3Gvu8hPqiAbjFXP5ZTGLZ
         Md5Q==
X-Gm-Message-State: AOJu0YznWBm1OkhTItax60RKqq7We4ER6Bfj7Lf/lAaTYZwajQgs2CGO
	ORQwBpj3LzDbg8NE20Bi32WE2wdhfDVVtFFAo0Kjqvi9skVyla8LRqB9pXQunnn2q+c9bZv9OMz
	xU6X7XQNPyox+S6fSemCPZy2dEVvD/ii05mjhrfw6PlZDXv9xQ/KPvJpiKLV+ufnpk/sO
X-Gm-Gg: AR+sD107xLhF+CtYjblpBOBcEaIIcEW0kPOrqCnFcigsC4WmMhZV7TrFT9plHyboMnC
	AuyV3osZC1kp7gGDqnQcKDGcYA7BM3z9cB+E21ZQZ096AiqYMpjH3cOY2BE2v7ijL24N5Mj6lPl
	y6ZsLkmuDo+CWQCqbSQdXf9NV2YNZwtE9i8dPM2jFvgdkNT+ZWqFSIJdn/Mwbx7rrIt/r6yceuq
	rb+fK9KsBaE242I51kcrn05DG0Lq88W0IAtsl5VufPaWryxW/9gfgF85YruYyzRE2uGVXu/xQvd
	8TNreLLrr0vym+8G/AFPHdFy8XrimIcDnbyFy/jwomZt8T3R/9c//PQ6AbVSaWkCQzXhr8l4lZD
	wHls495gbBJwT3Lgn0ogbC17t
X-Received: by 2002:a05:622a:aa10:20b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-529df81bfd9mr45433141cf.4.1785317757859;
        Wed, 29 Jul 2026 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:622a:aa10:20b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-529df81bfd9mr45432871cf.4.1785317757410;
        Wed, 29 Jul 2026 02:35:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fb1189sm88133866b.47.2026.07.29.02.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:35:56 -0700 (PDT)
Message-ID: <0267f9d0-f2ab-4b54-9989-37902bd5b066@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
 <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX/oxcHczWw/2T
 R/ZXPX7+BvUONGrSx3VCmPJHEQpBxJff+eK1UMU5gqMVIlkBGx5pFbZa+fTXQqrKIX2oTHMMbpW
 Ud3a+Ivif25VNaHxZwnr24j+JbE2SebXwiAgsV8dbV6NfhS2/MDSFR7lkBPJrshZXDZaV/Wy3bO
 SDBdZmojEaELkt107aF8gkhyE7SMvt5JdT8USEwwgTByv7spK+BzJC7V5jnqcpUldGsLzaD13Ru
 ezW9cMAGJmAi6az45aRMi9dwSLH1Iue04BkpxVlG2lksMl/o8czijdJPngAH+WEysUvwnggkprN
 R7UVwng88+dY3E47xw889cgQawZl4ia5l6SDFO4TjDj46/69R+ZbDwGf8z+/NHT2kKrEeNjIb5S
 b+1W6z1BQmylcKxdXQaY+0nAQJ1PHVgOAHx+gSQmzJvuX0RDmw7sz7gR2YDplT7np21Bt/ZiZhC
 qKmNFMTTdEQmTTQ025A==
X-Proofpoint-GUID: InKh3yeZyum2bsmFmDEp_jd20RYL-n1D
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69c97f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xONkTBg-w_5Iyyk_CLcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: InKh3yeZyum2bsmFmDEp_jd20RYL-n1D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3OCBTYWx0ZWRfX6tyFaXhfRset
 9LBm14aLkPU/8KfuXhw69FaL59BQ49fphi0oDAS/cxeaU1h9lSmYvT7okd3UcI/GRvYGB93jhHm
 +CvIfwae8fY4vN6nPxQvCeWCdORk4rI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290078

On 7/23/26 2:15 PM, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The WSA macro, VA macro and SoundWire controller are kept disabled so
> board DTS files can selectively enable and configure them.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +		lpass_wsamacro: codec@6b00000 {
> +			compatible = "qcom,eliza-lpass-wsa-macro",
> +				     "qcom,sm8550-lpass-wsa-macro";
> +			reg = <0x0 0x06b00000 0x0 0x1000>;
> +
> +			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_MACRO_VOTE
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE
> +					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names = "mclk",
> +				      "macro",
> +				      "dcodec",
> +				      "fsgen";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +
> +			status = "disabled";

All macros (but not swr hosts) are usually enabled by default on other
socs, let's do the same here

Konrad
