Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006546;
	b=PaGE14csXLGalQzSSYezLvCEnkiPg/UToyXecehogdZsumuwtmGgSuDSGDCu9FAlsRwF
	 dI2qKoBZInZ9Pcr4kWXrkhEWdVbCsyN47HJmsNrXOx/yEJvZP3Qjf4EQNiafSr2Hw8TTh
	 Lc9XofkcUo9beqeQ9BTOwfEpKKr2k2mXX/o7NL8fh1zm+eBMfEdqWYVMmvcU3muQUO49z
	 i1ONYrHDFF1Upw6Sz1CoQb7X3Oh+xKI1IY1kHnkvucO5u9RCFgawqcgBt3rUDgXJpCdMy
	 PLf7fOmLlM5L5N2rdROX5iVbqfFfyjMU1rR08QLITXXME4F7/ONB5R3dX3gGM0EWy+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
	b=rzI+ZqGtidZDIDCjuO602IhGLfUCvfxSXu2y2S7vUCSXwtj38Xws4qUv+W8GVgEEfNeF
	 SE1KmqJq1qCohs4dAOSk9ok/3Pb7gCsIOgGaCoxqgZqJz5ZcxmRa2O3/4j0eZiOV8FjUh
	 cN8jATTyRPLV1Kf0EA/RIBBE0PKhRtVsiXXen3cNIcvSOH11/LC+PewoLj0Lt460eJhZO
	 Syh3+j3kQWUvn41/yZl1GaaWPO541XyRV3f0B7hUFE+brE8Da1N4qLfhoF8qSXP1Z5agO
	 qh6j7CZmDY5rtmlpiVww/pNH1n0Elp5PXu3MEooikfhwRenEcz6FUQi0GiLP3dCLwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Da/YqfVa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5023606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5023606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Da/YqfVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLWsf3420713
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MYY+8YGb6eYtDMEbZYRT9DRB
	ab3FZKiNZ4g3q/1h+DI=; b=Da/YqfVag0HWyElD8UXSKp4EQYe43p36+p2eW2NS
	mopCQ4RLk4WVaqBC+5mxfvJhKPO4ZKc3TFZqQM9ttsH2R5l5JT+HUv15f6zft1Gx
	RTzoGDTRZLLqDtWAIrTjVFdRvZJfAree6EDyx1hIMDi3HdVg1Nsit3DC5szprnnC
	M1dA9CyGzv+BMP29BqYdXguC3/Wh3W4HKj7U3Qyu14zwrw2R8/FkcQmnLdraK/th
	DuX5M67CANZVIkhXl14VJqD3lnzG7lk8rkz4TDhMGV3dNuAsecAofV8fh9rDExY7
	bSi0OwXtZa1pbct239IRuNXnCxCqG2UQ7er0gG+P0Vog4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u0pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:55:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1078666eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795006544; x=1795611344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=kE8bBk1uJoDsFTXBFrfox13X8ReL9GGXwOVDnVqLonqvbUNqqZuzNtf3g0h7dm7W2l
         5DVWfUSxcW7KaollLVMN58rmBdR9r7Eoe6IzHLuRyajs1gShoaiTmfhFUkA1q7+Vi/YU
         Vn3VJpwjzaCqsR13lL7AoW3CjJPh3T3F8ZDblNx3mUHX64IoPGAxxj6+WWJImTz7JrPd
         OeRUWUGbYyUCC5+0lP/zj/COL9fNNRriPij6hSHQx4JFPyuPNKLzAeUGPE8VuHq8XdsX
         Qwan+d/IX8HvKqLgLY8vun9ibY+dWF3N9KDZE4k/x+loVRihg4R6EOjgxtxAULQbJ776
         unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006544; x=1795611344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=Vvs1i515aBKZAeNMrb7Q2Td7orsLwkXr1UW4VVb+5zRSoloHV9n+rcjsTBrqXrpP19
         xG3LOF2AtV1UDxBzM0bWZRHN3heJMnFxrdvSSu33ItCPPryYtPg0lz6YCTVmZtcdiEtC
         3NOrx7t0T9XzJAdDOXjHq1NSjrO5eA561CfRuOKn00MbgvJf2a+26NzEDQNZuRLOXiWd
         iIeA454wfKE3hezR20xzPEYozrTerMBteXvrOTXGrDOwkNusMZHWVLpwwpm3/kwT8xy0
         rBMWxpbrz/fqtWy7Eb5VEivuglIBUYOHY3GsyFqyvlp6HbTovPNgV3NgMptsJCLkQ2rE
         K9qg==
