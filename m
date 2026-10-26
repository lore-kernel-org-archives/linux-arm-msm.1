Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007208;
	b=TuonZ/YmuQ/4iYVc2W+rkPLr2FSb2U0muuDKMhvetIru5KIdIf22QyU2YChUtLey08F4
	 O2bmdFpqRXSxozrPqk+RJLfm2gAdF6cb+l4xywxFLaDa1jEZuVmUjkMeveGMk1ygmBp7+
	 FtqUCVA5KPZsmUSuRmo44TzBhDq04Mq0U4pLSHdV1ueu7fqxhwSMOaN6SgbFoBRKgjc3E
	 GAt7kifTdJn+wC2xWg1HttntPi0AKZL4JeRT48vk0PDlGvZOKje91hltNS4AQtJG+/M17
	 xxSyXBJhRAmrx9B+SbT1elXjiUdUg4QrBcQebdbKpBzVbYzKA+imWDvGf/aqGkd+p3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
	b=Fv0+lp3sNBR4z4IY+v+ClbKugDoOOfhVs4+1fQdgj6sOekpq7VIklwJKjB1Rq50nPE4u
	 uKw2hYn7r/U5ExFb6PMQMlUzHCXUdhhlibbFTW4NS+kxeBguSQiVKvDvEWQp6j5iXV5TE
	 sYGSf7tBbLnvozuLieshE1nLdobs5qxF4cB6pXlo1RJ6z02V8R/VC43pkuqZ2wJ0ZGt3G
	 B3vCu6FLTjUBqECxPXwwyvLY0RJtPUQiDudhrNBIjC3teBh9h7gmi8bBNHgoQugVI59Uu
	 RONcwsTdVePTWcy3No9QviONqkfehUzM5l85INFPxbrX6l6StDJH62SxVyzO90jOEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U9uvUfmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1G+BA4j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827C9606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827C9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U9uvUfmA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1G+BA4j
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4atZJ2255111
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=; b=U9uvUfmAqTvW1Kft
	zuqxAeqbtUtYq1O/K3YYH3qteNs3QjSLk0knW0j1v/4EQiV0qPXt1xrUNTqxuux7
	sBLbjgqVfP9MnfFRmaNM+UyGsOrQ8ToW25Xer2ztcNpmVR8427/kMCCcYpu3MwHB
	9TxwUkkOQ/jxuYAoPwSwdPrqBLqiGLNFQR6gTIjXfVt/by7Wiss0CEnujQqE6RrF
	V630GcmP+gMdozEAT7Ie73TZprMJUbBAhCEi3O2bxhBSsgeG4Q6g3B1LHblUv0EI
	R+G/9ca3LpPWS+fTlXrNeHxIiMnJPhiCSnxTJXdsjdqFMdwKPlmCVl5/zdRR2GMx
	nEVElA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3np8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:33:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53635fe2335so2876831cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007206; x=1793612006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
        b=d1G+BA4j/gai5g5X9Ae4hNeXbsFQdQA9etCK8NxN8U0Ist3XKo7lS3DitRhe/soyGM
         X0VMb7grEAe7MAtYUhiav20Jpx30P8/O2LSXKi7U95UJPqvJui9hToULHTH3qY0G4ztm
         hWmdF6FO3+kvOZdtj64na/EXaemi39grQjXKChRBnXPR/nCmI5qU0YdmwBODLao509Q+
         R1WKgkjlWdg8OsqFuh+2buHX0neeF8mPWOIhGq6ciBLrAa7Nl0T2NeI3cNC9jiAy9SdZ
         5rjrquQJuQRrNf857sawXgWYlnmnWaPtoys9HFMWL1MM4kl1/a0Neq2gnwCIHQgzwBW4
         Dt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007206; x=1793612006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpYg908oPalWbYc+H1dirfywabdU7/Y8XdyQuanQWwk=;
        b=i8KhWxswMD9MDy329cXbwkRRrN5xq6Mt6WNfPSPmHGxIzAyS0MezfoGYcnIUKS/MaB
         AKzTIh9BzvEc7YYhZIjS6ECD8EAWSC/QeB9g8WWVCRRhEvmadNYm1KoAu7w9uLiFBeBw
         pwlcKwZEsQfJ2tXAUtz86hhymwwndbYCc6PdUisnMV/qj8sp3XZ9Is8Ds70QQzA6fsub
         Bayf5Vr0P8fvLpKJk8r9xS7MyDCaPDHXF85ltI5IsryapPxmu4fNu4CnDTzS63DzzOo0
         toS52vAmTHtMAG7z8eBr3oHnAkRug/vo7+v4K6TnWY7ZeetBkA5nS0DBF17pRlwN5esd
         01Ow==
