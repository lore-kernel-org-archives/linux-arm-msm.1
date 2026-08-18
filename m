Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE272621
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787012598; cv=none; b=agQwzJidR6zM64PzRM72XtDRbGCa1VnGTsL2y4DUasfwt4WKBt9/4odAofokqaXEq6Q05ucCIXfJXOA9U1ZHSN78s95bD8PPspgoXCrGTO7ydQnfxJGUN/NNW7ljRoDWPUYzDP0MjrwLHBTEW/S8QaGbzApmCqPy4Ec/v3M65A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787012598; c=relaxed/simple;
	bh=kAdakih6wOEEjVD1+UsNgRaFXSaE0NenZthyIZ3Muxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw7cqycSonUJiOYTPgYMGA9ZO06HzUyv6Nk2l4INtAT/EMVLKYBqWvh2bopQ/HnLIyPgVeAWhXfdFnIdKMZWuJcJqWkHhkSYIKceOyFjCU1hrpZ8vlSnA4C8KB6tYUlrrEQTwDMvcjVDNOxpLtcQ9gXepJRQTNXAgviaBTRZzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ka1c8tNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBJFQkhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ka1c8tNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBJFQkhy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkjf73127153
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=; b=Ka1c8tNC1h2W8CdW
	Ud0LNsLs9Jw35vd1G3ACu++WWP9vw/meBFaR5Jg1fnELc3OUumGVR7D0U0gOK974
	VlB+dfOsZ3mYAJ2DczbpyssKJl/7d+Nlo2BWoWgjza7BrG0VtgDZN26SLHXlqn+x
	VC5Qu3m5v8IXroEyu4LGdO1H2sKo1AmyiqdAsLp7nFIaJ+coztLVSUOFme0N4m5N
	qSaZnk9cuzZGJ3O0G0Ft0DVEP0rV5XEg2Tw35imp2yEeDXAx9pxhiVeu5XuQB4n/
	HBDtqeBVY6M8Q0yTHKD4MeCHeNk0kxUp5iqZW6R0xZOQtRG6t1BmAuhy0s4k2iBi
	W1FQTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1kqq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:23:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so397319585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787012595; x=1787617395; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=;
        b=hBJFQkhyiXjYX0kmwAuyoxLMLhd5XeC2wJuu4gS5fub44XblyNiqHb2psTN89Val+x
         gPFzHlwll3HPlRHiCkfQuOZk2RvlZxVveNzASIdU5zI8nwPru5VOOPrgrUV99+1nRRlC
         YGyCzV/ffBT6d1vo1yhg8d65yjiSheJ+8YDzEky9VcEvUc/byzwdvbjBLuqCjWO+NodE
         hbTNIpCLTSU4rKWY1Yfo/tzAzOkXHzAZTFHHszyP9nMmWtwTwpeqlIpaE4dqCz2orVRB
         2U/Fc25LziiDzMqPMJGdW7735D0IdJpkvLDQaKec5i3IOibyJZkMu3KXEFcxkhrK6vKN
         t0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787012595; x=1787617395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=;
        b=QMEPo9DR3vF9CYosBE14FgD4u9boAd9wl6yPbmceOPShAZ0Kg+ziNziJ+UxI0fu0LW
         ENLSOwuULR0h2PGcmC4/+JQWboFwxANbTGAoaB4aGlmDkB7fZOv2yYKLAztAIfXXQ0Xc
         Ndzwp5bSjJucukumcJwHUZxxMEB4xpRNAzgEQY8nSZR+mr1vx+9hfx13NkKfH2SlVlK0
         jbuMMWE/LsVpA8ntG22MLjzpVDVqyxHEd+xXGs4nlGytl9qH3ltuZFFCj8PKR7JF5jhv
         qkwLiUbY/NkiYsXRv7nsfFybTpWoIlu/wv+18ZLCBjI7/KKch1Pjh0GLuCl8Uh9LugcC
         jd+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2/W5j+kLEQXXmZG8dZrq9gwkA7FKN2R16+4FzckfhHBCG/xpaPUb44IcsS78TcOiCEmEfoacz5sSnNORv@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeKJi1yZ1ksOd9FZk+XWTjBFrljLQLGY8LUeUSFg2SBCm79Gh
	fU0EQAz3jozJNtQAMTGtDI8IYQSfCl8Ps/qygVCBM1H+GKreokV9wmKJPx/sJTkJayCwRF2pTPM
	VmnVovwZqjq/Pyj9KgObKHVMwcMyUd4wNAFQV9U8w46tb2ER3NdA0cqshinDRwTiKCnKY
