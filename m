Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557550;
	b=hPKFyXIBg6gGvvqTh/iFzhZJ5NLRBOBCBqxJYt5QXL/mKccNGcBA47M6rjfMKgAAu6h8
	 AvQ4/1/PyrSBBQ4/iBD/L0amGKojf0gHRx0oWx6tevQ0WkcUr8SOW6Jlg30F/4PMIvabf
	 mZiZSOdg3SFtedAA9fqdpUoZlbwMBm6ByfjNjoxLqCfr+V+glQgwzuesAUNGDzL0be1Dq
	 H6axLw/TzHnO0XqiMPQIVg7cZ50gTPhXZFPMaMZXDtoJzPzbHNE0Cchz6ocd6UcSuqH0b
	 uu/8+RiJoTaJrA5aLZulidipArgsQpLZ6cD6davsUUFPb95tFmpuz/WMbM6CnjsFzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
	b=fhhO4KkOrFfnqiTE3O1cqtpmgWKyh53RSNrFazjZQR4aKhoGCAwKh7ann5SKU8pJP57I
	 XdaEZ9awFPsLgkn7Yg/E+YKk/sJmNTpUDNTotMG3VjL6j+WvhDJ6KnyWXOtOacXhK0mG7
	 Miu0DCAsWg0qx7fpxZFrtA7wAdInh3tNFqyCEdbE9InIyH/ILPpcsWbD80lCIcWSpGYmD
	 lV6YWCZotCddArv322iQxRKf38gpzNeHDrVY2xXChVY2r8aVgVgRBcqG2gyDkm5YMeNi2
	 bpDhqhgrb/uAjWX0yW2PEPgrM5QcDbS6fFW4BBK1tiAlB+8fU7uYB4McalAYftYNDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3EC606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3EC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ViMJ41Fe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOFzVT4+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57HQP073794
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=; b=ViMJ41FeS78SGe/0
	E4ovvj0v/cC9Is8rJ52wY32sp7eo2LlUUKrtHm23+B1R7/0w6tdI84vAi1aBlu2D
	+AED2WpkjVZcQbWkEvlzipv/iwA7NAuZ1Sj4Tsy8suguFUrUgog8ubD3ObujsIdu
	5yLLUfl9mOZWal7m2u/760J5hO9YIkScltBg9+s3teWhbDqv7LlBIL+F/23dMqpg
	yczAG861+OpViXTpn+mMpR0YVFgNyUPtk1D14wkd/Fib6bhnYXfQokzMzjQ/QhYw
	cdu2kCZvLbV8bAsZskRQwD954jUBeyrKS66xo6IVagUwSmU0v7sMqWwFNZmzEIMF
	M2V4YA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs0452r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:12:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so18776085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557548; x=1795162348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=gOFzVT4+wyHipGT85SdnE7Q5ptjGpFD+d7j/bxO9+mwDQ9OEIsQNWJrjM1QxdD+8KF
         A+og4fg7ru643Mm2SrNzvO1FQnVy54gw+1N8fJG0aX1Fa1KT/fWI8ieH9BQkkgCRKc3q
         MAurVDBxE1layqFWyAIDcDMxSnyVoLcmWedKS69CCehfGfQh0DPs/+lqhy/WnBn0etnZ
         LEKD+m16ZhZdhPXKZNuYm/OEqGaRCM3jFN8WmKTc28yLllpGo6TRlBj5QlIJ+/un2duS
         j45IyG0WsT9tSGNvCijs76cjbEiM2V9EX8FvKiyJ7/qEwHa4IihEHwbM1MG/7ophNPvr
         MGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557548; x=1795162348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZnFjQJx3sTnKbIEHL+q7YpvIjJRoUyfbTVk26tE5gM=;
        b=ug2pdoNR5XWcLM3bTWAOw+37wjrRZdysbmgK3fV/wGakrd02Kn2outJsgOyxskPiNj
         n71/yhi3285vGAMdVl9XnlwBFH50vyZXuxw2JjNoaCaeOKu8icttnjDP7laFCRpFdi3B
         YQC9Yaoue2IfDdQeoRD0m5P7aDmr5Y3LiJRKQgnOd/nUFf7xEGD59i380hUcWTDoF8/J
         nHrkITxxcFsQMLq7Zm0Lqn+ne97kkH6g/qia6JMswiZGLorJrCTTATaXUIDZSJPouOOB
         4pK4lj+0uALUs5mxmD58g/i6Uz5G4MLOjqZw/OS2ik5gmEVPUyE+5PhcQp8mO3WyJEBP
         WNsw==
