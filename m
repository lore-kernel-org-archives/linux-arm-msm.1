Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5512C44A739
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978001; cv=none; b=gZUBpIM+gPRhMi7k9bDWrhwb8qQX91jcaKCzJCwXssqvsJJdbViYS1pFBpgbpn9FjqW8FNaIal37SQk+MqS72TZ5HruHB0a5tfZij3Wecwqvo/o1wlmlrQgEAJTfWPDS7XjMj7jR0nWsa3N2TtEHDye5FzUW5KK+4Vo4qVKkEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978001; c=relaxed/simple;
	bh=b05G2j9H0qJbkPhUK6x2FwgfwJfry+Vdb5gicZz5CZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH4/QE67ipB1HLqPmZapDCkpXHn5UKTBW3N0cJd+CgUUm2Uz0MLCU5lITWxBbjNGyCXezLRwfxlid/vByh+pZjmBKN9PcrIOEvKF/mGqsMj5aZH3aa5EbptCgEOWLKzP6AJF8sEH6zZwWCnnM/kz+qt+hyCIRr/Pjq2kaV+97k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKAF4siz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3RpsR6O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKAF4siz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3RpsR6O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84TN24135076
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=txH4Xo19zps77ydCZRaKt+J/
	GCLudAi0qSPpkfM7V48=; b=pKAF4sizVTTXy7yWYZxM51d7eX97NiesqRxhVCDx
	artYPkMoYOsX/zKs06l8SH+XMyb+j0X2VG/pNg9r8tjYf76NnoV1LjchG/PthW5S
	hle2WaYoGZKMnXbeCm4HW1ykWq8TInFqrKPubol+Rsm8osASFxeIdajxLwMIJZ0M
	xAi5jTvCNZfkbIHThplZshSqDGepG6vbAMLHkDMDLnW+erCfp19+LMrjKDXIlWZV
	fGw6qqeP2AE9UkgdqG2n0+kiVu28RCQ9mxxd8pRb0IR6LmUdtR1arY8G4ez95dKL
	puD7erlmgFaZbz+/Uc7ZBYn3oA37KKMWzWx3C478FywtkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj00dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:06:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so405037185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977998; x=1790582798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=txH4Xo19zps77ydCZRaKt+J/GCLudAi0qSPpkfM7V48=;
        b=W3RpsR6OOYmZAJdei+lgF4jfYwlv6wTbY/Pe16H8mGoqZLZaUtNsHdqcIGgIfOdCEY
         wHp76CLtMYd1Myuo3MAUZ7pf6k33S/T+q2RDSuzX5J2RDJbvNi46Eye8kzXN9+7PrbQJ
         BePUdlKHK5qHE+tJuDnNdkXcjZY4XHReIaKABuppz45JRRGJSb5IU7LdQk+E5wJ+qiwx
         7RYDE7HuHrhlF+bLpOELip4T+Ogb/kQh5kEzNA06Nus2UF+Qnpz8jS78W9W+sOSpMnXk
         eTYmYKxYuINGGOiZEa6xBZhwFKRm068d11VWHQiCJfgFAKqmVGJkObKz58adyoVsXkdb
         +xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977998; x=1790582798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txH4Xo19zps77ydCZRaKt+J/GCLudAi0qSPpkfM7V48=;
        b=WPe5VbLVGDJzdp4cAhyx9DgVcZh9wUTtTAVKcQMCy60wIHiPKkmqLIxUda3g52C6HU
         3l/xCtjuvd0DuaHVfCEK09OFa+dSUoVYPce6T552RqtJrhnmdC2eofJcpmV9qtvIKzVt
         Wqg5VSMgPeNaLWVf1eA3md4tK8rFjZPdG7AFBiT5Ez2m/I6MYZMu/HgabsMK/uTTPFuH
         Wmtbmp7kzgXBhud5OPstgY/htQu4RtB9Coxn2HlMakHfLx2aOUklB5QCVjJOOBiU54JQ
         01Sh6HXNml2VJnsgiaHIvv8PK+bfoB2yU9WmZLLn9Utu7E94rLMdDpvgwrQzjJUDz7KZ
         99dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOKZVAT7SSSALcZZXvc2eTwhcpBqBXAvaQw+WjOsgG3b/BUn/HSvaKFJEQHbwHL726qrWFwatWmD5i9Q7M@vger.kernel.org
