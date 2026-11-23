Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445210;
	b=KKQu2e9jxQI61ylPyMLVNLN4sE6M+PWzRzGr0eMgPq+igFwjSLvWO+BajcubWqG0NYgF
	 kMNCREPf/wVoCxmJkGX2YLkReKBno0McG3TqBstQ3XvP76zquP3ehI4yOIjA/yEcpKm1o
	 5gkqQ1cqmvf3w2RL4sPSmIh0A3JED5eEuun7hlDj8RlSTXsD28/Yqrwo0lefvAsOoPfQ+
	 PNGQkJs3A+xPekTCGGEVBtTmr+GEvTe6z8loybqIwR1hL9lXBneJOj3Uo8Sffr7GMyxgZ
	 iHwZXtarhSAqAaNpPT9wFH4BDAK3LSqci/NKKtdkM05D4AuL33qFXQuXBaWERDzHqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8DmTwcKc4nkoNgUdfARWYceYuacA4C6+a1Ot2Qgdux8=;
	b=ioyro712ox+pNXxKwpclXaIuR7JP5RQE7WNM9mrQxdPICJagfl1K2FUyh1iGpcl3MnjG
	 nTHWWgSaPu6e5nnMQNOc7VB/lFAiMbV2p1D6QGcmuYPrdZSWfb7DB5cVQ7m22EpEYfQX0
	 sEwl6Qraf/ufRW41KWnxV9NR1pqEm5E83X3Eync7+uTyjSCqA6TUByYaTcp/6PsH14Gan
	 Ucu23Cte9IYjOMykjFsXFQsdNaKfFOlM/FJ416Zf5o7IlV2/eF4GFWtPkrEXe3EGTEFgG
	 w440PszIzNyyTh1QZnZpG8g4pC28atjS2ycw1ZLnBBNTtlTRpqMKZ9VHkl/XN/H+F4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHqS1AOW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeeJAOCC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B3606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHqS1AOW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeeJAOCC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEnE4030401
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DmTwcKc4nkoNgUdfARWYceYuacA4C6+a1Ot2Qgdux8=; b=JHqS1AOW/M7g4kLz
	r9LtzAvd+WvjFL7+DOuS2KAtcj3wPGPY+DU+DEv5Hqd3QE0ee9vc7wspFJSMrMs+
	atCbCfnNLNygn6DEsfl5j99/8lFMdK+WSN4z9a/LN6f4GdK/1JsNzIJrlFIs+O0k
	JmzXF9FWQHFTn5OGNofiF+61ok2AyShz3JuV6PbsyaEOdi5hp6uE+IgckxZbMxVb
	HTh4GuJNHv+ZueCBcGqrpCzTc/YA96pK0X9HYoLZ622bFPEYXgelNz3a4b9qKg0O
	nCdICwbKHdcbW1E09DTIFwDOU6Jo5E68DcymSL0C1owZSq1CcPkKhUp/8+uB+vcL
	cgVhpg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj31g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso154126137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445208; x=1796050008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DmTwcKc4nkoNgUdfARWYceYuacA4C6+a1Ot2Qgdux8=;
        b=TeeJAOCCuqkUkApD/YFx3zwO7h5fr9i191kWq++dRZmjDXs+VA7FjYxHfbrUpJdlCW
         4a/RfLxQj4omqLbyXY9wFpXshxI15HsLoHAP4VtWKmqSfCW3SpsokK/FJCjrXgslfQ3c
         48moujLLi1hq/WQrRNs80aWSNy0D4jXaqq0o9qZ+vku/7OaQty1mCIuJ0SKy3DNwUFJj
         PlNrjRCzrM5ynIZgPV8TihI5O7TQOc0FdIXCmoi93VjFCxWEUuuBCLQKOqrIxnVDpfYP
         GWKorzQ3lr52aykzKC3sc/4nYraZ5GUK8Dxg19kLEJvkpFXWNzGli1jYMf06I31QPmQB
         l7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445208; x=1796050008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DmTwcKc4nkoNgUdfARWYceYuacA4C6+a1Ot2Qgdux8=;
        b=uDhvJd2sZej4vgGqg4jz3a0w9v4VKEQcaJYmHNvMX5wYPKhRx66/5Uh1GPhpK8Qa8w
         70sqomNMZIsZPZwTDVzuLgcfZOti7fHzpRqN/Dl+MTQ9WXxIMmmZ0rqiij2aJ5lEtMdP
         9nSpWVuZvvnGx+u9JpDLrmOxA6UkCj0rd6MtrsCXhFozne2AW2DduQdeFfBDJ/aWH8yy
         nedS7Ecgzw2s7l93i8DSdotYGNPrdftti26Dy6zUF3XeFxQKZoQSg0VQ9mIzkGj4DBUg
         kEudKyWRuVQSwSH5cSPR3PLma6WU2yDDeCkwzyIow609Lb+B5W/mKJv71gKAdb2IydBQ
         LwMQ==
