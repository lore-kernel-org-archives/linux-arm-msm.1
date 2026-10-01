Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924A468C1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850295; cv=none; b=M0dCaVItV9rOnSfSNfq04L/LZeYX8M4D/8tgCnDXU1DD3HSr+6a0wbZONJHqtx+PFVVx3Y2EHmw6U0PxVgh5PPAAsupLPLYPVfAKiqUYWhlVhUl43028fj1/CUW57pqVc1Gz8kKBkFCeH93Jh6B+lO00ryJ1BTeezf7qCfidUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850295; c=relaxed/simple;
	bh=VpPq3Y2nnzG33vkEFy182/nULWUDDi1qYg3PnwdcFN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAs7pfyxjeu2CdDR8rjuqEbW9RpirkRalosHszVq7v6UQE3LIgc7eMPovWJSVgVVsorfl1sDpcleMa5rgVENEXY4YJpI9XCQ22IBN6QoEfi6zHryJTqx3FByB6zm61ixuNOhK7LlDjGSRx4phHsMYTjq53ahiIhQzfEk4An3pUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM236OVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWRl6o18; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM236OVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWRl6o18"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xdrv1933282
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aTRbIPT26KO7nuxbcekM6yYb
	y4TZGoFbtjjNV+dBytk=; b=DM236OVFbPuOoWtSklPM6DAj8f3VYstAB3tEKA+O
	Wjp5/uV6SoF11vqScQlDUMDepCGo/dEK2apK7bMs546CXAUUAbh3VV+APhE6aP02
	m+iuww5oWMqGVbZNeyWIrAo8ZSK70FLYqMQknJugIkbRMqRxfAYJRwGo53CFqb1N
	Y/Xn2W6o8pZhChgJMvDzZelWfJ+erZ9t/vZmODRHiJMQRvLg5tnZYKd5+UPM1naT
	bdm6TbKcLW7ZVeWvy2Ax0YF9Pjo+EC+Dudc1e79g8UrGI4I4vLfiyPnQRPhwbog/
	FbTu4NXqoNqrkszzHiN4uUvL00Mg1QyT1Lg46fRVX1TBCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfs0mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso156856785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850292; x=1791455092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTRbIPT26KO7nuxbcekM6yYby4TZGoFbtjjNV+dBytk=;
        b=gWRl6o18KHNWm0PTNjq4Cwe7dlFg5pT4uyhJMJjNpOPET3Q5e35/nzDcwy6JkULLy8
         ouBItDujLWeb7ZsBgvb8xEZK0WDhm603PDTVU2Ig50633HA7DZk9LoUa4lPEKs1TSClI
         za4SUngzN/Pfnyoe+eOjYYv6ASviLMmaCJ86TcOY3kZsLLhHQeycJ5cejuqq2zhObd7G
         03BimBk+LBrKcNQ4F8DRlMi0Z1ytzQuKjNkuQc0/Lj6XgUW0Ctq4cVWp0Wl1J8z0vKoF
         0q0dR8TmS6Y+FtURhaEQfDMUU87KPztPrBuva4eScjcOYEdqE4QfOTi/jBrUWipH0INk
         0yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850292; x=1791455092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTRbIPT26KO7nuxbcekM6yYby4TZGoFbtjjNV+dBytk=;
        b=dYI6ed9eP1F5Ymy7/YqlGoxZwM+RVXNS+tCHmn7dj0qWyAw25IPIFyJO9ILb7yDvFK
         3ELTQxbWZjOtf4dIzHPmahlOtXkiI+WQBtWAo8qTWrU+W4vK9DoYPy+tcyu7w0P48/5l
         lSDXkaLkJ7GOFKBFCEci5HTwBkBYLXifwCm/FI6p0vOUvAegJQVQZj/uniObq8dEAKDZ
         cphgZ5g/ZbidqXsxDxuKg4dl17Km6vyezCw/7MfevLxEpgX5cZNdlAf2B+wwlvFSYuh6
         Chp08FZSBe+WbHie7+G+VVcKD2yfcAR+efvMDmy+7ChM3m5Hug+gmQVmwd/7hUjYd3sU
         Kudw==
