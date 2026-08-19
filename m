Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BA41228D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127098; cv=none; b=UFQChXJvVTzPDkYmwe6Wcs6X2DbwOu3nFMRcLkpMbSiwYqjDjfgupnXMau4vGYVsRIswah7XeZFeX6nUpnakbD0Xq43DbkcRl55tjdYqSNOkSLjIypI3ZUed+ivnzdW9GfSKW6gdctvs+OenJt5tWWeGwLMKM8wY1t2Vx8C8XHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127098; c=relaxed/simple;
	bh=Qz8lPNzuIAl2JFfrvLAw3SUC6irpQGTdatNMcIiuT2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+k1JIaVHTvZDZLQJRTr91gEsJtDGWum7DA2ZORA5J7Z2iaOMidbaXu63JcnSLMXInB7oRvhDE4hRafGfsQwkSLqDX1DGTtVWxywIkCSo1fignQTiEUa7viU8Kq15wTGuEnxAYyqDdcXhnPlOlo6Sbfh449nbViwjjPOCKh+JrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyUeZ/VB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1m8BZ+a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyUeZ/VB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1m8BZ+a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z7rb3589261
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LAdAz8cgyVGRPXUN2AcIdjCd
	T1S37okBhULEMz+SDiU=; b=MyUeZ/VBAXmamh7/bgo+0D/d8VJcmyfa8FRlF0iG
	Vd6KbLHHPbph/JsciMf0Pl64GzkEaq/a7iEPiMsrXXZouio5f0zg853k9WsID5Ca
	axyvNfknlueuIpUjVneIHR0Ttc2Q1mVi4zlc2NyVOZcdo6kyc2v04rPxOKLfNsZk
	RbCpEv90z8mdAdoqREHyJPovjrwhuP2wv0ln8FjbA3haN5P835IuM/7uEYbJq+7g
	M4lJB1vc+FQB8QpdnQeMQLp7H3inux21AT6F4OcmMhzX3GH/u05ihD2GLriOKzQu
	Walbi/iAZqFZxd2nPzTAuo8Bh9AkEA36idPWtuyYh1pEBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfna2yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:11:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so94441985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787127088; x=1787731888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAdAz8cgyVGRPXUN2AcIdjCdT1S37okBhULEMz+SDiU=;
        b=A1m8BZ+a1p/S/caKuWS4zpYuKURbbPki/c1LosXar/1u4CowTC3JQX8PH2ggpnXSJX
         kLUJIW5xPwf4rQWM4pEZv5PuyY0L08gBeJ7AIT05FrG4mjhs8N3veKufAYo07ex09/Qh
         tP8gjGxjSdSuae65nmqjnI5SCNDzGIamCgJQA4U4cNY2tqHEOBb5TnMQ/3dNFv1jfVlp
         /TwagaoUHy0rQ8LqgHtzPmXNMKa1P+Qiiu9LhiZx7SIRdPws6x6R94sDzuiQfL/yAMzZ
         EfxGTElMNP0ZJm55YFaRQeOxTweMueTGbK91cQ6bsb0acHbjgwv8FIhrED9cAOhrxjrb
         8awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787127088; x=1787731888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAdAz8cgyVGRPXUN2AcIdjCdT1S37okBhULEMz+SDiU=;
        b=aj9wx1zQrJ6MC9UNjsyWDYZO8VjSTT/fSEh/eQvEZfxAC3cl69t/xGqHizrfg9rtVf
         TYgT52PCalDuPbJjN+dzlwlLcMPi5Sp3Ub+Gana9q1I5DBR8a3DzQhC7pJyNqrmTxX9z
         j6n3hrg9HGGhNYK8S1v+d75bdMqOsyidMBO+n/fMUl1cuUlCMBcRLpgJOEOGYrUtnIiG
         H93+K21dcnc7psicSYZwVQbcuDytT9mMAdhdjpADb0juTwEXCsvpzU+oss8lxHciBw3x
         NulQqF+62dNpeXDpy+ZhntHJL4eGlyyi3QkKt8lX7s9laoaD5BNQcVFp0WTA6P3Aq8zF
         eOqw==
