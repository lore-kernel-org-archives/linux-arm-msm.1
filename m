Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D483DB634
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653269; cv=none; b=MAwj6IZRlDv3FQQWeB2EuG4VxDEDx16bVnqTDNZCU4NOHQUszH0p18Cp9y+08LXzE0srqYIk7XWUe7tAhilB4maA2lpaBkOnz4PE6v4VQQSyO830mF/TF34dwFckjveYdTAtqS2M7TD3Eg8x6RCbgBEe4Riiz93tsepwuHI7vas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653269; c=relaxed/simple;
	bh=nfaG9XQEprlhdU3K9q6D9sngdH/8CmjEdYlEhi+U7+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOAwUAZcsNI8bEq5S1tdlNBSur1Q/z5gDJvUQumE36BNLAI8f+ekjLgVNEO39zvlxAtswzFNazx7sH3tAZlkPtTtpmxuSfQZ7hjFXmy8IoHzFRHytPCoLMBBF+udZse5zIPzahFGor/AlDnADyiubbfJlPK05Vd1D823+xOjARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdmhmSC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUw+Gvun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdmhmSC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUw+Gvun"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfrwg2962584
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGD05ffzGvmGRNir2ny5kaWg58qkNh5Jg/HMgLya/oc=; b=OdmhmSC0K3AHmcUx
	7LBBnD5k4HX5FcK83rvSnQfpEJ1GlSV0r4dvMKt1+dLZ/lAUDeVnZfZlJvPesuHp
	CPcbInVJyg9K76nk6QDE3l2K73sPdPuR5Fmz4ZOowgtP0v1lBsI5y0OqL3xtHlJ1
	HrtLHsoe4E/odZZE0TFzakfadWkd9kgMJW4rittWq9AoWTh/Stn4u+36DKx5GceK
	jvYMHElXOoSSEGNHUl470YoN0aVK4l2ElteZ4+dmMnlvDlVoHFrrtUjAqd0Sd6r0
	NCvHvH655Oo1jIGjVjw8v9GbTtHXJhGtNuIrxv/3eBG8juAv7McKUAFOEw2hwfG+
	kk/MqQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nst1m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:01:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so577568e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784653266; x=1785258066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGD05ffzGvmGRNir2ny5kaWg58qkNh5Jg/HMgLya/oc=;
        b=dUw+Gvun8Mqe1AR2/pFy3NkQ6K7IR4+XRP2ulDw+Rh95HVruJ1RJe/mRW8VXsGPhMN
         ph897aMdahLVaOaVxEI1FOiIrb96WSB8UHe8ELitA1BNzopFOJajI6uWgjYUzrZQAEbx
         cAZUn8WmZZoFbGB4aPpCyjYrZw2Er0X1ooB+GEwtFYBKi4nejYdVHxOa+FUkMbowuKjl
         +8lRii7xddHQzYy7oH4/kTrDo+OMwHHYCJ/mFOIj70H5KuYKCNxAbtwEwBojW95yH7iM
         /nXK9Q6Z/LRlvlP2zoyq7icBg8ljA3xykM+erZjo4b3XX92kQaj3VQPupb2o8mpqPwcV
         7cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653266; x=1785258066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGD05ffzGvmGRNir2ny5kaWg58qkNh5Jg/HMgLya/oc=;
        b=HxoVAiPLytwvqmpHCGTFELz6AT76woqblnWPMZhIOOb9tJ0UG7Wl12kl/HCaXFwI+D
         zWJmTA/N5QPl8zuFoH60OUDIjtI9tcJ7k2jC8Z2kpS0M5X33mPp/Eku1FaPJf0qguphp
         RFpzClZEMQtuLozT3w3zZ3swK+nJmGaL2x3jWmGbWjS7RkTv59qfDB3LGl5Kx0x0CBCI
         IRYz0ApZp9iACtsclB1UAVfCJT74hXh3+PDS2J68ujaZbmg4J3URCPktp+W3/WFPerGm
         P1A2gXHgiBh0dThKmiqD2G7BxgWZMcNopMWD0VMDCgxxINcqjANQTQrV67YgubXd+XfI
         MiHg==
X-Forwarded-Encrypted: i=1; AHgh+Ror32mEUOy09zHbNLTbSy/t02UhXjZNdZFTieW78Nkm5duraxBUegB4fzZuS3pQuGZsW5yvN7F2NI2nZm+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pxSTpwDVpb9G8d+hXDmPP5XYz07hPLciBdwAXcKcTrDVFbCQ
	BtZlh515Ju4931fFrdSuLrGBoqMEtjZtpsmzyAD1AsbCrjH8uf0N2zTERHL8IoS3YXCr5jxjZfA
	Mu9ygS7UMCeTfEOkhwv2WGB8C5sOq8CvWV36qHbfxER+kKUdbW4KihnZtnMcdB7X0Y8mJ
