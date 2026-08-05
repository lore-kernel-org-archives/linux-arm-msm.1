Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85736483BCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947955; cv=none; b=tp64DTuerOm22vwZDuSMf0JIrwVIlj8f1C2wYE3cR8lPjZLjinpOy2UJm3Rq2bzHPui/c13/y3dibuo451T2Y5xdWWScDFQDI55tatWG2WHawQzDNvynwKuhnl24ULL2FP6xb62b5MzibchiXs/d4fhtXFj0A5UnqIL3o516k+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947955; c=relaxed/simple;
	bh=dMLwhSCfvDKAKTsi/oGCwtGRuxWrdokWflsUXBRcWdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc80ZuKfiHN99yBDwhuOFuW7WJJT5f9NnQvSwF/P8EVM7I8vD4XX4VGmsvfQBygCcBH4TXTHXzxvUOZcbuOZtxmCToJQy8pbGC3LkQK/IYRicStoa/yYM0A9Rwr0aVz6UTUuU2/9DkIExD48hu+ijUKU58Kx793HbEXH3XVATW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZU0SjmNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Txd8aQdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU0SjmNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Txd8aQdv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVG7x3297551
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 16:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=; b=ZU0SjmNk0ZCOFAlA
	GbOJQ4Q2zAGzAyp8Oo88FB6C17jz3trfFYuAzox2HAF60+BkPJGGnduE8JoXT4k0
	aTlMSIpBrWf7S1I9dLJaEFP/XygawyImk+EgkW6pv7ZxjKLY9rrtyi1G7uIsTUQ5
	CUr2KF/p8bgOTPFul/uT7n6h2vJFLosEikLkgqJggDp8P0SVPu8tEdA8hcLHTsEj
	y3m4ddMcsKK5u3+RhS50kTFKwnBIS2w6RlnhYzglU5g/XupF0ZMQZTgctWeY04I6
	p70m8bRfuz38NnrYjr5svT1TluHmqTfcemmwYW9VrxDspsH7igm6uykhpXBBu8dT
	l7Idmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5s28r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 16:39:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so277702a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785947951; x=1786552751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=;
        b=Txd8aQdvX9kpoQBIeTaqD+gtD94pU7byeFUnQ6cFEwDO7zCzRs/n7o+g+7cV0Y+zRr
         AwkRZLVdbDQmPboAqBMzOLrMe6bcf7hOQmTt52v6HxG1ZUzTaNXgiKcjakKj0Vz/rLBS
         KkRNew5w5Xp+qFQTwyDJDKd8LPnEIm/M18tINKvNYfCdJ7wm9jOZz5bQsgU7gVUEMAm3
         jnIiuZ9YWHax5Hn0Pt4yBmjDmZ60DWb2B/5qbt1HJZPlBIgwXB4uRJkrcn3cjGSRC6oY
         UZaNuXZrBhFa7C78pPwFipnUBSEIQht9qgIqmnYo/ljJRyYRXBPTm4pveX8PY/F0QDRd
         0VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947951; x=1786552751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=;
        b=aFdgOL1g4AlmLk2qjUP+DAFDhZYPNLxEaNQ+kcLaS6X0lW18Go2hACl+SpUecuReQM
         n9rhVq0bvGmqRsSB5mTFi6lLFxXdzd5k9Fdvmtzs5CHbpHZsx3emI0xWIt59E47gGNxK
         l0vbMP1tmatBjv87vz3djzeKNjbso96ITOEwA6AWLJyk2PC7Nu4ec+q1PNJpmFoUnVKX
         Rlpo7ivZCsf2DJuGOuUh3+2Rl2CQcW0fXtbhNBDETa8Q3OwEVhf5CXB+LgSzQ5dOE1rr
         c6pAbGqf8NXvwVkWy6DoLGIFG7c5i0BN9/yOJwAVVf5w9X/tzEmIePHywp0JsT99IGIc
         Y+ww==
X-Forwarded-Encrypted: i=1; AHgh+RoVQPH2cqUvwNrgjbmlDfVJJRKrHVGDux0SP7xcOsqiFtmuK1M/iqIOqlqat39SSuT5dNs9eGbYLeqoJtaC@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWI2uH+5bBQmxiwSgzRqiQpr9UVxnAMs0csJBd1/wq61+Xc0m
	2B1KUg4j0VS4QP2Nbxp3J8M17xwAN9eLzKOxDWCukj+CsMFWL4FlTErTpDiVC6r91Q4+jgllQyn
	zgBoQp+qBC0i4DaKumWA1rnEiwU2vDeebTiAv6Eu/sa9krkBED09RncBqywMgWX9jh+dmLzWrR3
	xV
