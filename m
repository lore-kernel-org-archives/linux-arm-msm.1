Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C826D53CA7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175113; cv=none; b=jXzJiZy3zKaJuWUyyT2zd14ZMAxeD8uG8cjnF0rlutpXeFcC7oKlw6JBZMnYzcDehxr1GGkxXfNud66SyMSHOfgpeHaR5zBB0kXhUIT9/7qWa8KbT2y8y9g1KBFb8ZBUeiYe7pHnjUdvJ2Yu1bv0BOEh1riHv2p17+nQTmc6Asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175113; c=relaxed/simple;
	bh=tUeK7QUj2IKE2uFCeChn1ygOQ/iJBXWinQo0JAkeZD8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KBB07OQF3Z5TkgF73DPRZXP7J5ym4IyyHo5TlyEk3N/DrJbt7Y9QryfMyI8UZy6ATSulXopIVlN/6ZrB6imZZ6yHJRA14WVtCUkYddbmcvXnwwfhcxPptPB/fqWZh/fEsnWhHaijtg72iA+Nkh2z72f5/zHd7OFJ4NIny+mcEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDPluFm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REDIA+AY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDPluFm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REDIA+AY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDL6mR177308
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=YDPluFm0OahNv9wZ
	cGvj+KSuUHVh95uSwMdsn3P3kJhzwjTDpi43NkpI/2SoCSI3jul35+60XSfNXhW2
	DzV4vf0pvvgcKlCUDELPwYzEuKHTJUDAgYnveKZy01SSwovXfd4dcd7ms1k+G0Q1
	DR544JEiBRHK5KLhHhHmydrvQ4mAx8IUEG2OSl/q1jOdNUBZrV7yzIvJJYIFO7Hn
	hNlyLG/AFRFUoIuH5dHrj50WnXxxxrN8G7TM50Rg+kYg9zpFKAMvfLYSGHWTOZwN
	+JuCpav51YiRfNXP8SN7C9RDlzxtfrlLvwFyC2iiFGL6nmABaZXj253uamIf9KuC
	98et3w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxrdt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 14:51:50 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso1903525241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175110; x=1790779910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=REDIA+AYqkgyQFr7ii3QG2EG+k1Oo2IqenhVGO0VTrABKJPpjNk9JJhVeYBkhVxwTp
         qJIM/+CaV2WGpI2MymDBLUkGboFGQXx7DllXf5eNv5KwLqkp5UoEztqL54j/jcB9cRO3
         6tMwvt7caXh8TIlThfZRK6JY429hhl4ojktbMteQi+bsoTD7LosJ4iWksnZL5uzIHqPx
         LxVvHxwKcHugdKpGJgThlucbEbp4JWAj9mtEobf1n0gYH8W0EzteTWDrkuxM5y4T2rXI
         XgPOd+0CtfpZZbafyJsZt/rJGmPN7nEc4104QtcVVR5erQtWQDB2ZPekIiDJw54zquI1
         CUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175110; x=1790779910;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=kNtmQFptlggsLrogwkWzTCEHVf9Efg7YUDTNIidHq73Oyy0zPBzTMkTEn00d5ONnL8
         wTLwE4V9VMF+L/gWIrHonXNOUE404G2PaZsaFSysdEW7EFXavwBDmi5dqrHbYqgARqE/
         0Rkl3MZY4IRH/iPapMUj8UKHBDp+rQ4OxSx02wakmXY5cL8HrpwrgzRk6ufXaHeXmssj
         RvW0Ujyv3OrmRHm3KJxAKGK8Tc43q11+pZQweIfztIZjYGV3k2WNzehX1pHvcgMJkGTQ
         YgddUDf4vDxR0GdLiWF8ykc5iA1pzkrvmN2/za3tOoAyEcHzobzUGN0+E3BQ6LQg9mGn
         aYyA==
