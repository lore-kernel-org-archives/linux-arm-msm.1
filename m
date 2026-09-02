Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E84A8A28
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366290; cv=none; b=rfvOeGKhNd8JBlQyC82cb3nrXKqAIji1hxxYyNHGMPvfM+sTsTeNsq9RG8xMUU1fyhNK0L88DSw0gJUGjYhYYNWs+zkanmZjbbcd5OEEEXbTlaGnzLbm/GKM5ekujZ/mpqobkBjv8p7OIY5R5PgeXwDwEwfD8YRVQcF9K/ESdfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366290; c=relaxed/simple;
	bh=94m/u68a/RZASpND+pjgfMX8ay3ZB6y2ddThk+0ad3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeEhGHEkN6jGlzF4HE9fDmzSiCd3yEa4WFMW25c+2wqf0VLW5IkvxAkB9wkOsfwb2K5XA1wbibirkUta3iWU/nWvd1Vg96zjZR5cnj6zrCPXUs7LaIWrs6eYpa8fmp/QgAFxyPKegUv8sR12yJsuUDq5Dj6uitGTrJxUqI4UNLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmHN/oiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGGYpSVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmHN/oiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGGYpSVt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZjTu1409772
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=; b=GmHN/oiHM1xjEf+k
	QpbNXMORp7H6+LqmWT1YF1cyAWssb9ajawmNKVygvsRHcqegXWa8SBwfDwgjCWQI
	hA74CLC/MDV5O3VIOrFVvoWZpMmmr/XQPXyff2TtZa8CpJBFua1roUsJjyD2PgJZ
	K7FILWcewKR8MynIvcbWXGMgIyKcfQZ5e65F39uesvYSYeJi9xbPqWSeU8vp4bvc
	PgvxzC32GUZGRj66j410V3waODLqaFz/xDefEaZztLy5FNkF6vj5tBf2/LXR7TEO
	vSYfTOeNAnhnYrF8hhwDOJ5UqV0oE6vPMq3FtB+750V0hNyvlHxruZ015yunkhpt
	5EudPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8tn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:24:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9392788b3f8so32281385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366287; x=1788971087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=iGGYpSVtHTWOG/N5sg91RH/KuVBTYevSX28naQsVqrw0qvuCgLno94i5uqlXm/ZtUF
         DzqCpklhoMdeuMhrlxaY8MifCl6s8axbWKRUDgsiHSJxlzEObcdsDjvMSYyV0EpTTHsR
         oHnS69hWDxKcATv3b4Wp3PvonUjjUQ/hUxBC6QPJD9LVsi7pSux7W5hkzGEa6qS0l5Lw
         bm2M4jq+8Q215prEPX7oiE+qLg/4vcHTAywsCt8iBLfa2VGTrD689umMMjXGM1AA42aa
         ytI3X5wjhyxb8FBkbDRnPUjGx1TzO+Yl6WRXGLLsKIT5vhMb1gLDZhzf2dtnDHIHJc0x
         czOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366287; x=1788971087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=rzP6TspA093pqLJW1QDX0bTxdK1udqDHScaUXuRwbv4yF9RCUDpvGSM5dkihLiedpi
         wDNJmopvFXEOtsXzK1w2lWVGFpFqCRF02ycrQWSaY9TOzFYwccrF0crIQLL4lYGW5NGD
         EvYdEBiAUzvYONBW0TVbs8vgXimqghXxHf2646b3HqZN/aR7D3bMu7M3afQBZmcJgCX3
         Sdupa/YCj/drGOJTMlote/HkfrgwZRcTnvX77RJzLX2+0YRskUu4zlDWIkzax0Ck7r1V
         KZ5A4rGJIhq7XG4Ye08yXvtGXIPRB0iPMbaNes10wVcGHnOmkS8mxm+FWs0qsGXIx3bZ
         bKqg==
