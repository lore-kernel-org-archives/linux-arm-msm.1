Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8472408623
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386007; cv=pass; b=WYycm6pCV4Y6nuZL/qW403+r/T522T3UnHI5pHfK+m1BjPvSIAtWh4vq7wb3+TPgEUJdOMZZLLmmj3MXr3SLTyvXOmNmiLW1bPgMmw7xhd80VUcHrn+NBat9+AUoXjwWmKKnDtQG7KqhFIS37yZ5lw13zIfxGsWbIAKIPg6n57M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386007; c=relaxed/simple;
	bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGs0maMwNIwq31WieevytWOL5Qa7nz06nsJMEzxctfDyadGI6lJCw+Flinixlr2OH2E8ZBuhlzlYX0JszKCAo9gBYVklaaNGQywO1vlYmuG6MI6L4ayBqEfGtdzFNnQd4SkIxZEjrxDYEbaz1AM6RDrwweO9u3VZOjpGuHpQymc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSi98iNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQLym1uX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSi98iNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQLym1uX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtPO9041015
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 15:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=; b=kS
	i98iNBmpK6Komj36szarrvC6suf5CZ6Kh4dWhgWXLkJV0G2t+T6qpoKtysNp++3W
	WwU7aaKSyy23XxzoNCgSgrGfSY3JI7mO6jnnDNdRuTzRzpRvDmLOz8Bqu/LIzyOW
	4ez2LJUjPNvThA0bBhKHXuD0azIyDa82lU7GgthU8JLqda60ozoc85hwHRUxhIjx
	/+xThhJglZUlX8gBMTrSxMujIzO3HX959eQ3Urfx/gxgTiL4y+Q+v8Eg4XBjygQA
	53rpeVrMxoxRXi6I6n6JDOzNvQ7jXUecS3YL8fm/BC7fGrhsspy+14LGX5Hm4kRE
	aL59suyZS6LmvK9RavVA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcsqst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 15:13:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6d278014371so3314962eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386001; cv=none;
        d=google.com; s=arc-20260327;
        b=E3JfWqFJeljf19HaTO2adoeYKg5AcBfL0sYEXCm72XsShbXdl8589WAEKJW6ERhVCz
         rt1xS774W/AykyKmnxUrNeewlv5KOs57q8GjBUQmvgJlHkKE9JJMeB3V8u6oPvE29QNo
         ow3U8NpgbR7/eI5E0uJ+H+2tQ2u0+mViKQSTsyqdRbBUhcZMzMsd4YtdzYJG3Mx7slgu
         IP67gLpQ9ZqssDA/UfMuYDREjqYPTMOW1weFrjxE7n3Zu73Huo2O8MYAmxKUrTGaQYBE
         z1u5muJNR79ue+4auVG14cr5U6silSdXkDEUscHlg5DlZy/+0LHY5OSP7XN4ZmSMKn3D
         vRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        fh=eNDf1a9mUpTwdyMChDkmtlIVRvRGHRKBcz7WuYSCqt4=;
        b=Hs2NrSSAbbJIU5nzW4EkvQQzkuXpwqXA9S2gpMmV09cCFR8+/P+Yl+l8xDYgHmxmCu
         QlzvdpF9gQl+bvYvz7tGjOgGlYhZtbL8LlsGgB0IHmh4I6TCUvgrTOWNPoiRELNthE3D
         gY9VNaJsTJJmAtYgX89zqTtoTNOgiNsnin46vYkvry4+kGM6w/vw+vOpCJU7zaIiboP9
         B8tdLdhYT2R3FbXOYIs7Hy5xsV0VDqmj6LlAtm1IQxAsGzofB15zT5uoHsEh574CfG8K
         nUlBftZGRbgh+5OJ3eFEEcFV5EP8Z3s9txDkL8vcmzZeHKJlSZ3yu8iL/L453eOJs19I
         rYzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386001; x=1791990801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=KQLym1uXMCc7C9/BGgHDM9YawD5tHKF4xOd7n9+ekI8yFMFOuk/E73KjzumE0VAyJY
         EzQNYlwkwhrIF2wANODzH1TLpWthztHTtLLNSbfLRGqFmKI7O+WQCYePSt+rRynQpLFC
         w5FwPtlv8x6ZimO47enHPsfv3N8T2WnqUX2VQn6WBTvJH07sEMKbmiPsgaoFExJhlxuv
         SSXJxD+KFv89LC4UyOhNvziAfjbFUlmtIDhp/+ZrcPi7TvX6+AyoLwLqAgsjUBBoAseV
         Pt0LpEV1ZYuJGP7qZXm0IcE5Bi4L8kQaMHef34GonNjut6heY1N5dkLDRfKOBSZKpHPN
         hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386001; x=1791990801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=G2D51KLvQDIXIyM02k1MbSSgxnHs5TMhk77XZBmGh703No/FqSB/e+9F78hqOjKmGR
         AbSGJjdi/X4QRjGN1z6M3BKWEnKKcoS9XGEgLibGt7GdbnxWgEt21q70GauEbD3bGEx9
         OeOgDDYF7hDrftbgRYpfLIZ2TOf5AddZS8Gu4Fqi/US2cxjrPjWLAfEmnaDcIvFuC3h1
         f00Z1mgiSYuFQQXZGxcE7SuZ0KFgR4YHv3JEVNqTpxF9pSMoFCoWztZvkhcKou5ii8pA
         7zvM8K2/lpk/dwmBQJHbFNmYf/oqdjHq28TJJY7u3WX5IhjOeykWpJv3QMs0se1Qfhb3
         PSBQ==
