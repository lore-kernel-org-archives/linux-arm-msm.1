Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243C4D1789
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168644; cv=none; b=c08oWSRD/p6Ugu1g78wnUQJ/t7w8jq/TJlqxgVg8sb70nQhcEkVGD+mGIgl7ibxZPG9dkxfwsEi1da3w+U+pj+qdqaFibYRmfU7P9MKWKtp2iYi7//q/wcmOX0Tq2evIcMcKaynTKsMPnLJQq4YUscpFmLAAwJ2Rfv10xKPJ1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168644; c=relaxed/simple;
	bh=NApJ9NFSgYYpVWupMRsC8ElXkAZIpMR/Q2Wgt76jr4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STMm43sRNM821KNMbDbzFSwpINKtsz9GxVurmvafAr+xi/NM/v249Uej7pLvXCufrcZfsRIO3ika3TTYccHuN7WInuYs8fjX6FhUb32wkEr6gwCwnTM0/UgpsDPisqjOSXCO7+mAFjQSZ9Aa1XhYh0ilFmTerzlSFAURfJdBNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4pNN1SX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q290xCGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4pNN1SX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q290xCGA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbT3f2466546
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQt+uQAnGOQ1XmZG4t/uNWpK
	1EvYqFxQkdNygcG7YJE=; b=Z4pNN1SXpBQqnh7QpNEsixJFW+0xnuRrMEAluG8a
	b7TGiALZoMsc2OmVOuXvM57r2mWmkiD8Lop9px28J1NxLPJlZtQiIEyoiVWwMwyB
	Rw4oZLqsZqMdKfX/fqDf7io8Z34w9+rBE2g9PwKPlboeXzJWf5VycexxgrFZWAnS
	h00Owy2mjJcqP6HQiDFHOsfon8OzSpK2VhnbAt/ezefPySP/uj95zN+qBlSq8GVL
	kBU1KL/j/G3Pz/Bft7T+ZHbxg/nk0TI9mmm0uLVGKQDPUWJMJsVksHVHkasgg0VL
	Xs2mzEv6FsuEobxfd51Qx2ogQEK2nmUYHLZQKBDFI05vSA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c44dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1046685a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168641; x=1790773441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQt+uQAnGOQ1XmZG4t/uNWpK1EvYqFxQkdNygcG7YJE=;
        b=Q290xCGAtHG2mSJFIZFeJ/UeRw9usdgLs5rD/HIzcmG0Toam+Xa/poNpT7NoUlhOjH
         y3pPQitkxhXB6O91SCuNJGSf3UG3236se9uRW83qepes+hlF2OKE2Oor42c75/DxVN8p
         zs9Una2vNmMdIhyCY9KjOQ/bd+NvT5Z8Q6N/Va+Sx9N0jh8X6QIrwUcqatNLbBy/+N/1
         mOKKauB/oM/49OZ/n9PAWIOhENGEgHS8hgpi+ynfBZPjy2ZzstcvylS4GR0giJ0DnjHJ
         ITmb5PFZFN9cyCM9wPHTrgF3/8D4gG8idIdjX1CVU27I3Skc+pYGJowNhVtmIhOe9NVf
         nWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168641; x=1790773441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQt+uQAnGOQ1XmZG4t/uNWpK1EvYqFxQkdNygcG7YJE=;
        b=wcRMKsfOsJjk/3eBRed4WYDECl79nca1O635l/FcoQRJ1niGRhqdddSVZHD1SYJ2KM
         UUcO7TA77G1RDTPjN0rZP1Oa1CMd51ouyGR12obK6ut9xMuy3y0Ih6zK50514C07Yt6o
         iD1lZDqMwkgvONPq/cMIprV6S/hp30nhJFAWVwJprfMumttQ1NVzcTVroIbv8wJqtLlK
         SKzSrj0IcCVO4tfh66zEIoqMyJr6eKfDjdP/iNBvCPuuOkrxpeVXsqJMd4Z/vN48Q3QO
         RT2aqvNaAqU1BqedEWStZvDv+RsFnyztGizx0oLbFjyUKpC0lzOiHQIOjEM+AbnT/nFc
         qY3A==
