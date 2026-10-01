Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684651C077
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864683; cv=none; b=QqLaA9R62SZETD5NE6QDbm9IPewdesJiSQvpAstXer58DSX+M128UC+2W45JEJ8OZftFPF4qCCcvqOYUvmrAohSyAjMl/T/ViGiWk8c2djpl++iGFrXeRflykDyar29E/p8P9qlFdUg4ZE2ra4IBN717sFMMjpfFiejLyaDylzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864683; c=relaxed/simple;
	bh=q2uh5JDZBxrLtwhn4T/0OJdp0hxyJaWzupLAyHtr0b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjA7dZ3h9snYhsHZxl3/U5UDcDPS7IMcsZCqH9PnRDfVGFJKKqE84MCszV+5HIaz9GZ9Gvc1/CDdh2kc3BdW7VQ6K5fEGyv65/Lw1DTZkConoRwe6I7prMwkcmrBhBkblPrzH9ynZl3JxJ38eU7zwcr2wx79A4Wjtc/uW/hrppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3SyWkaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAaRf/HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3SyWkaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAaRf/HO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DidrP3776294
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 14:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xNjhb7ZZ+zoYrQSoFFi1f5//
	XuwInxKciGFPw8qrI8w=; b=F3SyWkaWeoFqDBWI6oIqWJJVtuaX/DGtokuRLNHk
	PHkzqFUyJ7yJgre+i/AdjvfSw1/uF1zIYALm2r01rOs763bFj63Ej6cM9x9SC4Uw
	NuHmTSRYk8ritFBqU87A+WTw9CsSNQzxiCBfCYUjZEFLJfBE0z93Alwu2GmYvrZm
	0WMypURMJJ+ZOleYtNnSFQYPuEQDL/iJY/xzip871TNlxdSiri+sgsCfUNLwoc9j
	LBvb/S/kTPKSVVTwywUUjhFWEzVXKX4pDtWnlzIt9EV8nUUNGmeBp+81owqPH28T
	SZnWUqZBuEga7t5M1rgxf8bTMg2tnnsplbJ4EiawWqKX4w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8us3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 14:24:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so301543137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790864678; x=1791469478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNjhb7ZZ+zoYrQSoFFi1f5//XuwInxKciGFPw8qrI8w=;
        b=hAaRf/HOjilRYsQscGjdv0Odp6s10rGQQDLYeE4LCQAY+kmtHpc5TuDD6CR1kM9JA9
         p9pIkSAPKL0X9jFk4m8Dv44n89RhWt1a5TTQiyYNeYkDX4B3bBmEojcb7mUhlws/s1Hl
         xkz4jW9Kfl+qBAYSiIPRUadjaAEaEvUc+02G5/r8nfXcBHvcNMetHhHah3U4SiDbE9ip
         ca9h6wnP64fLFsqbfwYnVMh77yIs656HwdssQEy18lWnx6YKluXnwbUE4zcjC6eu3mx4
         5iAhxI8f8ENssi2r+CEOn886iQJYkqR0tEvfpyXMyNhqQ0sELJ18vPgtq1uBRVGEw+WR
         hmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864678; x=1791469478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNjhb7ZZ+zoYrQSoFFi1f5//XuwInxKciGFPw8qrI8w=;
        b=z0T+ZX3amIdF24z/lGfWpMSFFL3ClIAolBQtUF6LfVNCzVkJdI/mmC11j8QDoNHC6Y
         Bd4/rRYwoQHKy6LBwO1E4dQCYZ2URvTnFBh6fVhk3CR9S+Mz3vmnDMqg9S4W7V0/Egdl
         /yWsnDWyaZa1OrTnuhpn0iHsvewf0YK4iK73AwPUL4kyECaExN8MXhXOftAbsq77TVKu
         Aa9lfQ9Hd2aJnpqiflclIgBcUVu7efSvI5G1IMcwmM9FBduWTsxTfzVnYylliLfRH9V8
         QtD+2TZLdg7lNP+9VBxvldqUFYpg/2RK0dISM1ttBmvlKIxbfMp5+2UFZmLQm9vHwcND
         BYrQ==
X-Forwarded-Encrypted: i=1; AKwUvByQmdf+Ynd6oHKPrx9774RDXWy4QeKkTt2Ze9X2moc0BzN0LQsRE1iDqlVVd02mQgZsGQZpDj2z9x90KBhO@vger.kernel.org
X-Gm-Message-State: AFq9FYIDMqIVf3hcgHF6/XeJNCyCCQ73/tvuutBX7sv7Qc5e+xlcH3Qo
	AXp72b2NQz8lxswy7dV7Lh/F4Y+rH4I7GwzTELl/Ou5GqRPUldfmtUL3JxS/n9b0QEVhe2DKyFS
	phnPXyI9EXnKIJsB9ejDnBP2+QgwuQMa/mwZsOP9WosMy2duxkNoE+OS5x5POmGxNeDyCKAxQDV
	vN
