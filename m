Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033375;
	b=qYQqNr4REabvQ3dy10WwfEU7SBZzZaZ53M/St/Ns6FsIfOfipRoc5dNFKIpL1p8fKZOt
	 8k4DxA7Os3cwoty3MuE+ON0A5mi8q9U1lY+S/FS8IRzS5vs5qLcw82QudmiMyh1hVz4k0
	 T7UofnYorCPLDVj/bzpEQKibKorhqUTr+KBdd0UJYUW7Rtt8T7gCVXNilAqdKSfryQj6E
	 nuFDxtpks8kDbaPx3dXKovIdxx0huYjzNO2T7AVWGAZGylSwNz8fgOgwbRQpVvnfEd+y8
	 xTfVCvcDua540yBgnfJm/1DkXPBa5aZuf0eVaaEi2prEdwnZ1jEoI+eEIiNvUIGfd2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
	b=idnZcMoScQ3BojTPf7NODqy0dUz9meym20ZHp/PRGMwkHQ8/KmkgAzdBfYxDhDdl8HtM
	 2Nq0xLbX2Wb8pyjVBSP8uUODoR2XbWbg8TyjeGiL5GQjytjuyTKQuNTFcfCk+VDna14+8
	 Y2m76ufo3ly0sJta683JgrUJTS3oH1J5jb6SYBNAyLEjLDpObWPKcJg0Y0uAuBmoYlOVW
	 WGjRFGwuLABPX2AiQifif0KXrKFEoM/rVcssdje0V9Tc0OXKzP1gn8J6ZCnPosNGSFKij
	 HeyLh+ZDZta5P8dT03fyDDd7c9ntqDfWeeQxsWRQWlaqYrLA920fRaX0r+60mcoB08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaPwNDLP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcxztcN4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B66D606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B66D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaPwNDLP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcxztcN4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJM6KR176586
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoK2xbseLTh4OhPRbFIj6Mws
	srqKcQWeYmF4tQfdihw=; b=kaPwNDLPYUD+g4X5/1zBy0pInHs/A4pMFq8vSiNq
	S6XhA71bUvcv+BbIwpEHARbDQiMSQIj2Z1AIc2mWFkIPNQO0mJN8HBO5ZkdPe2N/
	rKwIdLKNvAOvqoW1iUWKm4tCxLi6Wyi+i34qSmKsAMq9e35bG343wc8aICAuXn23
	EK5e/c14RCXoOW+bFF1MecPHT6etI8JBMrmZeYvmgxnOLv/J1f9pPl6FuV5MjqOw
	NPpvjYFpHv8SBxuYcHat6VNq/pf8Zavi6TxiiAkMAzHawZKUDCURXxMFxXHZd7YE
	stY9IAGTaV+9Xyj90pgbSQPYMITPdozkdFDMEYBS3h8XmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcss86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:22:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so258711785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033373; x=1795638173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
        b=CcxztcN4S9r5+dozqnj0fePzbS6YjZkMfH8ESzJdtEDACC7DbhzDwuILzlxEwNAgfm
         SvdtmqrJUMi7nU232C14vccBLfJaGK/h4lEVSn1Szm6xzPLHLCidp7vWVmkoykeFpY0K
         sAkG6c6nvDuTGNqtZofOVACfkQKD5LIknG09OOrgri24MmzKAXbR0jGMOK+Dfk/vK5WT
         bxTjFdFiZaVZ/QACxgwtNwaOzTTfp7Vzzx0Dq+9Jb7/HTfWSlf4DBM+kKUGBcSm4b1o6
         ut0VIoxTU4h0Sa0MNf4tZx1qP5xSEnY/0uGwaTji02ME9YlPtp9rnS3WPa6AGyBllzV4
         DKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033373; x=1795638173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
        b=YvS+tTrr8Dd1s8NHHDusc9q6mVxGkolsh/bg0YT2DANjcuvdwerESja3UfXqH0nF30
         5LeO2Sq/WteFRKtcN97Rx9oQP+zeBUvyosQ53fXEPHt7iH5OJoiCNosJKG7+Md78/doC
         4BNWeSqV4QLjkhb2Mz4LZiusg7bSsrNvpu94rK5o4IzR6m4CbylIiayShOmEbBtKSl0D
         36BZE3QoJimTQHfi+ahfX91I6yMUHMlw+ddcnxOCl+a9GpelIrOMFvQjTuk7VzitCsHV
         5XCzgqr/rZrRlaxynQ4xzm6azLyVnSwsjCDPyaRkvgOwofmqdn6mM/QgQ3OoEZZx6g51
         l8XQ==
X-Forwarded-Encrypted: i=1; AL+hErETptUw5dG589EjjZllXCfASQVZ9YNgRsceqYh/ybLBBFuxxa67d9X2h9oT8g3ufKrqdz7qR4Qp2B57PYs3@vger.kernel.org
X-Gm-Message-State: APuU4Z9n12oCpo1la67J4aD/pY3j95xPyz9AIb2Azf4jlJFtX9vnnLjP
	BeiVKwuAaIKTmEt+qzaC9xF63y2lP6jHJlw+DCt4wOVJWjUid00D1VdNfxOK3rFmHBwgogkI2EZ
	5b5Wr5h8KLl5+nnRIRv51O9+b8CExmfys2tTAJGfC8TVbTEIl1L4TrvY1+nV7uqhSO09+
