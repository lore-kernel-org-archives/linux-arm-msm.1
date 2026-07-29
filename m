Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86F3AAF7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339245; cv=none; b=p3pKMhEiDaRcfTPb24+w+jibLOukNxJ8dNFJqdDaBo6ntAiNpJlL7/OcfMiFMTbr0D2xuD04gfOLoQSeJhSDyva1YvVNcfCvYuGBTFDTYOgDWlN5YESua1nIUhh4cvOP0m9AbY7v7czKbdqHKMu0Br7MC+jIfiET5Mu/a3cZlTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339245; c=relaxed/simple;
	bh=uusaHKhdZOOIa+jdubg/4lcDVO9Mun7Egkmmk4lZfXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7SBOywA1LbWFFqRjQQfF0jOz1GEs/xAKQMoO7fK0upARpJ0xeDj5e9jCb/gpSDBRCGMjz4xXvmKaWyg/qL8xrHKzhqhqQGSuVWwyrahMEitwjcQM6GIuUBp8OH6EpMJ2qy4O02v+7ZWTQexWLonIA6I7yIyO0/k9AsJEOQbqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwCMMNCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxDLparx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwCMMNCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxDLparx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3G982108264
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QUnH+rERyXcOOevFVTmjG9tv
	hkhekENrGxjVVTyR66s=; b=kwCMMNCNfZnAf8pOQmuZW8mEiYknC552j6RhMaKD
	QXbtrnsTBy7EJkGrp4cS3030eX0kyMc2YW166MHlRYIC1mAUmvq0XDJ06OHyOp7I
	CYMDK4gZXqTeIUAuOEdwc5/eNP2UBCRsPkM8OIKcMMP5ffkc4YZLeZcosdHyuZae
	86elXKl2WFhpzbKu2A6A86zZ8V3csxh0usCmIot+Iv2MdGu0Ew1fQZQT2gqN1EQD
	lR4ZvTPWqoWFWH0u7kJqX2xe0DPwjzXxnuaWENzg6/xXjHZe5bKcaYt6rSykmnaf
	dQDd6YLy1lotbwrf1iTiN7QfniDWmdOvFlpw6GgwyIzMOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8bpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:34:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc92c5373bso12263286d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339242; x=1785944042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=PxDLparxzLWo5kkqpfMZGnE9tva6fk6i7wV5G/o/NeQGlvgPBs2uYmUAATZCmTbQGY
         YoG3Nm6CBhIQCYi1xMtGqMzOO0rvNOFk3THZpgi0GeuzfM8zLmlbRfYmL9S2tMq5+lrQ
         wda9XBozJ/KysWhcXIhWzp1JL+4wunYC3vXrE5p9csRWC/lDTcJ+WR6yroxCuF2Upy2u
         o2rVXDHWSTrmnPvGleN6n0IDjZmJREhsRU23nkuM/dS4KaEatVIo67EYPqFqbgzX2uou
         nUN0aLJbiEMI1wepG7exUP8ncUPdobieGBLvi0z3hIqOxcp7Zo4rxl1OHqXQGpK9LDdc
         W4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339242; x=1785944042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUnH+rERyXcOOevFVTmjG9tvhkhekENrGxjVVTyR66s=;
        b=NAi8M/ZCv8CFZcfySwdrSliURdzLKPjb2XG8G7KZIDUyuZqZkRPfB4B+dXvyhfaFWA
         uO5qhYASRARsO/odFLRFdq78jrolXAWtf8qiUrFVtPwaw7WFJ3jUJhrWHMG+9b42f301
         8xUug29/Ls0DDEszuwo5490VPAdAhQyFlLS3SIp7N/MWxsUaEOPaA29WDJH6Nwu5X/kL
         9dFHOxPPwDDychb92zjEcUDoId5rGEKJWR2Qpy0inmqDPy+f5uvpmblvVzP0ANXrFESK
         Etqn6DUXAll75dxJTBwDkKjdS+9dB+bfU50B84Tlg91/ONsiLq3HFx/caXvpyDpkL/2s
         pgTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp94QV/wycPv6tvjdYn7BmFSJj2xbJSRMIaPsvbDAaSXKVT94Jsl97F/tN7PuJYkPYfsZammJK8IZVR6FAo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdk4hE4+w5oD0rjAuyjCWSFNnFIhtGnNHxmHZgby1Whu1YEW2W
	/7ha0WZXIm7PKSigRCmWqvzdCWLQXDZ5LWNH4Ay1PCbHunmf8qzY+3ucolHzo6E/zoMI25SmzJH
	xslWPEJqBnw08kZWPHzjFWzLkmN1UdPHlj9k+I726WVDu77tNd9blFzcWewKa0LYfxiJB
