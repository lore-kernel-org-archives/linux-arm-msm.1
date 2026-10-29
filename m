Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238087;
	b=QfgkiNKSbNQMYsHS+aDwP1Op4ujapZ467JlYqYzsNNNcuQ+Csz3/nq6MmImzbvvBP8ah
	 A2KcTVyoYDopD5iiXyJSqKeMKMuX1kwkcLG9QDf1OrzPBckVLnXcCDu13UBhVIPV1iSY6
	 TQuqXKnbmt8EEl0JFK/lZkqdP93royo0INfo158wsoQAQ/pq9f8osjIyarSHEYFRpXNnu
	 R4zI257RpgBvZPPjbo7Oh85Lr+JzQ1wr49qfgjodEYBWLeFqWTGPyQ1tRfDH5jneJIp3G
	 GhaBRx7I9UpuXmoap/tt3lRwOEweBla27jxGVMk9TfD79eypUHXnFlozxzHygkRc8VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
	b=UiBriaTHxeiRVsl7BVMohk/QiIW6HaYUc4LV6k9b1e/JjTlwuqsYit+b1RskDKvF4o7q
	 AWc5gzcaO9sgBGVMxC/MMYb4F+KF/nzDYcAKx4X2FsGgj9iDld/kmpleE6AzRhCx1RV9+
	 RPCJrI1UEsgPVVddcLYRISzFwxC6Bm7u9J/PPOZ2Qk1ZMI5LaXijr2fr8T0NP1uD2yy0N
	 GKWvB/bJOLJtE7VpieV3izJsG9IuwLrhtkQN2rnxX8N43s3I+KW3rzAyNuuwcRM+5D8LC
	 NE6st6PG0htcI0gz7Y+HlDo/ZfqiUczDUgDSFkN+tObd2Hyqv0iNCBDEfwgof5FHfEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FO5r/cyj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCm00wzL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1F606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FO5r/cyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCm00wzL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMA2O13482293
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a2kuXhqVMsHVz13E2+Xy/aRM
	3eaxUgD5cFHLsM4u7/8=; b=FO5r/cyjOLkBNAJFnWxgB1NUvwodRJijYg496R31
	+KlJUmu5ZzIxTukS2wkBt+jNNXzrVBAVOniHH0vUQR7NkDw5Q14ah7KioCAvNO3L
	Z82Kq6bnDDoU/ptI4fSoWwJSuuxS8h0RegwcKGsuou/2UeKx43kwCU+51Gi1d582
	lT7uYlLk/tNK2hwrO4ixPCvdRH4lFzA/Rtk90AwjpOyTmCKshQs1SY5f4B43jItu
	ZNORkbmem2nRvttm3Nc/k3F8YKHCZXb650NqhYd9hXwqjUPAM3ecRirD4riQBrFg
	xUO9fV9KL6sY/hfbtaDgYLrVz6o5BldLV4H/W5FB6byxEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneuspkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso55209885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238085; x=1793842885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
        b=ZCm00wzLAqoK6HusLTcU4a5ee1HNeMz+FjO+C3k5w6ltHTOoUrt59Tozu86+kvCwzp
         mAtVUIb/8b8bl8HSqcFqywkoaxygC91k1N/JqDw3hmNKnugJL736eD2X2xkLFciUZszW
         0WR3aRecSG5RuhNVwhtfkn+fuWU0LKQ0I8AN8KhXhZzmz6dag/cNdOM69pVKK1auq2bU
         0HBzI5qnGzJnK0/KLN1QddbSdYMBQBBjbIyXSlc9cXoHJU8IW6jNW0ylaBqPTvsjbaKm
         sdEQWQMTdQi/D6cdDfwxHhRgJDfFDfyHE3f3e5BHDw6VWF4hFgjcdVgvUDie8mgSxOrI
         RqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238085; x=1793842885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2kuXhqVMsHVz13E2+Xy/aRM3eaxUgD5cFHLsM4u7/8=;
        b=wVMwhSbi1IZdhI5j96PNFQOMEFaDIRIhUiJQYgwQHzBgQrFn9rMJXYGltWA7/GxYJt
         cnKsw7VlKWPVtD8MiL/1+N2RmrDgSxqoXBRTUlHLthHsJG7KwULUnT7RLnkrSHYY1U5s
         O/gudX097SADJyW5BvRbJo+Pv+j1w4Zlk33qULzb8l4MjRoQY35gcGQnGm1B6auasRkZ
         JjXdVFt1iC2XkIK/OpbDM1zxbWkHv5hkLtsKozuciFDpgeUK/4UzxqVVdNUn4YVMJODX
         Xlx6sAYrpCVD9w5FlcnRD+zM9Xbs+gDlFf+w/gdcPsM1Gd4IIklB+hDUwPoW8SL62YQa
         67eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdfl4nVsaQz6NjT+VgzAn6rsfcL4XJvI4Cf708KjfM6S2Y0+o4TL8Nm3evVT3auMmL5sZPCLl2ZFW8wy81@vger.kernel.org
