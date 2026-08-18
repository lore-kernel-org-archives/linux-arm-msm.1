Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262943B71C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055377; cv=none; b=lvocvhBL+VuP8vz+spvZajXGQc9XxQLwN1XyJA1WgKbgGduK5OyNAnRL/SU1giZPMbNpfT2AtFIfAUETmTGGIsiFBMbAdXxfNttHNyfBCs5aRHE7kOVbEF/B99E8OrSr5trfuKBmqGnHruguM6ActAlxVVFJy5DyMiqheVtob70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055377; c=relaxed/simple;
	bh=x70mhGdb68yUsW6CuF8ZhVvCpd3JvHdfutPmIPrmz9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKUmHKU7T0T0SSbhsKmDudLh9zg11nhwXG/6b19t84QhLhGiMJKo3+vtaRvCjnPTtFCypOt0qsQNunP22q7SuRJSg2qt+WBFchxz30XxkQU62Sagyp65bkguWqBVZzJKk836/wLbo46n6MrtqWIOcsPW9DjBieDg1Hea6ItRLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c93Nbsbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+GJ36Rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c93Nbsbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+GJ36Rg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABStv919331
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4oVWpqeOSJdgvMV7n51v/MgEAM6F0nCPePJk7Mu8VE=; b=c93NbsblPkAMLcWB
	m+FW5fRToknQPegA5t8tsQ2XiuUxnyYbUY2g2ZQkJ43UFqUy9H+lE2FkAnnusQeu
	mshcxttCnY9w9JQQigrMM2TVB7STnXzap3XnWZjZwrSVciG5EBVtZ5tNMpde17qB
	F2/tqEzyK8LHILSK/sRP3ecfJIuMd8iiG39/dnfRmi8O50LBoGf01o1i8c7ggX9d
	kVoICN2XNNLyBJsGaHRoCdQET32UvoEEoOg1CjnAufAt1T5ZKH7ZOn+RLuOWGuMi
	U9Vmx3yXcCxp6uu9evkdFapATmkphb/KJitjJoN/iP+Xo0BVRU/wpbiwoRRL+B7J
	Pgw9SQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb18g00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:16:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso101830585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787055374; x=1787660174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4oVWpqeOSJdgvMV7n51v/MgEAM6F0nCPePJk7Mu8VE=;
        b=B+GJ36Rg5Qag1MaN+BeGnTVsHO9/aBObJJ3OOVpZTrTb1r6IrN/7cafUfK+PhouxWF
         i6cnJ4UTs9NiOPh7pTTTGUCh9SKafyC0/CEOxcaKBBV6xLC/2wfBu8DRmZmIgNVhmAgR
         WshliDvCTqD2zoQEhfnefVeECUckibqiVKygkQWzbvFSLfWVrUmXMIBM3rSvX/V55JQr
         nZbUvn2PFQpjuyhyHDX5lPr3Pn5nQB1+9rkS/mDljXsi9Kd0tu4I31aF+EJQK98zXta0
         MPdCwQSp2/gO3hYHDUoYHeeUIpqyBzAtoqYR8EAZ7A51syWxVyB2cK6anQBKBi7VBSpM
         O+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055374; x=1787660174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4oVWpqeOSJdgvMV7n51v/MgEAM6F0nCPePJk7Mu8VE=;
        b=a1506tqXz5wf4r9dujjoLE7sMWav+fkpiK28Tetsz60VBQUDM2prNUo/rRSECPohnS
         Jk8wSFfBR/d/2m4wPM9mLUaGAoEV2IEQBCnQw/cAocj3iTC0Lx2wb3B5Cx6g4i64gvZl
         xMI0VtAgMVCSXUJ9fYLwmwQu9LY32hQPxlBwSyD/4we+obcu/OtWfa8ARTbSSjtcb6w9
         u3uLspVgW85IvYPu2nMu6GsTMxtMIxvJ4uVsf4BrjEEQl2yhZFaZo9wzcNFhtdFHd5AZ
         dG6pOXNYll8BL6TgBjnLjKmtgSx+HsYvB/+xer1eBc6N5HfGfPqYvgRBtUFdacCG6lNQ
         Kjbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6XZgPdz4cPEnP5+MRlpUwI3tLnCQSswTnO6+BzRKbAnCIq6RDDN/Ma0jUSTS6RdPJ8oHVCQFr6jg990vF@vger.kernel.org
X-Gm-Message-State: AOJu0YxCf3jtKjKmfrSIp8grQiRmgy0hi/bXJd3yrkucvYoiQ3hLcxse
	hpyEn+p9LJT3JhacpKG6yS7aKrV/54ONq9ORdRuftU4kmTLFWaaRAXxebwZUnr7hidNz5Oi23Uu
	YxYNZruNAqPbQGJgIIGpjpBEL72UaBFu4K507OkGMMjlscsVJbHhuoaxqGPgOAHwskGdi
X-Gm-Gg: AR+sD12W2u3O2jTjlo/Fj8v7rOFaedluFK/00yLqgvFbvoGUs5smXqE1kjrXyW5Xy25
	/z+m/Dd1AtZsMDar56jPRhfbg2H+g2fnClDpFvGDHBPWDeU0ILA9O0ViYkNJRSx1f3BUsJ5XQ8k
	Ai+SZNO9i38SRsnwRAxK2fw7/VRXlAMHnD7PgU+JLB2/DUgn4J2/N2pFTTAitfFXeYMbqcnoCFY
	LiM818j5RzgLxkV7h4QZiuMuSaI4p1aeLH2lxjj/8oba6gSwAka9R/Urgpe/F/vZBFOXRgFUpYs
	lA4f0bHPEaMheOGBPPPH39uKUqNMERTJbnEY3q+AOREeGi1bOw4QGO/tZNo8gUTdnPqlmudC/zL
	1pWgfihWoYjpos1dixpMdLNra
