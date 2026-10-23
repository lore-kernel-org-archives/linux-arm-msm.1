Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737450;
	b=qk2CmZ8DmJ6FQqhDKnSgfAA0PrvMCGzF2RyiEwd8OlzBWvdrQiTbUcyhcnlTPr5lfNKm
	 mTrdeBjkCXwQkcCbqiVsbm6V5tGoVQNU+lsCzWPPnnSr+iPu37jsRq6FGDTvudB8sK/CC
	 Is1/AlF+nGJ3IBtkFTGfY1adi0CBbPsOl484bT6cUutl7oFIM+uSkbhH7sPJF42FKDTQX
	 fZEatq8LN5nl8PJ0r1o/U/EDWxGSQUd1KVAzPZrfQVBSEG+MlqPeCFv8m+dgu/YnBvS9d
	 j9nNQ3La1czEOOuvjraWJn4Dbvso3ccWlAi+4b60y3xzctrmTO+k5GSdQz/WkhE1+Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
	b=o3iHa+5k9dagZ7PgM8z0KZVCCenuJPG3dqi6IzfFnE3rGl8aiLRZVVE8HZP74hoA4j8l
	 +0GUI0Q8VYqHO3MBoRIMg0kCofq1ZoFH8YJodWPpvat+ETqNmD7MUzkk373gCvO38tnaO
	 8AL5pMVqrist/+F4AQYVHYQOTAupKVdA47/HYLtl1Plt+fqHLWB9Cj4FokWWF5hmv1Zla
	 62BM+IkY4JhF2M2GxMCRWCm+assPcVwhND/EYhQiaICSdTCVjfSvTwGWdhDbeD9+X2t9I
	 a0WXM6d4DsIGKw4wawdSnH663rFTt7jOak+peJ3a0geD+bDNPk3iRqByxMty4MmcVXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD755606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD755606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F12V2389451
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4w9d0sRIsQ7UXyR/DRVXY1z
	FUeXW+at3Um1GzAx8ug=; b=ENbUrwKwANfB9VZ5cqxGMnLdt+7iBTxqZsStqlBr
	wO9G3FNVtMFEqSyfi35SvjYNEzqF7S7XLFlx06wItlOCffI2kxTGa7z6QV3euD02
	CZ2WCtzUMhdhFSHVZLdTRGMSonN2cf9wS8ES1FxfvFHHY36vLNW7v225W9A5s66i
	59MYsKf7AaKuk5f95DEZ5rzkk0cvV23yVo2wfUOmWLJci8Z3NuhSj7JYwMvltnx8
	XGAz9bm92jlcmI+Gc6hboVIMm3MT+Y2cZ9A1Uomyb96Ltk7pLaSm0Gjk9H71laSP
	QeMZYgd1V9xOS/p0en+11kCAxI1v4gUtD8+VtppQAeU44A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpa99w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac53d5ada9so136570a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737448; x=1793342248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=fVGCXmYBazdb8QScgD+XyhVDN5GaloEShl7S1P3dkarXLuofIQs1FD3wijAFBIpMiX
         xp5RPPk1GdxdeKgShSNHbPot3RllVZfA9lYaxJcBH8X5Ji9u8hWNdqlQcux5c8lo6kDI
         aknGQANB6YRBkmYOTEzQGmmQHsiB5Ta+SE7oaT5KHo5ukrPeuIFcFJtIeIxNwgqNib53
         hWahYfOsedi7dDP+QusiOO7K82UogAeJjQEdMabOWupNZmQZ7hwZ9nJO/fw158QlD5z/
         wmF+I8jEnLNHaaOxLrcQU3Vos4Njt6spdZJqc8ReaUHJfk+vZ+RQxPFKtBjJXvFCVIBW
         w1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737448; x=1793342248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=UokbIzp+HFu24Mx08xbaeYfrJyDF+YgBe0GiqxhJ+PLVBr/acg+9UwtbgaASCuqQ4c
         9IfWOKJ3wF75YgNFF03RdyNc2S8qissE96H9hCYcE+jSmKo6F6vJhdxFtD5nfDbrK4px
         9wgnak6r6rn7mG4cxIAXzMUYqL+rwws2eCTL+VC+lDuuwd5O5ZplQ55R1Res0LubETcc
         szaQebLc78glfklhBpBglreKZMKAcVuZcJvbWtCgTajbWeChOtFiUwA5BwygnrAPe1y4
         o2pcFsIRdBjO0gmmmGB08o+nyz9TjTfTxUsSAlOKzR8h8TZC3SC3C9XXNfPdn7ksBuwv
         R7DA==
