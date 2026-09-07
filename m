Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478004078D3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766257; cv=none; b=rQl6eRnz4pptlDJEiJjF2iUU9QTPiGvtCBtl1T0xqhQ9Su1q8puCRhnarDwSGXrTUjYMhgTYVArJgcKtZPpNLYIQ39DtFVJWIINMx/Cp9VkHQ3GBLJq46t4l8k/ShNZ8c5oOTeqUFGw41MrNqQ+/2+ptXhokvC4ZmcwLv6YA6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766257; c=relaxed/simple;
	bh=fmE5ggUDz6vf5nfSaVA0pZtStGdf8hxBWtmcbAWgkQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0mXe844THv7bVc52e0OLuRUEKugfwxXzR61+gEA+t7c9CKs6fhk/dYsQHpEAopeVEuz1UJTgoxEVsCAJd9MRh2p4QJDqNXVOwqHp15Ny1Io5gL3Hb3cxyP3QmbYQ+GkmDNNjJGyjKRv5bYp0TQQRjwbKSyfwFimr/xF4Vu6+Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQKYpXh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxdHBVgY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQKYpXh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxdHBVgY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Zdm2668316
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLaUNshqrh7dT0Uzc85c+IqgRr+LZ636BwE3MsVsMks=; b=eQKYpXh6XYU9bkVA
	RAOzNKZz8Ln0WFhl/+MjM4HUzkcWpTKp7lvj3KSEB7UUOlp1s7udTNRxwqaK8PK+
	2wzSfMpQm4eXAZW0O/8q/UqR1vSLhCT0BVXZ4QKofQJApUp2O+V3g2Vx7eVfmlzE
	CIAcyj175gn9FvT+zGG83Hp5Dx3Hn2FOgaaxu2kithJrTxF1qVqZCbzNwZ+XSxVE
	12q2LMm2kJsF5T2KAcSj9wYoW+BBgmHzVBnfL+yEK4Pyc9Ow0hF9Wcw/igrIW0Ob
	YLPiPqPj3u88aoQSB0msvdqfWnT6Kirod1wr8CmPIVpFfzKI8BWyIxZ2ON6QWkvz
	FQeYIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5gtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:30:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9103db79014so10631376d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766254; x=1789371054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLaUNshqrh7dT0Uzc85c+IqgRr+LZ636BwE3MsVsMks=;
        b=jxdHBVgY1ReyVT9SZ9CVQVbv6ZDnxxgmRSQbs0SBDOeU4quaUKsxEZuwF930fx3ExZ
         pcpcYlhfc5Q/REBEdMXoLwaoQbu+eUI9+MHESLSKevfyC3iwv5yPKG+CAKt5q/RMzJfS
         UOULPpftdxijt4ePDOfAUZ/9srUSGR+N+Bcwo84fCL+Y7vagPQBrafhD4jMhUSNC3NsX
         Kf8TIaAk4TWsZvYeIhlVnx10EDKAHkWSUMkbEC3BvpvX218lSElqmXuJs3cy4AwONDof
         KRUqBvZkIRy7YCeBopG8832TGEIX55twmKtPWjvdPzNFuHYRQRUXhDbcP7sgCAfeAkSi
         143A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766254; x=1789371054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLaUNshqrh7dT0Uzc85c+IqgRr+LZ636BwE3MsVsMks=;
        b=tPiIEDIegCuX3xrV4XQm/1uRBIvChrnJOTInqofELMA4PAZQvhS33PrNSYrcgNS0m2
         8++cP9U073+2/jM0Seh2tSOltwe1OdE/pxiCNMkbdMsdwCCgZp+JUnGjfJ+BLi584OIq
         dJA4h+vUdYocwt+xm6L4yWi8G7He4NtfLIxWYzycEDoPk7mMfrPuccn1PgqGp3Xdf57K
         VKrPf6NWKW8RWF1YQmPauXf+aIFRFjSBMDX7NfpiuoKXnU2Ssg/fo8T6KmfDNtaZ1sZw
         3diGo/pTmfTfccCeUQ+6cI7Q+CmVWeaZEZs/2bcmSDZTLcVEQI3L23DLXG+jgV+mWlrs
         5LcA==
