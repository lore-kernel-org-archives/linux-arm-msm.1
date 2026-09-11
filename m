Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2392BE7AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126825; cv=none; b=lrLPXZtT1tLHWaPGA5AIfFqcoEehezid1WON8Svs3hNbyhpBn6xZWlgT2gtP3fIRh17/ZZRPdlXc87L16N/jZ9nvSe2YO6JFYmR/EKA7a1mEqhz4LcCz5F+ryOOR6amHOVJywcgepC7th81+MHn7QbrzQ0kwmCh7KAxweHtEDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126825; c=relaxed/simple;
	bh=AiFZxVxb4uPFuB6epvfZYhvtU1oHMpSADyh0bZhRhLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/3MQy0niR5Fd1bHMzzdkQe62SgSszGY3xWA9cbVYtlhp/03PlYc9c25Wiabcrm2Fy3Z3UuB4Iiyq6hEM3WRHkrQ38mGV+A7O9By7yoblVGAjIVGcDn/DZJQ39Ne+9DKbLB/8WxYdmYkqMIG+SjDW8rQSwoEBCk7sxsxcdKU/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9V4kjb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR68RKuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9V4kjb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR68RKuZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqin23788374
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 11:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=; b=K9V4kjb7SQeHdbk+
	BQMo9NMTrDLO78f2+xH2BQ6KW3qMZHJEqBIiHCohKkU+edfFGLfPn6yTfePW0g7Z
	WCfQSJ+STQbnQCh8oJ7kH8zFnIugyOjt5SoFsvmePuObEHkEOCwAF5mr2XYgjq1c
	yLP3PYzQzgdw56cGFwUO38f6RMwsAzC7cHDCU6971B82yu1IcUIipNE3WeAlVF2v
	hFJaX93I6wc+3GloOuJVPKga+TPcYbDZ0yNUMhlIdDOtcblT3eRXtVPTCkH1qQeb
	7eZ33+V+VXB0lxjnmCBn3vKIJkeSHglHnq9gJiEMfi2fUDliqDYPKMJZTGMgBDsH
	N+ElPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2bp86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 11:40:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1565321a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126822; x=1789731622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=;
        b=GR68RKuZNoRcc4TK2tUyu2zrxIahyXQs8s6DczYxAhycK7hqDMyxMn9xGuy1JnDeux
         00eJg5/tajlB7LwkC06043WzNTo95VtUh/PpOsRFjQkLWZaZkcIpw/6DAahJShc9hc96
         XgniL4/kx6S+fsOwiEDY5zmqrqEwr0YwLd3pV629ck5v/8jRSu8YTuD9IBMZcivblt5D
         Gf+GNiHAmlOZgrePKwNci5YV/Wd8CVcUIzWNKTngy+X8YpN5eWhRzRMxoJLv8Iqk820G
         P0xZpOBikPNLTxZlehPtf5u5pAIunBDP/o/LLX02ASVNrmHxzNnH/SqsGabWnL/6eJ8u
         4JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126822; x=1789731622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=;
        b=FveB46hVUeh69gbQFk60ZFAAQ7bsVoOQsZGpYX/8VCSd3Oxp+NO8Jj8X8qNvBpEIcF
         RuDse+dhZcXFpW8XO7PETbXlOBsKOrbFTinl976mrZvzpDLYe3BVWSwtB2scoxhPIVah
         Wlw9BrqmPs+F5ZbqhHnJd/N+fUEjJ4n/tkFFmU2DvOKZKv9YN8lG+3+BkEY+DKocsjHG
         Finvcig4dS/62iR5piSSfLJ0kEdKynvgy8Iqxg2oJGxpcBWva9CkU8TS20cSHjd4Xyiv
         0RuPL9zDlIvOSD9o9O58yUqGgH/3PVKmRfbwJ99ir1HcFMYOlSpQLz2IagdFb3B0vGje
         /58Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDsqJGtWRIawSmxh4SHP5I/gt+PxtTDsfBUqkIlTd41bcgfLqnaVyV9OSBt9mfKxxrYZhYMtsK6cLafjh4@vger.kernel.org
X-Gm-Message-State: AFuF++nHAkhcHMqBLhhaLIu0gVKJfWyEbHasPszWp/+DaTPPm4vRoSwd
	3Ow8VfbeDXcKo+VEJMvzRnCRuv0qxn+C2NM0QQ5J5MKxXnEWjwFYdSqV3MWKZLgVoL1Kiv3WeH0
	cjttMr4LY5W0QRXK//PIb2MNjOpqboSIYKi27pW/foKBPoYg5lrr+uohG5TXwt9WykD3K
