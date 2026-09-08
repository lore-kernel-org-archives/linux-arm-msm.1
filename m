Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31D3A718C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854444; cv=none; b=aCtpKSHnEd2zzKkhHqxk8u5mdX60RZEdl2YQNqfjKIWtaFmGNKRfNzJYT/P1Q9JzgedzZNG4TR+DdfHSdiLbV3w7GxY8tX+dhCKFHOZRi4BaYWGNOZXqV/NHJ6FjE83l3LUeCK/p0mrsICS8NRMIHpV7Nxygqb5bIUy7z4GS0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854444; c=relaxed/simple;
	bh=d3+dSVc+d1QajUTVYCFzTEXO5nx+Cf3F8uVePoP+3hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5/pW+W3ZM/BjxMyU+Qg5KwzIt/msmziH2E3KJJ5Ln2oxz/J6ytIzFQqIMwjnOdq5EXSzaXfdUbdIlD7Y4mpFQYB7GcP+laFrySA9ea1I2ece0pXmd9fanUmHJokAg1sio9jXeLxpVtLkfiqLHovr7s2FzlXSMxHsSC0QndXu9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkCXs8g1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDSx8l+A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkCXs8g1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDSx8l+A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LrqP2154194
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=; b=NkCXs8g1T6e/kcQ8
	3LCq7wK7GG90UQimigTvNwffh8vfCx9bH5IXT8VvYqBGWLlRhlp2uUQjPK0AZHEW
	6xicy/3Q2e2pj214fgikSy45UByEJg33BFmlgPBzjKlqX934DdDxkye/k9VAdNur
	GxDfq5I5gogRGvJ4Wi88bb/cldgCOemfnalTGKWjqwZnlyg9WGqCGQZnIR4IvffQ
	Ji9X8q4pMqGsyn9qQCvqMf+YI1KTySNeRBKrupw2kjyZU46sRizOV8ncNFHxqU+P
	/amaHRs/7z4d6ONFWV2OFz24PLKVJaJ+Gxd+SF+v674qfUAKN6WP9evKAYnu+ZFc
	CU/BLw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:00:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ccaa613bcso38101241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854441; x=1789459241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=;
        b=NDSx8l+AF70Tbh+RV/5hbGKfs+uHY61PUEWdGbvzhx+zlXW0BWYYD682bpwWXV+ii9
         AKhwg9dVY6qr5Lp9eE7pqer9enPlKWqG68Z2RteKgJkXPFOB4Wf5YJjmeXqMwEQzOmVe
         Ro8seiZFqymF3Gi8SJCSrX+uQy2WWom6t+Uw1/pOxlZLW5bq+fqP6w30UusBZZnIJ+fr
         9uuZM8SNgJ5nfPPpLObbQg7OZVCoeBg0H7jBbYBPjGs1I2cdS/4zvc8239PoypB7cRUj
         QgFjScFdyvUC1aBecG6LuOiCATJkqKqvE30CWKjfazALwhVfc2piAkQHQVm8KqlxbX1F
         tIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854441; x=1789459241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftOcMLq3GmIjv/8ZjcZBuH0q4Y4m34ZtQA4zDPU13TA=;
        b=MMVJuclIoVQUy37yV32ozfGKPl1kRBFSK7u90DWLBYxWqbcCx2m+D3zEK/2Irk8wh5
         yUcD/M1d7UFmr2dEFh0R3NQvxfYzyogybeOwZSrqC9weIv2C3OtD3N2AkS8fLx+Qhiex
         UWEvD/KcPBBhyo5cxdfbSvrNzXF7bZVvKY4+ij9C7lGUDI5Zsu/5SHwn1bHbiPKTM1xh
         WoNOf4c9nk5ug5ArpnBcYrL7X5FqjlyMSBKunXizAcgv28HEwZSYFaSGIvW6lqG0eRQK
         oq0ML7bnRXeIIeBRCZssywSR+scaUQHv1wn0NnTKh74DxtzI2Hzq4oKUZ4z3FBxmROYk
         qhTQ==