X-Forwarded-Encrypted: i=1; AKwUvByqUE3Ns088dcQcKlBC/gyBJSMOGUq5aNX7g1WlE9frBPxUd5CG4pZpWGIevDkMJPgkiLfTCrEP895G3278@vger.kernel.org
X-Gm-Message-State: AFuF++lbJVnYdy1kHdxMqid5wG5UocfTyi4vZwWYF5Rvxt7LyZGl4IOO
	gf2y5R9Q5cIVyIAZzRQU/T5ANMr24sDOGwqBXDuT8huw5MFe1ngh5wTiOPr9YA0yGccQZ4NusNj
	hNgx3K43MHqDR/sgbQv26mhLS3pL76ZJekkgfs16g9OfShbdRmsD6XYQPusWeu/aZyomA
X-Gm-Gg: AYBFou18J4kXxbq1nezc4F3r8hGCdgErluCdevnLaPLV2RmUw7UzG0UjAj6w34zJKW/
	51g0W7BFjgk3kJI/PABjj47P9Dka+ee9RkRd5MaFRZDWEpc7tGUdV6AJm/OZO9bC+mHgUVDGT7+
	kSPZsvgpXT4vn/+AXXCi0KrTQhvT1RdcfjPXC2PE+SXUGhVH+NcN6GYF3YwXORpgsuUEHftgA10
	S+UillxYl7gCnOuchHYDOxG2pe4LrJp9Lc0b8lTX4T7DM/W89eEFqj7JIKIFMQuVYdvGRsvGARo
	LduLS1KpIm/xg5zTsEKoH2jUcXFF+4n6wywF9TYtrV5xCt0hf6qOyr+TFRiPHgR3o43zIB+kDx0
	2cZA7kT1sLax4Fe7u4+lMXA==
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1067520885a.2.1788766254389;
        Mon, 07 Sep 2026 00:30:54 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:939:8148:1e3d with SMTP id af79cd13be357-939916fe312mr1067518485a.2.1788766253945;
        Mon, 07 Sep 2026 00:30:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm420254766b.26.2026.09.07.00.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:30:53 -0700 (PDT)
Message-ID: <66064071-c83b-4e6b-930f-9ade224e036f@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:30:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix the separate_gpu_kms parameter description
To: Karl Mehltretter <kmehltretter@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260906170347.2427-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906170347.2427-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mKWBxH1RZxp0mMPgSRMKj1Og2ZB1YjQH
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e682f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ebZoJKtv0rFVGLU1xKgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mKWBxH1RZxp0mMPgSRMKj1Og2ZB1YjQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX5e8gdFDR/R0V
 6b8dWw0KMlMyaz9BHO2x559uSfAQgYMMKPEUIvTa8psA87ocVwSd+Y1dNBvd8t42i/V0OkInl+H
 p46qISCohIcvAxYW0MLnSCE+tY9JkMlVBqJ0R2chfSIox8Tt9+uuaKtmlANrPKKRWrScLJL2Iv2
 FkEY70gbSmp9FzlJueMyTkR6hfXcKEiUs1qKnYRE4hr+1DjXduZW2YMeGrKwICUr3gMapnxaNjO
 Tsvgl4cbPQizLhwkIGR6bcdAkfEkINduB/NbWPXGsACDG4umDFLpIetNlMMgLp6hGXuBmupodEN
 GJPSsJHCOOp2yQtHEwUKqkGwNxFk41ArLQgR78LM/rQizNyyCBH+Ye1yeIz3bn6vShD9+T/9cem
 vldGsCB8L/D6ZzyCZPZIwTvL988mdyaX5L97tcPHQw44VElJMvaUDo7RifuTlxbgjt2KcyprYWe
 wJ0Vn2k70s70pNgzYVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX6Jbpf8aft8vT
 0YxoYlSexmAqzkZxBzAmTOsavFYdLhGQrYFx3ElugzUt85z+YpD1UPpqOH1tQDW6UXJEjPhqeKW
 CYqWM2aNAfJ4EQFVy3LM08vF6GeI72U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070079

On 9/6/26 7:03 PM, Karl Mehltretter wrote:
> The module parameter is separate_gpu_kms, but its MODULE_PARM_DESC()
> names separate_gpu_drm, so modinfo describes a parameter that does not
> exist and shows no description for the real one.
> 
> Use the parameter name in the description.
> 
> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
