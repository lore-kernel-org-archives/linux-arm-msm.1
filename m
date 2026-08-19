Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44EE571
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151250; cv=none; b=QNgLqITU6oLMPIfNsyjIUUfCBpRrDiidGIx1fIjGF+HsaYai5NG11zJ9F/3DukLmylKTL/GoJfluyUsVPGZBBcSRt/px20OeGMpH4pFKvpBUK0386jSFIxxrvKJnxftgIYknY2iNsVWzZkhw0ct0CQ7Te4mfTZba81QRGJJ1bFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151250; c=relaxed/simple;
	bh=f2a+3auSdVqFq0/OWgRlgpu8Wcw9P7Ud+AsdKa8wAps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtcksIr1ZaJ/+GaQ84j2XUM+yqxtwoLf2WB2tMb5udoPZLaKg9qgEUH5AgpWADSsQQWVYDz6UsLLSR2bYT6EDFD6oV8FAcxMuXdnqG4NP7wYS02np73VbJti/B9c6LFMirnBWX3snUMz8jFVP2/dV7lXS+iI5P/MpH80jSNglIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpPniQzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djKZDKNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpPniQzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djKZDKNy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbo50588414
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxxPmQMGMhm+Xs4Nrgda2xGPqpRB9ToDopA2di+3clc=; b=cpPniQzfegnukT+8
	t8RQ3DfLDmxcNw8s9KkaplGXAMhlVDo5TzltcYSUZIw+4eDsLik6DhrUeoE0uyyn
	AsqeRxVAiAxx4JCQeOzRYoehzwaUqjBy1jIZ5v3RWSSbkeozQlkDphqBGlqsOfwB
	mbPm8bIjstBeQGWeOLoMQnY0RFfv58p74vHPKZ+uat1EQNbqi7k/RXQUH5Cza+py
	S7eqLZoGv4lsisc5tJSPyGYWL6OUlojFak7+auIrcu+spEv9dRuQiAOXhBpSbaWC
	cJ55ITjaWxXAPNZtaUSCba75FWJv6Bj70ZphTew79/p7LhGHS080k0QPUfbPBWgk
	6xlnfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbu1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:54:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso9833565ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787151247; x=1787756047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mxxPmQMGMhm+Xs4Nrgda2xGPqpRB9ToDopA2di+3clc=;
        b=djKZDKNyQQdxDn3jzNQbmDe89Pp8e8FkZcpEf65u4n5yyWbHdRC70NThhfvIa9y9kE
         kkl6zKY9P8+dy3MwaDCMYXbmCLzVql41RVZWYtTelPlhXe7Aw2fS/fD118orrcAAIxg1
         yx6dV4XVGLcQ1m4+lJbzdLpG5/tmpJe3T5N8uXSfMX2vhIgr5WoGh1Sw331F22a7ZvJI
         6R2ujNU4rEPkpK6N3IA/CY4/Fzj0OIU1qT8vSzVhb+e6bZCV+lgWVaQw6X+hLGSWsgzG
         WfIh4WILNx0zT7nARUwjJI25lUAn6l0FmigaCYHEXejnl4Aep4ixLw2410PIa55G/swc
         dkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151247; x=1787756047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxxPmQMGMhm+Xs4Nrgda2xGPqpRB9ToDopA2di+3clc=;
        b=T74xV0cSLqFTw+pY4SWqW9sJ10Gfkr6OrbPoUQ4+O4vNzOZR8xQJJgkqSzR3D0W2lg
         1CGAhfgZILbz1S8mTQ7r7hvDIh2FHkaeostsGha/xndHed7Lm5rhU/tRWNKoMgCFS1h/
         CMEoZD6MWMB4T2r1bX+fl5DkqZN76jGFciGo16R4XkpVcC/f90m2/JYR9zbDIdYXNTLJ
         VdK9nhjOetl9GO6TT8KX6zWKm7vnPqCMGRehgQaAaGy1CvUkRhQL6TEAxPbmCNfwFz9W
         vMjx51mhI25lUgqNJWggUMLMTpSgrzJdeP26VxDsQgV3xYzSwzOOFUOQubsdW4Y/yJpA
         1wNA==
X-Gm-Message-State: AFuF++nBH2NGTDDTYNVPqIZX8Svx/kW+ADtlbkd7aQECeW2hE7wTBx5h
	9/RJ04TDEofO07MMulskPKi5cvl0YmPOCnH6rLazEdlbtA1DBc5Atzji7A98GIG1LA5u6jWMX0O
	JBJJXdDvJVGxHl13jPQh/qAs/9tGU0OJrCh5OoIy5Ez1N2vBdUv5+DZdqjDikzKGb72wB