X-Forwarded-Encrypted: i=1; AHgh+Rpdlyqb20EPcWr0efZP7m/dbFUhmsD/E1VOaH0sdtdn/aK72aRHqv4nLRvenA/HZ2kO7FPfrOVCPrJLUpYh@vger.kernel.org
X-Gm-Message-State: AFuF++n6nLmqAi9tpDLSpEZYJUtXJYaKP9b6Gg4dB/mHFpk2ffrweFGT
	lu6zf34NmPgj0jnSTFW60s/bQdiUi+EZdsJ/H3Z+bdRuWZbopSQjUmXDl5ZvsmaWqCJtXS7M+gP
	ptrWpAX329rkUYCRIKIgrYmutRsY16sSRuQw6EjtpVhp1U3BlrFyGPsspkpGnIRwHxZGV
X-Gm-Gg: AR+sD120RzCAlElquLTmbm15mI30Ku74yIuRNRJOe6U1QRJuQCyunlQCprDmjofokw7
	XBmqE9McqbrU1Hh9aUQKuCM3lDizVGO5ooHHGHkZFrcaxVSHZyZ3dHzw4ZTAsihFrj54bb6AMwU
	htkcpG52vlbEqnDJu5shvCnXHNFsObKpMM8SqmIxDPFxGKOJI9V2KegVIEtK1d95iSyR2+m2S6n
	lECFv7bGvZcJ9TiwtU2BdgQDqW+sLGNx/gAy9obi2XyN3rpncI2cyvJMKg3mtXNdklv6MNUfLF8
	xU35rGoFoUZmYTujSa+pROtQaGvxaYRE9l5X3kDf45mcneVKeqWIW2Rp+u47eSE+V8t9s5dU554
	ac5RHiB8erzo7hu4YFCfvTQ==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400250785a.1.1788366286572;
        Wed, 02 Sep 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400244785a.1.1788366285891;
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03f4d39sm163008266b.47.2026.09.02.09.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Message-ID: <364becf5-521f-43a3-91fb-011e10bec998@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
 <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX9shIYlnwXrAH
 JTXoxcl/NbvwsMJXuQAPVUq68V9tWbiR91w3Tq/vMnYXavLkMK/kHnwFz+Mc9Uioa4izgPSxkor
 WrXY1hUiwHwg5SuYNb5aUJV5QNu9m+9sj461A3svPjzgELHJpw/8aUDYVoJSv2q/qf9F0sQmCDA
 lkT9mECOLRKEMW1hCEAveyX5Hwy6FlU9fhFaGjih+4JNxe0tC5b88adHNN3Z93l3SOKir8w9Rvf
 0qUjAWdhBQBz6QS4A6JhJI+l2x99DB8DV86zVNSd/quQg7I+bhLE7VHJZ3my1WCQOxOjBJWdnEB
 bkT7JJUxCw4twrb0UO4STzfXal72TcIdXb3oLHgRJsHlZKuppebyWYC2w3cHseamjUwj/LrqYIr
 xHjVkisbHh9ghq55KjUwGlwly+fkcD6VEUhQGBKiiN9MpLqbbQ0iGU+qykGO+dEaXBmknyv2JBM
 7+ycZk2LnCEpmCu7Mew==
X-Proofpoint-ORIG-GUID: dGxO-6C4n_kU6_q7Ihinc5d8UnWZI5BV
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a984dcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEYaC59VNbqAa3wHJpAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: dGxO-6C4n_kU6_q7Ihinc5d8UnWZI5BV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfXwG0jgMZXemRs
 0hVc7/pY+2XcMbo+je84EeZB+998OY1gtonsKPKtTWfqCf9Sr4978f5GKIrf4r0OqxkwgPHWbz5
 ejCDDfAypbMeyQTTHYbfOzwUGJxeQaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020144

On 8/31/26 5:51 PM, Dale Whinham wrote:
> On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> Let's order the pin nodes by their gpio number
>>
>> otherwise:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> (Resending as plain text, apologies)
> 
> Thank you Konrad - how about the gpio-keys { } section, should we
> re-order them to:
> 
> key-vol-up   { pm8550 6 }
> key-vol-down { pm8850 8 }
> switch-lid   { tlmm 2 }

Generally if there's not a better criterion, nodes are supposed to be
ordered by their unit address (the number after '@' - none here) or
their name

via

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad
