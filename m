Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD7449B24
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322183; cv=none; b=ZlGdEmZOcAGng4BovVseZIC4lioMj84ys7zs/03yOgXAsE1VZlMmY9glmPmWlDj05eQZJwFB+7xx/P7qdhCEByckC4ZUu60HuqKDXlK9eu9IPvtUJ1iXh5GJmx+fpHnj2huv+EJDfDDsgCBzSDQeDKvF3GEIbgDEeXQAp0oHvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322183; c=relaxed/simple;
	bh=2usr0i2dFD5LSEt/TM85K2oR2cSK9laanCcXUmD0pdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXkFvBtq4P6jnTNMZY6QCyNiXR3UiooxowZxDYiRGRgSu+yUD70cg5bq5AhqfFRTsuC02T/l1/bSDJZway1EV1ezU79miWmWJoyMVsQiOEPXDUM1AFL5B0Q2IpcG66mW8XzZzlOwR0y54rTZ1vVsS9ZJgPH7nr1KRvbEU6cYWIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OG27n2YI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnTr0gcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OG27n2YI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnTr0gcQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T8htRl1484338
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=; b=OG27n2YIQFTTwow2
	AOSmAJUO9yWICPiPADS6UdPHTrUdRUsH83V9pQdpfI/B1P+tGFG9v+aBQqdAD/pP
	CpyD08WCjCqSXPksrLqKBeUzi32JVxB3IwitourBH4w+2cK3cVScqG5E6u+Tnbh0
	vWlCbwk/xGrFRToFek1nBKo69m7o53Qa85+Alc11dfb/haMXpAx5usbXyzCAiuEi
	pqKpk7WOKIwjcOgR7/MDFbD9apjytt/4zRtZa1jKHUDDlHqJTCnr7hZpONn85Ai/
	9YVZ+mD+Dy8uOZvTq6/QiZ+i9OZH5OXB8P4DBZihFgetBbQXlXBEnMoHbyfv6PkH
	BIQTEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqe920jhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:49:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso12119645ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322180; x=1785926980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=;
        b=DnTr0gcQCsApnK83J7LjD/ouYsgiAKq3MCAsWsmOTq+S0Wqj7ROkX4Xwfb26ovZuU2
         DaJ2ZWMa0t3JyDgxTBBQoJHDCO/WZF3t3HvmdPS0rn7DjI4Tz7cKF+ziJtBZubYzex9T
         93IO2N464ee4L6OH7qse6+R6vF0hMv6amzL38n6paw/dvSjr4gDCToy5MK8dSqAoMJuP
         1eSFbUq6NeX5nIwHNd5XcKjhq86VXf91SG9SQqn8hJ6pQEhoB7RGuqTRTWmB/Q8+P6Cv
         xZG3AGYh5ABXzDPRr1LrQkaxY/j9sb6VFL/axYGE7qxiX5bxK290S6YhrH5zK3dGxe87
         Z8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322180; x=1785926980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWAY9zP8dExKQDKxyzQktKQkEBLqrC9Cfvw5ivxGBXU=;
        b=A5R8tjBtm5TsXXUrXqchNqWy8Z8VFluaOYmrM9ZU82BoaRrB3OG381vdwevuf3Qagn
         NLdqjCMNSajcERv5wo5yDQ4CbVDPqMU9iiaEnd8c5YM5W6vL5zjithlXbiB/DI4P7jmg
         8IY5gbZ2e5m+XNEOtwXhf++SFi+1PDbwl/H9fui4D/v5/C41O975QzFMP1ldZTneWmbL
         EQwWvv9p0r/TtawiAhO6KuRiMOZqePdXmaOh5mCit/3TINncse3QEiO7zt+ae1yl6THW
         ydLYVnZq8NSMD8hrJhD+DC3VjMgaQnnrvhFASKIVs66yAzBs6bbnHR/ccF2M/FAaHzrN
         xvNQ==
X-Forwarded-Encrypted: i=1; AHgh+RphQu9+zT8GKUaVd8ZOAsbHAOo6QbUX7jeJncFNSSo170F0ZR7NoyC72n83XUMbuP1V/s1ADsEOQMl2XQNC@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWs3ETdZmHgtBNgXdCWD/UU2+aJmyKbcWYhHlP/ERWsUfxy2s
	dyl0S7m21iwbPI7tb+khmjDWaxCGCo6QPwlEMjm5StSUTu2Eo4H+Y1vWamzO5Q0NQOxaZl8U/b8
	bqkGdpmtNlzBa/W9YjQaxD/j6/WtumPwy9M+tV/2fA0Aq0hzO4nGCZQx3UsmmOikIbwjg
