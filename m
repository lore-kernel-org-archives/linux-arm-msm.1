Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9845518D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339403; cv=none; b=VCDj9rXeXuZ/BFCDTMGbWR6a2KkCwC7fIBZEy5AYOy6cL+IzgZzRRkmWshXmrvMC8cY1JjvMbWDo4Ojbmb50Uav1v6/VUk6tav2e4l/t9HTctqdMp2LvTWWtX6wRaa4SWfoZMEQiRql4QI+NnJbuKf2iPPQwkULTOmhnHOcklvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339403; c=relaxed/simple;
	bh=eUHkvRZ6Gqc3LHRLmxIjFnwnwjPHzEBXuf/nd5EhbK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIIWsC6YkVdQ9hJwQDyyUscknaeyd93okXavHv4J8mYeiWkwsNUiF/3jIcEyHskhjlk8Gn8l8xqocQaa1I2p2qWV/wOPYtGMrtXxPaAUBi/eAOMlOUFs9sxUs7Os+n0SAkE5hod4mMk7eYV/ShDMxjEEcQIhDxePAnZIRDqb3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5FUx3AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDfH9SgT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5FUx3AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDfH9SgT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2OPd2193178
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FxcUM+deYQQ7xTSka6qwNzos
	4zdS/4WP5j0NAyQS3i4=; b=H5FUx3ACmGIeXk3eC4tvnCucAqFnfY8VlSYUPpbo
	BFS5fwQ5g4UjlehKElX2nhyyhFhhDGc/VD7IyilzP+pkP6kC4GHLPtLLQy7WHsMt
	dLr8t+ajabxyMSbIq2gFj5TbCjbXx+ozaobOS6HjIpOrBC8LzfgwEYE/AdpdyKjM
	kyhUWFxyWIlInSGuIB2XqECdEuvA2QKkx9haVWYH7iTCZQ9tj1LxRTLEiOZtCkez
	aC3irAudVV+AQbRu2yrFQoZ502pma/mQg/FgKeEvAN/EHaesEnb7o/HC2GdLsro8
	YDSaAhPeSUoJUfhZCmot7EcTaOhgm4iKbBGZTUWx0M14aQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkfm8c0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:36:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso20778491cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339401; x=1785944201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxcUM+deYQQ7xTSka6qwNzos4zdS/4WP5j0NAyQS3i4=;
        b=JDfH9SgTCM1Z4B2cJ1BZkplRZBe4sQizsnZuQjeoTWXkKnr/F+BqUjh4mTCSRlCzxR
         vaWi7JiQ7Uz3tbUhfu0+EzQbi6x6MsYO37yS0OIVnWfPO0DYnyCgVXvSrNnm9TqXeJDN
         Cvy+BRmhnz+T7SJ1KqwqahmLH/q2KEWFj6nmy5O5yImzSEXZYt81qtmFJhD1+XMWYart
         R9ZkpNLX4xdGemvgu7okXkaTI9Gp+qPoVjcKbnbsznMhZ0x0cDMp7XSJxZzaDsxH+YOE
         arhrra7O+KaOmpRqRCRH+Dwv47mZlbIGlGiSuZ8YRv7OEOxC9gprDAGhHC0rcljRJo4N
         gEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339401; x=1785944201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxcUM+deYQQ7xTSka6qwNzos4zdS/4WP5j0NAyQS3i4=;
        b=IGfCj2p+ZgWhKyN7g1v/G5V6FSmlvaCem6j1+ocVtxThQH2LkInE4zhsJJgfeHzlDd
         v8OkIb8V0AsKKqCVZghMfQ5TNIiJNrNsnUW0vEUU5/jczblc1QKpZgx3mZHaZhQ9nCFW
         nRTN6RuPqGYT/AGJ18UFdAZFeuBMila8j1gRaACAQ17QOCXpFIXwkDpWMrqZNMNnG/Sh
         nKaBnx2htytfBvjpqlf/Tgi0nBLPUJIP9X/2UaCp1aMpN+/qoLIbr+VXGjlAlnlixPUi
         gR9eTwYG7hdZ2DATXBK8yeReDFnWYrk+SCBijuv8960BdqaSAjCL1STqpLF9QMW1vtfW
         josw==