X-Forwarded-Encrypted: i=1; AL+hErGIdkl0paFcgAh/x/ZpgJ1zU0YIVlokdG+uq3CZLy9kNnQ5LGZmL67P3qDOTr3D+rUPXnf9pqhiv03YUcd3@vger.kernel.org
X-Gm-Message-State: APuU4Z/T3tqaNQsKhYOzycwFOgtenbKGrBiCWCIh5+bFQdDxYEJ4N5CE
	9uiXjrGSXdejdtxFFEvWnOm6XGTmYVzpNOkG7/AuZFWiyVAmq5BT42AiO9m4Fk5xkaUzp+IsmkE
	MIfAOeEAaHGR6nIWIIGwWprETKcPusGB2HBeeYflIAXfvlRsg7Nu9EGykxK5lZZruYeQm
X-Gm-Gg: AZFdTZeDbAyo1pA/Px1+rtFYtk8X4DoHlkY8jInebSU8uM922/ekx6IrZVTnhygckmy
	ZWAAJ75fCXx3q9Yk8/SsWH2e3OMC3mnb8rWY1847KCX3Wad+44htdd6v/x0pdbq7DW/fJJ2j377
	IvQm+eslH+0xU7E5okm/V7wSdMZMTPhcuzLsRLzw5VpM3e+qWItcCwMu55CHuTeAo6oTRQlGa2y
	HVM9MSnV6U5WiknoWF6KyQSLFlW4j4GcaEltfc0kT/Kqc5q2fU6euVk/uE6OtGBvzbU26+C3lfe
	Aml1bc2FvfpKKO/3P9u1dAi+o7BbjU2ERTUV881QichDmyF0FmkwlziuR1ZNFeLSp5uvHhpUhpu
	A3jgbZZAWm6gYwm1DD1RhqePA9XHDS5b4yNqOOPVeQ2SJe0hTS7sTOxH4+jIVthe3BMP5FvAl6A
	41
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646224eec.14.1795006543346;
        Wed, 18 Nov 2026 04:55:43 -0800 (PST)
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646202eec.14.1795006542621;
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm8359166eec.26.2026.11.18.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Date: Wed, 18 Nov 2026 18:25:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
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
In-Reply-To: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fSJTiHX4Fz1Lf9-e1-cKDJlyqFcjnjDF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX+TBi48LRR53T
 eBp0MvGLaf9H8TRe+TvHYbhyq6Uc9WeFE5LdtNNeMOvkEWkMB6vXd1YgGHFx+97WfYZVkrag16y
 f3N5Lzlxo/vP5gqFYmzJxawu3GftW5I=
X-Proofpoint-GUID: fSJTiHX4Fz1Lf9-e1-cKDJlyqFcjnjDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfXzrEy8kr3JZRe
 Ij2z/xAgR5fpyH8b8DyBQ9mikLrJ9euBNuxCmMAKwiwTQdPFLzJvcLbcwl8hzKSEIpm9ZxjQvur
 u1o1NeWMvzKDft7I19fnel85ReX/n85DM2i4LP4iegKpFzAGVc3Md5Mxrv9codJmPvfTgf1hRPL
 c+L77hN5uBJOXxWiM1nZZkW2a2pldtKQjVyqFksBoT+QMVa2J/XPRWQpDvYtIUz1gbhAmqVPMxV
 DIJ2QfzpZ16t1IQE+Xog+t9CqQQw0PHBL/7kB52iJj1gGFWXCPFo0RQBsnAkaCwAOvlf2cDVzEy
 NNz4P9Pxlb015HYlJXPpX1p7ZxTXckEJLC6xVIUBIci3a3MnTkrvV1MDRZE1K2F/14rNofm4PFC
 lwELR0obUOQvjqDn2gs0SGqP09yHOJ37jZtWXkXuS7Nldt7lZHJ6DlUmtt6JnXcDdG2ff4WaqLi
 15QTIY0BCN/nOzbeYAg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afda050 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8YlygH76LDUTcj7JEisA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180051

On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> 
> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > The RPM message RAM is shared with other subsystems, and parts of it
> > > are not accessible to the APSS. It is expected to be mapped as Device
> > > memory.
> > > 
> > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > speculative reads into the protected parts and results in XPU
> > > violations.
> > > 
> > > Add no-memory-wc so the region is mapped as Device memory.
> > > 
> > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > Why only for Shikra ?
> 
> This XPU violation was seen only on Shikra, and only with Linux
> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> EL1 under Gunyah. So, I kept the change to Shikra.

Thats not explained in this commit, why this issue not seen under
Gunyah ?


-- 
-Mukesh Ojha