X-Gm-Gg: AR+sD12UHeEfTndqZio+LxoOI4QSfv9HpoCFl1nPmpKesqIQ1ya0LDB4PhJGhN05UNN
	gsdVRxwqk+1DgMh6C5vEI3+AHrw1JOtC2jjgFil3YyrzBOkNZRl8N1u24XJ73T6Ix4XLi8tQt5f
	jDtoENkYCAaY6I6c6+hRv+mRc58zCGPfxijA/0tnJ3Av5EMWYuPLdPto6jq3juDD+O2RALR/oUX
	anEuxg3XegCOf0x5uyxYe9cTaeHcc2/AyDYuV1v16zb4JJYXlIMt57zpaOqhVVEFQvLCK+6lT+9
	BWEgOI1ln4VDoxlmSrFOcXAHENRTHmLRzPNjI6577/d3jKNDkh2rOTDJpb6z6KSo3ue37gGKQ1C
	U0FfQ5QgdyydxgHUjZI879XSZ
X-Received: by 2002:a05:6102:3fa8:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74abc21db84mr714205137.3.1784653265820;
        Tue, 21 Jul 2026 10:01:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74abc21db84mr714165137.3.1784653265258;
        Tue, 21 Jul 2026 10:01:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34bad7e9sm69547a12.13.2026.07.21.10.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:01:03 -0700 (PDT)
Message-ID: <1a4155a5-14f6-410c-907c-b2cd8d311bfe@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-3-5eae78700da8@oss.qualcomm.com>
 <7fa30af8-884f-4302-ba88-92720bc741eb@oss.qualcomm.com>
 <CAFEp6-3Zd9Rg0h3v5FGT_RoJiXg8qYNbyCmdx-tO16p8nyBuZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3Zd9Rg0h3v5FGT_RoJiXg8qYNbyCmdx-tO16p8nyBuZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7-_PBVXtf1Zz6P2G6Q50EjjBPML2fdq7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfX/ZiRKIuUOwvf
 Y+R4/PFladq6NKdlx73UjpRR8J1RF8VZd46X/9vHM90X9SfHHkIQQf0UFbxLicUryKDRvEagByx
 c2Nc+rlm0De47839cqcSpIxNS3EwoJA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fa5d3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hrhF-SS1B2tw-unXrEcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 7-_PBVXtf1Zz6P2G6Q50EjjBPML2fdq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfX288gtWbYhT+T
 BxWx5oQiEzLy2VkrKA4mfXMcLd8FciEO0OLdxeX7SXuHue/sWvhwOPWJa0l+Nb14i9dWUCGKkmo
 KYWpPuZejaZLgwjkR6V/Mf9F6vdMX499yQ0nkGze+qfK8ee2oKEdtwGZblJcf/PgDh4IPm3tUeS
 GqK6b0sxrCeDL4hBIhDsEa5Rl5p1u4DLhLlDBls+nF+iFY7W1uFmXvr09M8R7vULB8PSSRuSmub
 v6lEW24RwsqO80ZqqAd5BwR0RVN/00zcM7Rta+fOXA/3+LXCc3uU6Bw6kqYa8MSXkv2KTXCs5Eh
 hmyZknryCwFITuDvIClLyawFIimSQzc5vqSaITnclFU5X7PckbIgpX2+y1N+h10AJgIjJI12S3t
 Kr4gFWwEuXJoI1jtTVhCd7/Ml4OIL940kSWzFZE44Ex/TuJKEl+/o5FoEzxKJcZDYKW49tvWe28
 x011e5MnYfSGW5A+m9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210179

On 7/21/26 5:41 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Tue, Jul 21, 2026 at 5:07 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/21/26 4:58 PM, Loic Poulain wrote:
>>> The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
>>> and were calibrated for a specific clock rate per hardware variant. If
>>> the clock is running at a different rate the I2C timings will be wrong,
>>> potentially violating the I2C specification.
>>>
>>> Rather than just warning about a mismatch, actively set the clock to the
>>> expected rate at probe time. Warn if the rate could not be applied so the
>>> user is informed that timings may be incorrect.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---

[...]

>>> +     cci_clk = devm_clk_get(dev, "cci");
>>> +     if (IS_ERR(cci_clk))
>>> +             return dev_err_probe(dev, PTR_ERR(cci_clk), "failed to get CCI clock\n");
>>> +
>>> +     clk_set_rate(cci_clk, cci->data->cci_clk_rate);
>>> +     if (clk_get_rate(cci_clk) != cci->data->cci_clk_rate)
>>> +             dev_warn(dev, "CCI clock is not at expected %lu Hz\n",
>>> +                      cci->data->cci_clk_rate);
>>
>> This needs to go through OPP.
>>
>> Feel free to take over and refresh:
>>
>> https://lore.kernel.org/linux-arm-msm/20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com/
> 
> Sorry for missing your series earlier. I still think we need this
> series to restore the expected clock rate information in the driver
> and enforce it at probe time, right now the timing tables are
> calibrated for a specific frequency and the driver has no way to
> verify or correct what it gets.

What I'm saying is that you need to call dev_pm_opp_set_rate()
anyway, clk_set_rate() doesn't take into account the required
OPPs for a frequency, and those are very low, but non-zero for
CCI. Unfortunately that comes with the added headache of
maintaining an OPP table for each target anyway..

Konrad