X-Gm-Message-State: AFq9FYLmW/8CAZGsfDv9ZJ0+o5/RO+Kscfaf1TuKb6u5kv0ZXS92xAbc
	DrdKbqItn/rfscUMPfMGcchmN1c/Smz72QI4dGckSjrg5TxPfvinBJTjDnbug9YFwf1aqlakuT3
	zEtSLt+tKXdlHMETDWGnjjOWRT+xIn+4XI8IbXr9bSRviCcbCo5q+VksrhonbKqGkvSBq
X-Gm-Gg: AYBFou2geL31HWiEWgEZ0nHyD7v/T1Wyb2zo+fN7ppgZJV4TT+lsiI7esIkewJ/bFb4
	iLjBmFAg57rbw8LA0uA7m4xQeJcK+mKDldjxzVEWSWig/z34pRGigIiL1xF2EwNW1l8M4FNaIFf
	Jkx9sMg+I4U87nI9Q/t+3A4lVzWFgWxSEY2spav7t+WKd6IXfRiNO0nbA7tTcS2jXIeiAlkyOPd
	xccywi6SckL1MR7mey747iw3PrGVFsltBOQMM/2qJI3WxBzUfDuC8PRJO73peOHFISXd45jNg9f
	XxvL61Xtk6hEAbrAupqCiDFFJnVdjX8/S8U4PkCHP22Oj4BZVuzGqVnAOi6gGxxfP/4w/56PXJl
	To8HgL5kPU0YjRtg/wkvCBBSE/vyV74K5jCKSCyT/IuqueuMin9W4dQLNeEGeP1TtKdYE+vX7xo
	Xy7hcM5qEq2LZXl9dAaFMfYZW2YlC7tDSHc4JJf9BL5RUdZFep76IMBbvQXD/XYw==
X-Received: by 2002:a05:620a:4104:b0:944:4e6:85d8 with SMTP id af79cd13be357-944132689a6mr211050485a.5.1793238084534;
        Wed, 28 Oct 2026 18:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4104:b0:944:4e6:85d8 with SMTP id af79cd13be357-944132689a6mr211046785a.5.1793238084012;
        Wed, 28 Oct 2026 18:41:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd27eecedsm69199e87.2.2026.10.28.18.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:41:21 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:41:18 +0200
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
Message-ID: <6ivurpkaxe7rs5lxpbyahpst2bqzpkcb67whcymoopdgo6sjvq@xd2otcdpe6gg>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
 <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
 <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
 <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
 <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261028174523.3514860-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNiBTYWx0ZWRfX/cFPtnHlSy5/
 TQbwDGH9z4ize2MMuUz5HwsHuQkN7euO8Lkw7Z5YyIw54FK42fcbsUWpmEZiA+aHpBjQfDok4iM
 cFgQfp8yBjofKpKVzHB2OTqtTf+XBs8i53r9IUzd2KcTRAMAykUNc5LNoOh0z1EoxZj+7kTzvwN
 uZ1UUjeiIOOzKhtmCbG10uoIZQfhnxHarsyDddOy6BYn47HkRw2q0StI0Aws0s1inEQ5D3oNzvs
 rH4/dxBlbfPYN4yksfTWil3XmV1sWwUlwZjyNG7IyGkSYHncE0GvmTgSuq3GFNi/RTy8STBuLNU
 PXNtCB6weQEycHhUbipa138cOR0ROOQISFJotdholSUXkNnzZQ19ml5uH/gwumVbrUwmM+eUyQH
 NaJzk0ANq6t3bUzgwrKqychHi6xTpODh1nnx5OSHWf6g6t+oU/HhOQOCiLr+zVULw0bXomNa02g
 Ugb9mp3XVS25rfQpirw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNiBTYWx0ZWRfX7TCi3rxzthio
 8/Zt05EWObuxZxQw5+qF15X/TQy3xAvELaGj4varZn/c6ZCNLv30kYJdPWNjwl/ZNpHspWTGK58
 vCKzP/jpsUqMe3DK5qREHmdfbaCHkz8=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2a445 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=rTgqbrGwJKAB67wPnucA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v2gpWJF_9i4fDQE869r4YOYCTpSMtrjL
