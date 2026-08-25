Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71791270EDF
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650868; cv=none; b=Pm0LsZMEt5RwRiCJtqc8vWzzA22SvVfrYZ1Axc8zwwydjDWdtoGPH6f9sfOMco4s3SGXlD+B6lAkrjDc1YthawRdm7BSY7OFO2t3IXcfZb3hYYA3/S4G3PVrnc+bRdqVIpdIzRMurAGD4mFtOJ212oPtWt2Lov9vKr2B2fnejOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650868; c=relaxed/simple;
	bh=tzFtmovB9wZ0wo1v/yiTjf/mh3kSjnpT14RoxiOUwug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uu+h14IsNnasv8lWjYS89g2bduG9cQVKV5k8TWetbRhfPLetbQBNjOfhJCivMSUWdj4nP5eWAbKEk0pxk/TUmvHUHr4Ve/OoROdK+h8K3aez0BO5h53H0RpMV3mYcqCN05sdGTXKSPXUcFKpfvQmdmOAYAdV7xHea68A9Cs7O58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ/TNvzY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCHnQ5w4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ/TNvzY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCHnQ5w4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88IU4870459
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=; b=eQ/TNvzYSgB3EPYS
	2kpVd6ZgmSp2nMu4NLIpB3a6zTbHMoiYhj+FfWUutllUHi/NDYn+zDnxfkpdCUuU
	duUr9qPI0C83P+smTqH5B9AH5TROcQUTFDs/CQ1JhlebpVaCttoK3oXMr5hQNtP7
	ayY1ZzzKo9RZl+eXfi/KQCK0WbqiTR25V1LWSeCInshTKDc2YZJGa3WVJ0akvz4a
	YWB6E3OreVO0yZQ3yST2eroBY5Vhta1JiXoaSfBB6HOmFMkRLQ9SDAIXmeZPq3jN
	/DaxIBHtSGNRq7VM7y6vGUJWVU35NvCwmmdq3ut8J1bC6hlniLIwUYu/e9K9sMBK
	qc1zgQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3du932-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:41:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso77056137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787650865; x=1788255665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=;
        b=CCHnQ5w4MbDuMIwBpYyjbvy1U0lrnIUbL7SIds3lp5mmPu5fuMU4pUd1nkfBTvUR4O
         4XOIZ1zCmXSkap9ET1kMyn/kL4gIM/yhPPL3BFSr64SUJxBIo3jvmTQzACl/LgmFwy5B
         LpuXMv/t+8kAW1E2/FQjJGRq6HwJ5jNWS88Th5BEUHU2YmpnM9haisVuaPEKfgA6FgFL
         MzhK4uFJCi1EHyK4IL2DiOIEOHf92XkkL/YLwAA64C/BxfAfyQyJ+iuUju4+2WzaoN40
         hXZ5M8Ni5+obxVIGn0FeoiIvyKW0oCO/eTcMXopLCwiucZzzmJGNHItoJYsLy4Y9tfyQ
         ppow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650865; x=1788255665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM18vI/7nJzcaX86l6gcNIug8109iQgG8p2xm3oFCzI=;
        b=Oux4a5nB4LBWDjAZD4wt1Gc2X2Xq6EZ4mCMyFNWYVrij9JdE5owklUpfRD4PA/qHEf
         9f//L+RW1HxSuPJ+VYs3B/xnLE2awTK9Kq9+mpYgZKJYvbXkkkGlGY1w3BsP+sFuT1mA
         9NBX29/t95odyCcSmzMA1MC3fMnljHqHILJy717wwwA+Y+VTzmmHgYKQLWEp8KNzspOX
         4wmyO91+1RVTUkka9LWBGIfcbUb5m+d3ZOO7quadRDktk2E0nitF2J7PTVKByE95URhZ
         REt3v7zWychBIpz3eva/9V+fPmRsyA2slpDeBKPMeSAX4gQNFIzZxMYdwyfAtq31f9EV
         /9Kg==
X-Gm-Message-State: AFuF++l4w8/Y8/WDyFfrD6z21vjS9WYjXMEae/qWvo33KHZE7/1ywhlx
	34HECAoYRovSG/8AAurDXAuWnyJ5u7EkhyONSZkQC3OSF9gsPsDiawvmZ3uQm2Y7qimT4jt124W
	tGswuWX/btLpPGUq00wEFjAgxDw+LmBYm0OQrYdXQZxG7NxiCk3Ghyy0u6wf1lLwkF3jgtTconq
	D0
