Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CE376A08
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749482; cv=none; b=dweNf8cUuE0L3PPmt5nZ2FPapVmdbq4wcouLUYxkE0uY4B+D57OM8kfgxLKfdsjEE+K/RJET/EWZIzmhnuQSlqPJyooCWp+vrCzfAqunsxBfReWQfsP9qcJplwUX/JKadW0WhZXt9fT8VzNaARSFM3lNt9mg9ah/y1MTFc+8aCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749482; c=relaxed/simple;
	bh=B/QVNW8c9Yt+HEi6DqXYIndWDMwJZmax5BegMSf9VVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyfeDkeOapS8p37X9c6WxLoRO5F4gnTOEd8VdAiKy2/sr/eDqK5vdJZ5o90xvH1NSXbeb+5zEP0hiG/EZKOE9yU2PB2RDTXse3mZQnqq6of9+ZDwWLozkW1XCG+cI0EzOA0GaMcfT+Jy3I3KAl+BAmJEoVVp2mminY4pbfMox78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5+EhYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRjuWaCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5+EhYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRjuWaCw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCNFd8295697
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=; b=F5+EhYICABiU+9Ff
	NQX58fKSxGoQO+rAIB0Mjg/415Dqh4JVJ1XzCvYQ8HFCQNngp0vjZr0vkFmaE1bg
	HAq5yB4EbLfpI/8mXzPzvnTrSsFlrKXqs2kLqg5bSCvfjSJqcqerltVEVT3J/8l9
	M108TQ4JLyIQLG6h8Jj0nMhQUYZEEmE3SqIu8i7YSFynnqryuil5mn7f6xOniS/r
	X3fcRpCM15tVMbKhz+xJIemEuARlP1qvGIFg2Roam2VPX75ImfB7wc3Xk/3jRnOe
	MM2cx+52Z0uBR1hH3g6iRMWg3YYeTr3r5+vSw/TKk3afLe6P+80HQbXkR/5mkNEf
	0+n6Vg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u04vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c46be4adaso13004241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749479; x=1788354279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=PRjuWaCw699Z+MT5Q1C2FgYghUl4tVdkBkpGwyR78A58SEy3ObwY6GXThjZc4u5/jS
         yLMXCRGekex7eSOl530G49+uNeH0jWp6OxSSV57WOAmXlb42aVaYgsy0A4PjFLrlFv/1
         pufPhsGj04rC9ZYqQwQKfHbkCZLSg7QhQ9lEYvD/Fn8UUhGlVxemKDPtEQanuImnTu8/
         1GzKH18k3F5IieE1Mr2QfIfquiV7REz28z6i6nJQdAiRQUU3A4irg0g2+t3clvoEZrNy
         xfMaKPb1vgIBnaTqwdhpO9fnDDQrWWVovEyThLmrohfeRyRIsSXtBH4UWH45LH0L5phG
         uGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749479; x=1788354279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=j3hyWYAgML27boApAghCdIM2SSsEro4/uMRgJwxwJPZQysBih49l/x1PbZ1VYLcG88
         U3YHmjIKJwv5+PI2ZEPMu2V0kSc6PwsykfClynWZ6e+QGwUsS03WktIwQV99pCRUa6Cb
         /t2vMcZgBNHN/FzmbBq8/O2VPIQcPRo4Xl9NkTKWz9fguofBfAui0yc2G9wY+KhpNTZk
         zWYbKM8jcZumjmMgNrJOrlI7kUhQ0JqIlSgtWLV9lJCtlHtNaRTvtMIpia+woYjPB4J9
         qajwO4NNjd1IsLchf/+FluxH0Wsw9S6KWZk3oao1ZIvX/1KzDcPLGOEi+D8sDLinxSwc
         cR4A==
