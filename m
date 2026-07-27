Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8513E451B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153624; cv=none; b=FEpoY5+NOKWEXjCuBoNSZKxaHGVuVnGyVTBEk6g0AwLQvp/MIukQJqTOKbVmdkISakfkqOoR9ceJfrtn4WDjwPbR7s/tHr1xGyJGOghtAxUsmsdSWR50B4UhBCf386ViLxAmn+UgHx43NJFrA7fAcYWU6STUfdCWv4dV5XBc6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153624; c=relaxed/simple;
	bh=lOVdU5TKctRITdVSN+ni99smcI1i+NqPixGeeyUCvOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUGCxSYQPT8D/w/K+M+OfNwVJPaLo7omgdXGREcQnRVa6p6o141muQzAP2lKrqwTVVf1tJCKQTDpq9boLUs278+/HNzy4lmUis5XKpKdxpHC5KGEmTsUPPJU47e4zqOLRYfE2NmXmENiQ5WALyVCYMn5T5FGRFxoycQnE14xF28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOJbsL5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY9oEJBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOJbsL5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY9oEJBN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALwVx391878
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guc8AKyX2zp5PQRp+lWNuj9VnhVEu7Dt3w0SYEjW4UQ=; b=SOJbsL5c9F4C+8yN
	EqhrGhDLy3LC/Sbp9wKaJVAY1JLynRgdWBG0treGa6eQzgrr+FPs2MvfbmfCGej1
	jNEXuWEZOrUrHoguT/a55pqUOm9QF4a2UCIUGva/SIN1WasKwftgcbnn7r0cXBxZ
	4mTsrAbuvHAwyXY+c0mDA7pgL8kPtxaGZK2SWmfShEOwmwcVbQx4Jz0pYZFZR5jd
	Y+YwW2E1SWsHW2E7PH8WJF7BRX4SJuwbmgdmZnXTkAjiomeLQffgT98ndpDqp+Mc
	UFdmP7/THn5hEPRylKGOOljovozwZNPxZEBtgW6sIE4R9k4tsKXzzJdl/st9e16c
	diXNyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9whtp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:00:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so4623081cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785153622; x=1785758422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guc8AKyX2zp5PQRp+lWNuj9VnhVEu7Dt3w0SYEjW4UQ=;
        b=YY9oEJBNMeZBHW8kPie4ep8SvPCUgc8gQs8vmLRAXRCDsvYbMqcJWfyRbEbne3/K1f
         1gQ0mijOdUOTC/KpxZAC+u9Bjs/OwX/8ltOWuXQzjl87PXYzdOc5o7jGMA4NV4+/8ref
         67yIsCCbpHB2IPsYIJD6exA5G9Q+/NFM5EcaVYC4WSw+RSEtbI2/MMKMp6dVTYvssXX/
         QbYfU5Rv7Sal/7L0E3tahLWVEktAv90zC1MBWEd+4p1NJIh2VnxkYpQYVeanDvQ6pKPV
         +D82GE0CYGvTZQNhGvzbiT9pBKES5CQPNl0X+3YQC13yatdpd6YMkDyz9+3AJwNCyM8I
         zGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785153622; x=1785758422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guc8AKyX2zp5PQRp+lWNuj9VnhVEu7Dt3w0SYEjW4UQ=;
        b=rSgbrXksP8VJfufefNZq6qp4GJap4RZNXGxRblRdgwARp66UtfQAw2sHbXzFJ/zHXZ
         KKYxuW5rZSy2A/h+hX1ikyixi+nQ/fkvVfxxWzFs7Cm3JB64z7pJ6zU2LxpaRIes/kNc
         HZQzoeFfgBC7O/XZ+utzSB3MIhCsOg1Yc9+PrfWHmrBfWvqfs4KGWcUEpzUcExh7SYTH
         vJzdi21bjPQqkPkrnifwqTYJLKFjd4AzS0YsZl5Jh3V/ZXuxPaIzrj3/VYBsHg+uBri4
         ECVpV+cod5rMbOoM+KoDdHwhKkJOoGLzdWFb/L5D6/x5CDg+6xgA7HdAPZ2mGM/BqboG
         +3DQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRAamksw6V2lf4TR6KXzn1OL5HcxtUJXy6U4QEOticxgM/EF+KUg+ZlDxIn2Aqh0UFTmO7E5MINYM8lpSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yytzxib2TqYzg5FoKs2Tc4y3TN7neupL/T5VGJ4bACRiGry4jqe
	OLT5K8CJw4tc0gX0QYcHPY68L4Ma84ocu0RV1soztBiRc2g71LgapX7gYVwt6/iHPGp0RTgBiCl
	caDC4Ou57egWp0M8uXRtLRN4ss6ppRDxFA9IxKfM8CBdm2BkTFfXWYc7Bf6g9j/28HJrR
