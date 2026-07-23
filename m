Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053404582C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804606; cv=none; b=DJMM8LwD30PDqFWX14QaP7uHO/KNHRENXg6Qkn7cL02sa0Vw/K1gLTgVKlI4ukC3qhwXfgp6QFQyrdQOl5N+4aZwlAA2hqm/uYsZzbZyTLck2nehiDO6bD5wT/p7sdeIEjxJjjb1c+mV/sMVUPWJN8/9m03ThRUt15sYC0xcKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804606; c=relaxed/simple;
	bh=PJxlQLJhClhGhrxLfac9Q8XNY9NarRC50QQx0RhLnkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfcv0phHq3RuUCzSCcdTa40j3mqwGAnic42XUYZsego7O1116bj+4jDzWaJwB4bOKkfjtxQUNpWETyu+hvFxVk/wew4BNMJ49uc1Ojhkbt63+E8BPsJB6du7eRP5CdVP6V2KgXuMlMwa808H1WLsGyoGavK3fkPohOx4s08D12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGDFETAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fej3IV7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGDFETAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fej3IV7s"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qTlf3260940
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=; b=hGDFETAd2vwF/Kus
	QMHNDqkOKiFJUWvv7c1286U6jOWnedWkDxAiQVZOaw5OUFvkt3TD/OTNHkjR8RFJ
	vDKJSM59l2ypBeEr/vsB7TNOk/DfsVwpawW17fjAKXeoMt72HhFEPudvq94O4L0g
	E6xCpFKhBjcsd0/BOoN90XSNsRgYjjZR6pbASL8vdTNqYu82NyTAfcMjgvDcmGrS
	79Yna5+OzKwNObLh3vhb4Nd7XK5TI+Ncyg4p1USGZAcvXVO0bCsP0iEhKH8aOaLS
	bqm58/q4Ebl39mf5Rl7HvQUlerCh5odpHVA8UAJ2OOQFY5DUGqwL33+9mWT3dEg8
	U5huUg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1t0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:03:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97752c2acb7so10268241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804597; x=1785409397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=;
        b=Fej3IV7soG/InvA03w3TWIB/DXlctH6vxIFbRe4P6aIB+3LEWHlzTS2Jybrp4P9+bf
         Nvi1Cjcxy148knfO6IdXIY/aiJpYU+p2F3AIkdpBGkaD7PkUbQiZ8HX1HtlZKlrsIxPB
         3jqJLlHww3bUnT/jJ0fK3aJcYMliO41vBXOdElR5hzJtfI93HwwYQouDMH3eQvVwho32
         EC55obZMFI+WRRChLLrxlQ6fcTHotJl7nTV7tdc6qRzveb/Byu6WFW04ZL58CdRsD8Ra
         AEljQ3m/Ks4kW4k8xxlE8//meEw3FITQht28+8g75SZGxiP8OaULo+hoh6b7CHU0Qd59
         T9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804597; x=1785409397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLZ5Ckx7WUXahAJgTAmy6vdj8GBqbFMwXWkx8XDyuOc=;
        b=Hsgo2mfpWvYZKMlsffeBEksEYns6+iNqLiag3ed8p/CDtjHIQeD3khoHmjTEK4oZm+
         1LTUVrHcR0Z/WcVhyjDdlhb41SjyF7wNDSFwPOfvGtbIinG3XVFMI6p1DrzEWxinwTAH
         1XpEzgx+W9Q/HV7SzePSjhqQ7OYC7OU2XEhRnoDzA3Z8KF0bIQghmcYBKSW5cJFu/V3w
         2C7J1Udf/lf65LssSxNYGb8KI06I3TnSU+7jV7HtZbbEquHe0pBYTHjsoizY8/2Ue2F0
         e0gSrtROA0ohFxVcHDmRRsqSZ6a6yKQ8vg7Tbdvd1M38j83pGlbcWOo5m7J+OTHIZxY+
         xJ5g==
X-Gm-Message-State: AOJu0YzlbaDA4iLPfXjXtXPKluerLlFx3koF6KhrS34ewlQfZMhOy1ob
	djIdnOMupLHYF4XC8d/SbhD/JLtVorM6zYHcrDQqlI6IommHo3Kd8DhQz42MAhSmcohNiDHa8eZ
	R6v8t4seO/N4iaYlJlRnImjYGlJUMiyNgTzPZ9Wd0mGdoABwEDJBn1Q1fab31C2Tyk1JB
