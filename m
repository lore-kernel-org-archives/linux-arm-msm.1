Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939D4457CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393862; cv=none; b=q1l+ZSWWEBQ39UZLeEtSKTI7vXz1QAC1LH0ceKqMgIbTmmpEV+c5akemzY224tPfrNRS0iNkA/+meFEQU6UJzm2HDvt+QZRouAsuTPzVdcMKFE0B3tCrsK9pBOWNUZBNI/Aje1jhIRtqE8g7LLpQ/RBEgxSzZGIYiq9seWnOtAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393862; c=relaxed/simple;
	bh=s4ofHt+NebHY6YiuMsjYW/TQtl7fNWl5044K8306YQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOEGrg3NiAl0UGmnLiJkuUsW6uNei0dfsADvl9/6eFxqvMmDPMqetlsGKj3X2m/hf/q9QkwmIaVnfsIQPg5u8toZ5HlgCCDdzWnsXz+hjzwELq9yE7Jp/cQnOR/cwsIpNzOlK49t+MjOVZwwxzans3DVpKUVsJ9TnhkVyUdaEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUdJcWjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLte9SP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUdJcWjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLte9SP9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0YHE607601
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JUfQUldAY1a70ltfjEMb3F2Q
	DASbbsXbw6W8EjoxwFU=; b=aUdJcWjWT0jzmalZks3QOnJNeE2iDcgYuxOEVnz+
	hze+0Voggi5cuzDSTmNlyb6okQk7r1Bm0JnsGrmO9QAMn9l5bMJ2DMTpG0jhfDWd
	jA75OJ7js9x53qb02ANSxnS6EmKmb7sjuirUw9UE0I9QIx3VDMLNDYofCoPrf1p1
	uCoP5sxFDQguHR9U0Shd2VopZrqp+o74b9wlOtVIAOUPjGspJxSwz2Ou4Fa/GWm+
	kxUWt0Evv/YCKndwCPuuW1qNw5p4wAMx/wjKQPity1/l7ZiKuZb75szK3RdpZ9+1
	6EBpHUS6aNNjGNXOcMW5a7jYBu8RGUZRR/SkaBkauGhuTw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2krfuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:50:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79285c98038so2819352137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393857; x=1789998657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=QLte9SP9I2JMkZPGJp1wBedCzZqy7t44BH4q8enr5wOoaK1qej5CIF9xlc4DyjcnYd
         hOT5BvmlC/xX0ePoAnIIoBPHFooNw21owWY6JZh38D9/I+z6+/oKLRkK6v+YHT2BY3aS
         UM1oKt1CKkdIkQJfNdSChag7i7Pdhyw13efIbeNNXAyHCrlSmT4IydPFeBzkHdS8La31
         AG0qsYYdHLh4yh3ka2ZSbryXv/Dk0JAE2bqPl2NWA/OPJJ2JzHxx6vcZ2CpjhdHLwee9
         ziK17afU3o2fsDQDDR1q+PzhFGL6zMRBalWIbTzVbqLnyhbBUHDHOIqjM9csMLcMYx1V
         Mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393857; x=1789998657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=V2Bi/gqr3jJsP9DV4an5ooBZBuwmEQxdwfSU6damBNey4BbEJCGBj8qNR/3EqwPs/w
         czPcwODCoPqIS2Uha/nrGjkEHUA3fsJVTFFqiKpwsPyxbhovDXyo20gegj7eM5S7XHaS
         DVGwYOf9O3aaWUNFhRyvXjqeLG6x+17jGVgmjo06nOFnbhIEPa7NKtFaD5VyYDiL9L24
         pgOB8BmLPDFHFotosL+p57YlGWcMypmmT53BLdrOJ9UnaNs6n6iVnO4PAw2FgSBdtE2T
         3LpLy5pmtICSPRrULKL7GMW6xPWJbuths1do/jA8dFrHoYC2UDAaVLzzR+h8H9i8vouT
         6h4Q==
