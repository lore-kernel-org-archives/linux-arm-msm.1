Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC64D17B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850406; cv=none; b=pONSx+stQhde0TEqDjwUTW/4PiYK+VOfMjXktqqN4egX5y7uWFZw5mAE/59DFxjENdr38FSufNyKRaxiIl7mNLdjOpryJdhiWLd0xYuUMDN7vax9EkvO0nuE3rzFLIDba+S2LpuCnq7+SxG7fu1DsO0sAEL+XaKrIQ+y2gNgkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850406; c=relaxed/simple;
	bh=N2JcS70y3AkxetkeynwcpCm7ih+SESJl34jmKaoxOiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khg4SyVj0flOPfs6XKeuzdJvFQZHRBiztrjOta+5UMcdiJPDocliabJ39/+72xp0z4UyEfCMgeFrnoMRJQohmrIoW2Pk71kr10PpYiei3XmusSLsDHYZWrr7/Ym4eoEQJyYi82wNb3bUzHwT++jUVgZWP3yHafHEa8U312gWNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gG6oya37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+Jhb+G6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gG6oya37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+Jhb+G6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xhnf1512002
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btECEzNcIUrnRhydSG297BC0
	t1Sy/7JZkAmu8xyyFo0=; b=gG6oya37F1zEmtdk3v4kdXz16qy2VnDbEy55z8Da
	/fx2fZLwmZUyOqOWTJLOo9RdzaqlDVWb0G1bDXm5NHFH0upJzogdB9rhJb+fEiVC
	aVTPCT1c+Sa5ad7YwyuSqwfKOaKumMH664q47+HQ15bSZiVZU2Yt8qLajzGstwwZ
	+1j/v9+JQDRGcf0q86uvdjfldFlhoO5nXP5a+AoOw6UyamhYkAi6hzxL+3MTGPh2
	/eRQl7sEiZUgdW+ICY4sooOIz2neizcRBgqcWa5NEM5im7GDiA3EVg+YPtLhlZzN
	jA/MEOLAabf22l2s3UJNndVThhpC2AtHEbA7tftx5Hq1tg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188su7cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:26:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso2813986d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850403; x=1791455203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btECEzNcIUrnRhydSG297BC0t1Sy/7JZkAmu8xyyFo0=;
        b=Z+Jhb+G65DKx2ZchSh/T8LHOu2lwb/JIzYqVydS6DXarfVKWnkqIkcGZZI8REFHIQu
         RSnnvrp4TPhhQNyF0HTMfH9hgYBcElMNcJFFkwIM8aeKBxs61Fr/VBszKsgo5omRVyCx
         SW7pvWDdWVefH8iuhAI+6jp486d18VcBDwuS66R4xHDC7b66DR1SXHczxsJPxfb6FZCi
         gdYJ8DjzxADvtOfbn3/9Iz8BHEIpy3OixMZ7p5ZGVqQ/givIn1CHSUjTf5xORvg8sENn
         nMnfbPYefTb+wbpp1dOD2kRMstsiSU4AWRFDWtCxmeJhMI5+FgKVWx7VIiEU5zM+wHqe
         pHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850403; x=1791455203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btECEzNcIUrnRhydSG297BC0t1Sy/7JZkAmu8xyyFo0=;
        b=AVZ7R8ksBQFaJlnB+fRtWj2FODpxuV8iRuXWpclIyx4apyfvqX4R+A+Rsud3RkOpVG
         Iy1W9xstw5JzJ9pTm0e/Eh/eCQeiigswN0Zouj47jmMACc2PSjM6yq/6BdfuivNB9Rv1
         NpTugCy5UWVCFAvTTff3Z2eB/L0pOmVHI+31CcmbpHKSehDriE6O21UMIXly29a8fvI9
         j/xLo0YlhxJo3Y4VlX/+s4LIFixXuf3v8ndqaf32JMqqDRvX/g1cVSf2UynY0vQ2VM+C
         p7F6Leb58VF3BUXthT1l6QZz9J4JTE4uNOBvP9TZ04/dCyTRSJxGnAZv475W7auj4afM
         0yDw==