X-Gm-Gg: AR+sD10DC2VRNJISvqwkFuQUc0I+3EDSWKR16OWOWO/2rboYdwXv+afpYwwQCqrnn/7
	m1IYqcXfdRrmir8b9dHrThz+VMoKrggubKF0WjV2qlsqm6TzWIStBloIL/kXuAb1DJ6dsJ8xVxB
	M2IoNSLtnpcFCDElkwnqLWrmCal3jc/QyB/XKV1B4Se493UkQRM40bXvRTKpBBk9iR6yLPmFbTa
	63qGAWoQlFiaXF5E+wJ/aBRKakADizrcqzPis0bX2mG4eEwh7ZJ4XcKp7ZbM2W+1lvsEf6b0d0/
	TmHRycptjrHjhuDZmsTR3Sb59q0yfKKUXIzP41cnvBQM/zCU0/Xe7H2IvJfNy9IfSm3dFCnxmh2
	Wl1KeHST8KKciof/sFU5SnCiQPqi91K9gv+8+iTbdCbS+iA==
X-Received: by 2002:a17:903:3b84:b0:2d5:2f49:b3de with SMTP id d9443c01a7336-2d5fd3e78f6mr105269015ad.0.1787151247244;
        Wed, 19 Aug 2026 07:54:07 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2d5:2f49:b3de with SMTP id d9443c01a7336-2d5fd3e78f6mr105267565ad.0.1787151246678;
        Wed, 19 Aug 2026 07:54:06 -0700 (PDT)
Received: from [192.168.1.17] ([122.164.82.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb4e1339sm28651605ad.19.2026.08.19.07.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:54:05 -0700 (PDT)
Message-ID: <18eb2d9f-474c-4b1c-bb57-87c7568f6612@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 20:24:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: llcc: Update the SCT table for IPQ5424
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
 <28bffcd1-4743-43ae-936b-9f9f92117a9e@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <28bffcd1-4743-43ae-936b-9f9f92117a9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vh4zuDdsxh86Oca09KvlI9jkQbZQY2en
X-Proofpoint-ORIG-GUID: vh4zuDdsxh86Oca09KvlI9jkQbZQY2en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNiBTYWx0ZWRfX21zjQIaUKshb
 xB1JKxuvvSvgJHgQvdwca4N0Zb2ErBT96w43BiH6V/zNJg1YtFE48f8uXowaKStNgbQNWsif2aW
 lHGeKdzfLIxt+Wau/r6M8u3P/kQQPe/Fhgum/A47qy7u28sY092jfiiq2IXNoLEh77QGL8yCZVr
 pnMzDK9I4o8TWg+kviz25YDglS431B61F5IqmNq4iNzS41YinRZ5aABzLVB1eM7mg6vIZAsyl/c
 YAH7mZPmjpfnlbL1RsMXLt9nZ9nsEN6M0eLkIIed217ssvsBluSEZFa0Pkfx2KRTRdsABWHnWhV
 pGOxds9/6xxl+EA5plfVLqCpdT5RKrsL6hKVo8Lw7cie1atiWQveMGZCVPhUtYI27S9B83X0pE7
 f6cPl4bYdIQQLIZ6jfDZyJqFTKnl9TQTskL0J9RmPQqTFkg6y4tMO0EqKYibKhJ7kuOH2Z44Vsm
 5IapzzQ3ynY9ax2NPtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNiBTYWx0ZWRfX5ci7sl2YKu+f
 sQVelrHH2kEOPiqq+8Q2jThbgbGMVgrcdZVg41TP+poces1TWw8VGsRR0ykXyK5CedjxqzoiZkm
 Rv6Clw2cDY9Nn7tUQhlcphwHBL0CGKs=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85c390 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qIqPzopyQqEoCwq43hjx9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=4pKe--ygYk9DO-BB_LoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190116


On 8/19/2026 5:23 PM, Konrad Dybcio wrote:
> On 8/11/26 2:34 PM, Kathiravan Thirumoorthy wrote:
>> Update the IPQ5424 LLCC slice configuration table to give the PPE
>> and Wi-Fi datapaths dedicated slices.
>>
>> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
>> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
>> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
>> and way masks for these consumers.
>>
>> Having the dedicated slice configuration for each of these use cases helps
>> to improve the networking throughput by more than 1 Gbps.
>>
>> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
>> LLCC_VIDSC0 do not describe the actual users of those slices.
> This reiterates the diff, but doesn't mention the actual reason for this
> change (updated recommendations from the hardware team)

These slice assignments are based on recommendations from our 
performance team, following throughput measurements on IPQ5424 — not 
from a hardware team. Please let me know if I'm missing something here.

>
> Konrad
