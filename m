Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478104;
	b=xvcV1SvVqI4ibZQdXqyGHKEs3A7OA3bSTVCfvOKSUI9WSOhFCrQb4r7csf+l4cBNIEHT
	 3JL50SG3FnL+3GlGNNYUicZE/9DT2dN5l587h9DL1inMIbL1eqlQdPyntOPLPE0ibRfBW
	 gK8TGPZHrTAlNQRaCvtMFF9X7SVmo9RLuVwCPaGxa/R5/X1alsseTviNLVXCJECjqYqqD
	 c736R1ItPsrQ84RTgHw0ggviKjnmIMbxtUCqaRA5c9Pkced/ckxFeef+3cuzzYr2NQ9pX
	 PoVqK0vGrv28BQofuabw3Mp98iTQ37YYmvRoGFf7RtDCh1t4n7+/NfMNI7Aoq8fP+1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
	b=pQXRrDfm5LA5LRHlzHWbpj6B2GgTruwKKlvGkJICZGSyutWc2gTgJ+vT+LQi3269klJG
	 YMcBJEitVdUxXyqK9wS8i158nFTeWFH/cuWHZojLcY0HL9rJ4qH0ksUY6MqlWwpk2nHmm
	 URerKCPoO/1Go3xPN78w6zATFrXFxdULgEDDFuJeIRikav1fXfQzyPiJ+QTjwHjpIOkbZ
	 9HKzTu3SzAnsIKTiQ7a+YXBprRDDGYXaTPXDqzG38JcXmovHluf3j6gpvCu0ywIhBHATO
	 iPYcrbed35WQ65BJDm+gls8iH/NOOfDzgvBcJD0lZeWdp7C3mhlCImd8IjNpCboQ+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv4OSASr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMHyrNKS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAFD606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EAFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv4OSASr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMHyrNKS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFQbb3557616
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3Xi0jd2KnKgrPJ6ep80cd3l
	+8cBf4DAA514CH+g2eY=; b=kv4OSASrS3Cpiq2h1eVHDFVrHfu35u0+0ecLTj2Q
	aExk9rf+knDIy8Ltfu8OZ425fp+lHKY57/8876eOh6fVgg4FDVN5dLmAb+E2MTqh
	bHRfoU6CBKwYM655l/oQlUrX0w1NEHMvTC1G25M1ztdj9yuycmAS01IoJcE3UPRD
	JoGlElNz+wBWLHqDxmGv3qd5OMrmpESTQYlux0gFE6vzh8nOp36ob/W1nacZ0r1r
	gnMTyZRMIn1enExLZnAVVxQvSZw4g2KVLIlYY4NW3qhF2NpXWUQ/VNbegbsykIb8
	8zni7U1/cqvBTlQiSvo2Om+38WL1ioy6cv++FaON/3k7NQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxj241-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:21:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c0f73807eso24110716d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478102; x=1794082902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
        b=TMHyrNKS4JNc2PKDEJDsCNADGsjLHcdBaSCdjuXygtoLgh3+lhNNF0x5v1mEfXdf6L
         HZo2HJrFk8ZeX6oSfT/7OLgis7CLrKY7+mH1xLxkHX6ObopRhde/+jv7kaZYshokEDnN
         n6ntARSXgAt8OhtWU9Gkbotnz7zkNgCegdc3ZVvOWMJ58BVn7IZVWTqLZhH3MnwFEWqp
         pCwt8Yg0OiOJtA6cVryAjPV7P0xbYmxDzYx0a6rV9kmIpcjKLNmYa8mBVsagfYOqJJql
         opaAWG7QqGI4pqmN7QtpIGO513pkAZuoS+lbYVZOrdB9z0Z4/ahXWGKkRHsj0j1c5Ii3
         HlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478102; x=1794082902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3Xi0jd2KnKgrPJ6ep80cd3l+8cBf4DAA514CH+g2eY=;
        b=YBhS8MFNWA0YJns1AOSvS2Bh3NckC61G4TJlGMV/rx82x8Ya8CCixWcI7oUTBfja/N
         vpuSn6Z/eJOOJKuUW2RDsRTrGt3rQpeHC61PK+MYrqqsHK2bmSwxu8L7PBOPzIxHBJrG
         nblB8V1tc06JFIEzklji6JhAfDWh+PPqjij7/F+N+ZSZrGma6zsChggIOaFv6rZZ0Urh
         K6DOytG3Pk9xtECw02XT3ObQfVOPPGOgL26iXiKDP8DwpQFFy5jd7V6ESF+1B3xBYPhK
         KPuBM8I08q05pR76UNShHRS5oe7qx5nTeYeDTQxPEW+Pqg9VLDar95MGxEAStvvLHEco
         X/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKmfQgTNq0SZuvBjRFHDUKbYI4nMwYkNTFlZPHEEsmEnuD/poHQzndEp4xhNmIXzJyFvDDwZ+lfNUivNzN@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ORtzKTly8W29iOpJHlZPcJqrtA7vhPVjZJsP/3NQE7cqzw/Y
	MR7uQX4AMdpmMsyQqTj1wrj/v2IjBdwNA5JRw9doup7JsgxkaBRZHQxnQ46sCn/0wtelRkZGQbW
	6rfkII5DUKWIo2TaLpshaQV1Bnpwtg0uIDfn14zT4YxGuQK8MUSF+gkT7NHo9FehmmTLC
