Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3633DEFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885203; cv=none; b=HsQqnpA5zjofbM501jJS/ESqe3qmZPJQkBldexHs9/EX8PMh0VDsvHNVdmn/CSjIIibOOFZoT/nPPVNgZUAHT/yJAKjIQ9gnS7WwMet4oY9PstRFbEVbPDpxN/pVcIqTNC/UzkW5kKuFWjd/OYO6409aSJ4qH/xBQVTIpZYuYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885203; c=relaxed/simple;
	bh=jd9ZQ3vft6U3NWY6w8MBNL6oLN6MjNOIO3EqXQ36VmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRx8d2Gz1t+ieSSO4x8j507qDaKjOC+e/obwqULBBOF99KU0iAWWcvy56f1qPoPYvB5shlS9axMeIOzGn9da5Fqz9Z1/vrfU6aOKzp9mpPJVrafDo9KWb1lA8q/drGBXHsK2qCIu9JLeFiTi4FP5FWvI+2X8il05CsCy3uSeDyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4oKYS8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGU3LK/A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4oKYS8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGU3LK/A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fe0kw3613886
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 16:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qqk8M3irSEHsxsm6zyDtTCOD
	y4klo+uYgHanr3V9UbY=; b=l4oKYS8Jx2zzLlHFXuWZyyHfh7nNxZj0MhHNr3oE
	tm5siVvkwJekE/nkUc8yBCzpMvoNTt9e7mVMZWnTE7dYuefPvBFLrVYF2zFtJegs
	/MtMuI4tW05PHC5svbA7kKCO4BnfyXxqd5p6eMA57dppaQrfN01nP6P6fIR/6amU
	6WBGJ4QbWESW4JcZ/BeAMigexN1FmMIv3iL2j0WqfSBiv1uKbgblkbdDwgL6iOBn
	LWmxsn8bREeW4EEEXE3auYNE97TqxeZdaICPXChl9afRVgfGysFE1JSSFcoVbUOd
	cBq/N8lwIW5DAnvZGLMTJwGoM4nsV2+eRQPIyNccrXIs3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguk6gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 16:33:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee162355fso699620a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788885199; x=1789489999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qqk8M3irSEHsxsm6zyDtTCODy4klo+uYgHanr3V9UbY=;
        b=aGU3LK/AqIaW2jng6sSCnLaPT0rnq+70T0yWZuh1mSYmLBwDa3Os+xqCSmFnqnP6ph
         RD6dpctPeZQaVxG7+vQiYA8GKPiO9uwfukwR/BuI3xf1O3mDGWmIsU3vXk3tD2HtwdCY
         B6Z4cvwnC81m3Pv0AoXHBWQcxWexIN2OOsuGubN5By02/ghZnHXGG/whKg7TMnUWn8O2
         P+QEOZEs5DitmoInoF+n+n8EWgJ/h8S5VxoiwGsqI/Mva/HPrHrjPUk0gi4ClQ825sCJ
         OLQ3faBPzMYRsIw/YHmTMOgr4NR1y4qxFD7wLWRSJJUBHKsMTLvZtjfBDDu3TTUw/w2e
         XGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885199; x=1789489999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qqk8M3irSEHsxsm6zyDtTCODy4klo+uYgHanr3V9UbY=;
        b=NELwowhZXDRmeqHDi9kD3VT0AjUL9HGRnO+yA9+Mr51ukT9rETOMDggN2Er2QjjABJ
         EZQsKvyutgKwZxN/T+Z0bjN9xlN9UfLsrTFzWebsCGv30AbV92opmDW57Fvd/Dk3vKQc
         JzNh+dL2lyEodYyB14skzwlmLb7xe6wdHc+RnULWAL+yZSzL1lic1kN4Lo3YFAFr9b1U
         XWgd9cvqfAs3PWHiT49iwXSzzIgcHbfd9IP1UV+Js400oIIWcTk7SEw4XJUM29OpNahS
         flVTRK0cjnFErsWBiq3ROpYdEs3ablwndkUehba+fJE5wVQCymfGWIwUebFVl/2eUmHm
         S6WQ==
X-Forwarded-Encrypted: i=1; AKwUvByFLAMQ8DsJq4XSx9LV2IezSjeneiBVuVMusrjGmyUmdjPsTzstX7kjWTxOGpZHJWpgdK7BAOBGOHnRKR+n@vger.kernel.org
X-Gm-Message-State: AFuF++l2pOMJjE5wpCfGYmxC5Tbbk4pYGjBTSL3fGt6xkNtPGNLGEEyf
	epad7KwbC2C7lsbua6mWIUeYxl49n6W95ImHVyHTnoIYYSogDDtbWKfSy3yMltJiFzWoE3Df9rW
	wVKYAWcHN+PHSTcgvdp/NDUF7+wC+173FYDQ9c3g5Ayy9QcCQbv2OGnFq/aGQnMvEgLqx
