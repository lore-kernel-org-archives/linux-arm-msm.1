Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377469;
	b=UOXQ05Uc9qPhK83LJOe1DuXk2tBT0Epm+SjGDLoX9afs0zxdc0zYDiRxVEEAfapGJQ13
	 lUxVs3Wv0jpZqbQvjhftvDFND64mACSeJTkBFkssp3sHF4sOeJU6H3JlToC5MgchSdLmk
	 +Sf38K6sqNUPRPCQBPzwBQq+jwI+3vqrye4nS/8um19lj0xZKXDPY5sBc9AdgEwb1swET
	 nG/m5lOOzgXeMAK4R2wHaYtkIktvaUXRd7+zY1L/okCLQOUxRWQZLRAhdUwuNbNwKpbCA
	 hq8NILNTivskVRQm0XjPVQuk+WpCBhxLbOGOa4OrlPTJ6+KTndI0JrRNd7FXI+HYBfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
	b=vsE6i8MrWyEekymBMR8iPIfqKFhyEslK7mpt5cwdeNRtf2Z9maFmiB0tohlrwR1sBKnm
	 xWYb5kw9sWiZ3uu2iByEXXAk6H0BigP7BkHAeu0jxIp4D7WSHkL4gro5S4lyEa0VVkHsB
	 +OJRCEJz5tvLCQY5EJpNXkdrmPWsmoBB25dQtk7vHB0jc/iDgb9ePHZghnp9Mke7vuD/P
	 F7e7e70RoKNS6HeTG95/w2vWnJsL+paPP4MObl/xZSvVNFltD74I7XaA5sAaK7tUDqDzM
	 ev7Za+dD6acmM0hqYvURYQdjNvh3YfH3qnWPtW5pWalKBuPvtqOVjhjoBT9FTix1h0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6cgC2aE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU0uH06C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F7606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6cgC2aE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU0uH06C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER2Ja3515255
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zQNtNZSFKk3b1SWHuvIukuDR
	ed4VUjqAkVFuTv8R5y0=; b=X6cgC2aEw3qwS3NdtWihL8QzyMn2L8/mSGdLn/8D
	K460qPW/SzZUlis7dBQMJSo2iH5V0JJ0lMiDLhaLqobt6vnie36xl2fteL6PLTZI
	oeQ04Ae20A9D9ATLiZpiNzapkzr6LRddvIScWEKka6BUNyj1IXREsTjmFpxSj/Md
	R00AfQ7Dp/T7rdlpoNqcQNNlpXPvB5NAWqq+95ZygVHAHqUqrTh6ILtxxvh7jr0k
	Ek8ytWvJweHCv9Py6hyGos/fESErIrCI7Mcaml/ioMljj8A2Q2lJauue0F1KwZ9W
	AYeXVc5y05xvKAGZDNqMar1vWEvF4qNNgXnMB/jujgfsig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm1a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c124d17880so166297137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377466; x=1793982266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
        b=NU0uH06C4JhQOV7mgp4uINri6WTnOXizyEsRLVsbZ1vMrxpreFqXiiRoso8Ys83VR3
         GQouA0YlbgFeLijOE8C51+o48nLM8oW/jP9fFIvYIehEjOX8uW/+PEmhJACbd8LsZI90
         ojQb5+dP/mHeOHC780JEdxWj4uqwkBGkg0gzjwPRK0sHKZACjGQ0E0lzG7FlE22Z2qYr
         dsF3O/4iZ8ADwunocoy9ojVWgM+B49lfoiT+zDIERXltZxlGsbMv7cFZCJ2JUFOHTeQK
         keS+YGD3KlSKy0+F55mD0Yv1Df/+q7npegyqYrCqu9vK4+xl1n+ExhNTx83iGCCvyasi
         x/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377466; x=1793982266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
        b=GVoRtkwevSaJVM9LZlZgAYdUvWc4fWULlwyw6IKjk0w9rio0+gTV0zlDJaWrEhOOYO
         CNxHLAImRdMJg8YAsWjdVOV0+7VipToswLqkPjIdpfW6bzACV1GbmQLV9oHmLCzimoTz
         5ciw2qGykIBjFp7P1JhJJatTEFe9gVOuHZ84VTZ8uRabcORqLSL6ssx0gQTkzXM78qWc
         cFGYyGXoG7X+ifmumvOuLuzO24C7EOonU4KuIFdWgo/szn0jD5dFMzf8rQg78s+jzrUa
         LWK8SAHZ6xFstQFIweTE7TB9/qb/E9pdTpbcLPLPz9vQVEp6hehkkCygDFnGi/W/JB54
         QNkw==
