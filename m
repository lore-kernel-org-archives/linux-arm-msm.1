Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C794AA000
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441056; cv=none; b=D+FkhKbUxDkar+OCaFK80V6YhKRbUQE2RhEB/gd5Rq5+lCwyItaA1HfausE0U4dSBs3knVAkJDa5BUl6lNvF8pcWpB7FUSR+kz+BlLvaf4KFw2fNunUFAHN6nQvuud3wrVJjUfGCJmTZkpwcBnJ9r2Bfnx7dr1zP8GHxnR/AtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441056; c=relaxed/simple;
	bh=OUocHxNHaoVUmZukJnp6L5cZUWHYtQ8kCIucV6TV0dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCMrLKdJdUEtq8cIy5TfL/1nPU7n0NXTJ8aJEiCOnp6qVETSSWncqOCth5Exj3UaGMlU4wlyrjJPSVNqGUYnViarJNdJ5gadI5detwD6pnfCEfQmheqAKR8qXrQK9g07fEuR3ntbPAG5iFc425YUy95CFfSsWJ4VMtnRfup7GQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKptOiMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Frbutl1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKptOiMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Frbutl1X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAhgG707750
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cn7sN8g06PhLcqch4IQw8gv6
	uTx2KKsaOGyxpQeDq28=; b=RKptOiMUoW8m6un7H8mN1o8vuFe58rpoeMHd2MB+
	FpSzPfgYfRk8yln61tLY05aKdlhqqlg/yIvwhNmUX+/aTZQ48+j9nwEnd99Fm/Gw
	Yl2h21GuM/Oh16enKrF20x73FapEdqdvGAcWaD9IZ/eXi13uFCmpVxlXqgGgBIxK
	ficdduSqECy/4PHfW/BAWAED3Z63CExjKMEiSsnYee0mwj4u5plLoDErK2L6vBEq
	F9HtvbyOJJUQfUPOrL75jjVZwqeM0g3MrZg0RD4epFoULebGqCUbCd41OlloA26/
	vOIiPdV9vB9BO4GAFIxmksxZzD+ZWojePPztkbA5XfuQoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhcm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:10:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso419193885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441039; x=1789045839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=Frbutl1X9lV00ToVuNj3CqVOKjJ2A+TixGO7y9vaOM24BuZER/RdWpBFP6pZ1x0/M6
         DGHlLgUjP+LsTkUnKz9gNRj8M6NdVgGtxYbXUKLn4JuFuypiyQBJkoxGjqwkJlWuD9Rg
         kATPgQLuKMXA6ANY98AvucA25oGjB8BkebQDUICPpp3cPpEPTkqebgEhZtgt8xGP+Yr1
         LSvMQklzbQW5N5rhtnkYcPHUMVfPyiCjuQSRUgnEf4tBC6YTaLXcqoPeYWI3e98oTL1g
         33sgqqOVbXu+NrocjA5AiGZ+1b+QE86+zGesFxtkMV+ENrOWXDqZvYVuG0gjHZO827Es
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441039; x=1789045839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7sN8g06PhLcqch4IQw8gv6uTx2KKsaOGyxpQeDq28=;
        b=oDRsPxZywJwH4egmj8G2mYPzfLCB9T4Tq07ZzbEo5gPmZkTOR3zm5RYEfJwp1pUD2R
         d8K+G9FYEksvNqEFLvJwPejxsMMTHl8TesExCKPx4cvDK/ikeZ9eXUSuuo2IeHZKq38W
         unRYJhoszYxli0TzKPLuBMt0enlYLy5Vpz2VhJ/BjRqSlVqA1lGXpRWZBnBL3sNY5t9c
         1vFWEAXzgZqiUuncyjPZQarZVK0Mry6rKU7OUeV0E3n0bE9hCpdhrtRWp9QFv3+3j4+8
         fTlgLpm2SH+r9lvcFCNWGnSn2ArYA3NVQS/MfggqblunjuiAAvtvXa5skjPvleKdBh5A
         tMZA==
