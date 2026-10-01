Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003F35BDA4
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820554; cv=none; b=oH5N0FjBGErQXvfEfPTn65qbaUcmVyuZfi5Ol25Nohw/NkvzAlRAZ5Eu7/zbnAOO+och95hxUuRUtEr7ssNM+FF9A/YsT4sZbf7X38BT4LVBcX++gO20M5KPnKUqgVSHPkcD8N081+mdajtYSsrhuC6H3t3Io4fXn0dfXzjyEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820554; c=relaxed/simple;
	bh=0nIt+mucMZ7/0cVviw8vHDoATuFJqqM2lNrKWKWvtn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paPx5fIiR28b1y9puaCfykTfuLpDoGdpXqfa6Mf4cAcoMKaBpOUgo/KdgSXjoq5D0z8qm34PsMHWiOKIqSFwCoqxo9JRPxxAZE1xfHu0iEwvo6hFfWr9208NUyCfpoBduOhYG9logUTDsySZUJ/ieX6rDCcLRph1jpgZ78hWosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZzb4Frw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOSAdlRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZzb4Frw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOSAdlRP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jpVG1140898
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 02:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L7hGipuSz64raDNfiC6PIsng
	qaOE5pky0NmA3MYUwQk=; b=OZzb4FrwPNf2OywrAVYsZB6vxvz3pJi1NNLoQqwk
	RRVfZtXMRG4fgl5MFBRznl0LZAB8iW348pV+5hl3ZWICV2EE4D2lMoNrleAhfjxx
	Z61huDEcHt4gApuk9PXcq1X/tKYDyRqkeOWBVrlH6D6tacmrbTay3eXVzhCuvZ9A
	+8Y/WIODkdC9kSdSlf13JDqf/c4GYqAR797WoeLuOBlqsimiLG9ztHl63/0y5dDy
	5kA6xyGpgh2nRCkfPaRai2hsmOnw4gBcliwLmt0qqhROGXm8m6vxdeZ9YnzEpKBn
	4TPUErMMJs75+Ph2qQwCNYBL0hTNX0E4vnwm6EtO90oslQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkbqpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:09:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so1402408785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790820551; x=1791425351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L7hGipuSz64raDNfiC6PIsngqaOE5pky0NmA3MYUwQk=;
        b=SOSAdlRP80AY5NqDsDsYTF5fuQ/ecORYwTON4DxJWi2rs/PsTvpv82RZ9iKbXhdSNW
         ovwnKSowRwltGkOfaTtCyEopH/h00oZo11SnLlxFPU+GSr+af4UJ0MPSUQkLn3zdmSw7
         QrtO7dWsSMujU9OEbG/s0jt3+/hsb0KmlQAhm59lZWaF5Tw5wCgm2SZwariIaeVKG0UQ
         XcsqSgdKLgeEXhJMAAs2qZAdDuh/MCFrC2LJWp1pTT3NQv55+9B1yYtlrKmXKEyRXjsY
         BVz4jgEHMoPMmeeeJstD7mbHmiiKLtt870JZlmqrcA9DfMZ6rx2nnf+FfUVHiYAro+CI
         U54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820551; x=1791425351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7hGipuSz64raDNfiC6PIsngqaOE5pky0NmA3MYUwQk=;
        b=t7BKQoWvVA4uDyWdo8sNMSbHeHWEOEUuJEqcFrn3993vOeTrvdet3M5PsEZ0/2vV2g
         nPSDavPwTM/wsC3wR/z0RkR5XUFgbtoKNNiH3zozJdZh3JzYyLCzskWp+W8fGFZY/t/g
         Avs9MBicLVz4SnoifucakyHf9VG2oQZiPD3kyATsWWtT2Adabtx8fTnftG6T9CU1uvFH
         4eP68+reShJ3KUb3SIO7t4Wm2hVY3lr1lqnPFSoqiExV693PviYrpygFLKTjXoRIrmG2
         XAdP5rO7paBn9E8mXXGURD6PmWmal7DgHt/q1vVnRDl2P48yR6eQ3c4gUQrsVJpFzof+
         3eyg==
