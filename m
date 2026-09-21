Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76604A43E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000991; cv=none; b=FgijlYhUL94+BwqKJUsQnxodVaj9xIr2dsXpSkH5brDwY/LhmFQjwShSZitfFVhGoP+m3W98xh2BcZO/FjBB1YvMq+g+NuYnPNeRkZBm2AGFkcFnTVcvwpJJ6rPsYGvev8vm8cu2eE/wm/z1Z8Y93z9LkP+LUbueJvQhU0Q35DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000991; c=relaxed/simple;
	bh=EB+e27vXkjFjqptW4gsfCinDdpvlRpRszmTPbLlSRL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP5irbSyM8SwxSPrUZNoeYSc2OJd60Ml2y22uvPyYnwB+BL3o5dWfOyhREkCsFXBC0IO5p+B19MxOIxb8itNaLtswoVBAxpm2jt1hvtCuRdIa0R7dp8f2VaE+KgYdpARro1QlFSrmQ9L7XAzi4Jpy3Rf/GUlfBWt622//wZRS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0rd42kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDL6N+uU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0rd42kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDL6N+uU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGbfk1410174
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=; b=f0rd42kSaQMQZz7W
	8FiDHdQhty89VlB6nROO+hjbiZJgRDvwCSvhGirpiUoTQxhq2WCL53ZSD16NChJs
	5lzxe7rnENs+YE3q1UDgbWkPJIXG+uzMJMn7FrUL8K4I234jvsS/UqBZX85w208P
	pHxUE59uGvQTjk459tx7aXIkqETo1MBx7m4/fYT3aXqDzicVqayJWgoqirb5byVh
	vm2WJlgSEv6bdhNYONlIcxacZArWyM2uHf7CVZUZmmnLCC7QOfcRtJP25KFOfjvZ
	tH8GNPHkByfD7qSErrtZWqjpX61qLLpVx6HrxvhDDdXPcjRqDIswdP2FSHwBp1aT
	Wqo8iA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bb3mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:29:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ea2f5863cso39741241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790000987; x=1790605787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=;
        b=GDL6N+uUEvnbtEVVYyyHIYNb0A3HSTrvNilW5vnEzvk9n9c2ze66rF39HWVBZ+WQYT
         6fZEDkb4YM6GxpMvi/yCoMxGPIHW8q2YclNWusi5FhY35rBAScYW+T+F4NxeOJfKNALd
         Jgcj3AfR4UO4c7+irYwErdu26r4EBrNkmx5MkYqiypoUtfntDC//jXNdwCMEBLOqb8qZ
         DPqOyjdRxMKYdTZdpCnYsCsBXpFaKgQd/JHTTAlRtkLVjGs9uyvc59cE+av1SUbwdn83
         pCCUV8pkocC/wtu/6KDOvf09mI/ASfaY/Cs0DQbw51BYGmGn/Tgoxs15f5F58W7Hek+L
         pcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000987; x=1790605787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYHb9kH5n2gjXPtL8iXQ1K/eTu+qNI+UomWR+lJyyTw=;
        b=tfOzoUKVWlWmpSPU7mFPmJ4yRaq1zDNllMVkha2xj6uQA61vBVB3f0Bx2lHdnKAR+B
         2i51+hQThcDmWRQL75CEoFU8IVtN9Bww9SrFgTo9TYDU1eF5fg0JUWE+NRPWrXbsW8ve
         KSqOVpKtRNQBhNE/aRwvwB8Ic9wP+CpPfA5cMf3KYXhngw1hJFwZVxjkk1sfwcyhTVOv
         yGvcZqNxAqFtof2heoz8bOAxDPI79Jkqdvuw5rQ0uIPTKFlZOvvxwmGEZbDn7rxrM7vr
         WIeIqaUGlRb1MRRl+98bgVFjEwfwiWdPAskYNEHBglpW3PetPj3fP1aL2Y2YEB2ZDdE2
         LrzQ==
X-Gm-Message-State: AFuF++nnZFtvN7fJR6wwmpGKUETc9WCu/yYfYYHRQHzzzPUKXN1rsq/M
	QtgnL2E/pPyhgYzay2ka61S9ZX1wzBBxshFF9eS4MuMr2pYp3bN0sdEbeGR0xKkzQe0yxwf9kQ6
	PObuUbpG3ol6u4HbmIM19TmsaZkyVYpHILFCe98DA6kSqlajxHcDBQYQAqLxNUY6DiyawyVXNBg
	Mv