X-Gm-Message-State: APuU4Z+6Jk9pRC3JTA2b9xqMvCEcZLBeSAnVj/cS2c9Ai8kNBljOojWP
	jBYveWpl3NG2BEdxL1zZ56ju+5/EbBQntgd9CIMCeA53OsGu0VIRqOZBikR61ebh9p+9Cxq9/Vc
	rLd1nhdnmoDaj6KJ0YSkQV5maZU3Ba0D0W8fkw+11LrRopj8bfh2aKSNTZmOWvAIzx8ZtDAHY7s
	M8
X-Gm-Gg: AYBFou1fRwxUuTz9pe5M7pK5dI2L3G9J3A3QL5AQzynYOlfS/wk2RTRnafw+HyQwu9L
	JFEVdj902WUvitEy68SS5IQZzWdQCaZ7D81rNVr5SWPkvFDwdte/H5+sH0/LfkjAHuLZlB2I6d2
	HCZTYG6WOglgKSS6uZhb9xPTVku4UvNrTH/tcF3sbCagOlh7xyDevFl6CdHV2g+jxELJ0khDgaK
	J8+Iwd2FTvmlesjd7q7Qt6WZgjGXxl3lEc1kOLmFLXe3j0inZgLEEywA9YmIjKKiNurPc935/FU
	3/wgPGGwRn8Aq1YsAC3YGRNLJNnCDfqpD62u0X5IYfWVVDU5a+qtwpdvCB4mWjigql+0wkCt+GC
	SK09psIqwMugNtK1MxR8zUm7H7QaJDx50k7NJuZiotAqIQE0o5v+3Un8/6cmoUYUzI1FO14Q=
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288682885a.1.1794557548100;
        Fri, 13 Nov 2026 00:12:28 -0800 (PST)
X-Received: by 2002:a05:620a:818a:b0:945:ede4:d247 with SMTP id af79cd13be357-9494b9e03ecmr288680685a.1.1794557547702;
        Fri, 13 Nov 2026 00:12:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23db711sm629005a12.24.2026.11.13.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:12:26 -0800 (PST)
Message-ID: <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:12:24 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX/PqRaSB9yBdS
 59djN1vlDOe0Fta/Z3BRDTKalHHUtHoN2NeiZJ7FOp7k55IKVfK3pnMRsj8DWToYu9g8MWeawmF
 vKzWNgEEyIgWAXhAPuMAHqZUxQg5vDiV/LRLjrI2DPXIg14/A3EwxUmyoa8uyM3aEnDF3XcI3ba
 j3PLOSiR5PGa2H53Rze2YhrMWOgvy3EI6Rw6qvXpO94BI4dnzQDUwo4xq31zd6aD6tQzTLTlsrB
 pDiN95QUJftmCSYQdwVxKkPqmwSgo0HV+oGSMJwPauptI2UBhhd3KEKB4WtkE8UWPPQ5MtyYg+q
 hb8ulz+5ht36+/uaoKrhhnpbKv3Y5idr5Vrzb343/SHoWUZHapMQoV7YsgzpfYslvry7ei/ppOT
 rvSi8iXQoznjXgfduLovLxpMrjtLkF6naqe0nnZEXrMtjgOXP02Miaq6ShfjdGlpvPaQGMtEtbG
 0iUuTqqWvDLrLwd79Og==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6c66c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=E87KaQfuVDw1DwplJSQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX7O8+1Vz2ZExH
 wmb7d8ygvVO5Dpk/1JwvRo8qVeQ0rYRf3QYcLXOcFT/au5A3yvbYYMMZepsNrJP94hBLMNqRqh2
 q3qzCcEk4dgRiolU8WqgQZCTu+SsfLo=
X-Proofpoint-GUID: h1ZH7_RytJ7IYeu8B-hzLDecRhKW9jn7
X-Proofpoint-ORIG-GUID: h1ZH7_RytJ7IYeu8B-hzLDecRhKW9jn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 11:30 AM, Aditya Choudhury wrote:
> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
> dt-bindings header and the socinfo table.

Please use the real codename of Camano for the following
submissions

Konrad
