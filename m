Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F263DB334
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301797; cv=none; b=kds2bCybwG3g7S6J+0gPWgG9nbPTA3nMEwAd4gSOimRqEnCCGGDMhrM+c8C3318X+lR4+4kzZhtMiOGiqQyKNussCtEWxGxczecI1olotshhiZgN0sf+WlYHfnMQmaxhXBaEQHIpkgKK4JAE39NKV93G7pbN31UoUAh6Ei2QvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301797; c=relaxed/simple;
	bh=PXO7mXcDt61ktsRe7mrMIbSAZ/ex/y1WeRT/rwpn2TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amU9U236mkbLuGVntA93LSeltr6jQMolhiuiPNryjVH+f0KBaplbZiUh8QJaOoStu9oa71tFeQLW+RLUgQLsL2HKgAADg2BmrC2SZ4OBrI0dBvcS6rQuhocZS/Cw1a05LSD1l5aYi/DXQh1LWdtBnyQx0cLfA+WyRINmugbfrCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWp6PcNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANleDsCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWp6PcNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANleDsCu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7uoA1875204
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=; b=JWp6PcNkNCnGbC5p
	6ZlhQ53/tdiuHSSgP7E9U2cmke6LOok1RO+KLkO5WfgBJgq7dECSQHGU0TRQmtTH
	QZ4L3gUJ70lG6kt8FIZiPnapSwS78kkqGt8lbP8bI8kb1P00yBwYbB+WIbkyYbB3
	MRYNk8r0Fv36FIz6agGaOevGWb2ojofmKtvYvoFOcCsPANZXHLTrc7ONzGxbm+7d
	xHdcTTjGmmRl0cwUb72l4OaiieFszXFpbMtjYzYE+HJJZsmUCfc0c6cOlB4l9Khh
	cmld+nrpkLQDtpjiR3gdHRg+m0uFfo0vVBqVjvfmD/2jCDpX8OReHYzDzeWUun2Q
	xfCtHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9pa09f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:23:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so25985981cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784301794; x=1784906594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=;
        b=ANleDsCuL8j9saSN1lPb+N0OxyqkKjEckeD9zoAzUQ1L/QPYkcKwaLZVGvTp+4M/vi
         gv6+W1u/l00lAcsa0cuIIw8ruOS6i9P9tDqdchp5Wa2gT1jkjDfc9y8/YPMd4mcBDvaZ
         wC9/uOCrUJORDfCilRxVcFuJgQg1vtQ57fWid4eHkgTOsahbSs7EtMXf4Xi/6PlWym+8
         hYXRgvW4cAdTGl1+k+FclWpCTZhfkvYR1PM0o+5Bsz3tS9EJKLqgAurMjHArmSW3qWSS
         XIlCVrlXAkojGoYCKKXL31txghCdt0kWqiBzz7wlHgcOqlekBfFPSPLshzc3fkdk0ZrN
         7KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301794; x=1784906594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=;
        b=OS4InkgEz9F3iJ7/V1EBMWoQToGMHp0s5kL/A+MptiLheBoqR91A8Wr4IRHFXOk6V/
         lwvHgpW7aW6Xq6pRIanT78mapOMu9IGhYT47ANheG4+Zbkt7jNM+kT05EJs+dYQcU3uS
         hDxkIXU+SeMYM0WiQpHOi81S7OIyDNS7G9sOJzBqjHac+eX6erMFLuDDyCBTS0rIP451
         d3JL+J0hn1vyXSx0FSxvnJPPejM23bGs86R4zffTDDSwRzEx4O+4EuOz7+KCFTUu9f2c
         i2/jatZiV+6MifMX4x02/cGiLiO5YxutgDtJB7NGZVHVcoPn8jJc5SEtnyqmz16vRYWL
         e1Bw==
X-Forwarded-Encrypted: i=1; AHgh+RrTEg31QwpSAEGMO5ExWIyKvlIzuG+sGoE7hI8dyfYc5VOTZjHRjckXn7kDd0JtXRtA36s9d+r0P+H2vxfT@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvzz8tOfBMjlqRBkrAB+crQSHHi2shNikRKQtbZ9DuTRMSwNA
	Aib9+HRGCAtoiS2pQkM8rvr3XR/gqzxh0D5pUM1r0wxwf/brxTpxV6qAz+JRXJ8r7/IXkjOWRAk
	xHrnmJ4P5dDYU11At1hhkelEtvwSBdjAb7f7tXt+vmYhT8lk4+mc/5wnTLTDY/egw1CZu