X-Gm-Gg: AYBFou0b5Lqc927SVqEHjEXXDtP7EnT98UbVIvN24sdYbyz4yR+n/yOgta5X80X5cfx
	GRkSd3S8xYJDXO6uYKZxctl9rsUIEeTC7P3zArqFRD8sDwz2kaHkQfwmMu49r+Bbda1kyYkaDda
	zRgvRWZNvicmVUcsr9ul4yZ70sw1G0NZ1t6pTC6LXSnfLolYjlWUhDsdhDJbFEXdy5CYq7ELIpl
	IGNVMn+5BVipZdur9vRpxMiehVi8WeiD1Nb9i30G3F3Dx9l6D8Oy3/jBuHWMHcQhnHDy6UGA4G6
	wM1xtVDNDr6MByZgZgNIKzYTn2s8U3fI/QubD8ijz5OtSyQBnQl8R2px4ORBvHXU1g2tMLaLLNV
	2Vty+VJdQj6k6JvbVhDDj9VxuN1XzSZi5nww4pNWUZi5ezqhqRcS40W/WTZQypGtkumkMdmn2sB
	YuSI4OsPQ49d4XR8e9f/J+
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id 98e67ed59e1d1-39b3d86acf2mr21418224a91.5.1788885198889;
        Tue, 08 Sep 2026 09:33:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id 98e67ed59e1d1-39b3d86acf2mr21418181a91.5.1788885198329;
        Tue, 08 Sep 2026 09:33:18 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm57343694c88.4.2026.09.08.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:33:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 22:03:11 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
 <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa038cf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=1ApGdNfS97-kAfUPohsA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: bEA4_HbmLxMJxVbIdk75lyKolbkW5HzN
X-Proofpoint-ORIG-GUID: bEA4_HbmLxMJxVbIdk75lyKolbkW5HzN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfX+G6eOySzwx3r
 yeidWf+zpyMf7T/LfXCJESWVmrqzT1mo6nlEwv5YrjNlhGOd3sKZc5dJjfTFrx3NaOZznevLyUx
 R+uuftGuMl7vqlUEq6E0C+mV+Vu+qEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3OCBTYWx0ZWRfX74rQ2M/20Yl+
 X3Y9TXII+ay9fGivCVUic032Jp7BincknzN18IaI3ROya5DiRfkEFYaiX2QxU1IltEmJRlWFZqY
 a1FsjE+jHZAdCA9lUL1025mSUm3Yz4IPgGKtGHHyh2uEczI1RdLq1Uj5ZKbNMMO2+LqNm6nzD2q
 7J+BIFkrjgjUuHhwEI12NV+BJlPM7vwpQIGDbBH7hEt7SmkH2DcEoC/Unka6+zwiNsViLWvSOtY
 nc9VN20nyQ9jB/c2KfZ9onGIuEJRyMV+KlhQ5Dcz/8Jxak7Uccj5XsjZCSthMjOV17RX9MlEEpu
 PkbwEjBDhuQm1zG+aJu8DgtZxyv4Kyc5iVxu4+SZg+YWpBfd4GoXDxsoH24PxjlPes5skns0D9L
 ELgUOI3fIZ8q5X7aeEu/zJF6WKL1lXLL871HuIxcpNcSwiPbkatHmWr/29tXeUZNFsyn6Xk7UR2
 JbKxxoAyV1q/AS7Qy6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080178

On Mon, Sep 07, 2026 at 01:40:52PM +0200, Konrad Dybcio wrote:
> On 9/5/26 3:30 AM, Vishnu Saini wrote:
> > The Lemans EVK IFP mezzanine supports LVDS display output using the
> > Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> > DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> > VESA-24 mapping.
> > 
> > Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> > up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> > a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> > panel-simple-lvds-dual-ports binding, which supplies the panel's size
> > and timing internally), and an LCD display bias regulator supplied
> > through the GPIO expander. DSI power is provided by vreg_s4a.
> 
> [...]
> 
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
> > +
> > +lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
> 
> I have very mixed feelings regarding putting a comma in the
> filename..

I named it similar to "talos-evk-lvds-auo,g133han01.dtb", but let know if i need to remove comma.
 
> 
> > +
> >  dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> > new file mode 100644
> > index 000000000000..bd3e13c46a1e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
> > @@ -0,0 +1,113 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	model = "Qualcomm Technologies, Inc. Lemans EVK LVDS";
> > +
> > +	panel_lvds: panel-lvds {
> 
> nit: this label is unused
I will remove the unused labels, in next revision.

> Konrad
> 
