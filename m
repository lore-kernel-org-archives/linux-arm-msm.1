Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408447;
	b=v7ewewaJmJYmp/yT2ZPqxYmNTe742ZjBsOdNsl5L+++G21ywwGKZzgd1PqzC4kwxkzIA
	 Z4ozZpWxNQPASuY0zbbOIEHY3L3fFxj98z5fkh60lIIHNoBicHUu1rBLAKm1RPrcQ0GS4
	 mkbHMk8ijP1g5bd57WFkjwIwq0X7kdGccsfSYtxy3jVpjKnnoTvrXLJTxusyhnr+brTL7
	 xAuDYseMc2qc3CGiqula1FAWsSC77IF763n253ukk1hAtMcd992zhSLbPXzB6cImcCrxh
	 nWlTjF5tFakV4/t0EI6+LUajyJnEcfQ42de2Y1ufCHvbetIhAvHaSGBs8Zq3BGDFgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408447;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
	b=TdgwaDfDMeytLh8wU2f0jmMEli/endPVfWMNIbGh0G+qWUvwYsoCKTdXbN3SKweWghgi
	 RFFTecUnyljaBkINKmqMUwyPpn4VKoZLjXpEs66aEU/nvzw5qgHKEFyDQBeHhLaU5LIbc
	 66vEtviIkwBnx8imPc/bHNxIAnSgWtEdQLx3fDIH5BUhj2mgtObahUv1ia9ghjhhDXjUS
	 8E/TQ0QO9y80amVSsWgf7jyftQ3SnSjbCe5IxURUakX8b5EAW2T6ICMssKRsAAN9IQHNz
	 0iZwEZhzNch9hLfh2WPs8d6b8dBlVFFiDWqv4ABJ8D2WlZ+Ey3tiQiG0o1LdTsAVw8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRPttJRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ODvN/e7J";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879B606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8879B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRPttJRC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODvN/e7J
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHcco2501530
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSsjgnuER/pCSv8uH7FR/ZRv
	/e/DAvEndVD96ZB9E8Q=; b=PRPttJRCEn04/y6wsNdOgtk379xKjoNFOzGcHCWu
	qvC4QI4zmwRW9km2D2563TeifbHJFBTgZwtFB90qH2noORntULrUP2OV1Z7nexRK
	VzRqE92rVXID22WBaCnPP9HN3vD7j3+42wG1zeddxWQpCnpxIWdQ8Ze+zVjqAfnj
	z23TfpqJHcwq2U7eJcuWviKuQJ43z1EyYHjA9BFQq68qorzvna2G3LcOVPLuni0A
	zw7MG10/IvhL3H/JQHDpR3X9cGjeS6Oy0IivL9S3hd1+AoQe1PQRhbkygr37Mg23
	HXons1f6wVOrII1RWbq1XMLO2ccuKw6ncElv4FfsIfTmLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9n8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:47:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91256a7b7b3so51959236d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408445; x=1795013245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
        b=ODvN/e7JU8qlcgvbroLe6JyKqGlbacRSKTSVZwK2aAwHYKd+2cj8tZDCd9TCYYGAVI
         gWjybmqz5EtrLc9rYT9rRvOz+1Gtc4eaSC+5MJwWI0suCT56X6yWkXE5anpOpIbQVP4G
         pRmhwh4VBAt+StLKv1lpCpNkwjeX/NHBDJAaTry/BVGjg2fPdqAmajKKnylNBZH/qqUS
         Zh7TzlBc2mBnBKj1FSE+NJy1H+H7NZeoEJE0OrrRbOnRn2/5O9HoiLpfEAyvPW6wDG3O
         /PtRHgOs6eGFJ/ZlZm94e9voVwP/tDXYzjTQB1jy2wyiTiN66pA0JCApjAFfLM95lJos
         P3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408445; x=1795013245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSsjgnuER/pCSv8uH7FR/ZRv/e/DAvEndVD96ZB9E8Q=;
        b=uO8ldQVUt1OyiplSkPWIDzBfPHlYIo/etIdDUd5DTfldu0UPJ+ygZx27yLFzbF5378
         wk7OWwM2SwKjaqd0Y8bSc1k0fvVd20nGV2oCGbUaqMnRWKyEL9ad5l0Crt6rnMcPv0EB
         gWUKoNYSAlFc/PoEzZkJd6Q4JtsprDqFWI+VN4bCcFg2GYM5KDv5bjaMiLDocq2PIaRA
         aRf55Xs9jUO6rf91vZNEIDliZIjgyINi2vp3hHPcwPmNcjq7/4uMga8NHWFx0ZP5veOx
         9X3kvi3nukOhmIc0TonE/3Oh2NilMLn5Q5ddSAA6xgzm9jdsb8KJS7ikkJnLfCIjmebv
         0OPA==
