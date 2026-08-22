Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7D25B083
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 07:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385104; cv=none; b=M4Q+Ky29FSPKfGr57bA+mYgEj2HRkc7Rjs0JtKipkRHc+YjXNqf6IuBwxb2opCRaR0Z5Up/NXEskMTEZPgioO0wJQee/dzkjL4+5lmbobOS/knfPpLUZxtW7A90/x1cGTOgPtgpQQLU1na9rGVC95/zanWNK6mDRRUKcosNW4lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385104; c=relaxed/simple;
	bh=NnfjZ4w4h6tBzOscpDtytT4ux8rhcygPmUgbeBTMgNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTN73MZ2viykviIEtQYY6PL5XG0rePUxMeadTNh1xN5mH+YOOzFrS7xVihDt4Hm2C20xG2SCRylUqhjg9uxubLe/hR3BkQd/JGnlLmKNJCjE2iweSLJ9HrPBd4IfM71SJT0damNMXDfA/5FFhHP2f8W4UceGCAagMd9WKBgx94Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATvpPIuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6kLqd6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATvpPIuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6kLqd6u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M4g9QC3485741
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 07:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BepdfuaTr18C0E7I+AUvMC/Z
	TH2x+4KRgVnzynO6hG0=; b=ATvpPIuHe7uK4fxu/h7GJXsxwMAavSH8wuDUHe0M
	FDfGfE1tIa5lWohfZGYwsmtet1HqMaxq1SWXPV+b5VaFvN7uyyI+Obj6mFWULtDG
	K2qzDuu8qrFXucRQJA2Hq7u7+5UelI3lZnCQQzTbo2HmZNmVN43+FeGee09UGQlc
	fOCk9EjNKHPoITMlKNhoIMm1ZTpYAd1d+K4NTM2W6XGLuH9ezQyfoFLt3Y1yECgg
	esDo7Empv9n6lUfplALgxNV4gTKsCef65b2ucucMReHZWCTm/q6WIPlP/wBXGtal
	kje+88Xt7KffTK2XCFgND03zJ15zsXksCzoV91/Q5PMVEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xh8b92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 07:51:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso30276061cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787385101; x=1787989901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BepdfuaTr18C0E7I+AUvMC/ZTH2x+4KRgVnzynO6hG0=;
        b=W6kLqd6uetFeqgqUq12HTte9zF2dlV6sfMV37Ba5TgIzdJIABjcYpwAs/WVLeqrSlj
         UoAARA4rvNNYCZCORxmOM2iD+/G/XoLw/DDBgtqc75wW58c5dLXdTvvEnf3yfUf+rhwp
         XitwxQycCQaMzMyaFK1vvAoNi9NacwJC/Aohjlr6ewJ/uDJm1IOsYjKO4+1uld5RG0O9
         T0gOoNS4L9MORA5oQJsmAEsMrnrhhrOPkm2GLlgmsvKe8A6PfISbZkzrepMnFzeVbFIY
         UgpYreWotVqLXCxBqgukD9neWg5wvGZuMNBQ1UVcTx0oLeKurR6zZKU43N8q304SlQaY
         yqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385101; x=1787989901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BepdfuaTr18C0E7I+AUvMC/ZTH2x+4KRgVnzynO6hG0=;
        b=cUKCkTL7n5PanYKD64FPrWzKcOF1ObAguLdSK1CemR/ozbnwwup6X6hr/v9R/lprqs
         dDGUkg0m7R4JC2mjOkA9X1QczAp68USYyk1BsTOk+UW6YmNfUcAlnZl0sWfI3QtTC616
         lbnmp5RaKjw5mDqlwJHyOJuE70w8tkdmhM4BkirgEdHPtE5YumCCwL+dXRsALoVZhm1X
         r0YSUzUQRDK1p8jaWedXker2bajvwcDMBNMWz5P0BAZctZsZz55hYZV1ZtGidqEDzG9Z
         olFY+9R+HETklSxEqBxheY8OfEGwUH/g+YbTIdVfnBxKZ0oTWYPFwrRvBCiyJcAqRi18
         FuKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR7N4KWbydTqlUA7TGQ7cw4uD8ycYqlnU0WMCJ5cGzMgiEjLO0KNdP8feQ/mO7ejtm9JiKzDN5GFbeQqVk@vger.kernel.org
