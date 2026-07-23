Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F5438000
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801106; cv=none; b=p5n7M0PbcVO86kAsQyllemiRUbUjCvEUFUrs7SbVnSUMuA+PAekaOPu3ygU8T9D1DvS0l7j7JDPe80JarybkNXtLpGbV4NWpWJV/7HIxCNLpejQerEJC9fImxaQW2QCVbjTKdpmaYlsVv3ZbNMcbdSqZf65RqnKQ2Ygx2EYXbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801106; c=relaxed/simple;
	bh=MPH5g4S3PpKVEtIXIE15ZYghlbJmVd3epUSKZIUwJ1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRwD1ZWYwQtaNvemDCR3bD8392K2khbKRvR22Y5bvFw9dyXWLJOBeNCcrFk+5Hf5Fc38EG0COwguD0qAFKCijcjr73LA9Dg3N+/ndCirKXBEOhxyhBQye6JHUaG3mmT+U5mK9oRKTpDwpY+spgx7xW93SyNg4BXgXwMbPexiSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myUXaOfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaJkK9rl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myUXaOfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaJkK9rl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWGY467146
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+itfSfH8dlCA2Ag96yjb0QZKGwEWMn7/dZJVuyJcP0=; b=myUXaOfVQ8rHd0NT
	DH6HtnMB1Ur3O0o6eIuqjj+gjMrnad7zaQm2+MSfkqs9HcqP/ggNoB9sPeV1LtMQ
	gVbuwEXS89meaPwHD+1397X6XjAl/6u7hab1mOHPrfk4lNx/Ac47HDfTPE6goJWd
	oIJRl4folaoCIBDzYvPFTb++ZOH3TnI/WDMKBPMtI0jp7hc+zC6OWvjRfULY4ffY
	UxYOrFKlQTtUdSZTRZCW4tm+A/mKE76nphRcI7AVQ0RMgY8lG+UDJ568JbRv8Ia6
	rFwfUE0s/2c156PcfPCVV3cPAwQBxCrBGNHMd51ytNsN6oNxEN5o0SjxEpM0IhMU
	Atoimw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xug7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:05:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso23104585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801103; x=1785405903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+itfSfH8dlCA2Ag96yjb0QZKGwEWMn7/dZJVuyJcP0=;
        b=RaJkK9rlHOPw0MQGW2aabwVIeFZaurZ/4LA5XCG+z8OmYlIw6KhZH6Z1VM2/Jrxfoj
         jTo9C9PywsxI1icpgYfaVnsR9Ke8aBz4trw7qdWaqvDReYknSZUtxtIn02ttByA9kUwR
         jotrjI9iFzjQPQxUeCiqq327w7+1Sa8nCX28AbKwKcfEh/mgHf0SmbOodiPTg3X+bNN+
         uBy1WRL1VBZgnqx4q4DFcmxqke2YJ4sIVgNBtAy2GMB7dBlDIjVPBVxhB8eR4WdZVgIB
         UN0by3ZDXwd0E3c1/LFyXifhx8fMTbQhnNzuy2/VkMlQivMGrx5alOCidPLUia7C0FbV
         Wq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801103; x=1785405903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+itfSfH8dlCA2Ag96yjb0QZKGwEWMn7/dZJVuyJcP0=;
        b=gcv56gaboqbTwVxADywmc9IaGECnpSNcKnS/p1NSwnGmvNrJCQSGH4Iy2fduurczu/
         hWXGf78uDfsjjuVkL+cDbaSUSbXByrteJxJsyrzud1SRWOemt7NO/dZgnsT+x++eAqGk
         XbDvz37ND6XCpLOBZ3FNSZ1P2fz5LIPUXiQniFNSTknCiy32tduo92/kkX5BaEbuxDJn
         xM7PmgT/eNKmgxfKMx8ixJuW9zcehB+xzQqPm6Xo4BzaUyXwgXgPIhkKnoZuEWlLx/To
         QIZepRDlpYgeK5BxkUe9Ex4xD+te1vJnezJlUU/pp4UK4HP6M/d0pGIiuXXKTjjEhz38
         je4A==
X-Gm-Message-State: AOJu0YxziC8d28TwsLd/EYGUP0aUtTi0EU0jmLEalKuZ5zda2W3z8WSa
	BUJJ5moskzmIPpUrBCc91jqcycnEOyWcpBRI1vRc1wM2Dt6ESYgSeSNFEYEOcGN7bXPmKrT5+9M
	FdlgVtyly51sfSY2USub6l5mDioMJN1fFqcpC+cizY7Im1bYMLW/D+w3sjF2fik/CC9+g
