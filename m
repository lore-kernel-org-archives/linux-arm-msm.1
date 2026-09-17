Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68442628D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632486; cv=none; b=kyN+T5j+Ay+/tzjfH4CNvnasNtcRo1GF5d/k9x1XptjXvAn5Im0+MZpiDztH8FZwdHKg/NLgTcCTK40i5syWauRivFfR0A35dXNFmQmLrb1BtWpvwRiZyUTpAAKvSjmht2Hz30sZUK99OQ050n+qf0fWeqKK5GPVaXvfMemL0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632486; c=relaxed/simple;
	bh=Mec2abVM/Lf/R9VYG6xI0d6pNY0/XHkdaMkNMG4yYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNRfT/UvlUP1ZIqIzYOUEobXZTM+NMMY5msvLQL8K6nsU4yHJVpOOQuT0Qb8miusyu9+pRVNwnm6QPtuDWpYsMZPv+Yc+2y/16NPHVTvKA0XGObBxBl1ipCwvlYpIV2IdpgXCwU9iFvSbCayZegyV7bmQ2Rn8HeDecFc/ij5OqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpbjNAnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOIFjKCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpbjNAnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOIFjKCY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H605cc091631
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=; b=fpbjNAnFGmEG0x39
	Lo4gwWAkMd43KSAr+y8X9nwpeKv+kOH0iq64hZkmmxvt/ulbv8TJ5gowKXUe2jUQ
	DPePWFlgB4irnbqicRCPCQf8zTOR+vbc4ElqfV0VKAaiyFnA/arfh74mfn5iMLKD
	CPaoAkp3lwYPCZCgkg2NBi3XA9UTOQWNa0+E0rkJSMV27eneMcqZSw6NDZ1K7IHA
	QVsEi+09g5pOv24NvKd7mwxWet6gHPgZgbtdfbq5WhM8w4bm+ynUK2LQ7tf0f/VM
	0le2GWaG3z+XjjKD86rATtEZosilZuSq9YEcQ2Ct+0Jz7cjnwhE4tvumtk81LKje
	SpXgQg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw0vad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:08:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86fe040f80fso57344b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632484; x=1790237284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=LOIFjKCYXbhtKShl4BrUJbmLIpJGQ7Q5ISC/kPqUFe/G6/+tQvAwMl9nCQk2W7QgBI
         ZrMVQB1uB+SPyur+xB2Cep//wsvc5rElFyi+DjiJqAhKv0nrEpsc0bljv2YDJJGeIq1u
         /lVOZFGDDiGOD5X+DR+oAA6SLO8Jx8TpjX0L/dJ0HsZAPq0dzSmd8E/Z74Pss028yCDz
         2H+QPPx1/wkdS6ShYipLtDnH3PRfmOwuAMNw7gy8EGmhAjL0N+rdURaGgtmWvuBzrUTs
         JhbnhoKciYVjLkw8e1Ec3VLnpBgAjmZfrxW8z1I+cO+DG7bJq3l/+SAfgsWV6m663TeF
         e+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632484; x=1790237284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=JmSah39cJgKIRwU0JhR3idZfep+U7SLnpqPzGtvo+qOR6TqUDQwmbGIHoLsBgPkTPg
         K9OEeMUe29VzzK0DCwePH9N5uuH9hg3Eh4a/pXn51OA9m5qOkkaf4mhtd0igReyJ0Fnp
         0uXiszN6wotdaCwijHWD+uGhwIrwewrhk0zcfQ6q6BXjY1r4Dqnu1wITeUp7mZZQF2Wv
         RWmrF7t1JQV0Wa5sskbCA1dDN8hRJB+9CriC3f3LaKTNqyERwuGiuOGffAxXasiXIUpr
         7aTFPcUwnMmtTum6jeDiwaxgbdN2wm9az/vmYZkCQNa6WILx4oLpxzT3aVobVdCbI6S2
         w/4A==
X-Gm-Message-State: AFuF++leK0u9NpZv7OaHrkKOPMwbApFKZ9vPD3PfiKWDm+sexSD21+Do
	0YqoOaYhp5OnYgwBCQgrV5rk8K3/OMuHNFhMn8nN6giOSghcqCnTHP/6ZciT/kIGqlyIGX8h1vF
	UHfb6DFBToqCpnk+tMWM+Ac9PiY4SVzXj/KC0sZR0hClIZAFYv2h1nnQM4IPP+3PVKMRfhEXODP
	U+
