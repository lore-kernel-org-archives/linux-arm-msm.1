Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DD44607D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646436; cv=none; b=aV6580lubPNhzYzRhiq0qZNHTrnED7xLsEk8ohz3L56GypTf//mN/gxZ719vSlHZiyV/nL43hVMTaqpUOKoT9o+WcOzYd3tjZXps5C6NqbBueb9ZpDodZh9eAjLryWXhsGEdT2Va/XDChW32ZNSFuCL9AbuUUZB8eWBVwcKGH1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646436; c=relaxed/simple;
	bh=TC2thDPFQGLj8bXGlbz3A2c5nNROvXh+s6iU21A3tZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+eE+fltuQL17a9t5qaPSe5G1H3ojVB4VerbQkLHtBOYAcc3av5PSPuo7yxixsKlPQSlD9wSJAAkYEZ1Wzwo1AeQR0zEWJNITME6DI6yLHbPbgr1igUB9gwJZTagzQTWFdJbuPJhb2Qn542JCZuZaqxtG/oBRPGzuNJE7oXRRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBvQBWnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1YZY4/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBvQBWnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1YZY4/u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfvhb1912514
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EIBzEHYEHlt2NCyRG5veKGHNrgK+qKQdl98wSUvyMFw=; b=kBvQBWnVEinGwxkU
	1N26HkRvE+wRhhpA5vno6buQahdfCferVITy+k3vqJSkUYBHRMkyG13afMd9Z90V
	aTpql1YLbG1/D2lQftefCEoZFlwjAcZh0QpQWLnkkAMyaGu08uJ9SMdZ7ZDMnPDh
	hqdxUIZdNumiZBP6G5N2U0Sd3BaA0eNwQ+pyyfqZoUUKKT+9+GqlsVVjY8LjJdtc
	YmwkNCuamqmj2KRVZ+JlumhzZyKVrvNHuyRlM9GXCi1IL/DpRoOZuxtuBNt8ELTS
	WRfe66PhC4QZ675oRsk8BVaz/H/+NlLl281E8Sc7QG6x9OVo4j8lDZnr2AZfmdZ1
	njewYQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duk1t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:07:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso484016e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646432; x=1785251232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIBzEHYEHlt2NCyRG5veKGHNrgK+qKQdl98wSUvyMFw=;
        b=d1YZY4/uD/TdAZeHVOlE27hCjAjQaL2CBJnjWJFDdTB43dzWTe9R3dWeG5ObPvpxh5
         /d2bBATaXvVhEUHvHzVQ04RcW2zTPS3xYQp6IAJVVHK8vmlvKIVg916ZHB6QnwscpKgS
         Zi0JIGaBvoxmbofjd9O3RyWrOK1DYye3Gz2uHj7uXnaCsJhF0cDtT9dS2+d/3OlYMyKA
         xD/vZQUrERYG7w0bzgDkE4jh1z+43i5yzXVe2SPpLrZzi8ruNdugZqephEIbES1kq2y2
         nL72jBCmvOCXt7llAvdm1yyneMGxA1UQykxA6lecPLlOVLZsuLwF3H/PBrvQsON61E/h
         6mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646432; x=1785251232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIBzEHYEHlt2NCyRG5veKGHNrgK+qKQdl98wSUvyMFw=;
        b=kREzl9UflAdq1PrTwQHuJt86m/+DKWb7B8wkyixgA6B0DHheUVElt4Tee0Ge1A/rh/
         pKP1LJ11ihljN60svqpXDrqmttQPRPVggFEQJG/V04FJNiwjXtqIn89OWNg01epn1eAw
         VLPO4ItSNm7PFR9UfQUE4LS3P1RVE8wadExpEUHaehSmVmgo9OCURRTm/OPXvotXz256
         u+YAVFUisPfW3e/nWmV61I4G6pYRdp2EzuoqLFWqVZxglFbpEnCfdkX4mX8dDBWsvZZZ
         W8Tm13yDWeXmlQqdk5q+jz7s3N/UARgJRxIB+/syeI0Gkve6/Fe9sqQ8oLxGbsDCctI8
         TCYg==
X-Forwarded-Encrypted: i=1; AHgh+RppHl9sK3a5YVlv0XN8natKcMa8xeJBXk/IarReYVxgkzu/KnmCkeVDsi5EAQURjpgr2BI02wrqQpru9DFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkqo2PWeM8N/Ktq4JdobnjxQX+2LLZf2tQ+jbUe66QYfhwq0VG
	KNq19EwGHqYOdXAm4oMfE0M2VaZfGZP6FpLTnW0cy58rlMrIirM30RJ5oVKXOYNN5LfhPfkzsQR
	hL0mT2KeMV7emLTM+KcONwCrsM372AJ/MnolLygdFAPXKLtPln2YgMVtgR5dDfIydv6FI
