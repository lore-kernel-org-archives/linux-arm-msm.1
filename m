Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755446;
	b=RUT24sRXVCveVqU7txMyafJMr3gYKjlElNQP81Ba22XqfiUPuRuDCmsFHMN4eDoZkcsk
	 Cpb6HBdxKgX0rDGwLIhL1cXE313eAQF7B2BJRkKR7897oVs4CdtYk7nuDCghGV0aLvMkA
	 JUfZCWWbmKnWi/NY0mmxq0vdZC2u4/Cmj4eA8TsRKAwNaJrGYz0tFr1guR77s36PRaBho
	 ehGtHkTHE3JWgukXQYSzSXXMO567+xPdafJmnAhL+qMnfqYlzUFUbQck+9ge92pXO8p1u
	 kTHIEfyIqm8lkX2BkfVnt/5iOoiSAfgiKpLrZ+cbQRrcXzgDzslcwXTYkcBO3jhA0eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uaerF5GYfxUofLkoNjb0f+t6pkLErAZHu2T58vS20sA=;
	b=rt5i5mljeqxY78FoRtkE3oHyB2q+7u5QpilQlUT47yMprEV501KRc1cr0SpFHe9wHr1C
	 uOlPX4xPFg7vqXq89Ui0SUI7BtI+W4zB+NnQRfl+DUyw5MCqqAOKYKc6NAfiEIXphrlvJ
	 qpe1GbB2739FAK6CmQ+vSCtbXd9wU+7LzTLT5PVW3DtL2HjVHywYJzB3Xc2AijY/Dt0sf
	 S6SDuKgTx3ILxIZwO+kHo6YQTru5F+OS+uU2MRV2SmS8x1J85dC1hSP2+UJselVZP5Coo
	 XUP2aS98md+021F979ysHoqoWKe06g4fMykWbQ2T9vOJTb/X4a9ZWkwJ256cKxr5rNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="S6IeXs/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QjXVd2TF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059A606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B059A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S6IeXs/p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QjXVd2TF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8p13864273
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaerF5GYfxUofLkoNjb0f+t6pkLErAZHu2T58vS20sA=; b=S6IeXs/pSUBYaqQu
	FwD2R9cR2UKQKmgvl/YB+crrny/HAA7AOkgtpsyhxTNx8BPCr5qak8SXK57tCBts
	OAmG4NJp6+keeZIUBHTII8syQtY/kNHIdsdi1UIDJ0ycXI5YXKtqUSR6g3qfsMNp
	Sd/QDhpMohM4svwcdN8C2dtgbjwf/5lPd5H8YNw1ZfEtuNh2nF/5Q+riE/P0Ka94
	M/iOWHE6d2cy4Q41eBlcJbIB3+SgdCyNLC+0WTN/a/2Ac7tdHN9stQTxdzAWqkdX
	Jqv1guP4eEqiCzlH5uz0qACWYnH3qOZ/p/eQ+lLwN8TZIQHbLiH4YAyDxT3MR69x
	dVo5PA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55s7bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:57:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363b06bcb2so144309361cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795755442; x=1796360242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uaerF5GYfxUofLkoNjb0f+t6pkLErAZHu2T58vS20sA=;
        b=QjXVd2TFdIU92y3x7EqElBSjLFz3BPolXLxLOryHDGf+JPY2BkaazV/COGKjFKWNNo
         O0hi4KC5muqg47YGUpVtuGvKgkWNt77P4wIf7GFr00b4FiNygJIa/BXlnVcFm13+iAT8
         6nYQHiNUCUER3bSw0rEgthlCyXBX0ANke7V/WteU+XU1UW1A83gv+kGCV94D/Qck+cfm
         978Ajuppl+yjzadYVAO+ZODeD2kg08jpCtObTowyb57xiogL0C8WYamd3OsKSgWuyFpc
         BArM5iVkp1hui4JIACF5g9Jpjcb0gJHlMdqwth/oKl7clL3jSmaChUd4ibCyWZXF9iZJ
         gg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755442; x=1796360242;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaerF5GYfxUofLkoNjb0f+t6pkLErAZHu2T58vS20sA=;
        b=IZJlafm4O43/ufXKyNlXV3h2Sd4BKRmk3SG4icFSwrrC/jmSpYk25coli828QVZDIj
         7hcHoCXgV90AoRJx8Up0q7slYdbCMODQDfaME/S/IGZbyTRe/aZ1PrOXIKdM0xI5Oh4A
         +SFpbugrrTRQLpRWhKgmcbCfqhg2H/zB/IX6S/UiXJLwqoU/Etx9aMRWDasAlqIiSOUY
         TTXNHfyLletU6+zokn0oDGkCSk7tPEQc4Lui3bCfleEGYXsSsEYluKS00ad4NNNsRdaJ
         ASYj+IJsXUvGR3Aev3NSOAiBmnr3S8xN/SZ+QtPKMeraVvcHrLfh+yhJn6tIdKTPvknU
         Gfpg==
