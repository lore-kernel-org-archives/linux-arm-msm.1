Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2639768D
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029122; cv=none; b=a0nNIAojfjFUYgIMZorHRsPgMYTPavRtL2tjxpr4ck1h423kIlXC1F8Y/6H3AcMf0iQMy2nr+oMIuSiPIem8NMhHa20QyqbSHlKSWRDINLJt9j1AgzyR1cabUB8RgWspotQWU2cop+syS+k8vQ92JCcYHApgQPMDNvEtySBV9UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029122; c=relaxed/simple;
	bh=lwX/AcC31+KPFnWCyHth3KD7fowt3namwKNEVOl1Vn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hr1x9m8vUTia0n5qd0okABmQeDMi992ykV4zUGXxoTN48nkzd217t2YTRDGa9WR3Ma7rpF2oF3Zy2jYLi660bfJSBWU6NzRCqz3d0eqJtXxzH7Phwins/a/nrlIw0Md3avL6d8DpFjex3CLAr/5Hh8YhrtmxycvgzMMq2DjELYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXn/3+NL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1m35FVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXn/3+NL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1m35FVI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GroL810328
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=; b=XXn/3+NL+Al54R1T
	xFD93jU67LUEAqJRz6dakfpx32V+YS8ViAuWkg8hPaNoClETO4gTFr4etCk90tsz
	cOVMTGuoUJENtpSCgfGQbP/iDM/Njw/lzziWR4ox/MEBpTAkEBxmZ37Y3zsJwVlH
	yg6y4WPdxWwDGn40Ay4NAxLMdtcbxnDM3+p+JfibZvl7XUODNpSrdTTPSR52b1Mx
	LFiPJB58khxEUzBvZ8STmT/C2ERtuB1YvoF8ozhgNDKktbT/ZakVVKSyvXPGvale
	bbu+px6wgXHcLHDH0JW3cuh0ozcxTGBZefFx0MLy/jcc6yqhYr67FlkoqHY1ZcMe
	J/fFdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjvf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:32:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so928333a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789029120; x=1789633920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=H1m35FVISwwNcB1nQRAMh/1fQ8DqS1VJZXtyrW7/L79P+VwYZQjNXJ0EjDYtB8q82b
         Tycsr/WtjPR9LYzdgL1HdKKmrSErvo79Uh/jbRepjURBV/MUCStMF811Yx+j9kBxcoMb
         9wLbVEvDlmMSrm/3V1GFV8tlu0+q4WgtlvZ0EQEsqBXFoUL4v49u3kgnqVT0FshKVMV8
         fRw6vx3yXhcG+Ng0FDYgtLx8lA0RWRNZOP3ak3bO0SKJZ76M1c4yAS6FRbVGIix3m0l1
         uzzAiWwocg5m1k7IfW60yc/Xv3hj1arQPxe0c4fkgOr1kk5iwa9nE8xZl6RIpqOX07ZK
         Rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029120; x=1789633920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ew2fbITH4ITQZ33o/4qHtXX7KyJnGn5+AQkkcoehl40=;
        b=E11p1adivRPbUslTdlMbMjQVdYx5Zjtnr7qeZtORxbx1RijM9/8H9PJNTXlO8gtFD1
         qzajvOl9UTJ5J14EHqy8OzwGvQpcxxRI09UimyKM0SgzgTOcY7cZONyxHN8xPiVsbalG
         hu7s8A8r5m82enIzbnYS8Q5SCVnae0WY4awLLIgqjFrNZyDVssPnPptrxbtsG1cZz0oX
         bGAQJZ4NTsxyvxSv2dN1uSK9phcxrZ6cmC1p9CzdhmEyEvtmXL7zPstEWFJ6P8MM2nLN
         Kf5/m2beNb9D7193Pdpdmc5Lqr+ORpV4rHCKRpUIr18fjMOVksgYbBvYuLkslZ/RHj8G
         UQRQ==
X-Forwarded-Encrypted: i=1; AKwUvByZuNiV2Tvord3nN25dMfssnXU3mkQr/h6x111/YFpS8nH7ykvMErGPGF+djQBDwbPIobVAX622M2PdLiLB@vger.kernel.org
X-Gm-Message-State: AFuF++lo35GQ3MMgZNVzWQhFHzhMvl6lLAwW+cQ8p3nqECGXUanBX62B
	VW6BvTUB7d0Fb/hfGzLl53wxouJwCuwZUe7biVwkZJeacVUMQI4DCEfK93ukNGsC6sGaiXhvS7N
	f0tx6Z0+bcd1OFNqFOPiTsTOKr65+i8VBFs2xAU4ogkiptW67OPfkjD5MLPiv3wykap1QXHKRG+
	v6
