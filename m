Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A333936E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718535; cv=none; b=CPGOvCqeqYwrw1dax4gasBrwyM/XqOyZiDdlIRZgucAVgOQRMugKzA6YbW0BrWs1tykUdGtF7yZ1bfxLzSEw43nP67kdh0ixhxNOPrYf2DkRz2hZ/qOWjLf+0Z1NNjE+gtwaLHTeZ3PxbpGpuoAEdJLM4MruVFOLryOEz79FRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718535; c=relaxed/simple;
	bh=dGaK6ahq6YdjKsxo58VyUhgDorerNjunqKzDeEDWtIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuVnDQXuwIU8SaMfv05ua/VyULhdTVIwui9E3/7HX6e4uUtk6RR8fXCvuhjdJYe+irry+94WvazNMZO7cO2szA+e9LkKREle8igeudpOIsEilvkPlM4IzUxBYSNt8wQ6GZ0g0+O6bS1SrCN6XZFkYkhsViP/41mZOFYjZtlUeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc/hP7nz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThYXRo2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc/hP7nz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThYXRo2b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MA7TDV512847
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x3LCiuuukQ+P3+NcqWiQ5cLn
	eYgsyqSEhRzkWM6AiCo=; b=Rc/hP7nzDHGc8MdN+SYJ6dAvQqF8lozqSu7mf1X4
	LXAj8EYfgl6dTDRdfymXRKo23n1WJId7YRvdhUYqrkBkiUtMp3AOQaZWfEbS0pj1
	/AvP+NVoxGufMDPQv7oTSrpmPkC42ASJDJDOmQuHF0sh2jEbkeAuahCHLwbVw+vo
	fiXDZlo41bH1DYSzCrOnxo+jNpeochzcBYe2COKm2PW5DLJWUFw3UA31US887LRd
	0i3W/C89s1r4NQrViMmWyUalPGri+zxOyVBcR9w3HZXASzNL7WUFhPptiNOHQ/r8
	4xB72/HZ6OSOaZELd/aARlBUy9O8SVpZLJeLQ4AhVKfWQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu786bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:08:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so2908595a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718532; x=1785323332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3LCiuuukQ+P3+NcqWiQ5cLneYgsyqSEhRzkWM6AiCo=;
        b=ThYXRo2bVqdacdXZm4bm7EAKldn/6e4hrelUWyZz0Cm2WE0B+6Ztd20C4Y6H6XuSf9
         xsFGLfACPl6MDfRbGlulZ6FWEsTiFFp8TE4Z7ClXEKrvvwYbZLlFFHNK97ZA6kKDn6/u
         u9kp5suK8xS2d4KdNyhmy+mH83eiZU0YEms62ZrqAAd5kA/6xVEIVinZ9uzIX2+tRcSK
         tiAEVuwDtkOJuooX4jDq/4swjq2DIxvrtO+pZhl22IMZGSkEUkfv5LzDjpHCQUV91xX5
         WwWbRzlgx6PnAcyIY4qWA/fZgeMzY0kIragjBJnLEBDpn9FVeizzFVe9mtgi6Oji1E4r
         27LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718532; x=1785323332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3LCiuuukQ+P3+NcqWiQ5cLneYgsyqSEhRzkWM6AiCo=;
        b=H4jtaoU0dCMKxgS7ij2LIxMxGBAfmfcUXcULhdmrc0W98UB6yFk7KfgEmfwIQ86Xna
         lokoqA9ki0kYXCMnF1AvcA3+euX39mW53VXzBNoxONtKDbN0qgneOP+HJQxtt0mgQK3u
         3iXMn4PI7keGYzxNovv5BugfZO5BEa03TLb0RMrjUsOJDsVFpxYx3ib2XDc3ibEoIhB2
         CPDC9zcnbEkooegBZpG+7Uzuu7N+omfiuEHvRwmRu0n+kQ1k2RMr4Qsl2mbNEwyt01LA
         a6W/JAjhpUSztgMdCL2AlsSliCj9vH04Cs6CX43UIpM2D5z32Kf3YIzeYK/EJC2cg4P4
         mTeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpR8QqdW8vRupYXiQ70DtmvKsiD8W166+1AO8Tg53RQb0m9QyOPBhak/hDXIU7LbNhud5w1fruJmYy5HVT@vger.kernel.org
