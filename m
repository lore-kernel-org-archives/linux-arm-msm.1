Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349343;
	b=u5k0KZZwf+q3HZF+quLmO33bxcz9LSQ7t5z1B8wpSXoZ5w2RE088CQKvGZzEa75sTh9a
	 xbsC1Uzk41BBwxrjUvaLwG6mwwWxz+00Acn/4nlVH/s7kCVWkjRpMKdH83eBB6cG996GQ
	 7Co+tGO7PMIJhRyYv5qrYGwpTFlCaQHT+WFpcyHBWaUB2YQNXkmkW62Pa10lPEy1u1Toq
	 YFtoUX5qjysE3vInLbR9d5oGdBE/QW713Ox3ykNVaaNgsbdqOorOkeSve3EldNQbdStOa
	 BGs2KGuSayJBGUxXMI9FArnjn6Jz5/u8x8o4RaauWBS0tldjFI5N1m9Ggnn7+ZNfIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
	b=pbfjTYQBJ7BM8Mz4WWkSNlAp9f+brddgr37MvX1zycpZKajgEL6tWZ93WAwwEM7HVKOc
	 k9i8XNbft3Q6eonZVqnYU7jwvcJ4kA9R6vI5AicHbYTcYaZz4M+AvtIRR3YxTOWfZhE+u
	 lNvBmNkwlFOaH4ecxCTLBPFbLKVrNBp7PxZ940fKNvQY5NBAPijNvAfTtxy5x1siBZGSM
	 9mPjfBEL8/bidM6OpGgiKGFLYq2WqFcIi68n/EzLleRhvey/Ip9fEjTb8t/CQRyjsWLuZ
	 oVNQP6j90QjSZb31SlUTUsq5UXHts2/EjPzj/G+3BUgk5oz/7rYSzXjeqYVSq+CYaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLtXrypl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jF7100Wg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8B606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C8B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLtXrypl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jF7100Wg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F39u3308880
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=; b=mLtXryplGnXfHaLA
	tmlbdaxGFX25tKXAXCGF4UqGa8w5dlXHMM7JB4ie0etfTPDjxg6yk7/dfD/x1Dzm
	BKhqDdRokrMVx04iYqWr2pBijZXMvPLzB/e7m3zGdfrQehS7k29aZX/XEMCZ4QqX
	kE5SgeaXYu92h61JFBZkWJPOmegtnHNGTSWxJwP7R54oP/ZRP+j9xrFfBU70u5sX
	1MBbWKdbm8qgdJ+qI0hLI3GgpjUQWQTHg6sGgx5au5R2PVEVbeKZa+BuAYPkL1qb
	VVZN9+9vrNMWbiCDuzMMPULbbELRgyKVK6dfECks65MPcr25TokrC9f5V3WQ9At8
	gDAy1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qt0u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:35:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so8945485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349341; x=1793954141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=jF7100WgLKYZ0Kq0nC8iVkFd3zIYWne3xadPBLqZaUYbLMkPJZCb5ast/gogwIDBp1
         5XTIrcjQ3U5JyUDn/EQ1bfvJnmJqwQsCAnw5jI4ZHU0Nds0aAe2zxtYNOROjTGcffowV
         nQWpP6I66N+4Uuo85gzfgsriY/CRjo92/3kooALuDgT7j8O5k70AFMGhVQLGAsX2a5QZ
         geBOKWLAIspaCV+YQoTES4cFDbvWrujAtYMWz6EslEy+HpzmFDePs0gBMPFdqHAjBV66
         dKfMOD+LAqbzsge7C41AFKpUoIeyOgKTKb34cVbGt0dZfFo0Bff0D4KDGkGHnjdQ5P/X
         VTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349341; x=1793954141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=Jm5TdfJnVRjk6qzOG5Ps9UGmIRv1qxz5NG6OfFep/N+YACQrYGzuWBIRUObyexDSZW
         pjlC3JcfNoDJHuQD/paDSE8aGLueocsLMPzpZbAUWA5xcD7yPoounSjJxw4MDcWuKojU
         wjO1btoW/Le7MCJclp2vmdSNK9ntgn5HIOOACiIRVplgmJlaWGqeXBMvrCQrvVJL1SKV
         jw6N7RbfwKzsLpX7buuTYPkL9vSi4WzMInpnFyXm4mTiM/qiWgMHAwKctZDJ+Y6gb+Pu
         8HdtxWUUPmCJSmTKKFZx7c554EFr9i1f5enBqXURqQjZlbmmQcBopGyajK7PwSXQjNlj
         8Nmw==
