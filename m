Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771687;
	b=5Z+1fQITx0dTmMhUOPHM5JhBC+VIHeK+dcAojTPRE/dgrAkkdtSOMdlDxm+3ORMc+7Qp
	 FRWjmiHSHi80DuNjyr8U5Zjc+AhiX/nt0uGW02wEKJSOa7clH0WYe66jfNGjv8PScok5d
	 iLY5kEn/w8/ptRYkPvZ0gLEAkpzhFm0A7dDKYzwIwpjcD+B773JeA9pPgW1ox/MhKv214
	 1RefWtialHf8nwfGjVjAovRWzdYvLfmvpwI6mfkatMr9vhb3ijCWGxNN5A5n36HSiQDRQ
	 AmY50RyjnAcGR2g+bJQXHZfcEq7SC5LtWCs0B2w8JAJ066qYqALMFcjLYG/XuM6PiiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
	b=QmwLh+pWPCZMrD9SUbxo6mLq0MJ7FqAFL1lt+KHVCCBGGj/pNK87s6VdqvYPjKM2NsVW
	 tJ2JNmxu5E4s0A7mF/p0/6q13Anr2LM7yp4Qhqe93wZJGIfv9Wi0o8Vn3JgXf/mukrx0V
	 ijTiBpt7t1XDuaN0MLw0B5O69eoLkE0k7wceGr9eYsWNa/k1B8JZdo/jKD5NPLD0hohXF
	 hsC1J9dLjWeUwFX4m4BLazgGfL2AH7CKKKWwbb89J1bYcqXwH3lTZdOrHc6QtUV9QRrdE
	 T7uNVVY67vnJEk+G0XjGopQimGtapUyfXMOPeXfz7dHxxzffVbDoWsNad349snwVWXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SGrm9ZVS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4Tua+SU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C33606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SGrm9ZVS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4Tua+SU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GiuJ2421530
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=; b=SGrm9ZVSiF9T95oH
	qmPF8D7WrSgal/RzVrhLc7lmGgk0K94tIweGRxDIt1GTeqqaWyiYs3Cry+TgHtfd
	fbCJY1m5j1GDh/f+fV4KhYO6eQbC+1GodNp5uGtKoTctAP8L299sH662fe56vEZC
	eysIDrTIYL8HjFxVEwK0wcVOpUOVmN5DffLfw4aTq3IabSkmxiLOWchB+UFEJORM
	cGKE4I9F5HQ8u36NiQW0QLvxv37/veB5VJslgjw4ihYsgAKZuzjjMF5XzXbO682S
	Mm+okZxuSQ+ZmRJWpW6SGZyLnWhMIlPi6BZKNyREXNFnJMR6JKF4Y1r7ksC9eoPw
	Z7jQrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92tcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:28:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-550b1b21674so16926351cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771685; x=1796376485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
        b=A4Tua+SU3blpSX7t9VOhLpeEc1rsDOOdaJQ1k0JnmsI6aHYbOvOy5qziorBQQ8QJxD
         szq4YGlhcUMvBn1KdlPeEgg4NNf3nMZcRROLegU2tLsjHACt/2PDJK+yynFAo6CieW3K
         JqLIqFXdEhJNzP2bO5uc2JqW8I4YuzRoZp22+zqpFIcF1Cs+t+7Aa3mnSUUHfLutrDWo
         P39FYLkKh220Iq1UQknWMzKL14merRE0rPC4O14HJ6PK0bgku46ul0eLX8XTIaW5psoC
         KDLCAo0u9icmbYZ1wOU31vdbzkmvDtRmKMmf/IHWQ4jjkzqkyps7EHbrhpGr8FaZqHCG
         BtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771685; x=1796376485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVUt42Zowk/lVILB1uSHbBReYTS3hYUPxrg0SJvsPf0=;
        b=vXRdNN3eBjP0AJ0X4aZC0iuQBq/M9gpxtyocoECZHwziGGoZRNvM7jf9eSr8aaCWGf
         IwDt9AV+QRUCnTW6H82/tYAYqKwfTM2ZJLT2Osxsxu4dvd9KPBJupHW3AaF5lJ4N840I
         VEg7zqwiPXt/1LjwDI5uz4d2r15U5XYzniyHQPBDpE9kl1BXWwvA6owbgPOjgu8McHhk
         sxsJf1MCUWLLN6PpFYxN/j+MdbgkfV6Gwbo63ZKbkbbRhXEi0fJZM5ghmk66kbvPaU6w
         wQAkvyT7XNukm2IiI5f5nTBHLf/JCZakP52VKmTl08Yzu7pIC+2TBJO/KW3YqrxPOsrl
         JfWg==