X-Gm-Message-State: AFq9FYLPTXg2zymKokKUr0X5fGF2zGCqrZLKXWKVw8jawjFfiHO62eFE
	oj9qoqaS/5xskAD9xci1XzMkr9J4dakKpKj7jB2dkQOP3n1TIpJjG1pQEZPxf0rxTqGffqxc2pt
	BW0XrgQWVjiOExNEAgV8kJI63jBfefAKTUq9uDEJLhgzbQhf1LUPDf05ofRK58uTcBgHZ
X-Gm-Gg: AYBFou0MldFU44h4YZLQMtdEejtRFVjhTm7zHewf42oeYBf9/DA2ulABdpjAHXK0RzZ
	I+y67CQE98EoHrKuh4jgxkN+OEtTiD3AIMeNB4t+5yrbbJaD4h+aJu+FlUC6YfgAJnM4DU5sg2X
	Ta+YVcWZPOfkovbhdu7xIvbmexCpr7/a8UoX+N8dmokZRdkcZlrw6mTvmJC45VVlGcvy4p8TgQq
	3NwoHw5vA/o4dMlRy0noSspuvuxy4EY0GEW0jm7FqjR5khvjKKIIs2DZVfrO/IZSwJ4BxjO/nLN
	gJ4MtmTEKRq7XiSPWcmr2olck+YcWxEk+O8MpOKny1bVGBa5qMYnsLzGguecwzgXMigQE/0DdtP
	Q3DdzqpmtxRAcE3TtzTlrRQ==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr888589385a.3.1793007206477;
        Mon, 26 Oct 2026 02:33:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr888586085a.3.1793007205884;
        Mon, 26 Oct 2026 02:33:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm297083266b.67.2026.10.26.02.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:33:24 -0700 (PDT)
Message-ID: <1ba88d77-aa7f-4038-bd56-fa6074207ffe@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:33:22 +0100
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
Subject: Re: [PATCH v3 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-6-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-6-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YVmVk4Qjn6DEUE57dXr0XTObm4HASPFy
X-Proofpoint-ORIG-GUID: YVmVk4Qjn6DEUE57dXr0XTObm4HASPFy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXylp9uxDPfuTs
 /XbVNs1+niabf1nmdU6uStnlmWZQ6naXw37O84QWecK7n9ULo3hKyt3CJIPY+LR0qaVFytzT5q5
 8Cka5xgzWCwjCHpdyZCZcxYuiNzn5kw=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf1e67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qYfICrLDSdKvHRXiKZgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXxQa9VBoob2pm
 XlpVyZh8wA0kNfIJ13fTxERwkZU08wBSq2FKHZvLZPMARbmv7TKS58z92ITBQ1nb33Y64YybUsW
 ZGo5O0VICaKCJLLnr/e0nNsAndgb+ohaTrbgs1W55sZc9jlAhAua9noPqIZbwPhPgdg/6s1E8/q
 Is1kqx9v1P9GRXOGSOPrwyJ0D3VnBOqwjv2jX8sSS5927AEytjFcWYEPICluxWjI45fR6+UqYhz
 fZNiltcCCtH7BJFC8YfyjYaSAD0rVaLB6nNeLesEyQiX4br/wsZnJ2GApKJ30YFRYH8Vr3j/cw1
 COjvy/40qJcY9b/lGMqo/CjPagZ07Apd0pOfPtMQa5KJ7mY7hYL3BpvoNyOJ8J/raOI4hxVRNlr
 YbiHAl7XekqlG1exFkXNYX8vd3ezLAhlJiPeWkcZgNLNgFXgzIb8kh22uXr9cQ/Wz2xR+T5TEHM
 cGIQF0HAujYuct5+tLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
> callback, which makes ->destroy() responsible for tearing down a KMS in
> any state between "not initialised at all" and "fully initialised". The
> kernel convention is the opposite: a function which fails undoes its own
> steps, and the teardown only ever sees a fully set up object.
> 
> Let the kms drivers switch to that convention one at a time: skip
> ->destroy() after a failed kms_init() of a driver which sets
> init_unwinds, and let the drivers fold their hardware setup into
> kms_init() and drop ->hw_init(). Set up the mode config before calling
> kms_init(), so that it is already in place for the hardware setup.
> 
> While at it, tear the snapshot worker down after the KMS, in the reverse
> order of its setup. Nothing queues a snapshot until msm_drm_kms_init()
> has succeeded, so no dump can be pending when the KMS goes away.

LLM:

msm_kms_init_vm() arms the IOMMU fault handler inside kms_init, and
that handler queues dump_work, so a fault during init can queue a dump.

The patch then tears down the KMS before the snapshot worker.
kthread_destroy_worker() flushes queued work, so the pending dump would
run against a destroyed KMS. The original order, snapshot first, avoids
that. Unbind (msm_drm_kms_uninit()) keeps the original order, so the two
paths now disagree.

Konrad:

I don't think it's entirely unreasonable to get a iommu error halfway
through init

Konrad
