Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20782472B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775910; cv=none; b=Jz/GxeaK96Ty92PsSMbGQZJtviz7yq+xrenTTjlllUvS3fBiL9+bO/q+AxAj9ZMviuKNDwuXB4Kja19PjbIUkemhw2ZtaskxzuvEyvplDTTgsSFwex395VEsz+IJlRln0G+dxKTUZmdE6VaPZopoiEjg7nNxLXbVfMOnCp2jGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775910; c=relaxed/simple;
	bh=Ox96qHvn47+bpDeRKjnqV2scGXDoWxEm9KijiBs3wr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcD6QPQEcJaCOp/TmRNMBrg2dA+SyI5A3ctC5zPvWI8uLSVZzQYvziVbvPM+dxNDdRWsosCOxo7T6AHOsGKETAezxC4e6YOP7G4BEFuTIp7TrPkSz8lkNb2PindkAk5gidx5G/cU3Gxkhn3A7xdi1PTzzprj45aDjo+L3oYeB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5N2xAIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azWgu7sO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5N2xAIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azWgu7sO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wpdq3534953
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HM0b+gY2t3sPr+G6m2re9kStqVxWC/05ySGuYZwjEs=; b=C5N2xAIwB68UaBld
	waSrddvYUXuTcmZIg6G7VczquzU4Soi4EQD6/pN7CJsfyWDek85js1qRPwQYMrvK
	Z7RKm6ASRxoSRfuaHWLsF7wP2LVAwQhVDdCAzb+IcbhyInV2KwJeF7C7/3LLbeDB
	52W3w4WbvkuLuYVE/YhzpxMR4wr/qLJtGaOMz/OX1d2qM83VsgknvXLMTK4jDWg1
	21DJ8ZeTMYJaDylLNblMMxuvw8DhK6xCDaJRkWxty66qh+1z8VSE0NaZ7/pBWxwI
	AZ6wRu1rhqaoaimjNH+oMsuKZDfVr7UF0O43heotVadd60hHO0OZIh01k6uzeBqx
	fkwnfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsxjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:05:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso3689671cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 20:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775907; x=1785380707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HM0b+gY2t3sPr+G6m2re9kStqVxWC/05ySGuYZwjEs=;
        b=azWgu7sOqKrhY7pC+ag5xZYLvuzsi/zaROCzzZRV61pWs5Nn48q9BwiOdRrHb/NZu1
         8vfcNZTjSezYzxup/6iJd8su6Go6efJ/VBqYlgfOV/4OpDvMqa86/D+BFRQ1gV/0sIjb
         f3Z0lt6di2iMnNRUa0Q9SuPx3tlTOJ6pWV+/zL7L7DacmyUHaCHwuYlH9T5cNtIBF8do
         zGrnykGHvUtv1NQ2xRBBE8ZtnixztvLtWOs2BY9+FgkVn2gIOeEhHz1GPNDkhe4JNINq
         shA1izurWqxNBUfrAE1tNGzisv5C1cKZtmQTGMqYNo7Bks/VYFPq+zTk4sUcGFn5NVz+
         zOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775907; x=1785380707;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HM0b+gY2t3sPr+G6m2re9kStqVxWC/05ySGuYZwjEs=;
        b=IJ9NcShsxUfzWYmtY3+XXYex8K70aw2CGo2q5jlnwAMcu8dj+tx2+xT6IlW++XFna4
         W93IJlCNRuQv7EUDE0LAvK+FYJD2yFG7nL+lnpEF82yzUE7pXov8NklsHdKX9Pt1QwaY
         uWY9wWADsyNsh+bd1K2ma1q85snJTLZhEiVisZLJ4/Nv3bC4/eZ0ioAdEkaR5GEAFQH2
         PU5qLgNCP7umA1/BZomOkqakAlDNiByMfeeHo45FKc9TQD/m81MfKNfLJ6aMw5VX2Pv6
         CKeZZhnVJchMkgiETc8fTPGuaWjt3teKBfNPMdNnIir6bPMz+zNLUNyKL1LANxOxewsR
         zhKw==
X-Forwarded-Encrypted: i=1; AHgh+RpfIFgvIJU536OQFHVbIriJc8J9zQf0Ap+aPda3o5J7fJA9+yNlSt63VtkhS31RXG3mtvPXvpVFRp6y+zrP@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVeq6FNVfF/UIYvC1tZHQzSmiIH8QYkxmNH0hxbnc4GDz+RCA
	0QE4gYFXIJ8Fnb1ZWLuWt/evPSh9eHOzOJ1zDqvUp+54XyR4y2woMkh8xmAHwzQh5sCLfRq0L1d
	26TMWDQLkBDlAVyjDuHDYPx5PZy0PdhXVDmMmz4AQVkQB2YnnGpe8Q2WPLfFuHtUk/0aq
