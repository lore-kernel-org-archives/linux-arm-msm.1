Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192737;
	b=jCBOpNqFtEiNZjcEyOGl1Yy14VztjNJMtl65kk5S4DliyOX/YhagZd0OHXfW/4IHrrOs
	 T+dsa56dFruzHRkYOj21ina3wmtNJxuIJguZOz0hWeWAF4bve+aEbeMv8N6F8FI/AGijB
	 YCnlSq3WVK4o6+6URwm6NmMYBiYFQ+LATcq1I1s5Z/emcjOT8BGs3zz+Gc8Zhe+ptEDR7
	 gp4qb1zsKu4IBgv8yMdWqSP1Osx7fHSea/l7qfF8mO1i5j3YiNSgC9OscHw2donv0dOat
	 RGUgUpTXZegG4+HkOmeatX1CspsVS26HHJqesM50JQO+skbXnPAR8Q7pr9Tj+ptVyMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
	b=Eec6/8q5c8NZzY3ULAQjaQOpc1ZB4fFb9vMa9aNw5pGOcQFi1X7wjl5CnTNK0ouzSUVZ
	 GQu9zAqn3QWEoAlETcZCMUIIbJdpD7+TKsRjlTVeZGh6PhFab3uG+3JlNXijcuito8QBy
	 C2YJ1H3ZZQaXYtwbjuLA3kZ+vQQ3Cvsmh4dQu2gnV6YGWmlJ9dnCJpKLsMXyvwXvgklsZ
	 Vqlnfk9IQSsTRWnsaoLPfw584qYC6U4GccfpuDKr5w5su+ej3sZD1XPnisGsjBVwwt8Qd
	 88xGit2KCgq2tX3TL8CieUIklLn8aoyAxvb9JNYjGFYiKeRO07xTKP5uzw6hI64Io6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980A606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B980A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdsMC1011769
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=; b=o2nizMZ5eU4sccxm
	69Zzcq77ESHaWV2GKCTtroabump9QnRbs4TD3zNMeRCvTmiVPPbZMeVmgzyvHOxS
	rLJ16Yq1gxlEs9H2t/7W8WmtsrC1EzYPH1IQJvJce90i+b0XvBFYELU0yZW61lSA
	qUNWoQUjeAC1q6HQtAsgS3JAdQgEKuMLa+BaKYoplaNAErH0Doh7UdV0Ks9471UL
	GWmd8MF0mc0vauz9s/M6JCBqr30zyFXrO5bCD4YHmtGsX4kb8fE8EiYs9TnXQ2i7
	V4XjQoFYhRglHLZEmYBkitbfYSdpqTPoXTJ0OM2bxTLpGPd5QAREzbct9XYC8+DX
	58+GVQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgh7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso47527e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192734; x=1793797534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=WL0Dz8WcjyVRcZD75T58BfWqCOvMQ31JdAJO36QGp6utB8pzTtsXhXqIU2F+7wUoii
         CT2Y6Hi9YAe4jVfASOWxOG43xWlX2FJYD3ijEVD6Q6KeszLsxLfmLT/yR1jCvjjtgagK
         65o7xk6Wy8/gdHj2FBVrN+FSHjnksXYudNECm3sR3B5pxXdDbknSh0plYXgnYpI6+h8S
         F3+MjobShvwvUBVOMYLVGSmIM0UguwbEspPpAuJINxARERt6Dy5KuYuohGGrVtzMAIOE
         HUQYQkj8abeczFpOLgcZhPLbrdfre7/ME5Cp8ZUvbhd6wG4SNQKIRsKzkhUm10OOL3NV
         3dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192734; x=1793797534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=mlJv0s/fFnQYCaQBxxSOHoAJRHlHBe8DzePrKtzjLRPTzhDqrV1s+ZQSw56doW9LQl
         nzLvLN9OC7osoa7JSjky3Y3SeoWk6rwC0XnbIBB1Eb4oKDPRuFz+JYjxOtmuoBTGMuPs
         u76Tt6FFX5ETt5IKQ7UXNGUEMYo69jdwUS8VTlTeZFGCTgILD35K/ZeMvtlaJTA7ymtV
         KAzOHSJPKbrykE4IenMi11s6/lNCH025jM4jAy1jOkNyU0nS9TFZNw5wy/Sx6HBOkbqs
         mr9vna0wL+sWmDOXjNw6a5qDbIvU1vG9ouylD0aCfO5rSZOJOSG8nbkzXaCr340StiDx
         P6gw==
