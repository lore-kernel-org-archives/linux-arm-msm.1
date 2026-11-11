Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408551;
	b=kVjPA4EnDGk2JmpQTEb3/IhCTpX3SNxnKSvAP8UFulZSx+/bcC+EcETp1mqgbLGE62hb
	 X93Esexmtcp/4mWGxFlsm5oMnsZjtp9CU3D6L0jYXtnvmxWhsUxGC79leAE4wmZzUC5m0
	 0sWu45vqdhMCIrMKRH4KizkxaAREal3xgdfrApFd0q7zfcNJ6K21Y+eQUKtERbZdusJ07
	 +GO2zpJ0uQ/1CvIfSxf8wt3iQx8w2fED4212LktUhJpaJFAGyKgE1v+IPa0J8jf3wNe5S
	 EU8aZ0uulHhH0lfETivgB8ne3ThSUlOdU/V8nxGdV4lLadvbhRWJ5CYlXKIQhkIzfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
	b=ZRnUHzwn22j2AzQ62MRxftcMLlm43j5iFOuwwe+DCopLtdN9lymOBZBvDETfuNTpyLJ4
	 SeyL/HbMlxVrfW0sgJkkTgoMC1N1SXKX+t1QlZ46AzI+ENJZJh5CAgyvhMq897L+uxGI7
	 6FemfFuM9casv7iBIXmvUbIqiQf4qXcH6DQkHz9dgVRNJnoes5os3hUTdivX5BUwehcfp
	 2oAmTRGyWFOpQxImy79DK7/HvxF2Sy4SzBUFotlhtr8gWB/n0zSin3J9loUqeYiNvbykT
	 8YVRhkokAYgNX5n4Cv8cnuFcM/19qaEoMr2SgO1Dc97P7AyDUjEWiBrpantLgt9NyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjZeU5PZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+2mZhX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1D606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C1D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjZeU5PZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+2mZhX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEGwOf1573246
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qhJ2whnh2ftT/2vZqPRp8bR6
	iMbwhkvUovT1Mfig/hw=; b=CjZeU5PZOdIkO4DoAP9sLaaNn5bjwdbcNRvH79Yn
	ZD3XlMsXfX03NcJsfmpTFHvSQjkEell6uXR48rWaV5Iuo2QRhF166/xzlPbb4Nde
	YgN0B45RpF4wc32tTFVRW/4OY6aDsrKKxPT+FznCIc2MTO9p35ACu7sDkWVoUw94
	SRbLETysH/wOOk90LhNbBoxsboYRe0kwgZ+OSJjk+FV2kaFUlrwTyz7mUytQHkFy
	tZycqW5p6Br7KQgFSheKzHMK6f6VjAJPv9BNH+1z08Qi+2ZKOUJqkGJXL8mCYHVP
	sMpryz8JUB1d46w3xoouvooBPjgTXrKsz0R+7/sZbIwKmA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psr0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:49:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebb902eebso62554966d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408549; x=1795013349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
        b=iJ+2mZhXjcwvAG/lwAwLKJ45yKpJsJwXfNqIYNk5DalDsYSzrnKOx90NpdBA0iL/uI
         +djaiH/MTm0jcDgycLt/R4TmpXzmySuajuOI6WL2peIASlS/Qem5rSXu0Aezf41BcBuX
         fIX4dmiQHXtmCDHcrks9urIW7Owl5Cf5XMczY33oapbBMjKL/FPIKUPSoEWXhNKKMwPK
         V3/v+gMrhTFoKXcygoRqUQ0FZsv3HxowLtN1JFlN8WQ+XgaF7pRdQc3lsNRqFEE6mwuv
         nGaYkp5hry18dIEjMaRumkbWFSMQOZ2rS/90feUNxVa9x4YMu2k0fNArb2WcmZse+cjw
         zzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408549; x=1795013349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhJ2whnh2ftT/2vZqPRp8bR6iMbwhkvUovT1Mfig/hw=;
        b=wxID0Oc9QsVSd1RCuL8Daqo/q7p3pJ7HgzfmyrNaLRrtzhrylbWOmbdL1rWDZHmcz8
         J9zwK+jV/LzYZVu8zyrqDgyeHaw5UiUiM5uZGeKnFS1kiE8ecqrdQncpiTdolbFr7ltN
         MmKTGy08wu55965xam7FRE+X2k159e+EY1HYE7KdQI7APfOkl41wYGySA18/+kmH+3yw
         V8MOPwRsRs2tykEw9B5eeCUTg+oMgSRlAYXTB9O0fOI3fgB+/v0RZma03fNeuVOcDLec
         FMTTfAfBzZfoHSucqGhpqvGPBNuHeVYIczXsxadll3yHgHbipsoPBoOCVNxppLyBxYvH
         75+A==
