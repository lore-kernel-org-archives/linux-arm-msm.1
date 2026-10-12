Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3945198A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795080; cv=none; b=H9TJB+dd1ZGk6E1fzZOf8kPNL0+qaQIk1AbX7Ejb0w0VZN800EuYanAGtArCy/xSBLH8E3HoFffXMC7KZMCAkA5OnewME6aZdJj3oiCivart8neLneKALTd8wxvlSUkKOeLD0YTuMjujjhlRYR/Z4+7MHrsYVCE7ZWW9w6hLLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795080; c=relaxed/simple;
	bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYN6CsRlaTZVPCiSOM6T3Z4j+7xNAxz8c+8aZkvOr/6KjiHa0WZVa3qtBrSyyE2CFDyjp71WMWZkWJdGb0XRcU0hakcivGxXQpDYgsiGId2ii1kHn0PDb888uVgsCjHVV06j6CK9NWWylfxDOCOfAQkUEnS5ezMHszcggei0GtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6dbgPlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIo++zaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6dbgPlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIo++zaU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K8ug2796117
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=; b=B6dbgPlZp/Qidban
	ahTPC4eeXy7Vypmh4PrzosA02kgY0NB5ALirfOyGX+0NqwhTcEuKO7oh4jVnoE5R
	mkK9rcvfdE4UhQ1zsNHK88goGYFY5gv4NSuI7qSvjwwwygUiMFMGs5SNKmvpCR5c
	1Gtz2i8DadyvxCZVf+VuRAHvHUKX1mk2x6Fqb1j4INmzepTzd30jDmAZ/fTDwH7k
	efRSXz6WqSxeLUkgDeaHc0ucCGpGJaFpu0mRcBMhvVWQ13Me7DpUGgfPuU2UMo3w
	RdYc0C/lkF/BtF8yeW+tr83b5Df93Mt2u0g8j7W30CneMNI3kCKqVxNtiK3Ex0L0
	9/fjFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3g90u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so3990921cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795078; x=1792399878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
        b=RIo++zaUyy/AWv5DwTKhu+FCy6TDC800yPg/zenDIH85SyMDcwTq5Kp70ceViaag5a
         pXI/34hK0TD/qIArY2vnDV9qnW0oOGcXR5UL0jwz/Wcm+uMxYoVgpi6NIC5uDasbkp2W
         qWjd19WX7PrMi5elk6DE5tGZZ2tnbDz3ILy5reuxeugBbGVVGl8QYNaDQvan8U5a9YF3
         DJIxOC5WTCETEgDkZNomKz2a26ZIL/nrnyZxkQMnJCQ+bW99iyth8Rj2IVtJFTBNsRh6
         4KkUTrcYEkpEg1Vx79GJLbwDunCtgi0HnxAEa1Y0+Eds1n9VMjp7rN0CvjFcFMc9ao0c
         FC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795078; x=1792399878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhehL1JeMkRhS5Eu2/Ne5OIAFgFNXt9XFZgZOXC7tAU=;
        b=opLy4KyPV3IOaXyj6Z5zYjbExAbfV5zC50FIlyw//zYVhwJDJKt8HstjG2E3GMlOlQ
         XWQ61r9PNLWAWBdlpOWOGcJdpIeKDdtxd9ny91TjfmXHykHAra+Sg3+gC9LkP2DgdYB6
         gHrsG4dxkIXHCeAQpDZfjRWirjx6G1aOcSmpU41RS9HtmQ4EwVC0hMBTBT+SkJ0/J8W3
         XYvXyOVt3tXU1v7wVSVaYOghRn5RDCBSsAMrtnl2vWUiHP2hCesHmuYCjGjxi0Ds1E33
         I0ixLLOHfibLgV+saNpL+1dU4CIjkNkydeegEZpHzRrV/J0HSiG2NaBlKpYFnz/TR9ti
         QM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWOK9IGW/0lHMQBJIJd6f1BvQ826VOvKRodNy7spKxuUZoAP7TYeqw3gS0T2yOO03mRo+PICrRUyT7lxsy@vger.kernel.org