X-Gm-Gg: AR+sD10m5QXZP4/jXGpxCEk3wSAnrANrXdFSvF3q36jAZQiHdCmOp7uMK0uRx6DCM8p
	YGlbzyRJNLhlP4jSkFXSyKMnMtGg+RzA/eJwjsSnWqju4VG7+RrMorNlOS1BHnSRPAoKtm2kZNB
	OwZLrutPnTiq6AYzJMn/AiPOgDw9S1sX+LetiZxBKkmz1AopyfYT95xdLV2bLhR/XaTs46aemhO
	/1l3dMt/RDNrbKNPB+CxTqaHZ02Jai+lcrOxTbGS9ag9t05Wk+P72Ifsk6Lwg0f3252Du8NgyJF
	VF3E+jynlTonwoeF5Tq1Ja7S1yiCzw7rba6GZyC5+6jqVG+UlO2TMI9YVJLVzt0cmZ11KVZuao5
	ohR9dy7r6moCZk4ogfVVnJa/ICrQbyzg0RkAmaYqH6lQH12463cer93kn+5g6TXQU31u12iAurk
	d2cdUgBlq9qylL
X-Received: by 2002:a05:620a:d87:b0:936:9f44:d1cd with SMTP id af79cd13be357-93704b8dbf7mr471771285a.27.1787012595332;
        Mon, 17 Aug 2026 17:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:d87:b0:936:9f44:d1cd with SMTP id af79cd13be357-93704b8dbf7mr471766885a.27.1787012594834;
        Mon, 17 Aug 2026 17:23:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0a1240sm7763161fa.3.2026.08.17.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:23:12 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:23:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
 <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a83a5f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jrXjsD0Mjyjvaf6d-2YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: i1a1h-K_-zY7LtKYgzfbevzuUTokOKkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwMSBTYWx0ZWRfX5TetcruIhFAA
 ABk+B5YX7WvS20ShK6d6nm0SMw/4TurUS7xRtB+lZxPA5lv34IkxMEHSBMntW+ds/7pQS0YGuRe
 j7dXXvZYVLPT/iMZrlyFhrj3SAFSxaHBQ1gHM9Y85EmMqpI6keRbDqBGw3IRu0+pjv+i7xR0CM+
 QaSQb2M9hm6qH19WJB+pQAUF5NjniN8C9jeMIaChFYuyFlbqdLoMnF2yLI4k1jze/fJyvmTHSGx
 gTJHtkV6w0kYLrEYQNQUgVicdGi6Y9QQEdwvLL331BtPKBRMr4t69Mm4DHWFwOPepBlcQH4kqsh
 El6JTl+98Pmu7u9TLrYdwOWgNmFykkHqW8BF+nV6+co/NcB5NTIwlTK1Es4P1J5ko/vCe00goCT
 SVG5D+0zSACpEgIMo5drDfg/ViaOLWH74Yuit6t2+1mgCcgVW4dRwajDHk37uVQ1paAfPj/cN1I
 NNzrpMJ+xiRQaJ7byQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwMSBTYWx0ZWRfX8/D9PhZNflsg
 vRr7P37HxuPKxYRPBPVzgke8KFrWeijCfR+7t8xH2gdVIVEZrrlTH1QUFsqzo1iI2weIupg0IDl
 x2Pe4PLctz8xWdFNZK/jtSjw19oHM/U=
X-Proofpoint-ORIG-GUID: i1a1h-K_-zY7LtKYgzfbevzuUTokOKkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180001

