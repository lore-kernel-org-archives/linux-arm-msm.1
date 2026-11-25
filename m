Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604763;
	b=E+urSGmwFaCMlaPjBmP768fZh2qDLYG0WYqR+nyWsbzWj3XroUdVriGEAlU077w7XSb/
	 12NEtm6cSh2YDvBymgtQyY8e3Coww6IgoDK1BfiMz1sMh7Pwsv1krRhzfjnwXbPVdNnDk
	 eeK8tpfDL782grwZ4ci7ZxF1UTyxouJUXXOD+fq11unVmKpYEuTyzoXTR9DP4R/G4XEFu
	 THLinc8SFd2+pDIYaEz1EkwfMdg174fxDFM02vQWIjQp+DXfHoFdt7C5Y8L9y4WLvSP7s
	 NuFFJOvZa+2gaENpZ7V8v3qfqzmAlgyRVy0fFaeorwTBb31va/3wHQ6cQCo7169eggQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
	b=ID5umWh/8m3pce0ANo+LwMjGZkjsoN56LpO/7kH/TfuKTs1fT90j8F0Qb0EhQcvZaUjT
	 oP8EPLpIB7sed+X0vhAXveN06mNAsEY3BJZqNcUBDG0RxqJZ2tNvV8EsCJkPnotEgf2Lv
	 gRTiAO21DhBwURq58kq/VF0GXpR79W0LCKgjSgwf7dsAnTuvJMMMpGevcqHflP5yM7L79
	 CKUd0HCqkE19uJ5BqOqezf3Zra8947B30mdGrmMEmdm62INZ1ZyRxTYn+J0/Y5OOEqyfd
	 o66PrtnpvOQqnuFVpy7xrmbSrGgUfnsLQB60sSuQWywPYoZqHfSPMT1EHXrFhwulSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ekeko/cj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216B2606A337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216B2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekeko/cj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APAdUJV234702
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=; b=ekeko/cjanjWY19a
	XvNMHTsNGqGf995L7X604mFLYvlVA/6sOhOJ6mCN2wRzqwx8e+z5aIvZ3LopHqKR
	9+uzmpWVrYG7k/EccXbHcTzm2LMNNggptlCn2Xo0ldbAyHLfJhL2UIYPY0kBjrqz
	HkuENHlhAmEtmb0Qb/x8bHwFzOb7CRqnoj0WFuBdbCXby4ZQpPazRrA2fNl5H4V3
	0A/UZmAQI6NV22TvqyHbupTPu5Cnx0fPEN08wvL/AyzDb2cEsRtdhxA90yzA7nVw
	IoAoPCqrSwpOEXT5h5rwgYCWFEJKn9rhfdiXbLDzg+5bUeJP91WBV9RVZnNdA345
	sdJuMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcgnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:06:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so985175585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604760; x=1796209560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=QHA22EdulviFb3Tnn6AKaTFLWIhSQhxhgaRmYTBygRolOpjZ7bkjOyvsQFbPSxRGae
         CB6/LT1u1OaX0xymbTYLCRtXkj63Ey0jvaYB5ryrju0vEVm0hub8mKOV/4iMEaSYgqY7
         VYJGi9fnQzzxV6AZ83rXBjM+1RhdSgpTqPRgvAMeFQE1anguB/pc0sMW6C7mKTgEMsRY
         O6ajmHa52LtQyvqcW5R3a1i8g0PytGaI+qb1lOgdQ5eR/MF9+hJnYCmUfmRH6gojYJ1H
         bcdgQmuq5n3gm0plvbfzyT7BMNKqS0UpT5/PkSJr/bWTMqtoYiVv2QwUvFLjN3LGGhr0
         4gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604760; x=1796209560;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=TMOloUanMTVeI+4GShl1G0WDcrKs5RAgOkEEeRcgrlh6qPhJPBnEUqywa9wxjWYucq
         Ompc5q2Ro3jye9pfeIAT8PHIna+8vUkjYsIzLF6H/2KOqaFKQ0AzcMgJQ82f6wYqmr6T
         yRSN7r2AoNa/XdIZZI0ZcUcz1J4+FGzg/Y5cha20/4z3FTENkuTLsggR2+pZ/XQDRXW2
         hRPN+RGM3IkfrgWUgSSDdlzzmGumeiJ8wTfzk/kUc3hqO+TmAwYACB9Oc13ol0hGwxUp
         Vh5HN8oIog/hmStnIqj2BFy5DFpVHzX9p4bvS7dzkIF+sst7sV0P1EKj+D4eHXo34Z86
         +s1Q==
