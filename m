Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8DB41A79C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419903; cv=none; b=UWonp+BCWQKdPid6QD3+IgOZkcIoLMKemYz7GnZyjIB0xApSUc5BtK4ppX0WZKTXwl6R+WZe0DuOFSnK1TxkMdJblnPn3D/+te2dVVO1MuAR+sANMiSyZs9C/cMDOX8v+3UeK40q4ndJP2M2q8SVrVA/itZ9jYPyjzicMTJ+8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419903; c=relaxed/simple;
	bh=NGmaykbghdv5wsGGoS0c7PRsUk7uE67XyK8PQWs6r+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN/oIx/dpGzPk7AJ1cUuEDYu8bht9SgKqDQqBnJ/WUWs1OeJMO/qLMVxV3YbvMfkKqQhsk6/VrgKCa7uG7TYVZld9VhEQPe1CGSam+sYOXT1MJBKLGmg8cZ3rEMoDp0fl+qYn9pU3k8DOcW62xAilNgjD/z5AMSf20mzLOuq/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtDGpmHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kH0Np54o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtDGpmHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kH0Np54o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDQ2q427129
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAQjGeRZHjyUwhLQVrzoyan+
	i2a1c9ZmrG0BP4f4QSE=; b=JtDGpmHEJRmAYidb7xSW8UbrE6V3u1IQjp+WDhkr
	XsgLWPuDjJe//HelvH+nb5W4sUwseM2j5J1QJ7M4iFam4BlMoZ/5ou+24aoJITmc
	n1FiKdbsXbu4FZSJPzkCNpJCnfgUEbacSyeut+7NkPh+7IoiVIKMKTudfbhxRoXH
	OSFgsCpvJOYDJP/vjdvZ9GbyFzQmpAsd0jUTCB3zb4O6ATuUuZHxtvTtxTjcF3GG
	TwrGNkBlKvGg9kJLChk+4LbaSFCWrmkcTH1I3xF4QHRpl3V+kp+q5LUe9gD4YjtB
	+oi/x297yj3NAjW6h2d2iKiWwxTEgQxh6ZH1xl8EgBFeAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tyh5ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:58:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso22176941cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419900; x=1786024700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAQjGeRZHjyUwhLQVrzoyan+i2a1c9ZmrG0BP4f4QSE=;
        b=kH0Np54oISVZYbt4T0eIfd93/OmfcSeB0WGOOweoCrwaR/32THoe/koKEVp5+muKBL
         4NWS5vaFmAoGQJUQq748PAJXo6dvPuUMCMQ2Mf4VzdTwMsQK5qK9OAEKJfLeM1RnArOK
         mhw+4LKCnLE7/+GqW5rC8lx+NuI2KFPpxTrX4oZ2FZ1oa0uRUO1GHw3e0hwiHJDsgusk
         sAaocuhfsJGbCUMUZdDowakFOKMhdbm5dMnDT983s/5Sk7DOCOnWB5O8OKOMhuXAHMEc
         ZiOpWF/HP1cGkZQ3+V8cjDN5idKv3VuPcx4IdzqE9tW+rTzPFc7qBh4rnEo7y6HHKOXO
         E2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419900; x=1786024700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAQjGeRZHjyUwhLQVrzoyan+i2a1c9ZmrG0BP4f4QSE=;
        b=jcmegvpEY4qU5P1ZnWIXskyNPA+efkWVvtgHcW7hNLNlQYLmrPvL1iEJ4zj4bU96nH
         4inV/edn9b3bBEI0aGpFBwFOLzYJmXWsGDr+nvGIl89I33TuGgtH4W6nSFhqodLkLpa+
         xBCK9GXuZnxlpX2m8bqSPog0UeGKmSsm+JS+JkTig9gNYYLzEWFG93Lis5FYCSUsBN4S
         Ejli/whaj9fIv9XXHR1uoBRGdLV6BX/tO9OWF1tqE7skk+qX+/TZmUi+B0Hv82UYykyI
         9jLfuUzxWrDYwSgT/bpZ6rehHRMQ5jor7AYbhjwUPuoPpImTEW89ukDIKFVxFLRfJj55
         gofA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0HPfpx6a0OwZLAQcXaQ3f0ZHhNSejq7TwtEN1YBtuQtlL2yRUXsHyL0pGJGniH3XYJZboee00iR9x+36P@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzc4zuSpOH9/PrtwBPpPGbn+bnuaRSbseStUw/3P6wpuIMiYpQ
	k1MMiI3Lsd3sDX5fFcqJKwP+Ts70bXo5LEyuOXz6VFrmP66rgIMBT2oiUwQn8DKQ+1h+KGLN7Tg
	cRlcCHkg6aSfoIuZWrz7jJNjZcF57RNiO1DhjKJFTrAyMtSABN+J81MospdXTiKtb/Y1L
