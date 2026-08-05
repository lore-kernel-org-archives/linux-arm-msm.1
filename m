Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80D3D9695
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915784; cv=none; b=jhJWOZTCPGvRuHb+GQHUqY0k7QouXPHXWLrMDHVCU13sksM4rOLjtc+8NfmL4R8fGhfVPx9cMFadBtWvt46HuCMHAf9UH4Na9QfZA9ozeuc5eY/qUwk6Mh+cz+9yqfaTGxJ2yvgqXEOlg5wjxTwHnpvpPvSKEwt6oP++JL3Di38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915784; c=relaxed/simple;
	bh=amTNGb+mD7w8vSU5rAtsxeWQhArbmrSWkamf543I0L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJDpU8rLnlFWgX7nkw8uhPsBvqHrvsuGzJlH6H7QLFAu1RQ38jWgGpERrnVpX3xbp/MZ76BLJzl9v9/3mKZtCpCj083werJawbsbylZFdbeWiUBh+hf4kQmO3eYF1to8V9dM1RYwOG9LKKPNKGtYQQaDaAOitT/LA9CmPCN3piw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtxJB+4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfTmz4D4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtxJB+4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfTmz4D4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lGl62261442
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 07:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=; b=BtxJB+4TOr4qZNk+
	CLWE13GzdxT7uSh68CqbagmhJ/N2v8P1YLogcUZ7q9QPTVszOvpvb7nsdsdPCT1W
	+CIYxFyi5R/My+tIKqe0LqeeHnuUMROcMyPBgopSBUJ9WiKl1EH7P0UB1hQnbLMI
	MuSF9vDSUPhUuAfXprJY3wz3F4XuseABZ0tHeJCmSgOA9AzRfQxWNdS/otT+KCeM
	jtLCgsU5RLJVuP/a5TZxGVwcWKZ3t0Voq9tbEjciMr3yqEo8/9/QjbNKA5ShI+cO
	h4L9CMiL8UElKk8Fgc2ogM6/sYeOiAbk3hM3OKVrI8BWEWw0fX0N5BKGdK7Pho1E
	3BSeUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug65ckvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 07:43:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so985017a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785915781; x=1786520581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=;
        b=NfTmz4D4rVgtaqpb6+a77XpczcC6L6REdZWliEYsjjBAjPsiDf3R1P1iNadKicSCIR
         kH9vmku/gF4xCyXTVmDC41JUaphFce/1UWHKClokqWs7Ub6440CkIOZrNm5HaX/9uqdV
         Zl5ldDCcanLxPi38yG9MabVS8AcNaHl8ARNlxPyb/NtyQg/d895sb2WziZ9XTPc8HgyV
         5KwsrzR/2qbwdGDdpccrlqKOHzM4cdrj3qQB5RmuhbBwWATgLA2WSCg4KVBlcjaZ5sHK
         vhOJifQfytpc9SGSnYzTE6WfKknGCfcysFoLG34EJHTfLsJAt0ou5ZOiWnrNIKt+9Tyr
         tFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785915781; x=1786520581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=;
        b=oTShTT0L4/0yMNFCNY1lYZpjPoOBZ4++jMugk/lKmnPysvkP5DPdgZDLy8e2l7GgUw
         oj0wqfS9tTcwjIqIyYGGeuKsK5GmiLEysrTZuDa0qS3X7FShT6JfVi1aiA7LiHoFOn/t
         EX3od8z51VWQGfu8AypH/KCSZ/3/s6VdvDqN9RmceGlOoqHKjxLoO0m+J4tFT5vwg323
         zwKltb/Xj26wwDfV0ROLyhIulz0TN6luTcRKSnfDyuMY2PKEReyg88OjyyfBXdgPOSmI
         c8qzngrvOTUbJy9M7qkWZ+Eb9zjDY1H1F8qHWOZOU3RBvrCkpYQMAEMu9uoNGLerY1Af
         z4sQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQgjNumLKl606khcZCOJJaeaXMJ3MqKudRsq0uuM//qUn9lspsrmPzH8PCX/ifzkGWPv1UrcRoaqo8XXU2@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3SdfyziCqm0lFftebIPRl/asWJXna7ODJw919ZuE08D/qcjr
	gSD9mAbURtUTkHpz80m6CpGFx6yGIIRecS6yN8s/EshNUPWbO3s6HBsHJquWVxpQpgLpxCyn+Tv
	v7MEQqD1rvtIHIEX+UHhgYpVCaiHv6Jrh+wwq4YWfQFCA5nQuFLkKCPlxcP/IxP5IH8z5
