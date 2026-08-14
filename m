Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E8476697
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718226; cv=none; b=s4rcT4ozp+AbP2FaHjm+UqfB9DUry2x4HQwe6BEAdYyGJpImMRAg9KMD78Qie5mpXXxu4aUTh9KWkLw7MKxJXCl6v4hpRByFUGMD6z8yJFO15+LX12iZGqz44keGDkRk9U2xE6sEFlPf1GLn+PAkU3aK59vyUYgsb7suAukVSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718226; c=relaxed/simple;
	bh=TBZnFKfa+kb7VN3/hihNTcK2yQd4hVrAu3/Y0tr3uRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB20BtSFo/ggER3JbXe/dYPzMSDx9TS/nvFm8iZ3xBabMvKo8nAYq+xIfG/+/PYo5gJ0/XYS2nntvIAf03OCgSev5bBZ+XWyQ8rvEH9UKwhm+NK8PmqMOqR83oBwKptcdyOGVaS+KKb/fHWZ20jVSmC/kOclUAFJ08uwKWWA54Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JT0tjnTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJkQxOaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JT0tjnTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJkQxOaf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxMal1505885
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6dR0LgW9NvqKnuim+dpko9a
	TKhI2c01MoDNn4yRQwM=; b=JT0tjnTOhmBQdgVrOYS7O2ATlz9Cdl9pP8KdPbJz
	ZbH0OMTKaWp7kQkPPzw1cj0J1zV1sPfQLGoCsg1OsuB4nHLrpQ9/dmYC9sEkInWw
	snHScmpeN6R58teksUyVMEKgSv6FjT4Aoxv2Tz5bwwp/zjiGfZJxzn9eM5aH/wvN
	ngCevUvhye7ZAtqYWbRvAmUIkoT7gt/MPLT9YM/quFeIsw3bjv7BJlRr8oLf2giJ
	PWH1d27KXAcejgxjlVCic46+t1izYQTwX5LhPndTSHRH6cwn+4j/igNvxiJzIdiT
	lRe7AC61gd4UjYfLwUkTaN3WaPJrN3EIUDqz8M60pUwe7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8ptb07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:36:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso16711421cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718214; x=1787323014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6dR0LgW9NvqKnuim+dpko9aTKhI2c01MoDNn4yRQwM=;
        b=kJkQxOafP0YTdN5n5VZPR5vcJ3lGDPneOnrpHMm1pxnCm8BE/SI/0dnqvIWjHP9elN
         v6b563Kwi+9hdBrBd2MTTq7W47ACrlaoodf5t1zwhoX/JRF7TBLdAXFxPZlcD0E4IkBp
         1qi58BemXgUMTViP/e6mZF9MjBpSuHBdAKfycDKKAMuTNkBGEqRCS3mo90uDKjY8XvKY
         oacvxk5rcaP57RJ9jamMnL1UNI1lsScMHqfIG8nTKUrNdthuC61CA5HL/ZIgEXCChvV6
         PTyFzEEOSJwpA6VExR4TMCsqkH/ga8crRytC3ELNteB9birSmF7x7RBUSwGo6ja3Xxcz
         04dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718214; x=1787323014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6dR0LgW9NvqKnuim+dpko9aTKhI2c01MoDNn4yRQwM=;
        b=GAVNtwv0YbJInAC1x2Ur6Wh97ybQboDEt1aM5d9z10mb+A1kDyv+Hj89Mhsjc1+1F9
         Tep2VFT9HOxXTd5mC96kvTWuUgq8mCDgn5vn+O7Bddq00XNA6B9xtwUliEgqagzoHyZK
         f/4f11pdjZnNsscM6yIbw8CHUo7AsMCFz5mwd6H4WkzGzmuD3tzDaqzcx5nnBdXnq8Ph
         /N8X1TWzxVrHhkbr6ByCYHplbjSyveZ1dJSGpNFqfvYNmr4l2IIxYr/K1auyvCNObP/a
         O8dQAgwdmEPDJ1JBbwMliwz1nj0SNbNK0mZSIutKyvarCe27x2pHsA04Vgl1A83JpowR
         Vf3g==
