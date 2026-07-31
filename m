Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777644C666
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519157; cv=none; b=hNegOClFOJ9rp+HZpBsRyUTa20bUO1RpQzUw2T1SEjeXY8iB589Ce7e7nTo6JKRv/61GTrN5VQEULfypreNdoRG06vUwYE/6How6OKmgXHMa6Dkao790gf6iKhMkgCbtO8hcuONQ/rHgEp5VeIFhoct2a1QHitaYaVopeHgR26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519157; c=relaxed/simple;
	bh=lfiBaO5QGv6Lp1bhosrvX2pSIoKoq68SwookOCaMwlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0AnoWH00Knvi8kv1AaoLE1BYoRyxc3hfWJDAzcj1olcjKwVQfu75Dvy+WuOnNScy6ZL4jeOsAsYTbnZBAEkmtEqbUdT9+iSfNf1X1WeOc0fFUf0KQmpcLi1scmhRYT6x0qtEJ+SF65EqDDxxKl6fb/wi4jsxbZr0euL3JaX77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7Dae6mM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A41hiLjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7Dae6mM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A41hiLjN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOMgt215256
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vGxhq2ex9tSeI+6MBOrQmpyMTBbgvQgQ2jOrma0YmM=; b=W7Dae6mMd7B8Xguk
	RCs7+k4O+sXWGrgAjIAxLuiBo49HuLHLBYsdc9Mov4Y9fYHnomOHeYJsEi8XRtF3
	R6azAPpoZ0OAn/JADMMSgIW2njDK0rDZFjyPR/c8iCZ3YsufHCD7apznH0e9BCC1
	fahzVxEUYFW7Zdz+5zotT9gfC1Auhzg+WQn2iTsnoCDk3xCxZtRCWnBkD4fSvHLS
	K6rj3oU4HNil3NzJx7VhcxPquWx9OHakelvmUtIYFm4jQRVak+arQGqvyrYmtXEf
	qMkzBaKqF0bM1NT3GjxenOXjWRHU8yTEVu3qyvZZgeFqpc4U+YoY/BVy5QRHktFw
	T6TQeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frujusgm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:32:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so1873131cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785519154; x=1786123954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vGxhq2ex9tSeI+6MBOrQmpyMTBbgvQgQ2jOrma0YmM=;
        b=A41hiLjNna+C13tG+zKPc2qcIQ4yHPUlToC3iOMaQnaV/VlfGazgkFwQffkiGBotsF
         5zponvme8UOf3tsqi1x97NqK6BidAYYhZjYIS3SEtU7yHLK/YkaomiYZ9rbHr+yM4xPC
         NG4phBzm+lVTfQ5yySnzjk0UBJqIoZwvOt7YUSkuvKz4aGfYygVDn7XH+iEmqOLgGqf5
         fICdCR9OJpWjDWVnQl3As+W8INDt1T4UZA+N5Q5FV+9SuT184wn+wCFEh7+8P4W5dU9/
         oVO45oai58oEO8c052LrhNW5xJKZnbIEX8SzcMnMF1iWi3boMvMUSGqYpI4fFVHWvCn0
         l0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519154; x=1786123954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vGxhq2ex9tSeI+6MBOrQmpyMTBbgvQgQ2jOrma0YmM=;
        b=nMzZvVSQIHCwkZPn92R6E3ZPj5Cld785xjSIp+EcIXQlAbis3ixX658tBqDWN9+uq5
         IziJzughAk1/Icox2s6O51/3R5+HtgS5Aa2MM0ty4RjQxDLLxRlAp4s+Jgk0G1kuZkM6
         RX3bJfx+5rafr54UqA8tfFt7dE3kgH0OA2zg41TGC6JW8msnaukqvqPvMwEt+vlCxxCB
         lcoDt15D4Fdsuac8iBL35dtMnOlysB3CA2J1kicuvPHtQQCwSANV6QiCAFc/4odlgqWv
         ClfvIWCYd4Z6tkNbfohTMdJdpVGrApSO9DiY/NuiaycNlMVjBBsTBA5tlC037TdGKcE1
         Trkw==
