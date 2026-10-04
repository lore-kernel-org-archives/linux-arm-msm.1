Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953C3E168F
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084024; cv=none; b=Ld6wJ7lwetEF/VK+FVS1t3JAHi7L3zca+hCbLwj3IOCmwrI04Fi3IjEjw0ssQ7//1DD+a1K2wfJWzho4WGoXi6Reyg1z8SmsiE5iu0h0mSf2I/RPrJs+bRPKmhsHQeyxRLcT741gtp1funUdxk/LMVVfVgDPvLb0FiI/77P/Qb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084024; c=relaxed/simple;
	bh=8EeAdMpmWyyGuGS8Wc9n/f9E1wn/7pXUTMydz6a18sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6J00fLGXuqnbPQ6v+1R1NwAGFcB6bGF68C4aIyaz99M8752uJWmEktqDcTvCdgCnrbsY1HiO39ehJgf1qwG9pZhGn9/e9AZepzU2kMzpxUu8sytS6BwnL2fus20sPKe5Ht0tRJKIK5+Vx4gvbIjh9StmcUnKYzrkNXKBTE36WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUYyJhVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4Ika29N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUYyJhVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4Ika29N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693KpiRM1289868
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Oct 2026 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wwzwV9aFuwIXK56SSztcZ1Mu
	EY+VheNe9eTYzrH0MpQ=; b=AUYyJhVi+zBGfbhtUZtKDbKxAJk2XJcl30M1e7vk
	ZcCVey6kO1eadZJzm4dMsMy1mAo6yeu7akHwJNJpjVniKhXvvrHAUBHupzDFLFAG
	2hWtZ79MYBNXPfnow626hmBj7yLiq52IOT4f4ZheB/NHkvPCucu86d4bjA23MFye
	V5D1Do4DlY2aSVNtN5DDUIqUW0BCjQv0CVofNxkf4Lc6jRC8hW1VbwI6shsSyggi
	B32SKd6KicxXUbFqd9ZXdpkUIdmTOnQiZTxdj+o1DiTs0Wen0rs7M0NdvxWWapJg
	Uoc8aKd8ldxWw24816MghA3qBQgcvb4Viufm450hOcJZTg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssuaa4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 03:20:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c93c294214so227192e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791084021; x=1791688821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wwzwV9aFuwIXK56SSztcZ1MuEY+VheNe9eTYzrH0MpQ=;
        b=j4Ika29NoMwvtK8eQPMfNtKK9nTn8rkNNqe8k0NhrCnncU5y5ge7tJKTPNL7E6uLZW
         rNtPim/qJ7xXJnxMEUva9ynHYOqwsL+6erlCEucurusdR/CN8xBMfgjkXYlcHhQ3khqj
         88BZG9/vnm14j4VwKzbgA4Xhet+CSoJUZha6Ldxjwsu/Yd1MQywEUBUYZkOqRxMmhLPq
         LBfJ3IyoCHDFyHSzMkHiOxMb6BQLu2g1q5Kg3U156WaJ8+rRwJySc2LKozLAFnFDXmzz
         dJJJin9HBAc1I84ZwulRHMYolBo676ucXdFj99Cd0wMuXbHU7y3C6OuTYcnuDDYHcXpT
         lM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791084021; x=1791688821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwzwV9aFuwIXK56SSztcZ1MuEY+VheNe9eTYzrH0MpQ=;
        b=jcoqo2JSPB+Td90txg/b/+9QZUbjwC05ZAYEQUq4W45IeTbIrBMH+sI7I6dLSy5ksG
         ld31AOeKn2ZZwhAkOlbdumpIgkuz/Ncd0nZ60ZZwSaItHz6zvGVTN/twXmfKhN7LijV6
         V8XKji/znfKG2bWNbbrAtRK0gNLutgS9gitgUpA9WoIhilNxvPXM0fnz/kxwyony55hK
         CBGUJ3ps3/mHAYyE8JTj2qwEKDVpqonNjha9sX/s/bbCiCNuH5FpwYpcMP0KWWO8z7Kl
         YfQAyq7EmUVaDg8KJ0usLpqSUmvmmx1u7U/yCOGbWeFD51wkenJ6B4qDIYhKQQ4q0Hne
         +lPw==
X-Forwarded-Encrypted: i=1; AKwUvBz0KAmdk2WZlUQkXaKFfnNKBQ5PYxq4t4XxZGLLaLmsC7Pmywn5kSQ4OoNHT0QQ1PXiaT6rANMxS7sGbN//@vger.kernel.org
X-Gm-Message-State: AFq9FYJkGdVbIw+b890dXpRzDKFDHFvtVLpXpOZWsgnLkuZ/QF4bHxnT
	IbFzwYVtjfgKhZDGmWAB8ONRBqFwTXzvtzvCkycRMahsXyNPEsqJAhmO+gSVdV4k3G+ZFVY24eE
	xVxO8DCv2gj7yqkaqFNUNXO/XFIcLCH2ca85X1Pn9x05GSwBBWqt/qzbG2x9xMLWCVUmS