X-Forwarded-Encrypted: i=1; AKwUvByjA5FOIitJRszLLGJS6IvR1+52WdB8TvBvozA2wUePspgvw4gFtzE152+usNFko9GMWqhq5bgvV9rRAgr6@vger.kernel.org
X-Gm-Message-State: AFuF++mhr5epnAOj8jfAiCja7t0SJWDRuYsSFQvs2qI1LT06mDoCgY7J
	dKJpZnDIonGsJHiGyu7e1WOYmUlSgtCKtiKdolxrMe3dmP3bkjG5cjTj0iudwThrA6WtI9cSk8C
	oIxsRBC+4JNTIp/TyFqrmbD7mhgBBRL5yCfDBtp45dOtdPtb9q3YyTrA82Yq8SRvRiHXF
X-Gm-Gg: AYBFou2iXe3rB3J55+oSmobufmM4kRAlsDk3U4xTHKGsI8+IE+3RtWW7tyOOur6acEZ
	iBpGxxM6mM5VeBY2Ea1NIf2O+oydP5JYPvOIuCSatGZvdCatdLykvSN/83FvEk3lzb3yTKtelNH
	NI34cC9GqEzgIo7cRy8VeQ8c7lL21wdVgQSL6vfp9gOzq3HUH3y5FH8fNQe0uPmeKQlmolfXh9W
	zP0jpEyg7q3TFN9W8+10sR4RlyZXh/pJlAz8iec6+o5ZUpHwygdxbaJukSLaiXxpxNgRmLq2rDU
	oXGgoRCJ8cZIuCl3wEozI6PcNJ6EnpTR8MwIoVV35/SdHh4GUH1DhjoltAnBcPUCxKG7AmNArxD
	SyOwD3lqbBoZQby4=
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822934137.8.1789393857179;
        Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822843137.8.1789393856630;
        Mon, 14 Sep 2026 06:50:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm341763665e9.10.2026.09.14.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:50:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:50:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Message-ID: <ohy25kfxpbwwvbdfuocibhboyhudyzeyht66blralexwmjcrxt@jlxpxt6mxbmi>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: h15J2Sbg5XSwd8mKB79VEG7PhMAv2u5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXwG9LoSLreQIn
 eEBEpwsbvcxIV5i2grnDH7QyRGC9r2vFrFGXFpgYhLgyjzCB/jFlaS/IrV6QAzFu3jb8uxW2IZ6
 zyc+01AKCtpcDFvNb5Ub7nAuNAOvM1Bz6qJEp4jPjyimLKuQESKfPgqGEXAu9joYl2c1sQ4HSMV
 +V6eM0UMmVG+Z+9dWL9ZJvt46dwNbhQ7XDSpUTw5/iV/QdiirW24adkyfSWn1kDlbxev4wozwaS
 ua8DbA9YR+Yrj+NesJL9qsKoP+iirlfFu2H9mJ+CY0eOWhmOm87vY/zqfG6t8nJXIcnx9Qnbkpn
 AnrTDaGZM4aIpwWZIn5iqZjy+vguCIooJ4aFWW46cP8Gkv7YCsdf3O0Nj0OjG/CpPdZiuTbNry+
 OGGsYejSwvGSjFBaxIxYzS5BPCHww7wbFq2R3N2A1XZvauFiutOTtH5iEMoUeRA5XHeFGhULCpP
 xkGbEfSMfXzGddBhYFg==
X-Proofpoint-GUID: h15J2Sbg5XSwd8mKB79VEG7PhMAv2u5D
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7fbc1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX5IlbsDIPphAG
 K/OnLOD/z4iKPPBHefxEntsBJNgpBG+s+XoQfWVPbaJpyqdaGE5mY/SXgVpY4+1Jyy+QueBlako
 ie52G9wd/ds2B+pT7Bc0lBjCIv1go08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 26-09-14 15:19:44, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