X-Forwarded-Encrypted: i=1; AL+hErGKEDJpOhmBEd3stphNDN+9lZuh2gWCgSWcP2JZkbZkCg4hI7F5bP1QPK60NJeGc5GcDnUDIHORNff+v75u@vger.kernel.org
X-Gm-Message-State: APuU4Z+XONImitqJEyFNaqze9zVGpl0YhnnJ7VuJCYDz3F3Nq2nWgWoJ
	sZoqaBQi/gnQD5jRiRuQdLV2Ik8DZmCxI30F/NWyHk4HHlmiSaznUXOH3P4xiGdqdKZTEnSYOnv
	RZTeIwelr4A3oPke2gtCZs9h2sAl2VU7G4HxnRs4lcM8BFbKe1Gfz3WVMP8yuU6MBk+5J
X-Gm-Gg: AZFdTZfZ/Ia1EacJdpziISGEPz6QqgXJXKawyKdB4BP6ilYIPlwdAym5YU1ILx49kga
	1I8OP6BYmH3Q4iDYAeRzVZCx46yqRdcSG/e9r6T+mDl4zWrOuGXJomizDYj3q39FANixp008VCe
	czFqw32iwveVu7wLF4RLszuE5kvkgIu+etENA+mtZQE6ik7fDDlGCsC4Cl7yGO1uuDONNicuY+v
	X3oEy1C7/JgeVz+oowxUnyCWFTjAm3MrTyX+xyf/y38Gr2DOw2H8F9IIERtOeS/JntT2UIT5BcP
	NQR/zLoEUAsPIWXelXRy+lHSNLZAnrnm+wRNV7cVLqT1/4OZEf0Fc2KF9AGM0RvoyfqX+DGoJiW
	qUNKKGFy5p8Yty1PMCkoslqhXVnfX/C36NiVJeGyq6OF1SrPcsD22tM/2dkh4tSlV1+b5u92y02
	6UU3dhKpzM8JbKLcXKizBCffK0yQfm8lDDacsc
X-Received: by 2002:a05:622a:580e:b0:53e:35dc:9bd2 with SMTP id d75a77b69052e-55d76b30ea1mr381983251cf.66.1795755441648;
        Thu, 26 Nov 2026 20:57:21 -0800 (PST)
X-Received: by 2002:a05:622a:580e:b0:53e:35dc:9bd2 with SMTP id d75a77b69052e-55d76b30ea1mr381983011cf.66.1795755441154;
        Thu, 26 Nov 2026 20:57:21 -0800 (PST)
Received: from [10.111.164.147] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895b8bsm21379401cf.10.2026.11.26.20.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 20:57:20 -0800 (PST)
Message-ID: <3d104bb0-dee1-4374-9d2c-ddaedd414f4f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:57:15 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Two routing fixes
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX7W7Bc6R7jKAq
 W3qAdTbxtoexecnkRCJowYbtwRe9LWLejAIEvkfJACmKLV4OMojDUJ+2W3G/8fekF8Ucj1r17LT
 ZfddIzOMWRtZ+GWoaZyACmPOZTVg4Lw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOSBTYWx0ZWRfX2YkA9XD3mP46
 G/LAkyM+/CYyS3rE1+RQKYNRMgwGRxvvF6bbke70jFPMrmlf0QPCbhL25JCBLlOASk3fPoNeiEE
 jE2iCTHOGqug29wnSipJMPJdfYU7e0rV3uDz7E5ZWhgGbwMZn8Q+bSd7pV2umzn83/cI4zsenMr
 ID8njmKV9yzfEy+HDKj9M8T9WNnZkHooiw+myv13lvhRt2N77ukB1dOMqFQnF+kycdKfULzyUK4
 0v2CPNws+VwosKH5vazirGQx+kKCOTRl+scdycHGC0RDPclV1CGZRA2s5tyyX6wMZDBPPtm8HZ3
 cLIWMzoW7Und4DQmW4tVX5+5QSriR3egCqN1QTcJ03pZcCKIZ/u+aoQXSbnv8+ogz/aB7cIfvXx
 VZogN3iL5bCozxYQ5MVp/F+8/QUqL6MhRmSLgzYAFtqVqATp1WUc0xsY/hq0aLZ8qJ9wU6AQnfm
 qNpLM9af7rS2DjZhI8w==
