Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45C3905F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043706; cv=none; b=dUexhZWTwb7ArQmDuqOxQnMOGZVA5Ru7zbga0poA817C6+e7NfuUGqozu1bCVkEMbyx0EQ3j/hTvngrfgodvBIlYoPaAso5XjD6HHqFfwrd0P+sX7oXrhlMsRqbqjrc5j+cvTtxhx3nm+cI/1GM+t5xfowEIGsAOq39oBeeV7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043706; c=relaxed/simple;
	bh=pb2QXmWDRe1qWa3OnbTw5ih2alpi6jINWluLOqlN3Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNc4p5e1U/YarZ67Dmt/PJxiuznqnXI2iFZK/tpCq3m8IaabeHV7WCCS7EcfQHVDgfSUHhV/yREZ/DDeKQvZjo2ITUdPRMBcalw4zlxuy26uOKPT+FN9Xgl7aSFVyDglbyDaOZEDu8V5rzmd8OsXf0xLZrxVKAVwdwDWsQZQv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKqlEk2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/iSr5xY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKqlEk2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/iSr5xY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BFMf644973
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=; b=PKqlEk2FgcfVN0Xd
	a4fAFtQj0UG6gEJr2z2FrYgd4p9ZqnyMA1sAtotnsyCi5DxyAInm114J+T2bOaiH
	D58ck3WadCjeZba8B7+XC9lMybX0W2OePItQ9Ui+Vjvf7DbzSgMsns6PvIpjBEL4
	ocYAyrGn9kwqshsdocA/SHWI5JCCNztG+xOdRxTXqokmin62crPssTU/8Br9KC3c
	votDhPP4ytYX3dPTRUAOZqJA+S2HF0oCs4KZeetKmn/9NnBmYBWHOFt1Wyf6TtuQ
	caa8CsCXgnNuOgflS7FV5rbwXmZPFs+muLMY30iSLqIXKfxmg8qjgrPWABDNorgR
	Bnp0lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bq9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:01:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso30965585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043703; x=1787648503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=;
        b=h/iSr5xYwG7XlRBHmeBxMKkpL/rm72aepofvhWBtCVurfpzIZstuhc91R60Je9XJLt
         zQmcQfuazFK8W/8DVjXkZpd4n1L+ks4CWUXWPT56qBnt5Tlvfsgz9r/8IL4fIW80vbd3
         OajKrAfA5GuNcFnIWJweWMlNiezr/y9Vpjs+rWO9jVIRgTpWwzKQHXsP1HieWp6+V6Gp
         VJjTxzeMx3qZlqI24gpN0bv9VrbUQyb+6LDExQnYa6hj+TXwdSmqvTu7dzaXS4hJDIdK
         O9fo5vlG3t8cXt51BxL3OnVoWDXSrLSn0y7nMm77YXQo1y6+8InEk1bEp7T02UCKhNan
         N16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043703; x=1787648503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=;
        b=pOhB1k5Nh0og8PDPBxbVWRTDcdBBAeFhUFR1gJibaGPCT45hUx/+fi3bx0pLBCbxA8
         rvSmr21FApOU3wgiVa1bseOMPTvOKzJYCeM1soB0w+pMnzX/Gr9kXlGA3piBqAteX6/s
         zkaP9qNy8eUB/TPOnRpd3yZTRA6/Nmg77YG3Tq56nnSPU+JUsBN1ISB4daqgaYrHe4yV
         7e16gU1pawWK6dTGMExDzPaaPq8Y7borh5xqf9U4ulFMLnc760A9w18DSN1CpG+/9OVZ
         vW7jobLkfcoyN8fs0guc+tuaqUm7MfHEAXO7rV4ePq5OxtJzQhmJVYFFXHd7FfYqoZko
         pWaw==
X-Gm-Message-State: AOJu0YwwgW6T7R33R3C5yuDkKJPGPI70YWkY3GLquUmHx/1JJwZCrmDC
	6wISJSNKvl/JLATmA4oiCuOxDPPQXjHjVha6tAqnwre9SmHMzdnHIltKx3fzqkazamtpU95cRaT
	NSv9HF2LxYnBivrPMJE1m5RAjLaJlCtBbRg3Sq2H9YpYRpeojbIViMpaXx5MDwnZbmhLw
X-Gm-Gg: AR+sD12KPTh56kOJ7xR/WMxcMZexpqE/3STr/X39HjiP9l9Hdn1QdWBj+67U6OFg/AQ
	iz485ECPBkEiAhBascA3QsMdy0O7dluiXm2lln91i06RLlsIRf0GeVM6AGhiWr4rBMb6QWHfSbH
	+k0C4kwsWClHJaVXbnLIKshjdWWyWI+XgGZJKpgvVXMj2N109rIT471+X9BRLvh/A9zWpzrlUiG
	LBL4AsxLOn2Z/edtru9nv9GNHm/7GEdeIKt0m1t8SdCX2l1W9KoN1YzLabUuUk1RI7Lg+rvvB1B
	S/M6FqGTAjwHXDqn+Ng2zTcyKgWN0LSzFBxCVr1Xqcr/Bl8/GCG7nHWp+uyFcx2kj8Medy8+taY
	wBi95zEpm9rNc9L8Wct7SEyWJ
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2347611585a.0.1787043703580;
        Tue, 18 Aug 2026 02:01:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2347606585a.0.1787043703156;
        Tue, 18 Aug 2026 02:01:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1471059a12.22.2026.08.18.02.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:01:40 -0700 (PDT)
Message-ID: <ad484af6-9f38-44a5-9f01-8c8bcdb6fa0b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS PHY
 parameters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oLXfMdtH_0rn604WIS2J0R43W4nPQsVV
X-Proofpoint-ORIG-GUID: oLXfMdtH_0rn604WIS2J0R43W4nPQsVV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX1ygST/6jlq7L
 Wm9O1ZEphVnPoGgV3NF59kBDwfOdYXnmsI60YAVb/D/1IaD59mDm2jjdRYD2ociuHzvS9G1abnb
 SZiQ41POwlCQykJcXuwGCNlBQl8P5+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX4wxIOsa8/atF
 UDnQTfBl742Gec3QtfiLqa488yfq4fYDzLGLV/Z8hduJNZeoP+o5XnzsKqBGZ2vpoUQGD/smMO8
 Ytp2z+kW0iMyNppnX7rl70mXzUcr3LJ06eh5mhrjbxwWE9ryTIdRgwcGKbj5bq6XhopBInRQ9IY
 Rv7BT+4+kGJtdO/0L8fyl2lHHrDAAD10JeTQiONsaZ4zC+laDESzxsbcumSaBZXTMFxv5PVf/jx
 qGIqh92gseY2gTuG40jMR2xQB3E0w53pgp0wf5T1+QRO5pf/WEy8lwAZFDgtyW/6HK8DtrwacNC
 mg+IAPIYHvV3wDvpCXyQLb517SL3yGBwjjVteoskmgI4z/tr7cFMWuKw14X/skIvYzHIR/lRnT+
 IKyYibBZmu0kPb8H2o8MJ4IQDj1gekvR70MCJRv8RtqwX35OlJMtILCdruLYOV3nW8uGprZZnEf
 l1kaw20IO5a05j0sePg==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841f78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJdRkJQ8ho7aap0qdPwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> For the MSM8974 SS PHY instance the vendor kernels program analog
> parameters different from those used for IPQ806x.  With the IPQ806x
> values the masked write-readback of PHY_PARAM_CTRL1 fails and the lane
> runs with wrong launch amplitudes.
> 
> Add platform data for the MSM8974 compatible.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
