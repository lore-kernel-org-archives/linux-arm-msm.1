Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC9315D5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984737; cv=none; b=ggG2ir/Ceknguph/fNViDHXrh7Uxu5Ra7f8aB5YvY5ETZ1jjLJq19yGkM/Yr4ysIdmDbi3iXTbLodZMx6JoHBRALn4idq+xppNrF4Ixj4IQpyFoVA0kvsVcL2nG9yBJZgsKYdd9LtECITWcdVjpnjY3BhhqExVzWe7KGZhTsyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984737; c=relaxed/simple;
	bh=zDaaCC/jLOIWcnflHQlHeEjB6WL5lOGO6nUa7LjxF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iS/DmGlVGg/U3sdqOoIp99t1dyWSAft4iO+GeN9pxOfnivUFpGE49+JFsEcS3gq6vOFvi14Qy5Dr8ABlGRIT/8nFCMxrQWXtf44nIQfY8+7dup8nxQxr4Qb8ugobAa9FRjzGgUt18jixqxLMtx6BcYbUxVR7OY7J9EP4UZk/jzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yh290ElD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0RI47mz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yh290ElD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0RI47mz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nf1Xb2710332
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 23:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YgTkQRn9Jl78hxcy8EjhxfN7
	hIYcFJc0FMzXtgfR1Ok=; b=Yh290ElDF1DpR2zJdaxME98AIGCHkl+uInh5Unad
	Wg3ed2JCCKBa4K+wRgy8+tAlMB0+S9XFExsGJqiM+PdhZmUeEMkWD0LeSrbm/GRt
	OA9ru21SavhVJOTkzLJeNFixju1+31I1s0rj5QLkRngjLDJWRdvjY0+V6FUYMGRT
	9XpBDrgCRoQSl75CaegdDQ9BspGdjXTMawqDY+bWHotSwIa9ol6vB1nIs2HP/BYu
	ae3Pp3yBatvjS2AgQMGaU4KDMbai889dSZtiZyvLMGl+sT2uENOgtmkFlHq4ZlID
	GCfWllYQdutKDU6R2Hg79+Grs/MPC/2Hx1/WotvxH6uvmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ec9a3r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 23:45:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so27870585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790984733; x=1791589533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=d0RI47mzxK3hkfGnCal4y31eHCMuS2NF/4KnU96xsWGgtvZb7xs90EjSXd/s3y0Q0/
         Y1ixyOliwnZ2DLjWcOTnhYd5cwuAUz3Y9F883Stodwa54G+jCigeL6J9ePPAvguTymWk
         ikW9etfXeCG33Ha27lPdZoOrOj2e4C5noyP4DTLw3IWG/6VeXvoWc30/GbSIxaIjzHKD
         K7lmjjl4ehgqSVckpJCghWFBPcU1n6bHvJ1vbYLHknvA7ebJCI3t0qGQX/vCBaYETLS/
         rbeMMrpsva2l96i9Fom2d7DrXn++3S/2lRyBTcvckSvbQ5VAv+Gd4mWyE+VRhAfAq578
         jsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790984733; x=1791589533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgTkQRn9Jl78hxcy8EjhxfN7hIYcFJc0FMzXtgfR1Ok=;
        b=sXhD/JWGy/VzNdkvcx3oE/qk5qo4/VgQdpp+Quy6jVnrLWKEJRc9BJXVwSAmTrzjEP
         0DNF41F2D9HVs3xBQ0TjRGtPhQe16TUesEgzGGKh4ztvYq8lOC9jzMN437PHRkFJt2a3
         hQbt3hMKs/Y0UCWASVTcd/i19RFwBLevOldYYYvP1VWRxm8H6fad6rR5CiYwPaYNIQNE
         2Ie8uImR3sKeAzgDaY5Db8U4xgzxuxr3bNGhGATa6ke/cM1cZgc6re/ojamzSQ2XIyaa
         cVPOoC8GhBC7Ou1xsrIxXYp5s5SQPLShQhzlyBMTIHXOBS/4KUS5ev97Y9+wmDX7rfpZ
         SJnw==