X-Gm-Gg: AYBFou00QcTjuOIuI8KnQrLr9Bvo11OIRJRU4Nk8x6jHJNUBJhlxbcAu7B1oQXRvZ+h
	+w5zIG0bHeDJnPmxhSi6ufHq7lED4dpOvBSQMfMx1eJ7k3hliaPxT7rlhH8gyj81LTpkBAV++da
	hlpAURdYIS6WBeazr/6KrqYd0JWxQUGUlGHrlJ44rExtDSk/TyNloFX1mwa4C8nfB7ee84cGWCE
	gUl6Xi1N9WWXPBsmGSoJMkgOCisweckCe43ZsqozKp9jcpHSWHsxk8/G2D9cnHhWzfhNLigRIxU
	bf3u+9TnEL4EytIudxgS5GpoUkJM4mNJPMdQgX6gA8aR/d52m5NkXh04YrdRgQ7f5JrNfEWb2Tt
	tKA1MEUCQVtm7882LxbbiYhE1X95T4OG6dVDOW9D/iznUluEHoF9sWrcFJw/fu2eBNyNtY06PY2
	UM71amw5Nar50I
X-Received: by 2002:a05:6102:8488:20b0:7c0:30f3:cb0a with SMTP id ada2fe7eead31-7c030f3d9a4mr236224137.19.1790864677745;
        Thu, 01 Oct 2026 07:24:37 -0700 (PDT)
X-Received: by 2002:a05:6102:8488:20b0:7c0:30f3:cb0a with SMTP id ada2fe7eead31-7c030f3d9a4mr236204137.19.1790864677100;
        Thu, 01 Oct 2026 07:24:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87cffeb0bsm702421fa.28.2026.10.01.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:24:35 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:24:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Message-ID: <wc44ci3adcshejllxi7rksmjclcr3psrsxmjeiq6elsa3oubrk@4gmfmk4xw3h3>
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
 <CABymUCPO4zDFniBNqicyq20m3NptU3AHB2it2fS8-7zvreZmug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABymUCPO4zDFniBNqicyq20m3NptU3AHB2it2fS8-7zvreZmug@mail.gmail.com>
X-Proofpoint-GUID: H9ameacP_Dctmg6utX6LfqAL0a6kkmLE
X-Proofpoint-ORIG-GUID: H9ameacP_Dctmg6utX6LfqAL0a6kkmLE
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe6d26 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=FGnJlOlOCVVlxK1YD5QA:9
 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXwFw9fdCNJ9Hz
 CGKwicQYaCx0LuDsZkzHHO7o63z8zyMBi+S0f+g80MPJSyd9C76+MDgBY9YHuZ/izf4FIhf63Ck
 2Y1m0+oLG3+gVukjEAbCuvCU7O2jlc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX5LlLESWvAjIc
 d/ez2A5C60bzBW6sGnbcH2ye62y5fR68qARwNeE2pdMVaSCPtFyH5rrhdrQ+kDo4ZJ6ae6btlb/
 MzVjE/myeAhvQwnIpRr5F/R73xmtUiaw42ohlg2eR/pSxFsG/e1COXDmbonyBBKGkmn6mRY5RtG
 J79S14Z4pOloXBfFvfBYx+6WHKMLVZHuHYEELgp/s5wI060Tuckmx5rVecFPoa1DgQmDVrdDegr
 q/ukzkuy6Ac57oWV6KeF9zbgHAucbOnpT+XKK4JC4aywM03VQDijwGMcne8/M21AfF6yqYcHvYL
 aX9O7N+KzTZBFqRcs1HxkD+hzS4xdl77UYsGqvFhf8k9YRm6Wm5DhYvmLYZHb3DI5P61Yp6v+Y5
 lGXbz7YtqqKi7KTXmZ8bTA23H9xy3qz+BNRU0tOzZiJQBRBiDWnHPbK9zIVIobJYDQCdE0kbAaE
 oQeSD582pVHyAjNctpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

On Wed, Sep 02, 2026 at 11:20:27AM +0800, Jun Nie wrote:
> Hi Dmitry,
> 
> Any comments on this patch?

For some reasons the patch didn't land in freedreno patchwork, sorry.

> 
> Thanks!
> Jun

-- 
With best wishes
Dmitry
