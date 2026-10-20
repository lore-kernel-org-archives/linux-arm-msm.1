Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501206;
	b=NbCw13JUEsP16n8eZ43G4sXULhWYrtH61J5pGEulR/HkOm7Uw5D6D93MQbe2DoyNgXmH
	 2DcA48hAASxQ9XeiP/UTS3Sz+KaL1rI6V/bw695EMV9thuLMeQ5TYqFd8xDFbfKeAZoUN
	 E2e5TyWM2vISImCnxjx5qMF29+1NP5Ea9/E/xHR6hf0U0p8NXSnNJqHHpNJozuDku0p8t
	 KjJssGlccz9hsfaFylmk0iWbNgyJOay7j8ZRIsmehRL8H7oSf/U2PVZFYJYFvgbdkvFte
	 Q9Motk/X4Qi3gf9mmd4bteOGiMg0LkocCwSgD4X9gFO5iGqzuZ2218YFREQSQiOh3JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
	b=Q+HkOu0lbR1BJlCy/alGIqQei349vK7Lm3WwtXA+0VVlgqdUchYIQ045+Qvtn7adlxKE
	 7imPyBh93F18YWGGsfxORxfvh3ynk8GBBRLgSpbpOGmafINVYIG/ezPiYCEwCgMADQbmJ
	 9TQEF2aVPeo7hNVpZuaLioN7eze3wRSUxH2gaWPQmZdyoHCZkH6aCIZw24L323cT3G1L5
	 N9kxa2jIH2eRpJldAVi9/5y0ag0XYFVkIiZF/zOpdQQZ46VVUk7/ED2ZODWhdeE97GP0M
	 PIcJEA4gU+qUjmLPEc8hWIFUSz8o+xfqtaEycM85eRe4R8k4/+BL6QkZF90EXOQbCRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65563606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65563606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Di2gINIR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxH1S1292861
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YA9sqWUQC5W+VQQaSJzAueT
	T7pF0UiI4Jt00f8SsOs=; b=nBata8Ao4VnQ0BieJol34j6v3+8RBs32VD7eaZhp
	wXp9zyryFdPapgD3yxOU2W3hDf5JiYjP88Ek9vXfcuOTmpdyNSxfoBJe8FPwG06e
	HFJYU6HG9XkXi77mdk21dStht0pSLtgXgiW5zMVJWu97Xf52mrC2xyeNv7JTnMgm
	mTEyxSpXc82kgha5oxOYCqhQAO0D+zoKPptIjk4NtdfP6jo35Qx7IwESX7SP+B0/
	AbLNThkdI5J6Zfup3pl/sOU+/oOR8yIs5nmnZ6TmFeT8IT7l/TTX2hX/LUlDFoQq
	aIf7n6cVLxDjNRi7xaa45QG9c2pMkXett3AUJJOBnZ7KDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2hx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:00:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338c59f90dso11356321cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501205; x=1793106005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=Di2gINIRkpvGYOKLUel8EAsnQd3B2/+SIigSZiLuf0ACgbLvoPNRBC8ASunmLwvL5Q
         FmAk86Ged56QzGXZZs1Dkm6+hlvXmLbXgsqMjUQUb9r6aMQpEduFwDxE1b4K1IO/FNmK
         KV0LmB/c/fFAFjM/Ed/IEr625N7Yy0/V1u0HPcmLgyD0Wz0yvEZrt4AUNaK/oA431jIs
         8BM7sFbz6r4KYmzGufsXUlm5aFKXCeUms6mUlEo7CMyPwO0wZYGU8LurnWrq6E4vjits
         2+7AfByosvn8bASA7pOhPevnXRDupE4k/qh53wboD2h0x6S7uZElrM7FA5B1Ir0+Z4Ry
         Cc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501205; x=1793106005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=2UosDezfglh1eL5rDCWyy8roQ7Q0Ao9bDXhz8GTMHc5C4aEap4WyH09PaheyadIlJz
         5E+X8Ff9auZt8+yjhjcNGuE9YT2y2JGVkvinfYiqabdxkSDrY1wLL3WoFoE4VlNqjsw0
         r3+voXcKaO8MSLnXzIYSHXJoceCVELdZJlONAe5DoNFesqxqay0FqqJcm2rs77egOFFg
         FBQWF7De+zd8jVypHBkFoPeR86AlQybOtrGltJuLQxPmKEMOtnVOVvfNOhQHa5eiLZp4
         kzjXQNnJs7/KXvyeGFzRoC63AtSIiYT45JfjN7T0Y+5FzsBfDxg1DevkcK9KWHD4fqVO
         gfyg==