X-Forwarded-Encrypted: i=1; AL+hErFO2OsbVkgU12Hw4fYHUohuW9D8eqfVAtOx/ighqj6NfMydMivNPpYL/J4Mgelx09yvTy2eOcrOZVAvdWPI@vger.kernel.org
X-Gm-Message-State: APuU4Z/jSKvybJeUxIqW5J+sI2bmPoCCHObqtN5MjNaIPOkEwB6heqi/
	Z0RxL1bEAE42ziYrzOn/YkW4p8wFp6xqKHudi5MYAJnBa/Byu6wlu+uPgryryf99mu/TeEQE8Dz
	0qRNPIUOpZY+pYaeYT99N5L/EqCf9OWRvy2T8tL12MBaLWaTfZwG9U9nMqbdDtRcp8KahxrpZ+m
	28
X-Gm-Gg: AZFdTZcky7ZGyGuUPyVqXNYPGkkjD/tG15qpoghaC2e4OkHFVcITNmQtqhcBPltIacR
	jiLyR1mXzN10h4tWfYtAa9O98WCjLmi8PP7e9Lc+5hWxPycYx6/HSPr5exNkTvNj6MGzGW1E/5C
	6bIQp/crrngPjvA+Gr2gMqVxiPOHQCymuZxuSVQs19f4U28EEz5gM4JOhaZHczAnu75Xs4uQQBE
	b7Tf0Y7/wGMiqAOsSfIawn7NSuM04UiUmVjIO7HUvBSiBBHp0eZZbBPK0MT9HYgPp3J06UvUI9g
	NE/MQyw8l6C1ipRzCY16XNErF7ppMfXDmRYXhr/FLkSF/i39o6qJxSLF/4nJFdZ/tcxqrWSv5kn
	wlrD2HVSiraIbz82CXAIvYUpNNcwxjQWHZEaQVxYd9vNFMM8D7x5/fPceWC+BAR1/1SOgx+MYx+
	sRXf90csFRYXGkm4L2D3RHiVVazTLccPquFFlC3d8=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260298585a.36.1795604760343;
        Wed, 25 Nov 2026 03:06:00 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260293185a.36.1795604759812;
        Wed, 25 Nov 2026 03:05:59 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm273412905e9.3.2026.11.25.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:05:58 -0800 (PST)
Message-ID: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:05:55 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX9d9QMNWB98bU
 LY+9uJU7irx4oFJ4MLMjbcHVMj6UCTqdDao+2/hQsh4tafp1/eNjRw7aWiybXqS+umR8mutOuJK
 GyKFWwAmDePdrlyjFB6uCSitizAfb+JWFr5qCRraDFPpxCS8GrjFbeRvnB5Y17ADmepoL0v1bmo
 rqXSI8c7QBdISP0M639Yl3VK/SX7yPjCFrIXSeU5iBCNhqkTxx6NiV7oIMgEuPVuSt707h+sBxc
 nJRzZqCDF7k8iacqQYdL5t+Nv7Q5kmxESC6kJaCW9VWa7baPFaM5SIWZZxc10LPe78rPwcIEdQw
 MgUZ1XO3vmZD4TbWWCPV8u4Kp2Fwzavcy51IXbtK69gOD16ijJS+isgz323cDCCLJjE4C6LpXrC
 ZvSFOBwYci4x7bnEVmR98Mrjss8zGXvgL4AtI+Em8OYl+D5bbp4wnb7hWD4yIhIBjw1f7sD/pMW
 bC7ZRFB25cyCQt9qXZg==
X-Proofpoint-GUID: IMbmkFfzDMfUu7XKmk824vimlTwgeYho
X-Proofpoint-ORIG-GUID: IMbmkFfzDMfUu7XKmk824vimlTwgeYho
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06c11a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KmKYLJ3ZcJ8E6AZ2J58A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX4tlLIIDCmR7U
 rsvK0bVE2SH084lgYknlqsc920sZ81m4cIcdiqaiSSvQA/7l/vP97fBFoZ5x7mQQF1HGxUUwEn+
 eoYWKbTR9EBiu3nptLjIZSSknIGDyPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 25/11/2026 12:03, Konrad Dybcio wrote:
>>
>> True, not ABI in meaning something agreed between DTS and driver, but
>> the values are used by bootloader, DTS and the driver, so I would just
>> leave them as is. I rather care about not growing this for newer platforms.
> 
> Right, but they are compared against a hardware readout of a
> well-defined value, not against made-up indices (i.e. these are
> not bindings). I really don't like this ending up with 2 files
> doing the same thing.

Not two files doing the same, but one for legacy and one for new.

OK, let's drop the bindings, but then what do you put into the drivers?
Hard-coded values duplicating another hard-coded values from DTS header?

Best regards,
Krzysztof
