Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8D3E5A2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371601; cv=none; b=QdcjK1AM1w/UxbkAEdLGsoRS0V0JaqhYdrfgcXE02Yu+vzMDIv59/ozQ++EmOAgqZSV9GIwh4mtGzppYc/2/VEPySt5VoukuezyPPTrHHAOi7/TU86lHQRGePI2x+iOICHMvxe/Tm30hHPgi/kq1Or95aeFu2UrIJ+AQYC/OrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371601; c=relaxed/simple;
	bh=PA9QxTqfPI5AOn0ULq7Lt/rNPfbVB4JxJUnXxTA46ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NI+rYvFAoc5ujeONwivT18CqgBgEFZcoU10DszB73QCvaItnemrtbYhQFMu9JoHg+Kk6hSoC9R2eklqeBbSvVkNR9YT0ctUQoKSM1GAizTOscQsCENx9Z0cnwTCjL81nXSl+q0ueh7GspfUkxUzlHvYF6AcdxRGmVYBv0kD+lhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/P4zDaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNSUq3qF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/P4zDaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNSUq3qF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iki33369126
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+YUuIr5Tzjda3UhHIE2zWes
	LU//5JK3mNvRXp9NpTk=; b=R/P4zDaBwH8QGg9osDirvquVJXoevo204Bgg5Lk+
	m+s18Pfni1VtZi6DLQocuavb5u2mx3goX55jzziUvu3Fb/lPA2AW4P1dgWdRTZ40
	cGjN8V1LINmcka7fsw2UjlZhL4/vlmY5+CAi3DH0DnEuC2TodhkIxe3FdD3do5iW
	FiMyODkLsFasU7X3EnbGJZezq35i52s8nfI2AnMqR3wOW4nQM9xk5D72SAzJvnRu
	6ZVH3HuKZnpjuaflmJ7ENxMut6Y4W21QT4T5gc1BBdrnYFxpdJFsgvGOPdRJjgY5
	cg7M260F+buqqj1C/kFqE8L+M/L24fRLPui4FIviXsBD4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5jx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso597556885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371598; x=1789976398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=CNSUq3qFv5hqKHwmExD/rd+8muG0G7UaXBD8zKRTz6oABpz4AvRvzBC4aQAJT0F5ha
         6kAxhWXeXTz2pY0fxXchCduUnEva3I5tjilOXrG+ACiqcg2S4RZB1OkhyRxXWU8dYLMq
         QxL1m3d5UezvrCTx7bT3mNMxBP9GqZN90asX4MfH9FsGL/nXIFvESKMI4+qAUVjO4XsS
         dX70LCaQSJpK1kO9GzcUfp8MYmxrFHKzM6lF3NTejdtb83z8vt54v9ygvHlXBnN9AroY
         r95P2ccECc+P0vwAngCfUq2BLchF3lap0qSvupBv6wPXMz9aDWTO3JoKmAylb1UZGwPn
         ul1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371598; x=1789976398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=po/tp9Y5CrE9AGYOrCY01NiBpJ+bye/mkQOYYJxGlPaUzxM51xYNAIipqSY3O4HYZZ
         eMLs220CQrwgKYZa/45bMJQCoF56j7mlsUekPKltfPowIIdnM8yxmNf3LR3Hw84G0M+V
         BPxnJ5IrTIvfeD5ZEqyhsFTj8jvOdh5pYmdCEk4mY0jyJmH0Anu4bgpkdUKpKei00KEv
         Lrv3d8QWdot81XQuFJDgXbbSEuKZaSzRf5acshZJalE/75NdmisHvf8zhJBDsLR1RQX9
         t/C2pNBgcxr/nOfgNGiEnwasF3zxWRsefnpxzjBgSlPBFsvxYkejxRiO18n3kkCMwWgD
         AD5g==
X-Forwarded-Encrypted: i=1; AKwUvByBrBH3jjofYWFBMz3O/dGDMHjJgHDvimqwoiwRszwAe6+98MfEdnBXiBxK9+4JF3JlAuismyze+ac879ez@vger.kernel.org
X-Gm-Message-State: AFuF++l2+HwFsP0PJglRQxgcJCaaO0Xrvlacr7aB3nHeUQ/T1XN70ZAE
	YwJukIWJZXWVEzN85R/sQ5HM9ZgULKxW+n3x4ZbW3Kb4RKaINR6QpLYId/GVLtAoauD/BX+6QSE
	WmRXN5AZHJlL2FK/gDIIJp8ceWMr/JV36lVSnjkWL4JUSgHEtGxvLmyMUL4Ws2n/lQST2
X-Gm-Gg: AYBFou0qdVUz1H9nYRgGM4Zrf2g3tSDi+e9iR7op92CJuXPsrQ7bgdTZ6pmZpr+UUJF
	xOTaJaa9dRyaozSbjHe4IJR4VO79ET4P9LzjoxjzAgWe7EOYHndDnVuz11KoQ2Hj/2pmP34Ayqo
	Mp4XWLRmdYTm7ccFYRPvZApC40Be36oAuEj0YeJryT79NaYteDEuvRrJ+FDYS3XkowkwSeEXTw6
	rX8a12FikY49ktphGwHfmXhHjNr19U8bXe0r5haJqCoXUGE5UiPGAhZ54A45SqAGg5EhXyOS4z4
	UjYUqtPKv0HcxJSQ8Kf/jtvHf+hYhicb/EJ9lA1lz+x6ozgsTew7xqqqrvMhVPchfjkCHVQ9iZS
	TUzSO3aDI1k8sHw==
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186909685a.25.1789371597509;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186905485a.25.1789371597010;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm25016368f8f.25.2026.09.14.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
Message-ID: <6pm2ghtt4bfjq7js3bsgjwuer4syforkpvbs3ajtn2josua4r6@3znsj5olp5tf>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a4cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9DG13hsKiv7m
 N5f3PXVV/NAQkGeyQ/3n74niha+wzSNHh/Cisi4IA/XdV63qKs9n7RnK3USzBZuIFWpPxpKcB5Y
 uZ4KaIKW4jGPfu+VRDGxonLHMfx+0rpw2a4UcVdK5i2RyAyQyLRW9Dj3Q23/I3ugz/yG+Utwcmx
 3SWpCyjqxjzfB1e8hY0j+c4bcH5oBrHBo+5TzQrUv9uso0E3X82xUeg1xTIdW3//Zdjmi2N11bv
 AcG/bjapK2uVvABVcbfKkg3BA/lTTBrokW8KMGVlbLLDVRsVmE0yG+OA2KQaoAbDGWDFqGYEukH
 V9G8MzAbqOqF1pyKR+a9ByAmpEwbP1sa5QHRJpK2nA8TmyKYdoUry/CNFxEdo2OiqTrrihpsG9i
 OhyY9SfCt8mEOkROzIKUDg3U6vdetsdrib2ogXHsi1KQKJcgXQZqdjh8wcGV3zxhMpNlj6C6CrB
 llU6t/W9hj7MXZJJSSw==
X-Proofpoint-ORIG-GUID: dbANF23IuUZYQg1SCHJMn3gS5KWmFht_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+2QERieRT9M3
 Q0ebhFCQDnJkfUVdxUhNYCQlMQPQhuoCpQfUytefHXfHbd/bOEus7U0yYJU/ccB99hGqPCe1Ok5
 vIb87pbx2GCcgzGev9TNXc6qlYIN6/U=
X-Proofpoint-GUID: dbANF23IuUZYQg1SCHJMn3gS5KWmFht_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:48, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