X-Forwarded-Encrypted: i=1; AL+hErG8ZX3ps3imd41YFpOateOphXdtjwYaWyOpUWPK585FvspC/ogpmNk4L9cgFZ3ajXwgt0WGT7S1xCCUa2QD@vger.kernel.org
X-Gm-Message-State: APuU4Z/mdQO1cec3VbfvrM9lBu5P78EK9fa7ZLSujKuFb/eg/9TROlgJ
	0M8/BcOxUWCka9SZNC6s/7IbWNtBaMC8gLoTtF9M7PoSpb1tCdOx10e76id0ffDF1q+fnaydO09
	XrI/4OOsw+CQAcN7ytDA6RbrxFssmDw+HvLpx+na8GRXFS2ng+1kZnMVV9unf2oNc1hH5
X-Gm-Gg: AYBFou2EePYCiF6W1XTY/2qt8wYs66w9CfPHfRN0l1Ay/sl8HE/Ud5CH8eqzvlM2gSl
	oTcM7YyNY9xYDnuJkPBllwrE3DjzBDJc5RRXFOqcilo9MguxeK+ug2CgqdPC+NvUUONhmQb/l4w
	thivDPjKHYngLn3kDE6CI2ruODgnBYHg4QqYolan7t5wsSlXJVF0t3GkMz1vydCxvrwK/66Hde5
	p+DTdXZ5jOL9tuoPZllqlPcbvIlFr6sN1CDokpsTklrFr/6miFgp3KC2p84bffH4WX5QPG/NE/k
	I6t0CSuNUS4AotZyFAJPrpenl+DJrc77NweJKB+ewfVTWU4hu8ZM2f0d+32x5/YdhZAs0HBqKoO
	jxz3SXOh7chIZG4Ke5tje3prwHILOC93EkG0CtLC1h43jsXEOfjlrmaDN9Bi4j5tgIHrFKU711Y
	d1vudm6aa8JnBTI8cAmiwuOyC+QYtAhR5GBBad+YnNKEIvCp4ieRJFjehYAaO3Ng==
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr403777985a.82.1794408444512;
        Wed, 11 Nov 2026 06:47:24 -0800 (PST)
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr403768885a.82.1794408443781;
        Wed, 11 Nov 2026 06:47:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae177150c8sm3338901fa.40.2026.11.11.06.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:47:22 -0800 (PST)
Date: Wed, 11 Nov 2026 16:47:21 +0200
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
Subject: Re: [PATCH v8 07/29] drm/msm/dp: add support for MST channel slot
 allocation
Message-ID: <ycikeeqchpswkdw5aeygyyot3c67dso5vn66mhxlexcstnrnou@a2vg44y4rrfm>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-7-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-7-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-GUID: 6gj9PiwlWVcxQNzGoz0a2iyAKUFahTId
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX8Nf/grJqhhHo
 TyMRsQJ6xnzItoDYu04L2CNAEWrsf7imWXEfIggbBFy6g8yVe4PJdI+gdH8AZDxDUp8UMRikGP8
 gc1Plgfr0TyHZYNprpnIbbxwhKVaLi0hqFsdR2CFat5uwEqElnrMepgiqomaRlNCFrmKCD61T7j
 lEb6t4jWMJdQAKlgOBypzBIp1Ld2k7EpIapOO+++wZabGo5iEU3cT5hoQNRALLzqaq8DA7BecQy
 keYyRCu+2HFrbVqsgjy1Dyve2YBS1vPKoKyVTaUr9FIcenxN/A6yHj5gz030y2iZuHRK9rLIA3c
 3c2/4in5HI7aBfwVhjcd/Bj00mok48tG1XsbunMjKfH13R96Y9jPZDWxL1G4HjLApNIiBvipHXK
 bLPe1Y2mJRAwYNonfWgCaitxMTE2doCv6TgB/mAZMaG64nrMjxTTdCAfRJTN1pxHL0/txU9XJ/K
 ur8DrABZaUcF/vZOTvw==
X-Proofpoint-ORIG-GUID: 6gj9PiwlWVcxQNzGoz0a2iyAKUFahTId
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af47ffd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pILL0qaYOBIALHQ4VfQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX4DgB/3eyXCfW
 y1B8cVWAHznQYbbVwS9FCd950w5AhShuNUiVTmZQFIKuhtirBnUomaJ2pCUe4XHZt0SizbPefO0
 DOtgE3lxczYgw8OZ8dqgqyxJlyMpwuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:28PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> The per-stream slot allocation is not tracked by the driver. Callers
> pass in a msm_dp_mst_slot_info table derived from
> drm_dp_mst_topology_state::payloads, which the MST helpers keep up to
> date, and the controller only translates it into the per-stream
> timeslot registers and the rate governor inputs.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 147 +++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |   9 ++-
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   6 ++
>  4 files changed, 161 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 8a2396aec6d5e..0b34db3bd5d22 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -83,6 +83,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64

Doesn't seem to be used.

>  
>  enum {
>  	DP_TRAINING_NONE,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