X-Gm-Gg: AR+sD106g7CIHdD5Fa4KTYzvb/JtqNqFuknq6zjptmYXrY4dPWiJp0jwhZEyF5UuP/o
	zzgoR3AW7ikzBfRyb8hgabJJW5Xxo+Tl61ZqY2b8pgxwnbFHu6YwX33vpYhi9IR/ILFJarvYfGz
	AcgerIue8PpguS6CYP9TI3T+cogqNruwQsHDuIG1P8AV2q/kMCEllf4jf6neyHin1ZPQ9+ThuwM
	4+beaw81sjGHnN33Mmruzsut33qahiw46lFfat2VzEVAHLluL8jnDYcJqqlrYbQi+83hGesyA1o
	DsmS/nuG9KIiZIpTB3QeNc0Qva9x5F5u8jJu1D8mXWvYyBqUV2jR0mOADWXNQkZSST7tylZl0yw
	CCIgONh3MmYV7V5yg8vVYjfY0
X-Received: by 2002:a05:6102:424d:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-74d5ffe001dmr296371137.4.1784804597068;
        Thu, 23 Jul 2026 04:03:17 -0700 (PDT)
X-Received: by 2002:a05:6102:424d:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-74d5ffe001dmr296363137.4.1784804596651;
        Thu, 23 Jul 2026 04:03:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f1127fsm214052866b.55.2026.07.23.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:03:15 -0700 (PDT)
Message-ID: <eb229d10-2e8e-42cc-bf92-96ab3460483f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:03:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port as
 port@0
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-1-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61f4f6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=q5C_vJi7yyHM8oFOZdwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: H5NybI4DXN1FxvgHgWg84bk5N1x7kcTh
X-Proofpoint-GUID: H5NybI4DXN1FxvgHgWg84bk5N1x7kcTh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX4UAV4I+0iX2R
 ut4Ouo1dcC7tKNWFMpIUW+N1hgV0BizAUj2hFwaUGqaNddUHytTIPL+01ldwSM3Fazc8xjN8+IZ
 /V4/STp1bUDo88kqDHXRNm/w20l4KbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX52SkLNJx5X2b
 DSOzvZtS7Ce6NYe5QVIQylTMOc3cObyfaRvH/B+Mqr6Y4ticlPs2DSgp4dpBCaHXiphgBd4eiGP
 Kg3megYV9opAd7L1ohYyPrEccv3VgB8bgxYn4dbgO/IMwiWxsOU/5pWPFh4R/x6voe0SV5A0Kkj
 RZbWHEP3QB+l95C3MWKnQe3gG5zrclmdtZahsliD+ygezyg98CbEMfNQLUyYRpmJn1CTobBnz2X
 RxunLXXAJAsOzpHAp+iRC7qAEMcmWg/SuTPM6N57dEh25zoCxbZhLn5+9LAI6Fvx5oI9nX3gKj0
 XFy2HppHmAHY1Da+K57FpT+1DY49vQmmnTvIsgmjbny4IvyI3oI0tds+cGJ2DwQTWFBQ0DGKKmY
 Y1d7wgbSL0+9RiWh1hAJm3/uoZI6A9t5obNVGv451anxjotUUEpGEh2AOluSkkUK4nDJvts/4Ld
 tu5PAwDZ9XnVC7tzU8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

On 7/23/26 11:56 AM, Wei Deng wrote:
> Assign a port number (reg = <0>) to the existing HS data bus port in
> the usb_2 DWC3 controller, renaming it from the unnumbered 'port' to
> 'port@0'. This is consistent with the snps,dwc3 binding convention
> where port@0 denotes the High-Speed data bus.
> 
> Adding a port number also reserves port@1 for USB root hub physical
> port connections (e.g. an M.2 Key E USB BT slot) that can be described
> in board device tree files.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 09527dcf9576..833810470c85 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5134,8 +5134,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			status = "disabled";
>  
> -			port {
> -				usb_2_dwc3_hs: endpoint {
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* High-speed USB 2.0 data bus */

This is defined by bindings, so the comment is superfluous

Konrad
