Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ECE36F901
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851074; cv=none; b=pdVThwqRYfaxKPM4EnQT0I52FO1StanhPKTrjpblTdH4nSln1Vn/xG3PYHFOVVLBSOOOvZA1Qydh8BlWb3CgX7q9BV9O4XscWMPV0bkAVWweIu2DdDXuAJGNA6alOLyqcmSxiqhSfgoUrTGyarF5GvG2LvWvZfXv8PCnDFIgwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851074; c=relaxed/simple;
	bh=QzWEww27danke6pVuKQ865QkKlQ6qEvVrB1nT2Ssj5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTNB6I2u+pdJ9tbfU0BwI1a7mwLW9vkEHBwuVsCZhhqpiEmZFuTJxo0+WEfyVufZGHgKADWA9cmeeVHPULp9SNQY1OhV8lp69lAFkYIPVPpuA3xU1MASTlbvE5BlXj1IjDUQHKjMmiG0HtcHDjhdEX4I/nn/0bOO9+0O8Vr1p08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LS9eJkNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiQiETbG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LS9eJkNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiQiETbG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M0tP2502552
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qb33tFd7B0AHkg7R+dCmJclp
	qBJUbuxxgUYmiEyjnXs=; b=LS9eJkNVCxJeORL+Pr1WijtqzIvBVlEeDFJyJi2U
	p3gIZiASmuTQmAmY3ZmqyHwSu04egCxuGP4237LeLhc2e7V8L40wfYyvNy8vRIZJ
	5phGl4FpbTPUtsOgv7YSwIx7WIKcNFq6o0lwb2WORIHaxl99gFZ+g9jqoMpoyVDC
	kdenPZ+lgV4WktmMq2U/IogggEEQgaHRTdIpS2R2kyGdEiR8gC0sXS+EzefbLZ3g
	OXlPWNclU0oUgwr6VkxCCrh1Ia5OkE5j8ZvDqZ0EKykftdj3FThaFhrWXb6n1LrM
	dkMnkECQsm607OGnH8gc80GdHPw5W2Np8JMdW3yrjY+7gQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g7q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:04:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so9307747a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851071; x=1789455871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb33tFd7B0AHkg7R+dCmJclpqBJUbuxxgUYmiEyjnXs=;
        b=CiQiETbGounJCCznHjkcbvWRJW4FD1Fyk4C/FzL1sv8RgomPFjNGfvW40oYqaaecaE
         s0N1hRr7nbgaW9lQmQgE2d03zPWmmB/xSkQ/zme2vgoC3mSJme7sDjpNRF99NtW9nYlk
         p6FLwj+/Oq6GJQeYVAPXILSQlS2YRO/pFOggYCFF7N7DiRuAvo0cI/AvnVZpIaYVB3dW
         Eq9BDdU9YljUQmbEueJY8GiGAkr2fCE+SkZARvLFPO1NyY326/V00cvbJiw8hIrxUlH6
         iiTsdmMPQJ2NWX9e8mHfbZvTdBnpiA0N8Cq/NqZZsvyg9efAgq9uN4Li2kV6Zi8Otd9l
         RYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851071; x=1789455871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb33tFd7B0AHkg7R+dCmJclpqBJUbuxxgUYmiEyjnXs=;
        b=o1Bjv1VABdYNC+mLJZa/+AeM42CXytlKm94Acg9FWXEUTXUnXjvNT996Un/oJW+twF
         QCp4fzoL5NpLfOYz5hcyVhGRsP+lpbMvzMmPZHHpk4ZIRLjmSe6gJ84UUkldZ9TF46Mu
         x+LYqi9BsET6GnOO7KsvRjNzPfAttXzpKBLQgA7JpEsahnxZ6GwWwOXOdkc+31f+5Bnd
         WPx6bW5uQhhr3Wyp4VIxAVYN0j+l+OVoiZuUCbj3ldjMGT42HIz5eMlAJHl90wyqjd4O
         fh/rInFKGIDJzGOjJshk+tPmS8P2+cNe6UWKjUcZGV43oXypFb9iMyegk0/G62ZqwAz4
         WGGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf8eGrPASEIi17m9BuCXIb6QBmJo7piAjnNt0DsYLLyy5cZRobADqWJL4sqiuBuxJMf33JEyDam3bMWOqq@vger.kernel.org
