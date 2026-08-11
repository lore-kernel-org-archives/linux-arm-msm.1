Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010483BCD15
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464710; cv=none; b=FNWvYm++ZNnu40n8jWqX26WiMA/piRalFIdJGxEpGKZg/n5pZ58c8jllQVa33TiMj0qq3D07Fc3hhC1Kevt/spMWlouCRtkRJa6XDdS2V1BIEPxlyShubdSF/DKrtL2i3Q7Ntp+HwXpLnfPGu0IGktzcmRn+6EKfvpjcGP+YlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464710; c=relaxed/simple;
	bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3U0qpxSCGvqlbziRSHMSHBwvKuIgz/NFs8N0+uUovaEC1m/t6P/ohbatJa81awdINwS/eJ7S/jOd8nx0lsa+VMkUzq9snllE18dIaQk/hm921CtShD98naPYmypsTAyL9gYaZrBHuADltkZnMwpb03j6UqZoZgp10+valIduSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pS1sroGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp07ETUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pS1sroGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp07ETUr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWjPB1090649
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=; b=pS1sroGRAGeP5HbR
	i7kfywaCoDaR2Ske/SRun7p4f1bKQ+1fqjNHIsYoW34cY9dRR1Swu1siKIgIEH+b
	OB6gBQHCA+E68EM3O0GFv260qUPdQmtD0r7FNfEbaITaqoKujLovxiFhSFENqwTa
	WY92sG13S48n5LdJsBkpYl7GfNHQVB/J9onfWco/Am88LHbSNH8PonhgylsH1enY
	Rh0xLIYUGejhqEV+D/TppmrLT35VVA8Q1bCgbCcW+qPfFqDXWJBLLmdbjLVTu9Qv
	wMjZl0fy8JI400CBzu4w0WycTS48MHLFOw2p3Yyl6zMUWr3nZDDs+DMj6pvJg4sp
	stnEDQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049ervm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:11:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso54110b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786464707; x=1787069507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
        b=Fp07ETUrIigNxmgnAt5cT4hkPs24lR4XyFh5l238R42VUZ8G23vXyGeU3e+nIW+DMg
         iP3/JsP+eUaBIr4aKyqcNsi0gSwpUeytTeHp+H3JhPXbGUPMF/xSD1aYacDzPsCoeIyW
         HkPoKmJehosx+mrZM97UgPj17VzfM+16gI/w69JfC7Tfy4TVzDtavRcZ0HdVXZlmSQsn
         wTOKCFwPj5ZkfjblHrQlNImj3gEBII+MoTegBmQTc+AYsiGmIzfGLbxsFZYZex0wp0XI
         KJ/vcNEXlP4ymfzCZv40sKAzcmxgS6O+cKOc9iwb+YEcYBa5WLXBVOhX2U2Nwx3tVh+P
         Usaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464707; x=1787069507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHYqSNif0RYDXMYpUZy4sKqIv2xpJlOO4HEM52ZVTJs=;
        b=h09yzccMNgcmLf+5EWxK663Af4YoSzkLgDTQcAfu+a7GaEHfmAgenHT8JrRcluaw3n
         3bmQfoU9g8MAsTSZC1MpnIQgJS30CFtrYXNfQedjA61F/CVY8tzejYWdEPAyDgERJxhL
         DKPpM1oyS1u2FCUuAaWMae2RqrRl+K/uACwcLJswyuKi6ae/UAEQhkOCVGBGCxeOBrO2
         RitST1EWc5yukUarOBgG+XhEKngGsguDHDigULKiWIHhAtL9f36UoVPL7e36jky3eIBu
         Ik0cReCq+FelBH5sztPHq1HKiodume5upagAJ1YhA/ldNodweszuSBDvbY4S9TIWIurf
         nztA==
X-Gm-Message-State: AOJu0Yx9KQS4YME4A6eY6N29q3Yy0JDkYKktY6zDHTVtn2foWaPViuGm
	OtW4eqdppuZht+TnorBboMLTds4h+8ZXjJ3i51+rlwzn6MclxNTe4heVawbz20qJB5VdRYcA3rC
	j4SoM7EGVNYMQM6wfM9F5Q+iv9O67baah/CMJbprgdA5XRTK4udWboJNRJ3IRWdyc4DaB
