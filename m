Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794AE3D47A0
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009863; cv=none; b=ZSkq0yPUePwFhMEEj46Dj6HqLEGEjV6k8WE4zERTWprj2IgzsFGwFdg3LcIXqBwELAIn4O8rOlgcUfo3ghzhiNPiGNQF5Rwz91A3gG3ug/BMJsXTEHQHgUgdA9g9XQSQ61ZH97QC2w7qozwfQfpLfBJowi6raapXTFyafFP2Ezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009863; c=relaxed/simple;
	bh=pKJs6dUM8bOyogR4UJkXP5ti1JG4blAZ8KzoiXC9aHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPRx30jaotVlfJcakd8193jlI0q/OUdwCI800yMdkzVDd/PpqX4z3ciq/k9sldKoxB070r61YmcaPLccHWrE9uWRXMhhmha+iOxAjwk9LmffQfAqa+SZxBbIA1O6zcss8PTyFYa+hNq3EB/EhfteWBzYRZXISEAhFoK6KD6vMOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfbvF3xz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKEiXY8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfbvF3xz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKEiXY8Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ncxp1227535
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=McDaFKyAIXWGg3Hk2H8q600G
	X5SzduLpw9GfCXvfISo=; b=MfbvF3xzD01XnCIXMZdf2lPXCPIgzhQutOaVHOx4
	1mEUEI7HQQABx8oJJ9uYCfXI6o1EKpqOa/D45RBjs93Ru2klMNcCRCRaweFTr3pP
	hy2FXko7hqfUrBvxlD0gRaYCl0EZuICJoRiCArC4UxhYFasaV7PBEriZwqpbchjL
	8v+ob7I+kR4fHyPVOisHEvnSLNfzk2MpMJz/0yWr4cy11l3RN2GkcpIzaE1lM3xO
	BEnkK5v25zDVHz5kGAT5Gtj5eTIO4JX8rs1R8q4rAD4lbPj7TrfW+2K7O6CQUJGe
	PKQebrArgjJzP8OHmhmtDn2IgQAOfRIsXkFky8VkLYD3pw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdug54t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:51:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so8170071cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009860; x=1786614660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=McDaFKyAIXWGg3Hk2H8q600GX5SzduLpw9GfCXvfISo=;
        b=QKEiXY8YgqV2SQLr/jZleu9oBfaNqAApmqMPmyuvS7aTpY29cHmPIcXceWK+Q08x9X
         K3Uu/kQbujDgsJguvuIktDYq7mZLZHxbS5vOwH7/JCLjj+Cdp5/vjao3S3vqyPun++9h
         oIv+lVLRwJXdryBykQ9WOvXuLfpfK/U7sxcdXth2zGKn45OGyqanLXUz6fMTad0eA3zA
         HWuptnwPr8Pa5y2geR1pS40Gl3e1bjOjFdhffmkmZvMASQCNMmt++Xn30xYkLsoPxrsO
         jdBQbqtD4WUFpbvxLk5GaM1mr2JnFYmFYioI1F4s/yogE+WNqXVfgKFb/G0WXDzD9Y7I
         UE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009860; x=1786614660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McDaFKyAIXWGg3Hk2H8q600GX5SzduLpw9GfCXvfISo=;
        b=hmewHWUhsOzxUmRGb8m/0V7NjwUot5jMTa4DYObgol7s+LsmOW2pDhB4fwi9R6BBLW
         dDfq4b5s5Gv7jWSd/5fzc8JftFm/Af8IJlbvxHMj2uA9IaefMStkWjiI48LswW+jC8+b
         Ojb+oqwoBKDiB9aktupIrWH2x8hsBz5zsjGYXYoFY7F/D0RKkTdR9aN4lMDW1G29D+wJ
         qY8u5ghzFJbCD89ya176vgyJkMHN25BxgLkmm5Ufd/deGFzMbYBNiFy17Bi8vc1jBeMH
         TCC3oSh/wk4CH1NS6zoewfPsNvHU2H0tX3IL1Xf5Y/VaajGM9ZD0S/+sDrNlJQ007AiL
         sOjw==
X-Forwarded-Encrypted: i=1; AHgh+RrARo1MZedEBEOMhOPETErQbYXvA00gnrcpoHm1M3FXYHie6TKSr22yD9KiEX27QVpSlYzZfiakq4R7cf8H@vger.kernel.org
X-Gm-Message-State: AOJu0YwDx3NiOIC4TjrJAVxHxWnKBVCN0lEo+TX7ZboM7vfOnF9U5/0h
	7Rf828LGHZTfA9Ozc2Hpa77BXDdNXZuB9XVUMnykl1lJpKMDvcAjT0zVOaY1n6wfqeva1oQC0mX
	h+z3o0J/ibopKmfsyUN4Dj61dXPJU/m0XxQHtGnbu9Kk+czXqmUcmTS5DFEOjpP/qR0Em
