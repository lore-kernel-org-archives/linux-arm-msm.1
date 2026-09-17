Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE53D6CDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631827; cv=none; b=mCJhJKVQaijyV0iUCDh35VivAoAt92S6u65bKPC42x+3oJcFgBPimPsAht/1z6LBWK6uIChmfdZjBm4/YQHg/y6rL4a+mY2LGo4+MTR8iuOUYstj5lGmIVmrMxqxnBnq/Mj/YVWc836AsJB+S1rxQeEW0ZpugmG3qEn7kWmc4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631827; c=relaxed/simple;
	bh=iY9bTaWjPYWI5f06paVysOAeZzeS5XMWySbrZCEv7sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWgnenVxh8wPzZ9t3Fq1JxCkr9xIIjzah64Ipe2XhrwV8T4xuXkFKqB06RbMBdW7q7qiVfTWbPI7p6u5SiTtOnAI+8NqCxQWsX52orV4DjzePIVW+ENdue4GHJ1lrd4pRmlK01GrOVdTj/CgJf09rr1n8xNoof7fG31ibVqqrhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jM0LTGhB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HE4lv59G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jM0LTGhB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HE4lv59G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60tGU1375596
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lfK6O+zMpXERRjdHBmWSSBz+
	u+TgGQ6sE1UUefUkAxQ=; b=jM0LTGhBqiZQnAdmmU7SC78sQ8UqcSYZ3ZbnQ0dA
	6wkCDrx/J85u7IpNx38bKy08RqCQ6AgN8mcdVpkVRirISdRMDIj0g1WpfbnEuzCg
	TZ8OZCOXUCtFHaR/j9Ai5/NYaD7d8/1TgGfKXqh5MwBi0Zp0gBII5d+16RQLsSuQ
	yG9BJJgPkTdq8mIAauUOs129Za7ePO0Q88tf9Z1c6nl5CDennYGDFw5QksFeLhPN
	RrCF3xp8ccVMnU8qhJlL+if98S4hjsdhSydJzNfCe4c63+yrlOUCbVpLTPuuIFSQ
	tdm+RjSYmQTHn4EIsonAuDPuvJNc9I6gTj1X4IXw14si9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6au3mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:57:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912348a0ffbso5690736d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789631825; x=1790236625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfK6O+zMpXERRjdHBmWSSBz+u+TgGQ6sE1UUefUkAxQ=;
        b=HE4lv59Gr25HasM4jHaR9pmpzV+Om2tN96L8Q39cEWGfUfkHBeOpxtvOIwsv4C9jJP
         lZCIaCYVWujkf95VJclgGycSS+ZRn2O0QZi2mE+My19rNwmoJDRSg/Cx6jyn9gwk69PI
         uQOuAe2a4J+ynVgranmiPfwzGrtXpqpIvxfVaAdse0ZfvQ6ObktLsh2vhQ5RHcxq6kC6
         3XSjfoCkXRhgZj/rqrCS3sd693aDo9MZ87eMutIdjMF943JvcuPQchQhEmz57GWo+VU4
         d4OFNxbgo0+4UGT3DAAHj5/qLB7hQ0159JJdv/C4FfYK0weGVbQxMiTrXU/4DU053Tyl
         NXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631825; x=1790236625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfK6O+zMpXERRjdHBmWSSBz+u+TgGQ6sE1UUefUkAxQ=;
        b=Q8UpswvCwKXe56BhBPfqw0AebnbaGUbndYiIRbc/wxnJ51ccBuLZsvuviW984FAeVn
         G9DTVv56AYF/WHfgHGly4neIVJmbkit2jF8RvhyrrITBV4nooZoR4c6XX0KUV3Ad8B4t
         QrjzntWUTXKeaDGqdeTMOWLuB5sJVcxHumVPWyqZJzJULO1jHC8N918Yo2ekEBApXgAB
         7Wsl3gsJfdUVGWSX+rUElu3UFAV7cT5MNQB8SvYk8x0Eu7TYlD+pG149Xcrg81OpVV+B
         LYBt0QgfBW/L7LsQvDSnHeAxnx9+dWiCyMKGKRuWndZq2X2BxrRTt9LngtySj/iisOR0
         3rrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhG3+ZEm6dzgteemL/8VAaCgf8iZHO4pY3Jz3a8yoX9fYRNmdplHhQzXlWcia3UpQUkij7cDZe2DMltf8e@vger.kernel.org
X-Gm-Message-State: AFuF++m9vIhS8/alFSyKF6we4fwoMIOYRAq+fcaMqSE8BCJ+7ZaA6r9r
	8Zpueq+w7Qs9GxP5xpaUpjRzVtytzsuVbhK+jNijDO3JGmmDluzHnCN3/XCAUgUZdN3H4RqLfEj
	dNxVlxociPhdzca849oVol21YxuaXotPC5RgPozoM8SmMdNOsltJMDzrri4LTt1rQA7Hz
