Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2363B101C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794296; cv=none; b=htzu34axFDuo8AlUCJ/lbQcc3ZpzttXGCHD+LwbQZxctfkv78P6krzKRASHf73TIK0N9ugoHpOFApqvWop6n/cfbAhkCCRqP4TEyXQeygtbftRLA69X482eKg5XboEZGpDQ7OJYP63bXwQOjsXRbo88JxM7LbpcpQ33rfIsCjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794296; c=relaxed/simple;
	bh=LvR4i2pohFiB8qn1koGcdA89iLknx0Z6qOV5b3XmAqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViTkd5l9q6ZYYLr3PtsizQu6E6osyLQtab94x6E6LmXnmRhpEtIZlVPWhxtPBti5DLcHLZ5TXo3u0U2nkl52HWvdHdsOBWEKdRzfbaebo46Q3qVhw4piIK4bR4qRfm2Q0sgTZi0wXZrwClwi2/Xz5e2IhGbZDclZokuoX1/AiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InYaUdIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFmtmKs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InYaUdIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFmtmKs+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfCAf4014238
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=STICXhlmydY5ugMIn/MSZsMe
	t0adQStm/p3f87Ly+2E=; b=InYaUdILg3kHLwOu2C2SrlnKcrJZQhfPkm+Psw2E
	igUObzQrIIdGG1KyDU2F1F1/Ns54YvQuTVYguiRe/pdUqU0eVJ+bwgvt6mipUSRg
	icwgybb8mgMjbvIQAlVDpZ5EX5s6zl+6vm24yC3oL+0eWPXzfczAlpPq4YlVSecL
	O4qb2S80/JX/HSk0FWl1OleyahNwVi8lpTzIPQzv1mCi7G5KbU8TVTLRJFieyUSi
	ecXidL3dzHKURycfGAXN6CyFvXPul3jJLVbLJ3ukqzMmhQ86PkQC/sdABeUBEK9V
	vnzOs2QaxtsJ61AwnM6U3xDNDZ8Ch49/TPw7u5IXQO2MmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27k3bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:51:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cafdbdb7cso18424985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790794292; x=1791399092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STICXhlmydY5ugMIn/MSZsMet0adQStm/p3f87Ly+2E=;
        b=eFmtmKs+yRehmZP6RhY7t2AwFJ0iB724SDhAZELwajJfAVBrwyZ+L1DUjlFDXQmVeW
         U4QeKjsivD9xd2Y7XFM0Mdg7mz/ssc93maIUDxZvdOsVkh0bHnJmhk+y1KdGRlGQJRfI
         6zHxodYtFcN6wIaflCHBGsHn6I13aBuZnBEOo8jU3b63qyKCkqMluBn7CN8KIx2i1wQ1
         tMbE99Mltt1C4gjYxAJ03L6GfSay0DXnk9+VO9DlWTSLeglRcphl+5rsg/2QbKKO9XDI
         sFDMzaH7bb2dHM0J+MMoJuAWdO3Dpewatu3w4I9PoyX6LfmkqjbDjKnjjU6tX2VJZ2KD
         a9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794292; x=1791399092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STICXhlmydY5ugMIn/MSZsMet0adQStm/p3f87Ly+2E=;
        b=m5RdspwOb0x7e3L2zep8+Jf6GbFnDUv2Z7GkmrJ3TDa7zbjtg1A9Sp7HfJrOq23Xi7
         rFkNNznnG67WacgTAPf758R755fZdUriRI0iu047jRQgeS5echuCfM+vxN4Nt8iO4Sqe
         X2711rK1XHP1OZMSiA02dOjhIXJ3Xp5wzSv1jrIaoTVQ0F2SD3kpvJGZVslajbHCXtYV
         uU+iXhn6e1K+2OYT0uTEZ9/qRZX56q6NHENn0Z317vR3/voD30qlvXP33mU/S2Yz7pNt
         H7sZvN60caxJdho+kFJSqp+xEmSa61WTchYIq1UIng/Cw2d2nw68+Jns8FyQm1z8YGtN
         7Klw==
X-Forwarded-Encrypted: i=1; AKwUvBx956bgh2PThOONafcKiJrnVO3sMv4i+a/0Kpt3KzsYR2dP5Wv0zU3JBbYQtBnDa4Z+Grcq0AgON5+B0EEw@vger.kernel.org
X-Gm-Message-State: AFuF++lnFEYMKU7y6PZmydg2Z9w5w+WqU1zWXNd4mz/NJWDIBnjr4w3g
	ZCF1yuUHN0BCkP4zCf/dsrFCf0nbkWXFnM5j6sn4txUK3cVJen/S6j3XMSB37E4OgSusv3wWN3m
	tg6TIXhCOAHa9N4pl2TQkmNOQyHHV5sE2q3r6Uic1rYU9ARwV6Jiizxgc4iib14LV+gqG
