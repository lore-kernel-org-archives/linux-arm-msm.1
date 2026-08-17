Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB233BB69B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953513; cv=none; b=AzbsgjfgFfTALWWezJwLVYabHG69mQxwlq0iDOSddyodwBKqrLUp7pKsbNtQvdn1yHDAjJQvt1qAryWjBu5SYfffmcxhhxujN6geQziUGk12elt0HzGXJJytogc9WDTQGdJG6RhUaVmW1uur89xrRNIYpoOxhw0iz37mrUe40qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953513; c=relaxed/simple;
	bh=zbH6WoBICLoXC/BGcuKmdHg9SUeMHfF6bhR2aKbUpSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5qNqLRKdks7a4V44b6XH2366pBzyZlyJ7kboEjJZNgYvnzmK/KSeeRBxg3bhFgBw6gwev3VEM5ZytfX4C3hPx4KnksEm3KsxKJoAe2qhloJLYaygpxZ+3t8nh1Aiqg53TSn8qyBsJ5lJjMN2xjdNZmmhWlJj/DIBAzbP2jDM4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFtjP9zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8WJaAIX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFtjP9zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8WJaAIX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6x0vD161102
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7r4ebRw9mreTVg7HmrNMvV9tbZ2lFh0RTJUFTohstfk=; b=JFtjP9zfF33JzjVM
	pKx4kg1vMAdgieJg5Rr9CUSP2PaSxVC661mNV+2mY8l04wIn8r1hFfqjWdUFthWi
	0k/VDThilU0lrj6LVoptaJAN5+VNzhs1ge3UXIx4uSdifCS7IX8JUZwcr9HHoazV
	S/29eCZFWF2yD//igQEnBhOsQPUFOLhmoPyNBnJfuQrcds0ekRT3Ja2TyhZU6RL0
	fxFYWZ6leT7soSzXIqW0HBE13yGtr1U4zo8t8C6i+kTtkRJoYHLaWy98PRsoh8qP
	90bUBMsCvDxYJjRgDBNoWdr1OfZES1dEmW0IQO9SrsHutZ8vgyACOeesxCwGJWE8
	cfi3ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5xgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:58:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930f80ae4f0so18552985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953509; x=1787558309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7r4ebRw9mreTVg7HmrNMvV9tbZ2lFh0RTJUFTohstfk=;
        b=N8WJaAIXVVkjo3PfsCpgPfhJ4yYT8P1MYh/HFzsWexRfPGE4jRdxtZhCqYI6KWRjcO
         q0TNXsybEO6NX5GiLESU9Mw9+0J8VjCcTFBQOJiLNDQ73TZBTdwL4SnRSD2SXDn5YNHF
         gHS2qQneFsXKgtAne1vi2wjE2w9EhkCKBxH0DLQflQheGK3bHT6dTAfV9R390CuxHsfs
         kGuUX1j1oItr8XCFpBWC6KTVElS/999kd36WL3HU8P/AlyxylQ1vCs9OoPintNr6Guz6
         cUChobV9wBZNMeyOBWIzD7/nZaGZ1r4EYN0Ci64a3SBZSRcKgRxPB8oqpX49a0QJqVPm
         ci0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953509; x=1787558309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r4ebRw9mreTVg7HmrNMvV9tbZ2lFh0RTJUFTohstfk=;
        b=mFfebbRwbhBL7w/7yIYC5ijba7tuuG4KLj/pLwLZKXlT80RbwAiumnufcYf32FFOlX
         GgODn+K6V5ICcKIKuXwgQ6yj6F/XFxyKOX2RomAZzKOJNSsi/yPzeXNMW4oMAT6up0OH
         4aBvOmGa1MoYCPNLgEji2AebIsLqe50RTgc8PVaVyUbjVVPQ0L3NSS6iNawxlyEKyDfg
         GX5tsftiRYUflByWtouUPqfah792u3gpllq9Z4xMu2qSbgHiY4nQwVee9VDiig10vjKE
         Gf0hLHGJUGKQ9olM0W/6AZtB8+IpmFi+am13x5HFE8UH3BtdlIdK+edJCcm2fgEdYEbJ
         AIlw==