X-Gm-Gg: AYBFou1aPDujF06LI9ke8Si/KhmrFV6fuZJiOZq7GKzBjvFZC3k9Z6jMQzB1tDOFolA
	/01SntQoeQGEv8xxWMgfqkJC5XJZgRy34RNoXLyRi7tPIxpOUo7sx6gZCUAkqZKqBufDjVdUDnI
	8u90Gstk3YS85vDGWY6jNKQkAYqeIQOS44hSSvI5b4K+bmzrCQR7LxL+6Y0+E8T6cODyP8veqES
	Ig9RZ4E3d2tteqOjiBLHTf0ktnKJYjfLTLmACqq1eMXGxg0OmXNUKhmImK92T+fW3DZR+MC+L2l
	VdPqb9xZL3rJ70n8QsBhHUlv0s8pBNYm0OtCO8Rg0MApXNbUPGOJsPOl1hrKfMpw2VdRFkghgd3
	OHtTzaJ/9/QPxuHCXj9Ezh6dx/+g=
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3714028a91.29.1789029119968;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:39b:3b03:8a32 with SMTP id 98e67ed59e1d1-39d77bf643bmr3713957a91.29.1789029119331;
        Thu, 10 Sep 2026 01:31:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm67133142c88.2.2026.09.10.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:31:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:01:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260910083152.k7adkrtodrc4vxz6@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
 <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfX14pw4CJ3bb9J
 Utx5+eYrRqB0gDgX+lL4buGWunIlxGQRikDtwXqj8jcIKiBKPGShCv5uyeTFo8Jmvtt/5f5GunP
 /FpCAc4/jQ7P34D2C79ZlESGEZ9KCt4=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa26b00 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xJ1-6qcDKzqjCoSX3XEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8FHnVeQ9yGz0ycJqS0F9mWmoHAr3Wthz
X-Proofpoint-ORIG-GUID: 8FHnVeQ9yGz0ycJqS0F9mWmoHAr3Wthz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NSBTYWx0ZWRfX+cahmGs5v9dg
 Cg7tBpXqAHJOo2QBpy18nXgOjEczZ7R8J8RPC/AAErVBEjdb03YZcEyMw6nv69/y1fk5AJdol00
 5b2fXVmdP+TyCtkuDJNKDcaf+60rQYbT/kiZvT83KbKFMorNaFutxuulLIqm6gZMrEIvPS7nb6Y
 Rmeox6LwkG0OQ0FJvMynCPZsalaaghB0aTr2G2MsmvEtkN+KEmNRVlD/TYzDPjJAO/zlWl/jNm3
 hrvb/RQyNJFlkFLrxu5g66weu5RVZXtmgm7TILrQ9dbNNzMMe8FeoGuEe0ABxULFCb9Da0ye8OS
 fC8IhySASUAT5zfqcsgP3s7j5ZgQBHoguhil8/ACRZByqdWRejc35m38tOvowUqatO6a5A5ibJN
 Wq99pGrWTLvl9CvEgHH2MQYG3TUKt7y+9OBWGpwqVUm2/f4MVCN1cxAC3q2x99hh7s/9Zhs2NdO
 AFEyQYXNtO1kmA9dYWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100095

On Thu, Sep 10, 2026 at 12:41:11PM +0530, Sumit Garg wrote:
> Hey Folks,
> 
> On Mon, Jul 13, 2026 at 9:38 PM Mukesh Ojha
> <mukesh.ojha@oss.qualcomm.com> wrote:
> >
> > All existing Kodiak board variants run the Gunyah hypervisor, which
> > means Linux can only boot at EL1 on those devices. It is possible to
> > boot Linux at EL2 on these devices [1].
> >
> > When running under Gunyah, remote processor firmware IOMMU streams are
> > controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> > Linux running at EL2. Describe the firmware streams for each
> > remote processor in an EL2 overlay.
> >
> > Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> > devices to produce a -el2.dtb alongside the standard dtb. Modem and
> > media subsystems are not yet supported due to missing dependencies.
> > The GPU zap shader is disabled. In EL2 mode the kernel owns the
> > hardware watchdog, so it is enabled here. The wifi-firmware child
> > node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> > node itself is left untouched so that platforms without WiFi are
> > unaffected by the overlay.
> >
> > [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> >
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
> >  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> >
> 
> Any updates on this patch if this can be picked up for the next merge window?

Latest revision is v11
https://lore.kernel.org/lkml/20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
