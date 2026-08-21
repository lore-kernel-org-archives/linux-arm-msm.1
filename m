Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406A4746CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307260; cv=none; b=bT52VAIPxxKVsxW91//KjHE+5KNZBvHsQZbuk8hZ+nQfzI5uKV/smgigQmnYDjRnrRAIotflQdVefKQCdOMYClm3zDDkaoo+PjzR7YnLfC59DL9VfvQMVPLtqF55+WG9zrW7L0SnpM+I14AL4MpgQ+wcvJWU+r3pc65ntT64iC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307260; c=relaxed/simple;
	bh=ogCP2A4PXSgYixCatTUIw3PNEyUgcCxbSFOAxmJM2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erPjTlmHyAQvud/IHw94KldppTtiB5CZgT1aK34ZOU+kQe82m6HHONDd0VxrYLjG50V+S1KvqTamWb7Y1P6Mp2Saxr+ZGBXOzXjcxv+WPE1ydHkSaMUxr2D1SaleOoh7LBBa4lhVUD96ihZP7lmBkHpmEe13RmK8AJoSiIlocmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ah5FHfDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDKR5UlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ah5FHfDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDKR5UlW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LxNv789836
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnYVTMkS+WWlkVK3zBqZDkx8
	gQZG7fuc4gpwBwK4/PM=; b=ah5FHfDfgf5DXF/hSIAUdVtDDBG7XH2AHqlBaQ9x
	3i84OwumBXM/po6PlTt2oZXDe8OGtrJoVZSMsJ8V9/zjS5qVavqt7al6CZoEemN4
	+8qey16CJ52DEx2uYWF97GdrNR2eO+LUjzq7/gZ/2M+w+ac1h9doRgN+n7fTGFIf
	+NADrnQRX9PSIOA9s7HDvhnQMIXiLnyzbRq96g46vQdyeh8oFi4QXF4k281ztgLp
	uHaIOgjkAMKzJTOOx4BlA2MSO+3Ntn1p9IJwtHySRCrVnae155PFaLO2nYcy0FWs
	Sid8pUfKrupwJdMnKmPQLQVeFckXf7z4c7Aj0kksOOY42Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebuseq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:14:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce64c41efso14346841cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787307243; x=1787912043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=PDKR5UlWjD+txUMGZXYxg/InNRardcHb0CPhtYcoUvw0wcYrYgyClIMrmhLVo06WqZ
         qyNmaLFGA7+uSVRnXxY2aCUYYoZa/dn1ez/E0c3BjrIDfOvNb3aev2NaXl0RoA1h60Mj
         FD4QKfq7zAvpaL4tR37jYGopfGgWpAT7jEHwJHNyblUTmrnT2DNkccg0eLluUZSLgdKt
         mgtDZHBkqJWdBRO4bsGimhXEnZ3P/CdjTFtT0NV3iloAzecu/oZwDsZhisMAOhTCxS+k
         b7IUJYixyq9qNqu2sjXDmdEWS8WjXALXsOJOt0a81GhuA0YWLQW1Fq339p2E2KMD1B+0
         ap3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307243; x=1787912043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnYVTMkS+WWlkVK3zBqZDkx8gQZG7fuc4gpwBwK4/PM=;
        b=MwyOi/seK1DP38lqJKxcuAGPIPX8fyP7z1x+spvN4gnPdlM4J7Kq5Wu2SY3zeukgdd
         Hpv5sY9UZAYz4KD67x92CPiM8PP40JUy2m3KfppB6YLd0XKRaQd980AdXkWOEmaKjXmq
         dJBscJP1ex978ySW9t+QXzEosc6y8ieCqxvX31jucJ3GR21aI2rTfCgzLw5Tkc2k+eMo
         Fno3Y3uUCJsCpOhdYOvi7U1dZqjHyczevs2N8AyykIIiunS8lV14QuybeM2NKvvDMAEb
         EjKb7MvuL/YQJP6qyULFtrn+WtJW0TXtmyeshIOwa4Pgf/QvRe0RUbUtFJYn1hK/8nzR
         Tgng==