X-Received: by 2002:a05:620a:28d0:b0:936:6e2f:a34d with SMTP id af79cd13be357-936d25c59f5mr2262523885a.3.1787055374308;
        Tue, 18 Aug 2026 05:16:14 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:936:6e2f:a34d with SMTP id af79cd13be357-936d25c59f5mr2262517885a.3.1787055373636;
        Tue, 18 Aug 2026 05:16:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed830csm170702166b.26.2026.08.18.05.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:16:12 -0700 (PDT)
Message-ID: <5a7ecb83-a01c-4136-bffa-96c64e77c5e9@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:16:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-5-e1d80da54e01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-5-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MCBTYWx0ZWRfX5DxIkNNGcNba
 UQYAA41SgO/ijMnMPtq04P3GdMmRgknDmrFtXRwyUEjNZkWjtiKe4RW5zLmeZ8am1RKXtvQqBua
 /ARoAbf5tbDFAzyQXsdZJ8RfnRJfWT2LZJaE/3R8wOBt4tdt7Q4mrrs76HcaTcDRFw9IydAdBNL
 7mUQKCodZMhOIkKP3TJ0g3GGmXr/YZO9HYDjlC/RWtGmVxSpD/JA6QdzCaVHDbCWMDe/Du7586V
 gCEeX14T/V5ZElZ//llPTiD0kEwalhANYuXtUTrOlFoxBZm5Rhn0iHkYc1L5hhZ3NU3qYv8dSTQ
 EX6fMK3LiM7ZlU1SsPBOhRp3fb7ktd47iPSGIoLOezznHCk04ziLpjFjDH+hAbLiK1jxM4UKBUG
 gaAaOMcTdJ6R+Gf+jz74NOlGS9PZIdjETgGzTvFhsVApOv8SEfdFcUl8oEg/o41oz61IgrO/S69
 6wkGZRZ89B6ZMaWHLMQ==
X-Proofpoint-GUID: oDjkjoIq8JtgWcYTYylHwanKNUWmV6rf
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a844d0e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l0ArfioIlEm0Nh1NdZUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: oDjkjoIq8JtgWcYTYylHwanKNUWmV6rf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MCBTYWx0ZWRfX+teUnfpBKA3P
 8MDj+RAAz5Tb3k588xGCwEh2NeGge9QKLCXekibRgDNRomkuegHhJ40R1lhZErJJuBaz4O1lu3Q
 54ZjRmYrvU9Uk/Y6ztyIyh73flD5OkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180090

On 8/1/26 10:10 PM, Loic Poulain wrote:
> The CCI hw_params timing values are only valid at the specific clock
> rate they were calibrated for. A previous change made the driver select
> the timing set matching the currently running clock rate, but the rate
> itself was still left to the DT (assigned-clock-rates) or the bootloader,
> which is fragile: if no rate is enforced the timings may not match and
> violate the I2C specification.

[...]

> +/*
> + * The single CCI clock is shared by all masters, which may run in different
> + * modes. Pick the lowest rate that has a valid timing set for every active
> + * master's mode.> + */
> +static unsigned long cci_get_required_rate(struct cci *cci)
> +{
> +	int ri, i;

Please declare the loop iterators in the loop 'header', it's been
OKd inside the kernel for a while now

> +
> +	for (ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
> +		bool supported = true;
> +
> +		for (i = 0; i < cci->data->num_masters; i++) {
> +			int mode = cci->master[i].mode;
> +
> +			if (!cci->master[i].cci)
> +				continue;
> +
> +			if (mode > cci->data->max_mode ||
> +			    !cci_hw_params[ri][mode].thigh) {
> +				supported = false;
> +				break;
> +			}

This still goes to dev_pm_opp_set_rate() with a value of 0, which is
BAD - let's check the retval of this function and pass the rate via a
pointer parameter

> +		}
> +
> +		if (supported)
> +			return cci_clk_rates[ri];
> +	}
> +
> +	return 0;
> +}
> +
> +static int cci_set_core_rate(struct cci *cci, unsigned long rate)
> +{
> +	struct device *dev = cci->dev;
> +	int ret;
> +
> +	ret = dev_pm_opp_set_rate(dev, rate);
> +	if (ret) {
> +		dev_warn(dev, "CCI clock could not be set to %lu Hz\n", rate);
> +		return ret;
> +	}
> +
> +	if (!rate)
> +		return 0;
> +
> +	/*
> +	 * Sanity: The hw_params timings are only valid at the exact
> +	 * expected rate, verify what landed on the hardware.
> +	 */
> +	if (clk_get_rate(cci->cci_clk) != rate)
> +		dev_warn(dev, "CCI clock is not at expected %lu Hz\n", rate);
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>  	struct cci *cci = dev_get_drvdata(dev);
>  
> +	cci_set_core_rate(cci, 0);

No, that's a footgun

https://lore.kernel.org/linux-arm-msm/20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com/

>  	cci_disable_clocks(cci);
>  	return 0;
>  }
> @@ -588,6 +646,10 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
>  	struct cci *cci = dev_get_drvdata(dev);
>  	int ret;
>  
> +	ret = cci_set_core_rate(cci, cci_get_required_rate(cci));
> +	if (ret)
> +		return ret;

You generally only need to set_rate once and then enable/disable the clocks,
so this can be removed

Konrad
