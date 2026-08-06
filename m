Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6A48C405
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 18:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040698; cv=none; b=Q1Tw1E1gCjQImRcHAi3YCiaGIaxahXliegdDfVm/4waK0fvHuRhkUnDeEPNDTM09/lMW1sO/NziH21kxyLpR0kuXpd4cMNRRqIt7i2ajmhtBm1KOvdlmlHHdTlYxfaDlHVmAUoRcimMfST5Dt52eeUCoNuUfbyvbfqd6tv756TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040698; c=relaxed/simple;
	bh=y0dQYGiQOYwW/eAOTG5GOZGj8VDF399Xgl/hPfbAQZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9HaOGGSM79RgCiPdZw/3LIo9XK0k6xlojKgHMCTJ8NLWkx+mTvP7Rqhksi91kQkgv1YqYEtcDhFqh8fjjpVvYyncMcHHGokGWpwMQ+xe1PY8F4AExZqoCEazHD3mZGXonsaMsoQ0RE2Hgz2JA4AS0dSwo76kv5KwTIncb9hHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnvEHapi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt4WDaFj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnvEHapi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt4WDaFj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHdBb2745057
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 18:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=; b=TnvEHapiinUk1mxR
	Yrs/ponipl7UEDeDg3cY7/nW/4GHECGEorOuVuxUGR1msGUbCaMiK+LkYv0pAuWv
	OE2QLovdGFYHc/BBb8cm+1KXbVcKmwAf+BS4i28/Hir5RS8JpX48LnJhlqx7TJ/u
	lDxbGJR7GMeQRl3orpHvE3lxbeWXqr+rkzWSA+mkUng95Kuxxs6cEMk1tmNpWP4B
	9x7a1DZBqfK+0Qhw2Ey6TISRZoxld81Zg0sBRVoJyZf4Qq+CiIsRmy64MSx5avx7
	sAECZsLcOpesWXDdcXEQEa4GBgDEZDWqWo645MEc6Qbz4AJsmdPbus7FadZYkc88
	rWJ+zQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6s03u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 18:24:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2943647a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040695; x=1786645495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=;
        b=Wt4WDaFj4kMVm7f+idIBOADfVj/ecf4Cgr5ArEKMYKZi3CQVc50OlDhTlguMhntc6B
         Wieemdbf9XlG+3e8pEBgSO6Wb4sQCf/NQ++oQOKnen65prLt0GeJk/u7gb+JePo3zwSq
         HBd9kCSZgnwS71vkcfuJHsWxZYeBl/QxsXMjVcQmG6U4eIWbwMHEFrhOWhWHBX5dFl8u
         WF+loPkCGSRMWxy3MFbDLFpXDQDXN/iu2zN+7cFU5AnBrwUmdxgzEtRmOca/I6i3y7g7
         4Q1hGckm0OE2WZlfzraOpnekSrzWZiEODkB8o4L/cdXIkPEj8EApCFRPq+qwEPMOkF67
         huNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040695; x=1786645495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=;
        b=TLz0/o4MzRm8linaW5tW27UKIHdZIof3l9OTZp6Yecc88GPLfK6GRugVUKbGSbEyMh
         MN34c2/5cz+oQZI0ohbRBHSOEQBSW1S0tjoLgFZRlYjJL5G2kg0HCyztMSee8LRtHjDv
         t8BqVB1g+xEIEH2FxJ7vwWHS7jjTw2USYwgaF1SUTzqMHVcrqP1rmMdMtWHTKxVwiKld
         0vqVdbIu5cMBExcrssvtTq00muKJ5BGmPRX4QY1ykERtXelSwgIhtx17V6OFakwS9fQw
         dW2CYquV+Y9Y2p04JquZY8Jy47jrPEdMDura0Aubn+M4RYeZNFeDYR9xvx/6irPx8YwG
         S3EA==
X-Forwarded-Encrypted: i=1; AHgh+RpHfpR5SGVZzd0qhtA7QoMxU8rpUoifntmtxwr26bu1okXDqxSlPOvEA/PD5OsEPeQXUUEfc+WVR7nzm77l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MeAOEA16NLeTJlwUOmNOSgKlME2ZA/Geg/+mVKFDVLEtNgkf
	676DYsEGKruXPyBLF9FEFXd+yU7Y1o3Oph+hf0ZCJ3FjUhFdeVwTfzYMB3GBYJK3tU5BZd/l7Uq
	YKVoGUGvWApPRRe4n4GSIItiThbl1xM7t53rHwPxMupB+ZMVXATYbH16/AX2p7UZ7Oevz
