Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584674;
	b=bm1B/sAQbb+EUmsxsPp5oa0pa117T3cE2Hj29St7wcUDY8U0IANbG5UyU7cmJsRCr5by
	 gGa/6eSNwTSdhRDhnxeUEQgH3o4KyLvHbB7Aa3Erg6T+qDdnfX5YSdWZyOiQplxkZb8UU
	 vVD4C+oFfoH6gBKAxt5gNEaSfwlG1otK8EExmh/tHYJm3/r4Xx7upMdxv3tG+Yzn89fOu
	 fTyFXhSWvE5TncwZplb7Ofvjs9LBx/X3t7WNiSw0ZREXZSMwHcejcWySSxWZ9Cw9bT7Ad
	 7cV1N+Rgq6jOa3VLmHUL+BVpAHvDbkHoTAj4ofd+BZPzoNR49UtrChuR5zZJZKGmW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
	b=bHXxBqbzDEtwwobRvB85BbrbMctYbALlywhBFt2JjFpq5xLNC55uBnw16UX+WlbymOCQ
	 nfHr2NE9uZXomEcRqCRp/TEHAw7TYUFp5QzMTW7sspCA8G6g7irUFcdYuCvk5XqDXD//Y
	 8yRd3vhEqfw7da3LbDdDPOCsNT9ONyo0pCZo3ZSlNidRexuv0cSzqhtkbMaoDyusJDYgB
	 9so9gR0CV+NaCSPFi7PDkTh568U7Ut3+4BujRAUJsT8IC7Fn/3ton0/KxEielr2cl3YMu
	 FFHz7t99QJ2y1jP5Ntov8S4SyiE7H5tEAdgzLWus5YHhe6lmjnb9YY2VDDiw+LtiQSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MEIdCMK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn+qX8o8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963D606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D963D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MEIdCMK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zn+qX8o8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B9ZS3014904
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=; b=MEIdCMK/LuwkdpNR
	93/yWb4TDT0kAnXFt/vUOMBUYgatoskzQlslxdeF4IrVukwHLxB/eXSEYnERiSqa
	xuHc/9NsyTf1vjDwS1B3bSsb2HOEdycYrMscWTk0i9XYG6uGcsN076kwgfp6REoS
	D6Qit8k47rVADKbX6R0KMP/Vr1+ZVSBOkBjbyd8kZCRv7kShCGFxhVzp9grCim1F
	V1+kf35DEd8tWwJRp4GUe/IGj/Li1uYrox7P1sK3RL52CbWW1AFnhYy+fRjUEUdh
	L8Hemk6cEWwgL0iueBe/HxvxhGPwMJnWTV3an6kZ+a7qr9EtfMZMsWyrNaN2Qnuu
	y1TUKQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbgyqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:31:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb96533adfso3286185a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 21:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795584671; x=1796189471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
        b=Zn+qX8o8ljDRGcebLRYsy585B8hV1Q/agiRR568uBQJnTJnYfCFGr/7E3GvuWZpKyD
         jA4cbStfA8o7EuZw1FeJ+ymRBfwV0Ij6ZPVlUviLId5Yk9g9GlhOveqgyQHR5QJoc/fM
         kIf+f5LZNY1tXZF+eDm+Ql04MFaTRm/F+9LvVyz2Jv4sGypgPAYj4xZFTw8j5Qa9h7Cs
         GT4pTF6pC2nbLef9lpQWcGiWMlta2NlPXHpLkcs/LnV3YlbrgTOHzryY85/fBwveBH2Y
         tmOXmujNNKoDNiJ71LWqDDwbRfDl4Z5L6HzFL4l/GgapADpT1Iz1kCZ5+cYPggKYhZsZ
         5qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584671; x=1796189471;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIAhBu5Bmeq0m//pVVYoXwX5xWDaT5pLP0CDoa8Q3NI=;
        b=gND+TWNlmiUr8GnZwSuQIys9pzqRbhIwlxU9gzteXJAsywY5tFGwxXYWF92/eO4hu3
         U8lcREBAUsezm2MUfIMPa1N+tItltQzttQeIoINaKJHOPTJLvqTiBPvRHr8wVDZRuX5F
         DIxpivCRicwOsg7c5+/Azv7CbXoBGs2QCCaybYDXDuv6GX4Plbcz+d7tZWz8Yq3cuL31
         /aliiE7uJbBf+WB/ZLQPMgih8uNYfyxZa5mGgLGK5u1U4HTnHzJBKvahUG6GKhEBdKhp
         1jdAYXdRAPouO8METrjIFvFNB/TanuqHW0EPyh62VbrIC8lppVyWtl2+OdU0mzavsqN6
         8TKg==
X-Forwarded-Encrypted: i=1; AL+hErH+YwtEyjtMIgNbsfQUaGyuTme9vpbYxj0YwFwKvSaDWPCKMqkpmADesOA7eXNruRL0sIus0hM/Fx4sntol@vger.kernel.org
X-Gm-Message-State: APuU4Z9JsKeLQD0dHdx+o+xF1ffynlAeOEfmMSdCl+Kd+ih8oWjclEAs
	Q2cKMbxCsj6R/6nqRcSQksFg9IYuMdrgf8VDc1/FMD59uCdu6t2hUCyB9wz5aKox7SnQkCVgceN
	7pkGrx7bEfDDqeBiHVsFi4FuC4SNkvnjgNxxz9vUajEedAic44AmqyoUJiZF3U14JWKeK5EB5y2
	th
