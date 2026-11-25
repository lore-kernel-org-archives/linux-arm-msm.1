Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601377;
	b=H/WjQU2CS6CLyRJ98aIg/PAKKRbsMldV4yaaQ57JOVfN1PpViFSofMFBJWnVB9FnAMa0
	 6pcfOcJVgmkZtXIluCtDydhQlQupu3TepoHOnIotaDyS2ZbLeUYsqSY3wYNcLaMZNjT1H
	 k4vtN2QX7/NljZzLdZ7V1slrgXCVfdtxw/6CSZcG7Xqweqe8Xo0anrJdhvg+DI57I33Fv
	 nkaLF2IBTAy1vJV9eoAZZwtudTnvR6riNGLlwNAl0dFONR5qZuNANHkNMS+MHBLLBJwEK
	 HmO0ilIXl3yXdrnTadBN+F4gJvxMN4lpoDwep+t4GLPipJML+B0LiPfeii+Y77diO6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
	b=3EMj6zWmkFSrr9whDmt2ozjGT7jc3eiExp1xHkmqZkYbdFVMEaN5nsPnG5GYey74HMXs
	 19SC713taNVNv2rVLLuJHALRPkBZJLOc1Yl0hdMqU1jzCSL/WELhNR/AWya7jkrXEbeKn
	 Cyn4ZXc2e1HM9kyB4nF1EjZ3HYktn7G9eARnttAP8JkKdwjfPbOeQDEDrlsWpB3ROVI7V
	 2kdVV/qERtUa/YVp47GSwjpAtz85eaflfUUnDS0dyu3Vz0YOfs5oxA+ehNtyGvv7SsVtN
	 u20k/7iSmF84p3HUThj4vAJvDVrs/rBR7h8Fjm2uhYXA22CI+HL/W5h7UEyz6EOGylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jS7ny/6q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLD5zy7w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA8606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AA8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jS7ny/6q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DLD5zy7w
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCQJ2121027
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=; b=jS7ny/6q7SyV2157
	5RRY0Ley6gMiHuKIaJgMVUnISyC+JBCpAMDByWRouE4qasUBZpb7qqnBHiVpb1wl
	qX8TkbwT2Ykf2qX1yID4XAdtx6sWRG2ADFq62B5thd6314HWtebS9wYOjHx2Ylse
	+RS7l7z4RT7pc0Pla//d1dud6Fk3T/R+nzgx3UtB5dDDx2CmAr4WJBbVYQtCpffY
	gP+b0cSOALZlTQM5XdCUbkfL36wRibnyFgk/nNvtP7lJS0FmzuPsKIjBSzhLSNsd
	AMimtGSyctakfpV5ZsRg/47231w+y9ZxUapYHjLDInG8SXcPrkV1809Ig2OkNZ7J
	FDL7BQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr9et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so18039821cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601375; x=1796206175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=DLD5zy7wdgKJEvj0fjMY9CY1W3yBI8tSEB13cQnPbl1jTMxIkTZimEqM6miukDwXkH
         1MSFml8PTlNAf+kBGSH/0BNe1RRSFYW8tsAwjPnUtvj1QHjUAkvCQcBltUz9iCUGbhB4
         K+hH5+voxhlfV2iGZWpcUqLdi+CnxYcwV9DsURtkGuy9BHdg14EjqLEh81FfgNHGAOxj
         eOurEszR5MUyfQb1sJQm01Qqi1gqGk2BumGEFZyXdMB5owz1SQI2qqi/Ot8AaNWW/LMe
         c0fe/QpqtToaKFqSN8Mdk7AJ0/GorPCtpu8FEUGN4I+z2eFWKwCRuzKFlU4hI53w/QQZ
         jSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601375; x=1796206175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqcvkgLNWHv3eFLQ7yG1O5kVrzbXHZN72He/8a+86Tw=;
        b=c6U2gACG/ZA20r3RDWP5NLLu9ZjqFjFOnatKzQHiwCZ7uqF3u/JwkZdF4lKXXOP0qn
         qUtyJ0dTrcfBfbkuFuXr/iSQJU5oXAW/cyJ8Oum8X9WDCjqIVaCa0k0SpRsNmkkIjZ26
         tD4ibLCL0Mto0vDPlUg3xzrD0g3YNmltLtdeFuMlSwCXYNGS2QAYAxg/GNZ01/vcG6kK
         HFFP5UMVKYKiPBipt4yZcE9zRJ5rx9DOyju3BMW/LZcher8tluRGEpA82PRr21opTUak
         +8EnSfLsDTgg567N1O1arU1p2SFiqq3D4Mh3LhrXeX3bR7XUHV5mMNySUv4EikskETpI
         xs5w==