X-Gm-Message-State: AFuF++nz0jvh5aU0tih6s/XJ0saRpfHjsyIiZR8extR5DH9JdSvYPh4x
	UHVswjDBWWXgEmaHjACX1O0kLjnq/wlFlv59WidgAXKpd+5iso+s+Yl03uhGAlexNGD3niBpSCp
	fFFpot2ydAyiLAsZ9242FzsNhjWLoTAyA1UBsYfqxdyqU2ltkSuD8V1RFQaZxy7H1SWyn
X-Gm-Gg: AYBFou1fTkuCp7Idh66a8KtQx8fH7vrTf2NaMqRwh9ivWaT8lT9o/Z0ibC8p+7zrpiK
	JMhngF07YWFwHlxNKLYpDJjR77zPPHPFSi4kwf9HE+hddLHJGNRRRbk/ymNgA5q7J3oePDfw0Mj
	C/O+g3Q4JRo6xlmGJ/Oyta2/TsQ3U1Gbs9FE3GH86cJrX1N7PgXWox+QsyTJvvsZWHc0MFfr8cB
	tC7/q0Y/708/wNSi11GBflieeMdD93MUxAG9mxs/nhD2hMKDPHzk9U6TldfiYP+F1JVXFFveIA4
	f6uUIcAGRZH09eMkp+lqirVP2f4dLwf2kfuq3bb3Ck2RvAoZjQHTXGpHRcdcFOmHri23InSQ6bB
	GCAEuZtqCtAED0A==
X-Received: by 2002:a05:620a:3710:b0:937:1097:feb8 with SMTP id af79cd13be357-93bf5567c3fmr914191285a.24.1789977998259;
        Mon, 21 Sep 2026 01:06:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:937:1097:feb8 with SMTP id af79cd13be357-93bf5567c3fmr914187885a.24.1789977997709;
        Mon, 21 Sep 2026 01:06:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724564565sm20640413f8f.19.2026.09.21.01.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:06:36 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:06:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: nord: Add PMAU0102 and
 PMM8650AU PMIC support
Message-ID: <puwa6c57yf5iuvnxdqavuyj2bq35wpapckv6grike45faujlr7@jimfbwukqxqk>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX6pOQFpWEkqoz
 8+IWk3BgDDewMmDuGdZci+/Hljlsp+MBECDT0nMg7qMyj/akjIosqaGBOMyDLaPHDxZ4Ympq8MY
 +32CZk1XngZOQl3sYhKZYH7hVylzkLY=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0e58f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_OBMBAdlUt7QoIKPFOgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rb27Uhg0OZFcjWOtwEaE-iU-5AF7wRTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXxyGPyyu0/3uI
 aCnzu9cfDkinv7pS9FnQNn3ppt87KCrSA3e6Kex1vOTxsnEPhJUXehPGnmSpY2BokWacWKns5Bk
 qKpq1gQ2jFzMpRUzxnAAl4tq8txI7ErEzWfOE4A65VeVOnZ93PkfSvzexhJaClgXvjsMqAVRlT/
 TY7GvFK7FKzN0y/3hTNDknLLEpI+/P9UOCfFSQOtPouMMLve2h+CDor30mMI9weE0Bs3tGcOPxW
 pMR0E7fsBdD3LYrQeNi8vSjStiEFt+EsnueLMI2k9W/u4AWIaDom+uVgO3SBadyNAVdDloOCH8T
 lwnm7Zr5k45XScZ3EuUjeMi/0xaVyu1h4y1HaeE9uTgEMxtFUzLosUJDmixGeNwyx3F6nVuj8it
 U54HsCYF28MYYZCFuSucvmf0vqIpv3Z6q0/5SipltO4yBi6gftiY4Mb4EJht9U8ZU+/zQQL/6G3
 8uaxDdxHe7ouRvq+5LQ==
X-Proofpoint-ORIG-GUID: rb27Uhg0OZFcjWOtwEaE-iU-5AF7wRTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-20 16:49:18, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
> 
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
> 
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing pmm8654au ompatibles while the file is named after the part
> actually populated on the board. It provides PON with a power key,
> a RTC, and a GPIO controller. The resin is described but left disabled,
> for boards that wire it up to enable.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