X-Forwarded-Encrypted: i=1; AHgh+RrgDniAQx/d+NbozvKgurdzZOKL7gt4sB90tTBXCU6n9rDRg8et9wL9L9d0XJY2jeibMXWRGn+npg/ifAvD@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHKuYBunQdiAV1BOXdrydRZ7B1BZXsIdAxAsjByX/3RwykL6l
	LLjD+V5F+5Hq2ecI8V6QVL+MtzqdMHyWTvePoKUwWsnrBZWga7aIYbJredxADPrLZyBIAtGJeyf
	6F+TGiSdgFvQaYELy08PTgPQTpP/yXWjNLifHJlGqD2QRoj0WzUD2pYgT7V0wl8ZGyGKh
X-Gm-Gg: AR+sD11vedL+MMo5cwUAHC9K3hFF8yeFWScLnmzKGeIIhBNTydSdLuU8Fq3PNKL+LND
	K1eJTcNAHDRpLNyzFnWm1KXq5qo8ezSKpFp+Y9YpbrXsmeiTEmYcZFNlYg/5Fenn8mBO7GxO2no
	F6RQFuW6KHu1krsq0SOuWKFdtpR0XrcbKd4/R5DL8hZ50GW69MSdu26yN5fAmcHE5In86ktQ16h
	M6vT4438O6wCmmNzhamUwsrSm2Te+MGaM8GSVBbYkBBPbf/2qHcmcG2/QE+xxncmqme6WxTorCv
	NiyCcHdZeOLcRVZ3n6nxNuMtm92VToIUOAWulvZOevCuBZHpl6eWA2khae2esFtZUERgjiVM5ut
	to5Sos2cmFlA80I8=
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr263112885a.21.1787127088252;
        Wed, 19 Aug 2026 01:11:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr263108385a.21.1787127087639;
        Wed, 19 Aug 2026 01:11:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm42383635e9.11.2026.08.19.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:11:26 -0700 (PDT)
Date: Wed, 19 Aug 2026 11:11:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: hamoa: Add graph port/endpoint
 anchors to pcie4_port0 and uart14
Message-ID: <tjnjnvbplv2pihwpkzrsy77ppiirltfjlogaumctcyihqaunwe@f7lds3ogphkf>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-1-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-1-1b5ceac74538@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a856531 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tlvkwGZ0IAML1G58lFkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xk1Xp6VBBV6lNDvmqfjrD5U0f0w8eZBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2MSBTYWx0ZWRfX0ypmgIWAKLjk
 G+JB9/gKuRrLJR72/c/zsQtOy5r8064OrFHfHNqQyR1pJkGz+Pb72Ks4aBQMDjdLr6sukN9Ax7n
 /6m96rqJdO6HRrgmLwalkH00ZGi8J20=
X-Proofpoint-GUID: xk1Xp6VBBV6lNDvmqfjrD5U0f0w8eZBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2MSBTYWx0ZWRfXwDP0btHeZsBD
 R2o9k1kM4GiQDwA7t/zrasROAhuhRJrgvpoA1zs6XV4aoEvXEqRs7VXpGB++YQgXM9KWlyigK82
 uxooBEXmCVcpnvFTWDjJVKzc2Ctvk57u4juSBOqqUgbCcccMlGrkHHXBDFOlv1XFMQRfbNIPi9v
 L4EjSN3kHPEU63v7YIvsaeRySKJGOHJKG+2Lwzdb/CPk1Q/zuOHNCSH0zBe0Qkzdt9hmaqPc9n2
 80PpV2tH7BOZ/c4f9c4XX68w7P5mWHM4xK3RrliYZdXWlGN1cZfVBjqMq9RP8+J3wl6Bi7W2PaK
 3EvxHeYhG5POYsyyqdL5t8jHS7uIkXl/Xoz1YLh2V7hQYlPIxg520xtVTVx8GpfmcTiY9aG0dRD
 l4t6FVew1aHTvQjmCduVUIzkOjnWNMTbQzmCMgXhPHLqirDqAADZqrqgoVbuFciUgEDG8q3+ugm
 mgZ8U/ok01Kk7e6SEzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190061

On 26-08-04 18:02:25, Wei Deng wrote:
> Add empty graph port/endpoint nodes to pcie4_port0 and uart14 in hamoa.dtsi
> so that board files can reference the endpoint labels (pcie4_port0_ep,
> uart14_ep) to describe connections to M.2 Key E connectors via
> remote-endpoint overrides.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