X-Forwarded-Encrypted: i=1; AKwUvBzd3FwMv7EFDAccvq8CN7W2WmIuJ2gpj9P4vXBVTfF4QotjL6m/o/+q+A6gMzP/49GA9gwhiS5pTh+YhEh6@vger.kernel.org
X-Gm-Message-State: AFuF++mrUfyIyjVqxFOt62dMm5B3n1pkQKpIAQ7oKZCZyoAyugLNNhRg
	See/HSsc9G33d6njL/ds8symplm5OKXwKY5GzFFGihVvFTEHDkoifxOh4CYKHPUrs48u0tlS2Wl
	IQ9Mdorw8rdjqIBqCKz/+01BjdM+hLBeMHPXsxTl5ZOoDFe716ACh+5IxRSnckv91q7eH
X-Gm-Gg: AYBFou0MpVegTv0xF5pijxdHKG2sKKBvHKg2oD0LpFVIBrDYelRNGqPfXqdAMND1fzi
	x9nZBR7EPRD8vht1MtE8fsg+WoKZNHldG9gDdh72PAcBz7x1lbF6lv0WFf7t/DpnW6vlZtS6aWg
	eTkJYj0d/bELwHXS2jdids4f3xRoBkRtOB88PgNDCbCxJ8KkZLyZZy+L7XCIJDrHx57AALWjgJN
	QxgxS8o1nvuC/a7x6VZ3FmocLAHf5kJb9GpZ/7BbTmWnihRE0JIWGbA5i09l//KY5U1p+uBj1xQ
	Tnk9bdDSdsYGvYwmahe5f2fBxv9mV28x0H8SlbZnTPFOnm9usjwRtcRMngEKsNGX6W7f/++R5Is
	8x9LOzg3JOQ22dF/2exjcHJQosraEq2deV7j59Tt1Hh88i9E4g+pFC9esun9sjIPIaM4XUgrhnP
	Cb/X7iVcawpjhj
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr429727885a.17.1790850292225;
        Thu, 01 Oct 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr429726085a.17.1790850291808;
        Thu, 01 Oct 2026 03:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f21bfsm14647511fa.18.2026.10.01.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:24:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:24:49 +0300
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
Subject: Re: [PATCH v7 05/35] drm/msm/dp: add support for programming
 p1/p2/p3 register blocks
Message-ID: <r7j2cphnlfyt4txpqaxg4lfe6bpf54bvevilywdycuhlzgep4s@ri33yjg6lf3s>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-5-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-5-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX0uGE05vZg91c
 TTTRXdFlNcD0ZEx45ylF5phnxL7bYgfasr7DPkD4VVQN8mpdTbJc8DkDwXrwzUH+QkRzoesjRrK
 pYYnEsc9MQ298EcBKoh47cPHYqu+c+A=
X-Proofpoint-GUID: DFdUYALAptij5bWcnk6Ba5VHzJDhyOtB
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe34f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=IwpLNRGHtxrvbpQtwQUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DFdUYALAptij5bWcnk6Ba5VHzJDhyOtB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXxMw6Mw7rtokl
 39jmvDgoXI41rb3Xf98oCc8e9vo1E9MqJ419ruC9YoVPyBFDVcRIeLVK2CckVOR4S0+JALCLSK0
 pEVa9wA/5ZPoYQWWxNNbKMiG0U8ZT83o80H+7dn94URbbveREkaJDGVuAW045nxL2m0yy3BfQLA
 tP332sAfr8yg4GRio2UQegL2/0s99N9BvOZrqAjVXB+pIEMm20Y8gkI8efzpVmW8u4rjpNhAuo5
 nAnrfX3WSO+JYrqe9U6zZ1j6i7LopSySA0rKFrH0c413tLlmOIc/L3Xh2qV7osS359gR8CV/qTk
 zK0gnUhY69oxiwBkk+P+6gwWNiXdptEZZ7CnFyegqzHW8G1Y9ttXQWgaCX9/Q85p4UW8SbuMrba
 YPNcOrTD3Y/d2JU14MONFSvAZH291tEoD5zH0wtA3NrbdvbzxVgtSmApAHux3InxzoyM3dQQdfS
 wwmCdyl0oXav2KTY10Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:29PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Each MST stream uses its own pixel register block. Extend pixel
> register access beyond p0 to support up to four streams.
> 
> Not all controllers provide all four blocks. Check for optional
> resources before mapping them to avoid misleading probe errors when
> they are absent, while propagating mapping failures for resources
> that are present.
> 
> Track each block's size separately so register snapshots use the
> size of the corresponding resource.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 90 ++++++++++++++++++-------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>  5 files changed, 103 insertions(+), 57 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