X-Gm-Message-State: AFuF++nR2+41vuo/BxSJfT56X2AmVf3zgdAsKJ0VwEPPLwgvics7G2Pu
	ArDiZxvfbmVisiSBY4eP5H/P0YULHLEkfGPDLHO1XQFLKaNnZXIVSRrTJsB3zaeIdmjaWI7tUQI
	dHMhM10N40hqMhl4lBvzUC2YeGRyhAjWJaoWsUu7Mex/3ogbvCV4/ibTxPtaYLVnz22nj
X-Gm-Gg: AYBFou2HgXW69L/kwBkA7a5FogLghJZJU50fgCKUf1EtPVrHyJWleSHnkC5nsfcrn6O
	GUVqKSRnuk89qMv4EKaYL5i10+e7jIcMPNynMzV6DiOInhrXozNrqsbAB4ycyW5diagjtEate6O
	LZAKBTIWkQQ2WcPaJeVFfsVKOhxTyry6XvLXefVn0BKqnFHTg8ejhcBSjGsaNxh0Z3u8NiEUxS6
	tIZkLeSEtBl1kd8LFqj65rIoBC6iFerRIQJ4WHpdCi2bXrmRZMnT+N88GtlZbTYEao2LQE4qMac
	fLb+bDJRo0dCyXboS622b1cxkd8t/Xyan9a2NSi6fqRNJ70dRSvqsbkng4MURAdK87u5Cwu7+QM
	GqriFgi1frDnrFQ==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr38627634a91.8.1788851071174;
        Tue, 08 Sep 2026 00:04:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr38627601a91.8.1788851070748;
        Tue, 08 Sep 2026 00:04:30 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm32734467eec.22.2026.09.08.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:04:30 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:34:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap+zd/2QmerMwi0o@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fb380 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=K0Q-0DoUKIFXmulf0hMA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX7rQgR88wU/fz
 d4n7nVvGDPlrXoqQg+OGGPy6WR/Dr0Cpo2uU4UQPONjUrZRndBzN09/uLon7xHV7HnvyXn4sbeG
 A+LKTjMp2z5b7gWPK+TfuP+nPI8GW3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX3GHJFY1yyRg5
 7rCN3LmhKdCLbmAI8E36yZLRlA3MsIpQnt8RkkiIkDl7ZUhG+u656A11mhwxe9sEzZQmvPkYtSj
 jWB0a5zydcMu5mwm9GM37pJk3kf4xVp/cOw+3snYZeT1xRb+4ooFWXkioPLpCSQ2zNABgSgOR4G
 hbUDCq1Y26/m+8dlWJ7Sm4hcGvDyhncuvKSPpwHHwyTQGwvQp1LTFIxMBiLTvoFHfi/cvQAvaaR
 hvs+qVi2QHXN1GC6ua70jOESsy+0c5o+OjcLWuOMz8CJZYCHJXttE3d0Iz4gQGyIy0CsTe+e47Y
 sTzQvgqTIQR9AwoAbwKtQhm1m6CZBZvVXCOxBJTsl5jAF4gTRaUw2IVpuMUk2kaXcDb7udP42nC
 rMTu/Ll5Q1L0ozmkgg71wL5/gcCWYmuMfXzB6ftIq11o9fTpc/r8wFj//2T3PHKrfRo38rTqymT
 WhOSE8+JeG5za297hvg==
X-Proofpoint-ORIG-GUID: 4vV1D7E_i-3tvg_XGtN3ywY08IMjVE20
X-Proofpoint-GUID: 4vV1D7E_i-3tvg_XGtN3ywY08IMjVE20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080071

On Tue, Sep 08, 2026 at 08:56:39AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> > Hi,
> > 
> > This preliminary series adds the DTS changes required to enable
> > Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.
> 
> What is "PRELIMINARY" patch in upstream? Where is this process
> documented or expressed?
> 

My apologies. The code is ready, and I was hoping that sharing the DTS
changes would make reviewing the driver and dt-bindings a bit easier.
The original RFC had them together, and I split it out for net-next
and linux-next.

The only reason I added a PRELIMINARY tag was because these DTS changes
should go in after the driver changes and dt-bindings.

	Ayaan