X-Forwarded-Encrypted: i=1; AKwUvBwGBezhkTF4mjbDkeuKg5w0WKYicV16XQEsjd+v+sNU+G4rTmxQsRfzJmGwMy+OWZPa/u5bXcKhzNdqsnOu@vger.kernel.org
X-Gm-Message-State: AFq9FYJinqgYxS0zdYjjRFWkhqROvGcf87yRfnWF67eN2ydJ9a96paxH
	HWnZnzUdliKzyjTOX8ZyAkBI9Qx8tvQ2b1Rw3Ni+9Mh7bJRPUp5iFb1ntFQ6/yfcvnZdNwlo3DW
	5u1e81N94GslnLTn9Ftg6tbLRp35WgOr5pA67zHNQnoFSKdtW05RJeMG+lqxrzbN+U3lZ
X-Gm-Gg: AYBFou2J4VzJyoQB+aazeWD1gpk0mC1o/24t8UlShNYOf0Erz6O9plrhyI8uNO++5/U
	nE5cgdfxHAzhEyzAW/fTwmcjGoLoh+32O6gr6UP4TqyZlF7sC2ky6wQuFyHwjLKOpTAL2Im05jB
	BGVo/CWX9HcxXQgDw2mxDZ7R8SQ1LTEfkV13m5sIaWuoXoqOXUwuPqt/S7Z/kFe63nX075bM6By
	GkPpv/qKNJpGfYAJ7rN8BYB/vjrcb9O7d2jJa0fvHWRGsqy86u3F4fODLPFNp5q00NZmywwrANk
	hqGsq4fn6vO3kPh7Ac0AedwJO1Z+/udDvgHxIa+nToA+bLiazlBvsH3eJ7LVA4M5ZM6rI65LjcP
	4XHIaeWvyuEeng976Lv1PKyuVS3NGuWeVL25Evme/Foj+7+Y9ChCnsRM714sDshbC
X-Received: by 2002:a67:e712:0:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7d072d173bamr1335644137.29.1793377466004;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
X-Received: by 2002:a67:e712:0:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7d072d173bamr1335628137.29.1793377465369;
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3950768f8f.29.2026.10.30.09.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:24:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:24:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: update offsets table for
 x1e80100
Message-ID: <sem3sj673ju7rbytssvy3raqbo3gv25m6nx3pspj6hbegjbtjk@kcpv4wr3uc3d>
References: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
X-Proofpoint-GUID: xSOrLTnSM8eIC6a0J_hZ-5vVS2hXiTGO
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4c4bb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0BQXEinDYilFB-d34WMA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX3L4J1k3MGFn9
 c1GGxBifg9bXeP4xOGLKW3+I76g4/YESSsYZZvrlZdmzst8T0+bijwkzlGVkF5yMwLqLvcdhXp2
 Wsfpx2LZzIx83U1ikHu9wtQ7MQp4jUY5PKjFiULHzkDbzS0zyI2EzmR18g1BQIvnnTOwSy1Prdz
 5lJHhYimoEN+6b2QY1X2qG/7SoURXENFlsskJRjN9MHK5VbqCguyvNLYJ7/+xgu2+Z6iMKhtdVt
 2s/y+SuSViD1zxAn4bsb/ReBuGqh2jadoQAEjLwhe8ZcnUQSt4JPi3N4ALbYoEJt5QV5nPhQdPO
 63xCGURz08RmvCpZpJn0hZEwzUh6nWdZ7Ef4JpJ/pq5EbQ6VrOCo/9vsck/4SfcVX0lcJ71lbwz
 RmRxPmVwCRC/vuTCyaVD0ZLw6aBBmSVopDPHOpRwEYO0e6if3cUyH/UTBQ3Xzr4t9JHc921zY21
 cV/mTSUlflzMesglHew==
X-Proofpoint-ORIG-GUID: xSOrLTnSM8eIC6a0J_hZ-5vVS2hXiTGO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX0O6+/gL2+9m6
 Vx2FWXAXak0lyjhHYHY6YhWoUkTsLxC4F3nJ+GM7tyYQVWZgMb0h0U9U5w70xoH75INc5Weah6w
 n2jaudb8OESL8IRiOFGFWtg34+ip3co=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300065

On 26-10-30 16:24:24, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