X-Forwarded-Encrypted: i=1; AHgh+Rovw04rrZukxhRNGOW+zKzcyejVigR/imdHGBmpNxaM6UsP+LueZ2s/xMKVXcvauZob4GJUjZw/0grYgywn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6adkCsbPLESCYZBO1fwvAM6tmd24TV9QA52osJzPRrPPv808
	WihsFSIrniCQleCQWT6rGr6xFBubJkdt3Bh3tbc/YyZLsztwXexYWPa9jeCsSnkbQzAUok1SgQp
	hLQj0IGQ1XyzlypOrNBzFsZQfrt1JMCtp/6rzx4QKl1eZ1E3RAVWniXFB28LZVDK31wRF
X-Gm-Gg: AR+sD12OoY8gzVKYDYwqUL1LB2ulyKwauJz5miUJSP/lnRij2DKmnSBCtH5usSTuLMG
	pc1NHKRCsNCthv5lSPlqIX+/YjdeWQ5MV47nqb4VFYSPM7hJIsr3WmUb1PYfEwKOdcWDveagePU
	mWaEXrX8gOvsc/Jl0Y3OpwZvPrbaAlrqn//6myed34wyUeIs9DOMbmtu9NrULttpquEUSEbOSWl
	pnjqgv3JpePL08AUwXFB0PQlrCofsnZZEp0/vvT0gIl5L+hPcEN6Dudq8hhjkAYinOgE26+IZLB
	vimRs7gUDn98AGQP1Y1bJYcbdfctem2rIZD/7tlk/nQc/7Q0LMvkxSgNpttfcrSsMlVx2v35R5a
	B21/i/Ae33RpmknE=
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44018151cf.37.1787307242810;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1452:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52df5a7ae3amr44017741cf.37.1787307242360;
        Fri, 21 Aug 2026 03:14:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm466632966b.20.2026.08.21.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:14:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:13:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org,
        tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Message-ID: <ftucic3bz5kxsamuzryt2l7xeikbbefetslatnx5xvbtvnle6t@adhwu7nxzabd>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
 <20260821081125.4522-3-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081125.4522-3-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: I-Tl0JMIs6nZ0nSsVFwpxtzf1foqTTa9
X-Proofpoint-ORIG-GUID: I-Tl0JMIs6nZ0nSsVFwpxtzf1foqTTa9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfXxtJUvbRxQSgx
 txgNhTxW5jNzosCuEH+NRNNyO6Rues+CzXx3NP7Yz/7WB0seBpNIwS4o118FU2bGiiw4HqCgRKQ
 NVucA1BcNtUgDxVTPsiPIteqGM8toVE=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a8824eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rSoAExJED0QYgwLJ6goA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3NiBTYWx0ZWRfX/R/c1zLOdIrP
 t/Xs2BlpJT7V4U7EW7M1kQjVYscSdJVAW/jbMDikahu7wV190uiHfGCxRQlcDfJcYZUCI2a0AJe
 G7tkppzBsi6pfZcmDCU1xlAMrC+6IDJ6Y4sHxyLmLpmc2PAgn9jv4s+ctEu8+wmNFZxIXsC3AWv
 OccI9VxHklsO8HjB2raMTLZmRGUCbu7dRcy3HtvK3IaCy6+cssgr6ma3q972YMjGaD+rrH+RHXk
 zdyJ+TRs+97olcwU5c7b6ZxtK5trsOui+aV14c8g/vODReSQGKkQ5qZIKnV1uMshRte7rQ74LqH
 fbnUhXnJmsK3LHh1uNblLCnr2SEvKR4N390mNHBTt17sCkHNFC9HM7xIVV+RXC8QJfZT6Cidztg
 1/ubygpSroQkgfCSCplIEhGRXYUEqDjuPfvCGrh8bLjRo17vUJCDOu/K6QHq0AkzVRz/fIPkRSi
 LVbi1/h5rfKu8D7k8cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210076

On 26-08-21 08:11:14, Sreeshankar K wrote:
> Add SoC ID for Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