X-Gm-Gg: AYBFou3TvlYKaOxJJyiQ6XM5YH/enqRimU4yHUwm8THUEv0wnLtaQE19QNCwT5KaG6x
	aXmYtMrn5mXOU14i7rCLG5Hx8GrQNzT1Rg9ytnffTNEdUPN9ZBGvFRsYACZqdLJXkpsyY9uZS+/
	4UWKk7J+9ZWPbMMLebzERv9B6aGz42p3IMBIk+2y0dfEDjp6MbqDCvhmAexpQuBN13w2M+ZVh1k
	7x87LE8gcvApFb9aumc6hWYui7PvlDgL7j8a1v4kdxd5g3hU/8xyEnlurlGU5KfNRhHDUd2st/D
	kjU3wZO+tVWfI2Z5kupX33hqtST36wkkUCZS7tkQddSDII3mzu0xiBoMD+6XyDqDxykIRA7skY/
	BzbxI2ToyArhSNL+r9056MihQfpQlMf3z93rsuY1RRBEaf54CyWNTp7j+0NZ5xN3QvszBPXZTPD
	xWKFLq0CDydry9xP3pxia33OTt/XxOa/9CRr0BNAEOgFyAGU9llhhhyCS8W+V8+Q==
X-Received: by 2002:a05:620a:270d:b0:949:7bb1:ac62 with SMTP id af79cd13be357-9499965a4c3mr611764985a.25.1795033372735;
        Wed, 18 Nov 2026 12:22:52 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:7bb1:ac62 with SMTP id af79cd13be357-9499965a4c3mr611762285a.25.1795033372290;
        Wed, 18 Nov 2026 12:22:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebe874bsm2924491fa.34.2026.11.18.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:22:51 -0800 (PST)
Date: Wed, 18 Nov 2026 22:22:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erik Tagirov <erik@tagirov.ch>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] drm/msm/dpu: set possible_crtcs on cursor planes
Message-ID: <7jyydebmplngfnie7sfidwkeomi4xrgaytey6522q7qqsybg47@obppph6ea4ta>
References: <av4OfY5sML97l2F_@oasis>
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
In-Reply-To: <av4OfY5sML97l2F_@oasis>
X-Proofpoint-GUID: Z7_tywoC7d2nnN21j5nODg7QaTliOSyy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX9YmeD0szFtTI
 if0Dc5zVkiXP5+2m4c+A5UbWh+zb6hSwASfI1tZ5dx9ML5bcZ2Kc7EB2CUUKBRYbdwkq3ZFshyn
 yIQcsyH0e0EhN49Vythvnd/JrTK4cqA=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afe091d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=lh5ckT7KmLwKjNu5S8MA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Z7_tywoC7d2nnN21j5nODg7QaTliOSyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX53STef9q8Sa3
 fYUKYcV3YAXANk/aduwN2QKBYQ0xbkOQLIo4mRdHREKk+2Mc3f5BgkBqHw8AgPWfHNIkW8mT/1p
 OGHA7Xyo6CqMJ6SE1Nk2p+9/npbLiHZp9yRdc2/oMubhAAOGL1w5yZr69hxOBd7yAA/XOtz3dLp
 PAmcy5+nj2456qvkRHCHHE4pSgg72geg+GX5UZe//oVg8HV0BKI7wE/lIO90qcyRupyAYK04ixZ
 ZNu5MQoDpafoVDxln1BqJtAnO5iPu8zaOu8VSEngiV6r8uJ5Qe5P4v8aNnyaBD87w7rO5+d0ejB
 Yu/k0pLr6axb7lyaGpP45NsVQGnnr4T1pygljzSGZhSPipqzkczb7uwsamKR9+NT+3JiBHiET9W
 2DZBUKfG06TtTCMiio40C2TA3d4szSWaqlCMeBqSBG7ONiuTn34ri4S3VpQfGS1MhpJczX7O/Lm
 m8QiNDxiPwyVQ0aX3rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180077

On Wed, Nov 18, 2026 at 09:47:42PM +0100, Erik Tagirov wrote:
> I am using a lesser known wayland compositor that uses the possible_crtcs field of a plane to detect
> which one to use for the cursor. On the Lenovo T14s two cursor planes are created, each with possible_crtcs set
> to 0xff. Which from my understanding means that they can be used with any crtc.
> 
> However, the compositor picks the wrong cursor plane which results in a lag of ~17ms
> on each DRM_IOCTL_MODE_SETPLANE call. Making the cursor movements sluggish.
> 
> After some investigation, I found out that this is due to the legacy_cursor_update flag not being set
> in drm_atomic_helper_update_plane() which has an impact in msm_atomic_commit_tail() where the fallback branch
> is taken.
> 
> The lag is solved with the patch below.
> 
> Best regards
> - Erik Tagirov
> 
> The cursor plane must be used with the correct crtc to ensure an
> asynchronous commit
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index da3556eb6ecc..4e0e9c2d8062 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -877,6 +877,9 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>  			ret = PTR_ERR(crtc);
>  			return ret;
>  		}
> +		/* Ensure that cursor planes are commited asynchronously */
> +		if (cursor_planes[i])
> +			cursor_planes[i]->possible_crtcs = drm_crtc_mask(crtc);

Here you are setting that the plane can only be used on a particular
CRTC. This is not true for these planes (even being cursor, it still can
be used on all the CRTCs).

>  	}
>  
>  	/* All CRTCs are compatible with all encoders */
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