On Tue, Aug 11, 2026 at 08:39:41PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
> > > > On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
> > > > > 
> > > > > 
> > > > > On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > > > > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > > > > > path before the SMMU register space is accessible. Add the optional
> > > > > > > > 
> > > > > > > > Why is it limited only to those SoCs? Is it also applicable to other
> > > > > > > > Qualcomm SoCs?
> > > > > > > > 
> > > > > > > 
> > > > > > > I was hoping to keep this series focused on the core infrastructure
> > > > > > > changes: the bindings, base ICC bandwidth-voting support, and DT
> > > > > > > interconnect properties for the platforms currently supported on
> > > > > > > Qualcomm Linux and have been validated so far.
> > > > > > > 
> > > > > > > The additional targets have not been tested yet, so I'd prefer
> > > > > > > to add their support in a separate follow-up series once validation
> > > > > > > is complete, rather than growing this series further. WDYT?
> > > > > > 
> > > > > > Then it should be a part of the commit message. All SoCs since SDM12345
> > > > > > need to vote on the interconnect (and then, in the cover letter mention
> > > > > > that you convert only a few of the SoCs). We possibly can help with
> > > > > > testing on other platforms.
> > > > > > 
> > > > > 
> > > > > Ack, sounds reasonable.
> > > > > I'll add the first platform onwards which interconnect voting is required in
> > > > > commit description.
> > > > 
> > > > But to what degree is this related to a specific set of platforms? If we
> > > > look ahead, aren't we expecting the list to grow to include all
> > > > platforms in the end - resulting in a lot of noise and churn.
> > > > 
> > > 
> > > We have seen this issue consistently on SM8750 and later platforms, along
> > > with at least one customer-reported instance on SM8550. As a result,
> > > downstream Android implementations already vote for the required
> > > interconnect bandwidth explicitly on these platforms.
> > > 
> > > On Qualcomm Linux targets, we have observed similar issues on Kodiak, with a
> > > few occurrences on Talos as well.
> > > 
> > > My understanding is that the interconnects property remains optional, but in
> > > practice it is needed for Adreno SMMU operation on these platforms.
> > 
> > So, it goes back to Kodiak and Talos. What about SM8150? SDM845? Earlier
> > platforms? Is it limited to MMU-500? A6xx+?
> > 
> 
> Thanks for waiting this long for response,
> I rechecked all the legacy platforms which are present in upstream.

Thanks for your effort and for the very detailed explanations below.

> 
> As per the design it will be applicable to all targets with MMU-500,
> (Even though issue hasn't been reported for all the targets on MMU-500,
> e.g sm8650/sm8250 but the nodes will still be needed).
> It's independent of adreno version i.e A6xx+/A5xx+.

Ack, this sounds reasonable and allows you to easility select if the fix
is to be applied or not by using the generic compat strings.

> 
>   Adreno SMMU — upstream Qualcomm targets
> 
>   SMMU-v2 (QSMMU)
>   Platform   Compatible
>   ---------  ------------------------------------
>   MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
>   SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
>   SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
>   SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
>   SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
>   SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
>   SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)

	adreno_smmu: iommu@5940000 {
		compatible = "qcom,sm6375-smmu-v2", "qcom,smmu-v2";


>   MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)

	adreno_smmu: iommu@5040000 {
		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";


>   SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)

What exactly needs to be fixed?

	kgsl_smmu: iommu@5040000 {
		compatible = "qcom,sdm630-smmu-v2", "qcom,adreno-smmu",
			     "qcom,smmu-v2";


> 
>   SMMU-500 (MMU-500) — with qcom,adreno-smmu
>   Platform   Compatible
>   ---------  ------------------------------------
>   SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
>   QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
>   SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
>   SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
>   SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
>   SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
>   SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
>   SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
>   QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
>   SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
>   QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
>   SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
>   X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
>   Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
>   Milos      qcom,milos-smmu-500, qcom,adreno-smmu
> 
>   SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
>   SDM670     qcom,sdm670-smmu-500  (apps)
>   SDM845     qcom,sdm845-smmu-500  (apps)
>   SC7180     qcom,sc7180-smmu-500  (apps)
>   SM6350     qcom,sm6350-smmu-500  (apps)

All these platforms use a separate v2 QSMMU for Adreno

>   SM8450     qcom,sm8450-smmu-500  (apps)

	adreno_smmu: iommu@3da0000 {
		compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
			     "qcom,smmu-500", "arm,mmu-500";


>   SC8280xp   qcom,sc8280xp-smmu-500 (apps)

	gpu_smmu: iommu@3da0000 {
		compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
			     "qcom,smmu-500", "arm,mmu-500";

>   SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)

Yes, patches pending, I think.

-- 
With best wishes
Dmitry
