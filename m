Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EA3769E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854537; cv=none; b=X3eAyR6hItGgIPruM24D6vLr1qR6wmXdO6NURnNWRzHadPZUgXyU0tx7U4i45X3YL3rF0x+Lr479SQFGKjoHTo36AP/Xl7u8GDZbkjRErty6z2dnMGNXXB58jIbUIIz1z339cxFvZMIE/mCKolGoVVCBmYdTteaOFv+UCVkn0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854537; c=relaxed/simple;
	bh=SBgXFYdNYEUPVWubdVb9unTaNhEgBh6xGV7DWi4TnQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+yi5w0VkiqeCafSqO++u0GmHCzV5uDOQKsXQclS1OUJ54nPve+YyksYt7y6+z6ADpPkOHj8c5meFB4q85DFNgN1tUZXAhTqpHb4WA66e5hqPcKFhUSccT38I9TNM9z/5Q8MTvNphYKBwcVmM5vZ1TR+w9tQYihDa+at8rjwOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arIuAESW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXI7+1KO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arIuAESW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXI7+1KO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1RG2979250
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=; b=arIuAESWcUWwrGI2
	pjqkoOyJNILtKK2cq6jHIw1appcqCWGaIrfPiN9hHaHs8t++cmtKy3CztvswBNVD
	t/6GjjGovrE5VKW00dJhb7Di5oG4pOLrSRwr8G6SqWWHV1FuFCfZmy4YkB9ya1+K
	ocMxPyWERANVyf/04rKh2xg5jPmZiBXA5WaefWlk1WEX21EhXsYBQ3zNmjkhImXz
	/7lfYFr6uGGQjS4gm+sKQ6MLV5ExzzAtYG7G/n3z9v55eWrDxNxZ/2IDzXUQUCDa
	O6gJ401SKTb7APWF/bnEwrDYZif3Ao/9o7AHNWUmW0JvheanXxCTexjM44ZEqwbO
	cpWkFQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbt5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:02:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74ab6065f97so55038137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788854534; x=1789459334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=;
        b=ZXI7+1KOnex1vLq3oiTv+pwnS1arKhYcdBlEO9ktZHE6iIo6tSvOMFLZeT8feAMV7Q
         0vHutoax6xqfJQ6zYPJNoHe5u0z73dpc5xuqLwqe3gnhA5PLoAcnBZbbCPlstNpuVuNG
         2x6nuk2CMwElwJ2LNcvnJKrWg3mBzorMexyOdP8UWYNqmU1zobZyOxDthjR2ZlPlmWFt
         yC8SUShCqI5IEbg49qKmPa+7/H11ukYUWkrHGd0rDTqtR+fjUnE1DGiN1Cet8MkvRHjV
         0r3MGQuX5OftvJfyQtBHg+kCWKc9bDn+t+Z6Cpcc699pP71BqpI1rhepjSSBTyuoub36
         lPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854534; x=1789459334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WozNudziLKgBxiX08uWyerO5nuWlCikb2YN/NDCsgqM=;
        b=OeFDOOLAzCjE/IHRof4Mk6dkYIPYzzq4sdSITWVyUaM965jEG+ti8YSR9PqjPitlPr
         Ja7zpqItrTpw+I9Kk1NiDP1zbWlIrbv+ZgTnlpIROcdx955dUnkj1XKVN0Y95sWjmb1j
         4l1Pfmc9W6Xp6VOrZtmjmxMrfQGt4n4rTBRq5rDIV7RyCiFnumPifMATKjED5AgskNQA
         72zEHSJT9sz9+5LHpBHs6nbL1HQxzt5ejQYPN8rlpuw26GUeldW2yjI/Gkuvd6ZQ9WcY
         5Ak9moRLPlw9sqFPaglbZ3PSOTy1BgH61/nfcSz/sKRTtWwugRvwNNAhIVHxw/XIDzm5
         WPiQ==