X-Forwarded-Encrypted: i=1; AHgh+Rp6FCFtTwgl2Jf7DeQ2nfWXX9e8pU25dtENgBO1gsMVI0cg2juqhm4+bTg4tbwzWf6G26KSMlQBxjJUMfLt@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKfYVvD0NMIPuYNDTKaHrOIkJ0d/w7zGsCtc3tU1rPST/DHFm
	lSFSrlHAn+ClI4yiNRg9tJc5TbtIHO6yuXO5blkC6sBGszAqd/3pHr8svNDBsx2pyUYPPjpCR/p
	fIPXut23MWJT515OVz4p+NAwJm5F77SbfKCNES6yWPHdEm4bl2MoriYe6LkHgomHyJmXh
X-Gm-Gg: AR+sD11zlDAb+A9A7P8nQyR0SeUZmVERnEktNTfzOsvK/HHOCHhIZ9G/p+f3L2yeoEC
	szthTJmT9SFb8QiimXVa1NytvN1/gV/svVKdJNuz03ahwH4IhPpSQHiMDXfmUAFkHf7Ora1yEtI
	ZAyjG5mx5SJPnWALW7povnpjXJMFh4E+5zGPxqZ0JO+5tPw/ZQG5nSSjK69rmq4HDQztqhw2CC8
	Qld07/zvZdD3ZOS/z2/7Lx1P3kMjUuHTiMkPcfUfaFQgmgb87nCHDaFXP4bOdZjV3ui2fYurJfe
	drFwMCS0VIZvPQ/HTCKypsq0NvG7Ohl1BKebWIlsUuL4AWFlWJcLNau6iwW/YjkoL8o9+VB+PZH
	hsTQBTt3VEpxK24EHV1GWDlCS96b6Vd1OO9UYcS7Vt/Fpg1KG8cCiJZmvhmc4yGmLkk/fQweCkD
	iTFv63pONyEYeG
X-Received: by 2002:a05:622a:1aaa:b0:51c:1d67:379 with SMTP id d75a77b69052e-52d854390aamr68465511cf.23.1786718213704;
        Fri, 14 Aug 2026 07:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:51c:1d67:379 with SMTP id d75a77b69052e-52d854390aamr68464401cf.23.1786718212874;
        Fri, 14 Aug 2026 07:36:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b3eb0esm595885e87.0.2026.08.14.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:36:51 -0700 (PDT)
Date: Fri, 14 Aug 2026 17:36:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Message-ID: <wkewemdeuqadlke3taanexambmzput4midbm5mlmafz6d7dhty@djmrwd7lzmty>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-2-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814141724.1006382-2-daniel.baluta@nxp.com>
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7f2807 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=qCMfp5iw1hmu5WYrWjYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfX+oO3gHrsBUyK
 JJjU2e8/a2JlcL3HRi/uCLNrGd1dh1td2ZEOPpdpKZvvWB/RFSGwHFR2Ms0/Q/jjKxJvRWwnzNq
 cfTOgEXNMlvfwV3eh9N9qFM4HgQKuCUyF5yDRFemLoeGvJ18T+gyCYvA/Zr7Xnq/0K7SzoCxAM2
 NDEDzGS7d+u+0HcdI8s4l9RwvE7GYDzkpMW7QSG0ZtYBjUF3Bojv0gUW4Ks1ziNl6oFAvUiS9jT
 Uzvm5ceVS3DdaeLd7AbF0BkiqilKDN16XevDMcie8yf5JZeS7VCza0KxWsF0wATFWSWtA4EMiY0
 N7MOXLTz4thhOxK89Wz5cW/cm8Yev+5f8h4echJT40YUfR9xqxbRx32q2jsMwqhZ50cNFK6ouPZ
 5d1QJ/cbK6OeR/oFvMS4aLO9X/WZ+lsQJQTJ//t0NWCk6hCbj2skG6G2YOG6PdYisF4jluH0Ucx
 xWITaWoaqEvRhBgaFrQ==
X-Proofpoint-GUID: 6tkuqmLB5rwqEMi855j4LO-xLsJw5w_9
X-Proofpoint-ORIG-GUID: 6tkuqmLB5rwqEMi855j4LO-xLsJw5w_9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfX9+urHJTk+159
 TuHRkYWdqfqE4hhrWprq6qMdh0oKUHMpTqIUlQCSamlUaHieJeGyq4HjT7uvgSlUAiGG9XGoyKE
 Ar8VKx3KqSC4KYoNBKr7XamO0ucFx6M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140111

On Fri, Aug 14, 2026 at 05:17:22PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
> select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