X-Gm-Gg: AYBFou3zOkhwWpKLIYE1Vcj5gx8U1Av/sHEzM2rLgN9qyseW7i9mEWEYlbMbEH85un3
	0ZcSNhlBVsrPyDb9SdeZktvvpwmCMmorYDGYsvck8JmF4TfwivAipTm5pMVSoxvoy9lmmeVxNcR
	rJg91QS5a5DXpik1EY6nC3TZxuuPAQmWAXbP0BpuS4GkH4X4McIpCAgzfgaBInLj36AX1i200sU
	zQjwEwrm4lLS5SI7JFJKEBwrSDrBFERthFN5j6ONkDtmNQ4UjFZbMHjKGMyTaDxT5MZ8rhmQoso
	C79iHo0zpxw0cta0zoSpo4zkQA6epM56vGh2iUPAHr5m9lHbJsm9SgI2tNcYbNaxkmPniK6+8Me
	0hy0mECfZKzo1jj8juJqQu2R9FEUznBczBsVR+E5mojSwSL7+HyijKSh3NUrx6AEbz2BME3ayyk
	gP1xuS6E4JeUhg
X-Received: by 2002:a05:620a:8008:b0:937:675e:2903 with SMTP id af79cd13be357-93bb77a2402mr929854785a.14.1789631824657;
        Thu, 17 Sep 2026 00:57:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8008:b0:937:675e:2903 with SMTP id af79cd13be357-93bb77a2402mr929851685a.14.1789631824173;
        Thu, 17 Sep 2026 00:57:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e7f5asm1576430e87.73.2026.09.17.00.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:57:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:57:01 +0300
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
Subject: Re: [PATCH v6 01/29] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Message-ID: <rx6n4haa3y6m2ky7hretbkynevvvo3yj4so3nxc356ir5dqjtc@44ank4nkueiu>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
 <20260831-msm-dp-mst-v6-1-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-msm-dp-mst-v6-1-c91d35d6fb9e@oss.qualcomm.com>
X-Proofpoint-GUID: 0l801fw6lsDBaMBcsmi3WbzbEz47EjxZ
X-Proofpoint-ORIG-GUID: 0l801fw6lsDBaMBcsmi3WbzbEz47EjxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfX6K7uGUHAsTQl
 g0/dn6iQwMZvbWmwaDfCL1kFKElENL4+3+KK++UmXx0sFWRLnfQHPk79BWhnv1Tw7CSStc8Yvau
 IX82rob1+d5gmgZ6v3wLFWEP8QNpHQHLkfPM2wnuAh8jJ3iAW3H0LP142VYneszv0G6Jd4OoPQR
 s8xO/sJthgp9PHpDprEFAg4kslhzXWYUnT5H4cSkGlG6imqX+bDqxIC/emETWh882vo3KSOq9K/
 RmZp9LhcQetVYNqwcmhKIKP5WGKGoPGnYHDHYgwZZGjf8QQCqokBmwrlwtmzg9m7i7c+nKi7cvk
 tPdysMe2WA+wl2bneSI4OC06cPrCdiEW4ETd5Yq45TFVSuHQES4ThNWlLaax8HR4l0zl++4RSIK
 N04xQkUAJpN9YhAciFyMfVw13qW/X6yWiQ3FPh/WKCY5oG5OV3BJaNIt9w62tWwrVJjzm/tJpGm
 l09rdZbTdJ08/Ig0PIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwNiBTYWx0ZWRfXy14SJ45fzC4Z
 NaomsY6AvFkxL2lnBSaeBzpTr0fRaMhzsQFbWtUKim+CaL5jn42/jl4LOdjUu0ieIh1u0R614tV
 qIH7hyDyMYDxzPZ748N42E5iXo10/NE=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab9d51 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ull_tw8qIylx0EAJJFQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170106

On Mon, Aug 31, 2026 at 04:17:18PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_display_disable() currently mixes stream-level shutdown
> (disable VSC SDP, off pixel clk, clear power_on) with link-level
> teardown (PSM config when sink_count==0, off_link, PHY re-init or
> host PHY exit).
> 
> For DP MST the same link is shared across multiple streams, so
> disabling one stream must not tear down the link. Move the
> link-level steps into msm_dp_display_unprepare() so that
> display_disable() handles only the per-stream sequence, mirroring
> the split already present on the prepare path
> (display_prepare_link vs display_set_mode / display_enable).
> 
> SST behaviour is unchanged: atomic_post_disable() still calls
> display_disable() followed by display_unprepare() in the same
> order, and the cached dp->panel used inside unprepare is the same
> panel that was previously passed in.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