X-Forwarded-Encrypted: i=1; AKwUvByfKayATQxPX1GxsKmIO3sZzneoIQYLp3fgtRjKDD/oZzaC3yVWr7aG2sE7TeEv2QCubWs610WyEsiQnOTM@vger.kernel.org
X-Gm-Message-State: AFuF++ne19cKx9r0bNJTCZA6CVWJ1QDx4uMgzyQC2UwriqPiWmOYxXmg
	lXMdoEmw5QDmDXQabVdOEAwASqm0ZhM8cHuK9/8Rw6ImON+gAL7F5lWePPHZqg2crqhjNzVH6z1
	rk7D7D6tfNgmU+7/yF5fOgq/SlzqmLYf1HFYUVNXJ4oF70WBwL29/Q1OYIFX9ouCXJN/Ak4Zi1y
	UCx2wK/vcXP1xQFXnSKQSp1aRCNI13mOi5y1ONCHQ3BJc=
X-Gm-Gg: AYBFou1+6nUzw92QihhaK/J1bpajlfywuWMjItlHP1l2/JciyqD4emLVjh2nKKyvx1B
	26hLPzeMWJ9AXrsI+ZxsiDPeqS/gQbYco8erYcsYW9hIPXQtuCiIKVqZfGBhpZHTFoJ5zifmMXA
	cba0zGtK88JJJ4AWXJ+9D8SPpCYcpYF6YZh+9SaNBuoo6Pswt9IjxjZscZ
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id 006d021491bc7-6e7a8ce1653mr2316141eaf.34.1791386000868;
        Wed, 07 Oct 2026 08:13:20 -0700 (PDT)
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id
 006d021491bc7-6e7a8ce1653mr2316108eaf.34.1791386000412; Wed, 07 Oct 2026
 08:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-4-robin.clark@oss.qualcomm.com> <20261006131920.6870D1F000FF@smtp.kernel.org>
 <20261007051924.39963-1-kmehltretter@gmail.com>
In-Reply-To: <20261007051924.39963-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:13:09 -0700
X-Gm-Features: AclHuK-DPg5smaCdEYcgCX8G5Ae8CeG9zJ66mUOBvXkaQs85IPOEuKUidxy3v_Q
Message-ID: <CACSVV00nzPAOEe2yTrt1n7_fpQTLmdxnP34Mm3ovG7rKZsnbTQ@mail.gmail.com>
Subject: Re: [RFT 3/5] drm/msm: Extract out map/unmap helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0VOHabWOSfYFrnDFUimPCPa4vB4riU-b
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac66191 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=z0c7nXvavwv_fPd8bKcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX4oXqAxB8wgaj
 AXVwdvMg28UbBBugZJutzxZqC0FcWsSFbqP36Xv24OIwcaoqEGLyeUt3Mssaua0f+c2RyM5o85U
 tW8bupSnUgdspElbtuZfGcCyJdi+zqU=
X-Proofpoint-ORIG-GUID: 0VOHabWOSfYFrnDFUimPCPa4vB4riU-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX2k7dedh6w1qG
 CxWDzX0sR6YJAWhi49pnaMyoANzHX1/t36Mm65RHk2I4TRkyEdPNT9Tqhw+GpLyc+5o/gUL8PTP
 IUJ1WszxqVKo7ZC/NfF0xQaKMQvaXuRtvI8nnDP+w3+YizaB1rbGbM4eJ2hStEOhGo3uPtEB3uk
 PJna5BS/8CdiY3EFolWL6kg2XMe7QT8mIieyTheQAbM4kIE6m4qd6T+goe10KMJAcND4PZCANKM
 PEF8KLy5+xVIFJj+nyNepsWESsm2anApZHqihPBl21IIF1jDNVgGszydbhlT46eZ82TEMK0ZQv6
 ISAYEp6pVELdpgRTq9Lk8ePkCmAP7vHsUY/vtHpQ97ZY1h9NbnzqS0UJPyHpta4J7vl+9337lwe
 ITe7XoR5VpD0SyZaKb2jS4bX7Flndws3Oet3GEGMrjQ5aBS1TwoNvsQrZ3QVOMOZu8JM11d5nxj
 iBP2L+mshvTGJhkM3fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:19=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > Does this error path miss an IOTLB flush?
>
> Yes. msm_iommu_pagetable_unmap() called iommu_flush_iotlb_all() after
> rollback. __do_map() now calls __do_unmap() directly and loses that
> flush.
>
> An arm64 QEMU/SMMUv3 test:
>
> - mapped one 4 KiB page,
> - hit -EEXIST on the second page, and
> - verified that rollback removed the first PTE.
>
> No stale translation was observed because the device had not accessed
> the mapping. This tested the low-level IOMMU sequence, not the MSM driver
> or Qualcomm hardware.
>
> Restoring iommu_flush_iotlb_all() on this error path preserves the old
> behavior.

I have a fixup, but haven't sent a v2 yet.. current series is still
enough to verify whether there is more work needed on older
pre-arm-smmu hw or not

BR,
-R