X-Forwarded-Encrypted: i=1; AKwUvBxTiyZ+hXQ+Ik7AEy/9WnnhCRDkm/+fwYbXVPiHamZgB9HIf9w2mMJM4uvJW7LbrjpyAEYw4Jt36VGlrAVI@vger.kernel.org
X-Gm-Message-State: AFuF++lkl41M1VkP9biWL8aXHWvtLIxh1SDyAXT0XW5BffOGVYXBbxZw
	zG6BDsNQvNSjVyp0sGBIyXsLCfGSk5tHM0eF6lp3GTt1u+JgfdLBl4+MDUxRyW6Z00xNUbQRpq2
	0nPRPBKzsuMuQFkR9bM34b4wxoLh+01n+ZFSzI06W5fp1XsiOXFpSXMSJJv/m4IqNAth5
X-Gm-Gg: AYBFou0aSx82YJ4aEhmMjORVBbgy9T0DKOTX3Gp+pnzCMOpxOli5des6O7Hm6cdykwB
	ePvMfaJUl/gi7u0rpTx12OuvnKdV1ZwHTHG87wbRCRCMu40XcEa40RyFuHdBlLrakbj+Nx/CU7E
	VrCiy+IjaGJK7c8023MYHI9G5N8qvPAwI0dB1chn6faAOXUxJGZgHgmrKnUmwM4vKHw+8NB4c+h
	3PtJZNThYS8wjD3IOvjDdi8hugSQVoxHRHqgAxiqm1GBZrIncXjHQeUQhFSngtdRTihv5HEkXwe
	QkmV0c6pg6cbhikTHBFm9oxUa4TRe4+HkQVrEp98t1pEfkwcQAosho0vlUkQoa6j0ovK81q02eP
	URrLbo4/gyn6guhfseavdC6S354Cbfc2x2UI4c2IF+1R3a6UGoQq1IkJQmR0di2hANaOYjNuxGJ
	kMz2TAtj5ISpeL
X-Received: by 2002:a05:620a:410f:b0:93a:48a:167 with SMTP id af79cd13be357-93ca973260fmr782549185a.39.1790850402684;
        Thu, 01 Oct 2026 03:26:42 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:93a:48a:167 with SMTP id af79cd13be357-93ca973260fmr782546685a.39.1790850402160;
        Thu, 01 Oct 2026 03:26:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2970sm652330e87.41.2026.10.01.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:26:41 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:26:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 07/35] drm/msm/dp: add stream-aware link register
 accessors
Message-ID: <uifszh5ste2v47fq5rb2ajopdb2tbkjqxvmgcizsl6gial3bdv@qv43p5qqopjx>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-7-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-7-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX+yQwTs7oY59I
 UVQAHKFDjmbUpG7wE1IoH4ZReOfUhER5xkpWLXBLP/pDAqVgo89ngWxa+HHoU+P6lNd5Ms1vkVK
 nft8wBgzuskQFSN4pz8fsT97vc0adDA=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe3563 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_HEUNlLEu-QooldpwzgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4jk17DI7ttSxA-WOxo3GomWhfhHlKh_x
X-Proofpoint-GUID: 4jk17DI7ttSxA-WOxo3GomWhfhHlKh_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX/hIvSMS65MTl
 rRgPW9zHXxfVQ5qnXtr5z5SDZW7TTMpMkglB1rhsGZ9163iUxvPaIx0bKkvUKbCd6YSRMIjdHn6
 c8Roxmb89M49DTaUG/Gg3uMCdHlkwXKJNMP72bpvyH9pmTyiAfLANOTgcOfljiEB+5KtKMxMrqV
 VLl/Ghxo0J+64gkWdU6ZsHZYh1UpIfoZWz7cev/5ESJGLOnXyb5kCSp7d0POcBMp9ZWbVk478OI
 RoppLhzirShugz1nYT8qoZ62xCPzAsb0Ss2sHunkQhERkIfFzkEaX7fyRW1G7rJtslno35i82+x
 51Pb7sL2OsVVSkzxPbxMFQ/77fYMIw3YfxPJWj4BwjP406E1MxgtYsXhxtBP4uQLrjfYs11K2fA
 PjIZnUKNOh+fcyFtVRLrY9dQk3MrucI2vbqgUwwq0lqzCaSGQ/mO/KY3kw4lKl9pwogEAvQQeCp
 mYpM2b0YO0bTuQXdGQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:31PM +0800, Yongxing Mou wrote:
> DisplayPort MST uses multiple stream-specific register spaces. Streams
> 0 and 1 share the primary link register block with different register
> offsets, while streams 2 and 3 use dedicated MST link register blocks.
> 
> Add stream-aware register access helpers that translate stream-specific
> register offsets and route accesses to the appropriate register space
> based on the stream id.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 64 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 37 +++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  5 files changed, 121 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