X-Gm-Gg: AfdE7cmhl0ZSshtTiWthPphhpqROr/d7XdcG7SHa4OTmKhAWAe1RZi9yad2eqstRmjS
	0qX3xtzgqEx4FaysMZjMfIPPrUdTxFb4X3ySzgcOKGxnMPWEFanLim9AYoN0Q5OltDCUUNPTv6V
	5LMRrk01xu1TMJ3mEBDYvA7UQpERgJ7EHXw6NBKUZ5tvY8Z62IHmR+Tjs+C7rYbsUYdxxaC2oZA
	g+2nxB/d5pnBmYmwXTifzgoaMPmZipaucNawX4/NjGOR6sPpmOg03I/0eP8zW/tZSdIhYJlYg00
	vCuChbIU/prZBv1cl/iXrFTp22nX/UKkROo/7m2cw/IIZbPfW5KyPcVzwuXphL1q1qn1rV6DhIK
	jvDe0GjegJExK59QTF6J2ptD3
X-Received: by 2002:a05:622a:aa43:20b0:50e:6311:7380 with SMTP id d75a77b69052e-5213f861e58mr17404011cf.6.1784301794149;
        Fri, 17 Jul 2026 08:23:14 -0700 (PDT)
X-Received: by 2002:a05:622a:aa43:20b0:50e:6311:7380 with SMTP id d75a77b69052e-5213f861e58mr17403631cf.6.1784301793724;
        Fri, 17 Jul 2026 08:23:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b83sm93452766b.45.2026.07.17.08.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:23:12 -0700 (PDT)
Message-ID: <1648f409-afab-4b2a-907d-a90de62d6bb2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/qcom: Use devm_pm_runtime_enable() in
 qcom_iommu_device_probe()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
 <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aL3FjxeJPBeAuY3r8_wLfYo5tM0BILm1
X-Proofpoint-ORIG-GUID: aL3FjxeJPBeAuY3r8_wLfYo5tM0BILm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NyBTYWx0ZWRfX8IY+bapuqEbv
 TbJJSWU3KU9iRzVaZnRPQealpKGZuXELpSBFH+TLW2Dhld7p5JobMmiJg7UGwTXWt6JPDjQWPM/
 O7hNjZ8uGr69nvaehBhUBzMDO1iQjrN4j2tyXqAjvkV5qwTAM3OmxvOb0938w6sSOave6tW5JDq
 gxDkrZGDeilrLZY3IXKwGzpU8GVIw8aExI3ktwkg6dSGQr5lhPik+GmDzZ7r/NOsqFx0vTJ2sYX
 dblUcIU4tHKHFtDANXd3BKDtLx3GX4vdk2YDrbajbgSdt+iT4gU7DRWc3q+D5cJBWqA7srXu/LH
 8kD88M81yM5YlVT9fUfq+qvaPc/6CPzDSYfqF5LBAmtKt2S2UHbcBkZ1nx9WXXvdOnk7MkbtDVe
 FIR7qDiPHjbPSgi+drhR5GjFQyHC02kihsFSSdAEM4IDI95KpwLJ3Kj4KpmU42GXq3wDt4FRyfy
 pJTnfSljeac7Q12JxEA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a48e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xoj3hry2uz_LQgjbiWAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NyBTYWx0ZWRfX3L4D3Ay6/e3G
 +nZjkEhXUOmgI6XwfrRi/slHbx8pxslxyOHu4gw3/U1RIfzyw30DdVGCvyiH8zk0Snu1FNVB3Wc
 PBvW9MvgLOkdrGjf533ZcvFB0uYezHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170157

On 7/17/26 4:46 PM, Mukesh Ojha wrote:
> Switch from pm_runtime_enable() to devm_pm_runtime_enable() so that
> the matching pm_runtime_disable() is handled automatically via devres,
> both on probe failure and on device removal.
> 
> This removes the err_pm_disable error label from the probe function and
> the explicit pm_runtime_disable() call from qcom_iommu_device_remove().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

the single-use goto could be inlined now, but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
