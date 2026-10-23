Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792736926;
	b=YGWwRI5bCfAhHrc+ajfAw4InAwdi3jInIaNslG7toy2iAaInAX+lEtI/uE02A9EAmPdb
	 KAI0cvRuNVPElkePwnA9i3mbQwrP7WH57/SI+296FPZQJJg2fPV1sZU+YrYBzYmkQXk2I
	 Mc4JXeqSgTvNgLoCp/RC9TcZ+rpjHDSMbeH4uYuId82qibdzBGpkeVYNljkPp5//ltwDk
	 WidsnTmkfYaR5vtGr2RgxOJIh1+EN7RbGTRsrYKLpjJA7xuSlxDboD0DGEkgpaD8596c7
	 h4jdJ9OQpnnbV+wjPd7w+J6Dp4c9XigoXJsX6clFAK3zs/56YbSVLfB+xxQrzzC4luA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
	b=ojpgjYyLfggSJk5qokgGLkydd6K7bzujYdNdi5t+RGqPrpKuS+gQSbUuOYJq3Tr1L4Qv
	 2p6e2FSNeqM6loIO7IuPVPidCE/oRtqeJ417Uarscf69XLNLqNIFbZUUTjwvmMJkEayqX
	 K16IXbFRcC0pEFw4OSCLz/w3ayPJeJ+Pw8KUCcpoAGV+dk42u/RIIcvc49w55lOoboJna
	 A5FIiWc/GlUuAVpxHXKZ8y2SztISIvq3QrVIccgkdybQGwPAoOHNw+XY3r7CgAGBuqmp9
	 Dc2GMjyDoKPfpjsjcySX82SRApNf3Mbnp+QGZCFzPvdwEJ6P/V7hTmbdr7swlMMVziA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A9606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318A9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m+u+GPLB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlZSfhS2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F1XE988473
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DW2w0x591pvjHkfz8jt7Fqo1
	AwPIyp85Xma/TxwZuQY=; b=m+u+GPLBPWPBd6lTolvyN8SBmqB80emrAO701WFU
	rJiByVr/KqWc0kdL1MwrXF+dj8MH25FWQGdMontfbuxAh3rXEFxvID6Nfbg6yf/s
	ojJWPM2t22z3tdwabCyJmadKTAjVLyOcxf0ft72r44SQUtFpSqLyLz9EIXQONQaL
	cc51rE7M4lhu7HhTtCJI/HUGUjD5bdMnUswvXjYP+EgfNm/MqeYcaG96Gpt75n2S
	FbPaZHKH2PMaPOaoQ0FwRcRsKVqmZkKRilDTl9gej6SzC0bjFa3eCKqAxS/M0CLd
	6dXu4oUUUKE05Wy9bJx0NKlaVdc8kOkPR5G1lICHcnhdPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtnut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:28:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e848cd27beso1974745ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792736924; x=1793341724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=XlZSfhS2ke5TU324pzhJKCKbiqUVmFtpPiVHV3jKSyigQgYqGEZeNaf8ucVjyK8noD
         zSIv0udnso9fZrzw4TP6Qj3I6cWl2tzXZ1ENXxw7bQlo1r6yWI2YA6/Dw5F9O6L99zB2
         GR7RKEt/e/KS7CLG0IkZ4ilFKQu/E61uMw9yxYsW9nInamX5zDuH76YtPrlEBVQHMiIc
         jkdI1bqsGvESrwA4oaj15pIlo8Nilu5RcdL9LVlaML5TbtMihvcvCNAD1grsAPGpQGxv
         T0uWdTOB+wfTrZWcxuUQz58l+CHtaKPVMEyTsTzWgmt9la/rKdQRxeMlKgeM406B9/mV
         swJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792736924; x=1793341724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW2w0x591pvjHkfz8jt7Fqo1AwPIyp85Xma/TxwZuQY=;
        b=rH9e21gTTedcGSxqemnloZBaT6Rv+UeC48Db2w/8o9mNoH7GPkNwNojKegVa6Wu6KE
         4XgoHFY3tCAjFS1iT/X2Ry110HzFeJmSP/AyDNjv4Pnn2RZ0NHA90Gg+PVslhez2gcIZ
         5622aO/utRQ0G1oL9nDYc2TUhnpCBF8BbC09q86CTT7v96zpUAdU/7OzGA5agl13666T
         jFmCfdrlwBrVu5Lfnb64IZobP1hQBVQJ3zuGq3qeYkD0c550AdGo3HwTTl8s6iRI41HV
         ED1P4/Fn1opgNj9dR1cyn8GQLhaIMiVn23aMZ1G/VpV0I53DPTVBr2cEIX/ep20CD0tQ
         jPsA==
