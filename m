Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38F41A91E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962464; cv=none; b=IBEZQE6NZmdNgZ5Sh0GSp2Xn68IpI6XpzWQFdxzkFtvhAcdEyxZAN+CEjxjmiWipQ5HJRzNWkNQzMjzHiyF+SHsk8qFX1F9oBQrLD/K7jCi1aJ7ULDabYcmrVis811srDUGEXaVzCQzJfrAx8S2fcuZZoTX2Kr7153AN44gKkPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962464; c=relaxed/simple;
	bh=dJv04GCBfv9Q9OqQCW/KCpqg3mnXeg8ey1h8IgH3AvE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r7FaoRxEwtDACy/aAkt46duhxlmmkGpbygEFesgn83BnySLZmDK1tbIxSMsz6RhjAptBwkxc70PjOSc0MqKbPhGGVAr4qBogiynE+6Qtb0H8Mx1WgcDgNw3Fg14k2YrmgHPdI7AfmTJzDq+x5dcmSuLvK7IjdsN7jw7IGx8rR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrazKw40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e96y2sQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrazKw40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e96y2sQ0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hRj2685286
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=; b=IrazKw401apH70ng
	ZG35AdfkadcMTRiGauT8oOeMipmvv6JiHOVgf4rc/iIBJW7AaLk8EJUr2hSFIT5n
	NPIXUW3/lcDwy5JMCSz0QGRv41mmm5qbMHamE/PYG1MfR2gEQlKhem0ckYhB0c1r
	AxxDqa0IgcArLWECWVtYgjsJn8sXzc84b2AasxCFuBgfsPp/xTTLCiDDAxNUulHf
	eYQjLBi1AmpkieaF+uja4aO78qH5PnqRWZJ1cTyokXnLSyJ1r+n9OWp+kAcm/gEL
	fr5l/aAxVfUEPeeKI7nttH5nnzTa9hrkP+DPGeLPcIcJalNUrH9Gd2RmkqyDK4CU
	fGsd1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u09cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:21:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a813204f87so80034a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962462; x=1792567262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=e96y2sQ0uT8AltmlRQ91JCzfjCfUzmpZ7ZNrMimJUj3sHXew3JpfcCSJt6RGTPMYVD
         gQTE6zdsEGuPCOvq3CjFsHES3bl2zlLqOJX6SHw+yBMfLOA2dH0E0qvxfV0zfjA6h+ze
         J8GfM3J8pfj4z2iY6h0JjRYpAUK0bhog1/DpfAtuuUXmCViDMB+gesZLIHQ0QQ7cbq/y
         542MeJTaT0PvTTklxa/uS4iasNckk79jqr5Z+kR7ySBVm9Pb8mNRr46rY8cEpcSK0Foa
         CU/l/4zh6NaLYS37+npq++3YAySbYxpKu93t+27x2HhGj55/LSkXxKFF8Ygp82nzCtz4
         qHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962462; x=1792567262;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m2/P44n+1lUk9jmbr0HgeEa8ci+GuUp5mLQUxQ+IiQ=;
        b=x8+OFiV5TGvt8U4Wl4rP2fl7LrA1pUEOVgcYFPwqN77OVZpCKT69DUQhSawi42guqP
         PmmZuqpgzV2HqBq025MXD72OvCCPrDuUZU6cwjfRc6wXAVJljSWcbmzkWEU6oKK9VhHA
         HPKSkF4Ojd0j3Iy0JFuuteSP7mxlXn8PJbVbZVN8qfRcBFm6GlQxRcno2yJwraesk4+9
         JgCyL1Z2BkDS5suWjkJ3m6ZFDIRNJkHHXm1X9SxfVpIlDXEEhlR+JjiMZDNADqRF4pHf
         QSUPz0+hvQMozJYJ8bQudhL/WkdkTxL2Tesu2ndMTO5+VBUK3dISXrDGctW4U6QsXP2p
         jHuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmIwEAaC/xug4yjazhFXFS0z4QUn2lP08gRwStWRSIO/QY6nXvB2WYHKsTwfjVuVsNoGZ3oXw+eKodflmf@vger.kernel.org
X-Gm-Message-State: AFq9FYLjASQMTsfDkxIqq/FjRQR5hj0hJTDg7zir50UQjEAEcih36A79
	JzZ5SmghbCGNwlrjZXnprw9vWteEBy2dh/aSas19u4rcNqldb9QFeJAPoA+ZoQ+tkzXh8u5WXEw
	FwrEqWeoMiCvcNnUGmw3KGFZT4gJpwvgqg3sYkp9I2wehmiPH2bL2C5tp2jrbZ2QqaZ6q
