Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794969;
	b=wEyWnqZGWNZCCZ9FL1mpIN/A8sfqYWE4aYy45R+LUpxhcmcpjvvDk8sCqi/Tnvjz91xU
	 bB+6jozcva0sfFk4rttAAJgc6Kl+AdGVxD2v0CgVtFotbgP48JnmSQjSCcidmtAGY1OaJ
	 SOeBK8yLFCd93G0ZQ7HD1Vo4Pwy5j97Kv/3SRFzpZgsZhCJxRysndLI/wZrA1VEr58gKm
	 0FvySpmJqIxgs8VzFEVUo+zNpsMiCbuhMPGRlkW+9a3anyD8TcvrftZt04pxlklX2c7ud
	 WSdsXMI06fpqXdSNzcpJeIQ4mt9ATQUSYQnazR40/6E91hAzE9s8HHb1zya/RwNlq2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
	b=ikJbaoSCQ40hOjuwBt+GpqHI1mFAk0VJkd9tVKL9e5vPKlkwvtgFxwwCKhr6FO47PmOS
	 +0F2ZYbDcZZVHAxEQzOJ1t4bPudXQMYMUS0VWmV550Kovtq9sx1GsA4+Fd6YnegLZp/li
	 H48RG08MoxmjcfVftunhjMdeFkilhG7HrVOYZGqKPYDBGT3Tv+rqoiB6tjaTA5ekqyHE5
	 nhbFb9PNhCYXpsfepGL2irb+qBIscAKuu0pYcQteEXQIlM9oAC6j+K2XXKq4kGr6aFSzy
	 VyyrwxJJtjIuOlNmnPlHP8Z9ytFiGmF6UATqS8n/8I8gpzcsQ4BsSb/6qcJKGToVj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60198606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60198606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaATr2728922
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rht0f/oWrWjTnOGn/C9y300E
	2QsF7Wp04C0cb+p59CE=; b=oALTAcXkLMxJZH82YR/E8oEJjAXU54X7v8d8+GVW
	Sc4kR793PmMP/dd5+Jx9SjOqmy0XriHDnIuzzMJHPMuTJVMRaoQwTZfhqB6v5sMa
	IorUNMrHkn9QiTuw3RWlTs31XzzDF2eQDBQeuI/v5k/ptUU6z+sDMicz2yw6jGI1
	rRoUd4I7yrcFlJXV6MlATRmsTFOZ+Dmo9TL+I4lCVmvXIsNKQXiElDviXnBvsape
	4QK1uNEjPXHmOWrdonleCa0azyjX5QmxXANgA+WSfcRoNL41QENdx9FW0U1yXW3G
	CiHMQ01ceYE7TK2Lbrtx9jt5ZbKbxsE9SEE9B1C26pnWjQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbaw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:22:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso550777a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793794967; x=1794399767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=AJgJ6RU2rLOmRuZX+a7xqXvHkAIRgJA9ZRrfUhmOTLcUxWksjSzSsilGLUCgeH2HgY
         JjTImsgFaQqn+ESUXysimgCCmtYHE7RopN3kXfNjHUQY5Pv+xfvE8vc1hhjWWL+MtNmL
         wjQY5L2DUEl9GqmJELoCwVPGynkK11rTN8x7L8v/KbIT2jLJf5bZacuN6yODUM3Og/Ql
         9ojyfiN5iB1Nz9qFWl6BMZPhaz0wA9F8jmfKzzuDYumzCLNqUv4+W4NpsKb4brWHHhV0
         WmyrwmOd/+9Jsrcadz0k/y4ej2X3Ndehyb+rE6u1HJ4YZ/9/C7cWhsQeOw9vdgBKmzFR
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794967; x=1794399767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=a+Ssky/+9hGis67BrhuZzl43cgOceI03T5Lcne5Wdz4d4bz5qPUv9HNvObE4xHpENt
         nNAg1rMH9W/ycqIhTe75gDqcpWqV79WJj7uiQmKIXz1xVIACDgOzJc0VTEZdR5df8Yld
         DiRbX5bp00raAKTgTFrlGX0UMT0o/MLvMW1Yc2lkrLDje14+MauQaco/Qhm8InEfihLj
         0hSo9582RAPpILRa4JlfKOlf2G5zNeb9pfyr3ihy8m/vzO81tPNx5qcJOICr/eVbIndP
         /LohE7ZQ1mkaZCP/BKuFWMGCd80cQrORBo6SD6LP4Cjy/9CR9Vjer8eyCCLhrHA9x9pf
         cbXw==
