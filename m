Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E13DAAAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165158; cv=none; b=qKaX5DIXjxXTVvTWU0cUpSQrzBEd7rI3R7v+uaLXu1snXsybgtWH6qBihZ+CnuMQtuZF+R1ZmbxjLb00aLzZaidVmC0WmhOsqvRqbI0FJS2PSFOMbYD2078QQa4lfh1qV1CiCqLtkqDM0O4eCBvqYQDMuyaeE/u/5q3LqXydk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165158; c=relaxed/simple;
	bh=yZKYTHcsRS5EQrmGC8BIeJVQr0HpJZFq4XMLs4w1sPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INWh78L13zJSOk4Y0uEhjUaLFEXiQbBIhcAoRXgxE8AYYy3KckWfGZY//dNf8KdWrr00pXjsGWNmIIDGf5gPUbeA3iO4avamYGvmHYI740yEfrxK0wH4mSHB92QnpWVQhg3IvRgNJXvh3lJj5CJehq24bn4H+/9xIq/v0qd49cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKKBQSgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kezudc/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKKBQSgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kezudc/v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xkHC3427539
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=; b=QKKBQSgvsxoR0RFV
	ggCJcFlBh6vgQdyRNm+IuEKr14xKimc7Qa9Pzf38wxKHetFcEWrgCRnmq1CzRkEO
	Xrpir66teANpsuCByPV38TqZLN3LuFRce9nSBuNwewq3rLUkrat5rckOU1A4PJUg
	xUi+woAa5cxAEBA23eTEGedRLpSS33yMOyNt5YC6GvGPMuNo15ZBstT6OfPjd9yR
	FsZywpHkrCEV68t4yOyKiwdEcX5vS8nFpFsRFxz+4KyHicW/7uzQkuoYkezLeG4e
	/OAwZDWUqb4YetzVDTIABWAIZXH9SFnP5g7o8B8jq7GhvYAqedqKZRpgRsZTTmte
	VhkAWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8epf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:32:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53002215979so4373961cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165155; x=1788769955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=;
        b=Kezudc/vB0GWH7MLUOmos1k5Ya62UaJeHAidZeNJMX7NrxNj+3GiQ3AAoTxN47Tcru
         1AM4bQSzJT+QTHxyJmGPAe1nqWK7AQXShyo8jbKFGhO/3JI2AhIPtnKZx5YbElItlGl1
         sQ1XbSTBdL3ece0/BiLkaMbv3rLFOLLDO6+JfEOVEa9+q0aOej7RlMfalx6tnkxKCEF8
         kW8VH+FLEOHg1SeEGkWNMUOhf85vAK+eQku5bXAB6xQoToDbF13J4jO5k1r7ukUl/rse
         VR2RIFL8FdZN6whk8ltVmw9WtMzyd7F5YuE6GfS+PwZU4766shSNuKkV3qUHH515ZgV7
         qgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165155; x=1788769955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwC9nb2einfeoXK6rMaSuOh4qmuNt6MBE71mjd8sKbM=;
        b=q1qbjA1zm6EGu2GFgkmvG6UgFdZz0zUvMP+nj6VjyyL2gX8QQQDxI1QBXk1n8igcQV
         Iu6u7aOUTPhbRWeHjl+TiSId+NuJzhkayuto5vIuDqBODmGa9waf7WXG1EP2p2tSstn+
         D7c/KgA+35c/iVjtK+PHzg1HzjS+hmqSImZKNKqN+dPGcaH0+pCSyQKmYHsxu17fVC3q
         9QsI1onYq8if3vET8exJPIlkHQq3GGwA2htd50cxwuAcLYt+8a7i6EvOTTqG64/Y+sMD
         VDa5q3DL8dwsaShS45Pe3SaDXrPlRKZPYmKwTWmQjDOHdvo5sxiRGGBmhKXQr8MphPb3
         M3Zw==