X-Gm-Gg: AR+sD10ID50nDBq9mqMToFRJ6ZDufzw+BP3RLoHDltulXVHHadBaCNmwCqT90+e7Whz
	umNSCLbzSIspJDAlgXbu9ln6injmmmcR5KD0TqGto17KdvVU0d9DJekfHvX/AtEX8tzGMOS2Ex/
	biNKCsEOsqCAcNnG6XW6c5JO1ZTNuj5MMgIb0sQTlElO9a2aFiPNt9lAAqDekqgfoyzK9rjWR3s
	F5dbDmzy+jMvrhA5KtRY+t5T4JVRNP6cFwkPMkGy48rtq1HLc/DJqvyQ5YR6rhQy0MAs2M19ySn
	6mVR0lMWQ/d7OnBEfB/8+1qkWDVW0yvhw3Zt/jPWTR0r/7aGO3J0Tc20cywmdF1dHqACwCC68i9
	kQe3qbAly7pLn8TGZthO53GQ+cEi3yvB+oC5iQx8ir6pc2tlyv8HBBg0wVcHCEA==
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3903c628181mr6312857a91.2.1785947951092;
        Wed, 05 Aug 2026 09:39:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3903c628181mr6312825a91.2.1785947950614;
        Wed, 05 Aug 2026 09:39:10 -0700 (PDT)
Received: from [10.110.6.162] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm15419492c88.12.2026.08.05.09.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:39:10 -0700 (PDT)
Message-ID: <b8181ab2-77d5-4a80-bf84-2f4e0217d2ea@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 09:39:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Implement Region of Interest(ROI) support
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <_l91CrDl1TZCUzjX1JcRr1cgRM6CNFGa4eRe52VgXTUOOcx8yjj9YCeBaulfAgFkrnN6fCpZfpCIilkjdOV_JA==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vdeztjk61vUp4b9r4Bi2LbcjrhyYWtEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX1oc70eu2Osio
 6Fo/m2/If+wzhf3BpZSYE/R9FFtmX+o2OkujyqfVqYjyDGOeYKQ9OHq9hOGsjin8oV6YyqxyviN
 u37CHcARHnknpTeDlrQf/onJysFLwjFAwICL4b3w2VoyIn9CwuY3kygQ5A0kk4mwyAnMlp/TGA9
 wpwDYHTVFvth69EZ0noEjgB/XtMyVHeAuFgzLp/UiKncZ8VtVsRZJ7xuAgGddanCdl09qhrwvhL
 UlZX4eYUDitqJ5EWZUPdnPQtYvGv4i8UmOxIyS9Sx+cstuG6NhpxQxplDuGt6dSKCEPZQuuLgOF
 KZcF+pTWIPsCXflAs5vuAu/l9yGsPI3mwc9Q6Wakkzrt+PpQvq6ra8J09jexCdpJe+8izzxNeEh
 HvIPuj2H0N8dq0AgAI3tMLu7RRz1KzH4LLDLNpTb0biPt/hTw3rt+j4dS+xyTi3uqEnPHjkadmw
 35f3BBxikYv9cGBeWhA==
X-Proofpoint-ORIG-GUID: vdeztjk61vUp4b9r4Bi2LbcjrhyYWtEz
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a736730 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lqE17rhkgLkBxHscucYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX6Vk0PvsgM5hd
 FfT9HviZHslSDjXLrHTlltb55UCzMLTFL/CvTPddsPNJTviNNcbyBUXFNFUaGyylmQ51bYPIKdA
 qiuClBsqIHR6dWi23orv//Tr90NuH1A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050135


On 8/4/2026 9:09 PM, Bryan O'Donoghue wrote:
> On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
>> Hi all,
>>
>> This patch set implements region of interest(ROI) support for
>> video encoder to be configured as a MB based delta_qp for
>> the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
>> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this.
>> Corresponding support is added in iris encoder to implement this
>> feature.
>>
>> This submission and design is based on the feedback received
>> from community for the RFC[1] series posted earlier.
>> Initial testing is done by adding support to v4l2-ctl[2] to test this
>> control setting and its functionality.
>>
>> [1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com 
>>
>> [2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com 
>>
> as a sidenote can someone in qcom please, please, please do something 
> about Dikshita's email bouncing ?
>
> "Address not found
> Your message wasn't delivered to dikshita.agarwal@oss.qualcomm.com 
> because the address couldn't be found, or is unable to receive mail.
> LEARN MORE"
>
> Understood she is on some kind of sabattical - hope she is enjoying it 
> but can you guys either remove her from MAINTAINERS while the email is 
> bouncing or fix your email system to stop spamming responders with the 
> above response ?
>
> Everybody responding is getting these bounces...
>
> ---
> bod
Sure, will check with team internally and do as they suggest.
