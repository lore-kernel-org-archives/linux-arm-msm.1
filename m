Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFA3815CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844288; cv=none; b=ToJRadwoGi/L5nncn+Xdp7MH4YtPIGsmi8pJ35z/5golO9/gEemTP520NBeoAErV9a9phRnVYxUI+GTQjP7BJFS+ZgXmMqxcbvNbYg6JO7OQQiY3uPWOcX79E3VNxeyI0ZA2rXlG1quzKxddQ8+IaX+Cvod1yIQTL6Aroyn5U+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844288; c=relaxed/simple;
	bh=m4+FF9aznsbxg+UhNxCnj0Zg8uo1wX8zDYSWCAtBRkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnz2opOM1x47DDZFhdnRVcKV7lxwZ2aTY6avAZntShHo8hPH+FqyuY+S9FAkOiJWakV125vqH43v6GfENrHoedPMK1DOg1Ky+XWp9icknaZHrRHguniRGJrVc3cIrbMHp2F6nV44agEli9x0vvWEo09yy8iMz1W2r95OQGVQi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxzZF44d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTbIqOBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxzZF44d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTbIqOBM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CL6M3217732
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bktLxQOI+nK+WbE03+Qv/Ll5
	m7truWVn15kwgzjSVnU=; b=JxzZF44d+XPXzwmD7MRA6moEcrchHr/+hB+pjmbB
	iWAAH8spVtwyad9OvTpFqVLtNBG9jKohiRuqY2JY5rgonc3XiciWAC8zFddkDu8l
	xSKWFGmOyfZNLeMFDfNblUutnKMEE5aipwo6WaMk6pLIDsUZlQp82tGCGOQV2Rfv
	eaqyjUTtiuwxSG8nqEjdEbvEtMHJXi9/tvPmzvBOWpn8M8oockGX7m+yPRH3E7p3
	UJu8YCMg56VOKwTKcXSpQK12eqVr12oDMDFRxERqFz7CKGr/kpWe02GomCbqfwLr
	AqT+JtScqKZUjiM4fJTaUL8mJNOBQzuvUiYpKP+zGSkdzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sc0wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:51:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930f5da3467so422617085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844285; x=1786449085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bktLxQOI+nK+WbE03+Qv/Ll5m7truWVn15kwgzjSVnU=;
        b=MTbIqOBMxyCUSBsyvEUSqmmq7Ahg5gEYKVHlUA29V87OILagZloQZqQVvFyiEw7wX6
         en7BO5A6MqyeLqPZpwu2jwhBozpgP+tMeFxoOWdzF2BOr5x8Cne38dt+0ab2AV0NJZND
         woUwqj6HAC9RT7KtLhwOdGYtn1Hkrvi4P/gcm1f1Z9C4sCr9ohHvDKEXYiYmEFjKnfKN
         5nLfXOSwgTpHL5C8VcQuaA2Xt1fskxjtvEjPGMo+ChaFUKFENHUxsVVGokXvHMLSrebB
         x7idGxkxr/8CLS/m+Q3xAWETns2XG3EX00ChyJWNS4H3Y7AyHntmjw2ctX1ii/JPcjRF
         1oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844285; x=1786449085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bktLxQOI+nK+WbE03+Qv/Ll5m7truWVn15kwgzjSVnU=;
        b=Rv+KnsuXlkpYSQyJVSDjQSQwqngeOakQUZTFVRSWtjlbb6Ds6trZ7oxCk2iTW2T2gJ
         IG0OljyRPQoldvSEcMFP3NAZqvG2proeBYOCh6PCgKiXCqWED5RlVTZdyO/I+qg/1gjG
         jnc9/8yNYKA0EDDwk9TIEEo2m7xKc8031AWPCjMom1SXP+wEw4mS6gpbpQlv+6Xb03Zi
         3M/DNqPRPyplPWkvCDX2FRmey9nE/w55AyRPRZzFvvN/VB6zyrLhAJcL7xP4zLkD0lUv
         rycdIuHRv4ogUtpovZv6HN+VRVFl76ezV9ReU3kPhbImqalaL7QpyVcchLxuPzort437
         xdvA==
