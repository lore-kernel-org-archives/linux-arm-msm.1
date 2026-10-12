Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A0471CE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808291; cv=none; b=u01PhE/pvEmqTDGkHvc3A6y+bCDT3bDzTuj1Evjc1Wu9Q5CkoMyolHmfHK2GdXhwjMplrP3WvhpaHhmJxnmlrGWroYLIgAC3TyVZfvOmtVF9NtS3AvCWek1snyWPk5FiZn7QWYq5hekdxaJBIauS9lOOOHWZ+pIp1bEVZYAn++w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808291; c=relaxed/simple;
	bh=friZCIjXMB43ZyatZaeWUOlL+WSIXupxwiAaNbwCThQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXphoj1DlYf+t5zsANfpXIMI4nWeECDYqPqbL1cK7DJvnUgnwl31aI8hZJvroOPYuuUW3YN0QLGsF5r3wnnmia+5VM/Rx5ivhOX0jJwgHC2hCrhQAj8AI0J7kE76BI+m0uFEV+KMTv3omm5Xj8wKhxKr/fuGCCY22/5uY/rTneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLDoTwHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P06vUVeh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLDoTwHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P06vUVeh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Fnf1236317
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h7qMwlSgAt+t7GkDL5quXlg8
	W4SQwFrSXsclHqg7y/4=; b=QLDoTwHGFUkmsvvtd5WYfnu9Q4F49LCyK2yvu+2i
	dGgqwc9qOdFzTCyJTYI9s2x6RwIT/tjtX1JLXVx/c9Xx1evMRgynYJnEDHzSpNqj
	sr6RaxknnrkX4aEvdeM9AC/Ac7Uq6tH4Gq4npUeycVVEtEZWL39CwcAZ3+s8HWxq
	TXPJ5IEXYem699CjJRUNc2ShJn76eiFX1cYcwRkkek8KnH/69nhf6505xMGcgojo
	qIEyzMnJ+PUP9vSW4kP4NtSWj2kOqC8gbXduOEudmDlRnl1ZWuRXy5PKJeOvGE2n
	C+/do2BFt0lpXjmCqcJr1fcJXj72gPnB8PzO96+89JZBtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djxws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:31:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso191700085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808289; x=1792413089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7qMwlSgAt+t7GkDL5quXlg8W4SQwFrSXsclHqg7y/4=;
        b=P06vUVehwN8reXTtudJK+zgJa9f/wKJab2Xi7ygsdP2xGlcq5/oKrhHxIQuF0z9Eeg
         NC/1eZtcpusxMYCtNz5UqJiNpeKifSFnPqdpk0xntvStCaj0se5dWABUdCK2im4lRTvF
         +JSD6Zj8pJljo7r50Q/tew0/NwwKcZ6W1I7sTZuDoC0zs8wfX4qOgusAGvRERjNYE10R
         R1me9jVTiDE02zHiJ0jLm/RbCK72BuDEYBBM4nOh0d4NvyC9l+FT34xeD8KtQOAWql0W
         nMJvEbcKaFGuvVP3lYk1CZKQtQKs0TGXiTMq6WpBlAB2Z/TEkLESKgf1FanQsjQujpAA
         1IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808289; x=1792413089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7qMwlSgAt+t7GkDL5quXlg8W4SQwFrSXsclHqg7y/4=;
        b=E+Q7Tg/m6TGLhqCmWSaEhl0xCmA39fYSLYD2W5bWNVV0Fjng6OaufppjDy8tfBJA7V
         HE9zM6GhyKxASeyGkEJAvR8bZJMWr91LqcT2Bworb+/vXdXxf2RxFaJMq+VlcS+kvEQC
         nDKjiwdoH8lUt35CWFmMu2lS3ew1LZ9z2qU3z59ZZVQLYEf6/cm45Rry7Ok7iAHEYr5D
         Lp7KBjyOxpVcvip1/I8h5YOCPK/fsGud1/M18rnlkFimrqDoyywoSLQFzPj0kbzoY5AI
         v6+ZTGSecKS0X2bpIOstcRzEOn1EkD3DccQgFCcmeGPZb8Tg5WmeBH3jVBWQaA3e8FIO
         AD7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9E4FVN0lyorc6t960YvR3qH8Qnqqkq45NZIOP2DLOIVsJhiqXdgMTDm+7OdBDpvu3Mr4NzIInld7BVPn/@vger.kernel.org
