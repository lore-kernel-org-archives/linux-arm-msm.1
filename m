Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683F3DBD5E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921843; cv=none; b=ItNojUAeB4yTuCVyPOuG2Y4uH778VAaiPxmtsT3fnWYbSzkrIhGj4pv9agMSfNsu/CKx8K+FrTtIzGItz4Xn71KSy42tIjwnXTxQFVMhIGzO3xB9wl6dhqwFAGBy6KuUH8AG5hS3nifrdrv1b9Yu2T+ZWAU9bPN5vdfYIEZ4E90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921843; c=relaxed/simple;
	bh=ru+yAHr3urcJ5M8KBNo1D5Vm86Tk1kQzSSNlmFlhCdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqUbaVeMHhVEiZTiQ7qKqjeeDyq1mEq1yX+HDFyDuSBQj8EDpR9gD0D/oyO/CeSeG9kUm8zzN3K7pE7+EuZkTYiPdcFXc4cD4DG6hjZmIIG5vaOpGUnXungFKwMzLX6VAIt/vc02Ucecjje91L7cGns3jdeZ0iSOFdaQe32FkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCvK7way; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgNlc6T7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCvK7way";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgNlc6T7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Hoi2167535
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6mztBACuCG3RrcAN2JymhhQd
	msNbc5JG/TyNTdYCnpg=; b=dCvK7wayBREnZu+c26O85FnFRAduOdGhC+fgLPGr
	qWF2BCp8eMYP4UEvj7wyOZf4PxYQYOq7mWqUFnYlCRKTgj+2iSRkPrUZKszZCVVi
	2P5LtdddbCogNWmVLUh5zJMGkgdysU23qY8ti5Mv+y6qhkVlmvOlJQHfob/AD7R5
	v76WDqzPFinCPkfUU0wRaKWuKDYvXlpjRZo2Gkrnw08xKVU60zfJHBMcCFsBQ/qf
	PKKuH0413SrI2k0ft4h7FJ1MkzJcgSWIZsoow1ZKM3iBhNpIts3cOPr7odQK6lad
	uuoMjtooxruBBe+y19UPcjVUHxlchXunpF46x0F1iyJhSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h01282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:57:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce64c41efso18141311cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921841; x=1788526641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=DgNlc6T7kRoDtf0fPeS1XmEdNwWDV4l8bj7DTSVI2nCkBA1i1TrhNLb8sG8TOO7Qos
         4Xc8W9Ao/xaQ8VhchtRp3JqFVE4cVsMYGmONY7u+Ss3dGIjpiBjkKLoyuYVOnOBVGf29
         N9lG9gZ5qyLGvf4ncbLMsG+dPq+aAbYo3ULl83sTwmzuNlyvchLZmFuBT50oOmXIDkMB
         IJskcCoY4jZSqd7pC7m2QuOb1Pjvb0FN/qVe1UKfrh1Qu8HYfygqJUSRM2GIQCnvobl7
         gVQniLUlh5BxKSR7sH7A0kts41J1jehV4ktSnQ4IOeAYdrEB2gOPmhaDVTgos2P1cHOJ
         s/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921841; x=1788526641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=ksMYglIYIcG/Slvg76pBwva+IIn8PNosjzkTJdBrpyyeUBEJdcAZnV4UhM0K+6VAEE
         QfW6jJlBsGvfCwU0BE8Wh2U4RLxOil1CslPCjonCaqa53M5hnI9nVcAAXvm0rIvJxEif
         QTNNWgeBedpJ44P4k7rVqkH4z8QlxsvlUu7YTxnjewX4PeCJ4rySOBxTGYPaVy/hfh0M
         /WhmpQnbZx9C8zRFGC2z+k9idZcRGTgs7OgyMD02mmAAkZuQ9n2rxTR8FZ0Y2rxuYQOu
         moDnrziC69apUNJM2a0EMa0gqZL6qGlrFa27IcrME8zVnZWhmBdl04g2N4AqqBr+TfF4
         kXPg==
X-Forwarded-Encrypted: i=1; AHgh+RphSDwOHEnoRh6L983xa4IUbkV8AtY/23pC1MqKgEhGArn9b/8oVmuPxIsxoyAyQkPOAffZTGTDAPDGYeR+@vger.kernel.org
X-Gm-Message-State: AFuF++njdUlgw2LfX3UU6dnhEVBeAL2Lp2Y98RK/jdmwMTNgakZGCDUP
	17TKTXiPGITbZz2WLCAZ9jz/EtslEugwcnOqR4A2FoSBGZH6ydQu1ByzOBVAlWN27g71/QNbLVI
	KxaSy6BKlMHLJTHTYY5RKYdTxhgmBB1u/bHOwRC93vo9KuJMByU7Gyfoiv5kcKWoNao9A