X-Gm-Gg: AYBFou0KTd1C0fUohZYXJvHIZtzZb4dZNIXEynjfpOtYAvl/OPgpAUPSWOLXOOz+jvJ
	a5tUkUgZ7PbSE0thXgpEMAGhyF6LL32o8X7akC9aM+v4HpDlAkkcGfFr2PJdcfLwowAeB9z4RVc
	OoMG/HiQmEpETPb5T6tegcy8970VOuFzThfR9ay7umMa6nzuCWlkEB3bkT3YXhT56nqC0qx2oJa
	G6j85mlyHKToA973mp7xkX+/qPS1Xd+b53AEhWliZEL8a8+fLwnMXLA+oZXsTujX0zWoh3idDo5
	M5DHiJiBYfhV5b6OIJZl4T7E+bsLKB9FM2f+CTldLWmj+TV5XaCu6/61uEn7WwYdtHrqTt7BQ/o
	Hm+7iFHSlqDh6jcbf3DiYzDbSs3rONb5E
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr12122450a91.8.1789126821938;
        Fri, 11 Sep 2026 04:40:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr12122402a91.8.1789126821413;
        Fri, 11 Sep 2026 04:40:21 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm6705009eec.28.2026.09.11.04.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:40:20 -0700 (PDT)
Message-ID: <9a6b7238-11d1-45ac-ac0b-ed34c6109424@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:10:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix bus_info prefix in VIDIOC_QUERYCAP
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260818-v4l2-compliance-fix-v1-1-77f8076d5ca3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260818-v4l2-compliance-fix-v1-1-77f8076d5ca3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3e8a6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j3-kLYPpZ4N4r97w07IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YacjYxAAj9vfjzf0QuhbLtTzi3HZgM0l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2MyBTYWx0ZWRfX3h9eW2FTrS5s
 PHUtiLPgOryRTYZdJBMLI3CapSJWF6NUiLWfMfVSLVrcc7FrIQ6AhGGzhGchRDI5pKA3Hn23o8Z
 slu09l698wp68tYL3a4ZoG5OyVB0EUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2MyBTYWx0ZWRfX9c/waJcFRNjD
 9g1BavdDJUk0ehRKM570yB7qEkVU0YpOrFpCfyvmrr/GHQjw63G8EIcp5QW77iJ4aUeZ3bX88yn
 FlvNTwYddgjv1FW123uXrvaBX4Kkhdpb1INJC7IMlK2nTWDA6nQWDd/xF9aVXUo7xlvauWFARv8
 nrPHWRVfG2glFEEzxC2wXw1bmNEjw0yzmQQIMKhYDZ0ObuYYYDot2H4B9Dxom1s+rwQTelpY2Es
 bEr1BpknLasPbTZwxA+7G4JX0t3Qq8nC5kZbfLL42xkvmdGIcd8nWzqwNkQay4LY1QKKNffZ2IR
 pcQ93ykPLTtWnmWocLxSO5o5sSwAlQYN5tet15FLbtNfkeE8VjzWWAIFdwplTqxaGYoO4W82eCB
 kxTeFDREAfXiZixkbCwT7KfOJGpfsJscbj2WCVvz0aqGUSPSP3HLNrIor7b0JYQ/1Qn3LWzhB7t
 zk/B+0KY8fHQ5NULOpw==
X-Proofpoint-ORIG-GUID: YacjYxAAj9vfjzf0QuhbLtTzi3HZgM0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110163


On 8/18/2026 9:43 PM, Vishnu Reddy wrote:
> The bus_info field returned by VIDIOC_QUERYCAP used the abbreviated
> prefix "plat:" instead of the standard "platform:" prefix expected
> for platform devices. v4l2-compliance validates that bus_info for
> platform devices starts with "platform:", and fails otherwise:
> 
> fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(671):
> missing bus_info prefix ('plat:aa00000.video-codec:dec')
> 
> Update the format string in iris_querycap() to use "platform:" so
> that v4l2-compliance bus_info check passes.
> 
> Fixes: 94ef75095d5e ("media: iris: Enumerate cap->bus_info to differentiate between encoder and decoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016bee..d39ac71a25aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -466,7 +466,7 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
>   		info = "enc";
>   	}
>   	snprintf(cap->bus_info, sizeof(cap->bus_info),
> -		 "plat:%s:%s", dev_name(core->dev), info);
> +		 "platform:%s:%s", dev_name(core->dev), info);
>   
>   	return 0;
>   }
> 
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
