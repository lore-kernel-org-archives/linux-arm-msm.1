Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357045D5F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247619; cv=none; b=oxoQhyyyq6Aqu7Tx1S8aSfu3GmxqrReHBAsRrw0JmCGQOMNdxUk7yclj1zdscUQi66v8MImmWA9Tqh/gKH246YzzUAjdUGc22YnHIhZ7jcW/g1WboIsJfsgzih10cfdvLsVf6HUPcOUXwwvUdPIeRAk3IUyr1P9mNqJJg2RnLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247619; c=relaxed/simple;
	bh=fVQcxdGJaOYOaw1aI6eXlbQyaIzwy2ui/CAggsuJw2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYQi96A/rNI0YlsifKr0UOHwR4UFbT04PWPZcTTJhzptPtyhV86phWAS1hABMDYVuSIBbsm9+Scg8ZJqlGyiD8XMda6UJhLT8Q9EK1BOZ5PIzNjCpl+cNydqhN7EcZyl8+aFcvlV96oWpCcijg3N+9O8Ox0VnYWnGJ7aCx+sQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHxAQHKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNqS/D9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHxAQHKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNqS/D9Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1OQQ2857947
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=in88g7r5SF3d0J0T8CY+cmqo
	kzL7VJf39MG9fHoUBpU=; b=HHxAQHKYufYnBu9C+hmeM65ttXwIfwI7z53k9GpA
	psh0nfdpDB2e+lX2PXjo8gDKtKo0whxTYxCj5bBQeArrs78/ZKSDtNyIlPYgpBrU
	SxK4uIyL8q1ZqBKUWfhDprjLUqyA13urRKqsjw1PkbgJBA/O5B73tgktf0pjtey6
	AVxRKTgPeaoOZkQHuBd/QU4NfV3MPH/qJKJuOlbdUJXNFCveYxBdD34BQlpeATZG
	7JBDko1iw3u6qy4Ey4BGMXXKYmhG1l+QFE2FTrSZWPgZso/QFKMyBV8xHbV7OqWf
	r5jUHJvGOBWMfhMwsLMBcek8s4V3aWfHbBKGx3EgHi9qLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag7wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:00:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso373435785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790247617; x=1790852417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=in88g7r5SF3d0J0T8CY+cmqokzL7VJf39MG9fHoUBpU=;
        b=HNqS/D9QLKMavfa6L/UngDmx1vNulYoaz/2qa/7ebAMCymM2YaXHl0KWFTOMP4ia0w
         CADaSGBW5AQXlzqsJCMYvkR43Xah7rNvEr72uyBa0DSwoCgj+Xxomb7APeCPJL/SmpXE
         T7a7hkjyUdBgHVBsRLaouXDi66KbP4MoNpbWG3RctdANAYpIOpLAORrcrWDTa6HFDvPk
         Zb5i9vNQ5rXagvZiWH6gBm8r3fFKBFmDMDPNCN9TJr64+FT5FgLIVrsZWYwB9u0j1/bJ
         MeCIxTTgYi76xsTpKgMWSlJ0xJLM66WVOzxjpk7HAA9coJ7S3UWOlrsv3Q3EKSJ6GRHg
         dJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247617; x=1790852417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in88g7r5SF3d0J0T8CY+cmqokzL7VJf39MG9fHoUBpU=;
        b=OiZE695DjZV3IIZCfDOKPSJ9Lm8e5zpY5gi9b+9/O2/jHg3uobAYXdZQh0Xs9wq3Yo
         38pNQHRpihVMFuoKPW9LZiOo/WDu9BXpOUSMaIITgggy5mfexoW75H8ehVKD2DYatoG9
         o36c4w0qr4WPYytLj2peP/buUnsbfGc/ijd81is6Ki+sLLkSgtwYzYPcGQHEuEwsI0wt
         dheQ8KtiLvZLxpHEhPvO343HFJH3T4u2XoWRrpHlK9LIF1mfA7JwdBXk3tGQLGgZwXMg
         coNaiYXrjJJHBO1ZYZsoDJEWPnjolWFvcrfzemZ3PwpOKoTln7biOokKcHQUaAu88Phy
         3vlA==
X-Forwarded-Encrypted: i=1; AKwUvBz4FL6kt1KzWnoGKdMQLxl4prEK2sYWxySF03xwoXs1Q5mtDeORIEq3opsXtk3vPK1iq9cKvBy2dwxDuHQK@vger.kernel.org
X-Gm-Message-State: AFuF++nLFJ0Bkz/p9bCreJS+T+Py7eNhZPhl8m1pA/vMvyxd1pFXbYmq
	HA8mM6qKnLBp6jrr/jXQb/e9Skx5nJFCmXp1yImC5fT5a4dBCAwTSzOXU/gFg9iSQjMtTx3eYqP
	askHp6JuCsrIYPfJwK/t7I6ASznp90MUSHKA+77vQB5rWaBRz7D1j+NcDDc7G1ZOpavfK
X-Gm-Gg: AYBFou3uPEinzvc+cHdpKWDq5NTHlFSLyJg/h0ASoc4IXYWw1PkURa39kEe31l9CVMq
	tEMfzJO126dMgErCDHL/Mi/+XJTK9ny9LjI0T900IkGlXBO+NP0oJb/OCnlUZtC0+TaOXw0oDcR
	MNjEfpGf/wXwd8rWwIANoM2y7IOI84E2188fqEDqUp7VLdya5lRamUCEEgrfxB2RGETmr2y8SkA
	Ho7Jt5kk4QtzlZmujFbG4o7TwbLFz9JYC+GF6kaQ5mAxc538qUxm1/D++bGXqDDXeuvWGJOphqM
	9idgyLaOxrLIlUohyO48iSdBeBhOddeagTtvRLbaasDYS9WBSg8jQwlewWFm1W0fmzUO2Kv+Xw9
	OMy0NxAUa8kgJXwA=
X-Received: by 2002:a05:620a:2911:b0:93b:e6d3:b33b with SMTP id af79cd13be357-93c36407185mr252050685a.59.1790247616361;
        Thu, 24 Sep 2026 04:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:93b:e6d3:b33b with SMTP id af79cd13be357-93c36407185mr252040685a.59.1790247615301;
        Thu, 24 Sep 2026 04:00:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4cc01sm54580845e9.3.2026.09.24.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:00:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:00:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
Message-ID: <stanm22bnloxjv4kdukrzhl6tmofgiezz2q25rhaurfoh24lp3@ernh7jgxsiou>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX7QYQ9avzBlkR
 6tmDGUvPv7amYv7vwFnVtc1T4iqqwhsd7WwWDtV9iPDCRYKVjYKsRufK/bdUO9zhKSGvEo1BCMv
 s4NEuMkTeJp/E+DgPOsszKvdjIIV7G/FhmLTrHAZQbzL9jxXwjeGAna1cpzRuC7m0n7wFE7LaH8
 vKXZn3jPxe7mLnVrCSSA8TrRo/XojosX0BgtpPNk4TzyVQTujdryhk/4A4iNpYUViRpCkEMwS2y
 NY1jr7qm9nLPo2diQrpHJYk1O/1mkAxb2ny0voRNBKZ1mVxqVMUZs79b31eh5bPIU33GAsD4snv
 KVG38TeaVJ42ZDZYEBNZ9OlydHJOqbKJKaKuVaxpvYG4mWyxAQuIHvKaZX1D7juUiNakSSk98La
 0CT8ivffHMDx3suhciES6LiSKT9CIbrShqmW2sCW4gYCh14Ofu9dzE/wKbcYjfhtm0ShKT+N2WH
 1NGODbs60j7NYbk6Yxw==
X-Proofpoint-ORIG-GUID: VVfjKYur7UrNYR73a-dRel5kH6Htqim3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NSBTYWx0ZWRfX7i+jt4vwSiEQ
 agt8bnXkmb/UAM9AZcz0Fjr88bRfV9YbH/bbBufBGEX5eJkkWNUwZI15FSOEJFEwQ8RurYHn9ps
 CVoIaCBnOL0TKXbdsaUEaMQOQow9COQ=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab502c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BWc8GxF-UijTqollepEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: VVfjKYur7UrNYR73a-dRel5kH6Htqim3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240045

On 26-09-23 14:59:19, Konrad Dybcio wrote:
> On 9/15/26 2:03 PM, Abel Vesa wrote:
> > It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> > differentiate between them with -emmc and -ufs suffixes for DTBs and
> > compatible strings.
> > 
> > Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> > files will not affect any current users as these boards have not reached
> > public use yet.
> > 
> > Also, move the sound card support from the eliza-cqs-evk to the generic
> > eliza-evk, which will allow it to be reused not only by the UFS variant,
> > but also by the Eliza CQM EVK later on.
> > 
> > Changes in v2:
> > - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
> >   eliza-cqs-evk-emmc.dtsi is added.
> > - Collect Krzysztof's R-b tag.
> > - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Abel Vesa (5):
> >       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
> >       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
> >       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
> >       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
> >       arm64: dts: qcom: eliza: Add CQS EVK UFS variant
> 
> I was hoping there would be a bit less duplication here..
> 

Do you this so that one includes the other and then override ?
