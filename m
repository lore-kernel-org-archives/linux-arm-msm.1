Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A551AEDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061754; cv=none; b=bz8Dtk1eufAHUml7QaJQXy2NpEKskP79qkbbNCwl6mRRyjw8CvO9wqhXFERcxNFso+3jHFHhibnnWP7Huyj6CxylLT7pK3jxJ9yOFQmz7v6ZC27fl1OQHZHSxdunfy+oE2X8ALZUBXC8rmxOG8llH0kjSFNLCdE/Z/2kmNpPX6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061754; c=relaxed/simple;
	bh=C+eZiEQdNU3zDh9swlMW/4tanW7pYuBILnc0ncf5+gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5j2qm+qEatMTzJi2mM3vl4KX6wfArROa2a79STTrRoGupnIbaPWghyS0TftGDEGfp+9L7V05JQVJSOJLGpMFNktNPKVCxCzffg9Uiu0MMxaSl5qr8Bk0k4qlB5lMzwn78D/EvOz1hsv6vm/u37awHAGSsRqaoIQckGAwGt9F3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9hfkUJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pj5ebcd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9hfkUJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pj5ebcd1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkFC3510589
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=; b=i9hfkUJHlEtK81m6
	p9H6hfY/FNFrTUz8p+j0Ft9TyYSh3evai63/rhLdyRqZy/040bHtIbPyNxTAweAT
	OOqW004aHVAyab/ihvOWkox7fbUGAI7CGkWBLiB0mVoVIA1/LOt45fBs5Xd591Qc
	MJCkpL4A8+XPagTB837WUUNMXbBo/70uhLeKvSyWIaaB8nhetGEckwMTPxtOsC1I
	MlhnXG8cFdFNV4aJFk3AHlnWGr+eh8TZLvZyYr5jtvJ5SPUtHAZwNa/ySKxel4AB
	EHBRJfhJ9NIC0E+nfIeitrLrXAyPAejiMbK2bwAvUfhpO1v8aIJwe4/SuszFLSTY
	eN9mcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9n47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so16386891cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061750; x=1792666550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=Pj5ebcd1/FXGKRDuokaJxilskqW5UtFUzFgD5s19kR/FbgZ4h9X1Ozj1tfKE1EBCa7
         FfpfUbEUSHD425BynRSXW5q7NXKDmPOoUDRZKE7bpzfqpM6UT+THbWDR8Eq/9Q6G/JcF
         iot93hUgngirjuvqp4fzcMMkZ89cjpt4bjyWyXMlTKzjTm++PCKvywNUSmw1cbkx7DEI
         z4TEoo8+YjYlhfLxRpvEGNtlMn+zxHTkwCPRMfzDcEwGGZIM+DAFYAIf10RCJ4q6muQQ
         gUDhihYeUcQacRzJhFQeRyudmAFtMcLOGcT7chhOEkomqtRyvug3YM28EfvDN8Sh6hS0
         0I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061750; x=1792666550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=u8ogyH1La7ATwyMVS/Z54Ai/E4vyak8G3qXu7LY44bpBWLbwn7Nd6Vsnxr4DztWj2t
         FFSV94iw73mSVKshLiYLQG7H2vDJYSzAYzKshq8qYg0Lpkjfi8uxdvuRsT51VX3mUGsv
         RboVWRF6CknSgyY56bOsakpzc/TfV+WX0a9/B94fMjEdWCklbQcIlOZAhbDQb5YDu+vb
         3KMSKTiiyLp7qBC+ijKKEhBGmlHPhJwb1hvl/EKkv0J6VKFGQWb9P9QnOWUQFi75jG56
         50w5gY4YbR38iS7knAGrldrcBtXjZctv1Efyac3M505QX7F4kGjPZ12ZRpqrD/B95Fmc
         6u/w==
X-Forwarded-Encrypted: i=1; AKwUvBwOMT07Wb8wgAoOX3JZgSZQW2gxoV3fCE9gdcEjZw9UK7mTorPvMy4CSXduKsvdLYtWUlYgwpHGeK+Jf9v/@vger.kernel.org
X-Gm-Message-State: AFq9FYLmevKbsKlhZ+iBW/K0WqKyJ+20+Xc+ecaQzNrm/b9HFwT5hHHt
	P3K+Uj7p8ZjIho+TfFuI9dunVLfapmLj4Jt8ufL5h68yCM1wKHF7SxETdLPTndnrGfmCjweqdJV
	EMoRWC7JzsALtkXayduZ+z1Fi8fRjFbKai++lUzNkmOv3/jjrEJaDSm7YrcSHy8rdShZx
X-Gm-Gg: AYBFou3QHNvBffi6CXMv2ucFKwU6R1pGPw5oBJhqhv6HZqWE6awPYtrbVoiE0gJ3NeZ
	7dyLMm66Fpf3fOGTjiDozq9unXVHOOSTy2QG7vMEw2/S+GMa7NkN4IVjal6X7D1lY/YBNNUHAjK
	W9M+hxN5aK6PoB2RBOjagTpk1mPU4hmmOD/zFtdGEMA/0mWfb+D6qQ8lLR/cN1tNtSXW9YDbRXt
	nDJLbSbse9M0quxK+UR2tj56h/5ZWnZV7/A2fYckGpXFypErOd7WKjbKZ8yv8QT3FvltRXW5u/n
	0HOA7WLe2tHL/cxVDvyJCimxN5JaBGwFLaV0h4vGgsORR6tOEadOOmgIsA/uJlQZHjfgiuc86yv
	qwnCsfZPfqCl1XXV/q4hsOA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451186885a.4.1792061750541;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451182885a.4.1792061750055;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2285454a12.37.2026.10.15.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:55:48 -0700 (PDT)
Message-ID: <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WB5jP28XuoJofmp297cr_hJHsPxIFk-Q
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0b137 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JgZe5hknAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5hyeucPKszPg
 aA7znY05BGGB88bXcvuq0FZpZkckOOYDJDUdUpmKjSywl9iovuz5vys+oUwFGvlAohvsz6aVzrA
 GmoysUVj9sbqhQ8HDRBmerr0j/lv7UCyOSlRlT84xumKfnyY9t9ZQ/SuVDaNKdkiP1CT2Rp6lbd
 nBjOF9L9sP5I6g+P9nl01n+oVRGb3vXRhmgNgcfcu5+CljxdeEeeKgYDNBbyFC2lyupdk/2ieko
 VEsmenilJIwW9rN16BBk35y77yZge82ROk4tca4r3mCbokWNy3d1uSRj6eaANkfiI+xuc3xWvk2
 A4k/HBu5YSu2VvVW6JQzKlahcnaU78kkE1SuFnm2rcSGn+IDUIx0ATw8EBksm7haILFRIfRWmya
 5CxKRa0tq+W2N47cPe5l7ZcsN14dNjR1GZepkzMddl0+fjkB+nAZKStzDlNFMgwU8e4SqvxOQV5
 i+Op+VetD24hbqUFZhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXzKBo7pyhxLiv
 0s2+9xt1bnA0PixEN8tC2MYNgbhRoc/hAMcVZVW7gtuHWzYVnl25TVai2ur/h6QYlc7v+i4+c05
 CUbm/SO/nPKAqeZh4dmJcR6d7Njw9FU=
X-Proofpoint-GUID: WB5jP28XuoJofmp297cr_hJHsPxIFk-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

[...]

> +&pm7250b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1500000>;

GPT believes the downstream DT setting:

arch/arm64/boot/dts/somc/charger-lena-common.dtsi
18:     qcom,otg-cl-ua = <1000000>;

should translate into the max being 1 A here

Konrad
