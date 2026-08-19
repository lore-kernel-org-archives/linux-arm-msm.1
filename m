Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2F37FF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138952; cv=none; b=VWIoVFNnJivubH9kDVHeYD1sVq1rK+HqGUunN/zgAuzInNYdzre/EipgG8ng2THWyR6qRyIi/LwCrQ9SiTJmSd4m8/e4yEV0stBLnglsPwJHuhu5PKTFNsZhOq4IZB5pd7cPWXhmuAaTo1UBdHCvdbxYV2wPJJ1vdGIxMXx+aCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138952; c=relaxed/simple;
	bh=4+98w1XYwLAEVWZchr3OiJkX1RmIsratTg1eeXkABJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9FfI+GEp+NYij3dTKst5Sm3hU4ShnKzYmi8DuNPnWTvEuTVheftoOTHo5nLLFsCVIeVrOobkzTSD4W28rIERpQBi3L5mwoolMjExT2eQQMmnyMeDZtixWlMn2Z0PDbM6wdUeWnC2v00RUmBKWk7xmA+GxunGWm6UAg6OqB3ivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puGmMZnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJfWjMzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puGmMZnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJfWjMzn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8ME34182059
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6fn7nuOdKxU5RfwSXqG52Pz3UneVX57/0Oi5HAx+7Y=; b=puGmMZnm+BPk4Xns
	p/71esqqiXhixGLhDTZhcaOasJS1igw3GqjX16FHEKINJUw2Y31otXYJRO17Xups
	Qs+3yUOsd/zkeLgg+Lc2ukQdba6kqKUcZqfk3R4pNC8WvFXdAfsY5X51bE9QEcje
	kUAXM6ukq1HsvWeeGOHy6jAJb0T3cRMb56tdFeW3m5V2ltRigEm+e+PpJ2UrFjxP
	r4eysisTw4Myac1v4LVPgEZWoFfHVGNGDUCReuHxIyrzIURFBT++UUwWdrwZATfJ
	UVWTYiTTx0GhaOTmhTEJE9tFLJ7hB2QLKP5Kllyx79dJ3v7WzJ2mFG/4MGYtwtoA
	ZOD35A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkay52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:29:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1292441cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138939; x=1787743739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6fn7nuOdKxU5RfwSXqG52Pz3UneVX57/0Oi5HAx+7Y=;
        b=KJfWjMznOnNpEFLBUI4EmC+AQhzzW8YYP12P2vwZEMRAC5iHTv0J+d7OTH65pRNC12
         SxtTOPqK60dPz3O8zn4fJ9tXk3G3qpN6F0ErJTcBJJqJ6sC9SzE5qQdSBuqBxKX7Neaw
         5fw0fanE6oWnQkiMFCiXzq2GXtgNmQs6R/dtI7njO53Is3jurLm1ojwcmE8IhdswmIJ4
         HHPcKc6SragCcWS41TAUnYbxvNVtMl4saPOvaUBBYDt1Y1veS+SQOdxScK7OgQD09C4E
         1wQLxJSxZ7hzbaBIiiK5oXXSWo7QDEV6RWe/EuSoiltTgO8C578JbqMGkeEXXzfYp5Rj
         0vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138939; x=1787743739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6fn7nuOdKxU5RfwSXqG52Pz3UneVX57/0Oi5HAx+7Y=;
        b=WV0oG8A0NQDjCDrxenBjWK/pSHTTT+9INDVgM/UQxPlfWSiz+sFa1RLDClxyPGi/v6
         ifuX4Gz/hP/17S3jTkC7KTpVAQz5dHNsldNwhnGxrIvzPA1sulkaS77evvMDpGswt1hR
         LBGaikcD7B1ANZDriaOcGFrh5XvUpc+A/CtuhVQ7gpGkSkkmCHO0yTN9T10uus5jP884
         WA9A6u28puq1pbbrdFrC/7CTwRWTZu2gkFomhApVkK413kCk53QeKsaI1jD7zQM0AC8o
         Q3szk55dOWeztfPAc5V6GFXUur2nKSPiqZFBL1WryIQeRBp4qynhHlBnCkdhhCwi2YHY
         /GMw==
X-Forwarded-Encrypted: i=1; AHgh+RoUzyaNRL7BrUSI6KFeNDTLxA3JKr9XCbcgZxftKXI4ZiFve0VDwXHPG+Ggxj09gZlWad/LWEf1g6oBdtlz@vger.kernel.org
X-Gm-Message-State: AOJu0YzpanBYcaJgQkvyKm2lzTohvPAp1W7ShGNP0jXFcpJf6fJvuM3v
	nZp6V3FxLHm7szhv4yc3GZ3IuCIlBwTVcktSvGWEb8q7USDGMfWuHVsO1ovmC5pRUfiTGfP06fr
	zYno3Glqc+BThVDzbCkS5JxLYsKwlMIgT8Z1kizkQFK3xn8YgCCxeKfo7kZqKoBw3pDUs