X-Gm-Gg: AR+sD113jz41aXUiK1jzYqJ7c864i5pBRnrtiIJoZuBXUch2Sbf4OJ/9ybMYLAFtObf
	O8QW140aJB0P7hZKaEgpGhwAm0FMCqBFT/SAvWxOdlNE+FzcjCYALwQbIHhA6k1pX714wIdI1Wk
	f0hk6xh04hS3Rj0ScEzPylZZVBFaPOjrD9Ck0y7sPbtp/4Egrt1DyyO29UzBpZ3hYCQzCVQUH26
	xZ9RUIEFm/aSgqaVHOJoFj4EtUBwyh6QoC/2RawZaWGKPqip5gfmJDefDbBDm0QTCLz408AKpm4
	ov7sQpNZTb000rZ96A1ud2uDDKzYI7EQaP36PqYu82sprpi42trvW5NU8a25GcZ4n3N5Vne5Ebw
	oJWoAVzHEeTsJD+yhgIuQp/GYrxcjabyhPA==
X-Received: by 2002:a17:90b:2245:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3903c5a6abbmr12183106a91.10.1786040694748;
        Thu, 06 Aug 2026 11:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2245:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3903c5a6abbmr12183053a91.10.1786040694175;
        Thu, 06 Aug 2026 11:24:54 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141009923a5sm460846c88.4.2026.08.06.11.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:24:53 -0700 (PDT)
Message-ID: <3c39da7f-ef15-4219-8126-dc5255c10318@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfXy7kzcXNihbDp
 w3KULnYfstt5z2kNjHdFJapYRYgPmvTyIygwDghS690WRbYflEuHz1QmJMPZY1CJMMqgZqthpOU
 6OzEa78H5LXiy/ZT7juecdr3Rl5OmSo=
X-Proofpoint-ORIG-GUID: 62HQ5wFtdOMeTWbFsDSGYnGy4VBV36tP
X-Proofpoint-GUID: 62HQ5wFtdOMeTWbFsDSGYnGy4VBV36tP
X-Authority-Analysis: v=2.4 cv=B+eJFutM c=1 sm=1 tr=0 ts=6a74d177 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qmjqkF4nJp0v-fA0mrIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfX1LcWuwNzj1VL
 HDTV6jdJ9o9x7X8pla0bRQKJWP8xTIShzVIi/Bs0D8U36xFXwLWHold0bcvYI+GB/QvnXpuSRqU
 biDjFpnlbCCGae5R1jtDb1HPBbum/jeblFmTCL9N/C9O4IajpNky40P3BcWB1+mJ8Eoj1d6cC4G
 dTdYSgRuK9oqW4FryZYtQWv8AMUfVdnYyOuLb2kG9aU2JN92toM9UB9QtULaqR9eVmnTi1wFYJ5
 R2hvi4Qln7NH4bkBOIpk702vnirmDKN5dJzbhLLeTK9/L6uxawCvFite2b9FgeNmWeNiX/0JN0H
 UhHmXmzNXEokdYNRms4JJ9YwE9GDMxp45VhVoCDL+ExFq6GS0ZJ8zDQero81fHysf/0TcelgOs6
 ZqB//h7QqWNTmHwq/X9Va4vHfhts+K0sEFzTUUAIlc1bPq17LWcQgzb0PQ0D+Nyf2n7Ro6DQCMY
 Prpj0nhQp39/oiGYJvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060144



On 8/6/2026 3:43 PM, Praveen Talari wrote:
> When operating in SPI target mode, the GENI controller relies on an
> external GPIO to notify the SPI master about the target's active state.
> 
> Add support for an optional device GPIO that is asserted when a target
> transfer begins and deasserted when the transfer completes, is aborted,
> or hits a timeout. This allows the target to explicitly signal its
> availability to the master and ensures the GPIO is released in all error
> and completion paths, preventing the master from observing a stale or
> incorrect target-ready indication.
> 
> The GPIO is optional and requested only when target mode is enabled,
> using devm_gpiod_get_index_optional() so targets without this signal
> continue to work unchanged.

if this is an optional for something like showing target readiness,
why it's required ? if not defined, what mechanism makes it work properly ?

Like does it depend on any timing or sync mechanism if not the GPIO way?

> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c

[...]

> @@ -1116,8 +1129,16 @@ static int spi_geni_probe(struct platform_device *pdev)
>   	init_completion(&mas->rx_reset_done);
>   	spin_lock_init(&mas->lock);
>   
> -	if (spi->target)
> +	if (spi->target) {
>   		spi->target_abort = spi_geni_target_abort;
> +		mas->target_gpio = devm_gpiod_get_index_optional(dev, "device", 0,
> +								 GPIOD_OUT_LOW);
> +		if (IS_ERR(mas->target_gpio)) {
> +			dev_err(dev, "Failed to request GPIO: %ld\n",
> +				PTR_ERR(mas->target_gpio));
> +			mas->target_gpio = NULL;
IIUC, this GPIO is an optional one. if so, please add a comment to let 
go ahead with an error.

Else need to return an error.
> +		}
> +	}
>   
>   	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
> 

