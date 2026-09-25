Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E548B397
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342229; cv=none; b=h66u8/a8d5Ah08yCGaU/NG/01UKrjYD0ueUOBwVB/IUnj6sdzL+AhAls0rBe1R/aYZ5RQuzY7rz6HCHWigQO3v3JR16OtzFQAFxRO/YpArCumqa+LSEooKSoPaiK7d9eWf916CeAHt1lYIeVqtAvDT+gbxKA51kewSZ7RtBZzC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342229; c=relaxed/simple;
	bh=zDaaCC/jLOIWcnflHQlHeEjB6WL5lOGO6nUa7LjxF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3ooHChWtsfnlkvY7WZpIjW2WdHTRSjaVStGqieREJA7oKPwUhcD7RXfitR47XdfZ18dlI+5Wq5pGsIgT/9Iz4m+HRRQvl3SSnyYLA//endXVXwTL5w4Kxia9Cqk36CilZBOLczblTOJOD6N43Ic2YQskv2v4X3wq0lKh+FCg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PC94QTS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkghJ1rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PC94QTS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkghJ1rg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4NMu609372
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YgTkQRn9Jl78hxcy8EjhxfN7
	hIYcFJc0FMzXtgfR1Ok=; b=PC94QTS8MLGJJcGpAeJDGmSZ7L38HLKgyvREdhLy
	K0jDy8DigbalKUVUPNmoeg7DDFpxsrvRCZeNMLOE9+wlatE5JccvdRNsXPrILZmp
	8uhuV4wP5Zj5aM7rkLOqIsUWzZT6VVu+SRriDw/P4bCnsHuzWh1iSH1jylgpXU0h
	xR05qnFnPuVi+6SWgaYVONwDDmroSchzyLZNehQZeFU4Q2UCjqqALq3pVYSSjYAv
	StH89nFhEtW9DqLS/HJRSG28r342YFTp+wBuR9jApkxrIt45FhamFkNCiJfz7amA
	xVW/IHrNVzHKF6HEe7p63qD6LRBrOv6acwR2REeiJ5v0qA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrjed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:16:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98331b577e4so656804241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790342218; x=1790947018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=EkghJ1rgi+hcCeQrbA59uF4aqucRTRoWhcEw+qdUOt/g7ZY3xbPfdI4xmLTkxEFzkG
         7bDk9ZHzEJqzdaUc0FZ1xff1PWFir1hwJ87BPpv/kI6EBcRgItreF6cdoOia+fECwxzC
         7QjLgA7QRP54ioywiE9k96V52zpMTOxH0oyeXwmDqs9E1YnVV/jNCFv+4ImarYHDEnsT
         M9+dPhEZiMKhmv77mHgqppQZQMpDNln1dOvpIwTaU4jcA7O6J3t4rwhqdXGXwiwfQTbu
         yV9QvMuPiveOOlE6mwNwQkKAMjocA6OktKx0o1mn5UQtIvRH+xu/Pb+s13FleIqWPFtE
         vSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342218; x=1790947018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=XnJ2tupMPuxzsIq1Ye/j3wsLHC0Qko/SLUMk2IKxSYhVGb4cGY0C7Jyf8C8/BzU82l
         6tDntYTQ3AYtVD4PP6tMN0GY2kyZ0CtQiItwa8SsaFeL2ITgkhs9B9vPiepMyV2AkDG1
         6/bemwuUwZMxvJg23qJU6v+bPks/a697JdqMMxrtpCtp6S+w+w4dv86SPCn4Uf9CoH9L
         3+epnzchVqLxixVc4TZ8y2kOZoHAIgKJMWfAByyIFe1+ax5PqsF+ESy6V7b+G7eNM1I5
         +rr0pZoie6+R8NxDXUfMklhg0CXqy079NUa8iyMcqoEn1v5wF+GfIkTHZXpAFncJZ/8L
         c80w==