X-Forwarded-Encrypted: i=1; AHgh+Rpfmq2PCl4l9ncRSPG3u7/SB0roe0RmWoi+8HQZQrSLb/3fLXyM7XU19FufOX7p8HADc1l3P2EN9PwUw4Ih@vger.kernel.org
X-Gm-Message-State: AOJu0YxfAxUBbQ1SigNxEz/zINkAhN0Yhro84Of2mAZwXLoQYLvruJzA
	XfpaeFTRV5tzwma0G6Dg1+PUOeBldKgO/SJrhKA11+PHPghv84b5EBNhOZedOQTklSQjkHEnygV
	AGHNFDPOLKfaVFregK6mbuwQKvjf3vpzOIZoc8aLXySnyoaKaPQu9GmwS4Id2CxKTjEvg
X-Gm-Gg: AR+sD10TfqnBD9+l9wAAw0XMGFREoa5j7M31X4HoWk3vlgE9OQ9BRhmyLhiKl33LW26
	MgQ41Lc3oqIQs7Lf2QqhCOMUvI70rkd4ww3l6NtsQRH8jBYyDp/EL6vpx5ZWgSFj/Jh4NoFCLUp
	HiE0/6z4ac5xOKgjdSBCUMl80EW7Fm/1mEmRZSCKkOwBXnD/042FU9pvR2HL+ieFdZZ7zCF/QKc
	m5/VwXZKMshXuMSxAYrtRSS5FuzeOeaFMpfOMhAcykXS1fDxX73bsOZ3E1Rfk36jnFzFr7mMyYh
	KO/qDXX9DQL6s/nLY9tuxD2fBPjsJBIIDx1H0pqPDBbnpQfRzj3vMXZo40g49luqUyU3GVWBdPy
	npr+AFSfP2tn1hqo=
X-Received: by 2002:ac8:5713:0:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-529d6f8f18emr65430961cf.17.1785339400479;
        Wed, 29 Jul 2026 08:36:40 -0700 (PDT)
X-Received: by 2002:ac8:5713:0:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-529d6f8f18emr65430351cf.17.1785339399816;
        Wed, 29 Jul 2026 08:36:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496fa4605c5sm70121075e9.1.2026.07.29.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:36:38 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:36:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix PDC IRQ mapping
Message-ID: <xnybskwqkokgyup2ad3xumgbxoizh6nu5djxocs6efuma25r3g@dlfydkg3qvmk>
References: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D6p37PRj c=1 sm=1 tr=0 ts=6a6a1e09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bFcAZ-Q01SOJ_WAJ4kQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zIi50yueoaERuNr7BxSYXFl2iG9PeQkW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX4GNA74G0vcBw
 2LRmYHdiA3gcV+JLlBIMPzUpaavJ+69dDB4EuRzvnCp9cRNLY+kcszXwMR+JBV5ZiQQuJgL8W5Y
 6ijMUr6+cyZungtyxvnHvxcUSQeDZJQ=
X-Proofpoint-ORIG-GUID: zIi50yueoaERuNr7BxSYXFl2iG9PeQkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfXzQg2yxw5Sq7J
 pE81Pnz6qoYwYfBKpNAtqvro7IXxv/CUwsOP1QmKti0csGhp+NXxfAbsd6wzwmxZm9XQH97gtg7
 qWWb4PRnQrMjUuVW1QqGdpzYJ7cxbTz3Vj4HD4Kg2dD+YqY/UbpaO1HJdKAkU12s0kcATZQUw28
 7cFL0df6t5bh1spGabKMS1OZ2rkV1ZJncldnrp0pfYNFjbljbGOigu9GgIsr+MH3+byELavcxwE
 hYdw3hDDlrb9sBXzgI2DvUyAx46C8+Bm/AwaVxg9pAJPZh9TUqH5xS8BeAH+Q/tspLa4wJEdyCK
 2KVU1JkC7fTCGjLhAdlWyR3cu0edl9nm666QkRHKlnHf4+1BFlBXfR0mzBTZoJrUPf1gRI9Nri0
 L7a/fx8Oo/a5jOynUKS5Og+ZiDuQRdV3RoDE1tv6KWp4H80B3H0hmWwZN/CNcyTG9f+Cm4+QTNp
 vMftdUlQ4gFYYc3byzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-29 16:08:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some of the sub-ranges are inconsistent with HW docs. Fix them.
> They are valid for both Glymur and Mahua.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
