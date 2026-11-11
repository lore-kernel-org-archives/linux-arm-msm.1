Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415874;
	b=fRlpuR4qqQSMfCggoVi9ecYX0kaXTzYKow3Ec+xLtt5lomSi5Ea17XwjzySUdX2xWOBL
	 /Qh5C6p0U3ShXDijSzQjlA5mjMA1EVT1VvGRfF8HiP/vl4zBE7kFNL0s+B64q1DPrlp1L
	 b3CKdJCuYDm+e0tPI+D2mrChG6YTEuo387AfT0Ybu6iEV8wU7Ni5xxizGl6fpdHSbQOU8
	 ekYaWVA/37X/LiI8sEbGAdYks4u2dO+v/bYXr7AR4kkdEEdtj4jE4f3TQdqRTUfbYO5gs
	 RGY/XW3Ep5AaBuzK8KU8chkbcKHxsrwvyQo4ot6d0eEXb6yWLSNbMRrieQzlEX5JZvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
	b=b5dMCAq5jUKgzBGW9Wrv9UjXacNwEiRmUzlTWmVbGeaasi+FIxDWj/CDRriKvYxPz32X
	 LFieRPYTcgp1PYBgIQTYR0wM/WAC4lkp7JhOnFImSqb9D1JIu4V5OR1j7S06zgvNOGKJH
	 d2iyQWZeIZwFHkFTTIi5KXzrU0L58kxg/gHGCtrWSdKPm+wpiOtx0wSwVZQhf+T1gTUM+
	 JB9QUtWI1u0JoSQpmcYqdmHshk51yiqw0YBMnCeb09rQQ2cCzM27ojtoa00tondhjfKrB
	 sSQQoYbHQRuury22Vvb8F2/dAZ7W3BhxzUbr1GA6Z3wLAz3jU5TqOjQM5T5tU1bKseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV8EPPlP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erI7PbBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06F606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B06F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV8EPPlP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erI7PbBv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Hm12651046
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wBAAd6ypHpzxF2jT/1bccNXb
	O5jGvqIht6KXoRaEevU=; b=PV8EPPlP8R/QMTcciijD/zUP18PFiVlwC2PX/1xK
	mK2XDM36iH6gCRs02RXJ3lGqQvXO3dG+90bDX9RTuy2jw3vDxkX/axOKDZZLgtvs
	MhrwT/WBJnBDGNJ4koKsYc1bsZqI07HYvkVx802EzJ/dntPT5/TVnFRdKD08C5jJ
	dqHrE3SL3Uk8zLb5JenoxGP8gV0qxQUsDLI1ak72okG4CjWmQSnrVp/dI8U2KVy2
	+6zEcPtoSUdAZzvza3iewWEafmj4HcKRLwbJzJQaAdeqY0yhWyH/hl54jADuF2D3
	VSDRd2Mqi8aFju0vS/VTlBW8BrmoCcV5/MWIgo0U7F30RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbrcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:51:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so652194585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415872; x=1795020672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
        b=erI7PbBvAqKFUCHDRqbrSK+dHLr5CnuVZRKWYpwClvoanMygWS22hpwtw00+6tbVAw
         91WzhH+UPem6S//putUJWRNXFutYbgpqsL4A1tS9Bs9yFl7f3k7vN5MVjCRkM0wtOYLo
         bTjsYehYb4ghaYHRJTKMEBt4BZ4A7PjDn76n7oZeDWj4O9Yd1wacNidGIbwXudCzOf9E
         n9HbevNrttqvG7CUkUjJqrOLN118/mIBS3nDhbn5uTJ54xtXVXBS4FcOhXH0wDXtchet
         8SUlLD9X2O3vkG2nVBpEfox52JfzRKfQZZXCodDoeeyuPL+R7W6O/TE4CRWkFlrCcfC4
         O5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415872; x=1795020672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBAAd6ypHpzxF2jT/1bccNXbO5jGvqIht6KXoRaEevU=;
        b=c6saakivaLdwm/LamhLSkcYymk8tv8HBCjU2twl1tPMC/Hq+6S48JO3K/Ynb9hMK+Z
         7als9mkaPe37WbOSmQT8tK9hH/4wNTcQnOoKLeASgG84TRI3HOKoVZrhMhO43UC9f+Pb
         2VKG9rvUWlamfBqpj+G9r6GFIKyTSA216+g5Ejr/HzTruBUw9+HEhYr7jJWhkIhjwtLv
         91x5CTakyCGinEa7jPJ/gJbJnhDbfawYhRBe2N1zvyvtp3n7NusbSLH4zkDDT+jVKOW/
         oAe58Y83U04wtA2x2fO08WJnOvC1OSzdjRaVtYVCMl1SWrpHaK2uehJFDXh+7+ND9qmd
         wI7A==
