Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489523;
	b=hv/wAjYsj3FAo5Zos0eLV06IGYAyz+JIXakgX80oRPApocHTBxKogUDYB7f6BPihGIaS
	 sR8JMDlCYUjV1+kWDNl/Ga+yDJJ66mG4UP2MPXs721kPTLBTslP/Mj8nn/cbGl9lv/ra7
	 4pCjBarp7UP5kQHDUDEZytBDlxJ8pxHCBtyUggt8e7jlq9mLQscSw0Dof60kBJk8cliIh
	 rPKZflqq2RLdEygzwaXEB2vwUvNxJ3QxIMTnFHYYV8GNx/y4IE8/tE3b/cCo9sVpwzP6z
	 Hj3mOU0CcWZIk73cpZaQ8TUQxgVCmskoO/+LrO3jDSYof+UpGT8cAPGO3tcA2xIYSHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
	b=rKcAXERnQ13z9xIv072I8O1LY0eqyzrvy3tADDkOEN9xYMlXX3nChh6lySN7dO2Y7lUS
	 ACNd8o+vgOQI5mGPL9wcTAbYfPNqGBEZ6btJhYZ29tGDwrKdRLI583dsePSHnR/BTw7DC
	 OD9kRDOxArtl0o4C6d7FD7jfTI6lZ7DIAQpytPq1moFT15D3lnpoZa0QfbTqZgIP5VEmo
	 BaOvFI3JPtxS3nBATxz7wCt7tuXM6taNGGYOSfxTWToI+LOhKMchAaX6RMhs6+8gA9HTt
	 NctK/wNxFzSuqm2ynjrut3jKn8b2Dntfefh5VbVg3U1/MdkpsHpB6HFSG2NimO2ZkzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUk1ohYl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuqFe0U0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7309A606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7309A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUk1ohYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuqFe0U0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8PU1X4032064
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NC1hiC1DqKSX7UHtU2uk6sPH
	M2rRGUITByEu42a5Geo=; b=dUk1ohYlAnMiWz4Far3u5Icgm8K0xvjB5E7uZylM
	bUCZ6zptepiTPlcVzLAls8BmzTwNRfwQywBUtjUCcZXKtzK9/PNLzxtJ2tFSzsqK
	680r718XjnXTfs+1zjqkJWBVN6+j1LTIrxnCHg0b//ImLu9AVZtgIbMhEZKymyKf
	ZQ4cz47cOofM8Aw8n951bwK1tCZnjVwGkuf6ZxpxAJb85ug9pVQlpReEA851Qz7q
	7I8ify8DIpnZ36DAUF8X+4Gny2JgXcrkZ1Z9i9YEOiXC+CRia/QGAsLSCBL+OXim
	qFP2z9/SsBvEsBJ0SnIt/oiXD9vbufnKsFWTl0WH00Nowg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9vhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:45:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338cfe567eso60344861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792489522; x=1793094322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
        b=cuqFe0U0dOu1cqHImrQFZDcbNCQm2Ye8S1RfixE3xipTosPmD3mFRuT05tRXMrc5ly
         7Z9a1afuu6NDeDT7DHP9fje3bDXF1O5O6ma2d9gvz32E0XVmAOo+7APvGhNaVsI6FpIr
         iFbAnh7TkOahVLHsgwSy1xIrroPI7z3JFy4k869MD0FOlxYe3RIV13xbY2BgF5wk/bos
         kiku371DjiOVvYd1OcZi+UkxR3rbWmb/nuwMQ/NYv7hlts6/o+dxQBS2lUQywp/nA3ol
         lC5oS/qNUUNDzdjsXt6Eiz4a4/d7e/WFvXqhVMWf2EIj9i1QbwirK/tYG/M/o3OJvSlH
         PBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489522; x=1793094322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
        b=04HdDbqK5Ep/Yf5XORr65J3fTPRoTPCIRK2UlpGpzqAy/hzQpxMdMhqqnjQcd1YYo1
         IQcXrT+7D646pLfWzkVS/WJ+/gEAuUGjjTd294eFMBPa15DVtnKm/90TCgVrpf4Nza3C
         isJ0DCPoxactowi+qacRo9d1W7T//h/K82AQLycfJG1f3egcVWebbflmPxSgpg+sO4NQ
         mzYsPeAFIeT5AgPghQxnsgB1xNZa7ddsJQ4w9JHu/uQPfDh7YYadKQVSb0seiW6cJ17r
         uRy2nUjFfaEFEhLxKY87yRfOLu0kaG/12qGUAET0ZpTFcINqHoJNc1wR6nzgPYOiAU1Y
         Nwfg==
X-Forwarded-Encrypted: i=1; AKwUvBz+1oVkWJEZtCiWYaYq6mVGPIXD2DHMdJSewL0n8tbvbxCXELp6FTh25D1J/vHNhQARFJgYy82J7OHxr4NC@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ4jPLcQaq29FTKVLSlX/DBC0hLvU2ekRFWAO5QvuW011Qi0WX
	1UleeIZ1qiWjvVP98z58hrBvn+fzCHUzzKaTxYZICNnOlhLxkcVhUKwmbwoVGujiKMOH3qNVC/y
	X7QexWzyo/eE9vXx975WSZdQ9NzGu+ytM9Y7w+VHACB+oCwbHffEjTJGMpFXU4JRo7GEL