X-Gm-Gg: AR+sD13bhUlc+wszWD8ayUE85rQiLxQ0+YjXCwnNzt0+QITYUp9lU6C97LlvTwpfD5t
	q43Glv4SqwCnqOy7MUZNMTzsPqRs0NKRrgvq/8OUi8iDIcF4CW988l2F64qqezX1wOlUV3xyzyA
	dWLikPPDJDFHkMN9GKZcAfZOl6XmAoXA2SGExbVfqqcyj3d0XlwU4SwEKh0j/5N+MWFGKAtQ664
	qp4mUq1J2WcgZyFKqZbZ3Z/cu/xHcKh+R4FEvPbGQCVO9UJb4J09jAjGbkcCo85/eJl2WdBykjf
	Vt1rJ6M3fNr4Y5vDn3tZcFlyD5zpFQxUB7U83YNZZ104sohjJDcM1jyrStqxRani6pxjSpgXkEO
	cxph42I0M+RTkOBPY3si41aTQ9qGUNfwuofCz51CcQson
X-Received: by 2002:a05:6a00:6087:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84faf42b207mr2039691b3a.1.1786464706779;
        Tue, 11 Aug 2026 09:11:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6087:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84faf42b207mr2039582b3a.1.1786464706266;
        Tue, 11 Aug 2026 09:11:46 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1b73aa6sm45904b3a.0.2026.08.11.09.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:11:45 -0700 (PDT)
Message-ID: <52332595-04e8-45f0-a4b0-5ca13dbe3270@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:41:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfX7Vu2BaT7vyey
 GEJqd9Fzfl+tYtEErY9v+hu6K0C7tObjZBfSpxDbDukKubM7d1ui/56VhyZ1gvcLJSBrkl6Im3l
 qVzV3XV5R3mW9p29wH4Rt9rbdIVPeTA=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b49c3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=y_0uHl98WbWs3jSTaL0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: UBuP3jneetZEAH74SJniJXE0KHpu4KLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfXwvIjYUZT6YR8
 Ba9PQ7yRPNnRKIaPBPhFVgtUU75gEYOp78VM1RFDgcbPHx9OA7Ivc/+CImhlE8IQAEJy92ic2kP
 frhr6KttuCYnAsjN3Nls6hwmFTmkfAgdie9nWUZVyiSqvy1O/orFjUq6qDTS9Q3tpC+CPGzDz6K
 SiqGXj8EYKRfeaKaNx3BNfn0AIhBSUvuPSGJnKNhOOSIVLcT/708M0dRvRmMk9xJEqizbPP19GJ
 15422kgBvehUTmUq3TySbdvYvm5OfTLkEE73CX8326XLo+6DOFOJD8uGXRSNTPNNGNu+FyS0c1V
 fPK7tHJqTxsqLqg599PqUlYUsXzOAqI/wTzu+a0Obv2z+SaWYKrzU+bMr3fPIDQSUa/r7JztWZO
 ys9EgWQQDTbODWceKBOcTNZhdxvRd68jLBLCChUG0OY/w1x0D/cDWsNjwvrlS8I6SDDg+Ie0MVh
 tYza0h+I6zC19emhDCg==
X-Proofpoint-GUID: UBuP3jneetZEAH74SJniJXE0KHpu4KLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110135


On 8/11/2026 8:54 PM, Jie Luo wrote:
>
> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
>> On 8/11/2026 7:06 PM, Luo Jie wrote:
>>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>>> TLMM pinctrl; without this the pins are left in their default state and
>>> the bus does not function on boards that enable it.
>> Should we move the TLMM definitions to the board DTS file rather than
>> keeping it in the SoC DTSI?
> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
> these two TLMM pins support the MDIO interface—one for MDC and one for
> MDIO—with no alternative pin assignments available. Therefore, the
> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.

Thanks, As discussed, please send this change along with its consumer.