X-Gm-Gg: AR+sD13yPRxnLcTbWSTgCiR561gDK+U7T/YPPlYz5AhnwltDP18X17vjCLLpQJSuVX/
	70ifEG4yUGlYuZjDzPEnoDIteD+p5Tou8msuVpDXyT5lZHHa1SKHPKE6PCMvlJt4VipuwBKysxY
	kuveBXN89k4t6zF6z4zLX6tcF0Ad/9V1Savfr42TouprNHHbKDesK83gGv9a/0mmWepB156D7CC
	nUJHmzNJviatGEsFx0LHfi0De2qGNjNMbQ5gGM5BjPsQQ1eJYwCbOcSUDFYaFo22Z9knkAfVRqv
	T2RgqS19BBjq62voapxOw28P2u/3UZPJUnkesK5tns5wl2bqsUbg7XQihTHZgVN/j7/85+g3ERM
	fxTk/PKFeUoX9IrDrHq1zV9JP4cxJXNG3zTlOzu6TZILp8RlwHnVRSaaQ1XsUHgGh2RX7Ncdy/O
	ElB4Mh8eV/JMw6GQ==
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr27808581cf.78.1785419899805;
        Thu, 30 Jul 2026 06:58:19 -0700 (PDT)
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr27807931cf.78.1785419899145;
        Thu, 30 Jul 2026 06:58:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db94febasm343902e87.19.2026.07.30.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:58:17 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:58:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
Message-ID: <h3rfonvwkxkmschyypytwgwxbmnq4rou4iyk6iq577c5tcfdl2@zrz3xhfzpmlr>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
 <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
X-Proofpoint-GUID: txD91S3vD95IzfdiMIxUNkaNrH_vAhE0
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b587d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iwl2vSsomdHTBBcAHCgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX+ZRHUSV+ucPu
 4kXyLK23c1apn7s9h9Co8Sq3yu/VHQQYTKki/saZSUHs3SmtDbsyvSyiVTiYS6O+KWuyFg6Fo2G
 k6l341Zsx8j6NEV5Dx1u1B1+GGCwOD2fR8XYL51G+UgLixu5e9i6BdpcOzzTq+zxOVEnUYERuxu
 ABw8usNtvg/1ZLJm5dhgoAEuOYZ6tF2+hsOT8IfChaWLv9Df7ylCj1Al7EKTEyiRF5jnDDVCdKM
 zodUZuoxwGzuhYMoR+54Nzm+7y2wYa8wWUeKjx0YDI/eSgq5WMpZ12AsiRSxH/sDoR70WXRQPbS
 sEacdKgndYSDzdL0EzaB3p0pn/Nkq+BKRBrGrzIcm3Yns2mUYdxl8mq0kv2Fpnn+UljkfrPQimr
 yUbuLFPBOP+pLYp0/iUIhhHH8BAApqOlwb7Rc5S78Qo9iOjJzCMrGHL1aAbXp418RvGpcWGPP2Q
 U8yVp2beKFCsOY9yAOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX3cT+aQ/2i8XU
 5cVX8ABFJJjSgSbDDiqB5TlVEIlcRpJvTZbHghTi6zdvEloirqwVfX92Xrs8k8DWB2+MVFWxcAI
 AKeH/iNCtYaqLr8QpO5cw3EybsDn5Ok=
X-Proofpoint-ORIG-GUID: txD91S3vD95IzfdiMIxUNkaNrH_vAhE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300106

On Thu, Jul 30, 2026 at 03:42:58PM +0200, Konrad Dybcio wrote:
> On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> > On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
> > dma_iommu_mapping for every IOMMU-backed device and attaches its domain
> > to the device's IOMMU group. That domain is neither the group's default
> > nor its blocking domain, so when msm_iommu_new() later attaches the
> > domain the driver manages itself, __iommu_attach_group() refuses it:
> 
> [...]
> 
> > +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> > +#include <asm/dma-iommu.h>
> > +#else
> > +#define arm_iommu_detach_device(...)	({ })
> > +#define arm_iommu_release_mapping(...)	({ })
> > +#define to_dma_iommu_mapping(dev)	NULL
> > +#endif
> 
> I see this is prior art, but should we support this config being off?

Yes. For example, on arm64.

-- 
With best wishes
Dmitry