X-Gm-Gg: AR+sD10ECaSXV7nXS/8chGfe6qpUfeCwEtdIsxQQHL1J3XbEUMP3qtb1iLHzdyahHx5
	bJLse9eshYFQFoHuD1CHldpKFSVvU3rPh6NQPvVnuUiowfbJGexb2DU1vaDdvLigeqgFCpB+7Fi
	pu3mstZSUUBPHTl6I+aMAa52Ql+flNRkadpD4lLBXCwBgQv/i9tDd1qCc5kmeI1eAE9C+6mtAvB
	9U8wkNv3ZEdAGssEnjMBX2G32N0dKptLM9wOQMTn8BXYg48p/5GDWkQGNMKv0ZQ0lKdE31glRtP
	pJGapN9XwUKNiN5W0fOlC8RCiRhx0QisXRVLAzMT41sWgDMQdU0va/zJKzKkBn2Z7ei/4TZhoL1
	x2DBoYeP86SBr
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332591cf.23.1787921840523;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332171cf.23.1787921840006;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac8e61sm3986925f8f.13.2026.08.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:57:18 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:57:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Message-ID: <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
X-Proofpoint-GUID: x4NBV6UpKt_qUx3dSe9vPLhG3_Z8r3Fe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfX37e+OTXIImrm
 0EenY5lk6YQGFGe2XTIFgMXfZVhbzhO+7VdwH/mmHi4b8dvjhbZE5hqUKZEA2LrH58vn9ECxBeF
 6Iuc7S6UQ9HepJhsp/8tRxtGPulRBSo=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9185b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OvFCWnAnuTFQFf3-HNEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x4NBV6UpKt_qUx3dSe9vPLhG3_Z8r3Fe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfX9oxLp8FPtUcP
 16lh8v6RpUIOLhWsa1BDdM7EX1CCLqcrAqw0Ql5s6cz/iMyX4DnYYnEhpwx+CQxKtF7x3k/nIdB
 27wNuV+5vQ47yDDepjGwWs0rGGRInIXZgEiLVB+g8ZzEYdkN1Cy1Qw8eI1W9BrMLFGYQInT8DFY
 uQ1YLWYNHuK5VIVEi/RUEhqMYFtJrS/i8x7jhC3sf8V/2Xt6HNp4LRyBy9A0AVWpFa8wZ3oRVpj
 xYBPKwsluTA+NgElAnEct6S3CGVxdpimgRLLJ/aXaMQ6zyDq+1hzZh6RD51iW51bu0h7PHUH50e
 tuoZoDR1mbdEzkJsEgF4NOpAEgVcN3gXBC+pMbSpsUJZePUvfE3GMWCvvUTJ+2C+GxElQyrVHwE
 0bzJrfz63+dvlleQJhdnHf6Ag1gOjWGkcc+egYqwXT/g59XmfgkWpyxcUc5YrjhxQgaIwG6HRnX
 pBmO44x0Dua4MVqkZEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280112

On 26-06-30 13:25:13, Konrad Dybcio wrote:
> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
> >> qcom_ice_probe()
> >>   -> qcom_ice_create()
> >>     -> devm_clk_get_optional_enabled()
> >>
> >> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
> >> I believe this is no longer an issue
> > 
> > I see your point.
> > devm_clk_get_optional_enabled turns clocks on, whereas using
> > devm_clk_get_optioanl will only get handle but don't enable clock.
> > Please note, clocks are needed at probe to read ice hw version 
> 
> Right, but we don't need them afterwards in the probe function. We
> can simply gate them. There's a parallel effort to enable runtime PM
> in the driver:
> 
> https://lore.kernel.org/linux-arm-msm/20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com/
> 
> and with that all you'd need after getting the clock is a
> pm_runtime_resume_and_get() before the version check, followed by a
> pm_runtime_put() right after it
> 
> 
> > and then
> > later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
> > suspend/resume path.
> > 
> > But my idea is, if storage itself isn't there(like sdhc on
> > qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
> > version? as there's no significance in even probing ice.
> 
> On the developer/customer experience side, would you expect having to
> manually enable what's essentially a sub-feature of the storage media
> on every single board?

Wait, don't we do that for display nodes anyway ?

Also there might be a case where you just don't want the ICE enabled.

So I suggest we disable the ICE by default and enable it only on boards
where there is a consumer.

We don't normally leave stuff enabled just because runtime PM will
disabled it for us.