X-Gm-Gg: AYBFou3gseK3WKvgbt8Cn/ahJh2Oe+lbzfZZx0lrf3eHA9mPkJZhFyRyy9Y7PxT95kx
	SpLqEyWze5TRqXiGBJbHzUJtZyz+nYcwOnINGKTpAIsD4ZB+W2xF0W9h4mkDZatsdtr94c9UBje
	sKvuvGn03UdNPCpvEtq7yLTsughDDp3y6EVFAb/RrcTQqxQxVgp3Lff916ocQvKBgAQfk2rkbZi
	wO6tcX+lW9LzjYae6J0hWKi8NW93k8KXFrAp4oxRFBUlgm2WWpEwijcDl9ebEeWs9+jig2AgMLi
	W50t6DeaQ+QRSP6df0g8+ZM1NDZgNWo/2+dhyBF4UIpTdsUC/YbvzU0Fs3W9Aw2WUIs9tABQeb4
	tgSqdJb6BAdgSpDQKXCQaAk6NaADiUy8w4e7J6A2zOqf9EOa77nnNB2JqieTGJfNCuicXSsFE3e
	lzU99xA740I2hR+rGnxgy/FOXy5UGzAgDD1+t5Z/DFuKRMHlGBl6hjgTmWkTVqNA==
X-Received: by 2002:a05:6214:4902:b0:91c:60e8:a8aa with SMTP id 6a1803df08f44-91ca4baf013mr85236176d6.49.1793478101596;
        Sat, 31 Oct 2026 13:21:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4902:b0:91c:60e8:a8aa with SMTP id 6a1803df08f44-91ca4baf013mr85235896d6.49.1793478101049;
        Sat, 31 Oct 2026 13:21:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbebddacsm12698671fa.6.2026.10.31.13.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:21:38 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:21:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/msm/dsi: collect bonded command-path data into
 per-SoC config