X-Gm-Gg: AYBFou3jmCATKNnpEBhdxhcEaPDXzvakdmygyw3zj4480ndB6dc5Blz5sQLl/LjHdrf
	5kwu2/6yx7XeAMdn6dm/CQs/+Cjh6/eu8JDQV8wKiC1A4SpLNj5xzr5Ons4MfYqV/cgSODC/wWA
	ay1rtiubzGU1Kf1LJj4sCZh9DzoGbDkTljsAhFIIZZN8R9yvDQkkzHqQkEbNjeBGEv22QnYrrXu
	nnSiYpNk4Jc7nDI4GZusmt2pj5QhjZz0TU9KS6G87tFH+PlkZfq/nwTh7Pklo4RocI/rZ55n57y
	rFlvnkifkHJZy7P/fmA4PEGOSF4qOTd0KPZfEwX3Wu9WSHDWbi5JZwLbn2Bh2AsdkRImubiGuSt
	C5iI38hONLZXFJVMbkKYeEXblYeL/YHY9CbjV4jvwlVFv4h76HJOU+gNhrj8FCESHYQ==
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528242a91.50.1791962461342;
        Wed, 14 Oct 2026 00:21:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr12528187a91.50.1791962460699;
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm3549219a91.7.2026.10.14.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:21:00 -0700 (PDT)
Message-ID: <56401e91-6d8e-4489-ab34-ee25af031a74@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:20:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table access
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com, horms@kernel.org,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com
References: <20261011-qcom_ipq5424_ppe-v2-2-8c7b057e2c43@oss.qualcomm.com>
 <179181020968.434549.112728167970187942@kernel.org>
Content-Language: en-US
In-Reply-To: <179181020968.434549.112728167970187942@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX/y+v0YJmZiHP
 kKGuf6wr6CdaFQ51/1v4M1RpA+GsWREDUEg42+j4+Rh8G9jvpjMR8P5gbIvfwGk4TM/r+g3Tg1a
 LXJKEtVh1pscpeFmHwmKaVNyOckCjwo=
X-Proofpoint-GUID: xui7KOfjb67IaCEDt1Cldo3jUO845C2F
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf2d5e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1_IYofuslNu8jKGPog4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX1YgCVBcxV2sY
 lTNCHAY1WDBY6949g58gq58E4CFiHs9SexLTiJnsqkiwswmKOvvvpZsXSluVQWfRXFrbnIFe1tb
 NCPnJwHnAAEuaJzJm/+HfIqeagpfy/oUBACVozOn+uEMTVHrl+o8mDf16bXO2OVKQUpNF0wtwlY
 CHu2NMBDW+CE8LknZHy0HJPrZa1aV3dvFVc/YkW0RhlVovaM0m4y0IdHczWkQ8NMNSLJf1IQbgm
 hU20Eij+DWyJ2wIKZw2Twj06JD6UYnDvubERhB3zK85PlGbwvwYIVmqaNRrPMdxbMMErBGONvPP
 9O4VnUSRGlCS1R+9zqYnDPU/Z2ueSegc4Xa6mwmQnd86f7VEzj7Fh+jK1+hfDSadAzQLJ9rdYfY
 4+cn3x9rSyRcFMpmd4EVojcVGGoXN69ZoqThV3K3bCp+v4b3eW550BrzaRPPxII7KuJE362k8FU
 H6G9kkILsDq1ykjIyuQ==
X-Proofpoint-ORIG-GUID: xui7KOfjb67IaCEDt1Cldo3jUO845C2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140029



On 10/12/2026 9:03 PM, netdev-bot+sashiko@kernel.org wrote:
>> Fix it by converting the queue ID to the index of the multicast queue
>> configuration table and accessing only the 3 words of the entry.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> [Severity: Low]
> Should this have a Fixes: tag? Commit 806268dc7efd added both the
> multicast_queue_cfg[5] declaration and the absolute queue_id indexing:
> 
> Fixes: 806268dc7efd ("net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574")
> 
> ipq9574_ppe_qm_queue_config[] covers multicast queues 256 to 299. That
> means kernels which already have the IPQ9574 PPE QM code take the broken
> else branch in ppe_config_qm() on every probe.
> 
> Since this fixes code that is already merged, could it be sent on its
> own to net with the Fixes: tag, rather than as part of the IPQ5424
> series?

The IPQ5424 QM configuration in this series depends on this fix. The
issue is only theoretical: it was found by code inspection, and no
user has reported it. So we would like to keep this patch in this series
for net-next, without the Fixes: tag.