X-Gm-Message-State: AOJu0YwJY65uhCQ/BTuTEF1C8duV8SPFfutQMaqFpUDJVLbw27FxuszQ
	/nGeovicilq+0TjbTVuslsm0mfFxUDFqboU3/lEdM1rHmDlrJiCiIgfjOjDRCa2S3Diky3mtU6J
	kuNtQxLPAxMKn8lWwgcCGfoYjNJtBX9A+OsqeATI2S2OtJqrzM1XCjT9J7ubpUv8izjrlM20gE2
	iD
X-Gm-Gg: AR+sD11vMagL7DI6roOglZSX3nz6xxwIagDf+gu55iNYEKu6lQlQ8KUuwofJvIxeMJF
	FBBpZkEi7zOFUUbdFFNEg4C8+Khq60I1qGx7/oFraWnc5rwbaR+hiJklcXnJbca0wl9k/CaxrZx
	DMGZ5MnAns9COri1IUAJBkQmC98YA31m+bjLC43hcbs3OWfDqtZAvmhVZmvMeQcckPWaPu3OYu4
	rLZ7gMsysyY2qxL3Gi5VNkiFHRbwZEE7341FFMkpcD3btKGz7MQ2kEe6S0oeLW1sHwTxf1GKpzC
	bjJbX5R2bWmbpvDzRxeWq9+yuhmuhcXfZPtXpq/9AOlMAQk7STMKPgK+B/DdvE7yNFwWxcbTXN3
	v+bXFnXs6Xmc4LhP8NVYF3q5isfwCHLCxtX57M9KHvirjL0akKHwvQW5kUWS4V6m0jvUrfQedEp
	WWwQzb30fO2jxgVbmvEmQXC6Pa0Xjd0w==
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr261919065ad.45.1784718532003;
        Wed, 22 Jul 2026 04:08:52 -0700 (PDT)
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr261918435ad.45.1784718531430;
        Wed, 22 Jul 2026 04:08:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm9225691eec.2.2026.07.22.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:08:51 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:38:44 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Message-ID: <amCkvD7YUV5IN/ys@hu-varada-blr.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
 <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aFjpWY8mq09ZtdeCDgB4ZgPPTr7679cO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX21TcjYzGlv63
 CoihWIb/muUniR+iD89kQZZU0/YyVRnI+j35vCZJneX2ilmCvDwkSPbWjSuW/NFxvPeEjlm4pi8
 u0fNfsc5fDZsDdvr8byiOq6qj/n/g8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOCBTYWx0ZWRfX2VZtn4KbXPxi
 4nztBPsAJDDhaypd1zV8CTjvyhWxEweYvFNXnWMjDfbWL9lGq8eKhJi/gRjGudPFgvCt1Tz2IJk
 XDe96LiwPDtPSWfcvJhJWw5dI7rKJwr5BcYKpzJgMMINc+WHjFrZBnxXyBVmmELza7IDOlrccg6
 oX51i34/KQF5dj9LVirAyg/WnddXfvth3cyyDMg+VdX2SURx2akH40w2bOrJKYJ78S2Gh7LjQ6Y
 hW0jJsmbP18AP2A0JXMOT0C+BCYpLr7Q35m5714qeulLCDsTDW36TAXd03sC8kASCt45PD2ohZb
 eapsuDqEdFJ4X9Hp0LRDapZchXvatmCozQIFrsZ1IJriko+A5vvrl9f1azSyhtrfro7fMJ8lIsU
 5ML7Kv5c2hpDz06aSXOLrPCfoLn4DPBdHkjCU56DNVu+Hq2GYxXeG95YvXcLzgR5M6ssFNkOlMr
 MNCb0OwcUnAhxgBENKA==
X-Proofpoint-GUID: aFjpWY8mq09ZtdeCDgB4ZgPPTr7679cO
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60a4c4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=oMAPo0KStigxr9RxYcgA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220108

On Tue, Jul 21, 2026 at 05:36:23PM +0200, Konrad Dybcio wrote:
> On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> > RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> > share the GPIOs. The board has to be reworked to change from EMMC
> > to NAND variant. Hence add the NAND node but do not enable it.
>
> Does that warrant adding a DT for both variants, both inheriting a
> common .dtsi and making the necessary amends?

Ok.

> > Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>
> Are they controllable? Are they provided by some PMIC?

No. Not provided by PMIC. IPQ5210 doesn't have any software controllable PMIC.

> [...]
>
> > +&pcie0 {
> > +	pinctrl-0 = <&pcie0_default_state>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
>
> Please keep a \n before 'status', uniformly, file-wide

Ok.

> Also 'pcie0' goes before 'pcie0_foo'

Ok.

Thanks
Varada
