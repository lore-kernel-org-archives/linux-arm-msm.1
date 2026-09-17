Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C008958B6BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654793; cv=none; b=gwbifya77Wa/uZS4AzlsTD337i+td4DfkqxrnveR1dB1qxYlxxpfHZMZR8JNBc6oCcleVYKDvjeGJH8aV+iPfwpnKYEMr6vM2BpipcdiB90pEpJz9+0pUK0Ei3/L4tCLftxH+qgAyEoK61Dh5G2knWySqZBBEWee7xeySmgP13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654793; c=relaxed/simple;
	bh=Bhe1thWj6EpXQXMQGcwRAowXV03R2FRCWSxRWS7uFOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnnNM354f4q7Ou7xDi6pf+AwpdHyVPHtXS8pNS+xrfu1EWt8ca5XbOGghx3rUFHA92mvB2lK9/yvAhLMIIgM0hdKKlg53I+jDhlP0DqRuoY0K6f4ecstG9wcr6/1/aMbl9WBC/G1/ave5XjCZI3tvBl3qyRO/iogp5XnHYMEVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afBN62mN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apPy0h8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afBN62mN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apPy0h8b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj6dN1175868
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 14:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rg9K5jhjT9zuKkweVBgiD4wM
	j+8PYDWHgQtofVv+SRs=; b=afBN62mNrdfimBfF4yr6gPp84H9a2czZl7F8eZ2X
	rsi96Ac038KRzyVsnrZdUuhwd+vrELOzheEv1EIFebCxzO0XoU5YbQ274Go7Wyb0
	lOENXGEn2Lvwi4dBuWWu26YgZ6NHbBbP7pX1UE0v3LI5TEh9hzrovzJ/tk/IT0Gh
	gbh29+xWwGquumptaKoX0MHI9PMcsUfBb9UAl64a+EFP0qQY1Np+57PrHswHV73h
	KMMwOO4/Ehc84N1DAv/1yCKPtIg+Ee5id/VcEn5i59kJFIhtfStqqEsDWuHBaOhQ
	87Xl6j6bwJTcUEi5124H/MRf+AnlaZvuKkInijHB1xtlnQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0skqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 14:19:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ced1ed870fso1781435ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789654789; x=1790259589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rg9K5jhjT9zuKkweVBgiD4wMj+8PYDWHgQtofVv+SRs=;
        b=apPy0h8b9g+IG6Bu6E11JWWsFoZaSsvPW9zwu4TviLa+FN5NlPzDxRGyI50DLPon0j
         CDvPZiveDm2CoYWMFQ2bWVr3N/bnhMxq+danIrVxYdhqs8qTT0n8XB5xxYMSo8QonRbA
         te1OB5V69wqoWRWzchk891Fuj5sfcZKxYSarP/wUfr1TpmLMVJG6RVWN/LAsr4sGjnrO
         iEVvX3OgGTGtb7ihomjJkOx+IzaXeJhZ/ST9J5u4ZEB3XU0FHmpca5LyLU2S71C6ct5O
         4lfVU8MQDc4FFoidqDH7Pl7vnCDiewGNt4BhkG89eWsjT03yKcAieMRQZinl5x4iBm78
         VCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654789; x=1790259589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg9K5jhjT9zuKkweVBgiD4wMj+8PYDWHgQtofVv+SRs=;
        b=maxrl1t8NG9C5jn3sRi30U9toG5d6KLZnqUqnNV6GMeTVM2NUi0U9oc6ND1LUoujo+
         1cRex9tPjYPeE0aevojLUWqcxj3iy4NnC9CbPIAEnLyPPFeeH5EbuqPm2IYQlbnB31Dj
         7SZWfxoEIDxjL00ilkVpMg4xVFvCMlcrViuBsoCj2pPRz1X57YV20oLfpPpMU1y4FdXD
         L7hIVku/ZAjO7Jt0JXMHlDv3tOPYb0peYji0/ysjqxcMmDnTP6Aa7Xn1Ob+4N5/2D8bx
         eP8Aqv7PqlDIY2CGo/wdxtzPbgbRLFZ8Ebncs9vVWgkcQwqs/kKMX/o+A74ows1x/wiS
         +qzg==
X-Forwarded-Encrypted: i=1; AKwUvBzDGvpyuxhfbVUHtG/ng6v47OuoyG3AKiNNIT/BSc7NjjnoTl0rdGXBYglzZykU9DQef2GXQyR3otxQNbXw@vger.kernel.org
X-Gm-Message-State: AFuF++k3WNDXP64Cd4yW9jSkwvuq7wn9vAUBi7xAo9nR+Yyt3xhbHw7c
	uPkGW7D8bassIpsVNnjGBVfNLn/+tCBVG3IGn8lj/SFFiN+M0Yq+jGBaBD2unkpxlM4VkeduDBE
	2W9x9AfB699Tin97PugV/r9mgT0+uDVj7P8JCfh6Mgsn+PH2mdoDPm1dt+SOLo8pe4N7y
X-Gm-Gg: AYBFou2rL9DpUxNtTfiINeXmdrgLXWnNseCwwySfWpiahp+bZOCdwdkbSRBgR6BjfJu
	Rv2O74TW/wwtRTTUG7LapMmtKIBXmW0jmBQlyDJ4e2viCFcrxpjhb69Ef+IGmhmiIBvAXPYcj1n
	Jo0/BDtHA4yNv0E0koSzrGs8aDH8UCdMjYZVYYBgzF5jocNWijs/GDbwO6heLG0eIhvPt/Z6kf9
	ABETGqLkGi1v/1Y89dp+L0NGop4iZrMMApjzk92VMIVywWFEVrBRPaEGdSYFZ8AK+J8TkfEqshR
	/KDIDIf1hLZbV9MJ1qvllfNmd/6IpQySUtjgyLOXoFMmDsADrxNJwD21RFsmDxY6zp1H48UwYlP
	jPuG9itj0r03Nct5XRaBNkJllA5X7JxYPyoSzthrCppuWdfD5eVMHYZbLMfKKAmdb/07+UTUw6t
	Z8z13mkAGnjrjNFGDjhdfC
