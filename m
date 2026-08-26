Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECA37DABD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734813; cv=none; b=CmUaB8WJ34mR5vYik4QbQ+fOd3SPAtixU+dSONa+G1qZx4x+5DoPnl796+R4BI3v+Q0ep4Iim7MJ8bWCWtL2LcfrsmwepJ9+ASJPS1ohNdzPborWyBiLWK3R6wekbmewDxehwxejFCIHVSJ7f72TUubtQh71vsdHSMr5ECccL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734813; c=relaxed/simple;
	bh=JJiOlF1x3irKYvIJ1pNjsSbsiPWX/mrHGNUxUyjiIIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdyE99YUbGwAbXm75qEgj9EZDUEmiV6siodGvdnnfZ4w56jM1n1WWnrR1sSYG2OJMT90PPcoL1o5JSnn95wCwWarMGmdztKdeIKQMcdkgzre5YLhR3raf1JdH2ePMUKmuaGsY9VFOXqeBur9fb6LhyPOPJiowQcYHJO05Eaxbh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpL7Xe3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMi7xUBL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpL7Xe3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMi7xUBL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RfqK3689268
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2zhZU54kOx/DqOOM3ZV5yI/6
	ZCgYZzJQql12RB//sA8=; b=BpL7Xe3NYC7q9qFq/rMjTqwLQ74p6pJ5hox5Gq5A
	UKYEhPl3hcXhgT5MqJ7CBvp3Nn+Qh6bsl/gP9xxKcbtVur9InEgZVMEW6cLBJZbS
	HF5AYmU/KiWfwijIzMgqM+QVEWeMWTtfjSHSAbF7DobzdJJcd4AFm5VX94VjesgL
	vQoK7ka2aveLp1JO5kGErbxcLXUk91lQradb9KKoj8AczudDpcF7B4e+32wcp0IT
	C+7kgkv38jPNsJgL86npw7cV3UQhQsp5ctTXtfycK2THM1B+SJ4V6w5byV4PxAVW
	jDTmVPciJy0MT6XrwnZOHJfDk7qv6jJHYvWxTxdc+ynf7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn329c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:00:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ee59064d2so606191cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734810; x=1788339610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zhZU54kOx/DqOOM3ZV5yI/6ZCgYZzJQql12RB//sA8=;
        b=IMi7xUBLovqMOW5nOUu3iSfQW9jUyWGWSEfXc2+F+Xa/zW4xEZmyr93gspCMXgwPP8
         v3GxAIUYQ7iYSix1mfEno19ORPB3lwqT9iLgA1wPBaB5FLKcCXaEnsP3zBXG/fBB5ztP
         31CpR3eJxABMkTxZC43bx6M8Iw+7mDtaeUuKFzdIoCvcnOrSJC2alIiXRF89WBuX6l8X
         0q3CM/H90iWnz1BTlm7pzcvgBN3A6gzhTH4hvXVDhXgmSNsAhwuZulnUVlyG+aDvbd2b
         UGywLywOtuIyCsukmLL5mXpuZjF4Lx8vS3PnzleamjHXYb3GZpOnB6X7Eedr8ZOObwVC
         YH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734810; x=1788339610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zhZU54kOx/DqOOM3ZV5yI/6ZCgYZzJQql12RB//sA8=;
        b=DOa6NI4OPJnqxHOCrMQOQNcfYnUyquZEyp/fzZtloyxgiIJ3tXlq+j8PIZr5xVQkkn
         bMA6yuNtn9v5GEIFU9iQR+IQW+Y8yo+MiX+EhhU4hZsnLWeO7FDmbVILPPRMTcrojLcw
         zsoW9I+qLd0jPDc4Mq2a7aYT7sliPCf6xFQ7ZNIq7Mc5etR5YXzf/XSG0BVLgdxet7xm
         Ji9XemuS8XS53hpKqTvLjBDC4KrW9uTzCiaG4iCy27uVXYFcdZLZxqQQImdK3WNRlNLv
         5VE533rQYOBonOgIwfnWr/9kokgMopRlfKCXKhBLraL5NYKWYQVS5WRuAcwyXpzulOk8
         Kphg==