X-Gm-Gg: AR+sD10MOcpaNWX5Dtv3l2yTpjgzWp4AeTM96ID03Sc4iUltSo8rt1jBGfJsS1NK5Ek
	zr/0vevpuEb7VrXVcQ+ELyas5F6Huy+8OmvKuUVI9Q/c0nVp8632llv0NJ/YSf7orspGYRhWgfB
	63J1hRoPFl9ju8P4p1BPLSitOBi2QbiKA07IAlg6xgY/KcHs+ZK1HUi25FKZGsDaFonKNDAlBJr
	QhsypzKsnGfq5JsXljB9RLAe+qEnof8Hk1oI2Su8zLazpyZKsB4AD7tmgZZ43CSSl9jyiMXhOlv
	6Ns3R+InJJ7QCmIgPFey1QkTGyB5+uLuUtv64EWUoTg8EnCmZs6V75GfdDN1KXh7MfZgmOsLjD2
	5FmCcs2AZbdlSJu3EAQ3EiEiN
X-Received: by 2002:a05:6102:34f4:b0:77b:fd61:ab6a with SMTP id ada2fe7eead31-77bfd61c1e4mr2511509137.1.1787650865528;
        Tue, 25 Aug 2026 02:41:05 -0700 (PDT)
X-Received: by 2002:a05:6102:34f4:b0:77b:fd61:ab6a with SMTP id ada2fe7eead31-77bfd61c1e4mr2511505137.1.1787650865058;
        Tue, 25 Aug 2026 02:41:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm12971578a12.27.2026.08.25.02.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:41:04 -0700 (PDT)
Message-ID: <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:41:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qLOHP2eqAco5AC4LhcUNgSF6O-VpJX8y
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d6332 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qjjNvQ9hGNcemuQZb4oA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: qLOHP2eqAco5AC4LhcUNgSF6O-VpJX8y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MSBTYWx0ZWRfX9TMelci/pkVo
 +516eptRZpOXjaw9hn4E7mD9zEIR9Txsa+a/YTKMpeBTjRrHLacYJLGLGy7/bwG4hAZyi9x0sUR
 mvd30ZkGInd96DSXVUbBwAiswQg3agE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MSBTYWx0ZWRfX9DNnxRC837yv
 On3Yq54Y6Y7GBp4xpe6ol5XEQVe1e1Yl570lLR+3a8b/eBd7MInvTYNL9OeiwRuPahGahyR7qcw
 kAoXM906EUQnlEuOQDGZLGporZgnPD/ZAMKXTyTR9Ey2HDjEvibLnjT67MmlqF3GpN6UvJLMfVi
 a1qBLZ1IOiTKFrcQrClC4+A5/PYp+efSdUZNgTs+4ZTfK5bADPvmZNl3EzXbuaeMN/I7xXAfcyv
 M4EztBQFKtY2d16FkuJ20vk2ix3+1o9gEVn9l45X+BYeGRWsqVdtyKwMs1gRUjlfS3Qn26R1Z/x
 CX0nLqkmXSnhTG7DWNSgu/94UyzjfhBOGNR9jkmkGw2Yw4HtkTWdwVSCBGdbjILlkXrVPbNcng0
 UPNzob6zh4aQAIJAljevpX5IplseyF07Eq9WSYViXypu673fg/ONStw5OUJiHVi8jyD4URD2kz1
 rglFGBOeRpEaeqDwFQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250081

On 8/13/26 5:52 PM, Viken Dadhaniya wrote:
> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
> controller that operates exclusively in target mode. The existing
> Qualcomm I2C controller drivers (GENI, QUP) are master-only and cannot
> serve systems where the SoC must respond as an I2C target on the bus.

[...]

> +	ret = clk_prepare_enable(target->xo_clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
> +
> +	ret = clk_prepare_enable(target->ahb_clk);
> +	if (ret) {
> +		clk_disable_unprepare(target->xo_clk);
> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
> +	}

Does this need an OPP table? Presumably we need a power vote for each bus
frequency

Konrad
