Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABB43CECF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674064; cv=none; b=IrYN84U6cCAgU6w5eG4iX+B8lRKovVZpStneh50MqdYYBGEWVFtc78/a+RVlTqj1KnNmdH2GpJUan3Kc1GxZ8nF7cjvllbPdCx8xTcdz13wwkKStHhxxTXY6sqUGDjPkOg8FILGFGWFr439QzOex1zLnVDxtGNWnWaHk3ExISDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674064; c=relaxed/simple;
	bh=KZ8jPzlr32ub1331C7LBmux3+jAzFbNlWFyK42tUhFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4WhMa9AUOgvsFdo2XWNWaTZ8kqe9v/5sM/XhbYWkUJcTcdx+XOhna3xllj6s+TsxCCeCK5JMDqi/ZHhANSfS6GgOCN3aG0nWT9Gnl3jbRT+w3LKi8cNiMn60h/d+SwLQS8G8acUO2u23i8pMA6XRCvFvFdHZKeenCUMZTnaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4/qQOuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlLWCG1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4/qQOuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlLWCG1d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZZaT3196653
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZVRt+INxjSHKZ1UIV6a4RAoD
	Al3Kyyh9gvcFPMDgkLE=; b=O4/qQOuKkGRyWh0fTs/B5ziOHMwa58TywTfbajkG
	v4251LhcM8CfeToBoDB8gz1fBUO1yXpp5l+4xCIr5JPzQ9+NueO3eFVE/Ks43JFJ
	BL0z+SmfwCoGjY3X4ZQWQ7JWBUngFGGeJt49phcjjr4WPlEOJ+9+11hZgmCWrbMV
	GRUzN1ED8H38OfOgbRvfmIu57+AEIrM7tuAgIyzAB4hNwP7haPG/1bpI11vD/9Hj
	cJOo/9bbO2XMgiqZp4nOneJved0iGVjyrCol9smkSG+GH+Yy40nnOTcLcLF1eSXQ
	Xe4ZO++XwkOSPOp1cI3vUdMdIzbqKE1v2bPuyQz2qx/Iiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863crf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:47:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso121757241cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674059; x=1785278859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=FlLWCG1dLpRwG7SmsVkP7Lic5nC9RG6jn+ig0JQTcnrfQs77ml3ZwCcDZwkUe8J4wL
         /rOKdVRpT8GVfQUxQHnZHcLi9+DBZaSBzIWSufLMV7QSyAQ5cJ7TBh1zmv5/gjrs28VG
         TaVaCNuPSrHbYTReu07eeWOF7pXCvjYKBbG8OaJXVY1KruP/7nZA0lsCAanYqpdiRVEu
         hRpDPC5LDim5aGymU1pghPeO+KZ1hYAnJbRR5qMxMNXw3hsBPbFOcawFosHdN2q9HFf9
         sjU54yRxkweJXcBSDLUr0VJQeuVjzFZWHxAdaRmuhQLrfuvw83BxrnMQmue9Hfh0KgHC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674059; x=1785278859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=Ca+3j1j4wcA3ufPEvisnBpbRd3p/toU/6SyEyDulNsay08LaChUeHlHUuQrLszep9q
         p87hTpODQPnHaaQ3deniqx83tbrE6qWGG6fnKPfuyB9uUjWjCBxxLUtxjq8KO1rYNEuF
         cCmT2XEu3gqGkhCItsAh2RGjsAfOvzVLqVQbsZu+ssVKxnxpfcimUSDROhJyL9IQ4x8D
         JhLB4ADkHio3CN3xtZd0FYfwdT7EgSYcJV4vwm6UtKjviNbH7APEjiSor88DXycdPGwS
         e9SrDFONUZxLDTmRTCwk5Fj2dNDFlsIQ9w1aFx++nlu4tqicvZ+PjlpFsNLDrOshYZHe
         hALw==