X-Received: by 2002:a17:903:2301:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2dd8dd0afd3mr102548565ad.1.1789654789210;
        Thu, 17 Sep 2026 07:19:49 -0700 (PDT)
X-Received: by 2002:a17:903:2301:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2dd8dd0afd3mr102547915ad.1.1789654788431;
        Thu, 17 Sep 2026 07:19:48 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f134c3sm27533935ad.68.2026.09.17.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:19:47 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:49:42 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Message-ID: <aqv2/nFNwN6Av6bq@hu-vishsain-blr.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <aqsqE2-ocdV_W34q@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqsqE2-ocdV_W34q@baldur>
X-Proofpoint-ORIG-GUID: Yop5pFxDzJWJuxe1hdbfZ2-cKH8X_r7B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIwMiBTYWx0ZWRfXwTc1+boQxLCH
 GrYnnmXn4r+DAAnxmBmJZBJcJ6LSG99rvwKtqxhoNL0lfD+S21khWO3HKD98NG9N2pkf0CL6mcK
 cTui1oaD0eJXCgjDlkEof8rMkuRoUns=
X-Proofpoint-GUID: Yop5pFxDzJWJuxe1hdbfZ2-cKH8X_r7B
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabf706 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pDfW-8FT8CKwSx9uGTYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIwMiBTYWx0ZWRfX7PIvEgAeW65Q
 dipYiK/ztXTQ3UZLCD3ZjD7Ptuy4i9okgDQRON0hpncQpfoPLsO2jfX/XM0TXHkPzK/TO0np/jE
 hEZoPHR4Jq7yaAzTeCcoH7B8k6VTCffo42atF/3rZMTex8OQJOt1AVctWgoh3IygHGq1fCXiA7t
 ZdTOoPDvL40sZjhG9aCtgaXEVU7E/b9Jx/UEC9kDvYqnwQDHXHz0e/QgB0V4Q85OZ6UBRowxHAc
 DEUnLqng+CihPi+3XFOXFrxtm9fztTO+6R589GXWU9/ttfnStxEWaV8uL9qwgjzdpJNrsElA5GX
 Dnw+mW1teeskz1Z0O+JauKFwTaPatFmG86Q24QHpd75kw+TpJyeKZwpEPEE2oEna2BqPo7YEmDV
 DQ/qGLqjywnCVInyvPa+hJ/Oy05dWJgZVMEqZQ/weDerrSlnslt2M9bow8K8OEMh/4+X44JcQSg
 n2x2HWFaF7eV3fVmIYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170202

On Wed, Sep 16, 2026 at 06:47:16PM -0500, Bjorn Andersson wrote:
> On Sat, Sep 05, 2026 at 07:00:14AM +0530, Vishnu Saini wrote:
> > This series adds LVDS display support via device tree overlays for three
> > Qualcomm platforms: Lemans EVK, Monaco EVK, and QCS6490 RB3 Gen2
> > industrial mezzanine.
> > 
> > All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
> > converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
> > The overlays are structured to be applied on top of the existing IFP
> > mezzanine overlay.
> > 
> > This series depends on:
> >   [PATCH v8 0/2] This series adds LT9211C bridge driver by extending LT9211
> >   https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/
> > 
> > which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
> > and extends the binding YAML accordingly,
> > 
> >   [PATCH v4 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
> >   https://lore.kernel.org/all/20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com/
> > 
> > which documents the boe,dv215fhm-r01 panel and adds the timings used by these
> > overlays,
> 
> Then get those merge first, so that I don't have to spend time figuring
> that out for you.
Thank you, next revision will be posted once dependencies are applied.
 
> > and:
> > 
> >   arm64: defconfig: Enable Lontium LT9211 driver
> >   https://lore.kernel.org/all/20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com/
> > 
> > which enables the driver in defconfig.
> 
> This is not a dependency for your changes to be merged.
Ok, will remove it from dependency list.
 
> Regards,
> Bjorn
> 
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Removed redundant status = "okay" on nodes that are enabled by
> >   default [Konrad]
> > - Added a blank line between the last property and the following
> >   subnode throughout the port@N blocks [Konrad]
> > - Link to v2: https://lore.kernel.org/r/20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
> > - Added Empty lines before the status property  [Dmitry]
> > - Link to v0: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com
> > 
> > ---
> > Vishnu Saini (3):
> >       arm64: dts: qcom: lemans-evk: Add LVDS display overlay
> >       arm64: dts: qcom: monaco-evk: Add LVDS display overlay
> >       arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
> >  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 113 ++++++++++++++++++++
> >  .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
> >  ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++
> >  4 files changed, 347 insertions(+)
> > ---
> > base-commit: ba20122d4c311bd9384f38e7ba1d0c122e21745d
> > change-id: 20260708-lvds-support-2d40d60654f1
> > prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
> > prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
> > prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1
> > prerequisite-message-id: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
> > prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2
> > prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
> > prerequisite-message-id: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
> > prerequisite-patch-id: 9e3233401819ca53c119e6cfab95b0c471ef254e
> > 
> > Best regards,
> > -- 
> > Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > 