X-Gm-Gg: AR+sD10EjhR79DNsDituzzhb3HAjidwKnvdzkBJbgZOK96nlfGqNDq4QezwZTn0JBtb
	jBaB6lOc8Ew6+2bBGD/gnGzG0p0eqgdPXQwDfBZImzezqBt323BMxgj1OZXXa0I6SATW3jZZS1B
	OO/xrJKFsTlxM7x+GRJWokksPXJnLVHAkWEeghWAZLNEZK4vj+STdRaF48kw5jo7YiAwxwEIXoS
	4xHH7FHLUyEwWCeVV2WZqj2PXlSEqI0NDnhzrjSI2l9rKhrnH0TgTKgDOMxftDXS48zQx17+WRM
	LjtwUqlmnpkifdBUtCSmkg4EDcTkitEMJjoInzchhjK7e/id7RAm8xSur9YWSeeSN7QLBl2UpQ7
	PKbzRbB7JbPSwNlLuGMfbWvlm
X-Received: by 2002:a05:6102:3e0a:b0:739:cbf7:93dd with SMTP id ada2fe7eead31-74abc8c54c1mr637430137.6.1784646432025;
        Tue, 21 Jul 2026 08:07:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0a:b0:739:cbf7:93dd with SMTP id ada2fe7eead31-74abc8c54c1mr637416137.6.1784646431492;
        Tue, 21 Jul 2026 08:07:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm610446866b.34.2026.07.21.08.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:07:10 -0700 (PDT)
Message-ID: <7fa30af8-884f-4302-ba88-92720bc741eb@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-3-5eae78700da8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-cci-clk-fix-v1-3-5eae78700da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z-nFW-rkGoALBd5zD63qkCCqlgCg18w5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX4DyTzpqm/Il2
 a0CObYilQ/akdvENc95BIJX9O3M72rJzD6BkRLlt5RyHcfZD9tP3Dajpt61ktrV66CKFHUOZAsc
 JrP4rF78czJSoFeHDhEgRbRVb+yoxeL1+7vxx8WJErouY3uwyyK07AG89sTSQjW5Dg1ILNd660z
 GBiVCUQWE/6G0KYzMa5Mq+1zvUNw9A2VJtUtDyjtVhYOI8tGtMgnTARTcJWafjq9HjnP5u/uBUl
 KAEv7KBt0XIzF+HG9dtyIvXlsjdzk4fQ0RjZfUvQHXJwncacjBgr7PVXrEUAMQJYLIZ2olRH9V3
 k49yUiFmX/AZwQd7bYnlMo4kvPNApp6JmkSiCa/8ChkoUVLJyXtFFNmXFpZdHfNj9FqDRu+WoPh
 Y4C2LFuyDUw0H2Gn6OTOphGZWkC666JpVdpMNRByZ3BkRUHxopeXjr3XpTwixnghduFnZOQUuhr
 W545pTMNodG2NK1zV5w==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f8b20 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Qs5JWBi5AS5GbOw7t0EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Z-nFW-rkGoALBd5zD63qkCCqlgCg18w5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX1iPOuMAJZsiu
 VseDEgpnqHfZwo+oSES+LnhGBdReKOXPflv1TzI++ekbKuxc7j4jpp578CVNJF0BNze5xkM0c+3
 BrLyMbVyQFMpR74EHdDQcyEa+q5LUVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210160

On 7/21/26 4:58 PM, Loic Poulain wrote:
> The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
> and were calibrated for a specific clock rate per hardware variant. If
> the clock is running at a different rate the I2C timings will be wrong,
> potentially violating the I2C specification.
> 
> Rather than just warning about a mismatch, actively set the clock to the
> expected rate at probe time. Warn if the rate could not be applied so the
> user is informed that timings may be incorrect.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 5f74edde8558382e63e2c3d0fbe19489f325e8ce..e001c0d565cebd386fd67b1d9d532360b29c67d0 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -519,6 +519,7 @@ static int cci_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *child;
>  	struct resource *r;
> +	struct clk *cci_clk;
>  	struct cci *cci;
>  	int ret, i;
>  	u32 val;
> @@ -587,6 +588,15 @@ static int cci_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>  	cci->nclocks = ret;
>  
> +	cci_clk = devm_clk_get(dev, "cci");
> +	if (IS_ERR(cci_clk))
> +		return dev_err_probe(dev, PTR_ERR(cci_clk), "failed to get CCI clock\n");
> +
> +	clk_set_rate(cci_clk, cci->data->cci_clk_rate);
> +	if (clk_get_rate(cci_clk) != cci->data->cci_clk_rate)
> +		dev_warn(dev, "CCI clock is not at expected %lu Hz\n",
> +			 cci->data->cci_clk_rate);

This needs to go through OPP.

Feel free to take over and refresh:

https://lore.kernel.org/linux-arm-msm/20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com/

Konrad