X-Forwarded-Encrypted: i=1; AKwUvBxoXCfdrFSpTd49IeVjkb3hV/Z2egy3gG1ZYEZi5fzVK+E/2lAT+U4zSbzBw9j2xzZ4A4PyYJrMaTADpAAC@vger.kernel.org
X-Gm-Message-State: AFq9FYI1bmMhoZvNg8PJ1xoPdRELoJvOlswrQI1LXrqc0P2TCDPTZd/p
	LHl2qeq9K6nCNL7dXfkxYeZzVU19CfSP3dssLKDq+ijjtJji4FRUnbCwKFA6p6R91btzEladp3S
	6p82rD73ooAZ8/PkisnWVPLR78Bv0AbQd6BVb5vuZg8YnXF8RI5mRgqUtXjgO/Okv6d8a
X-Gm-Gg: AYBFou0OC+PTCo558EKiiCP+gIgazoubLJ9SYrbAHvF189U6PQ5/G+b6ORHEVra5Llv
	v/Uh3jwwSgSK4LSfNndHGqojf3YMTUi8oJKYPyILku5Niz5Hr8QW3uk5H1QB4hASvG0K19PjaBT
	mkqJgDsf2wrhppZb3/0aDeoIFYbaygMzlRm5WJjO4bnlbdDwzpdpypT23UCSZwgHrt4rJeRt+C1
	rDzutHEpG5Z32BptkfH8R2V2EVCtgCtHVhPwDBr4Q2opoANEFCFRI9VkbfbBiAG1+vbBggZFsDP
	U/arWLnIshJ3h39lHlhi4NvhHaaCIrkB9j4PFMHa9RMYdMNqAV8XmO7zVb0R2RPx8jqI8D28kqH
	XhVfITzdR/jmgbMnbRHtsaxqVCpjSyyxjnts2rVn4+OxAJ13QzGNutynhyblcUv4H/p1eLl1XoW
	erfapdWjPe/GAZsRgynhIs9OC+kWIFcS4PCt9GomtY566T1jGFNrLL
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870546a91.4.1792737448078;
        Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870495a91.4.1792737447564;
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm7300020a91.1.2026.10.22.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:07:19 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
Message-ID: <atsAnygcrej9e8Af@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
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
In-Reply-To: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfXzkmc7johpNGs
 vzhzwNRBmQx1I7qu5FJ9Cla49Jnkbinj4xHl17yjTwVK4jV/RKy8nnt3RuwALo0TqI82Kai3t56
 Y5ywQBTUYDr7QVj6aKG8DEDKi9tiMwA=
X-Proofpoint-GUID: fTBqt1iiqlJUGZGqGS-onBWD9wOrSwqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfXySaBXDk2GanQ
 yVc4E5JZ8qxRAfBsG47xesoAZlyyPiKsJn97DYCBEmgUdJKAxsdsl2cqzxSesPAf9QDQbHCM4cX
 GSewsyeg046PTQ59e3bG766uU+6oe9fdVadOYORt84jnpZbQDTevVal5kTeaZMWSOZgN7RNPSix
 pFmLFLg2mbto3hPKjswWneLoVeDckTZcxvtC1mW/FCLz4TSYp/NK5IRrV8t8VIFniuPE9yNwcNw
 AoFcAZCcTj4fnPLi+EW+u43/etODrd5Jq1f2g0yFpDvtfDHStxyaBj8VT5r/l3KztPS5PZJIoCo
 BBRKOljY1zb2tOEoYj/EXyPgoZRO3eD3pDAA9mntvYq3Wh/MgmEr0UPGBqqtdbcEsp+8wnO7BAj
 w3mRBDSL4L+/1XVaJIVDEfFuN4M387gOyI7u6Apdyih2h9lXRwbqdUzTyWTIJRl9USsOLipVLBF
 JRGV+XKiXGbOMyWhTHA==
X-Proofpoint-ORIG-GUID: fTBqt1iiqlJUGZGqGS-onBWD9wOrSwqr
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb00a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i8vls60rVJ9ycRQRyeMA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230026

On Thu, Oct 22, 2026 at 10:14:54AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> > card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> > named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> > DIP switch. There are multiple daughter cards designed that can be
> > connected to this PDISP1 DSI0 B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> > - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> > - CQS/CMS: DLC0697 DSI panel using a DLC daughter card
> 
> But if they're daughter cards, they should probably be overlays too?
These daughter cards are connected by default on the respective boards.
Therefore, we keep the default display configuration in the base DT so that users do not need to load an overlay for the default setup.

Users who want to use other display interfaces can remove the default daughter card and load the corresponding overlay.

> Konrad