X-Gm-Message-State: AFuF++knuljUJlTCMlQiKZ4THHk669DZPjwTn3xWzLjd6kQDCc2LDx66
	Ntv6PYS6wFex3kPy9r7pxY7tPIDg4xS1D71rzCfa3toaYJ21DiMsmtNI4x/RDPuSKAe9wIYTHSF
	gND/SOfAvR23hRso8DvN/3MAPCXLhTPHJjnEiT4z9LbZF6rKXKn3sfPlan/njmUvrwPPF
X-Gm-Gg: AYBFou1ERvV/ttVwBmDbHgPf7usXKUqp0BtoFvKCZ98L7H6viCXPBVysxmj7KTpsg13
	eBIViJvpyH0ojN7P6j3R1+ABucunO+fnu3qagkUN496E00Z0gWK8TmfEPZXSrVbV9f5OtoSmtXi
	aHzYgJtjs1aGZ9vEMKh4Cf3TXC1mmhXnbpK1ihhbA1ZSk7iJRXj2BUrrpMmUrhKZOKMxoRjRBBv
	MceHid61moIMMZOObslKcHuYtj24B9lj3I8SIpIrBDXjpVglEZdARgYk+dAbdX/RiQUt6nM8T8E
	hPDyF3law4fE29uEm3ny7JZU2qEAkYlJG5MoeG0M9m8k+XZ4vC+NsfJKQjiUFa81nl6FfKxMjmC
	rNSutd57EsvYZBzMJiG67SQ==
X-Received: by 2002:ac5:c88e:0:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7fb54d026mr2461883e0c.0.1788854441562;
        Tue, 08 Sep 2026 01:00:41 -0700 (PDT)
X-Received: by 2002:ac5:c88e:0:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7fb54d026mr2461861e0c.0.1788854441099;
        Tue, 08 Sep 2026 01:00:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669ae43sm2831689e87.3.2026.09.08.01.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:00:40 -0700 (PDT)
Message-ID: <7faefff1-5aa4-4277-a250-add84a880a19@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc0aa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1VKk1TRdkn99K7eK9r0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX3SBuIIFqZLEo
 S/g2ZFMqIMxnbKbw4fcsW4CwK7wkvV8WlzbSv3ciBP/7Zb/2gU1v0PkR2LSWdoYrAFXlFwZ89KF
 g/G74+aZH+HeSw0V5R5/g4qJxjSj6m3KmOuYFCQZlR64igZTlcpTs7jQy/djAwgsWv8Ykp/2RPw
 5PWWnMpU52SUWIlCgULOCfCY04OEh3jBqssh7Gjs1NQ7gbG0ySvmztox1gbTOuSCBUsq5IE+8e7
 uXsxQwKnmIai0bwERdDA/4pcAQJmgaAiMZkQc2Oz7/6EL7J35kKtEU07rB/JjT/2f81y1R40aQ/
 6NygNyKzmGX2WT3I4NLBQrhYj6FOTCPmE02TM7hnseozMgDASLT3p9rff1uFCoQEp1VQZe2FgOW
 CiYm+utzojhJLlCx8wUhcnpuh81pefHjhfJGER5dqxAeF+4RPDo040FkIqBYxB4wsgLN8n1y84a
 fn4kkU1QRKJ7dVFXDsw==
X-Proofpoint-ORIG-GUID: vQT5INxvB3qMnMfj6KKWp8UXrSWp2auP
X-Proofpoint-GUID: vQT5INxvB3qMnMfj6KKWp8UXrSWp2auP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX8j9NareXJeOZ
 mreJkxvhLz2eDf8koXss/nwhqjR1JocC2TO+ycvRc2q6i/mKIlYw5wslPQauvOJ4k/GOxan52uJ
 TBbK4pzjra+3GnUURk+BDcctnX6RLNc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
> follow reverse order of powering up, not only because it is logical, but
> also because msm_hdmi_audio_update() accesses registers thus block
> should still be powered on.
> 
> Depending on specific timing, existing code could have accesses to MMIO
> of powered off block.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