X-Forwarded-Encrypted: i=1; AKwUvBzbNBydcfEg0KZXgRCTw6RDgsz22rigScXfv5nUIHn12h5KsTU/ixR5NzMcBQYqLUNmrLt1Un5JLqFJ5YX/@vger.kernel.org
X-Gm-Message-State: AFuF++n+xcaz5NTEgTmgd09WGogVtDGt8hhacT0tPUAL3j/tf8TlD0aj
	5sbjRwSYlx4tBwQ3RxP8fykkGyRjJomT1l1SrZ6aIyLponEGaRWOtiFrZehedQ0RcdEImAuNMp6
	78v1BNfvkihkcZTJT2c2WiS10ySVv9u0tSpRg1Yt318Gd8LjZkdhZKKLo98uYxtiwTr/s4+qI85
	D5
X-Gm-Gg: AYBFou3obYazCfnSuIIfcoV6ohdIImzJhkbMggkRCltHsp122PDgVcud3CKeWtzOkf1
	OM29HKb5W3ht2i4WKFiHC80VWQ+WXyewcUyluRB+w87cO8pwCKQikOeusXREnDOI3iClSW4Rr73
	WcQequBB0zbIFz9gwdxUewXzq6yt4LA/48toSmPoul7mz/w9oFM6x53xGOymUlBGuHYh2UjmrU1
	4gexO8bIKqcF2CANJnLfJiYvFh1w+Kp5ba+EpdM1SrHg2twreqqbbLXQ4U8jydYLTd8bJW5eIKN
	4yZE4lFkrJoOa/wdInIlauny6GUNFKznxeVsOIkLjJe6jqc0z/H4jAHU9BkVfNHXp99J+t3CdH0
	HhW2XydB9kGDf7aqSbBEVtD1iOULgm8dfp0WslNzusiLosS4dTGd2lPzMGG9jeNMU/4UH4o0Glr
	2TfBS9wFIumwHU
X-Received: by 2002:a05:620a:7085:b0:93c:56a8:a0a1 with SMTP id af79cd13be357-93ca97db266mr609700585a.58.1790820551402;
        Wed, 30 Sep 2026 19:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:93c:56a8:a0a1 with SMTP id af79cd13be357-93ca97db266mr609698785a.58.1790820551043;
        Wed, 30 Sep 2026 19:09:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf388sm348995e87.75.2026.09.30.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:09:08 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:09:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roman Demidov <roman.demidov.nn@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: check pm_runtime_resume_and_get
 during resume
Message-ID: <oitetu2hyrg554hq7gzwfmtardpbaqpsipthukh5mqu4sr2zfu@rkab3aekdzlw>
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
 <20260929142103.81854-2-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929142103.81854-2-roman.demidov.nn@gmail.com>
X-Proofpoint-GUID: cmG5EAmwRfquRc3uVc-LyDNcZW9IMpDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX36VzJ4zK/idI
 Q1e7xEhShoAb3+wFBf6grz+NmYiJAX68oiUGQ8FVwSbWCin+M1acpSSY5+ibS9jCWy698bLiTEG
 ghJY3bHz6ixMAepMuqg3h9nW6grk/eclV9pCkk1vub5xMEfZltTEr73L/gVUZ+g5BTuDojte2U1
 giQWbmUlCPVGMp9ciQiTb1sJ1xIFx02C/sLbs/lLce1kRZ3Ddxs4drabQ+tZHSn8SqHMdL6BNj8
 xW9yZQMLkLby/ewnPAIJ9Bma6Xh+k68kKVdGrmafr09Wwn1OpE3xzKhmXDn4qeK7QbTfMxW9aK9
 BNwYTPa9Ofmdyl6xvrawA3ecyRxl4V8CQSD/HpnHfWmJEWYXAKnKX9WZrNQ/3wNdP55ZFbhYWex
 z9oFUKMP0HRlBrglzXT4iW6qpEHz1gbASwsE8qXwm1//sx5uHo0ZC3s+GIm9BwBwVQFs8PGQzm7
 l3RLsjfpmB3fzE3WtMQ==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdc0c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=HH5vDtPzAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8WuSQyhVeKmarUdqJEgA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwOCBTYWx0ZWRfX8X4h+rNX4q34
 MXM9RkiG8RX4Jx9AvkSa/Ya67Ql15PAxNvCggDtTFAFQNtyVyU+GxEbyrdb8EeV0+Z/4O9ve91r
 WR7S/4L/Ha9enOVugQxadw8DGZ5Zmpw=
X-Proofpoint-ORIG-GUID: cmG5EAmwRfquRc3uVc-LyDNcZW9IMpDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010008

On Tue, Sep 29, 2026 at 05:20:59PM +0300, Roman Demidov wrote:
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume()
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
> 
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
