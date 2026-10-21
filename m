Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561905;
	b=ZMdr6om1EmirdaWih0HhX326OrZlQgGQf6rSLdUUnhhILoDxxHcyVm8P5YWd1kCEk2Nq
	 gayWY8Y2GlhzktbVb//SwaEdYG55iAHkgbVPbZMOi+ry2qDpQXphTmLI40nCWWoEE4sW1
	 OYKLLSH9L1koKo+iX0SL8VArTSV2APqtms1YoRaPeowbbTGImaJNqg86K9wX5lUxXqrSE
	 z2Dm/CSt2IFdrRvejdZaLoklcRyVmI28DucYlQp2sEapviqAytwDL83G4p87yZ6W2Dp7X
	 I2N9T99VlGVX8ccGEnUX5GFZhijnM/Dq5bdjHtuyYq0ciiOdsAXCv1F0/QimN9x30fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
	b=ukbu96h4PT0cjr4yQMkWnQqFC5rT9GfG9ef6Q1JYDDTtR7x7/AxEoC8qc7vg2Y3W5JBV
	 V1wlOG5F11ysqt5EmwxA4c/k0I1MY6DJ2HLlssJ7rsJ7oLJbUkwAj4pg+M9lBwDoqWmRi
	 QF3NUWpZQNBR7nEhgpICNQdpBmMkaDNbrPZWHzxVOZmPV+oZY5UxOukLd0AErQ2xUW7lZ
	 HffbRMYE8JHyNHhxyM4NddHgGvSkmW7JcjV/IyWuthLSrLgKUaRQ5cTDkyWgqjJ48zXk5
	 s2tc5bKL9ulzTy6TN2myscTOAeBO6S3izEWRuIGowjT6qyneNwcfZZbHX91R3k1JwBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYwbCZUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhkjBCvy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BD606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706BD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYwbCZUx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhkjBCvy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0ek756343
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=; b=AYwbCZUx5ANMu15a
	n5Va1u/CwFM7vsswae82r7jxn5B+VXbvm8EHB9CcpU63AGNu5rCFyXHBDHkC67HE
	JbJN/YORUCvxlGnLTHIUA5GO8wMIHfh5dw9ZMh7iBHiQwuHSf7GGa1FzP0k893/F
	rl/jjGT8a96Dovyx72/nJzKg/JHZesB9zNccEjbOoMFP8rpYgwhmFSkJna0RUAxm
	JvkSZ1I7Qipimj1p/ePYzofvvkvptJFrGdjyDdm4X376tF6KVKDtGvAe0gv+RcsL
	WT8sgad1vvwRILmIRTthsVPqhRQ1rKZF7a53Z4Y8NNbsA8oFaTqS2tmiQws+jpym
	csXxYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4t5h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:51:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so4165045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561899; x=1793166699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
        b=XhkjBCvyrxwBGAz5xP26xeFUIo2gc4mqrxsbi6hT9zWVvIfGIDf5NEXR/SpFbaFvtu
         NuKkDTC6Mo8UCq8oqq0MNggsp1fGN5IoJArrWCLQOzGanAXUdEunkGekp6hB7iJVrT6Q
         FW+qu15m+vYRp4OPvVJUshoagtaSMlXOLQuY4deip30YRVvLWqQf+2pWzUcGgmij9tZ5
         phXReThPW5jHkhILsMSX2ZQQ9z7Kak3c4Zg+eBgCCqoGyawc83Ej85d8n3ac7E4hFNdl
         y3hXoDSRrQZovmSGypdliBlfQYjhwyzWQTeZObvGXkYdB9rH4lGbVuo+8P38wmCZGmE7
         L3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561899; x=1793166699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P86U4g4HatT60Cwqp5YLLNb1rgi90YTXNNoTgRjZESQ=;
        b=xtQt76aUO404/f0gczB7tS1MYGYiHn5whDKRHLwS8Q3YYjrUuNQDBh2mfHo5JCA7y3
         a2Y0yfCfGEiju0uHCTxMf8CBB8mD8hRB5Wo8Y1BbtQPk+yMV/tw2lmZyYkrYdQqPC6TF
         7HxofvgMErlhTIH9kK2Z4hwIvE6fHdcXruM7GFjr9jVNKv+cm7YJxdxOCgHh598PFllQ
         jslomiGthwj8jyWWMWx1QJUY9I+cU/T7Tn/tGbfsJHn4JtSK0f31G0bKyKZJEG+IvDdM
         qUwlOUbY0vq/ytKL6MqN6v2bsCAjttahuXYNoZ5JSxsnnraAm/5PzD/fFq9IetZoRYaY
         tTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsnIi2WeEuthB3qN+WIYG527jPXa6dSIX2553ZRmRKwToq41e7tos0sEU2BOmjb+AvUYq8rsT4yBVzikGH@vger.kernel.org
