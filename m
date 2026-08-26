Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B19337F8C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721561; cv=none; b=C9W6tstGgoZ8e+NC3B0T1R1ThJlt6uEKLJGcvwUcR27Rk9BXG0ikCXuCMX5cNAlajL26W7k5v04hKoDB4uQx8NyL8CcjeT7U8ZxLaChDXFuP4GChhUb+Nc7M45CfN1pM8XYrdlQMFJQjK4RRjJ2reohRBfDt2fXSlKxnMM4a6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721561; c=relaxed/simple;
	bh=qZty2P8PNiEt2AowwJCdF4Xi1CxWnZG2Ggblrlkc+dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTPLiEu0TLWiI8ENuI5fGAWeyI1oO7vvHodBjXDj564lajinCTpyCjRlJMe2JJNDSdKUZG75rARws9m13komofXEuAGfkeGn4OBDC539XJf2j5KLfq4Tg81Lk1dQpO/z02vMHlGtF5UTxemKpRLYrzUM5cdm2olUZcxnHwcpU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVioZ9dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBADH+xK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVioZ9dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBADH+xK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HG4C266147
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MZMQ6opPngVEYRp038raR2cs
	AQDj4GBGp5NFuD9xeuo=; b=EVioZ9dxkZJe0nrQ2eTt8MzeUclYglNpyI0vc9AD
	Q4vySv+UCSoGIPxSUKkuJnIClTe6u5mnkdLnU3FV6FyNHmnMqyL3NipEpzsQ8yIh
	WwICAfOWMbI3RSl8ERhmR9P8g/5RSMTv8n2ZQ7N1kLwoWWvjZXB+Y3ByGggP8zQ9
	U9RrvZqShaHN8vSEFsEWhan3Ef5H8cj0TUAGH3pSStpm53QKs7mIRbfjmv7muG3T
	zandXyBBKESs3kZOIL5LkXXTCloxLYVUFc26mjNnmo6H0tlDGNLoS81EMxlIbGLR
	FP4S7FXA62xJrXcVy497976dKumiq1EExEPBNfqsUt96zg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxj5bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:19:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso20525051cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721558; x=1788326358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZMQ6opPngVEYRp038raR2csAQDj4GBGp5NFuD9xeuo=;
        b=hBADH+xKXGS0lGGNirH2u0fY5VlGyslFzjFQZQ8y937ljKuXGPEuZrZ7cyGMecGJIU
         XYQnfx6NQXl4dw4gfnassyZ6rknFgK3g7FHHiO6iElw64MfMIoJ8A4Sxa8o79j4O7oZY
         Z5uwDXgn4D5LE954ntDlE3ys4v5eTCc8TuAS4W1n9gjOcMBGuGQkqdrkz5TSGnKA766L
         id/K0XBzm7rlxzPLWlhKFAeB5JdAVB083WmM7rmJpY0SmvixUSA43Wu6avvjiBpE/ERg
         WfCXl0+X7kZ3LacWDwy7jN13BrGRel2vRWfcDti7pwu/jn7dfWkqOvQcKlb+5x0UVNfH
         fRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721558; x=1788326358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZMQ6opPngVEYRp038raR2csAQDj4GBGp5NFuD9xeuo=;
        b=CowGPqPnPs74+SCmuNVE49Ag/opvuxJThseQw2hBP41DWMyNFDI77TUbBQwmbKVbwk
         b5dNJMmLK5svS3s6Azy1wpmIGzNrGajfGgYgaxLIVi5mGL+rwQy87G8R/kPwrDDrXMT7
         ElERAHeqo8M+wcbK0g9oNjQOT9OdcgUux9j9dkW5nljculURV+yqCnYDRIyyu/uITokg
         Fv7uMD979ZFKk8HYFFTJzT/DSWaZymo5h7+pD0RoidIR1CAodo53GeuzdEHpZpE3LJXp
         iwtEKOo6GsXxd3wv6W5PdaYcUGltKIcZO6jla/SNgmO5Jti4oEsBJ6ies42KJoptvFv/
         gVzg==