X-Gm-Gg: AYBFou24mKq2f99yHyaleXqkPomcSQpXqf3HSQsOd2AzdlsLHlj0YCBXIilj1YQahns
	HmHna+usTXShlNWmeUUODOkfbJERpIVHnrXAEQj4UWpmH+aEuDdjukQLbMmWsxR0QYP5t5Jx40F
	j4QCvOQ6yfJ05e/ywg3PwKqx5sfPM2hI4pBD9x3Qv8gHQRJ1WtHX6MdoCfQy4OM33K1yCjNFaqa
	SmUEt3pDjDaQLllwLq7zMd3dKE0wICiUIHLRi7bdQ0JUtzy5LlppW101SMQ2HVV4Xw9zJBtGJL1
	KXRHSWa3GldxNGKthqM+a5Ix+QnBi7Ri7aG5ekDYrQosaaf5XkVMqfkiNXvubEWdFPWb4JVUSfY
	tK48QTVlL/JF368wi3q2dtHi8pcBMKlWC1VzZz8IYgHkZUzbeC5l/jpnoZFy4+T/yKSWlfdxss7
	Fp6fx2m63Jk/o6
X-Received: by 2002:a05:620a:6086:b0:939:af12:f5a0 with SMTP id af79cd13be357-93cb5b4b547mr103741785a.23.1790794291854;
        Wed, 30 Sep 2026 11:51:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:939:af12:f5a0 with SMTP id af79cd13be357-93cb5b4b547mr103736085a.23.1790794291254;
        Wed, 30 Sep 2026 11:51:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2702sm167395e87.34.2026.09.30.11.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:51:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 11/13] drm/msm/dp: Initialize the debugfs connector
 pointer
Message-ID: <f3pxrfm5gjrcu7j7y3f7l2vb7o5fjcy6qeb66ko7vcpqf6uccc@2svugdnka7dn>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-11-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-11-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfX7bwYL3+y2K0B
 dHfRTdRH5GbghYDgfJNatA+rqxI52EXqoGIDJMN9vSg1sBSoPYy1QjXHfowU1tpYhROrX8vY9bZ
 wYBQ3vdn1iYScbJX0HYq9K8eFfhoYEs=
X-Proofpoint-GUID: CmYCRcWeu8PqnQt0jIAWM5bhyhtmiFB2
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd5a34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=5ERa0XqK_cGZVxZ2II4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXxHforzhQ+ljL
 3wjnqDZL3q80cdrpia0n2F+oe20WTuIU2EpFd7BsrupvC8j1CWGVzD7xggXbYoZWhCq6LBRwV8f
 Pc3jyxBqocLuOwOK9Em9/X5H+JvC31Bi0Y3g1ZlScxchcjlgcVzGFLTyHv3NQP6m1JPpWznylRz
 ZleHZEJdUdvWnijnhfIkTUPVTL9axGckYpDaTq9uZSOJhy+DkgDEYET3hfY0c7aVegWy/dbH3GD
 rIM3/Sc176QaHATuBHg8E33wW3D+029unWSkfXFBAhN7FXgGBO6dN41jYnMJnpvLLZqNSAZOH0z
 h+t8jk40EFBVBdVbuERzJy6HJfS72aKgXLWlc20yRBDxl/HYzqp7sk5VI76QyhoaB3CW3HrQIv2
 9z1EBwJtzUiOSsYhZaANgrElugXyYfBesnBmCmmDYBEB2/6RKXsIGIlgUUVxvrXon33PbOTaS30
 WYScU96BXVsN/STHoJw==
X-Proofpoint-ORIG-GUID: CmYCRcWeu8PqnQt0jIAWM5bhyhtmiFB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300077

On Wed, Sep 30, 2026 at 08:41:55PM +0800, Xilin Wu wrote:
> The debugfs cleanup removed the connector assignment from the debug
> context, but the video-pattern test files still dereference that pointer
> to check connector status. Reading those files can therefore dereference
> NULL.
> 
> Store the supplied connector before creating the debugfs files.
> 
> Fixes: ab8420418c2e ("drm/msm/dp: cleanup debugfs handling")
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Please don't add empty lines between the tags. With the commit message
fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
