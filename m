Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4DE38B7D6
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633141; cv=none; b=c9mjBEXMQX1IN3V0zEhOZ3QV3LiUSyxPtGu+o9iJmZIfPOV7sT5pGKohSsMojB3Dl3g+/vOPlayn2+Mjtvo94YhqtCfM3eMByaCq6InN5yTu4VVEFn0JR7mIlS+3B+IHKx3h3+rwJbVd/6ZKMrIL9Z+a/+HdV6x0Tgr2TJoqcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633141; c=relaxed/simple;
	bh=svLOB8z5R/BwyX89ta2NtbKu793JyHL+NgAfeilHccE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+3kEM8A38e+dkCfFRB2CStpRk8GYMDNLYxVjoNPlvmDj6QQf/H+8tPFp4GkYb5MQsGiPSnqRYd4Zy0e/J1Pcx3eTZN/Stds5gzN68RGu5F4ZmLyCugtbfKA7r2EPsyVSaTjrMSm4ufLZVCfzlrPC+Q0ZTSMAI3NcBYgcsvfies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeLs8jC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3Mttbhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeLs8jC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3Mttbhd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685HbK6W3777980
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 18:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=; b=PPeLs8jC4qKtUTmj
	b1S5Mgsi5rwjGyyfBKaL1nbEBRfURolCXjx7wCfu6Cq1lWAhinnfaXNJM+owOgqi
	eBiIuNy8HC0MHr5IjPVHkrFu06MD/8KuRLRDpjovaK6Hq8o4g1IIaOvBCv8YYVJJ
	1cH+gb3pMu6RjF267O/5Z6a+QV79+DTeZn/6ppTSY/3w/vL8Q5/ijy8mDJEXOKtw
	oJSI5ypFfcBuTz4Zqb1lddW/MLuMlVCJFjfDYhFhDCd8gEUiDxSAIMOGffDSRIyP
	s6TJj3gt2YdCQ1QzOex5CTJa4u9kTqfh8JOVjgCxTn2ino1FIuCLRgpyz/+AlKZ/
	anx7eQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga1s24ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 18:32:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8627258ef60so1051496b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788633138; x=1789237938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=;
        b=j3MttbhdXyR07esdD1Gijz64KL1K/fZm2YpGLUFLsdI9ceMvv3Dgxm5SW0hEHcw1l1
         tLPRetaB89uc0TYGp6lqDw8+FE5eenauN2JjWDyxbPQFwXv3UVTgi6tHaBE55LttgHH4
         /CL1Yt4avizhBnstsYWzdb5scgFKw10wMw2J898iZROt9K33RgXbcdenmfnbwX3DEJQL
         aB/oUog0pr5CNUJKJ4avP3wsgCcXnV7A2TLoRgZqByGJSX+H9Jf0Nq4Ipr22c99qoamg
         eWG7S6CKoVpq1GMDU7UtLWcAXPCGL5aUymzw95uHpi8tVlMCkYw9Y2dnT6yKYoaGpVjS
         oRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633138; x=1789237938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=;
        b=cCMhuvdepx/954R8DRxfwHB6bRhQotrPYMifEOjMiE/o8bhD1y1/KBLqusXZ6D0AP9
         6xcK/yJ6H+FkmS4dKb+ba/nHgOQaF49VwXEDecArIhDKTqCDS49q11YUlpDEKsnHDQrK
         PqvBn9QzNVaVM/TxZJz+WaxmwAKA423TDA7em0C5TP5mUQ5sK5j2/0lT9Q21CiG3gxuh
         mdCPrXNIKFccA8ACHrqqhfUPl9toeVLDIQf3mbWJh6F5e/SO+D8dCSrf1c++8O3U2zwq
         HmioITa70UgY8R6Am92i3qZ1BkWSX5iVt9pnWVbnQJV8ckBAKkdox2QhIIif7VPz6y6X
         fqYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMBxF95TfWpbGjR5jZLBzLaA6l7UYiqFWXq+fkjjiY1ekxswVjH9LfY4iPR/BAiIBfmn7SmecHZnbPT5Vg@vger.kernel.org
X-Gm-Message-State: AFuF++kAGFEN5WtA0MHz4YN/4QRbmeCwuDai7fnTN5ny7Mb3F5VlahlQ
	P2MPOQwAATTtM69XTLDms27/pNybcjfNti9QoVypdYYshXepMNTTa50RLjUmJffHTSy3kCyWQvD
	DN+52TmppNgJFVDwmJctNOM8CMc1VaVdxPXfI83WB0kQaP3pIDs5KJJ+noIQvRnyziPBN