X-Gm-Message-State: AFq9FYJMLbqGaheRmDIrxXl/OhuyUF1ntgDb6yMMlkodk/vi3xeNYnbT
	zKkBTnvkknwShKEYtRUC5xbYh7uT8tRgqibpaLJjj1MBVrOFSAJtUeK5JExre7OqtVeXKZnsk6Z
	Cii/9CeJvnT92M9ixHMCedOPF/4JgZoRLkXDxSmWyjxhybdlDdPZ3gwkbEsl7fimd3DcF
X-Gm-Gg: AYBFou1HSFSqIOHDghcUz3OebshFYBoo9e/4SoNOfGH3IZ+4ewpxHgF+H0Ysk+QpBaX
	PsZJA2tLluVb/ZpVxYNgN7Q8R9k6gDEk4S/FNmwJy8qQVqQ62P3ZWksBVfnZ7Nzmwc0eHQzvdMf
	lvjE9Om09k/+mi4MkM7tQFR6OcWaMRfc78yr93f3l7VnBarnaBGo5O+st8kqtwSUOEKQ9Eij5BZ
	XNolrjxgzd4WyEIm/7EyUDWqDiMAQc86OlBFf+vOIOHZqtoCJuq7xImk2qi19XmbsLVL1yDhr4Y
	WeqpRY7jGEiJ+SaBvrQy5iFJ8fcjsaQIdtB4CzB76c6HBU1GDbRbiIoPLIdUQzHVD9CXuoEGB/V
	iPX2bvWRBd6D9Mu1g/rji+A==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr118392501cf.1.1791795077682;
        Mon, 12 Oct 2026 01:51:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr118392331cf.1.1791795077211;
        Mon, 12 Oct 2026 01:51:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm206754066b.75.2026.10.12.01.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:51:16 -0700 (PDT)
Message-ID: <cf17e2ba-0510-4189-a590-00d10760b8d7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:51:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
To: Alex Robinson <alex@ironrobin.net>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steev Klimaszewski <threeway@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010145519.8370-1-alex@ironrobin.net>
 <20261010145519.8370-3-alex@ironrobin.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010145519.8370-3-alex@ironrobin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfXxMN83pKhGXwg
 E2H09Nmfi/CnUQ4zgSzp6YaW0T+3m177TLBbADMYUWDs95K6dosLpw20sol1hhcO1GZUZtP1O7K
 85yx9HpC9g7Wzys3eLBOyVDKybTjvCzVW8gvFDGdWtAA07pxtwvW0y7C6RNy1J77MbVCocfrNlh
 syHTjeY9nTardh2hVTXqExt0d2a1ibWrRrLu56S6b56Cwgvvrs7mXHdxO6b5L0c5IFnjOfIAg82
 30kKXiAmlEKqwvFIK182cl+CEUmQ8dkpIwPXYmOP4B9wbp+Xs2agW7fbo0YHaqnjsLpllyLKxsf
 kOyPP4mss4138rV72k2wyfnWsDPTWLdAw+tjPcv6fhWQHoe54opCX2BywOpkyVky2Plnv4o7zA9
 YWqxeSlUNOR8ekUo+GMJXu382wdb9v8PnMKk447Wpl6Z6jAg2d4eaxSL6Wm2cOpq2roo4ReppaC
 XSBk0dG8d2/VI2oC3vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX8vG4ZL9AezLX
 0FU/jonCbiRnYgNU7yzZ7jM7zInhgkwlOTdcykUMjp56NaDj5HlPB4LbmUTdq7K/8V7srHhU4mU
 hPBsNCJ8JNDOWBftZ9p1D/LGGJ2pFlM=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acc9f86 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DEWFPxdonW-PBiXaBDYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ciUNNWp-q1LX3NSOKwQ7qwXjQPU8p7FV
X-Proofpoint-GUID: ciUNNWp-q1LX3NSOKwQ7qwXjQPU8p7FV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120035

On 10/10/26 4:55 PM, Alex Robinson wrote:
> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.

I think you should poke the agent some more to get:

- privacy keys (cam, mic)
- fnlock get/set
- thermal sensors
- thermal trips
- associated irq events

quite easily

Konrad