X-Gm-Message-State: AFuF++keML0XFJsbcgPg32HtOH+ii8T1mW1vb0VSN+PMricHEVKzg0M1
	zKFEy9OuWq/5tZ3kVCQArHlysXiVPD7fBi1g4QsGY7hLNSrvE0iawmOhEpJuLY4iOj0z9PCZbVK
	7mBplcq+dYb9izLbacZaijMZ0JDF58nX4y4PSiii7eAjofPuCQqEzCVCyyS/MWQqbRIlE
X-Gm-Gg: AR+sD12y975G9HiQpKw2SskIcWgRz1/RaUJREgBLLdoRevZqHUph4FnCedN4vyQlE4i
	pw4u+lzQy1CLbWEjhaCIpK0Y5NwXTqIxEWvwwk8R2IdIUARrWXmeKWR7ANzvguATwuDXPhWgxHA
	jL1/OPQjEWylJ68BIRgEFi2E6lKipeGzQqd7rNFut9K1EvuhvTNEi4TFP+VUexi5VvP7IYZUwNZ
	LL2utzeyncxo02uX02lCdD8WKdDcnxLsYojyNRz5WoTRWPS9FsRNm5GPhfQelQO6tX0mBeBeWf3
	7B0stlwK/GLoLlbvrHVB4AIKsd1aOkMYL6BIM8zlAr2Gs4wh0Q1ZvAChAo3K3l8c7OUmlQWLrST
	zlRYy3Vuoq1cuJnuGtX3ZZQ==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr194387991cf.3.1788165155133;
        Mon, 31 Aug 2026 01:32:35 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr194387641cf.3.1788165154620;
        Mon, 31 Aug 2026 01:32:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b67879sm2981473a12.7.2026.08.31.01.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:32:33 -0700 (PDT)
Message-ID: <2cd6b5e9-d442-4815-9a00-38d4d7324467@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 10:32:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cgAE38xELY_ki5OvjlTaXX5lGF7q6wFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX7AYkHyQUYA3f
 O7sROdc60hPAhxbWdkPT4CqxZG006kRDwHAsEjoo6iytX5Z6iiz4rCKViWo5Pw0c6x92vL7t/Ad
 /kw/RlC2gzAp3c49X4YsAGz4p8BZQ2NgL1uZKzhPRoAjbGib/181T4j3MVHbiBBuMhk9zWGMVb7
 Ji153HUtJpi/0OgiO0FEBDRknvIMpLcY6rZxKiqCum+EPnoK9M5rXq73DSOejRVugl6An5ysfPH
 LM1qUQSXk6LOaLoZga6p5kMArRb4/cENh/jE/rqM1eM33uoC8DGzakxnGl06hW/tGyAgiio29CT
 nMDQYsuiPw63zND2JreF10OvCDtxq4psHFcNvA1Acl3kOSBejpuhm6YwnRSrak+lYGaS2ikJc3l
 nH3S2ilHHw37jbWor571zz+Y8cM2/kUjExbjj7fuvbi9lGvrb6LsMJ9Wt4MWUy6OvpcAGEi2V6F
 MFbc9lcQfYoJgWEArqw==
X-Proofpoint-GUID: cgAE38xELY_ki5OvjlTaXX5lGF7q6wFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX0ummQraT0pV9
 /SOP5TVNRhRUlXo9T6IkxcFfWv2LtAbDAzaEwzbyt4bNDR3bKigrUGtURW0w3Uz9tLdqNVZBgNg
 Ysreei8CESBC0zV8p0woNpkEDsJcz34=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953c23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mksASzzMHVar48QEIzYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 8/30/26 7:40 PM, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
>    bit 0 = 1 --> DMIC0 enabled
> bits 3:1 = 2 --> DMIC clock divider = /4
> 
> The current dmic-sample-rate of 4800000 corresponds to the default DMIC
> clock divider of /2.
> 
> Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
> the working Windows configuration and resulting in perfect audio.
> 
> While we're at it, remove the reference to dmic23_default, as we only
> have two microphones and don't need to configure the pins for a 3rd/4th
> microphone.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
