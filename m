Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794611;
	b=gAPiYcLj8RNiFl6ufZ+DLRCwelrS03QQg0a+dqaqdzxgjPxAI9HunuvoR0eDgv/yiuQK
	 vrs5/jOQ0bOx+h6+BLub37a/agbSurNtUtpeKDhCBC9EeDbXSJLHj6RqJ6V5MROOR72iJ
	 KjtsUIlPJN8NwJkx0p8w1oQz3g14wDYdpr0sITiXFHlwIl+zh7upLs33da7F+rj9/NQre
	 JahvmvyHDvzM9zwJzg652R4i52dydAAlm1flWDCiaiqpfNA25nFgWl8rZjd03UImhNuHl
	 /m1rx7K1ZC5opPcJebkPMLiTkjPP1KOloMEqlxa0wik8drHRQXGUpxkrbZJlPbANS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
	b=VxoU3HMPHuf8rzEl3DADP+aiUXEHxC6WNqwFeg0ZI2qAlMEZH6aSV8/vwfuTTMFG2kxC
	 op1pJprrb/c53V2BS94SAPvqlpcIAfWq0ymNIfl6yVeQv8kGQPp4nupls2pBgWii2HHgg
	 3USG/UVPUMPGKkma/asezssRuDnf1tvk6avgXUIvGeL4/PxkTh2T7sW71yKbfiRRmtyze
	 6iJQz83Av6Iy7fsKKZZoSjhuvmha6ZoVxJ/WpbzL7xw63wiHDzdVSEqzcA0XWkZ7PmeYC
	 T7qN1THO9QBELKSv0w1YwyOR84XeLMbM4LqIB5xWS4XaVehqkIc6Q8D5BIJA+vX3V6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgjYcElN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FC606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgjYcElN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1Kscc2361684
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=; b=N5ah1FsbeT0W4Wvd
	aQ8LpFyVl+juaE5h9YPvH4ymv4aBF0E7lV3d/Y6FbD1e+cpTzke0vlO4S1DB5BO9
	aEv/SsPShzP0YbNU5ggpZkOfKQx56WxIvGU9NlydHM1R9aJB+2tjSrx5R9WyDvhT
	6AdVPKZUkvYuh2+VifsxyoKfYD/D1mquEGIhisIek92rVW3iHYS/xFZ1TXAtP4mS
	cfBk6fC5pqHxbKk0UB4AOvMJ5EgJeKH+64++uz0deZ02T1beae6KPE2VaWq9MXd1
	UoMQyxF6plOaNGrb27jIDvcqpsnqgmQoYn2ke/kIFa+tNwn+DlKIsM7yJAmvGmuC
	FjmNdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj44anc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:03:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso1251770a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794794602; x=1795399402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=NgjYcElNGrU9hqJ+ngd9s8FK+UZytN4cbCkcox8sAUoEyRsknRrWfO5NL9BoHJYaJu
         Ve11HLk6dz2EpHqQ+Msb2forsd3I5DGKAC88BnpKfztbXvoubLLI8GfrN3nKISD3Nd/H
         oj6vh0O4DNziane62f2HIqcA87odYNN/hmVohEUse0cABlHMkwyCM7B2V+6J5iCmLSg0
         ZrTz5VUjgS0hWMC4mSPpFV3hyZd68Dd6D04k3pgjLDMBRF6JzegRxl7T76T0Gaw38qNs
         Wlkpv4XWlkIZJGSK2o8zW5QPDccZqjOEEzL/O7VfknJXmrCg00Ccp3R2XH3YKUv+Lr9v
         mj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794602; x=1795399402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=r/EzvenoFMeODh80h7bgv4PvKfgfiAtk+EGANJptMCyqtV5JE4z8PNsy5hQ2qUFn8K
         1VUBOBY5GmTTKz62oW/6+mEgOj/JwBNgNMX9HbtMjU4z16hQYDvjvoXoh6T+ge+PMDIU
         3hYPrlTZGQ4kZS88peyd3ZOfKwloKytilgIE3TTaF13vZGchaTrzzWEIGHnIQm3O8KrN
         jymoLQ6d3fvTjy3eiXtQ1+JtzIh5JCjKpq/hQOKIYg1P6CbvJE2sRDbC3sYwr/5zqnsH
         PyFiYpf+r7EHOUbeyd52EYxP4opneyjzZpoBTeA7lCM29yryXkiK7IuyCpyRaS8BhnCj
         P6FQ==