X-Gm-Gg: AR+sD130outCcorA6tdyyhyjqc4eH0oja1XIAOVjmY/UbjW3t+wfXU1ziwfmnBA32t6
	Lrik9gyqEzk9OvUi6Y+Z1f4KRNbHfHcPuXSniasY6/6gEVeYVcTyjofCCx6dhBqu5/wlIKeTk+Z
	sqL4oF8B845HHqm+x0Kp3fnV6KiBmCGiMBBFmE65MyCPQLAzn2SFOQsD3nC982TgUE+8w8IS5RL
	SosN4GpCRxX+f6sL9pCZqDh+vj/8QhT4ersYt+o9CNwKJUPMrRI/s0mQqdmox1A/esXortkQdBw
	PmE9wCgxX9pCNZ7x7CLGJyKOsfB+ygwuK1rFsTuSi97WyFYHNhQg3NuEm8e7OgNSaFVBPNc3qeV
	58kqM5Co0TYSjhdRPatsnfQ1tKIiztGYNYA+w7ejAR/yhH1ZQC6YkaYRWW++Zi+3JSyye1Tq+7X
	8e81kl5ftern4X
X-Received: by 2002:a05:6a20:7fa7:b0:3c3:f431:25 with SMTP id adf61e73a8af0-3c8ba5b7785mr7131223637.39.1785322180298;
        Wed, 29 Jul 2026 03:49:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa7:b0:3c3:f431:25 with SMTP id adf61e73a8af0-3c8ba5b7785mr7131197637.39.1785322179891;
        Wed, 29 Jul 2026 03:49:39 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba3519a5sm724263a12.18.2026.07.29.03.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:49:39 -0700 (PDT)
Message-ID: <052e32ab-c7a6-40be-a11b-3d11f599cfc6@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:19:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Linmao Li <lilinmao@kylinos.cn>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
 <d1a6474c-68c1-42f1-8d2d-ad5acdd25fd6@oss.qualcomm.com>
 <b98b48d4-6e9a-4fca-aec6-60cb618a9056@linaro.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b98b48d4-6e9a-4fca-aec6-60cb618a9056@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX15N/NGH4Wvmv
 4Tn2rroKketg2pyys3odhloX7xZprMiCwdzjhi0coHwPKSJ/qj2i8g07ClybOnWYuc2B3TNRkJq
 IHT4mgHDvQChKbbPGyP/lTN8HiEWai0=
X-Proofpoint-GUID: 7JyEqQEfmzM5QeKeed_zlL_iqSMe9dbQ
X-Proofpoint-ORIG-GUID: 7JyEqQEfmzM5QeKeed_zlL_iqSMe9dbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX4/Yamdf7ODjc
 LfWuzehAhSImuyGcOqo7hAB3cbY5n+xt5NiZT0cnL5fcOg3pTWbg0ZSb75KhzMEyGS4gdjV+og5
 1TswNRJ4g25wNkzH6ucCZNe/pgt881lF/HBa4QCiRKm+JaZpYclmorTuI3MklFTlf57OYItrBqs
 +QrQ5fhMfp7cOtgBNhRjpdV3RTuu1d00/53eY1rke2h4UBQr5u82a3Hr+xXqaZRQMyZ+1GFg0pi
 q06V1b+WhE64Z4p59gaamxCg31R2FQrETJle2AOIfs4Re0fM9CoEj9ygU8Oc3U+Fmit0ZJtahyH
 Hwe+FuqvVRrx4uGrZyLBM3WsuGjJYl892feyksfSclR5IHEf9JwyMKpubbWbggxDqwOaNp8yR/e
 IB2Ou+qYhF+6pN5Psmu/J5r6r8H92Mm+FWS+N+ToQKnMAAuT712baA9leUzWV3xddTdVeYIgkhl
 oB0UZpn91iicsdaZ/Vw==
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a69dac4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c4HiQqaVnwyIzI225tcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290089



On 7/29/2026 3:53 PM, Bryan O'Donoghue wrote:
> On 29/07/2026 11:08, Anvesh Jain P wrote:
>>> -    if (resp[0] >= resp_len)
>>> +    if (resp[0] != resp_len - 1)
>>>           return -EINVAL;
>>>         return 0;
>> Thanks for catching this — nice find.
>>
>> This is independently fixed in an in-flight series that reworks
>> qcom_ec_read() to use raw i2c_transfer() instead of
>> i2c_smbus_read_i2c_block_data(), removing the partial-read case
>> entirely, and it already has the same resp[0] != resp_len - 1 check.
>> That series just hasn't landed yet, so your report stands on its own —
>> happy to add a Reported-by: Linmao Li<lilinmao@kylinos.cn> tag on that
>> commit when it's re-posted, if that works for you.
> 
> What about -stable ?
> 
> Seems like we should take this fix and your series should rebase on top
> of the fix instead of the corollary.
> 
> That's the way this should work Fixes > New stuff.
> 
> Can you add your Review-by/Tested-by and then rebase yourself ?
> 
> ---
> bod

Agreed.

I'll rebase my series on top once this is applied.

Reviewed-by: Anvesh Jain P anvesh.p@oss.qualcomm.com

-- 
Best Regards,
Anvesh