X-Gm-Gg: AR+sD13OMoeeYmNqArUWmZXfo/c9wRVuofRi1qDR8Ueb2615BNz1eFa+fuL75tG0nlb
	eIAR931X5iyMMkWPbb0EL20lrltS3dKpJfsmGZg8B9EJ5NN9qq6HMawUH3R4YfEzhvE2qlWpG68
	kOZdqZQL00W38atfooiPllfRnoPjZTyNV8g8X06lcoKIEq9vu9jF6mW5CUQLDWErp+jAqtB3Fek
	PmahQwHEKiPd/4rryP/kAn/Eud1OjRnN3PS/yGd2HW1QmAbbPxc9yI7PK2m9p8HWEUD+NqGKilF
	PFvkTM+BbXWQ3pu+JMkX6rNlbo0/DJLYBZM3CaYv24lW/g8du7l20kvVS+Gb03XpJ5gysmWbq3Q
	DXx7KDPuN/YFHYVXoCqWzl/nILee7bX2bsvyOEm8YUiHh2kd8KyVFlcBZG2XB8ZG3/TAEVRGY5Z
	2msex2eHUsogI3CA==
X-Received: by 2002:a05:622a:1c18:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52cfaf341e5mr58494171cf.9.1786009859453;
        Thu, 06 Aug 2026 02:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1c18:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52cfaf341e5mr58493921cf.9.1786009858960;
        Thu, 06 Aug 2026 02:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c92d3sm629299e87.79.2026.08.06.02.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:50:57 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:50:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
Message-ID: <f4iq5lvmb554kbqbq4joxm3jh7atlkwwjzlbvgbmtg557aik7m@3fbtf4mrutfc>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
 <20260717-rpmh-timeout-debug-v1-v2-2-81ade4fcdb49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-2-81ade4fcdb49@oss.qualcomm.com>
X-Proofpoint-GUID: GObcCVuSVR7zIZeLCLNAXqFH0RtMYoTX
X-Proofpoint-ORIG-GUID: GObcCVuSVR7zIZeLCLNAXqFH0RtMYoTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX7bgNSeoAv6Jv
 iG6i4cId24Wz35TNVyrwFgeP3rbDPXcW0nCz1iI7B+mCvy+OweprUHi5pavWjZXM9EUT/2i6aEu
 tksDnGcNhCBFxLl/0zmWq//F2j3OMLhAjBlUYm4olSMRhrpuZrs2XsvkFqr/QYy8PxgoCcLxul2
 5Dk7ZTTmN0fiyWkXRIJOwz9bGCQcPOCe1pep0UY4zQ/0ffRWv8Bf70zcP2uwG4FpSsglC2AWVsk
 BlSxC8khR1M2S8pkEVd2N/446EnjnNxx6bipOeiXWzQLsOmNPNhDxoYnFVLnUxTvaEgqzkGRMmp
 82CZCxCNyxt6TLkd13R2z6KJgr1TMkHF2GdnVhw0mx+vdiU6gpqRevzjh0gJmtGaQMcE7vFxTnZ
 qzM6erpfj5XjiEtEttX37FeuU6kCp0Mowco1CUcWx9JYdXQ0gfUBklNQfPdqCcAA1cWMeAoKLmT
 DTz/+V1f52W7WlAIOTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX5UGZYyjV7Ekp
 MQs6tSAoiNrQzSFnG/F4K3b5iIqaYpSWRRvxCGtC/3aCG4L2cG10hCt0DlB5ohs3dsxM6LJnsGl
 uoYcZvIMVm8Sbew95ae+i40FhmVjnXo=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a745904 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mXvhL1AVVtzIk_KeqgUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060076

On Fri, Jul 17, 2026 at 01:19:43PM +0530, Maulik Shah wrote:
> RPMh resource addresses are opaque 32-bit values. While the slave ID
> in bits [19:16] identifies the accelerator type (ARC/VRM/BCM), the
> lower bits encode a resource index that is only meaningful when mapped
> back to the human-readable resource name stored in the command DB
> (e.g. 0x30000 -> cx.lvl).
> 
> Add cmd_db_read_name() to perform this reverse lookup by iterating
> the command DB entries and matching on address. Unlike other exported
> cmd-db APIs which go through cmd_db_get_header() (which calls
> cmd_db_ready() internally), this function iterates cmd_db_header
> directly for address matching, so it calls cmd_db_ready() itself.
> 
> For VRM resources,
> which have up to 4 contiguous 4-byte-aligned addresses per resource,
> the match uses VRM_ADDR() on bits [19:4] so that any sub-address
> (enable, voltage, mode, headroom) resolves to the same resource name.
> 
> Also export CMD_DB_ID_SIZE so callers can size their name buffers
> correctly without open-coding the magic constant 8.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/cmd-db.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/cmd-db.h |  5 +++++
>  2 files changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