X-Gm-Gg: AR+sD11oOslFVWuuEer2QpzGYdaQ4iBEIIDoQh7Tnjkq+eAONU4F0g+phKo3q9NeibT
	2/ri+0AScY1J79rrb9ol70cfb8WKft53wex3JFAGoO208a3Lrta2BGZTpzQj8foJai21S/+0e9M
	IeB2AIbcx8V5AKOBRuHGYOIn/hptR0HM+xhC6otnhALNrRYRGNBiqvirKohkL54d8dDn3U/gC5i
	G/NJgY93cfZZ6nIrj351WddSFuj1zUSFk4AnTdpWp7IrmF4oSkl5dlUEJXq66SHcqNs9D6Pghsh
	P5yGYYEzuqXxo9ORaLMhhii+NsQ68IDno6slQr+NVhUxZ3qaBu/1Om6V0KbQn0I16ViSbUy+iLy
	HEjNBx1A+so5CAKf+7oMgOQwopY8uRK2+Zf0fAS2tiuqtFgzEntGbTtr92QqxcewSe+1s
X-Received: by 2002:a17:90b:1fc8:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3903c6295a6mr5707867a91.21.1785915781026;
        Wed, 05 Aug 2026 00:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3903c6295a6mr5707814a91.21.1785915780240;
        Wed, 05 Aug 2026 00:43:00 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d1ad274sm1272999a91.0.2026.08.05.00.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:42:58 -0700 (PDT)
Message-ID: <ac93dc2a-9149-4ddb-a7f9-56010cb9e15c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 13:12:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for
 non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
 <20260805-independent-dashing-urchin-0b9776@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260805-independent-dashing-urchin-0b9776@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QPYo7XK4_zzWSur9FqFG4sxIbg1_tTZg
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a72e986 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Soz1QWBkztWbeeSyrHYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1OSBTYWx0ZWRfX8xZRxK8rYcAL
 PQ4g9wxHdNCb6JUi9QxZVoSKfO31+afu4JcdgnA6sHB7U89fOqYYp+5JZ4lc/xpm3jxEYzmwqPS
 VCAZN7LJCutw7RE2cK7aOMSqBgZo3fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1OSBTYWx0ZWRfXy0e0zvYU9QK0
 cK+kNwbYBnjglOJnCDwYAy6wcReU7J1fV8i6gRXgUK+7UdCoPspywopCgWLzyulRW7FglUwg4AY
 TuNC74blIJkH9NqU21FzrEmqeT/2phCFWh5j2lHY4L5DFm0upP7IU2JhmRRhyVPnerSdo+9oN4Z
 CeNsQ4KlXLTdgVyysC6lwBkx/cZBcIAolvvhtRDn42aIHhq8ND1wlOj406bUFajWEhXV/uknIsD
 ddI3IGfAjL6Tdndjl9uNX6KpLpfCTMyvi8A+QoqvzpT4QQLpfR3WGko8DPRPxE3qVQXbNfSYLs2
 d8qNpCjvJQwX1QkImV2yUTBJMPYoQmFvDc5lZn8xUIBybHT8Sn94hnro7reJK5CHu9WFMkDzpEz
 3xnlPn/ipjWPBlo5/q5br0yNbXL+4mrC5MmRoFsC56zUUzPJtg1P1zMtjilWiW/XsofjgtPX++w
 xO/kRIc8Jwbn5dBqISw==
X-Proofpoint-GUID: QPYo7XK4_zzWSur9FqFG4sxIbg1_tTZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050059



On 8/5/2026 1:05 PM, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 09:43:04AM +0530, Krishna Kurapati wrote:
>> Glymur DRD capable controllers have HS Phy interrupt. Fix the binding to
>> indicate the same.
> 
> HS phy irq is listed in the existing if:then: block, so what do you
> exactly fix?
> 
Hi Krzysztof,

  In non-MP SS capable controllers, the HS Phy IRQ is missing from DT. 
Also the HS only controller has the dp/dm interrupts swapped up. So 
wanted to fix the binding to indicate that the 4 non-MP controllers do 
have dwc_usb3/ pwr_event/ dp/ dm/ hs irq all of them.

Regards,
Krishna,
