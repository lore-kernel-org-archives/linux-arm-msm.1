Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6935E1B8
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 05:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587149; cv=none; b=Ajq7dC6qUNPWVZWKPWKtQjkdLA1T+2gpEUeAk07dAiUMKGYM1/l/yFnM6ovWMNRb6Ag+aWBJbDZ2gs7usGF8ACixg2uW80aeDseE7oMhs04J6PW6pTaBGONl4JGdxA6w2xcApbj6FrerTDpUzv232RY0Na0gdMc4nwk3pgxf5KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587149; c=relaxed/simple;
	bh=V7DMQm1HfmyW+rSb8H7jkVdhFD+25OFon4uY7cjC+dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObiYa7avg2wj/a9ABNnBoCrQLlZulKq44mki3GY/sFBE3BjEK5CiSbekWhpKZ8PGJlDDIY9rQldS43SKkfL1NzAe4AyTKIAa50tc3UezJ46LeUtjrTJp8DchLxvtm2HAKD4dzSZ15sYgDFImNQAWiIEvXQBCiO/5waoeaZkYjU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb794P8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk+w25KB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb794P8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk+w25KB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854sWuQ1353783
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 05:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AFrExlz4GMAX4ru7ZKdbL+nW
	MkWlCx4pgO+xZDaWALU=; b=Lb794P8IZIRKWlRjXlnBMXCbiItCuDywJfhA0Tqu
	/NG6N8VXIb1atXMzAu+qqfAiUb3Cbp9xu1TKNGu9T0/tjwc6DspQn7lOzl1M9mbq
	ucxfQ7lOMFAHvGgGdwutsPPXtF2cZ2mB1igQY/vAFCSjJ8CGiWFk8C9p97d87Lzk
	qoEr5cVrzS0AGKLiJoMhn7YN2EaBgjkzj6qTDwRrEtoEa7uU8zlAJUmUKtoLSw7D
	4nzn9g/EavPaSb77D29gyK48aNVzffCYu2JJI0Fb2nO/SBLrPUNIRSRdEoTXHOdz
	5GUa3v2yDTxY3G5zxfL9BfM7QAG7ZCNc0027KuU9bIIabQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhgb13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 05:45:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so181452385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 22:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587146; x=1789191946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=dk+w25KBmLZBXzD9XJDNSEPoMjLEDC5kjgurx6yGfLFEhMLl1FAUS/7mqrJaO5S0Qa
         DiDG7ZLV2MIYtA1OUEseEucBO4/0IitLPHetcDYlP89LyRiFtQ6OQwosMUDGFVtq1jHQ
         MhiE9SFKKgcc7KTJrO1PH/Dixf9KVgwPy2RDmaoF6mG7OnlvLiqj2Ptc+G7mpidRkwvR
         8B5W23ZDaGDS/C76KNsZELQcclDb+PKyglmHiYtbcT2NcKn8P9dUGo1MeHOCp5qJ+nQd
         iOBAWft/uNi0qhZDqa8p808+eSsrLTvvkBDNDpad3OdVK+MP4lPk/5Ss10tBfE0+Dycg
         eQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587146; x=1789191946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=lk8a6gxzyzBcRYjdcjPogaXiZw5ZnGD7wJNz4iyA4BUHuxMjtoJfKS56vn7+MrV5tG
         Qw+1FutoxQP7cD4ht9ttIqGEjh8b6v4R6ran5ahkGSDp7UZ434Kmybi2VAQItPTUBhVk
         PuHDXmLvkvdkJ1WYaZ1OJF+JVwjvIAA0PUbG+AoZWODcRmP9OgWFWbWuRbVl9aeDM2/B
         9B5NOzp+sVn7wLkGEEu7JeRdxW36z56P0ZaSBVJ35T4bGIFsqyhcC4ld3fxr29MWPB/G
         yqVihzSZ31CGXzZtKF+KZbZhrYr8hLMAL+fzsAscIbTvZF6W+BFzOoWp/vrzZTFX2xUv
         WHnA==