X-Gm-Gg: AYBFou0kTmq3Vhrra2pEwjaZ4dW9GP8Gi7E7uGK17Bi4plIIGa5BoM0ToKNnqqVoGhw
	wYFs3sO5PP3KQH458gv3gLUv2yD5g1YVQB/3ecGNvcHIhBTSDOawzHLQRfCcXHi6Am65FwcHTgr
	RST0NN6OUMXsEF9YsoWspwnAYhWr1BwGLFsykhxW9Kqifv6tpCPSX3bHFB2X57zZb6mz0I7MbqR
	qUmr7+rSUR3sa+IWPZRYodHPxORPA8F2Um2HyYZH3vzmRcU0690fars/BkZZL6Bc5PJZp8EMitM
	qLqNRupttTT7WzD74PolyixtI3XphInMtowUCS/kl09xlm8Z8/rNJeWncD5wHwJJeGxK+N2sx9Q
	vOk3e4F5448ePe+hVu/JFxCo8c7qBx+UmI54ZexM=
X-Received: by 2002:a05:6a20:5681:b0:3d0:5305:4fb9 with SMTP id adf61e73a8af0-3da39bbfa1bmr22943682637.7.1788633138015;
        Sat, 05 Sep 2026 11:32:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:5681:b0:3d0:5305:4fb9 with SMTP id adf61e73a8af0-3da39bbfa1bmr22943633637.7.1788633137626;
        Sat, 05 Sep 2026 11:32:17 -0700 (PDT)
Received: from [192.168.1.14] ([27.34.253.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm17250412eec.30.2026.09.05.11.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 11:32:17 -0700 (PDT)
Message-ID: <c7282846-cf0b-4a7f-928a-7a0d12e88153@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 00:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: use 64-bit SMD RPM bus votes
To: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov
 <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a9c6032 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=3XoJp54woHZrTNLqd2i5nQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zrAAXKNDYC0mzo9CIGYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDIwNiBTYWx0ZWRfXw6JICdGsFxZL
 SQRblwJlIHgHj1x0zzLMBEIMvO4QG9IISP7sSta12+FTvr19NJjSSAEeJcGY4hsf5olC/RI1lYK
 8XJtv5wLZtD14gkaZxwl4qkUI3sJdcQ=
X-Proofpoint-GUID: GV0dMZNaOKcfx-k8oDtxnfx6zLC-Fg5j
X-Proofpoint-ORIG-GUID: GV0dMZNaOKcfx-k8oDtxnfx6zLC-Fg5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDIwNiBTYWx0ZWRfX2kxI0R8FfDNx
 PvMx+HzE2brYqj+ruGPyA97h2kEjy1ISiD40G2ZdC9C+faTi05JXu+e0NrrjDvG8oArb2hHy9YH
 cdHJ2GSgvkYgo4FUQwZGZWkiaz7nlTzy7gdolqaHNecv/20oCsaCVISsU5RT7jUf4OZjkC1cQIt
 WrWPN5xJ6XNjhjwUQxSoR4oSPRHBF2twnzhdBqltH+2GxrjFwm94XHE6Y5IKZGJlnVCahNSyqVs
 F2+Kidq+rf0fvm0rzyWst74GFdKEwIZCoP1BqVI2gxycABkUSJejsHsOXwN6yXrRKjcVlGdh6xD
 STlnU51ZEnZLLjR4CfL3z8XLvlZAxIxYB1bgOlQJeALmvnlt1q7pejVhK+4LYHpm+RwgwmttZay
 24VRq0ueBECoDE3TYt7Gdg3KiG6bM4/lgBlUrcBNr0d8nfcTKYyhzaO8FwriIqqLNrnV3yNeDmX
 y5XbY7QPQ6dP2l4Shrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050206



On 9/4/2026 5:25 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SMD RPM bus bandwidth requests carry a 64-bit bandwidth value.
> The interconnect proxy declared the KVP payload as u32, truncating
> votes above 4 GiB/s and advertising the wrong payload size to RPM.
> 
> Use a little-endian 64-bit payload and accept a u64 value in the proxy
> API. This has always been the right behavior, even on msm-3.10 and
> 32-bit SoCs.
> 
> Fixes: be06f8e7425d ("interconnect: qcom: Add interconnect RPM over SMD driver")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
