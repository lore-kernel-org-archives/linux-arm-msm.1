Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10080282F17
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346748; cv=none; b=mNJgIDkGjpVLkXgF5e3ZOU3RDB/I5OENcBP6oWQLcE+DaHxKFipb3SZIIuBVisyqO0h4Jv0o88FLEK9+budPsGS0oDQi3y5Bb2sgttyiuYyj4ntUWP9jBLK9NK/YtZ2dmlk13BvVpNqw0DsJIVqVCiG56A6XBOUGarD25Ltytqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346748; c=relaxed/simple;
	bh=11XAC7IHohnLExbynXhQgqZRwfRLEUClDfxcSWmZ3EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDHYe5P07/49lG8/Mi3N7AKSjJNEXiNk3jxlpIPKmDKg20/+pryP1GMP1RJM8QB3iSMpghUrMcdRPtrC/k2WQQStf/ncfNP1liUie2TZTzB7Ur6EuNgbKQcxZb9bYw/sDXfsOZg2fnxu/LxsJH+PJr5pZVkeknhn5dqRyb6LK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeyTfrQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOaMuy0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeyTfrQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOaMuy0H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Cou2659972
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QODTxX750UA4HDn/zUk4Bheg
	1ca4Dh3QMwnpyqlFlbw=; b=WeyTfrQWQtxC7P+0lvyYoIAo37ADFwFqHxG8VhED
	3p5Vkma8T5Sas1eGuUM0PzPhyhMpNBrXUcKhwgt0E1Dzho7Mspo0XsJW7/SkzqDE
	NeqvMIY4oHX9vaLwxqSMSBaHFa6PVAM95/aYhak4r2HaMlppf2dwDqUMM4d0rKkX
	S0omk2f0Rq+jRIbq1Lf8yzgZMafTff8B7+e/CBHn+LOgYI3z5K+p8un4C2+7Ia6a
	cmQyhItAqar78egyuUSQVKx0V9aqqGYQAQ0uElefmuDzAO9xxBFOsaDbt5mdUDjW
	m0r5ngygOLIRnzTV19TJ9hTp+eoqw2YR1vQWgUchujrM+Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4g77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:45:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2145817241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346745; x=1789951545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=BOaMuy0HB94ejSVzgGA0zB5LH+crEpYj4cnARw7EUb095jGju2/yphSfSzc/Kx0oIR
         OBj0eAuQjiekonRv3wnAl6A1eeoVALfNv1xG+KK0r6wINNXn4memV4pSm/0lz+XRlUx8
         qQgQoPho+n7I5Fvw9fc82FJaazN1FUGZS4S11/MXVJtW6KNxEZwC8b1aWJDik05SWpL+
         lgCDE77s8m32p4/VJ4UbA7vYAccP51abGI0ePYIHf7LUFvBm2Te82GfSKJdRc9K1Z4eG
         2R2GmWcC7VZsYoK/KPw7zXOhB+kZ+5sa5IcY8SjcotKcBY3PG56VKhZZMQUdy8qZ0ISn
         PctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346745; x=1789951545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QODTxX750UA4HDn/zUk4Bheg1ca4Dh3QMwnpyqlFlbw=;
        b=EF7a167P3FQoI1XJYa1ydcCiDlKVIdto2XRsE6neZca6ATFIYXjiap70+CgGjsEF7m
         ZF3xlyhXcKmABDc1+Yjyf8eCUDP5BxNc46r1B9VBaJcIHVhSAWEV9KdqpXz8nDCUo9lN
         ydmS4YApR6HSZxfiUOakTOlYj7tgLAwVP/w9wQOkbjXtTKSJQ0iZsmfmQt7xDl4/HCrT
         cejEetuJYMM5s+N5XmzI+xdDOfCWmLnC0Z6UijhvvL7L56/MPGJvRUp47CjAorH2GmLK
         8HG+XT94q61fUnbEtb4MPPfJhH9j54UtH49oFH9mEGSoEu9Q5Fk65c1NnWMR7HMCVosD
         agng==