X-Gm-Gg: AR+sD13SeCNHc3mAYc3Dly/H0EkFqgot0pb4Mx3RKefmBmcJHNinH8jxGKNJHo1qeym
	BG7IjIXnqsdhg8dSafUkaeFRxxekG4SExNWDmM/l2w1rg1xiz5xCOAmL8TPQYDmeExYzuyoT2mI
	CXsUpUsOznuT1u/d/AJs3P+wlrRCb6m1bV96bSr5S8PeMS2U+yj8kDrxCf6ls/tHVm69wEHT3yB
	nxJRdN2sbE0NzYcAMieCSry5AyJsfqTAkivY5XGxlfrUU1h7cu2hL/j9hVB+pKgoAmtQu6lR4e7
	9mhw7/wkGw+6HtTqYLl2cdzQO6gYRmJxfLGfr2+nwWXJIR0SXmqAYitWPWVdGiwCVcTfpGvzNsB
	P9mBAqk5RNHzmyCgObUnItnPa
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25687951cf.3.1787138938951;
        Wed, 19 Aug 2026 04:28:58 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25687741cf.3.1787138938569;
        Wed, 19 Aug 2026 04:28:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38af97sm59996166b.49.2026.08.19.04.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:28:57 -0700 (PDT)
Message-ID: <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: qcom: iris: move OPP handling to VPU power
 transaction
To: Hungyu Lin <dennylin0707@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729011001.16999-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729011001.16999-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VgSilxbUtKeB5psMednB70x2kdpsUksj
X-Proofpoint-ORIG-GUID: VgSilxbUtKeB5psMednB70x2kdpsUksj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX8VuflbhGn4FA
 n5Z02o43GaLGdyp46Rpgy4ZPvHL7Wak1rHf6WRQzke5vTrBYDpLZaiomIE1A7QX4njL7acPEANf
 yEk9is0K6BJGO/5popDqu8QHAqN1W3HSELpITMvB24j6M2jNtc8vzdCrCL39J2X2i62tI4PaDLR
 CDZdYxjVtGaENAtV2QddmOlbVZ6Ehok6BGqZHzzIk7/99Xqs1KHmRSxr8NiRfQqCq8rRPYeuroR
 Y4h496pF/uM+auhogrrVtfmI0/RSFl+AxCInUczuyA8VL+2Eq4i2JvV+UepgqGxxedauP80qz1j
 OqKM0RvUY5FnMDDRFjWEJElBgFODMoqgFpTag54BnODfLz8w0mMnCBZ9OoF+XXueuVq0gma2sBw
 +AzvNv3wMdEIXBamgFiafIiM+cS7hEIQE7R8rS3qI5Erqy8OKw9tue4nSZ1PGsUyJSX95/3sYLp
 G0kgx4MUKA3hE63bNXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfXwFM2Jo9E7Qfl
 5slZnVYmYqLTp4XdNyqFlNBZRxwPzGsNCWExBRSvr42vDIvqTWTwPLm9MaeqXdKukSAfNQi0wMl
 P5xk/9eXqjgd3q5SwlFrHFsiLNkNnp4=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a859380 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EgvVS7bLYM35CM27wtQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190088

On 7/29/26 3:10 AM, Hungyu Lin wrote:
> The power-domain helpers currently update the OPP for core->dev while
> enabling or disabling one functional power domain. This makes a
> transaction-wide performance state depend on a low-level helper and can
> leave the maximum OPP selected when a later power-domain resume fails.
> 
> Move the maximum OPP request to iris_vpu_power_on(), after the ICC vote
> and before powering on the controller and hardware. Unwind the OPP vote
> together with the ICC vote on failures.
> 
> Keep the power-domain helpers limited to runtime PM and use
> pm_runtime_resume_and_get() so a failed resume does not leave the usage
> counter incremented.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -472,10 +472,14 @@ int iris_vpu_power_on(struct iris_core *core)
>  	if (ret)
>  		goto err;
>  
> -	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
> +	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
>  	if (ret)
>  		goto err_unvote_icc;
>  
> +	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
> +	if (ret)
> +		goto err_opp;
> +
>  	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
>  	if (ret)
>  		goto err_power_off_ctrl;
> @@ -495,6 +499,8 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  err_power_off_ctrl:
>  	core->iris_platform_data->vpu_ops->power_off_controller(core);
> +err_opp:
> +	iris_opp_set_rate(core->dev, 0);

iris_opp_set_rate(0) will almost never do what you want - it will set the
rate to something lower, but not disable the clocks or drop the power
vote. Dropping the vote will happen as the device (runtime) suspends.

This is an existing "issue" in the driver

Konrad