X-Forwarded-Encrypted: i=1; AKwUvBzB/E7vJy/MnmYcAxy8WGSattZrdnnti9zmJ2kWVbHzSkjO0j99obtd+nrQ4MSt4oi3CUGX/4HxKzCBNf0z@vger.kernel.org
X-Gm-Message-State: AFuF++k9Vq8u/bq2okMiwX9vMM/k1SrUwGDzl/B3M+0UtWfOF+Tgb0X9
	HM3aIMoTJXz0a39VeLwuGQsRU2GBR41iHsLj73z1+9k8kq/WzkXTNqdHEqu74/VxTh7XyL5Xx37
	IYK5Cv2D0pgS1621pViBJYkB7LWXvjlX8HJDW01UjiSePgT3Xsyii/6JsOJYAmixQn0jI
X-Gm-Gg: AYBFou2Zf5XEV0XjSQmSkjZrbcaC/pi8Z4dNV36dG2kNX6r/2vdIXEsvCQsXNBouoN4
	HEFPE862QfKuNL8Jsz458HNAyFdpSrcMfKoqg2DzRG3447EJGsr9RkvpdMnZwiHULcanhAfOsBX
	ViirEMhMxUsjgpGtacY3kYF2zfduqY7rsHQgdaWDXoXnuYBtbu9xeYin0vH0H+SU9YL6ZRkEsvZ
	EXdajIEOUHXROXKCx1YvCyZhUyPdf2T3a51S9VKMedVJDoCyX7cyfAFzRZeJdjfVjkeDfMnUQhy
	2fMJYjWJV276zYigLgDlU0d3lE4BNvire2LQW9MYJ1S4524E7YPphx6s0Ya+wrSW/jA1dMzd+MW
	VEQ41o1rW2IrHqMPHh9Dds6tXguqVm9FcPGWG5PDgsLkMGNxpxYIuIc8iJ+yRIXbFYzdFPZPBxW
	wQm63h4gnfhncF
X-Received: by 2002:a05:620a:a0db:10b0:93c:c6d0:1969 with SMTP id af79cd13be357-93cf170b7e1mr616287685a.15.1790984733343;
        Fri, 02 Oct 2026 16:45:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:10b0:93c:c6d0:1969 with SMTP id af79cd13be357-93cf170b7e1mr616283185a.15.1790984732607;
        Fri, 02 Oct 2026 16:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7959bcsm1119191e87.35.2026.10.02.16.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 16:45:31 -0700 (PDT)
Date: Sat, 3 Oct 2026 02:45:28 +0300
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
Message-ID: <vjjdhsbkjxomgzeirl4n6qyvyz3wu7xaoyie3vakada4r73hxj@gicg3pz2wjuz>
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
X-Proofpoint-GUID: wXUBUGms9g4uc5I0uQk7JS76ADsKvrQU
X-Authority-Analysis: v=2.4 cv=Ie8Symqa c=1 sm=1 tr=0 ts=6ac0421e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=m9j_GCGoi3mryc8sS7EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX/csb100egzm+
 PzxFbyZZFH8CAp1FyjnGmlNtB3jjpZ9Q6oL6DHcreQQcbK3RTS/h4vegT3NC0SLNjD0FJEgyYch
 u4+EYA0upQoS16GkHGftjJu1ixYGVYg=
X-Proofpoint-ORIG-GUID: wXUBUGms9g4uc5I0uQk7JS76ADsKvrQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NCBTYWx0ZWRfX340pvN2mxTIR
 D4rl2e2UrhkN9nxrnhNKCvtk95TMRH+LRqwMkNpaYfOw6O2Vlv951JCsN70viyXm2VaHIOg8gAg
 u8D9eXuCZOKOD6gRe/A6DiREYk6e5lwoUsdzzVTA3KAs759y+Xh+yrK/g+LfqhszbuRKiG7ZZJQ
 AWuCyFLfNEAFPh7S2viwrlI8HAup+SFJY/vIcIH7TZWL/5NESi6orMIMdS9lS7N2OkabX8k9Nws
 tfc7ppSac9IWBAtZy1gHtr9PJDeUKGC0U6S0M7pdEKQ5YDlMLYkE96r7y2tslubFyTmlubPY7CF
 VLqsPRDjAnTfo5I6YoUL0pxAxxr4utPph0MUbkbjEsUzouSzdpR3I76MG1gWPNrhJPw4hDpTN7l
 93culsICCEVEOgM4ULT9Oulb5D0Pbnfch/GrIJuCS8YZcxs7LBhHIfppi9KF/IbLte9Bfl5DqN7
 RqSuR7argnAaqX0qPzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020094

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
