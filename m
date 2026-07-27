Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152C376A09
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131622; cv=none; b=MdToo1W3U5HACsuyinoq19aMGiH0uPqNaYS+ucmuWH/oikEEYcIlMXz/pOGKtEygQus1wnbEFSmV3kx9ytT+WhUhP9C2TYs9VtJF946ZOPPIFfLiXZoA9EZ+R3mAC5vjjkKjjXNBanl5Ezj90h+jaFO0m3y6FKRtaRmwqNGlgTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131622; c=relaxed/simple;
	bh=kNcygZ+QNmGPyzbzPmnz7mm29UpTUgUTox3crVZpuJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtnG2WLgb66BO1Z8RnWqDZVHmgg53yM9aG+wZNU/dHNEXaQgHgPN1e62ponn6wMSR2rQs1Kl/gjhCiZX634vLNiW9Q6FyBpe7GuETNmyugp5VXlKU6zYeP8gLxYruVjiVJchM12U7otR2vS1bZVsW0xv0Uk/ZoGxSN5t5yMaPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT/df9H+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYW0ezEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT/df9H+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYW0ezEH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1gA6o2417355
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=; b=bT/df9H+WNfR9ZpZ
	6tK6DO22OH/1VIlxAKi1nuOE/EYqY6cJEMOrVx+avDjnK9hgdnwZf/gPf62S2A3W
	BK27lLIoMk2V7N/jeJ8OYEWjfI+8IDVmkOAeuZSl1IaJqVYXK0zwivY+X1A/gGk4
	7z9xZbxUUWfDjQO23Bq4i1GlEmtEcOhGvIwEz/GjA1lGoM+1+Byr4vo3qgmEBQ9I
	mXhAoc0B+/BMADQ6CWELldHnTa/+e7PALvynfcqloyCtB1Zolf/OSZZINASxfv0/
	+bkAyZZILuROTU6sBXtIhPy4dfu4YOdNFxKP3XOOn+1hC2YO37x/hNCgbg5mfqPI
	bpre5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycq93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:53:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso3803792a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131619; x=1785736419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=QYW0ezEHwz350uNv+KsxlCd7eDoUrUJQqt7xL5i7dOGIHyjl6pbHhgJp8xVOk1T+xR
         LcPnp0lK9rzIJQEaVQudXYM4NpxZZY4EIz2js8hq9eWRFQpZS+nNga0VD09UnHczMT0I
         oGWbnt9C9c8r/bOFU69RzzAIwwoGwhg4T1+VrLp6zo3LAL7pH4tziT4T2LrIQG+qG0Hd
         VRf/3RnVu3+jm9ZiHH5WesJFbePLiPBTKxIujUM44CUHUMvbkzhWtOWZHt8nL+oeKYFX
         9QzLa5qiwoSyVKpReRyojlOishkKVIFQVH4HGBwT5sYLgznovv8dGllDwD2LDYYtVG5w
         WNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131619; x=1785736419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=jdX76UPYOhXLH/LsVmXFVNNOexLDQZ3oRqzDhsfry96bdQbMENaiySLIxwmxz9LFg2
         6iTUNBJlBGzzpja5/e6SMrgmBDXhYu7UK/k7l3x/TxwygKkl1Z1z3ukhW+x5f4EBmmuS
         GzVNM4DBq4WP2fSvMwimN/mMfKsLNnZcs49qNNtAj6TC2nCvR0o403KNGAH2ouq5vPya
         DzEvca67kVxoFU+ZYTC+Unar4X10c6s4MOQRxsfldBNXksgJo7rAufytz4xo4uASYkah
         5xoFgg57UryVu+tEfK8R6ObsxRy8dTWH55fZIl4mhtWnrh0YJSVrL/YRq2sdRNFgURoq
         VoLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSlwAr5obA5TblpGoJq9eksOP4vaCYlAY0MtYELAbhx2JeFUBrGbwol7hnPajEmzVTusRRJb2HRVnOYgqN@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgeDedHyZaM9h9jFxkPt3qxRy/7Wg4CLxQC/6kEeCnToTwAzM
	yN5/guBQw9g7dstT0yaOJhy8H6u9ciLkIdV2BxYU0Xke95KfCpXuApC8K0hXUlnsAOzeOFMAvzO
	O9YXZDfk/G2tIgLGpI3XUw5WxfO6z9awjgfQlFVaEtn7p0kBCXUiRsy0OMJ6p6vz6kd8N