X-Gm-Gg: AYBFou22NABDMf6xIBK3/SzV2Vqc2C/Ukpx5lfNB/wm7G01MQ6YXolBHSU/iE204Bp3
	XRwBg+X79qkPV0lyE+5VWnlge9wEOlbk77hob7JF/Kyl2/4btmt344GNPjdaag0DdLRK53xTUo6
	uQZisPHibosNVi8i0z86TDLnRntfM897hSssPhmPjn775MVHQDSSKgJdWkz8BzUY09iQSiIwm6T
	Z2mcjQMmItn1OhSv+bbqqIPztXfNDHXSSx+/bBwFvH/E8tHRJDVdCgvFrDv085vMFOyt42zHJII
	v3tJlky2mjvggh3j84+hf32rm8lXWgmE4wgckFWEoqTq4NqnSJ6odMOHhqB7MPIv07syrdjAEzq
	eZwiszPuQTh+kEmycJFKpSfYFOwFc1FDZhAGLo3qwPWGKzDtdd/kVfS0IN8XfvAu9kKF2kFVLTo
	EQI2kcBxe9vgfb
X-Received: by 2002:a05:620a:7085:b0:93f:21de:f3da with SMTP id af79cd13be357-93f29cc9ad3mr1601787285a.15.1792489521580;
        Tue, 20 Oct 2026 02:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:93f:21de:f3da with SMTP id af79cd13be357-93f29cc9ad3mr1601784185a.15.1792489521107;
        Tue, 20 Oct 2026 02:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fcf07sm2478354e87.3.2026.10.20.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:45:19 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:45:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
Message-ID: <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
 <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
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
In-Reply-To: <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FLqFwAAkVTHdizfMjR1W8jLRuILAjKkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX4fxExP+JundD
 iYclrTK278Jl5JET2ZTY9q2m3ewVePrmZskAk7QEQhCH4qxwaXS/+DmGSzicHJmZQ6JezTxnW+A
 SE6pQSmOgLkXiHBq1hudZG4Go4xdQ2/OwJENt6MMmZamr1V0EFhm/zwOdaU2xuFTJgmo2kWFKaQ
 hjJ+F0Wm+v3+9oLR+kwXlTnPFNU5stzAmUjb8/7QTfShjGjJNPGh0hg9G+7x+2ihBm1oH0ZozMc
 ZWIOwyNrlyy9tCFES1PbCh+bYETkNLfvC7SJsnVIUMi+65TxRBBBiaifeeWKIQOfa2fOlPM2U64
 vI2Emzj9kHDTtDCaKkhgABUy3OPW3EFQ1R20btQXqmbwNVGu83BDrSVRh2Ltr+Zkf/VRirWkT3N
 gobpvwensVMs5s/oGQ5Vid7C9KcRdeywRNk8MrA30330D1Ao6Iud21FXw5hxCcNuI27D0mcE6n+
 zReo8b6YXYvddewyzKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX/2dYbPx98JJ+
 EhPNGbrQtXKIaexcacWVhQgce0MqVe+9F+UM1kjiJDzaAZZqWHUfkqfHClrsypzMeZAekjVqvFf
 ePqZ+dzC9Pn2fp/CEvqFDeU6obRWVgs=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad73832 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=1SZ4gMyvtsQaTvh4xNwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FLqFwAAkVTHdizfMjR1W8jLRuILAjKkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200038

On Tue, Oct 20, 2026 at 11:26:42AM +0300, Atanas Filipov wrote:
> On 10/19/2026 5:50 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
> > > Add #interconnect-cells to the camera clock controller so camera
> > > consumers can request camera NoC AXI bandwidth through the
> > > interconnect framework.
> > 
> > I guess currently we have only one consumer, camss. Could you please
> > include patches converting it to the bus voting? Be sure to retain
> > compatibility with older DTs, which don't have ICC provided by the camcc
> > node.
> > 
> 
> Before converting CAMSS I would like to agree on the approach, since it
> cannot simply follow JPEG. In either case the camcc path would be
> optional, so older DTs keep working as before.

How does the current camss vote on the clock?  JPEG is not (yet) merged,
so we can't reference it here. The order in which the patches can land
would be: icc-clk, camss using the (optional) interconnect, JPEG on top.

Please note Krzysztof's comments.

> OPP is per device, and CAMSS is a single device containing several VFEs,
> each with its own core clock and its own load. If CAMSS used
> dev_pm_opp_set_opp() on its device like JPEG does, every VFE would overwrite
> the clock and bandwidth votes of the others, which is the same
> last-writer-wins problem in a different place.

For this series just convert the existing approach as is. We have two
distinct questions here:
 - Letting camss and JPEG (and others) to vote independently on the
   clock
 - Letting camss correctly handle per-VFE votes

This series must address the first question only.

> I see two ways to keep the VFEs independent:
> 
> 1. One OPP table in the CAMSS node, used only as a lookup. Each VFE
>    finds the OPP for its own required rate, sets its own clock and
>    votes the bandwidth from that OPP on its own ICC path. The driver
>    requests a separate path per VFE from the same "interconnects"
>    entry, so DT describes the hardware connection once and the
>    interconnect core aggregates the VFE requests with the other
>    consumers. The rail level is not applied by the OPP core in this
>    case, so CAMSS keeps handling it as today.
> 
> 2. An OPP table per VFE, attached to the per-VFE power domain device
>    that CAMSS already creates, so each VFE calls dev_pm_opp_set_opp()
>    on its own device. This applies the rail level as well, but the
>    virtual device shares the CAMSS of_node, so it would pick up all
>    CAMSS interconnect paths and need indexed OPP tables in DT, which I
>    have not seen used for such devices.
> 
> Which one would you prefer, or do you see a better way?

3. Add minimal VFE nodes and let camss use those. Converge towards the
split VFE (IFE) device tree.

-- 
With best wishes
Dmitry