X-Gm-Message-State: APuU4Z+vc5yxRpWiHvGpiqz5xvRCf5PsSlLTUXAAvO6EKio2XUl+Lvjv
	MUVuTdTE0diA8kjPbLIXDnx7NdwIc73VDMGxoJbXwcQEMRKN3rdXhrj3xfkpsnIz+hpw6UfalmD
	M5w+5yfnxUZFqAJqQsROMInGo++JkF45YoHDoP1gIWfuK90aWU+HTXc7kd/fvxtUT064W1wuitB
	Su
X-Gm-Gg: AZFdTZcrzWwQejjtCxeVWrb/dWcmn1ReZ7QsAn3DGeQZCbKWDF6gxwYh7o1irycrj0R
	WpcVj8k3xpJqLgZ5koQd32lEKIjhhI/KCu6QraTATj+4KbnLy2P1QHxDohTetRqJF59tY8siZKK
	Ja76CGr3oqcv2KxNoqtcqnyt9LxC00AeQRQCEjmt1Ha8HndOYxtB/Q3d6wd7CGDnbyrxgc4RUxr
	d5Rt+1ntHJ1K8+C88cCT7keRL0dwB8Mz35ip9/p9VqMuOdkJNVpS6C//dBYZN5ZFi7APPPBvPZ0
	oXKL0aWkI9lyQM4J2+yI+Ggy31KbHIYvxHc068uPRoNxgBJCgNl6+QPvfC5stJrmO+33z08tyJg
	/U7XMN7IaWWnC0q6hjpU+PIMMIT8wOa2+zBjl9oN6YRiCu8Ic0W1L5jgNb2jCB7/GsooIdXg=
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6775605e0c.1.1795445207970;
        Mon, 23 Nov 2026 06:46:47 -0800 (PST)
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6775575e0c.1.1795445207532;
        Mon, 23 Nov 2026 06:46:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5341006a12.33.2026.11.23.06.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:46:46 -0800 (PST)
Message-ID: <ff6aa697-c57d-428e-9770-e16734f4fd96@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:46:45 +0100
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
Subject: Re: [PATCH v2 2/2] interconnect: qcom: Consistently handle MSM8953,
 MSM8976 and others
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-interconnect-v2-0-99b282e87d40@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-interconnect-v2-2-99b282e87d40@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-interconnect-v2-2-99b282e87d40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0451d8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dPZdRYQqs3Y8WAFAmEEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: k-h6vP_0pyrDt0DseryzK3CwQ7B3ec_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXyr+3Faudsmj/
 lOXwvL1bP2xB2Qt9nhEKPKra1BEU1C/oSc5h8PjO5ABzrQRA/0udbAt/fSRMguLNskxcErbNWS3
 52xmx2h8tcKWrhc80tsIqcvK2JeGe1HqXZKdkpCbk1/q7xHayqJ9HjKmPLa6brD09MknHDTN/b5
 OkaYALff7hfRRZIvyr6i4pggvuuhT76gBok+B6y/aEFyuWlnlbDBzamfWTjknp7jNVPBBHyr+Hw
 cWBJYlFYMGWj9z9e7VNrYCT+bfa/PMukScpcuArzM18zhDXCCvOObu6lUajq7kIoIFv5NinXX0K
 MfuJ45RpCDO/VuW/BDraL0F7HQ/BbCUI/JEGmq805VY/6QAOrhhZDmItlTM227WNkuIHYCOMEod
 H0EEigZyKnSzCnSxCjDQNODnTHbLK3INW1NjDuSTJTRL5jMk9a6f5NtkTzBn48Uof0gDab3liiE
 a/JsmY7vAxyr4EuTANQ==
X-Proofpoint-GUID: k-h6vP_0pyrDt0DseryzK3CwQ7B3ec_P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX5jwKmRg2Zeb5
 4HTGM0q0L6p7X7/jg5MKUmVnJBXzGUE0p95oP4g0oUHw1eWlHWyyuN/dsfuU8vSUDY28zKak17b
 pdb++QshajezUtDAOwqGICjefBrNwR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:56 AM, Krzysztof Kozlowski wrote:
> Other critical drivers, like clock and pin controllers, for Qualcomm
> MSM8953, MSM8976, QCS404 and SDX75 are allowed for 32-bit ARM builds, so
> interconnect drivers should follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