X-Gm-Gg: AR+sD12rmN0PRjuQuhPRTIxIyrv2W6k4+Kfkv4rXvFGhEYm0M+q5pFdgEtgjoxzBnQ8
	p+6uLaxf0I6IRafK/zfjXYnDeIDbTIOeGzaiJyocS3xuzWgz1z7ctNtNtbZY9/ItmbFZXo3FizO
	ZPmObidMZie3xE5HehBu5lAeHMrEX+HUoTBkPkQkU85g8sR06Ikbi119nBbnrKKY3RWEiDzfYPY
	pbT1DLOqWvt7EK9/n7TACnv6fRiPy/HtmFSTXP+yv6TT1mym7A21aJ2msDs8R9Z5H2ThBBmnslf
	M9PzPVmHR/xSnM4936sfPJX8WSfGu7ktdPwY3uJ2sM/GFXTnw3WNVprem36dS8jLNHLsf5xZz1C
	vIiKGJ/75bQPFd3k=
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71296571cf.45.1785339241911;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
X-Received: by 2002:ac8:5885:0:b0:51c:640:231f with SMTP id d75a77b69052e-529d70d6591mr71295911cf.45.1785339241231;
        Wed, 29 Jul 2026 08:34:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3b1csm9218589f8f.1.2026.07.29.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:34:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: eliza: Add GPU nodes
Message-ID: <gpqulnkjhpp3oqin3xouxcyytfpnaw6bckmmutbzdebfmnrdvv@ylnrzbznwwcn>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-7-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX1UQrJIv6WFZP
 TQeIorm8JdoJQyi+fADIbcRqOtWECFZvJYQfhuLdG8QzfM4aK2VIOGbSKe66W2nacwxijpu/5Sv
 DU+CG0wyxbBa/uwgIo3IgSAXyHOLp/Q=
X-Proofpoint-ORIG-GUID: w5pnygLP5zufpjfAN_rbmJVw3gDdbbmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX2NGOaAnWLTIv
 rRyMt6BmtHQxghtPSGNB2f7vxR1J4SJsQUV+QSFBSeeDcbIMePu00GD7wuBdhEMHvuDyjc3OxDn
 ZIfe5l7WGeZx91JonsgN+NKYmokYzSN3pK5IId/DN3fIE+GNWNfwRgTYb0FE3l5mwKvJw8jz06F
 SgnMwE+IglLUZ6H+88i/NbOIXtr1WtR+9yNJ3Wvq1xGv8KvqtaIpzBki0GRcEm6j8TrajREvzgm
 WbR3fSEc0qq6M1Zao2c3xo+Ff2J2KlxjVb5H/7oFfBCPGp045dGhRNIjJfsLxJcLuOHMPLNo/Ub
 +TyXXRK9AUC6Qu+0KG2Iyxov4AXch7Z0+ujL2USVvHeIolsDwv2rlRHa83NcNUTegR2+x8rKZ5v
 XBuc6D94cQoYZMT+2TAQr0JBfr1E9sTxcF/Wp+FM2A0jPM2JjpkimhrsRKEpfsgdDmd+021CjIc
 O2mPJiK5dDMR07Jtw5A==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1d6b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LzKdWfoJb4QxxMUDPeAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: w5pnygLP5zufpjfAN_rbmJVw3gDdbbmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125

On 26-07-18 02:11:32, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add the necessary devicetree nodes to describe this GPU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