X-Forwarded-Encrypted: i=1; AL+hErHLAe2lkE1kfgISPEIXXHEOGvXPsLX+iTPOMgCB4Ibka+xHY6O88cFOoZnGG8fBXgLAEcYzVtimwHplFeIf@vger.kernel.org
X-Gm-Message-State: APuU4Z+VSfrV/DKkPFuF5oIit3kYcUy4RQaETi/1l7mmfu+ADkK9Wt8G
	kWstPljyj7JRXKW5aquNAxKCj/ysDilGKW2WNFgUU/SbqkRBDv4e+uOCh8QO+6cObt69w4hRi0l
	b//ertViqP/6Ji+N9NpeDjP7vEC52RTIcFgTgbRsufby8t2m0/QwEl2DvZQeKa3l7W9pg
X-Gm-Gg: AYBFou37HPSB4YOB0KWGgaIA8Sq7VPgFLGSqMSApFw3vgd2TD9XKAKRR98Em927aFXW
	SRTYWjApdgceqCsMb+wRMA5HnDl0t7LKjrpUeRqfvkhK1RY9BONdCFOOkBN2tbQrOIPhrb3bZdB
	z8+cpj5LO6+n0Exf3JJg1nnpMlP59GrXDDF5jF6jARJAirlxwmcQ+oKWUke+ydykWLnswrFdBam
	ETo5ftOjVTAaFxiiV5l9AtsYdraTrIUrRK6Ub2u38JNSdzwBiumbvZ/x2qkfZ1DBo7gQGN732YA
	q23fMSawTXwJs9NcyhCLict0Bcbdk2M+I5ac6hlO0DUqBVK2azEHcNLBONJ0JnsUIbaPOsKrCOD
	paefTtldvSZHHe2/ies7VAl0RuIQmqzhTDF2UCSLAUxUhmrnE2TdzfIEUuMewS/JidPRnluYW3k
	PYqv39cw4YUlN3MmA0HQBOdMECrUK6P0dw+A2OTfW2lt/qnGzYphnSPSwRuREuvw==
X-Received: by 2002:a05:6214:2028:b0:91c:65d0:1d85 with SMTP id 6a1803df08f44-91f0426ddcbmr48004146d6.53.1794408548857;
        Wed, 11 Nov 2026 06:49:08 -0800 (PST)
X-Received: by 2002:a05:6214:2028:b0:91c:65d0:1d85 with SMTP id 6a1803df08f44-91f0426ddcbmr48003236d6.53.1794408548137;
        Wed, 11 Nov 2026 06:49:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923c164sm12141891fa.20.2026.11.11.06.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:49:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:49:05 +0200
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
Subject: Re: [PATCH v8 10/29] drm/msm/dp: add link_ready to manage link-level
 operations
Message-ID: <xdahtkmsoxposnxuomytx2wcxthelxjpopecnxjellidqbjq6g@lgmcy4privcj>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-10-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-10-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX5kHoaw2rPv9x
 wRGA7FJwJCkiyBVW46qyi2+6cAWAhOEwcUDBOsLO1FdWZen+A8Rb0m7aS7wU9MSPE6Vck/kvxPR
 0J39rjp+asHYiCOWLe5cSSwNOykQSdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX1hngyxkrt7j/
 eW8oWplK3EC0Mo3NPI3kAYtVRcS1dO8EHIBUbI/yFe92qegSG6cv7bdA0AOHo8bx0dbDVZ3dARk
 On2eok8GK/8d6cxCmxQg7ZKY1ef01WcQzDEchyRg4fm4jZQE6W2TBPaB4TG2LCM4eOjWk2oV8OS
 pPwkpICJMvGc29LRJIg6+456591wCbWiGsdhq8bN9EU7ocXV95QytzP6Or44vFxE4LXvN+fijbd
 IE9JsXDfP1lJEx0nF/LtMQE/oumBhOPzbzEoAo9N2/yqC/IXryu0BMa1+S+wmeyfsfWRKTEeS+/
 FtuVSLW8mspqxC7ylgvkcphllCmFY4JxhToXoGzzXWeGeQBX2zv6tDQ2WR0jjkdnVxec6S3Ku3k
 1+MLrGNtmrzSdBYFzEs6PqbV1d8N9UIJCz2BTigIO5/MtYd2eEkF16Xn9wSLwbY60vrT3/VlScP
 Pr1cUVj4Uww9yYz9alQ==
X-Proofpoint-GUID: qi1xus5xcSXZXIply1g-De2JRI5d3uqt
X-Proofpoint-ORIG-GUID: qi1xus5xcSXZXIply1g-De2JRI5d3uqt
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af48066 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9BbQWiF9P2Ean-TlPn4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:31PM +0800, Yongxing Mou wrote:
> In MST mode, multiple streams share the same DP link. Track a link_ready
> state so msm_dp_display_prepare_link() runs only once per link and
> repeated calls are skipped.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 37 insertions(+), 12 deletions(-)
> 
> @@ -1570,6 +1587,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (!msm_dp_display->link_ready) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");

Link already disabled.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