X-Gm-Message-State: AFuF++mWJ9I0sltLldxJy0qB9sybFEChcj3K+GKWO/R6kOSu4QAPmBIz
	4kUzwIBgB6GCCeUM4n0gd/2WX7DJlk1BdWvpON3u+yVSmnqFEfILhi6szhb18FoCPMMSQSAu6Jw
	6z9LsCw7gNZLUYNcwQ7E/td0nN8WikXKOfXnp5c5iU+rqnxslZvKS1N8leFvrbkZqlv8G
X-Gm-Gg: AR+sD1122XGtPIXoIZegjSxG/4muSeSQwZpPwVDdKOr5NanFxS+vEN5SUEZxUANt3wM
	qlTBTEplsnNuBUw1vlp0sW5yqUCqcchnu2jalp1VmI1swR5Kdm1HjIUGHiAhOa9Su7d6fZsN2uM
	ddCmKk5JUf8f6uS0PJQFH/lTK682ii0tH0Eu4lEuk6YGUmWD+hih4lC8jA57sVeWdz0x6+R+c6O
	BxW/L+hFytdx2OkqbCYycq7NK0HPdRnaTNTkuRo2ta1leB5zNJKNBbVZvO/PzVJK6qVkbeC3i9R
	DEzcHJv7VmDpr4kcLUQn7yjVALsZixsVaeFQufJLTfCPA+frGFvcelNhfaPt83ezccU3p0HeMD7
	UC6ZxQfXXahUjYlu9qn1hRCevOpdZ1cyiGxo5RTjPSTtsgfOumHcOhbRRhi4iQTW16xLdMv8XqB
	We9aQQLpEEB5pE
X-Received: by 2002:a05:622a:5c8:b0:51c:51e:661c with SMTP id d75a77b69052e-52df585c856mr109611971cf.25.1787385101449;
        Sat, 22 Aug 2026 00:51:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8:b0:51c:51e:661c with SMTP id d75a77b69052e-52df585c856mr109611781cf.25.1787385101082;
        Sat, 22 Aug 2026 00:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cd9aae8sm220570e87.9.2026.08.22.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 00:51:39 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:51:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 17/70] drm/msm: mdp4: Switch to
 drm_atomic_helper_crtc_create_state
Message-ID: <ycweatq3iyqmgzryqhceh6osjtsols45jpjm4bdq6auzenf3yi@un37ueko6f4j>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
 <20260821-drm-no-more-crtc-reset-v1-17-fb793475c05a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-17-fb793475c05a@kernel.org>
X-Proofpoint-ORIG-GUID: OaDgP46JzYA8rBmzXO4nvf-OStIObsqJ
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a89550e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=uh-rAEkd9rr4pKaSMd0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA2MiBTYWx0ZWRfX12pgb2aszph3
 l2/vb1y/cJ2GU2dc1JYfDnkLS9E8tBn2pxGbECFtSy/clnyJgvwlGEtvJ+WnlixO7kTqnK2T49Z
 eS3Kyrp6D0ymmNu4/pxpQHvjIdY82qckNoO5EMNi9njitJnLrDuVaadOMz10oojtar5eVDnMqHB
 tKwU7wpBe1LElUHb/qlJKaK1wFMWp2BrBaUsKR26+EAiKo075nZD8m82W0HYxve7/Abb7ahw3GO
 /cgGS0/vfdpNY6F0WWrp3UmJNAdD80s/8r3/6cVqifJ3JN6iSKL4PgXaiar1dwO2NOoe9a102zo
 LzIrUnWZKZ7sg7ilCLngscAjggBCXNqRn0KPOJlS4BgJx/GxBFwTx4Gie+ZAzvX3vCk2T46G7qv
 oZ8jeKUQ5bP/Snk3GsOTCYvmJuRRGeqFOuOvWzkYLTbuTE50nLUg+buNdZgCFZmnGmvnfZMPJKQ
 dEjdT5/+Uxkx96vBKfQ==
X-Proofpoint-GUID: OaDgP46JzYA8rBmzXO4nvf-OStIObsqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA2MiBTYWx0ZWRfX7/NHlRDkTpMx
 Sbpp+mZE6UmpfSV90mTlCAwOPY5Pkuhni5M8Kk0oveEkkFjjO4AKAfv+JBNemjECplsA9BwfKm5
 nMHuiratWxAKJKefptPkkKmvLvfOAS4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220062

On Fri, Aug 21, 2026 at 04:38:53PM +0200, Maxime Ripard wrote:
> The mdp4 crtc implementation uses the deprecated
> drm_atomic_helper_crtc_reset() as its reset hook.
> 
> Switch to drm_atomic_helper_crtc_create_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

For this and other msm commits, Ack to merge them through drm-misc

-- 
With best wishes
Dmitry