X-Forwarded-Encrypted: i=1; AHgh+RqFuX8E+JpsLbxjvEvJf/MnC8K/WP5cjaV3Zzm+Hw9r6rhuKST7Sfum2weS7TvYP5pbDOMFoX1OVSDPtzDP@vger.kernel.org
X-Gm-Message-State: AFuF++nqrRFiI4zp9la2yjZI04ErW8FUVwidMhmdnR47mV3d1A7iq/nJ
	TRBKIxGuYHG7b66bttX2xyP/f561pt/4LVllxJgyht9MjN1P9hbBz5kTe966NOPe1TRXXxHkEBj
	XCc68VTgo/njf3R9ZbD9oj3B1xvYpvzDYiDLX7G8Qtps5CB2TAk+S0OXbtckEYPaNJxSb
X-Gm-Gg: AR+sD120dGIaR+aD6TMec+GQh081Ybcg8xg4weuxlN5XhisC0xz/L62xwnDkSm9RPwr
	BdQfoIL3O3LmrretNOwZI9RRgAupfzLtqa2x2Fe/2nTewSheB51Wlmu3hTpLAfdEnW+yfR+Hp2c
	0y7KwW/0aamqilgj6UsoeLVLbleDSDO2OHOICZM6qjS2147udC0iCCxUFoVfG2PTAbTvCg/U+1r
	SldoGI1l4uB5VEcZFem9g1+Zq3oyEUvHGfk/ir/VrDXsgxsTLBtjRiY9QCx8rzs9FGb+C5xXwA+
	yy5gK5ArpPA844WiMXVWFB2+Xd8j90CZ7VpePwvzQez/XNs0d1P+kudAsbLGqbi1bsiTzoqclyd
	QgNp9pqwt/K2Xcw==
X-Received: by 2002:a05:622b:103:10b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52e49c54b60mr2430341cf.13.1787721558438;
        Tue, 25 Aug 2026 22:19:18 -0700 (PDT)
X-Received: by 2002:a05:622b:103:10b0:52e:49c5:42a3 with SMTP id d75a77b69052e-52e49c54b60mr2430171cf.13.1787721558007;
        Tue, 25 Aug 2026 22:19:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm276159466b.13.2026.08.25.22.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:19:17 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:19:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/5] arm64: dts: qcom: mahua: Replace
 pcie3a/pcie3_phy with dedicated pcie3b_phy
Message-ID: <xprybiqfq3szxota7m6jhng3ujpnfulaqcpokfiujtxvjunfs4@2hpnue7liuc5>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-3-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-3-56ab597d77e4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e7757 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GN4xtFq8P7hki0q-dAwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uqP1FTZoFYNWS85gCKD5zDSzKUEietIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX/ARWDG3EHuvU
 rbHz/7VvuVYzHymutwNkcFh5ddiSuzB0NajoetQk5wz6T2Gys3ZkeCk3bv/YLX8IAYKW7BYnOPQ
 wHOSPpgjgqM/EvQa2oOixiuNlRJ74/lQXBkzj2l6nazIWYBjwFDilr2vIfjs+EUABZMFFKUzWld
 CiMubtstAxr7VPOjxQXof00BbDor0fcRgL8qenzVoNP9ux5C6g7x4vgPM2YQzgoOS7fnKKp6EkI
 D5OGLHxl0YNyvo1jwptVNff7K+ZOHsnP3/ua03rDRvuV/RPz+J/IMCwE9I+seBS0nTiTG5k9s/h
 COR8ys7iiyuyemjsyEAwHmgeepnS/aBUk4qg5XgvEspNhxxQhqbBntB6ccclmRQ4boY+az66dVS
 d21At0qod45AFPankIqlEQ3fUqMTh5fdGZmobX8U75+z9WMT4q2CG2S8/sW/HyEOYUOd2OoA3Vg
 zuM0yyZzl7IIPDxPKFg==
X-Proofpoint-GUID: uqP1FTZoFYNWS85gCKD5zDSzKUEietIN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX8diMscApIcn1
 IWa7teTIX0w8qIs4CmjNfu7xazriGvM6/neEj8+rd3VQf3L+hSXTw4/B5ZlUTYlNxIqzKXkfADY
 +r/NMfpkqMU+CeWl4lKqGEuOVkjNyN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260042

On 26-08-25 19:59:22, Qiang Yu wrote:
> Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
> controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
> and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
> qcom,glymur-qmp-gen5x4-pcie-phy compatible.
> 
> Point pcie3b_port0's phys and the GCC pipe clock parent array at
> &pcie3b_phy instead of the deleted &pcie3_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
