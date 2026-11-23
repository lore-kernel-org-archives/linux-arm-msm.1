Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447597;
	b=h2aio6kJOm/rTxb+9qlIDmoDdJdlJbrs5g+7RgEybgMyrG58t4zic0IAmpvP0syPQkSQ
	 EJkX/6QZ2gTSq5mcW5lXQ70n4j+s54E2nIuvOiRJsWlpZ/wurM+U/EAnBtjeDxM3keZbb
	 jex9vLwFrxtGSkyy5GLRbQfRqntgZBxo8gxiZV3KHUa8KKIokj4gM/grfE8GlIyKvBEQh
	 zfB5+0lxn0OMZ0af8AMNRBtzAfCrUmtI/tyDq0BxBGsU5hXJmxgqbcJ1cOadddNTExzbK
	 Ld33EBSnf86eEmPwD6kgP+WG7svHvxrW10Mldq0bJ+FElbQqYnlCQCvDuCXBJDlo8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
	b=U7pfh40qyzhFzfS8vSfGHypjmm5atSOttJ95ReAWMFN13J4xCtxo4E+kkVtTbhnpC3CH
	 gdLcMBG0y5ZtUb6KdJaylLD+fTL6ndSP2rRUOgl7Ijll7m8ULa1XQ0W1ZPB/fptK7Yh5j
	 fL8XkIJHx4m7U3fz9WZYjk4QCd7qR6JVQ4GKQlMJf4x6Ftq5GLK1GX2RKS6bhrRRaWFa3
	 xJ7xDINsiArCUDQyqsclmWgokD0IWae8EISzUpCxaC5bJZCUCtglkkknp+Cv8TvQscdnC
	 OLf5B3WZ8FCr0gGHgdmkBUEc1lqd8xyver8VU3RmpTfa9YZBeOSAGIkFP2qVVgdWDvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW4qkRhD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V28LrlRp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE64606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW4qkRhD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V28LrlRp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLEOY4030407
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=; b=dW4qkRhD6imxWpO8
	u5HFt+cbJ2A5mj1c1Ds7HXJFBiwHhG8/isQUmEVOmN7Q5yCgvPESuKphzSseuY4X
	F9YEIBVBT1rILBMztZWXjiPF+1SnhEwm5opt4/mrlJNr0M6zeY/dB36oxtnRyUoM
	tDMuRHv5ZaVAwy8If3ybdWC85Fbh0ZVD+q6ZeC2t2NuTIqYUGrLY3sdwXP2lBrbd
	Z9w4j5qU5t1595g8SPztX96GWeNFLLPFKdg3McdjKgraKLdhZahNnueNV0togGOP
	KfoZa9K1/Q+EdN7BO+S9pKid3qQllXMCtbsoH4td8IOMjY46VyK6qcXYVJWcNfBV
	OubzFg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsj8qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:26:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecf0967947so92258e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447595; x=1796052395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=V28LrlRpTMct+D7dJUYrxLp+GV9hljsC7Ycb/Y/2lV4SnqzeNTcg6agujnLiybBWd2
         +D2gBxOFCN9ED11KMHk9/0QY4nn3OBua/8nRzDMb8cTthUiriTMfVEQgK79ZZgaWycaF
         EMZUQSg7aeq21h7eeeQ7+NOfHYu/0otDFJhbd+hwdA8h0svBSqTZcRzy59mhDSGuT9E1
         Jm1b94HBwAJ8fzlA3rmRMDUCePcBI+diNUgg0Y5VQrTk9I4RjtnjhLA2H5hkyQ5I9stT
         sHDgK2RCEAVtVFQaMEkWU1vLzbFGL6wJiOueervUx8+sjMwq2qWApiEjtQ0w34UcgFSV
         PW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447595; x=1796052395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=yZQvlxRfBeMvFaCICoBUboGikvw4QQeRqQXpluTSW3wAC+xdwhpZfyEpZ1qtd1l7+g
         kmAfzrAIR3k7aIwSx8+oHvT8aMcDH6DdOWgxo0RBxo2EXECM2BNet12QPaMadri9e9yF
         ZiFLVY+9NnyrkRwoFhy89mDa82SYKbmcJmjvW/OUs9IMn6+Eg0PHc3jUirUC3wtobOpy
         i+rM6vbPEmclRIkOXzH8j5tS3m2ds7GAfPfi5C+h2ZSIRhGM8qBTahgQT6qADTzhQian
         aQtZvmRBnQS7JgWyC7UMEhaS7flp/D/xYAX3MAUC/cjozX0OXyiS30r0NVBmtiOdRUR/
         NQUw==