X-Forwarded-Encrypted: i=1; AHgh+RpiXj0XbkLBxe3iBR9X16F3CXoE4c9mg6vXRvUP3cz9Y29TFQfgCtykh4QpZ0Pa9Ax3vFHsL3C0IEoW1m4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+K0i5lzrWzQWOWeI6KM98DByGHL6Ir129n8gSOY7hWQIDrYo
	OuhxJv2/CGVm0Hby60jfqXKBlKyzyNUcu1UuLh8coYgiptbyxqfy0FWhyYVGPL/klwJD8uFlDXr
	+oDGJxzhxQdm30fc5jFeTks4IaqU0Ub9IqYjGQVQCvc68bkwUkM6czGd1q1vY4iCjo2Ce
X-Gm-Gg: AfdE7cm/HOxNgtw9uvJbkfgLZCpUMvdRzu0MJL7Igxj4sjHFYo/gdSAZ8wKSQHpI6PE
	CIl/a02OqgG8dMRcrYaMubketTSwZqZW84ZamA+xMrhV4cvhRKHhdEqdljbm42EuGb9iBa1DSsz
	Y31uht0f3X/7KvcGQGeC2+HIwamC2YMvtO+2/gvtHRVKHkIzF+L5VXiy/Hm2eG2TaViC/PGV+br
	iqdbEOt/dMu0qkPHulw0m/BoEDkJxxXov5VCzX5ljP+Z8hpKy16fPLn+OJpZjBbrFhwkeOVaqGn
	nPMiXeuIOTnxkFYi2P8diZXQxRU19cYHPTcjv6F15OQG2ZFJTkM/oOqQGkCfyr+e7WHTOozDj0A
	zk8YPfNq5V4isnwHhLlo0vNZE2dwy7gos9FPjkzFJaQD1Ydhu/LMbCKczcjqelTY1mD2uH7f6eN
	kf34FLRcHu0KQnmQ==
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832611cf.12.1784674059312;
        Tue, 21 Jul 2026 15:47:39 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832471cf.12.1784674058899;
        Tue, 21 Jul 2026 15:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm146804e87.45.2026.07.21.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:47:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <j2oyolcgxtka734fn6fmv2fk7em6zkmrvkivihtldbbllmy4co@eh742ign7i6q>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX2mB5zAOO3bh/
 qlrnh5v8mW5dOvRKkN2OCUrd9IPr/13WW3laYWAWFkGZz5Vxh3JtaBboHZq9luTgBgrpb7B6EbE
 0QzuuEgmzDQYHSoQu1Y5IQfEdQLjMaE=
X-Proofpoint-ORIG-GUID: 8jSngFbrkLmktuVAOr8KVYEpO_cqHTzR
X-Proofpoint-GUID: 8jSngFbrkLmktuVAOr8KVYEpO_cqHTzR
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5ff70b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=0cGqrpNjlybS6BQeJRMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX6uxRF582nl+T
 vlG8qABSJvoW767oWYEU2WqdcFXwAMKBzoPM+mAQfXj531A/J5ENBtCd1HkQiVOlv6mXSJNHlwz
 Gy8k++XhclQNo2twnCKRdeVigaBF2vA9iiunUk9+NA7M8QBFNBEbeDFEVxddJTtYn9xP621Zk9U
 SXOS0xLzL22qEtJ1jQJcRTFv6X+sq6SFpxDEebRiAzTn2HBvrHzlrgvPayJN8m5J2sel0HuN602
 yK7cv5l+7yt1ATCrwlY5hY2SLlR6nyXXxK0j+liLIKI1v8W2Tj5FwmhJtliwyDiL3aM8Tqjob8g
 yTKJaRTEBvv28FHgNugGwjszggCCqOIYaDZk/uEyqKC0T0y/bjK8IZ4KjemYyI6d/X4R40Y6ywS
 A876YUNeRofiSexQVDImVcCp3yC064Cq7dUPsNRnYPpY2hGTgNs+OLsQHu27u3zOIsi3gJ/wd0s
 Y8JDRBX1iBB/0HVFUqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210235

On Wed, Jul 15, 2026 at 03:06:56AM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> Since SM8475 uses a v1 PLL, add and use v1 PLL tables as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)

With the v1 mentions being removed, LGTM.

-- 
With best wishes
Dmitry
