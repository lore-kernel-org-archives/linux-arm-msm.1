Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016112;
	b=yhfQSeS4BJew4ABHLS3FQFL8jOL3Yi7Eu91BENtBv0T71c80iVj8b0E+tJuBr/cRj+6U
	 iJHs/nUtu/IioPEzBGhT7WrHNt7RVv5dVHqfkfApScBPvUYfEqshySQagaWUNermNEeDn
	 91i6syKU4HKpfRcChhfy1UyHCKtnYoaTaHkUH3ANrphrYoahefjCK8LCi4O/g8YLJ8f8y
	 D75yoOPFs9TMkdm4OrldFQZ9k2c2ct5IwV6eXEdi5sHdLb5vNksjUxeetmZFk27rHOMHs
	 cbatiCiUp7BKa/JH+kNl7up1VKcTeuUszI/Qz1XIqDQSfYFsQmkpggJ8KtvF4ra14Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
	b=bQyVeDQ7C4vQFJzxvFv9nFd7lPbZhlZ5aQtv+YYJF5q8BRdliVawB0DAk14r5ARnm9Yx
	 koneLLrxEKG51RdVlieow+VD050iYXkTVMvEqdLIneb6tosWigbBgoYIxhdmm7oIVJkw5
	 nW4iy8TN0KWLN/k7pI7zK9L6dN2TU9I5wCnAAhIKC7D4dj+syVZ+K6Iy8YqAYtNswk6iq
	 8L7ZEgWv7EZWOBuHJPSK/BFnJNO8T90iUK+2sXDzbDryquARKO+bkgIuiQuhnLQBO0gWf
	 zn9bdwnPuCXRx587R22WPKKgIFMcfb39IYhZAF9btWGMtdN6046EHJBGRR6eaa1I8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDSvKgtL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O/dbzDzC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357E60A2638
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C357E60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IDSvKgtL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O/dbzDzC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAssFj4131453
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=; b=IDSvKgtLSU4Bw1d1
	G8fUyADyvE5gRtxX05159uGej0m6GRxBzbF/sehcA4Q8ObR2HYxpIcJkv/+AJuyn
	LxfV2ZLcXGqpPxEhV93FhgC6SQu8aEOjJg/MtxSc76iGf9/wT4BJPLGUfZfoTtmR
	1xZ5rgMa3MG3vNjWBpZBuvzuCnfUYKMiAkuKaZifA99SSeH8BqdnxNQCmWehsbYV
	6cllylrwNOPt+BXTZDBudlOPfxKk6fIwyMMv2eYk++qM06YqST4R36UEpJ0ZcSKI
	V4kgDlFLmU/ayCf9qP0F0OVYfvEgA1JcbuP+re4466dis4XsTk2d1EGXmql38Nrt
	2f7LMQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0akf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:01:50 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-821a6328ba5so865847a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016110; x=1793620910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
        b=O/dbzDzC5VOVvB52HwMOfku4YxPhZqnAcB/hw79AWgrNCgIxQCBn4GMsm37tBwZOot
         moXI+UJ+QJb0yTxA+dEJuXWXfj/u7YwMKnI3IuCuqvLWzA64oiy3n5mH2BFaKGJgN+zi
         9kow3oqoz03AkfVOi5PQZO3APNqyjShz0pGU0iahLP1XAU2bcSK6a2de1tMxdpSpPXJm
         swIzITILQDAedBmqLMChPPNI/GLFa0CQJCN2jRsYcPPy7P6wdHw3kEDjPdwQY19yc6bg
         oCndGe6Sz3lhS1DiuIHiNH4fS7ewoCJXuy06vXH+ZCSoGN9aVGd7213z8mcmxZrEwqWU
         4Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016110; x=1793620910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzJXKHWJowrI6hOoUXLp6aJOFbu2bd1z6Aka5OEKUo4=;
        b=LKwn/fP32WbhDNQ1mP/KVNn7S5HYaX2fpWtT4OUPPrGDTk0cED0nlI3F/FsU8lgewW
         vzXD9dvhSPwHH/Z2wxlAUkcx7xKAc66IdL2iy8wr8sk7dGZ2TGlslxmxjI7nhvMiFACC
         Ut2qvjWDmhmiKhslQ6nyO/nyYjpf6fPi/oS6zpqRjImWEr6e/6JhiIdXknNU1CDkXFt5
         5cdBPGh5C+MH2ScoSqZAE5ocUR42aaffH4gJ/dutlF+O+/t2iXyp5zhh+V8akrYpEUpd
         nmMg8SxsQd3cTOUBjS5NpJ3JPQDyV4R1VB9cMRrJw4k4GsqY6f5lOAjzS8xZwuIFpcmq
         FRmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMz3s8GWXP03vHqcvG/cVKLINL4dwgX6aHiUOQuuT6yqwAdoxLvX+J43hR8SLiqpQYzjNUGov7ry05zHpH@vger.kernel.org