X-Gm-Gg: AYBFou2mEQP1D19syPTtyBKcdUsMQpjWgU3TnVIjb0mQurynk6D7bnK7REf16tN7eDr
	X8rBU3AfJGDc5yWYphhLdYNRKwW0hqaoCr6M0Zxe5xhdwH5cLhmhwtZIFmZ66ltj7QikUVUdYKl
	qBRM4ZgigJIoP0iBq19k3QjYY4QV/dHFIPEqlirkDhEqEcl5PlRltaufHl3CEM5e47vAQc0L5t4
	bTJJm+mykJxd5bvbKudwR98aVisAJHRnpN7rSZtWU0wyBBKbP8u5Tbxq/mAKLNiP6IqbtCNJr7F
	sFvzl0VEtE0FLbXAHh/b+4NkMmAd1Fv73VmVQTNKnxZQDLep/dLSHEqpfr65cefji8PN7IBF+sR
	AN14y+lCQqa0oYxmaT2Amew==
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr1217889137.1.1790000986926;
        Mon, 21 Sep 2026 07:29:46 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:7a9:b6d8:8214 with SMTP id ada2fe7eead31-7a9b6d88352mr1217842137.1.1790000986500;
        Mon, 21 Sep 2026 07:29:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3572d4d5sm316686966b.33.2026.09.21.07.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:29:45 -0700 (PDT)
Message-ID: <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX0ud2xnghN5TM
 ADdRkGiQCNuISd8PdwtNTqJUh06Gf9/cTbJ7Ar0v1OztcWd0/Wk8dPS9vZBhGOxBYvvlqGzYLnK
 CAGqpSHJgZMogAN0nK43UUszUD4+ZSxjLHDXOmGdiuG/Z/8kbcLXRkiivk//sF2AHIJBE78lRs1
 KVEmFbAvE2PLPQCXpf9jt9mMpBtPQ1ryFasVfntNeE1PggVXNNWVDnnwo/RvoPmO4tCECVa/JqJ
 Zc28YK0aEWQC9zZSRPTl6t13VHn7Wkx0fP7kT/1BkiKzQ8eOG20WCHMbpvCp9uNgB27tqpzSKzm
 w23lg/yod7xNLbicf1AFFEr8Xbdf1CF/nEYqvurSZfUfQ5wIIerV0xFCur5YQS0ahIeyRPWGU3v
 eXlP0tGWKaAvcA6m/93eZhz8NXv1knnUqEVP+0Qw1Aqcx1nNrLc7/AWGvk16ecy37Ij5CCR8+xp
 FQUbHg+VR0lYerlKviw==
X-Proofpoint-GUID: pSBw7baIbsojKwK39oAzbx0qQ6bdVRPm
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab13f5b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iXOO5Yp-wZ967jpTHC4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: pSBw7baIbsojKwK39oAzbx0qQ6bdVRPm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX1iZbY0KOGOg+
 0JPjZO7bYCuou5/CAG7TeehLaOJMzKMXCrqEWSsym5U5JG9EXhNTkPYZg75JXkormAEplDVeppv
 uOsfiE80ZwKaCKbu2/fNC4dWJaijEZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210211

On 9/11/26 11:08 AM, Maulik Shah wrote:
> On some platforms AOSS do not respond to read requests. Read request in
> such cases will consume the ACTIVE TCS but forever waits for a response
> blocking the subsequent write requests.
> 
> Skip issuing read commands on sm8150 and sc8180x platforms. For such
> platforms return success to the caller with the resource level at zero
> to avoid the caller taking any action on error code.
> 
> Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

This works as an immediate fix, but I'd like to get some
comment on this:

https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/


[...]

>  	DECLARE_COMPLETION_ONSTACK(compl);
>  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
>  	int ret;
>  
>  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>  	if (ret)
>  		return ret;
>  
> +	if (ctrlr->no_rpmh_read) {
> +		cmd[0].data = 0;
> +		return 0;
> +	}

This should be -EOPNOTSUPP and consumers should handle it
appropriately

Konrad