X-Forwarded-Encrypted: i=1; AKwUvBz+Bm6FPuMKeGevCLqKAD5/ONo9DvIHlqLHPw5PqpRMlWlVIpBeg1gUxgvRdCNWZ693gnt3H9sWvek1twH5@vger.kernel.org
X-Gm-Message-State: AFuF++kKDi0uhzH/cxR8k5ohZixaOn1AplJkxRqtrfk0fAJThhNFehpi
	4zOG3tYHWnGfmtdi3BQnaUvn9jJ+epH/Qd3bRLkEyrt5+nXeDt0o3iFJWkFWRgc3TYcQSXDfo7P
	4Li1oIFgvwmWIFiCxDE6JvtLsZPI9IndXQ88iSRD4rjGTRiX7hXDi3VbAoDAyQfI8zJTQ
X-Gm-Gg: AYBFou0/pfiRkPd9t79oNjnrWOV1VAY6fPmI0+aC6VepuoDKTZANLRB2bH3M6APfOLx
	12rmx1zmec1VyOQjK8GoGl74cy8jqfp3WLYejEuKY/dgdTQgCKS1YTZw9hknCmwoXQA1tRTXw1T
	+kK4gTpdARK9ZdN0ZGBLjJf4brwdK6VoXqyiMVwkCwAQQcE9rWzf/ao4AHH+CvwwQuefVG2Bd8M
	1frAy+2ZcQCzvo46S+c2N1yDD5MX7DGb7tU74TlsRRIeskcBcywpY6N2a8xvDJgNjNPi6OvUHlo
	L8xMsDE/JOhBNIFxcpvkAPH4Omjttq/dCHUrUMDbD0y+FdK639EPVvqToIwy7Xgy4v2Wj+RyzJi
	hKLXoIiHmz9mqhvqdCIv+DZnpnLDEA3d4dHHGe6fGe+uAQzJS4WBLfWrPWXnmVpLGNOCXqUKga1
	KD46LfPXFmaovZsbR5ODV2gSLKUCWO3sS48Q/sM3ND1eckS6FPiqSDpJgiMCsM6rgfGbs=
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196570137.16.1790175109598;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196561137.16.1790175109223;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60a04csm143005866b.23.2026.09.23.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:51:48 -0700 (PDT)
Message-ID: <50b27e3b-729b-428d-a903-b118a5bfa249@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZJsJ53uZkSEeTLXbGWvzNoEVlybk2PCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX+DhqWrohYAhd
 pJ8Woxo+hfI2BzsCp/WNyXQJNe8cctE491nktf6EiaV0uaAfZkZXTdo8/nFiNrCH15+/tP5imnb
 UP8uuO9UFWB2NcZ9DJnGDcnq5qXLem0rLnQfrhZup+ym/KHPsjHaT169xY7wE+DdUpUmejEqMn+
 Au/sSu4iPY6wje3fEVmxS+r1RcrK/1qC7irkRZCoE89Vg8rZ4bhgmGRpPbL51oR/xvY4h7rm4+w
 HzyitDKp2DaSkZlxV2iGddBbe22cLr4ny5UMT75IJa5+4UjTiGm8ZC3fdfyYRKsUtj0m7u6nyBP
 PI7YpD33DL3GgcA3yGvhkHdWW9XYA/KBkUp07FdsQOyfSpDjlrDGR7AbXgJm6NjIi0iCS9oBZ16
 Ne6RgRVu4ge1PYqdhOC58xn9wd7e72pOuuD0lvymqlR6yrA69xC4PRvGydIAgoExrttfByigMRG
 xB1rz2XYwZxskI4piNg==
X-Proofpoint-GUID: ZJsJ53uZkSEeTLXbGWvzNoEVlybk2PCw
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab3e786 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX2Kjrtqp9KaiQ
 RIgpc58A62FZc+uUCf5zXa4SXNb0SMXnSIkvBBZGhPESjEYFq2O4zRPmQWgqfFUh14YEw6l7J5P
 LQiZLe9MVCBuD+m6QtjcTzoMUhxjDi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

Thank you, the fixed up commit looks good to me. I'll try to also give
this new version a test spin soon-ish.

Regards,

Hans