X-Forwarded-Encrypted: i=1; AKwUvByi0kZejD44aNZYQYibYTnKjm3XBdiBZWGPsvUvlQUhtPgftsM3+4UtdjqtrhI26NtQWsuC0bfnU3JLxMrz@vger.kernel.org
X-Gm-Message-State: AFq9FYKzzFhSs0j6T7Li+ZceUCaz3VvhDd5L+SlGGNkBPnHAQmcg+e5a
	FtIvnZPTh5+62xND/QSy/OjaIvhaPnCl428r0mTOt5LLrzGmhYiLlf7+g6F1XORZhxW4QITO3X3
	qBdN4Apa+SEaTlxqQTFlHb4CC/nfg+Up7xTp4m1X2hfdZ78PvlOp8i/I+Mvrm7ZR2Tmch
X-Gm-Gg: AYBFou1++5a8Em4hGz2mul/bduHD1TkMI4MjlUnsrGDQ19E1ufKd6UBJJurkFNOx0Kp
	CpBwPfOqStj3QonU1Fp+1Y5OeTYmedjX00+XKiARk5K3y+Rt6cwzq72Iabb7tmWeNxBjWSMwax8
	JLb+3azecWaiDT7a/b0FndOo15gMMPESWzaMvIjJcS2vlSmqzFZVEbZjb1Zk4tlw5X5s1E9KmdD
	fdABtZsitVu1LIF62en987URNZ63yRJqh+fGzx5ddxcpk9P929VlYWXJPaq2gezpHzTKKnZNuoq
	arePXI07XPWbkrJwWCymd3VaezLRPlORNZKXEo4MDockL4AAadBT30oO+Fpd2mqQLp+YpjIPU1H
	7IfI+4VSu0A+n/SwT2dpgAnGSY6fviOAXBWjAA1OYbN8qtOH8jvAw5BnZC2NPmNBGo79hIP0=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814521e0c.1.1793192734200;
        Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814465e0c.1.1793192733616;
        Wed, 28 Oct 2026 06:05:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm596617966b.8.2026.10.28.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:05:32 -0700 (PDT)
Message-ID: <8156127f-a20f-4152-8b3c-cada25a21dd7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:05:29 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX0cBXm1pqS9JO
 bRpFNGkaS1JC99ars4+J9+z2h8NbPIiB0LVL3luoFW2y4HhtnateNdTdeuBojAii+jYy3BPzt6/
 NlHsvbQcw4icGwE/AkD9yAbgWED3EliGSqh1MT20pgGRab9k+WbghWw5SE7kXy9SogF3xxRDXdq
 QsgROLgQswaD9Q1rwsGBA7VvMSIt+aG4kh77TYHoJ6dy29WqlFKPWOj0hKrG3G73lbjoht6Jc8P
 kwSdRydjaMNywZpSHmZlJJBWoTpwPJh8rfi5vdqgqQvbouej4md3rxmA2/dW1m6zB4TuupC1PtI
 wlMlM9u6T9BlNfxGzS6LzisDSySlNc1q4XdRoeRf1X1gGqfUVP9KdAO6oXUsGFkvaTB6GkWf19b
 i0JUbra/IU5yv0izzViT9ATM6thbaDSuAgBOgFqcT4LvoUhHZLmpfqO88ZDw132sUsC42MmNvf2
 OT4aOA29KtVJwmBchWA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1f31e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zpnWK4eklKcjKML8EKEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: iz44cswZefbDTSz7Ex0qmFr9F6qNCeQJ
X-Proofpoint-GUID: iz44cswZefbDTSz7Ex0qmFr9F6qNCeQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX6XBu0ZHK8KZQ
 2sG6ABiInKhsdKWjq/IAHW+3pgss44IxSTvCjn+bKMgLSEktGER7u4f2UeuGjUhMmxoUW3XU/qi
 rLv2GmVJllMqSyMRWofC5rHv48WRBwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 7:08 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