X-Forwarded-Encrypted: i=1; AKwUvBzKtaWkG4suVc/D8hXueo5ogtvX+Hiq5LeS1f9HyYCytrYWpj63gCCNKxqlSBNC8zbIu6Dl5fXD7xnSH3v+@vger.kernel.org
X-Gm-Message-State: AFuF++mwzmuwMfqjnlrbdmaMHR9050nAJ1sSFhEaqAsMbU4qEGT47rPF
	xolKUtdc/Mvv/CG967ec3ikcQgcfzLw2RrAi1wI73V+pGfYDF8PiKkXBr3f0dhmgIICacxk8Jd+
	JEPcgMKRiN2T4xHyjgEAeyP4f+9UmQJh+5l0gUfkx2ODK+68xbefAzaYF7PPDufNBKuIC
X-Gm-Gg: AYBFou0RsvMnf8Tz4kuwLnSBfFWVHi7X6S2L7fpRJsvrLnlg2CnBzxEBnIAHJO8clyA
	eqWm7Ec7UYw4BKOqNXpg0dJe820ujhbY7e8AKNlP423w2+Iz5UUywS/heyvR9YHMYU8qUWRwXnW
	jp6UikgaJhCme9GVx2kdU2Eb50rhgFcmlcSysddTs47EsSjJr1JstvwaSJoK0GGhSV6OxlhPNLT
	Flt83wUuaxu7luFqRbGlfba4bB7oEe7LQXvUCwBIU13YH86blYjCuFaPst6UL6mnWpWduNcoCST
	IVmEPkcASeuPoubiZK1c8hRhXzOisfejhdCtwdx74he0gNjrnhgzhv2lDC2FefrM/rTcsywmCNi
	5L47fLYraNNYeG5i9Mt+XH+MRyJ7OmAARM7CrxyoAdcqZoDlHyluNuI5vafgby5bDPP4c07f9KD
	Zqeo8BC2cuWJM3
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117937137.9.1789346745143;
        Sun, 13 Sep 2026 17:45:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4a:b0:77f:9278:af6e with SMTP id ada2fe7eead31-79b5b196caemr117928137.9.1789346744772;
        Sun, 13 Sep 2026 17:45:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a86f2sm2002489e87.4.2026.09.13.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:45:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/7] drm/msm/hdmi_bridge: Drop redundant
 initialization in msm_hdmi_bridge_init()
Message-ID: <vzr4mqf3opzusmbz42fwr4m5bbmpu7imrwzsuhhmxcz4klklme@anqfxjg2a55h>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa743ba cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=P84uMFOcKlMy4IiKK0cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX4mOoeXbRB0h7
 X//4Oe9G8AtZ4l3vlMqLgCXkFzlIs7CAuUZUMTDe7N7DV/0Ih6w5oAIXOkMtJuR9ycTb+EIfyr6
 eOnchVbRgT+aOX5rgFtPQ77G5pbbiG8FtL5bYxFRUyZhw5X/yfInf721vUrRP55IotyTbMWHbRo
 039RmIyqoIsvo260K/vBsIH0/cLdgRgAuNBWVjll3lOTLVk5FrUwO1KKtCFosrNvT7nh+TnQhOI
 ijMUL7c514LyMwOIDeAwr+E64Q3GL/1P7zEAqiVuAoTIGt5qBlxUPKpqzmINOIkmo65K2cIz7X9
 uyNVzU6XjwFyuqoQGYjclLQ96cSm66yMcmX3EEJh6FeBmSMXZOBEizfeGybXYdHPkymxhFJQ1ZI
 DQgnlsbhJ7WTJAbpdPIA8zr6HcS4hqt2aI24+Ze0aDVJotr6uWg9f5oGCx0tsN2eVgcJhQ9zLCh
 YC+n7qXtZtqDFFKPTsg==
X-Proofpoint-ORIG-GUID: -cW4Npkd1x4NWbMBGvZDx0QTOkWi1mnb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX/7ZqVbVlKZpR
 hQdxfV69C/lnS1RgOHt3+t+hKZuOKOQ0K9TvjK6SNhATJRo6cOq3G4vtpBvN8N9oP7nEenBHO72
 fLzfpgoX7z2REnD2smivkUbTQGKg8Z0=
X-Proofpoint-GUID: -cW4Npkd1x4NWbMBGvZDx0QTOkWi1mnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140007

On Fri, Sep 11, 2026 at 12:29:37PM +0200, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