X-Gm-Gg: AYBFou1gB7KqBcTC5G+Vk+tJiR5qaMG4pqxR9rfWOFsQalMKGh2QS29NNklikq0EsWQ
	kpmzdDCyiksouSphTnU6yeQCP0NwC6NlJU6ndUbmON2pBx9bMpACOhPtcVQq3kNWEfpmQfyxNNz
	aV9wFyTN+Ya7DybUlITH2RVc+cy8C6VCzziMjpwhYr1sK2FPAgBTGTLch7GDuMDL0w2FpNPMquo
	pkhBotzhr3jvcj6wSjDD9FWa/vlJGNQXftuPZle4VEpeKWrps5QqcZB1XdMkbGgR3C67+iM3ms2
	1WCUOrVTlvzsBcIo1cVPEvM1rNMX47GfvCr+WNf7bSBxJg0Csst57313w7OiZliquQIS0nEsahm
	nge1doKL6ECOLc+/CCNaGwA==
X-Received: by 2002:a05:6a00:4983:b0:869:2a17:bd35 with SMTP id d2e1a72fcca58-87239e97b8fmr6104150b3a.3.1789632484400;
        Thu, 17 Sep 2026 01:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr864906885a.6.1789632163730;
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fac9sm237902066b.57.2026.09.17.01.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Message-ID: <155306d1-26f0-4dd0-bbf2-4e8b497b60af@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1u7znTY34q7GFCePIKDY2hMDd-QirjBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfXzAerdpsgBrxe
 xdcrl5dvNUVJISNY8yF51zizwM1JQD4z4Tjq5GsIMJFDklRsuYoLSvEAS8Xag40AyywTt9s7c5k
 3MYhHQMTVaNuRjeDH/Xd4dJ+/A1T6/VIdXZuUVWNxSOjCrCqRWRMxeN1WAqKlhhZehzNWJ01ddV
 OhWFyU+zCoyQS0jf3/LkQ2uM0zISB8WVLP2fiMAfYH5ic+bhisb2ApiQkh6EYygUaLJmSnjKyNE
 0x9rZMVUAI7YCqt1lY8wPAWh7vb+zgylJ3VpeYWYT9oT6bFDj5+yOswCJ1NdvYnx0Jbvs1aMYFe
 o1mPdpXiLKJ5K1o2TFlHAutWP7FFNGvUcbeZJiMou02kIO8IhsGERNuv8WsZwHqd1nXLGB39KkG
 CzTzw48HaJGtpEn6i8J8oPqTq4TPEE/dvsyhfiT/D5V/dPvXsoPqGQkKOuSbx5y/gkwu2uKEjRH
 00ivO0RGzkfl+npx2aQ==
X-Proofpoint-GUID: 1u7znTY34q7GFCePIKDY2hMDd-QirjBT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX6BPVbElOksxp
 qVnbPXH3DlaKjq8q136UuAhx1SuXRawvNPg0vMNWMhGT1m+Rr997wBIa56wiOqsx3TMc97G7oZK
 5MLvb3N1wBBBWcRDVQet6ADSleQolQA=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aab9fe5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Qj5jWNXxokvdYmWtNJ0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170109

On 9/16/26 2:04 PM, Abel Vesa wrote:
> PLL15 is specific to APQ8064, but the shared probe function configures
> it unconditionally, including on MSM8960. Its configuration registers
> at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
> 0x334, so regmap rejects these accesses. The PLL configuration helper
> ignores the errors and probe continues.
> 
> Only configure PLL15 when the selected descriptor is for APQ8064,
> matching the existing variant check for the GFX3D clock adjustments.
> 
> Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
> index a23440e13b71..a67df833592a 100644
> --- a/drivers/clk/qcom/mmcc-msm8960.c
> +++ b/drivers/clk/qcom/mmcc-msm8960.c
> @@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
> +	if (desc == &mmcc_apq8064_desc)
> +		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
>  
>  	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
>  }
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