X-Forwarded-Encrypted: i=1; AKwUvByl2I8AYLU80B4QS6Vn12cN+9tUy/B4hjfiX0xsQu9wgl7CmOh++m3jYEMv41tDMr6DPvPN4a96m4m4FXdc@vger.kernel.org
X-Gm-Message-State: AFq9FYKCs6utCx3v7mPMdc0ARyeOSs7FHDVNJYBjy6ueky6c3JgJGOUS
	OjmEvyJpcesI7J4aFlsU5hj0JhLkGp88V1JxTaFgYJP/m3ybCmoFvMxN2u3IvrrT/ep8WXBfWiV
	N3bX2pTSZ5RkVPUb0vHO1PlRl30XFFjZc9zXOXHH/9MnioqeXm2F4vd+1CchMtxydJDt9
X-Gm-Gg: AYBFou2dt4SVEu+SFkBZ0m3zAr2/1LLV6FT8Cm4lFDCKnZfi3J3+5eZnM3nNTjLYEYF
	sw2mUP+oA+W+xUmxJF+if5TSP5BA22j4DkAHxDuSvZu2QGtor6MZ4nKVlE69w6vvsgmbuka/00y
	I9wga9J6uwag+8E3vpgCG9yxaC2SZrUaZBf9Hf7/rTzt6h4+Z5HTMKiZzqZu+qw+eNT1Yk5vskM
	O3IPRqK4/Ngaj5wymU/7/fSCsbkTjTVthkVfjkdbiGCHENu1R+IHOob5dd6IXu30w54rMpTmt47
	d7+G5hnRVv5B2BC9lqE0szg5O4FadO9oHxeuwyNAE3djvuCgVLBgUuxXa5a6Hltat9E3koNVmYB
	APmTWo8chi3LrSEaWQiznYGrneDk1R/2Z+4/RtMvZz5JtNh6rjPIRZS6WfbHZ7bC4J5NlCbSPN8
	SAYGnUD4P381IaRts+BvL+S9B8Voq/kRq2WglffZSGV9C5hoq6F0kL
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118875ad.3.1792736924053;
        Thu, 22 Oct 2026 23:28:44 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2e9:d00d:1307 with SMTP id d9443c01a7336-2ea7cf21f70mr23118515ad.3.1792736923522;
        Thu, 22 Oct 2026 23:28:43 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3b01a6sm5982175ad.44.2026.10.22.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:28:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:58:35 +0530
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk:
 Add HDMI overlay
Message-ID: <atr+k3qqNHWHlvmh@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
 <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
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
In-Reply-To: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfX17vox8CdwGE5
 x0Vgw1O7P0mBaEXw2mXJ4Z80Tykwj6Sji+47EHLH7o8F9QS2p6HO2zpTWx2mjtmFe3D9IW3CLd1
 +77XWVd+xJMd48NAr10IxL88o1eDn7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNSBTYWx0ZWRfXz7UmXppYAlNi
 L0aCAKUs/QfNbO8tSlwzN02qrj5HnEW0JuaxwzFiajvshrvgIwAkn/hm31plROFQPdEGSHTHZ6y
 WGVe+Mazari9RjpEBDryq/pPGbP++J1X1YKRQVml2q3zgc0XZMFuoguKHXwUzUlqJrnUc3V4bu6
 ulD9F/wEIEyMH/SeTrkO3RWKQBI1Z2xZA8qEPxRK59n8JCH0OmrHFNgyDrmzuBQlqa4c1nieMBW
 ihTlkzx6g1TH7CYbRcVOHJTc8faXIC42GNqCTRqytz81u6/r4ucG+7A3RDh6/xYLZGzhY4pCV3I
 JWrqkrQYlI6l2SHfq4LwBpCSZXingEl+drLph44yX6IasgKDmV/zbwAbbnB8KreLWjzfC+B2np4
 JOMHzx6hqow48Uzonjd6cUKYaFDOUF5Y8ZIdt86JVTUSf5L8NwAgX6qogOR3arpfPlKcj8N1rUN
 Tzk5A06OZipw6lr6qzQ==
X-Proofpoint-GUID: mEW8KsKypcmd5SIKw6btZoe6oC5u2n9B
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adafe9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N28F3utlMq1gC_S77h4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mEW8KsKypcmd5SIKw6btZoe6oC5u2n9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230025

On Thu, Oct 22, 2026 at 10:13:29AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> > DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> > LT9611UXD is connected through I2C4, with reset and interrupt connected
> > to tlmm GPIO76 and GPIO85.
> 
> [...]
> 
> 
> > +&mdss_dsi0 {
> > +	panel@0 {
> > +		status = "disabled";
> > +	};
> > +};
> 
> Please refer to the panel by its label directly
Ok currently label is not added in base dt shikra-cqs-evk and shikra-cqm-evk,
will add label in next revision.
> Konrad