X-Gm-Message-State: AFq9FYLP8U1oPF+KmqGZZlNhLJvTmVl29YUHKxZ8dUCZFf7KIWRIQMTS
	ujBOpkX8hOPl7CdX/QkOWAm0n0H1iC24nwQfvyqdQ6f+qYfrx7fTFN8KdlIgpApgBve5fMtKZ5b
	K61a1wmhyMOdZIBzRdHdMeNp3Wwo36whdssXi6+HTXSuhMa9LnV0qUKy323fK9g4jlDZ8
X-Gm-Gg: AYBFou3vEkIG8eK9m6UdXg3BkMSI032R9dCZVjrPs18AcExqXdyFnJ2zI6Bh7s4vFch
	2UFzPfIJ6MbMya1q2zyH0s7RafrTnHYUDn3spEHd0kFH0XtTKCkktGm2rVWpkAHI0YY5l2Ob9Uk
	3S1b7Z2znFdA48SSXzVD+wg62c8YGv8Tg+FaQz4L3DAeodbre80fd18vTBSLaafTx9VyHLMH5rX
	KJtVaeZaddutXi0iXf1hM1iD5fCpj7fI2U22w/J9dA50K79JR+Wdw6QZYfDUrZdCVD7urlDcZmO
	Q/4OxPcCNrBaxrwa7KogVlUCxc2qwO+T4bRd7BEYA8bsRDguMJKdp3c5B/jweBg6DTTpITs025M
	Elmz6v+plCE/I5v2BzSS85g==
X-Received: by 2002:a05:6820:c0cf:10b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-70ba0d3ee53mr4140754eaf.2.1793016110006;
        Mon, 26 Oct 2026 05:01:50 -0700 (PDT)
X-Received: by 2002:a05:6820:c0cf:10b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-70ba0d3ee53mr4140696eaf.2.1793016109423;
        Mon, 26 Oct 2026 05:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm265518866b.34.2026.10.26.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:01:48 -0700 (PDT)
Message-ID: <0facde6d-85e6-4394-9de8-8290c4d69582@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:01:43 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfXxp1My9qMdiQt
 nZsJOwPnJv1vfWTAT56gP2k0OPNDIyZh+ldgJxJHzl6e2f8y0bZ600HUTwn4YlmlqKgxYNtwwIp
 LJNy+XAIDR4H5qDSdcf4pfpNiBrz8ak=
X-Proofpoint-ORIG-GUID: vBP8-eKGqCH5M5cobOz1Jb2z79zzg1I3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX36C3WI1PcqEI
 9NrS6YjquYUyAdozDIcCqtnlm8widxMsJ06eFWX5Wyg69uhx3qHuZ6DPItSkc7sUFDM58hV7c+a
 XySJg158C65LXmNd2uWlbPmXqfPr2fHd8f+lHFprgcJd7sPlcMprD6WX02LaVUTvEGzlL1Iax30
 FTl0AiK64y+dvzUO6pbtZx6mKWR2OcyKoJZ1azp/Fv42CWZU9aHgubZqzjeSmnYft84urlF1ZSi
 /UiwdY3TOKcyDjm7etS3ejti5bpzebsAI62g3bBY42zxi1d24X8u+Nq4GsRG7DMsRTabUi9zuc0
 TuzLQtzXrAox71FyRMSb7GFhr49x5XfCgQmUyNv1bPnt5RFCicw7UqiXtfDu7cOrGZVhn41rq1h
 9SakII5tAQpDrlGB75GuDk4EfMboAVmlTxuLMf4hJCFlUsmwnvAXHCdgX+IlNCpFLKqgYN0K1Zu
 FVu1K8C7H1+kxBgQa3A==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf412e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rdexUmAEWTTLP2vLS_oA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: vBP8-eKGqCH5M5cobOz1Jb2z79zzg1I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Monaco device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

The documentation doesn't concur this for this platform

Konrad