X-Gm-Gg: AR+sD112KwvmZY0198A37IZxmLLuSOG+9kYn+fjAUg2bmgQ0xju2KFjS/5FbAnV8UDy
	W1iw4rToRdLjzM99VAyXkNbnrDALO1rNc1OkuCPASbtVMqIj1PXXnBYTK9TBrSAR0kWxUo0laKx
	NErDUu1fkWXLTv/Rmv0vW8fuoReDAJzkgmXp2Kv7EulDXzyJ8ZLkrL1ioDlaQWLjVhPBZfGEmJP
	tkAcAt+yAWZSngP6pERjNjmn2kCuITNXCQY9jA8VV7rn+x2cBnTIEDCr2hNYMvdeCEo4Ct9nuSj
	g0Z8OPiTRkWhfcJSN+gfV64VKI5Uf+akifpLnhshyDn0pi6savUxoLux3BnymwIV8IqF7goykOa
	NpDdTeGYTgmFVzVlHiEDfosl9Ln38ejwUZ83fwsQzmmmK4hgvw4LcAUO+D/PiHPLN
X-Received: by 2002:a05:622a:1dce:b0:527:69ad:fceb with SMTP id d75a77b69052e-5283eaca354mr5740931cf.0.1784775907094;
        Wed, 22 Jul 2026 20:05:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1dce:b0:527:69ad:fceb with SMTP id d75a77b69052e-5283eaca354mr5740751cf.0.1784775906595;
        Wed, 22 Jul 2026 20:05:06 -0700 (PDT)
Received: from [10.111.167.143] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d066e84fsm27005551cf.3.2026.07.22.20.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 20:05:05 -0700 (PDT)
Message-ID: <236c2b1d-7118-4ed2-80c5-a5dd78b2834d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:04:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rhUfJqMGkY1aa5xStEKbxW-KcF-8DhQH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyOCBTYWx0ZWRfX0NVIr9NIG7qA
 Mgj7+YcuRfoyv7j8bAQ/48SNdJiz89xDPzbEXwYITMt4VE7ZK3+6Mffgne8awc4pDHnL8t7pS4H
 HXQqSkj0bsI+xLYWXCzpjIG0pUeZOvw=
X-Proofpoint-GUID: rhUfJqMGkY1aa5xStEKbxW-KcF-8DhQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyOCBTYWx0ZWRfXw2cDwSu4Mcnr
 Z9aErIk3eEOhnNZRamLQGjFULKPR0tg0e4+3o4DYogzSzzxZ5axQ4hLzu8l908f8juBSIu01His
 KWZgPNDlswpKOEDzOmKVV9VX6SN86TwYGkNQ4pPY8U9OrnJGWe8kJhPL20HxQunH0ig79GUxM3g
 Ghr/1shvI/wVagEPsExmvpL2r1aqmjnNg1ukOCNvDMbhwvieDR7GnJQbD4dG29y3DbVVZaG5hNA
 k+7dvTcv6AIP3uBzmHaYPFrQdgBC5wIK+cWjxaPIQFJABFEQypqKveKJscO9MtfAyomMXknlJBC
 RJeFenERR/kI9Mjf0JzQaYdvRbiKJZ+1b3Zp0mv+FoDZuY2dsMPje3nXwR73+ZiNcAiKYFSsVK/
 nJrxvw2DVLhLBtDA6qi2HOvzZcUu3ikcZR5+fKzxrBl8j2zuDTCCfkYx4p+m5X3ntvqCKUJ8IaX
 QnfgpA6/JQjVnHUmgyQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a6184e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oA7RtkSea3Gl-iE8cOoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230028



On 7/21/2026 10:58 PM, Loic Poulain wrote:
> The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
> clock ticks and were calibrated for a specific CCI clock frequency per
> hardware variant (19.2 MHz for v1/v1.5/msm8953, 37.5 MHz for v2).
> Running at the wrong frequency causes incorrect I2C timings that may
> violate the I2C specification.
> 
> A previous series removed the cci_clk_rate field and the associated
> warning from the driver on the grounds that the warning was noisy and
> the rate was already set via assigned-clock-rates in the DT. However,
> enforcing a clock frequency configuration through DT is fragile and not
> the right approach, the driver owns the hw_params and should own the
> clock rate too.
> 
> This series reverts the removal of cci_clk_rate, fixes the missing rate
> for the msm8953 variant (added after the field was removed), and
> replaces the passive warn-only approach with an active clk_set_rate()
> at probe time, retaining the warning for cases where the rate cannot be
> applied.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Loic Poulain (3):
>        Revert "i2c: qcom-cci: Remove unused struct member cci_clk_rate"
>        i2c: qcom-cci: Add missing cci_clk_rate for msm8953
>        i2c: qcom-cci: Fix CCI clock rate enforcement
> 
>   drivers/i2c/busses/i2c-qcom-cci.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> ---
> base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
> change-id: 20260721-cci-clk-fix-fe145b2acfa7
> 
> Best regards,

For this patch series:

Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
