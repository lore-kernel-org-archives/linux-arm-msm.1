Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1B472072
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945177; cv=none; b=t0GP5oOX5oWXV57/vRLkffNtfaQCeCG96rLOo3Sbqzm8MYFse0cMIXmaczuhn61hQaMUeZE9mfo5qwwDEOUwx1hT3+09vSiwlWspXYy6DMKlnE5L4ikol6s92pqvAaeH4xpvd5ApeXK8LPf4WIvuaXrNaH/ZWi/HCPlSbvxgmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945177; c=relaxed/simple;
	bh=205z5LLDhgWohb4z8Gq9km9s7S+j/R98tGDLJ5Q4hps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8i/AJ4aANGsb2weE6rvFIlkS9P4+fr7EYwpZ97QBa5/ipbsvUdQ1HKbSg7usLYivSL3IIK8qwW2kVM48vutzf0D6HW4oLjrq8QtDuhdELKSIcZHi8Boi6ki0hXXg4BvWslruPRStSK+8hc2Vbtzx4e3xw37HHQfu6n4lRdZhT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ileTv8IO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuQk3Wn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ileTv8IO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuQk3Wn9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929niVZ755011
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lyYymx3dDTOEqcC+QoyEp2I
	DDrTkkMvcQgBdtGhsSc=; b=ileTv8IOLZDeS6W19nnEvF2Y8bPz4TeDXtYbq5L4
	fgnJgDUVqE+uEjD6iMH3VL8l2rF6GIJJdeZXzqGFEuKkV6f7jy2Axg1lA7LpVgXP
	VkaL3YJnwMSw82iSLb4t5OU9ZcOg7Wp/RhCuccNoe66nAE5Ev8bfBzdfbiVWk4JT
	Zcx4CseMKkgwUHMl3ykSr/Klmz5cd8Uoh4AghgfdudUzNAukNQaFRoOWpy0Ssc7a
	RiBUdkS6Dl4K5OfxA+rO0yEfh6BHKlTt5Mu2FeXH+kdnoru98OSJSgo7JIUqz0W4
	2RkZMQSVXKbUY9JBWBuG/Jzz4fJzOY7jqCbb9zSVdSYgmQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abyrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:46:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf45388253so1677505137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790945174; x=1791549974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lyYymx3dDTOEqcC+QoyEp2IDDrTkkMvcQgBdtGhsSc=;
        b=kuQk3Wn97h2CehAkh/OMwqKSMtwvIFnckSMf3baWGorogFkn9ZpDiEOsUJCgEn2eB1
         sn7ApJPG1tTr7csP8gcxLMMSRu86vK2j/U5ihbmxAS5QIYDo2lZgrIrWfUhUaqMKkS+D
         aJiR1f+p0bs5zw1AGRAMtnZKBRtgIVQ+a8KoZXl6hNXx7ZNuiqQOcXIA7bfTgETVzCHs
         O1B0NfXCDnOo8fIAMrjr6jTkJYxhwIiicAyNyGpuxlIIvm9Hqn0vDE5vePk4xt6gxsQD
         aAOhyKDDoV6v1rcL6/ePZliXfQ8MJ52sPE79aL6QYvqmJ2kMVsLybpZM7NhKGjQsMB+e
         fcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945174; x=1791549974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lyYymx3dDTOEqcC+QoyEp2IDDrTkkMvcQgBdtGhsSc=;
        b=i7GnHpFQH6nZAgfLgPGPSBR/MlFcjnogr3ulrDFLlWvpIJLucAjc4yszrjlowRamqv
         aSucUi7IdAsO2CdKw8RjHW89CPlEdhwfqXfZcBPa8BIoloHdXETJZKlpzeUOjCHN3ph3
         N8mxVH/QYQSOR5oyl2txoyzRA/fYVu1LUlNrj6IpwEnAEmSWy4zmeYz09XiZ8Cv7nR7O
         ZR10xbrEEke1ze0S6WAfyoPvU6WY74Y5lDk+2bn8f0dAT5SONEM/IhnXVHmIJTHwcdyH
         S73Ce47Pdyc933VAm1e/N+kQM+SNxf5SMCBpn/YwKgbEDSNcmZ97EZVHwctH+VyMXrt+
         8qZA==
X-Forwarded-Encrypted: i=1; AKwUvBxedNqMJKDLIBQP0MKtiou5mfD5CCuFKXS8oA/DKxsiS5HsmYgFvfWQJ98X444jFEH9MChBeeu8ZVxKZ5K/@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ9rY6/LNIghh+R2y97xHxaok13Nh1gD90pTp0CP9wFLx7e2pd
	Fj4klsm7LurZT0XaBwJRbIVzDcH2wvc84eWDR24eYXk8ygeZ7X3z3M4hKikOS3Z6rM//5juPRbV
	bGPo1q4LxURaiUFxP4m3gjo7Tm79fmyb5LIe6LhGm4x6Y6rvaOoqZcSbQEcTIsQ/xFWdC
