Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EAB3CF1E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536895; cv=none; b=IDuMcNWi7mzoshbmJhzxa3I0viFw40kC1P3q8//swrPpRdAnyJrR+oyPvLm4t1OMhtt/0P+MmGvJOyunH9/3+Mb1swuwCIwLHLL8kODMS8vaOPkTaMuPO8oxC2HOUJWDT/eWjgFCvgG/YcWZQeYDvYRvy3ksjwGgUw0h0sbxQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536895; c=relaxed/simple;
	bh=XzO/Thq4u8jivFiauimxf1OAICu2UyepNkrMhTjGQvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mH0U0SNFRjUrLyOxlkKKqwY1sICG83pY19wDWWFm7V70iQB4vGcBoA2up2abmZRnHWfnpGHTqoqRv1u3tapWXQ1hzc3jAxag1G0xH0RCr/H3BtrjZz59ceTmyT7hU1J1k+UjGgfBKaER/A6xXU4SCDVkE5XesWpwlcPdNVywDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuGHuX6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYD7hwuH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuGHuX6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYD7hwuH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RVjf1520116
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=; b=AuGHuX6fKEVuB0ju
	SHtGHoj+qPxPBXu/3mIetCPM0zyizgpy45J47NpNT0AEQGygb4uEHx8xNuR8WzqS
	/9WNH5Q2zVX9X5asTUuKYIkFV2Z9h0KTAPuteUIDWaJfiIUUmKC+j2vgLTb+r02x
	HvX1rEn8XR+6UNnQ7Q5z2O57K/k0bBeh0FpdpfGqbv976KunCRdhV+QNMVS522wL
	mTiYOhMgOmNXwiho2d41b5DdvPoGrcO3BJEr3X29UA1O/yTA3Bz94ddup/hPR3CT
	4am0Gf18acVOYQct4oUGUAy+QkBvQ5XPXIISCNNOmzldh3qA7zgIenesrBj7+TQe
	WsdI5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn7uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:41:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so19262291cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536892; x=1785141692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=GYD7hwuHhO4pnrEkGj6RqMV+UYN1dm6p3K1clEGfVh2AJZSQme0NLKFHXSDMYk6lpm
         ttZjFTjB4CR888l0j43GRUJqse8fpaC2xVYdk5th4ymHGgduQSk7RopE0yo8os5Di8Jn
         HpSXdqpGg2Q3tA8KXPyXRygYk8CldXG3VeTJDJT2ilvbKcGYfnbU7KpgP5vkOWY57ef2
         ewdZQJF1bElirOp13hF4+J6RVxJq6f4zX6DBy1yA7Fbuenkio0vOuK3dTJxiqEu/IO2l
         1QIR0radNgMCvLpwJbEDjVtVi+9moJsXJhlR0lBdeow4b7vZ8NaG33C2y7ddr4l4wHFi
         IeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536892; x=1785141692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vtmk5QDb7NpILPuyCS+NFxf+tPdClvCNWrRG5T+hRHc=;
        b=QdE6flRAYIScXVzUwnAaBSibs7+UQsGMwpgjxuRHFu26H504jcDJbmHAV28LYR2kjQ
         /cWOmOkznNiMrxpcBSGHyzXZ34tcPnxiQTYHqVrRSI6Xa3DCXdi+t/gBrYld8NV2syEG
         UTUssKjLaZ2xdR4R9HWvQ4711Nh1zAs8An98rBTNUAt5LcHNy3DhfOAPtrFQ+TQHU9Yo
         iBYlC4RtHLAj8HUTupjxVeHzSnHh+DmgXe2EhMmVrYIejQnJanwyZ33R3hyzC1Y1gXgl
         WsSr4QiQIpEfC3kaDMeuILrQxRnjZFYxOj7uv+PsoOd1NmtlFZBaTFTJmkOyIj5wglFe
         geNA==