X-Forwarded-Encrypted: i=1; AL+hErEeP1yCyMpKAT/+RYRPyNta3nTy+ull3JoOGMwxSprn++/DQb+1N0cJzI/Kb3NtWq+0xBHNm2rwCT2rbCq7@vger.kernel.org
X-Gm-Message-State: APuU4Z+uIf0x3Vbs5jcWCegMEkPalWMkduOz/x0R/kHct4eplFv5fDsf
	HMaF+QKwx+KSyafoeleDQAsrH64x4NrPl3OvH7RbxOvFTSrBs3kG+lAzZRgd1WyuZGZUVUD9EU4
	3T67JEBaaVYrdZ0lovyjRIvesGducaNaUlUTilc8nIuP7LrzVFKu8Rm3jm/8KhLact2qm
X-Gm-Gg: AZFdTZfUWnOpaaC2brKSesr1hsYSGhRf6fDPOG6ksqiQofKYOMiJYd61J+i45GZwSF4
	PpyzaEia7RlntgP7q2h1CHjR79ovLXZwk0oAfNpmC6g+lz4AQ4FyXYRXwQWe938IoDRdckpVNxn
	tPuOk28nXqxQN2XA+Kj0/ThQFf8iLFscUetp1a4zu0x/GqjCHwVQ6Q1ZSOa4pliHQTrZtCbApNu
	GnTfoQQzg8g8Lx8kRtOJiTNPD77gMqQZTh/2pKdo5CQ0xLgN14a7mQq35809ULGNhq2udvlIVed
	nN95UKHB6A1R4LLvkkj0/i7FhKZ75iIcjWhp4exeM/VwNUXLfsVg8SauI56eDJrPzG6SnL28lnG
	xZRqrLijOpCd54pFNdu29CVh23HRvCnwjR1ZX3hLb3x+UcRX115w+XI2bg8Muy3BnI7f4keI=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291727e0c.4.1795447595289;
        Mon, 23 Nov 2026 07:26:35 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291684e0c.4.1795447594833;
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm420926666b.11.2026.11.23.07.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Message-ID: <8560f4a8-41e4-4f78-bd0f-3aabe731b79a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:26:32 +0100
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
Subject: Re: [PATCH] iommu/qcom: Disable clocks if restoring the secure config
 fails
To: shyckless@gmail.com, joro@8bytes.org, will@kernel.org,
        robin.clark@oss.qualcomm.com
Cc: iommu@lists.linux.dev, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b045b2b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_2H1bLmklXDtjbdw0hQA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: CScjFFOxph9fSUFBjMgzJzK_FBXhD89S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX3HKHBC2HmstG
 9+QvFrHcJGALcP33QkEF924BvNJrjue4OANWWS0TrhnGheN2ycgtc4nMCuxuG191aw+F2VutnnY
 2XpWmEwtV6D141YqI/LdJ18M/JVXFEMyznUaOolD6isstpRzEAh7jmwfMISMsJu4jt+9+L15R4w
 0fxBPsTSSAwFlahKmfbwrZbAK3JxedlAbHkrl0h0dCGx/YRohHK0aUsQTjgumBT9te+EhvnpJXM
 axMMAfFoGpW7bVoI5aG5xvmtKMVpRuW/Bn8FeeijdPRE5fq2ngT9FnI9o4SRiEx3iQtJzm3/lTW
 WEOjYUZpecf1V+Z2DFXEzSZJPeg1Zr0+irsDkwdk8tOBnkGgrcFfqoFs1vuSgMx/s7MRmHf4R1d
 EtyFJfgYqD7lHQ1vCi1rWhKf4pMO6Wcftogbf/4DEPxQxTZOEmC+0rZ7zZqy8l4nmtQG0jQhYpO
 gnfAg8uMQcy5M5KbC6g==
X-Proofpoint-GUID: CScjFFOxph9fSUFBjMgzJzK_FBXhD89S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX47UEI/GLexI5
 dt1A/95cYAlXinfh7ps5Qty/NnUbAxChlNrpX2ZH7xgk2Slw2Q6iF6b6kX7ODILLsaJfD8bmHad
 CRfdBeI+3thPAvhTfnElEHAXpdWZvxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/22/26 11:11 AM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> qcom_iommu_resume() enables the clocks and then, for an IOMMU with a
> power domain, calls qcom_scm_restore_sec_cfg(). If that call fails, the
> error is returned but the clocks stay enabled. The PM core then treats
> the device as still suspended, so qcom_iommu_suspend() will not run to
> turn them off.
> 
> Disable the clocks again when qcom_scm_restore_sec_cfg() fails.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 268dd4edb748 ("iommu/qcom: restore IOMMU state if needed")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on arm64 (W=1). I don't have the hardware.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