X-Forwarded-Encrypted: i=1; AKwUvBzD8PMJBByZck18mtu/IZKEJkjSG6NqROF33BgshouTe0uxQZHqicyRlhCEBX/H0Gcp+ECRv8NxOVK8bevJ@vger.kernel.org
X-Gm-Message-State: AFuF++kwLHVDlmdXzq/b+01GPh6z2hvT/7thEfrzym14NEmKHZuDTD8H
	Ol8978W9HV2++4/e+pYxI2ubpa8Irx2Y0IPAfXMraXhsKwBpSZfHQ5EeT3eNyFd1u0SlmR2zS+u
	QxhvEJ+06Vey+QBuFweW27DcebbcqlHXWOgdyXLcn8klOZqaLZS4O6L9TP+3OWCTt/bDJ
X-Gm-Gg: AYBFou0LLfHWFjJroYz+V5o0bnfZmAT77q6wzWTuBPXs1RQt8UB0jdg+mq1+AJzMHOh
	JikJUCa1dcRdaQsM1fLnjSxFdjAcmIAAMexR2idNQFRSmXo0EY3gK2GB6iGuDjYAUpQD7p4zMX3
	o4T78euphrdxPAyI69zyK/ml2LPqAHIAr/knIJfZP6U1bC6pr/v+lp1mZNFc61MOXSrHZ7/Savm
	3FAQiE54RU6tAZTSuVXfFyxmw3cb6U/IhLaE2/lzMdn97ouefvZRKbumzuG8ZJGtYWifWcSZfQp
	beDhAPPmhrjsnArwTNAWgIuIkDBQ/rssTUUr8JSICpgbhXLbpv0OlqlLrr3wxuMze2QN7ogjNYa
	nK+CzvVbIftDuMA==
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596207785a.14.1788441038823;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:936:cda7:554d with SMTP id af79cd13be357-9396e9bc00cmr596195985a.14.1788441038097;
        Thu, 03 Sep 2026 06:10:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm76285335e9.4.2026.09.03.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:10:37 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:10:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Message-ID: <44uo7pmwu3iztzgwqwzygyisipoqt2bczsawojzdn7hszk6tl6@c4ybkv2zvcgy>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-3-21c3db378611@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YMAHwZOkhEAc2HoFFSyVT1cJ3X_hR8fL
X-Proofpoint-GUID: YMAHwZOkhEAc2HoFFSyVT1cJ3X_hR8fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX4xoTJFH0rqtc
 wjK72scHaxmrzgzturAug3Vfg5twAnjm1oXv1oRVi3lTl/nrjEOfQwTyGWZ6IWrIfHdsnsMFIjE
 1o5NuW6KDHswM+zc/E1rcyiaEMPUT0dQI0qbH/mF/JpFCWvCqTYT+/cqXGlr1L7t5nQXGTtFI9E
 RYzQkqpPCL4BUl13+4LiGHINKhzvRUmxxypEcB1uUNyw6ipBM5N4weLXfoJX35MF+7CEVUqLDJZ
 kc7AAH/mD/Vxs6oHZJ73+RSeJbK3HU4rN3+SumKpDSomF8eIsWiUn/Fiw9qEeZecsaBEom6eZn5
 ufNIVxURQBiTLC5/7VDkg8C7asEFs1NtzvYby5MMmo5nFQgjgYZbgQFwl7377AJWS2fD5BUvOo0
 n/lzoa9Whd9KlQQ03uTTOV0RRtruyn40m5QTi9co7Jc7feVqFs9alUPmHYiZa4CGr24tlzVcx7d
 ig24r8TzK8vaTV5Ej9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX+zFSXcO0XNTG
 cuhNRlDXqAtlzPNnsUpOqDhqcbPtEXHyBn/KJoHyB5IoXiIpu7+AibkM6WuLDOK0u7hUJupRKeA
 GfGpRCb6hrcS/0IxWcrb9InVWlfjgfc=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9971d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T-px378Lc1Y-79xuwAIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030114

On 26-08-14 05:48:13, Luo Jie wrote:
> Add a flags field to struct clk_regmap_div and OR it into the
> CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
> divider_ro_determine_rate(), divider_get_val(), and
> divider_recalc_rate(), so that qcom drivers can opt into
> CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.
> 
> This is additive and backward compatible: existing clk_regmap_div
> users don't initialize .flags, so it defaults to 0, and
> CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