Message-ID: <j5ixobskknatvusosmhgvvmnze4q67iyfwk6gsa3y5goovx4z4@mhumd2vsnfkm>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-GUID: wz1jVYTl1uhSNyBuXKajHLkIER9p7eLh
X-Proofpoint-ORIG-GUID: wz1jVYTl1uhSNyBuXKajHLkIER9p7eLh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXwj0rEJ50SlAb
 xLYuaYbtRf1pxGe8ALOcW6MLUej7Mzv+zBjbt666msNBsbpp3qhzMb33TZK7sKh+jZVLLazUwsu
 eZf4sozHfDeenzO1FiNPDrMgTmvjOT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXwhIsK1v3oUQA
 jphIvdSBvb9sVzhjQZ0qdT4sVYlxoT9pMjDd/2OjIm1hM3yxqGL6cqUGmwPmZ47IL9D2B3cukY4
 OSicWDHiN1f1t+32XiQTCXLPv09/YAol20aZv/rI1BzPQyq7zTvHB9U4Ayx2OuMXq5JQ8QRUUkR
 8keBuQNkG3szcQ+jADJSKWFzl8cmrMuzxj/mAwMldFdeVyvplN3rz0kl+e+WDIQMQnQMGJWWF/w
 JFlSoiOTKnpJE4AMAERpBCO3YXHAAB2LF5wj9bXqY7Em3yz3rqPaua4MC6Yj/j3tSaPmt7ATNer
 k7bFoSSfj/Rk9ed7Kof099eCbmSoCMCUdtxs0ueusb1vt8NaMiMqXrGC4WGqtxd7t/4MeeQHLuX
 vwhyGSsOmPCYi5VEwz8+opYoE57CDGKbERj9cPBtKtQ8IrsFVSEYhu5mH+WeyG2+QBZHSibE03S
 L+5hGc5kzUvsdAnCvCA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae64dd6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=CeVSD1skKhO3MnvAeOMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:00PM +0800, Qianhui Xu wrote:
> *** AI-assistance disclosure ***: this series was drafted by a coding
> agent (Pi) working from the author's design and measurements; the author
> reviewed, tested and approved the final text. The design, measurements
> and decisions are the author's own.
> 
> The sm8750 (Lenovo Y700 4th gen, TB322FC) uses bonded DSI: two DSI hosts
> share one bonded link, and the master is decided by the SoC generation.
> This series is preparatory refactoring of that bonded command path,
> carried over from the vendor tree:
> 
>   - 0001/0003 move the bonded command failure flag into the DSI manager
>     state and route the command path through host ops, so no mutable
>     bonded state stays file-scoped;
>   - 0002 collects the per-SoC bonded command-path data (FIFO error mask,
>     CMD_DMA_CTRL bits, peer poll budget) into a new struct
>     msm_dsi_bonded_cfg hung off the existing per-SoC table;
>   - 0004 takes the bonded master link id from that per-SoC config
>     instead of deriving it from probe order;
>   - 0005 names the FIFO error bits instead of using raw magic numbers.
> 
> *** NOTE ***: this series contains NO functional fix for the Q28 panel
> issue. It only re-homes data and names constants; behaviour is unchanged
> (patch 5 is explicitly "No functional change").
> 
> The bonded command path that this series re-homes is the one the vendor
> firmware lineage on this device (SM8750) drives; the series introduces no
> new runtime behaviour (patch 5 is explicitly "No functional change").

I'd say, I'd prefer to see the reason for the changes. The bonded DSI is
seemingly working today.

> Gates re-run on the final series:
>   - checkpatch --strict: 5/5 patches clean;
>   - make -j26 W=1 drivers/gpu/drm/msm/: 0 errors, 0 warnings;
>   - the series replays cleanly, in order, on top of 0f1fb1c9c1.
> 
> Qianhui Xu (5):
>   drm/msm/dsi: move bonded command failure flag into dsi manager state
>   drm/msm/dsi: add per-SoC bonded command-path config
>   drm/msm/dsi: route the bonded command path through host ops
>   drm/msm/dsi: take bonded DSI master cfg from per-SoC config
>   drm/msm/dsi: name the FIFO error bits of the bonded command path
> 
>  drivers/gpu/drm/msm/dsi/dsi.h         |  21 ++---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c     |  51 +++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h     |  30 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 123 ++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 123 ++++++++++++--------------
>  5 files changed, 249 insertions(+), 99 deletions(-)
> 
> 
> base-commit: 0f1fb1c9c1c8f09c711e8e9a82acbde2baeed691
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