X-Forwarded-Encrypted: i=1; AL+hErHEMzDMc1/iu7P1nRvLqmDXMtmRI2hS7c4BKPDkchKNgyx91INcR1/ea6FD8+LBNdvCIsESJjdORKq1XaKC@vger.kernel.org
X-Gm-Message-State: APuU4Z/No7S+6tqaDDhpBtWYRGsFqPkTZ/+nD3w3neWUsqjiylnot2E4
	S/z4ZEw9wCfFbWlw8xei4+X/y3pwqKV/2FXroQ7sgW5jK8nTU0VDsjomAo9dmgwXrgub99oZ8VR
	BDKFE67PDH2ZTheATSZcnFf3KPWjgXmuPyC54816+EySwfH0mkS0WPTo6WWDACgU4be5H
X-Gm-Gg: AZFdTZfIKyYhbNdHqjbtlIinKleksNgakWfL91iHZaVsaMViaSvUAja53yBBGTxUvxz
	soDU4JHDsydEZYhSNHxHIAOR1DMCescgnifm1qfYkAIXquLxw0AeeWDn1KT/nvioX7M2Bwiw/W9
	hrK38BtGErJMTy+W6Xb0BhQBQLGB2foIB1tjRWNRRL17Au5wHxYKU3X9fpDVjnvp6iUPHp4GB4S
	zSJ9AGM8HiD/u7z1g2Fy+SxXupcpRawrA8aE6FeizemkfXP9NR70+Gsmbvb6J5TLscxj0biuNq8
	jhvwbeL9MG8uBQIo7qY9QB5IoAL9IFYjoenKJl5Japg9I0WU2Dg3eK92eQGH8ScJTbGpYaEcqPp
	DBagVdZBInuZIok0ksuLv6Kbtt437h4nW9YT5tOCcg0PFRLeZWW3Z76CmKe7YLmbjkOtKDvw=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr3960149385a.6.1795771685462;
        Fri, 27 Nov 2026 01:28:05 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr3960146085a.6.1795771684996;
        Fri, 27 Nov 2026 01:28:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm859204166b.75.2026.11.27.01.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:28:04 -0800 (PST)
Message-ID: <4ef53fcc-77f0-43f2-a01f-2fb097d1fbe1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:28:02 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Don't mask shutdown error with
 SMEM lock bust
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, abelvesa@kernel.org
Cc: quic_clew@quicinc.com, quic_rmaina@quicinc.com, konradybcio@kernel.org,
        sibi.sankar@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kfwAMoAK0FuEMsRiMaLEE72dybeoUrlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX9rhmyggkL6Uy
 dV8+yhUDmUWuWXbPTM8vgzA0WC4aMaYbR/DSsRZvWlRHqpHFqXqCx0tXvhH2UsuABZA1C0YzYCJ
 HkU+KFnZSaaZRqcyeXvCCw2qb0u+AGEbHt6NbAHfU5j2VQUFs9IxIAp5Rc5YxSt7fAHoW/feZsZ
 UPlL5xIZM6XAGpObUWh3rmalgC67C0ibT/1dgxpT3C01FoNmEFbYx1igOxBRlsB1ElxiavEDOaP
 oi2WjKsusm/T3jX5PjoKAM2tvTsJT8u/FdKh+1JpqFo9krGxoL2AlEKww3maRJFMXR59NAgFCx8
 uz5mly8nlmV6YqBWa/Jogg+Ieq10b7L8gbEwiltC1SGylH5UI6QWdFn4pYcyqbHPKTA3vXn+2QZ
 bayx5v1RMl4qF423zjLs1T2b+1AHMNxDpj53eld04xz66D/H0mFISqE0GaP2qzYQigh7AtuUvoo
 YQ6lb664acgaBN0kS2A==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b094d26 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zLq4OPsqqHyM_4SzrCEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfXyCYAH9I6rDHy
 HnsGUOxT6CdEXKAr75zZA2UHe4SgNoSyBei2BodR9xvwjmjY5xuyh4JQlOyJk06gvmpCFnn+3F0
 IzgdKEICiXaqZm17CM4H1PNUmpp95aU=
X-Proofpoint-GUID: kfwAMoAK0FuEMsRiMaLEE72dybeoUrlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/27/26 10:26 AM, Gopikrishna Garmidi wrote:
> In qcom_pas_stop(), the return value of
> qcom_smem_bust_hwspin_lock_by_host() is assigned to ret, which discards
> the result of qcom_pas_shutdown() (and of the DTB shutdown) collected
> above. A failed shutdown is then reported as success whenever the lock
> bust works, and the caller carries on as if the remote processor were
> safely stopped.
> 
> Commit 9db31edf92dd ("remoteproc: qcom_q6v5_pas: Fix error masking in
> qcom_pas_stop()") fixed the same problem for the DTB shutdown but missed
> this one. Keep the first error and only report the lock bust result if
> nothing failed before it.
> 
> Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Assisted-by: LLM

This tag is obsolete, please drop it (checkpatch should warn you if
you're on linux-next/master)

Konrad