X-Forwarded-Encrypted: i=1; AHgh+Rri98Q7rt1GBrLmZB/Flfgz4eFeyiB8BljjLEZpjn0F5ToFHK8MGksHvtTH1kjucd5xEIgZbqLITpqOj/o+@vger.kernel.org
X-Gm-Message-State: AOJu0YyvPGqUuAMP3KXBNIeiUiDD4aJMTmd/40iuSIkM7WxKPE1+byNE
	e7NNdqXQe+rlX3mXgbmuNiX9ah8PnUQ/xpIum0wUMKbKceP4zPG6js31k+/7tCvGx4EDULGmQ1u
	giaDaaeBAMqyAX2EYsf0K0L/0PtWmM7hDr64Ol0NAoo1oZJ5fwZLVE3iXrdU61Lnh4qjq
X-Gm-Gg: AR+sD110LW7+zbiKxHCFv2eRTW+fAjZR6LlX8s8z6OfC9grtBwJdO2IaMqwz9zLcdm/
	nF3OM8rdiXppC7y4bOUO/jjVcPcA8mF6F4CC1gyy5JoLMrGMUpLloczeNSGDPjgqPAh3RYOUfpt
	NUAHHNsi50NOpR8+2I4ftB1APnClMFx5wHjJ3zyBsyflm19tBlQk1YcuWXf9bNtBCt6ke6PISO5
	NXLoWVHFuSgEKQsQcu93V7IdFDvdUW2cSMwUYI0CrwoWHmoSFxRY4tho/iXLl5HPEyfS7ntHTi0
	0h/nRCFmzjRwR72FVWPzY65ylMDradLykNl0wF2o4UIZN7/SsIa6epa63p74plAJBnjLc99H2oN
	ozIBprxZXHgliuGA0Kg6Atrt6
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1745612785a.1.1786953509683;
        Mon, 17 Aug 2026 00:58:29 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1745611685a.1.1786953509302;
        Mon, 17 Aug 2026 00:58:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596ce4sm289925a12.21.2026.08.17.00.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:58:27 -0700 (PDT)
Message-ID: <720083ed-a149-4872-98d5-c4157586d628@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: Constify struct qcom_icc_qosbox
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f9d9ab49e961b3bf3f9bad39f22cf8b06afb2381.1786554463.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OCBTYWx0ZWRfX+VdpZlzOdMWl
 Vdm9dULHh90meotcyA+LCUBFLsSv7SYGdCjFhpQSr+GSLLl4HlG3De56fniqRWhy4ZgxFxbSGTl
 q7aiypcLTjLDk4kmfEcLp0F0HJ5SK48=
X-Proofpoint-GUID: f_Y8b17h36H2-jJRMoDv9Yf1myyffwAc
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82bf26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DA585B7Y4R_hzP9QSM4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OCBTYWx0ZWRfXx4HjJK+lQEBs
 DlyWw6lg/ADA2CUzuRV+/019kUYCOjaOxzYoDOWgIJyxJGEXWjQOnENBLLDnrJQeSkrryKQQat1
 MnqeqFNr8OcgWetttw+wcos85OKouXZFL3sks+2FVTqjQYf041uKmat72m6Cgef0alJsje9QwMt
 xw2MRb6bVtEcsAPlwLeJ7Ni98rS4FWlOG3LtlE3hfQc/eHMRlpzZjdTeeIXtF4JJ7lHgbrIYpyC
 Fe1xYkuwXgEr2HxOh5alD8jWBDp/PqLwdKA4qiQE3dZfIvXI65zdL9tMW9lqg20RWvpe8P+oiNc
 SzBzjxkIJwxpG6ZIqOoVyYvfxSpWoLfcENksbOu8lsyIaay9IE69iZk4Dbw69wsCLg1g4PTfLgZ
 0Q1iozbi1ftj7RkB+yPXEKXU39JZc1isijCaJZwXaEV/qCafZdtl7H47Sy5784O2IkRLq48WxDr
 SvHHbDW4Eh9AhgzeMGw==
X-Proofpoint-ORIG-GUID: f_Y8b17h36H2-jJRMoDv9Yf1myyffwAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170058

On 8/12/26 7:08 PM, Christophe JAILLET wrote:
> 'struct qcom_icc_qosbox' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7807	  18632	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   10027	  20176	      0	  30203	   75fb	drivers/interconnect/qcom/milos.o
>    8768	  22640	      0	  31408	   7ab0	drivers/interconnect/qcom/sm6350.o
>    7626	  22000	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    8095	  18344	      0	  26439	   6747	drivers/interconnect/qcom/eliza.o
>   11079	  19120	      0	  30199	   75f7	drivers/interconnect/qcom/milos.o
>    9668	  21744	      0	  31412	   7ab4	drivers/interconnect/qcom/sm6350.o
>    8746	  20880	      0	  29626	   73ba	drivers/interconnect/qcom/sm8650.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