X-Forwarded-Encrypted: i=1; AKwUvBymwDHTeSIxirqV1OCi/Xe47hmkdhNdBID5V3EyUEPmmu2rdvcbU56QknK9kWmtIIYdccSoH1WwvmGWe0IO@vger.kernel.org
X-Gm-Message-State: AFuF++n6xkOjVzOrvHqtDvQWwBiMf/fGTR0mzyKB/J5twUe8ZH0gaOPC
	CMBPnlFotIbFsK7RiXsZ3PTWyDgsLlgh9Lkh6mWxgZE0jfWr8R4J1MkZt9KoS88eG9UV7mzcb7F
	8zGGfmuUeEDGVBly3MG0p4PTM5Y4jghx/aVWvafdUNcD76ThP5weRRZKtkIBEqrYkKsaF
X-Gm-Gg: AYBFou030SHtNkpxISDtDSSGnHLDRHYboGdOlI7DjKiB/31Lvrd39/Ts9Nm1c5VnHqY
	M1JgYWTQ9CMYc2pePQjkOLbZHwyZETB4fbCyPKC2iFQNK2UQ4TQCLwRZoijudwXmama7o0rC5uq
	2WUAD1ntsHlrL6/5lfXAidL740oJ8sH8J8FbuNRQ5tXQaRZOT9hZxvNM65CbVQpTnWeZb4nJ4J/
	E5Mvrm7y6L0VVcTAKFxl0jDr3so41dMeJF+HU0keFWWFNfNtEu8/RKKqQYX9fBlyBchkX4uLFON
	aUtC5MlohLLVvsLNTez1SgbKtGfyANZyPgbNU7bAQ7pzhWxMRZ/dHyW+s6QK/0SaGjph63Jr0s5
	C+4vxapQKplI/
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036222885a.45.1788587146185;
        Fri, 04 Sep 2026 22:45:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036219985a.45.1788587145599;
        Fri, 04 Sep 2026 22:45:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm167658815e9.3.2026.09.04.22.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:45:44 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:45:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
Message-ID: <kx7uoucnsif3atqsocuavdwvsdny4snav5ncl6e2tappaxdkxe@vpaahkdzj5xf>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9OvdZPeiS2A4wWCx6rAjGvaj4ZXQ4NP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfX3WZHxlIcUzJV
 kY1RB14mWHlKOgKaHDDe6GCu/NiWhb9EEOMQuLjh5UZoKYWvLFYiWqyK3pOzZVCOetpuYrdpyO9
 Gr/3W4Z7NT+JD3OhUq4+a0AYrweNuSVJKJUaztZ2NnymPMBnHd1lDHBtPEYzz4ql4mOveFaS2YN
 Yi3mz95jXws8Hjci/+C0hwNP+a6YBmOocK1vKt78q95eYnPTWlLfa5frGkWwvSRWyCuZcaU62r+
 smxkxbiPAw/PBOTx+quYU2/ExbMBGIJUTmHN6EYrAHRL8WxfQu7DhhecwIgaaC+EZ07HX0rjyfK
 CLU2/uMD2HJ+woFGYU3MDL+KW9HQaIWdj5rr3Oo8iLyEz1ELojia0DGCdVwgvo8sO73pZCrstYd
 XwaeQSxVn+7TNTBAmIaw9IwRLHj9+Ll1xYtwr2X6snySWAMImATeI8dGvt4ZfhOF+BmwfRcXtBI
 hknYDuAujKaNw1uHtTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfX2jKHNdnaC0lT
 UoVH4nGTI68N7YsbMb4vXsccHN1Sti34/ngY2uUn+3xO3f9uqEa8jeBK5wOfbjGILJelCKBM/Mb
 rw+OsAsTzleW7M8CN9E3nCR0qHTrip8=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9bac8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9OvdZPeiS2A4wWCx6rAjGvaj4ZXQ4NP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050057

On 26-09-05 00:20:45, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