X-Proofpoint-ORIG-GUID: SkxCi3M-dbkYPWzeW_GRpx2XHwxoL5D8
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b090db2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=NqBOXpl7M472BNfDCCEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SkxCi3M-dbkYPWzeW_GRpx2XHwxoL5D8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270019



On 11/27/2026 12:15 PM, bryan.odonoghue@linaro.org wrote:
> v2:
> 
> I reviewed-by and then wasn't very happy with adding a new field
> to CSID resources hw_id because this means we would have two
> identifiers despite already using csid->id to mean index and hwid.
> 
> Bite the bullet and make the conversion.
> 
> This is the way - bod.
> 
> - Adds a precursor patch which provides a .id in place of CSID.
> 
> - Converts from using csid->id as both hardware identifier and index
>    Instead helper functions make clear and explicit do you mean csid_index()
>    or csid_hwid().
> 
>    Several callsites need to be updated to make this happen, but that's
>    life. I'm a big fan of patch granularity however the differentiation
>    between index and hardware id must be done simultaneously.
> 
>    Follows the precedent of csiphy.id - bod, Wengmeng
> 
> - Straight drop of CSID2 retained. This is the right thing to do, CSID2 is
>    useless dead silicon, already RB by several community members.
> 
> - Link to v1: https://patch.msgid.link/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org
> 
> - Applies to camss-next from
>    https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git
> 
> v1:
> 
> This series lands late-enough in the kernel cycle and applies against the
> camss-next branch staging to linux-media/next.
> 
> Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next
> 
> First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
> CSID doesn't have a corresponding VFE it is entirely useless and violates
> our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
> reason to keep it around.
> 
> Second is a fix for a longstanding error in CAMSS which as stemmed from
> the original development of post ISPIF devices. These devices have a 1:1
> mapping between CSID and VFE so the mapping we have given to user-space
> which declares each CSID as connecting to each VFE is just plain wrong on
> these devices and has always been.
> 
> So the second patch addresses that longstanding issue but, I've been
> holding off on fixing this for a while since I believed it might require
> extensive surgery, but in the end its quite simple to do.
> 
> Finally the third patch is a tidy-up patch which inverts our current logic
> of continuously adding new elements to the src_pad_code switch for new SoCs
> filtering those SoCs down to a default: statement. In fact is is the old
> SoCs which are the exceptional case so, just do the switch for the old and
> the default for the new.
> 
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> To: Loic Poulain <loic.poulain@oss.qualcomm.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Hans Verkuil <hverkuil@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> ---
> Bryan O'Donoghue (3):
>        media: qcom: camss: csid: Add and enumerate an id field for CSID entries
>        media: qcom: camss: csid: Stop using csid->id as both index and identifier
>        media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
> 
>   .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
>   drivers/media/platform/qcom/camss/camss-csid-340.c |  6 +-
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +-
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +-
>   drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++---
>   drivers/media/platform/qcom/camss/camss-csid.h     | 18 ++++
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
>   drivers/media/platform/qcom/camss/camss.c          | 98 +++++++++++++++++-----
>   8 files changed, 126 insertions(+), 42 deletions(-)
> ---
> base-commit: 91ff71dce5e770e7965cb3b09c87f6d334c6c4c5
> change-id: 20261122-camss-routing-fixes-b178bdb84f20
> 
> Best regards,
> --
> ---
> bod

Tested CSID0 and CSID_LITE0/1 RDI capture with the OG0VA1B sensor.

Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Purwa EVK

Thanks,
Wenmeng