X-Forwarded-Encrypted: i=1; AHgh+RoEP3NFcXhL8MOHIoCv7UHTUctL38T95jLXByKDAGszUfGQJxgqfHoz1gUIfkXWaVMk2v5tjOyvOLeXgf2m@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMcofUDiArJoLVP+5d2F6Tn4WsGk4Sk6LRBszU1tslFElduQK
	ooIotAcPhqwYFQ8zIlbk8LlEfbSScizAzBaiDe/KeH+8RACmoAyYdjlMsfYAPKjdmh7FbJiJnb8
	xm+gv6Cer6v495gV3oE3kq+P5F86Tnd6OaPSpXNXg3JShMhYRUsS8iyKi4XgdX/BMy0jd
X-Gm-Gg: AR+sD13Lm3G6ag7Ku+f/PwkD38Wtz5DvM7F503t7rzsbaRibv8pLqM3JeKVBtL7tI/W
	RqMTIVEUfRh2+Bbzf/ywZil6x4axWKRbler7HUesgiaDx8cQ3eNXKhSxTN9E2lW04XbeD7exhKg
	QbZ5yvB7eG9LtkIrNlDuT0wdBRYUBtyArvr0F4Q5wTTY3PeQyyVucOy0UvehJBfLXzXOV9bZHjb
	uyIAcJt1NtPSFN2e/KXpBNaFe36Bl3sPk8wGDgLlFYxb9/slvFAsIxNGxzmXdBrbfV0JQ+lf7Fi
	pZF1sdYwu6t7dJyIrbJDfz+y0gbFCb1NoYXsxPOuK+Ivi6+b3wypPqXc26PG8WMI1hF8ZzV6SYH
	a+7cHEFuXVR4QjF3sRGRRE6QQ
X-Received: by 2002:a05:622a:e09b:20b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52b567c681fmr11518641cf.3.1785519154213;
        Fri, 31 Jul 2026 10:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:e09b:20b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52b567c681fmr11518191cf.3.1785519153665;
        Fri, 31 Jul 2026 10:32:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4454321sm210966466b.31.2026.07.31.10.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:32:32 -0700 (PDT)
Message-ID: <7cb43d04-30b5-4c92-9ece-43847a166e0b@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 19:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/14] media: iris: Add support for glymur platform
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Daniel J Blueman <daniel@quora.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U6Giy+ru c=1 sm=1 tr=0 ts=6a6cdc32 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4jJV9Or6y_G4DHxeOVoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GKnCIqSVlKSMEckld9f7SIUpasXCm2W2
X-Proofpoint-GUID: GKnCIqSVlKSMEckld9f7SIUpasXCm2W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNCBTYWx0ZWRfX6hYlP2Y6SLq1
 1Npw0GuAMt4fXaiBlUzXDR6bhZLR0fUmaf87y42v+L+kciCQB/lT2wzdM73ToaKOwg6vo7A29m4
 u/GzLFprsR9cEOccvlb72ple3oEhshff9kqxxRJAvwLpj4NgFIeBba/qAar7q7xf8ouWWo3IpZa
 o3uF22dSvvEWm/zFEHbdwJnzZ4yr+Z67O5fqHPYV5b1nZJDeKPfsirruvExX+sZRpLGA8zu/zng
 pGGviqynCR3twlUXBKAgo8N9o/L+pfpCjMb7vUiCiDUKLxnZcJSqndehp+82cFZOF0AG3gYw9HU
 84leadWcxTxO87tusQetE47NeN3LbJq3FBqlYTJYtWlVKu+HafCwYwMkiKM0LEJisj7wr9h7aKI
 PdMG3+vsKVWEb2n7xFnzQM4oTLDOg5c+A2Y+VUDFzpo7RDK3SVbqoJgcoZK5GI5MDTL0oc8cQmD
 a96Q44JLjtUkWErXPBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNCBTYWx0ZWRfX9nuUZkqJRIzs
 QCmOpunHcEVtZ8TtbutFOLtYIYvv3LWLml+LV6Uof/lcK5mO/+IjX7KAcyHSio4KyjYsPirUUkH
 2o69wxYFZbjPStMb6sze13LXOtnec8k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310134

On 7/26/26 7:49 AM, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> The sub node approach for representing the context banks (non-pixel,
> pixel and firmware) was discussed here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> Following that discussion, an RFC series migrating some existing iris
> targets to this sub node approach was posted here:
> https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com/
> This glymur series also adopts the same sub node approach.

FWIW this doesn't apply on next-20260731, conflicting with 
the change made to iris_probe() in:

412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")

the following patches also conflict

Konrad