X-Gm-Gg: AYBFou3uHVT56JUlzqrgdvbCPWvzLtNNEIgc4HsrLPnUOkkk5VjYhhbYxTU10NWjVDM
	9q1TozSsPGFWCyEK8gNRRe7BoosAX3KAK5ibroDwWmeICelY9U9pho2SDAQSQ7tOX3lPQ60vjN+
	b2ydFNo3VfEczSf9s3MSMMJlDQF82CAsYrCUeufVBYitOf3CRootFp2Nxkd7McOwi80I8Hbzg1M
	CTPOXRzqafb7s72+avrOJPvDgz+mjBqJX0LAo6w7BPTA0jzLrAmKFYriQze5WBEyyRpk5hdXWIU
	XjjGeSGJxkfpZrwm2lbTdOXrGxDdo4/EQA5pjqf4uzL4/8asDiAeITi1d8Pzlg5qKIRkwZ93o+x
	UuEuyBsPXPxO6dPr5gXeaDUpJ3aGl+knlv7RdIZ8RdfPqbBmxdhrzfLd29jrK+kEDU6FNNVgHCA
	6Xuv8gDhLF+ESR
X-Received: by 2002:a05:6102:4190:b0:7c3:5218:1dee with SMTP id ada2fe7eead31-7c352182ba3mr401425137.19.1791084021169;
        Sat, 03 Oct 2026 20:20:21 -0700 (PDT)
X-Received: by 2002:a05:6102:4190:b0:7c3:5218:1dee with SMTP id ada2fe7eead31-7c352182ba3mr401415137.19.1791084020708;
        Sat, 03 Oct 2026 20:20:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7e43sm26563241fa.11.2026.10.03.20.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:20:19 -0700 (PDT)
Date: Sun, 4 Oct 2026 06:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync registers from mesa
Message-ID: <pxzdepjxrwdpboj2bktlbpslj4r7zabnccifnaae7hmteoga7i@dvpsliuxzvok>
References: <20261003223723.400020-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003223723.400020-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX/gDcTQkdsFax
 eqii96TrhpLsNqH2xqTlLJX0MJ4zitRFpBl2zbGuVOaLnqSCOp8z+cnc9/2mZacpCp+HoCdeqRZ
 FUPImeAUg8K822gQYXJgZFW2yyzgwwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDAxMiBTYWx0ZWRfX3BQScSLZh3ze
 tfPbVed8HiYPDUEQez7RenL4M/poup2u0srcbg+7uJ0Z3dw2xc8g2GN6P9cn/xqE0xKgO+7nS8q
 Sr8uQk/WMOV6dSa2+zmbyCtVw4RAttgEhLyiqVbIpdn9Ol1MChhVRuOLg2IKYcjtNB7OqjTZvDC
 W7hmd3GV3VyP0F/sH+KWX5vRYVZKA9AI3JE/L5pqdtkNG5I0JzWEnBkn7cfj/Ikg0IYfnurwGnq
 TpCeHZVkQr2zNDKavwe6zD9t3lBxBG44MRg2pHFzJW2BZdTnF+96LX8DiUy+fh11eL46s5v4x8B
 RrpGt5E5GvmnKbbMADPybQmsBl359NJ/17yQzdlsiS9f6/agtaz0UR/DoWeJpyC1X/PbiWpP3n3
 gqLIVSF/5HLV/dF7LmnLEfimKVS9+DqobeoNu9y5nf9629lLqyaI5W3jM90HyBA+Fwdt52f/eOV
 bEbal82zcoJn0H/a+Hg==
X-Proofpoint-GUID: 2K6Y85sE3D2EOT8A0RiueveVr9kPl2TH
X-Proofpoint-ORIG-GUID: 2K6Y85sE3D2EOT8A0RiueveVr9kPl2TH
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac1c5f5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040012

On Sat, Oct 03, 2026 at 03:37:22PM -0700, Rob Clark wrote:
> Sync changes from mesa commit 81fae85847d2 ("freedreno/registers: Sync
> xml changes back from kernel").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  2 +-
>  drivers/gpu/drm/msm/registers/adreno/a2xx.xml | 25 +++---
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml | 17 ++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 81 +++++++++++++------
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 41 ++++++----
>  5 files changed, 116 insertions(+), 50 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