X-Proofpoint-ORIG-GUID: v2gpWJF_9i4fDQE869r4YOYCTpSMtrjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290006

On Wed, Oct 28, 2026 at 07:45:23PM +0200, Atanas Filipov wrote:
> On 10/20/2026 3:49 PM, Atanas Filipov wrote:
> > On 10/20/2026 12:45 PM, Dmitry Baryshkov wrote:
> >> 3. Add minimal VFE nodes and let camss use those. Converge towards the
> >> split VFE (IFE) device tree.
> >
> > Agreed, I will take that up separately. To get it right the first
> > time, could you clarify what "minimal" covers:
> 
> After going through the options discussed so far, I think the VFE
> child nodes you suggested are the right approach for the per-VFE
> votes. Below is a concrete proposal. It is separate from this series,
> which stays limited to the icc-clk conversion as you asked.
> 
> Why a VFE node is needed, not only convenient:
> 
>  - The VFEs need independent votes for three things: their own clock
>    rate, the MMCX level that rate requires, and their own bandwidth.
>    OPP is per device, so this needs one device per VFE.
>  - VFE and VFE Lite have different rate tables (on SM8250 vfe0/vfe1
>    350-720 MHz, vfe_lite0/vfe_lite1 400/480 MHz). A single
>    frequency-keyed OPP table in the CAMSS node cannot describe both.
>  - Today nothing scales MMCX with the VFE rates: camcc only applies
>    its fixed required-opps, and CAMSS sets no performance state.
> 
> Proposed minimal node, one per VFE, as a child of the camss node:
> 
> 	camss: camss@ac6a000 {
> 		...
> 		vfe0: vfe-0 {
> 			compatible = "qcom,sm8250-vfe";
> 			clocks = <&camcc CAM_CC_IFE_0_CLK>;
> 			clock-names = "core";
> 			power-domains = <&camcc IFE_0_GDSC>,
> 					<&rpmhpd RPMHPD_MMCX>;
> 			power-domain-names = "ife", "mmcx";

If IFE_0_GDSC is an (indirect) child of MMCX, this is an overkill. You
should not need to cast votes on MMCX, IFE -> TITAN_TOP -> MMCX will
work for you.

> 			interconnects = <&mmss_noc MASTER_CAMNOC_HF 0
> 					 &mc_virt SLAVE_EBI_CH0 0>,
> 					<&camcc MASTER_CAMCC_CAMNOC_AXI
> 					 &camcc SLAVE_CAMCC_CAMNOC_AXI>;
> 			interconnect-names = "hf", "camnoc_axi";
> 			operating-points-v2 = <&vfe_opp_table>;
> 		};
> 		...
> 	};
> 
>  - Only what is needed for the votes moves: the core clock, the
>    power domains, the OPP table with required-opps, and the
>    interconnect paths. reg, interrupts and the remaining clocks stay
>    in the camss node for now.
>  - VFE and VFE Lite get separate compatibles and separate OPP tables;
>    VFE nodes of the same kind share one table.
>  - CAMSS populates the children and uses each child device for
>    dev_pm_opp_set_rate() and its ICC path. The OPP core then sets the
>    clock and the MMCX level, genpd takes the highest level across the
>    VFEs and the other MMCX consumers, and the interconnect core
>    aggregates the bandwidth with the other camera consumers.
>  - Without the child nodes CAMSS keeps its current behaviour, so older
>    DTs keep working.
> 
> Child nodes keep the camss node as the single entry point and keep
> the change small for existing DTs. reg and interrupts are not needed
> for the votes, so I would leave them in the camss node; moving them
> would only make the child nodes look complete without changing what
> the driver can do.
> 
> Does this match what you had in mind?

Yes

> 
> --
> Best regards,
> Atanas

-- 
With best wishes
Dmitry