X-Gm-Gg: AZFdTZcspZm3Z7TdMx6yeKBoNeCVPgieNfgQ3m8EpZTZApEGkk0NxSq6mVHH8s/Sbx9
	e3UXYbeu/DuaJlstQajdeYNe5kipuVJlmWwqpxfnC+Sp4rYmCnII7jFXagyciVjhAyLFvprP8E+
	68+MqeeIUKxdw9QIdR+sqxipXA3VsbSxL6ws2OHJqxh3fvHSzLDRzQh1eLRGRunNE2EAM3RhKm8
	HC5HBjhPUVWL/pxE+7nDq61QjfKEuYL6glpU+V8hpsRwN8C6BPw9B19zJZtFJArSjKLWBrdG3jN
	AOliECtXX3rERC67VQ3hvFsiShiJSt23f8q/hUE82iwR9jts7Gt9rjHjf2Rk+gV8dlw1G99+ORQ
	Z/O6BnEWYgNHZs1SdtWoY2UFZyV9o+3LLHCvV7ER3HHXDZ3a5x0b8sgbXSsp10mgqV/AI1/2g1M
	DYQHo6
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr14553288a91.1.1795584670997;
        Tue, 24 Nov 2026 21:31:10 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr14553265a91.1.1795584670520;
        Tue, 24 Nov 2026 21:31:10 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm28528572a91.4.2026.11.24.21.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 21:31:10 -0800 (PST)
Message-ID: <45453937-5fce-42c7-ac1f-66aa94dec646@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:01:03 +0530
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
Subject: Re: [PATCH v3 0/2] Shikra: Fix qce configuration
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMSBTYWx0ZWRfX8EIRleNPIvjO
 McrnwRY2Y+bJQNFL+Ihe9FSYNn8kogGjFUX1m89ZwkMTO1YgR2uYw6sJSCDxJrJ6iMHssXGE/uM
 0o+IXm+811JQpQUUi56FDzwr+60ABzU=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06729f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYJX1yTOf0vTYKAZykEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMSBTYWx0ZWRfX0hrtghfHrSG8
 Blmu1KZOInxTOKOBN1era7BoghaF/IMI0nC1289w4ysAJFZA/HEqcnE8cY1uALH+RyXt9QTX51t
 cZlln8mEUyy3x5Qs8CfZfhH7pa5S8kMfxrNs6HhZFjR88jFSHQS1MyOpDCCMpPA31cPcjSb3vJr
 bHibwWijv3D74tkkxg34hwP1/h5v+MVSyE7Trglfr6HrMil8b9yxPlI82OsOI4tEIf6ExaoscAx
 ZXL6NHvt0we/HzfPccY4ESMVB+c8Xkygd39tP0vDFPlC2UECZRRu6uF9njnxrr1w5tN1Fb39MtD
 BrEZAMI7lQfF/0Zu0qY3Db/3zLkWUnUUTtkCcoiFy9yMswRIfoicQ3U43QWQjJeqxdmsFAZdzTQ
 tZhzNYKGx2oIksl0xfSCfAB99RHYlqnB4JwXvb2cp+Lih0a/yaWZNB67QRTqZzV0N2AfvBy1jWv
 gML8cDL53VBPfC01lgA==
X-Proofpoint-ORIG-GUID: 2H108FQhdw3OVIAvjHmxQde5eNtyblFE
X-Proofpoint-GUID: 2H108FQhdw3OVIAvjHmxQde5eNtyblFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250021

On 24-11-2026 13:55, Kuldeep Singh wrote:
> On 16-11-2026 14:29, Kuldeep Singh wrote:
>> Herbert/Bjorn,
>> This patch series fixes QCE on Shikra and targetted for v7.4.
>> Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
>> in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
>> backward compatibility.
>> This series updates shikra fallback compatible and hence, both patches
>> should go from same tree to pass make dtbs_check otherwise patches from
>> individual tree will break dtbs_check checker. If dtbs_checker is not
>> blocker, then patches can go from individual tree.
>>
>> Bjorn, will you be able to pick both?
>>
>> The patch series fix description as follows:
>> Shikra require explicit clock which is omitted with current binding
>> description.
>> Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
>> voting and crypto was consuming it. With proxy vote removal, qce need to
>> vote for it's own clocks explicitly which is already being done for
>> agatti target. Adapt same mechanism to Shikra QCE too.
>>
>> Validations:
>> - Qce probe and kcapi_convenience.sh tests.
>> - Correct clk_summary output as prepare_count and enable_count are 0.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> Hi Bjorn/Konrad, Can you please review and comment for this series?
> It's important for QCE to vote for it's own clocks as dropping proxy
> clock voting(patch in review) will result in QCE issues further.
> This series fixes that.

I mistakenly replied to v3 instead of v4[1].
Kindly review v4 for latest.

[1]
https://lore.kernel.org/linux-arm-msm/20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com/

-- 
Regards
Kuldeep