X-Forwarded-Encrypted: i=1; AKwUvByjbxLmHujPHLI93hdLPWC/5K4HHgMkXU4qZ1J7TncYp1jz6emNug+3HoVB4S0UEaFmlSyEqJcda9biiIU0@vger.kernel.org
X-Gm-Message-State: AFq9FYLHx0Vi03R1rTTbUUTLPNEGp4wnrQDUCGXbT7VdeUR9aq4OaoWM
	B2XnF9u/eqMZR6pVpbU8h+BTHOr9hbzSP8zHDLVR8ZiRPwUKWanodQ8fCMjrgxEWJLsTUrWTdfE
	6YsN/QUdNvqd5F9/Iqy3O9cBSq6JVPlnUhGI5KUe7hfCe/VYGMnA0EjhPf7PGn447AXXu
X-Gm-Gg: AYBFou0kDJBAEZbyYeiUBm6gm+shh+1zaK31CS7upXVFs9Wymq0lqStTFaBEZrA5DWw
	GecclWzP5+D2udNBa6vbWR8edCnuQ3amkWLvY9zKiLUq4fLl9j5xRTqnXBQs4CSRly11mtJ9zZa
	1n3CKeBLBSf3BHfLXJmOPe/OEJiNK73r5pjvQkhNwHTnXgBvcOvNCUNYTAaJqVoSmmPhltmtv4e
	z1DleNOUTyQZsQjOx34bIaEGE5r2GHE5bfbhl9PlH8RekmzpSYzD3B/2ajPgv2PPfSy5dWmqeG7
	8FqHQXtJE6HC7F/raX3bqwJoXYsYFubHkl1B8aV4QArDxge8ySYmhGtFcvC/Z6iznU+GWLCjGzi
	avqaUtNa9wNelKJ65rSaGn8rLI+941ZMKpgQToBVrhFVhwBkkDUZ9C3rwvk1n6/JeHEASWGQ=
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24294251cf.3.1793349340730;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24293851cf.3.1793349340133;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm39225666b.53.2026.10.30.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:35:37 +0100
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
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Rob Clark <robin.clark@oss.qualcomm.com>, iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WvGWe49do_m116fFDc8M4zbIkp5D1Bkl
X-Proofpoint-ORIG-GUID: WvGWe49do_m116fFDc8M4zbIkp5D1Bkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX6Tu031YiJOnz
 XuUU0OsnWjxBsmiGZMY7SzRDV8mRZATxRqE3kno/HS/Y4J35bO2oqaaoQXsa0LEQl4W1xke6OvL
 eqeCX4UJWQ6Y0Iln3ECfi8m74k+w883QvRwGpLSWnIvwmMWLXmMhIFuPzykRwwrubkMJVmCPiyg
 EM/cmyApggQ6DYyxwHgpjnGlV3oVkwn8ouJf87edzqRnsW0cf8Kp4Sk2sno1Me8XpC9KVqb/PsH
 Nw0YmOtlXiOA+HyCzKQl5sj6rEKpzP2hRLlzv72BR31K0HO7Gt+mF3XyOul1Gntgxfjmu+cPPBH
 b+obRHnCZOlqbCI3YL+varG18H52l4nGnpMnAlbKzuQ+qs9v1iyCkqBLCoR92pEEkExvnAnrHph
 qM4epazO67bQu7Ph+LveluKwBjGDBSS4uqh9Yom9GW+Ltlmkf8O54e2g3gY83wUfZSEkaUbaLZv
 gG+C/m8Ov3vm1hgYChQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae456dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nPYanoZRiyYWTCGofB4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX2kA+OyLKP3Kk
 EIFQp2TkMBbAX9xx6xf41vL9XZCdPOCQ52aXg+xeXz76QiFw8K1FbWdvfkFCDQSEv1hE5pJuTip
 d6N+jVYEC7iXKJ9DD16uTBB6SrfohDA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 10:23 PM, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

fwiw I'm not sure we have any devices with this driver and mdp4
but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