X-Gm-Gg: AR+sD11LUgv/80OKMW9YP6AI54CYP7W30lD9tw+Y7RkSwMdXzhtRi7e6e8N/w7s75BN
	0ZnYjUahzcc17lWay/MkdmS+609JYZbHl4ldF8WGVTeT/yJAhhjv2gL5gVcAEJwtBST6kpgkCdn
	vlYHuzllJtjRbxXGwg4y1dlSqYmDlAsN8gNbSx/JLoIBvcuobQfD+QSsFDNHPFMWy+s3Sgv/5jj
	1ab3hDNrxiH7YffjiNzXKCGhwQ79HY2nh+Nb6+YEkBibSP1BmFatjBZQcASvDcnmv40y40PbD2d
	Bt0pAPVNw9LUvhiBkutYb3LCp+c9F4KG/mNnpN1rh54V0ZIqG1MUDog74+SVtTBSmSXDzlxs8Ia
	mclR/xm39Cad+AAn6/SAQ5/N3
X-Received: by 2002:a05:620a:2618:b0:931:4c8:d8ca with SMTP id af79cd13be357-9312157de7emr2304785a.1.1784801103333;
        Thu, 23 Jul 2026 03:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:931:4c8:d8ca with SMTP id af79cd13be357-9312157de7emr2301985a.1.1784801102894;
        Thu, 23 Jul 2026 03:05:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35026b10sm1961116a12.25.2026.07.23.03.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:05:01 -0700 (PDT)
Message-ID: <1246f02c-7e2b-43be-886b-13f39aa7d4e0@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: don't tear down KMS twice when KMS init fails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260723-msm-fix-crash-v1-1-78fb4721c2d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-msm-fix-crash-v1-1-78fb4721c2d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OSzFoQkfknN0aCdHeNhc7G14oPJbfGe_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfX76NZ8c8CvSP6
 bD3ilFWA7WsBV8N6F0MY3n4nNNerhWuasSrvMVoZPN1iajk7c29vHwrTns/SLIVU56805tIuuza
 nPVEpuHv22sytBjTGkoO2PcFeAy0DwY=
X-Proofpoint-GUID: OSzFoQkfknN0aCdHeNhc7G14oPJbfGe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfX/gE1eDAiFXHV
 tK9fgbwuP6Ym24tnb0rfAJxZ6K3t5GpEoyxoPdDdo5hP5FK8A0QEReC7FM95CPLYd9fxBGk8nr8
 klrJLpu0qWRsWQ4Kx2f2yQSY6W9baN4//iAbK1St9dTS7b97ew7ptXOqpcgNjSCLz8esxHFmpJR
 mTNqj6O+ENrWvuRP6HzuucDBH/JAym/SK5f5Bk3N+/ZZdb11hT39vbC7av0o/11bOhDVRkxppHm
 QxY/9Jx8E2SbgKnb4EJQB+R2+0FtjO+YUrVdFolBN6UYcpZDLyFCik2c/CFWILaD2aCVocECykF
 Bdkc1C89caLh/Xr1AhIdY+yf2iRo3YB7P2MbQPNEU9UXdWHF2FYBc7WqWh8mhPMLax7yEtckHvu
 Ty4rrAc5yEOX23owEM/iKpxrWZuYT0nbzC9cuyDz/KP/gkCOz1Gn5p+pU8pw53sC4orPYkB6TMr
 8yrHd8rrEAltU3nQq4Q==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61e750 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=H0Ibv_8qnN6G3ftQSwgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230098

On 7/23/26 11:52 AM, Dmitry Baryshkov wrote:
> When priv->kms_init() (mdp4_kms_init() / mdp5_kms_init()) fails partway
> through, both display drivers already tear their KMS state down via
> mdp4_destroy() / mdp5_kms_destroy() before returning the error. The
> common error path in msm_drm_init() then runs msm_drm_uninit() ->
> msm_drm_kms_uninit(), which tries to destroy the very same KMS a second
> time, which causes a use-after-free crash.
> 
> Bring MDP4/MDP5 in line with the DPU driver whose dpu_kms_init() doesn't
> perform error cleanup on the failure. Let the common path own the
> cleanup, instead of freeing the KMS from their error paths.
> 
> The crash trace for the reference:
> 
>   __lock_acquire from lock_acquire (kernel/locking/lockdep.c:5906 kernel/locking/lockdep.c:5863)
>   lock_acquire from touch_wq_lockdep_map (kernel/workqueue.c:4094 (discriminator 1))
>   touch_wq_lockdep_map from __flush_workqueue (kernel/workqueue.c:4136)
>   __flush_workqueue from msm_drm_kms_uninit (drivers/gpu/drm/msm/msm_kms.c:243 (discriminator 33))
>   msm_drm_kms_uninit from msm_drm_uninit (drivers/gpu/drm/msm/msm_drv.c:93)
>   msm_drm_uninit from msm_drm_init (drivers/gpu/drm/msm/msm_drv.c:184)
>   msm_drm_init from try_to_bring_up_aggregate_device (drivers/base/component.c:249 drivers/base/component.c:227)
>   try_to_bring_up_aggregate_device from __component_add (drivers/base/component.c:269 drivers/base/component.c:748)
>   __component_add from dsi_host_attach (drivers/gpu/drm/msm/dsi/dsi_host.c:1739)
>   dsi_host_attach from mipi_dsi_attach (drivers/gpu/drm/drm_mipi_dsi.c:383)
>   mipi_dsi_attach from sharp_nt_panel_probe (drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c:247)
> 
> Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
