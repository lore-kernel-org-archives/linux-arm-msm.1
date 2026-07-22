Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C2353A8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728683; cv=none; b=SqBiPl3yN1QpG29DBRg7Cx74jYLfue1R5i6mSToMz0yhW3dGaFVQRfOAaOtyvaySC/BwLgC+w8m4vpiDv5nrcQ/WYj1Olx3ND4iBeSzPRH0THUChKP18E7ub1YnHMhJEyjMibIaInBV0AQ+/VKmv4J8u/7gvyH1VxTZy3GM6TKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728683; c=relaxed/simple;
	bh=DRFwHVVtEZwwXYh8YuWVhgrqfLXQvwYypw7rf1PFmbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUZp/83w9drkhlTvcj7U2Od3o022QNVSh3A9yDjPGIEGb485wYzDNnvR6M8JXL0+pLX1JCgbcFlTSHijUlue8jy8REUXEgZ8u7LYwRhAq7tUixyv9y6ot+cFvFGVN0hkL16x0UbETFVioHNdVtdbOJhkUl5XBySKqv4xTOI0cB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5UggOjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daZ773bi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5UggOjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daZ773bi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWRwY765286
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GUQcGZqwm0TbucOxZ5RZiruh
	25zjIY7woU+b7Ags424=; b=C5UggOjp1b3jVSAhxyQO2EwRwoWv42WOEuBZrcm+
	9d053mY0TySpCPo9t7K9ieMXJZLYTgnenhRjc71sKE4QvX13GRb4dfKQEWmkx9WK
	7K/Y/zkiRCOnRdrqrmcEzNNVIL0CgOwF4pm5/7ISuKlWG+rZy8fUGIIO68d9t+HY
	tvjD//kOcfRyX8tsLojIQ/0S56hm17j+obaPQd3ftEo/IhY3ke0YfsAkdEykYsR9
	1Ku2n9RyZama+6P/Rl/DLzVsYJ7ON/PzPOs9bEYD1pz7Y1zVYvMSukzPbTQCHEIM
	X5ncZCseXv8FILoTLHoSnwcvFK0GKa9ngDj0q8xMJ3rPgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2s8m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:58:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso103728371cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728680; x=1785333480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUQcGZqwm0TbucOxZ5RZiruh25zjIY7woU+b7Ags424=;
        b=daZ773bi27nzGjItjh2zI4c+1UNxKkv/5abCLH4Z4ZFqqZMNyqD0qIwjNpNdTdjFDr
         in084HEmhyyAETUQHW8U3dHRjahtMmcBux76EKVS0vkscOjgNFYGgIwQhqllkh4r6ABP
         9Rmhcp5JyVAvYxY5aWseDbBpmLTzMCubQbc1EpGp5ZT22oz3jNXjFi0VBDNRt/apo41g
         rcCyZwttrPXOL6Ms1x7rslix7yOdxE4kW47OHY/kwEJo+g7BRgWOc/qQGJXggQ6zVSVS
         ovjML6f07EMGtFkO86gZSeZ8Vdshx65bKiNgy3HOPVjMDDf8aZBjy3gXgKJVtrG0+pb/
         dW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728680; x=1785333480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUQcGZqwm0TbucOxZ5RZiruh25zjIY7woU+b7Ags424=;
        b=c9nsG/AfiywG2yA7G9PT6exfYnx/mXE++cxGl+0te8QPk64uS3rHdr4YvsNuY4agj7
         YsvfCfs/ZknMvGIMH9ViCW3ycBT+lxe0eY11XZD9+WdJE5gEMQBReQZItbDFnz1BMvkO
         GsZW+F7F8iAl155BoFL/QmKLkEhD226ibzS0yWx/BC8QowrH4MX8o7eQ2nV/KVEnWQ5J
         p24kqqWMJBZaQFtS52kc2TINPZaMJ/F00z9ri0m+5O4Ei/zI8j1HyqrOljN7UgKPYX+2
         vw8fQE0exDtI2EQOTYuxwLrn4ABgFITN+ctQwZNLOSDmAoJCrAqOZbqVIGYBe3hJGXJV
         7OQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpkBcn1PIgqcLsNSNMsUmLY/P8wmJ9vpQXzC+Dx3q+RyqtcUMB4m1LKwoCL9sFHOPdk9d+5AGEApdsTnCV@vger.kernel.org
X-Gm-Message-State: AOJu0YxtwCgTN69eQ+Is544zRYuXpTskkFF7IrHlT/EE3cHcHHSEZ8mT
	zU5oDAW+U/D/VpoAYz7X5FqWu7F8K08GqRAIm5lYwQ5J3zqRka7ykoFa5os6xRNfvQDHljxXQab
	ozKXCZM/GDSXcVSXZBwbz9RyQ45QQxXdeC/fDZLopxwxmRmAWc7UAdNCbaD8hgejbnFF75vyuKG
	q8
