Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825D47F3A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131880; cv=none; b=cOXyuJwpMnR54CexpTPd6hoiXlNiVuAbjXi1fGDHu0iTmDW7qjt9mQB6N8b/v+hVuBg0OS6uwA8y7kSG5+eMH7kp3bcYIZrkhO56CmTWdMwlRK7HDfAu2+fuIDqUqQaSW9oJTqboXZNOSLIgO+gzIa44T1GF6K0C5P8mYBXXXn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131880; c=relaxed/simple;
	bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1wiqGQlqP2fmOdT22naVDRw+5k9BTnIdrnDQO1xxUvfa68DtMUZLmdAB/WdLpeXTBC8BoLbXCVcrchysoJpfd5xEUbyg2uEOlv+b+9/KbUzow4LUxzTumKgQvGPn/LOvcP4v3X/ocBzgdNkw10knZUxYLszihb4vxc85HZDNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUflGMsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOklx/78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUflGMsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOklx/78"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXIp4187409
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=; b=MUflGMsijBiHpNRf
	z1BbcZz/sWk8sb6u84LRZCyYWjhyGku+/8V0IPAcMVa4StptWJihLnVP2m8uVDUp
	Dca2teLhrf6iuqPbyLIYjDdnoavpNZTCrPQ0AlT4WaKs8dK9y0M6rQK+h2uQOM/p
	kYrhiCWSuHDe/Bur3vuaAROHQioKMurgL9xpPt1hjPVI0k8MkaiObhebnbL1kv4s
	QraRTFevRxdnSYBHnorSaCIPKDhVtRB6mgG1rG5I5CA/x42V38qSOLA5qYkOzzYw
	mM+7e+AcxoTkurHOeLPD73NEf5pDuKcAMr4KpI1mDJXpUAjwqB8ufPFWCCRAbmVg
	/jVPfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd51su1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:04:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1355768a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131878; x=1789736678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=VOklx/78vf7lOLSKcVj6ScbssLxs+YK59zAumQMzUbH9YRRZcG8JQWV4YPBb2eP261
         notOrrAbKHPB9wYl7B3umAmZTfOo7ZbbO5JDKKxuybFWrLf+uhQJa7QOnXbPBm1oNwe8
         FGZiAFgxyo5VuJ5h0VRx16wRBRsDk6RkSENY7W9vM0HnzivtHo4HhA+XtFTUfhaHBZ8u
         wT49apVvpprHg5bQOAPEl+/WEM0oXONY6Arkc0lfCgNmkPWxlNvovoXxn73kGWaUaaLI
         s96XZH79VsnTA/o3MjIxBws9BtpPk3lyN5YmSPgmcORtbLH4xj+2gzIj+fQRNavlyVRX
         8MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131878; x=1789736678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7uaEdpf9sUum2k+80y1Sa8T6lUuI7EvoE41U+RDQMg=;
        b=OI+ZypzKgWxnYtS34VN06Z3vJc16FJJyHBpo6UTFoRtD4MhKS2E551UTTZ5Ivv3U7Y
         7y9E86Dw4jpXY9+BbCirHqmU8Dspu9WPFdoqmOYTlFaFlQ48K2MVUDe7Ce5pacaxlB8b
         CvToQxq1l63a/XMvVEa7t7s/nSB7pNe6Eggdv2NkeoMUhs8q6mrxxg5ICZbcLmWuBHHp
         E8WWNKFWIYvXkNVMLf0anRtkrSoO7texmJZDUPb6jAHKHuE6C2A+g0zf4DseseMpsyQo
         rXIsaPgiTOep+nSZhabTqSgT1/WKGImKuVjBBFWH9boIUtpPWClVoFW/CCC2H+JuyUsD
         +0zg==
X-Gm-Message-State: AFuF++kOh31TPlfYDm+wxhdHvONCVvDxv/aIM48aipq0ZQ5NrWgb6PtZ
	weOqB22uwdjtWBDXkWzGKCrMel+S5rNHkoTfHzOIHP3W20xlYPT0z2kzdNCR3Ego8FK+35dmTpb
	Y1QYqxvMsDvVRgchs4e6qfaZHga81+Y4QN8yGsSw8DwBbeBz4NKsjN2NMAfDrvfEjzfVY
X-Gm-Gg: AYBFou36QbXF/ZFSbwI+bt4H+0LP7myIxSvRVd5bwY+lE/ik1/F5HYRWOHZihh3TByN
	Z/U1PTlSx5lnDLWpZnRNBJ5W8hOEl0Y0SOTw+9vWJNPo5JQxK4j1aBFUl31PrgrefqqnKu+4M6S
	zOtYlrJjPya3q4mphcQPy2KKyegxJ+mObQgPQfK7CfHtaw30/x6F/OBCvlXnYzBECEf/V3vs+VY
	MVLs+IjpnqZrlzHuCT/qj4tNUya82seEd7IHRu7/mT4R9dcuFLxA8zEItIfgIsgeYkG+Si6x/Yu
	ssBBU6TO8XFqAUb0eSKqwR6fGbNrV/gF2RJM0obwaOjNIOMtT1RZT03rR5f4nrEwUrlBRZE6s+r
	zR5sza9a9lz9OCPG9AoeeRMgEEu0j
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888204a91.24.1789131878050;
        Fri, 11 Sep 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39d77b7b11bmr12888140a91.24.1789131877497;
        Fri, 11 Sep 2026 06:04:37 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7387462eec.28.2026.09.11.06.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:04:36 -0700 (PDT)
Message-ID: <59dafd2d-ed87-4d31-ba2a-546c8d903d44@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:34:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PlvfvEAPENhu0QDWpmouhDFeSik3zCyw
X-Proofpoint-ORIG-GUID: PlvfvEAPENhu0QDWpmouhDFeSik3zCyw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX+V5DJPsEjSGr
 TZI9if53cdY24jBPkxVUDDRCGvND4b2+tphnRpciqHq+dX1MO0x4hdwD5Jhm7bh9vwz+2/QLys5
 isje4zRDz8etEXKmqQ5oWmLg4gW941o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX6NwXMHLDIqFn
 Ca7ICkpWBeyeFhDfxZAwzD5I46cfgrcGzyhs9XLvZEtfIbEXwp20zFc33//tTibn7Q4eSD63LPf
 ab09Ae9jpR7udg8sxE9em6FG3RkXwliyC7OucpVhAhHDM/7axfY7QZVBCydjuJ1d7u1/0ngYeOC
 MUgv1eoje8uN0hfJAalVWxSUhcZfb2f4GFfjLlniA19oHnhHbF9+MLthTmi1SCyy5QKK6IxRqPS
 NqAI4UglC1ww3DegTeEeTr20ofO9ms8P0bPUMGe6/AtEBNcHPLqzw+jdKCNACaT09okxGRQqqDT
 f0X5nLZEWhDVEExbqQOo+nM+jlyh26VfEsOvQpAx/zbtaOCPfzF4bt2drFjCUrpWsAiAIxZ/XVp
 W/TQ8G9DKe39Bd1F7bD/TOMBTCh6z/bnqvl0FpFjwy0/vD659LEitvK7SGMNi7oHqozxBnmNC+g
 y8tRZDr1Fr2YfbjJ+7A==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3fc66 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183


On 9/10/2026 6:30 PM, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