X-Gm-Message-State: AFq9FYI8kmhIpkONOnfz+xJ43asncpBt3LrCYhnX8i8iw42s6Y87jfRn
	nTRP9tD2AYpXaEGTdAI86dPSewYQsmoZfEHWNNTGP+jspgs+CrMLGT7SesSC/Y+VHykn7wr+9Q2
	rJAj08mzexVMzcmDNoWi/MKt2DS20FUp+2TYXTyZi1AJwr0fPjXbd44sk17KL1F58tvdIuoUF6Z
	P8
X-Gm-Gg: AYBFou3fnXAVVVjMIRyFIsTw+5geZgHXMLjDijQQJSyePAr9f6DZeEh5xbFDhMcC7NK
	xyqMkP2m9M9oDY8xKywNuRsfLbgVHEuLFIGWeP6Xm3tBLg0gzbmjQIWX3WkoVDUuT67Y2cg0MtQ
	7vIhuqNWqXsNSaln4INImaBzOfzjE19Sx2B5hbywVPVrfPWwTKgQWISbMJGiII8E6AqknrrBXyT
	PvkyRxlPJ+g4+EcG6dbK91D9xdrIK+APNIE0EsBZuGQrtSU5JDpFYDcWW9MJhHWqOtYPeQEGvQG
	+eYZHmBoN94OLue5PCCjkHJdLVI1GBanUbYSP1eLra9VGHuOzKZTzqJZSwR4d0rR0NSJ0f8qcH0
	Ek1loAzHMlmhob1kGpdAoMOI7a8bfRA==
X-Received: by 2002:a17:902:da83:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea43d3a1abmr8645335ad.15.1792561898972;
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
X-Received: by 2002:a17:902:da83:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ea43d3a1abmr8645205ad.15.1792561898506;
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm6217035ad.69.2026.10.20.22.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:51:38 -0700 (PDT)
Message-ID: <8896d867-dfba-4d63-a0f0-5686c572b262@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:21:33 +0530
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
Subject: Re: [PATCH v4 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
 <atYZXRLf3YPZhiNB@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <atYZXRLf3YPZhiNB@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5ne5jampjIFljJrrhJKVu9YmMJ1h5MYS
X-Proofpoint-GUID: 5ne5jampjIFljJrrhJKVu9YmMJ1h5MYS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXym0K8ZLryB7b
 5r00UYfS0hYoz+BCXrGsaVaJD4XpyEr/+uq4L++UWhNOM2ofooeuHmfj2LcjXlqmNG78Nn22H6a
 5EEt9UE7hglbVkXv61xsynV5eCpuq5U=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad852eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JNtoCX4LS8KcKRon3YoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXxAiQO9PKInie
 f6+QL/3LUTSb81RzCP2DTm257tQ+/qtVSlOalXQ4MHAcotq8v2w+OXW6lSLX1iHSUUKn7mwGdRs
 A2799ahrJlJCpQYziEd7YWUNvzikmwLYVzU3rJvQ21BbDalzBlQetQDEHK8MZRggcoWS53jwXVV
 /mmkjQpocsuapgp7FCFEV0B979K75ZvhhYVJK85qSqhQI3pFqXJF1s0FMHhOSY0PuaM8+9z+1mM
 ymUW2DCYmlmpvs0lcb1b5R9SPdozTrT6gjDVKmNa9/NWlIFiQfVB7s6mpDu9e2N8BUyCmePuk6r
 zWRBzyjyGKtZd0cg0ASyHB9dPugmIYiJT+VqN12kzBihW2sK2hHDtiFTVUIvMIhRohkwYn2CP4T
 zrCEHK+OVcSxdFg2LLuKV1vqUB/iEfXnlOeSAt+Qhlx1rfKt/EhXZDn1dZQc5DB2z0iOReo/X6l
 2QUbAhf38QB//NLs0Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210022

> Applying this pulls tons of TEE patches:
> 
> Applying: tee: qcomtee: Track the object invocation context
> Applying: tee: Add kernel client object invoke helper
> Applying: tee: qcomtee: Allow object invokes from kernel clients
> Applying: tee: Export uuidv5 generation for TEE backends
> Applying: tee: qcomtee: Add support for registering QTEE services on TEE bus
> Applying: firmware: qcom: Add support for TEE based EFI-var client driver
> Applying: arm64: defconfig: Enable UefiSecApp TEE client driver for Qualcomm SoCs
> Applying: tee: qcomtee: Register qcom.tz.tpm service for discovery
> Applying: tpm: Introduce Qualcomm TPM driver
> Applying: MAINTAINERS: Add Qualcomm TPM driver entry

Yes, first 5 are tee patches prerequisite for tpm series as mentioned in
cover letter too and this series can only be merged once Jens can pick
dependent series[1] in linux-next.

Since, v7.4 merge window going to start soon so i doubt Jens can pick
for v7.4.

Jens, Any plan/timeline you are aiming to pick series[1]?
I see it's mostly reviewed with no other relevant feedback to be addressed.

[1]
https://lore.kernel.org/lkml/20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com/

-- 
Regards
Kuldeep