X-Gm-Gg: AYBFou1KF0lJV4a5ekjbVaCJejXYPKzMhrSBiqHOFArkZbZVVIxEmh0D95hXzlT+vuS
	drLKVQiZBl2ym+sYvrVVjEeWE/V2aZTxEc+508+rEi/DaU0nJTIx08AepxxbTz6GAc+4xs4LLjd
	N8zRI5l8p2WPkV/ulbLOYmExUqwGhfeB87OhA1O2KS8oS8QrgJSFcLOcbfPLDwBRzX1BdavAHEV
	bRQXv/5rP/sKZjC7RWL5rhXVgRcAsboHziIgDPZ2mitlUKANHgw+oxRqiCfZWhSmX6t0Wql/Rf1
	kcchaMFDmzz7s4OJri8SWu3Q/RZMiF+629xbhagZwt0QM4D9f2cVhvOLjsRT7D0LFmcNGUrYRXj
	WawdNKBPxZ76xZADAgq5iXpY2BDIdqTjYVCxADSPhlLm5kNB5NGN7JiXqXYekntx0unjdvecnZ6
	fsAj9YnnGBKeWH
X-Received: by 2002:a05:6102:4b11:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c0f59b12damr762570137.37.1790945174150;
        Fri, 02 Oct 2026 05:46:14 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c0f59b12damr762553137.37.1790945173587;
        Fri, 02 Oct 2026 05:46:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795bd0sm692372e87.38.2026.10.02.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:46:11 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:46:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Message-ID: <mxfi2t4qwxb5n3xebdfesq2rwwrimtpav5uwvkchtqfjksl2rt@gr4bjqqyt22y>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
 <20260616115410.325837-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616115410.325837-3-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX5z5P9tGebg3d
 ab2eN6LrG+YCxClbrtOnMJ5gex/2rYAgeLZzU5lztODxXhuQ980n0h15SRKSMLW+ZEEnceaFbBV
 HAwaPhQcMtRNrYEDLxIE3E4cHtDrXeE=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abfa797 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=xPXTalVV15vKJwUFfvMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: _cGHjEecoJVSypaxa7OheHE6Ib43KxFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfXz4HrprhOSjPU
 IoIaaXwxx2UbZlrWcFr42legFMYyr3Fuj1x5yBxRhVe53xDDh00t2LHYepYdzepVfBnGsHuNMTb
 cnxwOvUo3q2cAmS6WZOcl/QWDL+0d1ak269758SWZ0SV/DKn8+y0hEREaZ7zgPqx5AL04ZdAVJs
 cLOG7+rDVbir+LyAnc1HRoITm73zVFFMw68UPwF/hi5d0UpfPZ+/0DH1hoDMely/b53KdRQd5ZR
 zwLZusptQdSusmJITw/exqgLJpF0iGM2TzYaUXJvJZsB1hd3CY3cMPhiI/lI/10c08U5RcYIoxj
 ACAsePtHlRf02L+bDsoiKhz9s1ChymyhdLvNXY/RmwlkPaor6KzEdCFwj9s7TeMTZkDpensxXYq
 Ya7gdd43LY2qXcmLrXdGYAZk2bVt+HRskC169uzWCnVuEKlLH1KAZaD6PaFJ+Gzqfj2Vz/n1ZlR
 KUbq/LvxyLNmYZxAsjw==
X-Proofpoint-GUID: _cGHjEecoJVSypaxa7OheHE6Ib43KxFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020050

On Tue, Jun 16, 2026 at 05:24:05PM +0530, Vignesh Raman wrote:
> Add job that executes the IGT test suite for
> sc7180-trogdor-wormdingler-rev1-boe.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index fdaa26ad79d6..61ac2d043ce3 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -28,6 +28,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>      DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
>      DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
>      DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb"

Let's keep it at least minimally sorted, puting wormdingler between
kingoftown and sm8350

>  elif [[ "$KERNEL_ARCH" = "arm" ]]; then
>      GCC_ARCH="arm-linux-gnueabihf"
>      DEBIAN_ARCH="armhf"

[..]

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> new file mode 100644
> index 000000000000..4af93eeeaf99
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> @@ -0,0 +1,23 @@

Most of the entries here are shared with kingoftown / limozeen, except
for:

> +kms_invalid_mode@overflow-vrefresh,Fail

Do you know why it fails? Why does it not on previous devices?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
> new file mode 100644
> index 000000000000..8d1768de90cc
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt

This is mostly a copy of the existing lists, but kingoftown and limozeen
list .*suspend.* here. If we don't skip them for wormdingler, should we
unskip them for kingoftown too?

Also, I see that kingoftown lists several additional tests to be skipped
(kms_flip@2x-wf_vblank-ts-check, kms_cursor_crc@cursor-random-max-size,
kms_invalid_mode@overflow-vrefresh). Do you remember why?

Overall, I _think_ I have commented beforehand, but I can't find that
comment (so it might be my delusion or false memory). Is there a way to
unify the configuration for sc7180 trogdor devices?

-- 
With best wishes
Dmitry