X-Forwarded-Encrypted: i=1; AHgh+RpGsNmmGu0Oj3vBZnvU22AZbZQa+x8m9N/NaB19ofDBPJLn3BRDBieqiXYTz2jpoTR4298MSg53E+ysyER0@vger.kernel.org
X-Gm-Message-State: AFuF++kjX2NZf7b7KCQL05mSJIMZmBOl/66vOEmawkYvfHmEyVjQZI28
	iTjchFxKiIPMekHXObWrAkplYxOFq4Cy2R2zyizLsdH6REuCG9uHiuc3EwadlTFSYJQnLQ4XPSH
	J2vwLDAb0lkXLAKNzjAatlvH31G1lIO67+UI9b7roweoxa6JcLb3zGkpq9GJdcVf8ZqBG
X-Gm-Gg: AR+sD13GccnKxEEn92au5pYsebK1UoVu108YmYhSUaVWAyhSVC3msSXfyaMVBBFVKpP
	n/EtGaNa28/yBfQ4tWONIOAEvIaQf3Tc7K0J3V5KGJ6w04xE+/WpX7QnwgOPadZKa1oLYkvMS2Z
	nuV2d7QuNKAq9H2VkexFqbGAtv3Szn5aHyvCg+c0hzH2yFVd08hnb/lbNNYNtxUY/8BI8krsY5M
	wCA3ybNoriROqdtJuBhGqYDH781admMU8X+W+t7gLKtGPVgk2OXGw5mwvyirm3z4tNJtdPtOuQC
	qz71tZ8U+F6a3h9GtBf/VZMyy2kaO6ZzV9/+M1fNa5ykGWmgRMU3VfLC/NHkrIXvG7F1mpxB7gb
	DX2vaAmFrow==
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47940e0c.3.1787749478868;
        Wed, 26 Aug 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47844e0c.3.1787749477474;
        Wed, 26 Aug 2026 06:04:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d671csm450856166b.3.2026.08.26.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:04:36 -0700 (PDT)
Message-ID: <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson
 <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX23DGmA+IiEXO
 KE3xW3DCQAhBTVBaPYY+SFyjypaUARCvrFoQS5DZGZzAlcZpEkTb1iMYl/LOGJ7Vbv8fUtguPqy
 RdOI4IJ0sS35DR44rJnurcCaWgQWD7nnjjEt9BNWldRzLxcHrtGMX1IJjSmu8TSif6UPJGDmkzo
 VgsBKqY+DinG+7TsxPhXiTsf5lqcP0RcSLSy5ssMimL9jullLq/NdHtQmRPh8UoWxoJRpPY0DOv
 YH9UDWNoNR0A113/hj3lCZoZDr/wkTyt4oCmgpg78qcZfttO//kStJnW2K3257qKyZI7TnqEJji
 XDp4cksoYjePWe+y9rcBf8jB9k1XhglzVGKPHnxLuTmDaZ7x14CQ9T5jYMoyiGTd+AUrWtfDLqY
 S8lEAMZtPMvwPBka8w8WrhyYbxB/xQCH2WR8wwJrZ1iRTCN1UJK5bQhL8v0n2dMAHzZtud7FmjJ
 S1hmOhjIY+VoESC4uFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX9Zn5cpuZ5pN2
 YLd2iZlCnRkYSL8fcuZ/xTTqEGSg8P41O7WjkEENoOhlvaK8Sxc29ADmYn+tRE7XU128ci6YPEb
 9rdGtisWUrfJjiaKCoRmJ1hs0kfxE5Q=
X-Proofpoint-ORIG-GUID: zfxUWKbNnxRJxPryAmUIonotzvVN4dsv
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8ee467 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oFIQYVkMYUJ5M4t5nqgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: zfxUWKbNnxRJxPryAmUIonotzvVN4dsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 8/26/26 12:27 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 96e4bd2f5a14..717c44d1c39a 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>  	.res_name = "mxc.lvl",
>  };
>  
> +static struct rpmhpd nmxc = {
> +	.pd = { .name = "nmxc", },
> +	.res_name = "nmxc.lvl",

The commandDB sources suggest this shouls be nspmxc.lvl instead..

Can you dump /sys/kernel/debug/cmd-db?

Konrad