X-Gm-Gg: AR+sD12qpiZSezMj2HgDgt5smklyojkVJKwb9MFJSGmxK1Rhu4Y7ru/nCIrJBALToF7
	ZKrv961AADe90UVvgdRxY3gO1M1+OisYD4n77bmYh7eUIsuzJWo7PjxpBpP4yA8S6f9J63heAqn
	B3VO+VqZe7jZMygQhxeny3Gp/tfioLdkUl/sI+9U12HmHVXo10tRowC1+fnLOv0QyHG71MQXVZ1
	HPx+EIsaL1W9rt+0qSylDbl7L62xQcbG3RQd0ADcepVGuSyAEy/Gyvd7MN4pBNoQWKxKq/k2TNG
	MowoNvw6/PKP/If22xr9W4K+Rn4HJK6V/PzSmK1msrID75eddmFCvmKYjo7LJKGl3muUJb9/TG/
	yyH+Vq7LrwXtc/xj1OwUAhGRz1sBB
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725285ad.40.1785131618832;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725045ad.40.1785131618442;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5cd46bsm28828555ad.21.2026.07.26.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Message-ID: <511dfd42-f0e8-48e5-b02c-8429db1a74b1@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:23:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for Hawi GPUCC
To: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>, sboyd@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
 <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -L4XtO42WRcaLg9p59xZrqZsXyOe51PK
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66f263 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=I350RTvX4N0ih4XrwsEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: -L4XtO42WRcaLg9p59xZrqZsXyOe51PK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfX9oNnQ3Z5giVG
 OWzgzXE1zYw2nEBH62SKFsIgK5AgVDu32pJN4fu0lsCABdaBVoYo4ZPR8K7wC3yQd1y3lYmCS47
 7CMDyA5Cek5G/lt6UDG+6nzddLH1hGAm/Zg+G3QGVjnR/DmYYhSAV26wOWjLj0fQUR4TssQ+jH0
 Q7mbFPFGpTOKMn8p2+cOzHpcVKZBPLx5yE/4S4SWXKpImJpc2ccIUjSW3NZ7h83gsVCpdL+D5cr
 8yxCUtMpn2chdj8Gl/eg99m2IQRMmOyoGvSSvhoBmz84cjaRPszhC0n0pBkpgbwOBItog3wdsDi
 +zOXy3Iqn4whStqEDS+R28brxuSn0Sq2BLx53ZjAEOsEOqaPU+mqz6vWQ367QuUp8+wwk5aTDj0
 2lG+rR1JCCeA2246exxuAhxK+n09URnpTtHmRnqaB0NdngkB/ePDeMj/Gomo14wkG+iOPse6O9y
 B93H8RdeRZMOGWdVJvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfX2bBEB1RJa7T2
 xJQvVniG0JlhMbpkBZ3airJex/8YjpGT8jCENk6KUx0aiaVQITYTKJaQhQlxz1tHsOrqsrI7kIK
 Eq/49Th3+EwK+hfHrzftCwnj78iqSBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270056



On 7/27/2026 11:19 AM, Dongfang Zhao wrote:
> Add the graphics clock controller driver for Hawi. This provides the
> clocks, resets and power domains required by the GPU driver to enable the
> graphics subsystem.
> 
> Reuse the existing gxclkctl-kaanapali driver for GX clock controller
> support and build it with the Hawi GPUCC driver.
> 
> Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |  12 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/gpucc-hawi.c | 461 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