X-Forwarded-Encrypted: i=1; AHgh+Rqiuvz7Z30jEVg4WFH3pd1efPaxeLjKLYTrPRN8REem53GJo7cOEN/I7oUjgz4896+S3ZCOBI2kA6pFbJiU@vger.kernel.org
X-Gm-Message-State: AFuF++kSLreUf315N58bJMg2ZHFR0HoZ8BTrfqfct4e7I4HO1DFeq3r4
	W9b1w8d6mH46+lJetmlibJgjwGPLqjQWkU5KCz4maKjkH/nOzibtHxFGB9qw7Mth50vaA7cz7gC
	v0WI7jd2aJamzS18eMLRBjM2s+CimdZb/tte0vbV6Mhr0J6toaJ8yZmKtZihL4fNt+Hio
X-Gm-Gg: AR+sD1038eYWOjbJNH6RotaxS0xQH+jCJIEVHqge3vbcfuEpibVGyLzBpad4eqWh45I
	gDpmxSjmPHtRH1CuHNr+Qia3dxPriWH2LmjlmvN8S8PphD3GB71/iyLEvQ21aLoHK+Vz0QdDMdj
	AWuxITFNflnutr6oyGMN0LJwIPzx6oUU4i93s7cuwBXC5BjNTymMZpKS+crhq2Z9EohPYk4oCUj
	63k0L0N6/dZmIsibfL1E6d6UC15QVXX/8/2jrd+ZBeLtgMYJ6YFq3Oq3pCRl71FhRzNa8xRYNZM
	3I2TcgH++0jW8xCvQv7CyBjggFr/Yw1hYIpm04Kx11n3VtGlDYyTw6Ao7f27ClKwS/UZpWp+5+3
	CeHnjk1ESvNUZ
X-Received: by 2002:ac8:594b:0:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52e2ec51d8emr120518571cf.9.1787734810420;
        Wed, 26 Aug 2026 02:00:10 -0700 (PDT)
X-Received: by 2002:ac8:594b:0:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52e2ec51d8emr120517771cf.9.1787734809757;
        Wed, 26 Aug 2026 02:00:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d1188sm3655807a12.7.2026.08.26.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:00:08 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:00:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH] cpuidle: psci: Fix support for probe deferral by
 dropping the faux device
Message-ID: <irfhmz2ago3suc3o3klfrztq4nhvrbdykuyqsg6pynnkr3naaw@rgnnsjk7ftd4>
References: <20260826084533.38960-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826084533.38960-1-ulf.hansson@oss.qualcomm.com>
X-Proofpoint-GUID: ZS00Imoz_f7rAyGUoG8KXtkmzcFTW4cn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX5OucEvX8dse6
 YBpz519DEshQCJf2Jhnu5Nh7+LKbaKdbdEpQzu7HsTfbmHFzEwmfBApMJ6szTSKCK0Z9WOQ8xLu
 zEeRm02WlJhKRkNXHtA+SpL+WOuq8XY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfXzJ5bYYfoeNQw
 mh3dv5nZacstck/BeROOYeDaIqBuDEIiePpxQGaVJrOCyjnYNZl7zW3sgqS1VWlqlYd0I1+7oK/
 lFwQdRu/R4tkou5N7EpoU3/8HtzSgJcr6R8W+Wq5drAZMRC8oL0IV8/FuXz5J+1OyOyIhKLOvRy
 a+mxcPC1pkS+1mG6Q9qcEiezur77AehR5PWNkcAdpG4OgGZpx/BXjJdfFWfxQrwpx4s83t1DBUV
 HeEYxSaNk4MbEau21Go1u+AcBeaKojblea+g6aBZtEQ6pgxgJU78Wdl7Ai54h2cbEHUOUU7/qzX
 XRxZjCV7JzM6/WKdI3Bnhath4iHkQgA+sXxcGc2BZLokahR53oJwaKBomLYYDDiPkAb7+ufQYSA
 T+x+ItWJBARnKaiiZKIyuKOdqzZlXXSU8z7Poi3unZ4om8CymwtwdMIcF+0zjFeFfd/Q7mOYMKa
 hbd+WEQ1ao3EXPOEpYA==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eab1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vx8LKYWbTLu2W_pKgo8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZS00Imoz_f7rAyGUoG8KXtkmzcFTW4cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

On 26-08-26 10:45:32, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> At the conversion to the faux driver/device we broke the support for probe
> deferral. In hindsight, the move to the faux device seems questionable, as
> it simply makes the code more complicated and for no good reason.
> 
> To fix the support for the probe deferral let's therefore restore the old
> code and drop the faux device.
> 
> Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
> Fixes: 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