X-Forwarded-Encrypted: i=1; AKwUvBwu06QyTpsV8RPiuhGvHCFCgJnZOUZBCHOyazU1lAsptEWuMmXS/YGdnCjNPv8lJo1GDrzsx2FVoZMUsNKg@vger.kernel.org
X-Gm-Message-State: AFq9FYI85hVj0AT7a/k/TCYIv3CoV3S7YnG6VUK/DT++MJQHJjqq/E1L
	vqC8KCdYUMVYpaQ7aW+F/zGEWlNbeP8B/alM0MnK4kHMFzX3oM/ua3zoTbzQ4M3y8Nl8bTnfgrV
	nrbrhzjWUD3yUGWtKGWm0T6oKGJTxwlXr+uiKPtFk9v3SWhKggbYPOwo5cV9FCuoWwLaL
X-Gm-Gg: AYBFou0am/eUOYsX1bnIEe4h3UuKLxBpzK441vdHDyqRGNzOsA5WrmXMkYT/Qckk4VP
	JtnF3UqUdD+PCRIVaucW53sbsKoFaGnKTrda2d9NeMOx3ckgkfSaDa5nbi/eGoou6TIYQi1n0ze
	QvodPoDpHFuAqWK7Tb5koah9HubaHq64KuVgr/GlYJPq9YM1czAPFOjzpfzn819Q2LvSjl7IcOe
	LoULRoKqAVAfS0IxXLS3ylqCurbLrAAq7Lmx7ZcHpbizG6ppQMboErBqTOvjRHeCDf67uDvSJNZ
	eVXnduOP6IAieWA6Q8AOfrfrCKVHXaTMLfry4BXGV1y1SF1jiSYIBf+W/MmcGUb9sFrEn7nG+i4
	TetyA7CvDAmBxUBD6
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311656185a.19.1792501204410;
        Tue, 20 Oct 2026 06:00:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311648685a.19.1792501203724;
        Tue, 20 Oct 2026 06:00:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm83132575e9.0.2026.10.20.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:00:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: 31dsiit-c3aAN-XroPbV9iS7NHRGPH2k
X-Proofpoint-ORIG-GUID: 31dsiit-c3aAN-XroPbV9iS7NHRGPH2k
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad765d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EzgOzLDDTgUawJARWFgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXxDK6EYwQYUtW
 rSX3N2iy8u29GzVuwnvOHauiZJ6Ue4IhhRrYOCqvrV2fSlVOlpSVfS0JbBTMcaQxT6+QF1szHT5
 mUwpCCn6wpTmOQoAklxY6Q08QuC7aQHBBbPOLJ8j2pSzo9WeRddmhdCLD84r4fDisJMEgCrNF/A
 TnFLEv51CIZRkoRMWFfbI4Lhzmzvp9i/dnf/bdV5PvcmNprK8YTS1E5xPlQgfKTXC8bk5dI1gCr
 vDBza9sge1K+Xty5/+OjP27/0w7nQaqVBIwX7kjQg/XlIVqKZI4d6yztz0qMlwxQMTdGvc2hYpU
 eF6BqVQ4ik9jRNlKqO04K1VVazoqjTejRkAXHBz7nwJNee+TpZy8UOVsLwgYzYqOo73SYJCXdsM
 EiQAgph3PST0vjGLEllypydGk93OuwFtcMq/danDgFORNoMgOv8B+Zvm9UoUEaaalUamKAvpVRY
 QRuQbdU6tyK5t9LkOug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1GoHKlGfh8Tz
 cFVR3w/uUMmI3loExEwIfnBrf4v0yl11u8HoEgitK86xsrYfbysyMQCLUOlv2t3N6R4IuZZC8jg
 ZsYJ48ZheP69g4vq80pWetkgMhI854E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051

On 26-10-15 15:25:22, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.

Can you elaborate a bit on how the two phrases above are related?