X-Gm-Gg: AR+sD13lRqUS6P2GI5n+KdsLxOp1RB3tO6SM16vzY5WHDLudDJplNygNWKK0J3KtOZ1
	A07pYMJ4yiSwCOqqn+25Iz9NlmvfIYlRCeTZpgbhz9VIYOGSX4TY6UjqDU+qWOb897jbVVWdvMv
	mvlMExkTwr+lYUvsHJuonPzAkxKWf8RV2vzXaLimLm3uafsuE7TgcyFaMXoKzS/jCwM6duyvy6K
	5pYox2uqec0nCt98vLCFcn7mQiswKNW+jpCi8d6Vo8Fz2SSxwsciIEuMK39Jtqxs2lEdCuAsVs1
	4XG7XeZqe/3ylrcGAmC6Bv4Y4qCII8eRqObV8rOvwCpvrualpMG/qDzrvFVYRXrvZgysWpmaRyt
	PTjxn1jD69+B/v9oDZuW3FpjzJyg2HMOAzYX3JXQkHW90gFtPCeCBlo2y6cfD1txOxSqdTpqAsR
	dpjeJX+VK41NF9DQ==
X-Received: by 2002:ac8:5a04:0:b0:51e:4f6a:b9b8 with SMTP id d75a77b69052e-5213c10aab3mr209990051cf.1.1784728678976;
        Wed, 22 Jul 2026 06:57:58 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:51e:4f6a:b9b8 with SMTP id d75a77b69052e-5213c10aab3mr209988571cf.1.1784728676844;
        Wed, 22 Jul 2026 06:57:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a626sm521216e87.20.2026.07.22.06.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:57:55 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:57:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: add .shutdown to mask HPD IRQ before system
 shutdown
Message-ID: <4ejjhxkyuqcohkobvbmqlb6abtk6me642hnrv34mh7elxogbh5@i6ey4byagrbw>
References: <20260717-dpshutdown-v1-1-b062c2f7dfb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-dpshutdown-v1-1-b062c2f7dfb1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfX4ilKxEqIm2Jg
 JhJ3aSe96rhyUOIEq8/F4cr+nliBERJyIXlaL3kSZoTNB/WY7UJht/CSQvaIXvI3gb7S8UMeVTq
 w31M90t4Ud3LNKOXKBfHjtwgIwg2QuVfkDBff2XlMxK4DtBBS+RdvqrR3xgf9OJnel4dzS5RSdx
 UAaqCrs3m0WD5pZ3RcIAwYEE2xBcql/3AumAWevzusz3mcE7GonBUxZERSYSer0mFkz2NRjFhdi
 k2qoTm+puwUE1W+ohWaOmfz6eR0zNRm/dI/oXa+fC+vicYnec4pOAE9AALWNnwzBQ9aAHkzftXN
 dpuuqYiQjhxvZGR2rP9tXlaRAPaKJ19rM7MMsIb5UagweQJAgJCgoxzEeS/n3Oc9POf2dfSXFhA
 oq9yFzlwCtq5upJ9LY8HvpiY7OZDYUqJrgO6Hxsqi9NMMRNXOD/HY9nt/KrbqFNtaplJJ2GF6t4
 fCn/FK8guVt2Z4BZ50w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNiBTYWx0ZWRfXylC/uktA0n42
 GRmVubnNH3fxFWI2kJ3ZqllT/JjE+PY44oyAhvarHCTQfsCGYugn0371FXtmsbQrNAENIT65+f0
 feCxViAl7opnaDIfG2kxjjWpXhPOvRw=
X-Proofpoint-GUID: aguvI6l64zw7anJF0PfJEOx-vB1IZPAN
X-Proofpoint-ORIG-GUID: aguvI6l64zw7anJF0PfJEOx-vB1IZPAN
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60cc68 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XflUDCCV8CpTQQRWUBwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220136

On Fri, Jul 17, 2026 at 04:56:13PM +0530, Mahadevan P wrote:
> On reboot, a late DP hot-plug-detect (HPD) IRQ can fire after
> apps_smmu has already disabled translation for the display
> subsystem, causing the HPD thread to kick off a new modeset that
> drives DPU/DP hardware and DMA through a stale IOMMU mapping.
> 
> DPU's own .shutdown disables all CRTCs first, but a pending HPD IRQ
> thread wakes up afterwards, reads the DPCD, and fires an unsolicited
> hotplug event that triggers a second atomic commit turning the
> display back on -- right as the IOMMU is disabling translation:
> 
>   systemd-shutdown[1]: Rebooting.
>   msm_dpu: drm_atomic_commit: committing (shutdown disabling CRTCs)
>   arm-smmu 3da0000.iommu: disabling translation
>   msm_dpu: drm_dp_read_dpcd_caps (late HPD IRQ thread wakes up)
>   msm_dpu: drm_sysfs_connector_hotplug_event: DP-1 hotplug event
>   msm_dpu: drm_client_modeset_probe: DP-1 found preferred mode
>   msm_dpu: drm_atomic_commit: committing (unsolicited, re-enables display)
>   dpu_crtc_commit_kickoff: crtc94 first commit
>   arm-smmu 15200000.iommu: disabling translation
> 
> Mask and flush the IRQ in .shutdown so no HPD event can retrigger a
> modeset once shutdown has started.
> Reported on lemans-evk and monaco-evk during reboot stress testing.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

I'd very much prefer if instead we fix the framework to stop polling and
HPD notifications on shutdown.

-- 
With best wishes
Dmitry