X-Forwarded-Encrypted: i=1; AHgh+RpVKRVcaYoAn7NXuyq55FbMwm7B/FmhIpRXRLJnpy5JhSkvm8JzeVPcuXkf7p13RNm+hFvMygI3W9QgQsfw@vger.kernel.org
X-Gm-Message-State: AOJu0YydX9jC9YZsZjoWKs5704vGr+dNuaKNOpq9B18NZloXIV6bcYmY
	qSAe7mhgZk42/M9wU7JUpAvyJiC3evohIPTvC6VoEk8kxA/0ZTgDan/ALNjr8GEz7ZuL38NFnLe
	JKBc34dWZq1sngQgSKvKY6W1h8v6ev3om0K+Ya6bDVyq9XqUOgere92pD2rlySTcIHFHo
X-Gm-Gg: AR+sD115IFjr/Wj8Duew7XgcNj4LCXqKDtTUhxnpfm1qPnhC+swd+l1gP03cm/27VHr
	tyXSrH1DVdNc+Z6VXvfIRv2jsFchkuJhqQjWP2JMYqpp/Z3pCcsm2G8JHLHP5JstDr4y0gYo8GK
	CBMVn8AOx4suO9UZ+K+K5CmoovXvsPokjI7ODLs1ZITnttMM+inzClmuU7+bNlpKJz8nLyYRDyl
	i/gohmFcEOpwBiuYOFUg5plOUOQgYTw1SYM9Kx0e47Pzp5enbIjIOXYOl8vfucMtLMd8D5HD4Po
	du6tB7QbimLFMYOvBkiaadVQgoNA8sfNzUrPzKmsp88Sqqf7XkLyBU9CHiK1LdcOBs/tD19qaXt
	Vp5D66FobUumDHg==
X-Received: by 2002:a05:622a:598f:b0:528:f72:a986 with SMTP id d75a77b69052e-52b567dc777mr274873481cf.44.1785844284690;
        Tue, 04 Aug 2026 04:51:24 -0700 (PDT)
X-Received: by 2002:a05:622a:598f:b0:528:f72:a986 with SMTP id d75a77b69052e-52b567dc777mr274872871cf.44.1785844284022;
        Tue, 04 Aug 2026 04:51:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fe2f4fsm95228745e9.10.2026.08.04.04.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:51:23 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:51:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 24/28] arm64: dts: qcom: glymur: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Message-ID: <n3lu4rlwjzymwhdrnyrptsmz3uqemevgzhn7fsmo3nxaqtsgda@dkpqvwtnmlof>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-24-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-phy-supply-fix-v1-24-5880630cde3e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71d23d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OGV9TLrtSMBsBMb3FhMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uCbc3LpT5wcShPI-Nyu-EBqtWGLTQMpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX1FVMCR1vF83K
 YfE+bdKVIAbgT2WrgL02FlCMAMnXkTUeG2eXzr9TTe8GNhY9zXrc0Yc8rvdVo1llQ3exbTfPcvC
 1YXsJx4Yz5Lwp+YGXJnTmZCyaj0tKtnBaXM2iwEeiTK+HgCcM9/hGp9nD7Ce5cG6V4d9mHUmjjM
 916C1BsQtPEdLZBMvkCtgusZa5TX/rzx2+q01Vbls6iSwcIic9cJ0OzAAT9WTWS7Kzv9vsvyCuA
 xDS+8sXHSBULpXUZeLLGqjgFWmlU0mVITNqNU6nIcirJCRrqbBPCkV0XlvH0v+5Zw2fw02n0nrC
 0CG6udE9f/Zix/ROWokxQGT3oKP3Mp7W+XOVvLmycd1Eb4YpYS+esJfzAhh/v1frzQILKkDiTz8
 KlaEweF1YweSP31HgIWnY2qUw1ZEGCzf1n8oJMTEmI+rY6etUi897udC1cVhzUXxLv5LP0leLF3
 NSl45NRX3bL3M5Hk/ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX6dp5hT8HZPdC
 H3vcxMtz+a1o67QMcszXjRJmHoF0XvrKEG1Nd5uC9t8/O3jyFrGofmNZ6HHMvONRxbJmW61zQqh
 yi8IwaaFL9AEfNmJYwiWrS2kkmMsDv4=
X-Proofpoint-GUID: uCbc3LpT5wcShPI-Nyu-EBqtWGLTQMpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040095

On 26-08-03 08:34:22, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
> and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
> DisplayPort QMP PHY on this SoC. But these two supplies are swapped for
> the USB QMP PHYs on this board, feeding 1.2V to vdda-phy and 0.72V/0.83V
> to vdda-pll.
> 
> Fix it by swapping the two supplies back.
> 
> Fixes: c8b63029455b ("arm64: dts: qcom: glymur-crd: Enable USB support")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