X-Forwarded-Encrypted: i=1; AKwUvBzXejg4oxEAvW0sv5jwsd7pO6sLxrMwqWokMGn5hzA+4JiklJWeYK68ZPxuxUQs5/33Yd80XGYlmpU0XoDG@vger.kernel.org
X-Gm-Message-State: APuU4Z8qxn3qksOPpOq8+7WKHBDDjBeXqK8OBNn0bmNAOsgsTYPXIgyf
	5cYsWOP7IEAi0GnGQOkeRhleZ8Rqqo9IQPV4VSuEqwyyfiIOiqA3rv6J65HQyBx+GeLOS4GOqe3
	xyDwAW5WbwoVsAGe56mq+O0MeHlsxGuviUnLWP1npQt6C4p5WsMas/OJJ3DGYnCf5bIra
X-Gm-Gg: AYBFou2HLXYx2NBD172nI4XU/b2lyqk8Cc4CEG+rxa+pPUJ58Sar84s+Mvm9Ry5o8fY
	hhlsIlvXr2rrOoJsPyOw+21O4bhEEz1w/6Hfr8glwDPKMmd5juqnt+pV2FRrecTf0+B93xUmhd+
	ahkQsnzYaw3BrhoLwBZMyXuv2dRotlz2i8JXG0k+bp/xfWFv96Gpc40tmjoooAGU2HUDS7Xdnj2
	WJX1+ppsdWWiyQJ2j63wyqcoXFyA8wmpJ7qNxbU7H/+Plut2VaU83aeqTrXZ0RlzmxF2v3D5UjS
	JCXamwBzNFWBoR7KYgU0Ha/5vTC39clG25LaQAxyqVy9wuzEaytNJWeniFm+F2hZlHNzvcd5onX
	KEyLikZMAiVmcVnFEPSgA3ody0+mN9jDdUKg/xnrK0vNBs3Zu1XJRUkm8HPJV0H3QZrxz5DyVTy
	/bfuOx+VInT4DHsw==
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767065a91.20.1793794966811;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767039a91.20.1793794966293;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm9513731a91.14.2026.11.04.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:22:45 -0800 (PST)
Date: Wed, 4 Nov 2026 20:22:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
 <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
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
In-Reply-To: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb2397 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9PWAzHYUss3Xwi-i11YA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Lx7Fefy9k-B2QxdN39njj9UFjdDSYbFS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX8lIH2mTu+7V3
 asQz0Choq1KSVePP2Y37zQUHKyVp25eHRFCb1nV3hJ9NZXkocW/BIEh43fPu+ityw7F85xW3yGi
 iDt9P6j+Tjp7R5irPS0tsMD9sAf3hs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX3GjVH0qHFZN3
 zTT1+GEQ+tvgSiI6SLKMoAwT6SuwMG+pZ2Kgjvxl0KAi48/q9EXIur0zRAK7b8MKt9I28StpuEV
 wbZqGEdlhuYT1QL5/qCesURF9SMG3qe30RVRQ1vs+Io0HoS/zPN55h+NQp7kpMC/Jk5dL8dgqOT
 dBz4BvrQ/aWPdmhpFrb/8AdRSpPzmTLo4QheO27bIC1kfsWjBuxWbOf3rgiVJOllvNiR30kq/4P
 haKclKALslaVSiEC1Wg1dlbXgg89S0tGyKPUhqR5uw2fiBzPd1J4d/ZrrZNvBqYVY/33Tpb/BSm
 PuzwRY/bi0n8Jd5cj6s8zQ+KkXTjLatdh2Y1IoIToaXaS+P3tQxNMOg6daBQfpgGceSg2TCZY3V
 ZTDr4FxbNC3/wpViWulT4Xq5eM+ImNoIvlGGqOXOncXF4i3R68VCydG6s5XruVoFbPsb+H7815z
 FNEgZNHP2qUe8GnUSKA==
X-Proofpoint-GUID: Lx7Fefy9k-B2QxdN39njj9UFjdDSYbFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On Wed, Nov 04, 2026 at 10:04:00AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:42 AM, Shawn Guo wrote:
> > On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> >> On 11/4/26 8:59 AM, Shawn Guo wrote:
> >>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>>
> >>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>>>> and DMA queues.
> >>>>>
> >>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +	phys = <&serdes0>;
> >>>>> +	phy-names = "serdes";
> >>>>
> >>>> I believe this holds for both GearVM and embedded, so you can move
> >>>> it to the common DTSI
> >>>
> >>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> >>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> >>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> >>> the link speed.
> >>
> >> Right, but I meant the assignment to the EMACs specifically
> > 
> > The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> > variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> > GearVM doesn't expose the PHY to Linux. Or am I missing your point
> > completely?
> 
> No, I was just completely sure that the nodes exist in the gvm one too
> because it seems like they do on lemans:
> 
> https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Ah, right! We will likely have it for Nord GearVM variant as well,
so your suggestion makes sense. I will update.

Shawn