X-Forwarded-Encrypted: i=1; AL+hErHtMjEEBkQZyNR2EFRfuJdbJhtfhKuiHYk3oFLxfW46s55AVwFjGC4gvO9Ys5JTfr8FAJpy+KfbvGQ6w0B2@vger.kernel.org
X-Gm-Message-State: APuU4Z+VIxNkXi0SusMH796rJCJrZbCIMDadjzbzZz1xTrKvIZZpecDE
	ejGZ9lbzXeSrE6M/URMlF+Cm6SqOjNMO9w8Dk8R3ORfhB7zYtlBvEH98dhN0WTkyonSN+DVeD13
	Xvx8UUC768cx11QFhPff5y4oYqDAY4C1PxYvhkn4LE/SHS8VjZR0MiZmxI2G/sVaRmkeB
X-Gm-Gg: AYBFou35GvXTz28gLUlTZXLeyLEBxf54CHQhLZualRMEIRV7D0f5hjITFvCFQhquBXa
	vb3d+oTyN/ZqYThc2dppkYljRfH6gmqMmFdnJurD7VMNtAdOkD+1+0l9/tElL1VqVZy83NoEktq
	CgxTJAHFAK1FxFi91XgwUXPnLu4GT81od93nN7n9IAa0nILy7JSqnSnp1HO1vNCONmPRg5kdZoa
	9i98a48XNZY0R5B09BTdQCSY0q+sZaJGM181b6srIUsuJRnVODDyHE2kH8NqY/AQLmXu/u1Q9nI
	4WUw+jW1lop58RqKx6MmMDgpNNPakIH6zm8JVSiPLDTWvuU1EystoH0L6v6O+SQ4noyj/3jBIij
	ZTDsq+F5GJnsSiNDkNPcm8GtemRyaCHVgxC251cH1h7TdaKuEnSEBU40EE0PLe+RRExYFqVeZ93
	3J3zoa8zmEv4GEroP6/3USeVMJOxmie6lD1kM8
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635789a91.33.1794794602518;
        Sun, 15 Nov 2026 18:03:22 -0800 (PST)
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635767a91.33.1794794601836;
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm19748961a91.11.2026.11.15.18.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Message-ID: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:03:14 +0800
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
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <20261111204322.GH9176@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261111204322.GH9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfX+WvCRdccCcCa
 aXXJ3cPcm2bRv5IGTCoNbx1s+SNtTFVYATu/iQEKu/zHIkf9wQ4qZVLpsqDy552K5hgdjYSSShQ
 AfgpWmSHNurOcPwKI1OxQ2aohpwKoCQgt5ZbSG/Cc4S5ArZ9l2l59vp+4dUGQ0DU6/VzWmFtXld
 FowyyjCYHUBBTSTmRWCUPMkt7eQNnsCP03GHBaMxQhM9HkOnhVD98cQE1Tw2WjCRKOT/8DoDF4A
 UKI5TXHN1o5x+a7Qv3hPgZt4H3jFofyT/KeZtcrokyzh3c5dJJK4YDS4KsL2xGg/2oty2wPegxS
 akzTE5NGnpOLFRD2uDOrc42CMa6TBHOsvf/l3LYBjyBrScxJhqSuCl39YIi9ab0tGWOo3yc9UNg
 qkRKiPXn+XpDauhe4XxtgEw2vObVClQnHy7LQpe/RGLwY/CZhcclWc8WeyH1CykpjtBmhyw/LpA
 fUgNT5I3S6QQvucSKDw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa646b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Yhdbyfe_LZq1WiuscQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: oehIPyO5ZfxQGemo-bvoWBcOCwZBc-hR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfX88G48bSWZGO6
 lO37dis8qC/yOuluTOsM7JE6CV420G6wnOPu7cZzSQj2bG5tbiG/v+phk4cRR5hLnC/05p/YDmy
 p9fKzR/Uhfwp/6EvvZ4kfPn3qJnTwkM=
X-Proofpoint-ORIG-GUID: oehIPyO5ZfxQGemo-bvoWBcOCwZBc-hR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160007



On 11/12/2026 4:43 AM, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>
>> But it works fine on some platforms? We have a property to override the
>> peripheral-ID which would solve your issue. That would be much simpler
>> and avoid the ABI break on any of the working platforms.
> 
> Looking back at the earlier discussion [1], Jie in v2 already proposed
> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
> mixed together. The series later moved towards platform-device probing,
> then became current shape.
> 
> Hope we make the right decision on arm,primecell-periphid this time.
> 
> Anyway, I'd like to apologise to Jie for all the back and forth.
> 

Never mind.

Hi Suzuki, Rob,

The "arm,primecell-periphid" override is the simplest fix for the issue. 
Which fix are your preferring for the issue? If we want fix it with DT 
property, we can revert the patch series and I will post a new one to 
fix it.

As Leo mentioned, the AMBA probe is not affecting by the series.

Thanks,
Jie

> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/