X-Gm-Message-State: AFuF++mJuSJJalOJl/cTQrnKGS2s+/Og1z1DGr8rJyDx6jBchNkYWLBB
	r3Mxk9cQjXc70a6IjWcCf6B32Lv9T+iDtZ/tL/9cjgqCfFbpaxxaqwMPB1Sw1/RnAFB4Zs/uIsX
	z+7cuvR8McnhZhOaTuPDd64dRtLGXigN/wr4zJrUMIXJ7ZSeN4wu54GDqGgUaqMo/p+JA
X-Gm-Gg: AYBFou1moW1aUv7mjvQuPg9o/nMEl7cVSCCUm5vOFK80HMX6Ocitf14J548Hf079a9Q
	R7VCg+s3eyeyuiyXd9pZzRJeV6DIun17pp5JrfTUuX4m7+rXOXOcKTnN5T6g+VzBwKRRMcuGcQ3
	oc/PiYvBjVufHlQ3T/b5RppgSaZsGin6EPVKhH9HYy046+EAK545EyCQj05KwhngxY6eVA9CFqo
	5fldWFUwKqpE9WCzPo6/kZAuPQ1rJJ3aZzN722wsoDzQLvL3qN/P0dsxnQQi/EF7V3yq6PZ6q5u
	BEH03U9pD/pQXFe+vfR6bugTS8qXGzXYPdpp4uc/qUpQAPf8IZjp/TEhipW08zcg88wAFbIcjob
	DXDLSyVY3I3ldSHw9DWIo/Q==
X-Received: by 2002:a05:6102:b03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-78a60e5b62amr2664041137.2.1788854533916;
        Tue, 08 Sep 2026 01:02:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b03:b0:781:9922:78f3 with SMTP id ada2fe7eead31-78a60e5b62amr2664022137.2.1788854533373;
        Tue, 08 Sep 2026 01:02:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d559364sm565451966b.35.2026.09.08.01.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:02:12 -0700 (PDT)
Message-ID: <06bb2b19-bdb0-4dcc-a6e2-6805edd9084e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
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
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-1-dcf8956878ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-1-dcf8956878ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX9S39U34AETVa
 ODQKUFOt+7LTMKyIgtPmidq4coqydKiw+JgkfinekzprpWDVDXugEEufg5mFbrF7zntH57DgH4j
 dCKOZNgd1qg5bwLN5IT/hgdzS5rZjG0=
X-Proofpoint-GUID: rHeLuhbxb0ooMtkQmZCKSiAKtX5yJVc-
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fc106 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dCp4QOuT8fr3gmi_UlEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: rHeLuhbxb0ooMtkQmZCKSiAKtX5yJVc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX1xrJKjw+eCRv
 K+/8IQH5QR7JzF8ZHj/DQVRxZhlZt28rgx20mKGWaSJhClV8VgmxaAoZ56JsyqmPfA7PuFx4hi0
 o432FLZ7JcCLV9iOqFt4NjpyfXns6HOWaNhfKg/fX69TKYT22rqY8yzOabL92sDUFmQWZn8KnaC
 3p4zLh5yG//B980F6R5CZEj8MkWHOcPNIkGOqwSmitck1jyUyRqEFevu8GZZNuNF7WRqswnuwZ2
 Mpeh2vVwslJXHebF6irEVPbgdbWT908lZMPNAca6LnP/ieQHtDigfH1+8rkGZLD3K/tJXT2zgsp
 iAJm8rsqErA/Sr2kbdU1XdgBMoTchxMX0GW8sNcw65Fkl2vHxPo3tnSq/VFZBjN2tLDTsN8nIAR
 lMF6q63S836gk0uQYNUSdvNPEWQbX7kc0ny8qCatMmUP5i4WGL5vZAo/MizOZT9G54NX/DaRure
 WeDwviXesgptKj14deA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

On 9/8/26 9:10 AM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index eb1088755cb3..15e37596bdb1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>  	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
> -		return ret;
> +		goto err_pm_put;

If you're a fan, there's PM_RUNTIME_ACQUIRE_xxx in cleanup.h

Konrad