X-Gm-Gg: AR+sD13eKHIoCC82RVJbLUYbvUQBeF948qa+jTh7j01AavsHV0nFWIaVPbvicfWky9A
	N8Reqz0x7lN96OiPUyQpiBebVm2vr8f08WP4rn4wEy1q2UO92mXGo/+WXT72Gm3+eInMkNl8LEZ
	G/d8SiAnJMJGg4EQMYTruy1zcJWDEj7dRKJAeUCiwb766lUNmBikks2RVQ03plZBf3oaEBQP5+d
	3aAIFQS9rpz9gjg0iV++JmKwXe18SdV+POFYMqHwxLFt3cjuYSy8Ef5IgT0W/QiySw3tuUhh31J
	+5DmhErVwkVynUWXfpBkvGkvaOhYMyzlf5Cdkx6FNbjTdfND7cSD7atpf6BooAaTy5JA2AYjh+J
	pImCAf2UJfseCg99CXNW/itLj
X-Received: by 2002:a05:622a:7914:20b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-529a8884684mr49188211cf.10.1785153621482;
        Mon, 27 Jul 2026 05:00:21 -0700 (PDT)
X-Received: by 2002:a05:622a:7914:20b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-529a8884684mr49187691cf.10.1785153620854;
        Mon, 27 Jul 2026 05:00:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm628552966b.52.2026.07.27.05.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:00:19 -0700 (PDT)
Message-ID: <bc71b5d4-7ea4-4c84-9cf4-b26827a3f4d9@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 14:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC and
 QCOM_MPM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNyBTYWx0ZWRfX/Vwk7zKD4boO
 mFxVQhpVQVCzfAQzlOK4cEZRmoRpMl1Q0UeWGuYGJCDIMD2jYLa8Zql9yLZ8zvAPXN5LxlzCpKM
 0XhZOuH/1dUgroGVCjArNet9lQGS4ffWCwWNTbYr0uhgPuj9Ai61f47KJa15H3bsLPUpIUxVVBD
 tHKJB0K6YrBEeOzonoTP2MqenSUTSjfw98j5XEIJYK1H/VvoQv4mlf5THv/McD1hQUxDBW5sGRV
 hWoYUVsisD4UTVZ57nAQI/l0a1ru5/HH+26vMymu3l7+g4J9lgJJY6vsMM9O2qaq5roy+XHBb//
 5x4FYcIHV4Dng88VmdHe0iS42BwPmtu6wGhsctTW7Em4ltIj+blSJT+naFcP2a4sLDTF4f4/8Hg
 T+9zb3wk4IFAfBmu3YgCsdPVlmDGyHJID/gOuFuC3OualwyB3H7jSwh5iLEkWuQUuENqRUy/fnJ
 wB7Bp3L538YYLNc9a7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNyBTYWx0ZWRfX5jH4HPLCLsvm
 Ru6KAQk7cCkbfjmpflhq3VfXXXgPWwrN8iDDHD6YQ4X8mhIBFMW3613+BWR29V42J/LVCMckPXd
 A9beRftavsMUb+sQAUaPvXxNkFcojJk=
X-Proofpoint-ORIG-GUID: VBzHV514GstRUDyzSu9FLGfmQ-r5FHYH
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a674856 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2MkTBfida5u9ap4BuHMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VBzHV514GstRUDyzSu9FLGfmQ-r5FHYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270117

On 7/27/26 1:44 PM, Krzysztof Kozlowski wrote:
> QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
> should be compile-testable.  QCOM_MPM is used only on ARM64 SoCs, thus
> there is no point in proposing this option for 32-bit Qualcomm platforms
> making kernel configurators life easier.

This is only because no one wired it up, almost/all 32-bit SoCs
have one too

Konrad