X-Forwarded-Encrypted: i=1; AHgh+RoB7J3Wp9jwRWSinxXAEcRSvnZTDdpbpqcAM3ff2J9uWsaOys64sPcSXKCQMsxbkGfetWeyasObEvfJCJqC@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFyBFGk1jtLP/jOz8CJSRIekf5vYsEAWdNuRpDYxJC0aSe4XY
	LQpx9LGRsrezu2HooWZTIknkcoP13YnU5I3JASeK5XgMyEBe7Ts5eZMc1De2w4dXSuStYQYi8DA
	de6DWwwxkHQkj8YAZLgXr4p+j8MvbzqNmlDYez/bpVoyACFhTMwz72TvEqInIoOUbM5TW
X-Gm-Gg: AfdE7cnPXRN0cSN6Z4CelpKihDtgueOoqijprNJflNbLodOCWRqpIKJXekJxjpD1P+a
	7DiibNVeP9t31z17notqsULkCY0LpVOPyP4pe0eCWOhyAQuLY90FNrGtJtYCR+ojrIwfGzRivyc
	hZnHsJlBfPWHRdp/x/VStgO0+2bsXN0mWdFNvdMxL8LFi+jcCFvl4Jm2PDAQ4o38VT6ahOhkc2y
	RvUmyARSNZH/ZKMfGDZrCdqvKEW3yjszwjau3o3fYqzcHT9e01msASwqqcIMbHMFnxEilLIKXxW
	R+xLaYdH+Ch+AF5nFlr46ctBurWC3t3dT4gPprMERDC1geWtLjD7+EA0j2sEpriggkB0SOB1xLR
	jRvLRHK5IT0WdFqHYBbXQc/tw
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76331061cf.1.1784536892112;
        Mon, 20 Jul 2026 01:41:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:d8f:d77a with SMTP id d75a77b69052e-5213af574bdmr76330901cf.1.1784536891688;
        Mon, 20 Jul 2026 01:41:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff5efasm4464224a12.26.2026.07.20.01.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:41:30 -0700 (PDT)
Message-ID: <c311efc3-7dbd-41aa-8b36-15afe85088bd@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply
 in Type-C connector
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX9DKqeN0CDhjP
 zOy3KCR/z2ZafkQ8ZNtncQ+jwQJcJkmE5w5tAnC77YaZHJnUClfM+Alvo6HYFKGInYW0Kybofjh
 kezc4K6YthJ2KS8PBf65RqyQ4BQ+s3g=
X-Proofpoint-GUID: VANFXLjFRiBV9t10SwVzJ60xQfsr2JRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX2WQR8mCoxJNy
 Z7HyKzqCjLddSon7r52okMbXJfeGbQM2sOIDaVoY3Qx/JTQrebSxjyOt0/dPZ4LwDfZgxjAhDQ1
 xW0hTn8na3jJ6CtZT88sRKbQlymIxAA4G5JoKDEOmaG9xVbWOnLN64703KJ9BB9V5An9H4UgOKW
 wXRd2Dp7JT9mL1AUh4tPLC8N94DF8RX/xZEqI8koPPdb0bBgSIk0Dnd5h78e0W1SOWahq52C9Nl
 lHS8Mbk/Kf9aSjqtOjGklvR1/bWlKgtCuKbW5Sy74EIlPE+JO4rgx64Jiqs02+OlCZUNC3B397C
 eO145TyfNZfJVqcHFx2B01gWKmNMMHKG7Ima6iq+sf79Ab903lJn+S+kZbHFB41ejqS+dro+iMf
 h59JusU8HtqG+GOo74ycqSsz2ibQjp/Sr3YaGNzeD3u1YNI8JVpUHI/xO4iw/ioEFP5KkYrZrWm
 SUpV0k5VZeeq4ai9caA==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5ddf3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MzIpylJLnEosbEr0IxwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: VANFXLjFRiBV9t10SwVzJ60xQfsr2JRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200096

On 7/18/26 5:21 PM, Biswapriyo Nath wrote:
> VBUS supply property was moved from pmi632 typec node to USB-C connector.
> This fixes the following warning in kernel message.
> pmic@2:typec@1500: supply vdd-vbus not found, using dummy regulator
> 
> Fixes: c1da9374c3e0 ("arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property")
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