X-Forwarded-Encrypted: i=1; AL+hErGOkHKfDGN2mXeJwGxUHhSBu8axzzlyclkIGEkdB56DAKcG9Qjy3qBNfKTQBSO8yGx6iF5rtMIqF45yUrgX@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dmg7aG1SN3PrtNzRr897Dlbx2xyHPTTp6A5M2V28Nzam1EPzt
	5liw8ldticvMdOUcX6e6LEgrhGcdIlECz9leYuj7QuOxO2OkX+g09wVxpIMAz4/iJ5DkiOTxguO
	QwDVDVJ03tQugakGY6012/dGfKDnaFyPDnINRh9nyBBRMBS79rM+wKJy2ZCDZ5XyvQkrM
X-Gm-Gg: AYBFou3CKodq+X0488YVUmt3vSu49tEBYXI8MMuhFrp3qYn3kxRTRwt5SIJDSCluNz6
	VaBODd2GEh6E5Hlt2lKqtL70FDbJYa0NAduh4acO181KXwjzi4GAdesSXXf/NL/zpZ0C33oMp58
	TJbTCygQ92oGpN0yDfuU6ucdmD1ZHdk7bFebxM78T9UijkeaWBiyHr68bzXVzMc4iiVNWmZt4Ia
	Gdx0+oOauaNL7CroIlb8aqRbClzBQo5aOQJImZ6OBA35NRsCH3Ynh0xxwsT/VbZug078fKn+vpk
	yHKH94Q/hzsBKR2o2pJurgHORfOKAU5TFcBHShru9IRc5+Dy25u1z1UEipNXwP+dfRivR4fsTNT
	KIvZMVw/xTgAfAVZO6zc9KKW4IVlkuuUctsEzUbEVJ6ZOK+3mitxfGp2mcRatOV8JS1T2Gl3dxu
	rKdZ1qWZ4JM0zFCZH/jQ5AV4xYUN4kCWTr/XJnA2uIjEI75jPu9HSFNHHd6FY3gA==
X-Received: by 2002:a05:620a:6cc5:b0:93c:7e9c:3bba with SMTP id af79cd13be357-947aff8a94fmr488372985a.41.1794415872068;
        Wed, 11 Nov 2026 08:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:6cc5:b0:93c:7e9c:3bba with SMTP id af79cd13be357-947aff8a94fmr488367185a.41.1794415871533;
        Wed, 11 Nov 2026 08:51:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15ead140csm400318e87.22.2026.11.11.08.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:51:09 -0800 (PST)
Date: Wed, 11 Nov 2026 18:51:07 +0200
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
Subject: Re: [PATCH 1/4] drm/msm/dpu: keep SSPP priority order for split
 planes on DPU < 5.0
Message-ID: <f7rshy2tnugyeuvjuxje23qnx256x7rqed2sswt5ewfaqntz42@ajnsw2t4sor2>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-1-9d8bd29fd78a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-pipe_order-v1-1-9d8bd29fd78a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J4jgPcPCiAmO2eMa2KLAsTMeeweDwXvB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXwl/JNTREdWEI
 k8fdu+PmCfy/F001vz1QWWo0SMWe8osQL7Cl32KCP2WSIWxyXrdALXAY648cy/lDSEWmUP//eNw
 svDxPo6an0K9iayl6LbhMyjeR7KuTBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4SGyBGPYDzKn
 UD3cYs/8RIHwAqulgv/MVJ2s3U6gg6xiVH7gy9Gry5+Y/yUw4dB+xD6ZIKtipGsW51GvxHs/pYU
 3whPyKWMBc8k4Yo51LunwSqv8vGKK6CgVDIIacbMQVLsGQIHIEqpjt4vAUu1XLKv6Y4BWHmS5rq
 KsiTYtcQrXnRxGqOcTTLpIqyf5Nc2absYXXn6vgGi4ppnmWnfHfXzn4JCzXGBAVukHPgRZm1MP2
 eJaMExamhOUG7EQgXiil4/eQQ44w+mh4vosbIewgotMAbZxnupe2C1yFUHEXr4NYdJROPJg+/kD
 dsVK+keBupaBubulJUVEvf9dMxaA86rQKCx1O3zfEzfYDmOD6Ng7x0wdICEbKhNAdWZ4vQ7CUd2
 ZZH1hrgcEjijvh9islFs3M/vMZsc+esBDQ6uMUOdmf87FGtb2QX1wOAyp2G+2ivlJKID0+hgoAz
 r/o7r0bGRLxh3wouetQ==
X-Proofpoint-GUID: J4jgPcPCiAmO2eMa2KLAsTMeeweDwXvB
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af49d00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=vBrEaMr6vtUGFZbctIQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:21PM +0530, Mahadevan P wrote:
> Before DPU 5.0, the layer mixer places the higher priority SSPP on
> the left of a source-split pair. Priority follows the SSPP index
> (VIG, RGB, DMA), while allocation prefers DMA, RGB, then VIG.
> 
> Swap the two SSPPs when the right one has the lower index. Both are
> reserved with the same requirements. Same-SSPP parallel multirect
> already puts RECT_0, the higher priority rectangle, on the left.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
