Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BB48A2A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158091; cv=none; b=cxpbYXM6T6RgtOpeuWDU/pJiH0zv3T3ndkyEqo5ReyAL+RD1RfLA3RRusOLYGQNsY65DIFvuY/aGEsvA0gCICD2mMIrjkd7LlnSZG6QrPmj0bEZXv+2yG/U3pfMgeks6Oa8b39VtcpWUObrTOLjQ5RwpGabTOwr1OGZtutmqU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158091; c=relaxed/simple;
	bh=6SjESruRKP8DG2jY+pqsMyQDbVE7rq/WfjRVtxtA2FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4qCzIz275xYjkOwJKbax/lzQqDyFoyQcjwSIc8Dgx1hC1GMrIVXBJ8PJEyAjGqL9bPO3DgqkUOxSEYH9yIauqlH0cGsc5g7sasK48kpYuqPCS8SJAcTLT+ZLHh5rZrJzZ73r+NeDb/y69+Um7O1MCNFJkDFmf7A26/jo4jMdc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuKj7I5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlXbNDhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuKj7I5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlXbNDhr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1gSY963731
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=; b=OuKj7I5gRUKDMu77
	uJVzHQ+eCNZBomspfxkLkME4Nmzxezp5H8TSi5MmHzdtiIqD5U52hyTKLNmjMiDU
	+uHLZPPy6z0JcHAOj3zoj/cT2ki0edkkJeHKfkyGSRjOYxbZmnV5H/+GSZyIqE4Q
	9m6tRlkLdFJ11Hg4UJSX2DuduMtkBPkdNEFOKq9o7QOSv17DAW1WP5lhr+16pDt1
	itc3uw7GnAT9eFWFNZpiHrlGZQ5d3fHG9cKD8HtR/xquvbLIiI3HkFqWVAIobWNT
	kykIYWj8F3KE2fRWgnuX3vGNk/0SjWiFfyYC0g6sx4Ec6mSKF4WCtEX7WHmb4TEG
	Ca9nqg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3gkhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:48:09 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c5df34d75dso51560e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158089; x=1787762889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=;
        b=IlXbNDhruMUS7f9d+aRrrgSML0hIjJsI28l21K7RLsCb3SsuOZAbNU6CzcE+yWUhkg
         +nzdc4+S7psNMrLU9GWUdoCr8zOdv+khaxjkZYXDmmlCsDfae4wdPfSgPRFOo8Mz6NaC
         mQ3PDQ4Skdi3ZelwulmxVN5oBwCUEhFnGc+KVRYAYNOiwEQ813alhkXelg319fmKO9Tk
         fbxRMythIBn9A/BO1b8+lCbZnWKHfkV7U/F2hjVpwwvLsTdaALFOqDdRKH0luzkoREqd
         W+SZffI8qIrCLeMkjU5MVYpG4WYxqpxHAr0uRcKsjeJ4jsrqlvcELjh2b1Lh7Jn3iBxV
         leyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158089; x=1787762889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d8Vc0UOr1NwPvuyYBi6QHWRNEbCtofcowqpgNaVEqA=;
        b=qcrbfeMDWeMs4UBJzlMCiVHAbqyhRoZ+RaYtT65ZjKAx7cYkWgea2U3jxC9QsH732Q
         Dqb2Fjahv1QU0HtgPh2hra3Lz7EFqYLcunMsXtE9fc13IEt2usNjzMOkab59aDE8gNYJ
         2qKVr0rPP3BRblfX/22z3QOdeKz2VsMuZHk8aAy0zN5uB8sgYpJ/4dM7U+Y0sJEfYlTP
         juOm+kU6rpROBrmQ23Ul3eh6mAPuj6I+UFvRbOuXBHcWBeGo9bLz/Ui27vQmPVZJzq/g
         n1TE6i5UNtL0+rODxqL+rr6/Bxm/8pqrXy6E6bT2vzXMkG82PnOTYqkUo3tJuoDt2Amf
         9exA==
X-Gm-Message-State: AOJu0Yy729T59gG+5bOFapt8M944b3mGRlcMuM90C9xHI7RvnQndrGiT
	vv+rt078Cq0VtAUtC6lS0NH9L9vcQ2Rp89QOHht0Z/7HPOa7dlOB3Am3DwaPhLMQcuErEYkFUdW
	ULLlKG+Ld0k54qpic/nH9hG0O2cpoaPjkJODoH7f/S8hjnwbTNEdfR/ZfCUdNe7vHeI2z
X-Gm-Gg: AR+sD12Z0qU6wG76OIiqExgTGOk8kmz3XVUwAeeZQEXEiL01NR2/y4XZRHcLJhiVYwb
	PbHlNAVGGfftNCVPl5OhiWp8fpeY8fD4fccoTA1Pp4w2hedi/aLzKYcYWMtjn3PmAkytvZdAIBS
	qCmwQqFNCvimWDf4pcAjAlUlTJ9xfSU7tcBcnzxLvGl+y2SooHBGwnF5RqwjNPwKsJo8ni1H34s
	H4dWcMpx457l7Hi7Qy7ivZRis1O5vE5dia9dOlusJIqe1/KNFB2s/AETt7CcFVEMMQ38eMbeW21
	qsl2Nkk4SfeP6X/Idc7iwM8HnZtarRWkTK08sxW5QpIEss5UE0/2d9A9/A/DWeiWhGSqPz4bib6
	xzC8FeNQXlKyFi7I6onI2cZfK
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854288137.1.1787158088855;
        Wed, 19 Aug 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854265137.1.1787158088451;
        Wed, 19 Aug 2026 09:48:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:07 -0700 (PDT)
Message-ID: <6c90a1a2-6edf-43a6-a22b-acb6879f98ff@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85de49 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX8FnAHLj/fkHn
 9GV1SD4UU1Qm/6PokhiUuUXTDwIKpAW3cU1e0o7yvzipqfNCXqjLHgRv9Wdpryq4OGcGsbNwE6i
 hBX/ZUefLqRQ6O7FiD9PVp3C14Emz67d2qlZBjpIB7OQ0FJeCabgrdJVE477Rnr39wOVbuqqeQz
 vi76xliEM3C7JplvZ065UCVl+Yx6n306MzZpCkBHdqa8exJiT4aMYA4UGpuy9iwKZikNLNIOFxx
 pptMYP6/PwhGaVH7KWur4bmgutwcKpsJe3LFAXhOJzWTzv8F/KSLQnvY+c3ss/tEJmJjOExHp6U
 dbIAtf11MDVI9OsyhUufX3YRppHppJXyPbPkaBwsSKmZz1QbiVN8z1prxauGVrunUGUzBESP0f1
 oIXKzRvY+vAiFiG8Mjm3x+9faqlFpmq1msLCIwQeqQpvSQ2hDH4+or/Wvi9Ybl0MUehOiHEJfDd
 Ba/sWrmUQlzeNj6s/TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX4thbANC+tQJ5
 xXwl0cVBwGmYDFEAsQC67g4QDaxrfi6pVmRVblnILBUlpPfQS0xvdewRoFpX7MjcqEnWTP3DVKW
 egIhV5IzMpyNrZlMVn1iM+uNLN8HlCo=
X-Proofpoint-ORIG-GUID: A9dl-jenq0VdqT7Sd2Cugx4z6t0qX_G2
X-Proofpoint-GUID: A9dl-jenq0VdqT7Sd2Cugx4z6t0qX_G2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