X-Forwarded-Encrypted: i=1; AKwUvBwbDaH3ngPL/Xu75UCyXUMk6elUYSKUxy6DfOBkaKX+K5k+O9CK57DA7RKUzfQ+LlN0ZSEbQsl//hQQQA65@vger.kernel.org
X-Gm-Message-State: AFuF++mCGLC7VtirAfezjz455FapCnfadK+T464KyT4mAm/dXt/7ZZ/g
	zzBMR5x/NlWjrQ7qqwqF1FLqvUYAD9midQmpgNatQY9AIJsSxsbR+j/0amMHF38yIe7yOYTTrJp
	4Eo26WneO/5zXh+ggBxK94OdqOTK+dnTA0tpYUBeEQvxLHCaZpKPOsuh+eXCnesPtxkYq
X-Gm-Gg: AYBFou2TyKVqcGPOBBHV3/kHca0xt1e4R2yUF6tt9LGBaVH3lJbFDsjhtfjGGK+MIwq
	fBugny5EN0snUxgQb+RZVD2qBtJZCSUyaS9mCrFQfyyMhUx1DHfBZ3euBitJNSb5hPbqnukAaZZ
	EU8PXBY+SOI5BbPhhqGkSC9kitHwDPXOsUiGXaFTnF2lHOTWzT2COUUU3oJitiXIWViaFOkR8sV
	jKJflUpTsV2pO5hljSvlWu/7H8ER/panTE0DFoDkMmFwuFX/YBBcjxzLimITWqGBi6OHCF5Z1HR
	AIYA4eUaRIxAp1PqIcUPSOE0O/R+FCQb5cT6QYAfmh/z6lLrmEnQMG93J5QZuU18vTWH7A0tOwD
	7Y5yW9ff7g4d5hDoJdv8h1V8Ucg==
X-Received: by 2002:a17:90b:4a0a:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a07e717b46mr2131874a91.39.1790168640533;
        Wed, 23 Sep 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a07e717b46mr2131846a91.39.1790168639925;
        Wed, 23 Sep 2026 06:03:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc013fsm6125567a91.5.2026.09.23.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:03:59 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:33:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
Message-ID: <20260923130353.4jy5tlu7o76kjzek@hu-mojha-hyd.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
 <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
X-Proofpoint-GUID: E4U-R8ZsOA6m5iIvd3RHY6J5Lju7XZ3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX/k6/idif3PuL
 sOqKcd7siK4p5ZeW5aLKFPX2ZhzSleP6s7itdn7L/lLoZnvEthanh6EA39OFPegu2m3exTHnVtJ
 WP5OguIvU5Rerk3t2adktlXlkDYP/4s=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3ce41 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IU3sRpwDCDo_Lwim3DQA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: E4U-R8ZsOA6m5iIvd3RHY6J5Lju7XZ3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX/UNtocUitMmu
 tJWQXrGXmUqme3BeISF+RPB7WgdPbNzB/KbQFIoiQA0o8UQDhUUxsBdarxpE3g3oizpPf9gFFcL
 WH3fRRqjkucWkQuUTYm7rOcq1cwsxDKoht/CDKgympmtD0nFXZLJBT7a4caedfHhg7v6d8vaQIM
 1rrMo41D9w7mE1XHhrvJ1tQgLNpJhCk9H+hGviH5QfKWyfAHc7i12J8OFRYCmIFCdrpZJv+4RRd
 JhHWYguHXhrcVCBkosMy89pS3fLeiduCopGrU90JfcS/euCQwOigCgU+IrraYhtJl43+IzBW4xQ
 HqAMc9zWZWt5HeCMxMoZtPIZBazuDSAgadmwp2WsNfjfFdX0j2S5YsiIdIvrsy28y1tqa1J4r0o
 /1zSTI8aFMrluO6ErS94grmZVRmePJ1SHzh3gu5UvXB8uIBpCr5U9j0hPUBp1pwOFbU2kSebP6T
 NJSnHEzkbPT2+5yBs8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On Wed, Sep 23, 2026 at 12:41:54PM +0200, Konrad Dybcio wrote:
> On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> > Hawi is Snapdragon SoC from Qualcomm.
> 
> [...]
> 
> > +			qcom,smem-states = <&soccp_smp2p_out 0>,
> > +					   <&soccp_smp2p_out 8>;
> > +			qcom,smem-state-names = "stop",
> > +						"ping";
> > +
> > +			status = "disabled";
> 
> SoCCP should be enabled by default
> 
> [...]
> 
> 
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					opp-peak-kBps = <160000 100000>;
> > +					opp-avg-kBps = <50000 0>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-202000000 {
> > +					opp-hz = /bits/ 64 <202000000>;
> > +					opp-peak-kBps = <200000 120000>;
> > +					opp-avg-kBps = <104000 0>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};
> > +			};
> > +
> > +		};
> 
> nit: stray \n above

Sure, will fix it.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
-Mukesh Ojha