X-Gm-Message-State: AFq9FYIys2WDNkGQRr+xKUPWW6jwOjv8mdIHMurQF6tjaClN9RXuqRIQ
	XxEESoDPyi3SyhLcDGFRLwMKVVQp4S0G4vVMEYFD0tcI8eNSdEJsH5bZVfpRNpszqBkpzPnTWJr
	IlREjjfAo46RbRVX/4iTHWcvOCaEYlvtF9ahJqZ60QoIWZ8QzAUuA7U9OYGONbIftiiiI
X-Gm-Gg: AYBFou0zzf38p62ypI8XoHczU0hzXmtmq2gn28Mt3kCY2GrdhM1glCK1BkCSOmiXjfL
	4Gab/PE1TyAR3dkoAbRZSWeBP66OGrl1pnzVjjM8Imi5t5ffKl5W609u3I4dA4ED6XpWhMW0qMZ
	ij/OrrOz/RDzr80Y8c5cvTZPXa8uWvLKC+i11fDEhOwCQTJMlUKfyZJ41VdmrkBjmsPyrkZxV4W
	uIaJMnVBHMjOU7gRNhU7DwRy3tn+3fi1+hmCmRed6bPERG0H6Nidmn4YbqSlFo0WIFt4u7fLIb7
	5jJexZruPzpaHmr0CACdo2Q41/IB21uLtqYiONrOiXAj1qq9VNGSvtJ7Al6VRdxxYb0nXZlpeJ3
	8ueo3mPlmr8lUEFlyzAvHsxPUPUzi4yS7UbJQNMHciTq0nNNOCeWRp6cOq57Q90vd4/PZUGCVZG
	R2cTaftgiuNDTW
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr986749885a.82.1791808286987;
        Mon, 12 Oct 2026 05:31:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr986745585a.82.1791808286386;
        Mon, 12 Oct 2026 05:31:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cdd958sm28225451fa.35.2026.10.12.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:31:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:31:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
Message-ID: <a74ijgv3bfpgd5gqokwlyf72wxgzsc3642obj53m2jjpxg3g6b@loenpurcl62h>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX54P8Ffdoafte
 wCmLZ621BSWpjtMeey1hm5qUySLCB40UObmSTwNQlUJhdkKyWbFqolhOYIecjc7eRluE7fLxA6C
 CKh4FNdtyQGzMMquFDdxDl1D6kx6LhWSArrjQePls6HMbwy2Uf5lT1wMrrknu3XTnIBJh/y+phq
 dUofRtnf3D0xeX5wSGnpFvIYO9wa8tEM2Cg/GwiL/DBq65kv203BZ6lqR97U/EMfhvjFNNMkKhT
 PnUOS0VYHs7n8Cft1QUPnpMlCPlZPKBBQ6Yhhp6qNI/63N39g0Ofdjw86PENZi55txK0u1npkfH
 tWpZNV/V7r+4U2pvTpJ9p1g5CdgH/I0UUFI/XxhrU22zRV+/aayUb4rjtEoKHZwe1xvo1tTOdQn
 Bl1B5INJm9k/rZoNrdScjBQQsUdXzoKIpaSEF9TZCDqzCBQ76aDWsXxjwbws5mABavn0R6t5QDt
 ZeB0ab62Y8xf9J2vH5g==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accd321 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ysDuX-smLMpIrN7MedEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gtrKbgG9qH1ohlfd-rBJ2d9xTfDdl03z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX3I6POC53CFoq
 lJO7aAj8ll1vreZq7NqgUPqXmVfyGDLkZoh9YVK5PKkCGc++jtOcRJyLISzih2W+yCTD1kVUmpp
 HPmaMdv3zmiIGfy58SldehPYec0J8is=
X-Proofpoint-ORIG-GUID: gtrKbgG9qH1ohlfd-rBJ2d9xTfDdl03z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Sat, Oct 10, 2026 at 08:41:20AM -0700, Rob Clark wrote:
> This way we can start including generated tables for a8xx GPU snapshot
> in the device table (without having conflicts with earlier gens if we
> eventually try to retrofit this approach, or later gens in the future).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |    2 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2310 ---------------------
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  502 +++++
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1846 ++++++++++++++++
>  4 files changed, 2350 insertions(+), 2310 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