X-Forwarded-Encrypted: i=1; AKwUvBzoE3TBEzg9I0f7rzpip1oqWMTH8BNzT6DIwHThSPdd4/h1SBrqxCmkeeeQtmzqSLx7xU1UMN8lZRnQiRPJ@vger.kernel.org
X-Gm-Message-State: AFuF++lUk1N3loINRHUQkUW11EVmzJFNwUU5spLokGf+JMYlkYifL10q
	aUpWW2+KUWOPM0ZlvDRkWkKTcEjTZsNvkGAcD0xCSVKJVntXr3yfQMfK6D0RLLRBuz2viErrZaS
	SCwOOPSmVkyAF/dElOhz5X/5SobX+WEQJ1rRQLN6Spn9WVFpNVPNBKU8DNmBQ+e+E5+/T
X-Gm-Gg: AYBFou1Z+XUf9/06PjH0DZsHgG47wUIZ4Afn+4LfwYu7PTPZGi+HwNQMkEccH/ogpzS
	naNbU7cZIkaxr1HoE/CFzhn1+kKy+ullsEYEOdbQj+chds3wxGOln24ZCNxt0Bd3upGvgeGA1zf
	p911vCnhIupKIRBZDx0A88qvlAbBWSXpieiOUKF3mqVbmYV7TIyaD+QAV1IftIfprPnSPfwHruf
	4ZxF69EW+zSrRLKA40tRYlKMrUH5+3PK1t0Q+fQrASrFuL/RkSafqITdhma8xNTLrS0XLxpsgfK
	B+sLxS5b6kS4j+kjD5RyKFac2gURn4sc/bNaDxvcVwfuoldFMMsxiCBrh7IM5r+jtF9OkG0iKNG
	SWW2J1kutaaGB7FcYZLxcFABp732kvrowAFz/QQRxyc6Yry1degvh24j+M3+G8MBcdXuu154c9G
	Jo+GXjmIL5wMPC
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2644355137.4.1790342218100;
        Fri, 25 Sep 2026 06:16:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2644341137.4.1790342217568;
        Fri, 25 Sep 2026 06:16:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af1318sm546173e87.35.2026.09.25.06.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:16:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:16:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: don't report link training success after a
 reinit
Message-ID: <abnzr3ksgpndanmbra57px2daapzztxuqnar6jfvdhmgf5ff6s@jrvxv3gnz7o3>
References: <20260925125314.16563-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925125314.16563-1-okerixx@gmail.com>
X-Proofpoint-ORIG-GUID: A8gR5NsjiH1BOGTLu2voauoKQrwAN1JR
X-Proofpoint-GUID: A8gR5NsjiH1BOGTLu2voauoKQrwAN1JR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MiBTYWx0ZWRfX1Z75LY21II8L
 heXriDKihm8AANgvzEyNiQ0VOeStNZWWitPLIjIPhNK+jHyMuCVC8B5ZED/WdClI974G+DhbZVy
 DqgpGvHQJ75wL2kxh7PK6vO2luQqrfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MiBTYWx0ZWRfXxOHeTNvyEqbk
 AV6eBPfNWmCzTPzkpaXWQylaT8mY+hNFlkXNhP0+ZV4xvSKYzd/bhSyK+WpM6YkRapuKi51h5zD
 +MU+a4rnOa5mleC4CMLPtx1XsuPwgiNIHO2gAt0zjPJDzsAJ5etYTVXx+ozeElMYDjeL/zHsAoz
 oCsZPYNvhYfWFnieDO7Q3PvHCAjgV8C37q3wArwagwhsdTV9x1Op/BhqKb2lZPD9n9Qc+XsYsfo
 JOEUSd4oCbp95by2gf2lGm8XbqNtILozc30+GC8FgOSfO0PrEvmH6nYY1tLbqCUzfYfKBudEThC
 qzlDq/TwkxLG/vaSl4uyJEIAKFR/BkcQ398vGzGtTLh8EzFN0FyFQTv2G1yVbGxe5akjPmvkToz
 2TZKbYxqtL8BVs4A68QEtzZzzFLGOoIfMrqNGkFu6GQikgbsmT4VEaUY6f4GK5F7yPZu2HA4eUP
 BUJ6xLXVF/eumgv4P8g==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6744a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=m9j_GCGoi3mryc8sS7EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250052

On Fri, Sep 25, 2026 at 02:53:14PM +0200, Oleg Keri wrote:
> When every training attempt fails, the retry loop in
> msm_dp_ctrl_on_link() ends on a successful
> msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
> enables the stream on an untrained link and the display stays dark.
> 
> The retry counter only reaches zero in that case, so treat it as a
> training failure.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