X-Gm-Message-State: APuU4Z9aTycZ1E26K8tBwJgitkKoXvA/40iy7mNJWGCR9PhTVowVcK7H
	/40tlwiEXtHEO2j6V9vN8s7kKnIGGvbwqbVEFPXTGEv0Z/lo3Ic75F7YyAkDoiMCgvep0e/nELo
	0p6DCclnJ/kTjcklMu2lsTlgebME9t1ugftjWz+c0ZNNvHA5rMzweqvO0crm9cN8dxWjp
X-Gm-Gg: AZFdTZdG+3i70jISQia3ujcjrt7F/pjqeM1kmN/QHbfP+WjB2TkefzmZVbFIN9x+TW4
	yhuyIJWUc+Lo1jfDZsYKnOXYX+07/sqJTchaaw/Deq9CfrxcStSWfjByNfsXhzCReFoLcsCZU2O
	kVlSgZ9IplHcisQcw2bC2w4EbuCxvrkiOYwzp3r0SKn7otU/oGf/HW7j2sRbhK2RAkNCzjwXHZY
	CcLtidBI837RFwJvtTgb00Ffkq6Wr0/ENcEwp//iKgsNNXqTcLNbK8IzkmFQz7onuqLeqolrrjv
	w+KATUz9i+WN5+wjfBsFz/ind6CNkU0c8r/QPJ7V6uSZJVAPZq04slICZxWAWLOAPeMlq/2ml2p
	05cdUYBlWkACKQy3U6ip2g7A1bFpuyCLiUKB5AKk4AWSM2calLYWO24aG3uVNeBPrZLjRWnQ=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683531cf.5.1795601374599;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr306683191cf.5.1795601374194;
        Wed, 25 Nov 2026 02:09:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:33 -0800 (PST)
Message-ID: <0c37bbf5-e677-4766-bea7-19b02830c91a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:30 +0100
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
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b3df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6qTnIEKRn-AZQBxmrAs8rao0zE1kWJjI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXxmImfs03jdT4
 0D7gkP3rhiKNb3THhm+eliqPeVjWmfET3TlHJ8xGHlQe2K1j27cgHRs2iiIySfcuSgFuhMSFjGj
 9mCV7UiSSxI1dsPdoipm+z7K7W7KRmg=
X-Proofpoint-GUID: 6qTnIEKRn-AZQBxmrAs8rao0zE1kWJjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX+KFO1LYfmuJ2
 uoWw1JJF9Ibd91OiDCuPCX2qAhZLgYbrzkymGh7xF0N6Y4LhsId6GepEFe//FvUNqTni2v4prVV
 wgOGN1fhyi5y+ZpRfPB8TONAndnVn++i/Z2y19OaI4hmFQhv1X4yYB7zb0y85aFe3/Uk+6IVNSp
 0EKpuea6tDCVdWv1W0iUFuJ8F4/nHOm+TuzeshQmOj90CN6CiUqCbNnpz8uYhtvHSvzbbxCssH5
 e1XX/gdXEW2CSNumkuL/IVb17Y2qaxUYkdMuc1GGTeJ46N+U1FQf0ggofusv6iRNHAg3RvS8SY1
 bSxiO70aH9NXGOhwxmJ8wZqjG0jx7Pfya6YIDaIp83cTi3AJWmEkpXP9oqnTigcwEZ09Eb7F611
 K+Xtnj1wXyWabWRDAy1NXWcL1Jhx6grWaw4uY0pqOy3lZ/ddJuDB4yy5f2pwGqK+8gmb2ftTAA0
 O3ErIP7qnJQAxGFxlEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
