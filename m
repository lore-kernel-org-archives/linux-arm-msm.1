Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027528;
	b=h7oV0DnbKyrmy4yGjcYO7uYoNDBlmV5euuYStoAKVkdqFF/fXKff84sbhocVfhBGBH52
	 rdnkhXRj0hlVnYc0v30aYZEfy6IbFXRigMJ3Z2C3SUN+NtI9fgH6MCd6I9hzjI8vic13H
	 6Ixce688iCowUrizAQ6Kh92P84H5qB7B1ZBGQJKboCt7HIei9Ew6PjeL4gXhYA17olpMQ
	 jy79JjYFJLyR8KU3K2N/FfLf4ASyF0Qduv9UmFBarG7ikhVAVPkLq1aqQxD13oxpW99Vj
	 StaQc0eZ3xIPTJCFrkR6nqHUf6x7EcRhJ/JMbRH53SKE3P8UBWTkOxkU16qMu57f6vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
	b=a/x+JNtxladI16/lyD05E9xBM+fHyNVvU7ipbtekcokXY3E/3wR7ZbE3axiG6RnyCq+S
	 zz/JBeOTBcc5MDnvH6LO8ivwmSA0TtQTy9FnSaGNNVALKwMWryrRuw4I7m0QzbAP2gnvP
	 9J72fM4fEAyo6nxCzRTUt8/e/eTtBrcEOEsDWsilymrOeimEbwtS1w8kFyT5JNtFPhVlA
	 8ZXVrmlgzEIs3/6Y498r0V1usWIDm7ax/Mi/lSb8/r3U/JI5oAnJ7PLy9mKUG5zB/PbwR
	 LW/490UBNXBKHYWt8TFfuw33QPWvvz1rfPq4Q+WPF2c5CaJt3HyKvTzTyY4MBTOPxIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H0IHp/CN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F160A2610
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0F160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZYjwBB8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0IHp/CN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG2YJ3412661
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=; b=PZYjwBB81Hid/zVF
	k6/+pAP93fHhK+aQIKnJKf29J7JdoNn062YzdC8vc9Zb1bEqqyvWIv4OJS+19vUf
	kxA90Xa2Kxu+qUUmG45JZcVby9g1LmyUdy1vtHGndI/RkrFOBuEevnhrfksLJtNP
	sMXO3znsSFtYYZHzFZFvNNO3y5cJL9gGK6w/YLoB+N9/bEPtXU3cCRGrnLom3Bzk
	rSl1HQMMQboo/cgac5Aua3XbDUBosOCQakRemjfNYA/yN8Id2TG74eHMSWZnM1wG
	nuHAX1+/tSjS+mbyEr4RXsG3CP3cykrVxxrZVLN4Aw/4IlRZOiNEldSC8txgj0/a
	3Xn8sw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnrvcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:45:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so796106c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027520; x=1795632320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=H0IHp/CNJNuZlxpsyggXt/uDAa7H0Ax+IIlX2v8JxXQtmJ712p0V6cvUIqvKtL/z8l
         KlSOSr7mjpnaMERa9J/N/mDNrevHGzxH9d24cwQonDF6el9wbAyObxDiypJGRFPyykqq
         SFr9wTUvxBbs4nX+3dLL8hGSVGvimRzfQ0gZjuzEculQ/QVSi5ncDu5+PV1MtrvNZCLU
         S+ltBP2b/dgOa6qz3rS8mhf/WNKse6TUu3e/cNyyInNGU0ok2HiooNE8CoIHuR0fzh1L
         7YEc2JOBkw/En6ZzVs+85ebeaw42+yyRN6PLR8+UonC4eNU2e1epRObE1TgcmbzfrK4m
         nV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027520; x=1795632320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OzZpcUFjpmG81df7E566yXplpxzc02RjjT/i4nIPrI=;
        b=fV4FTFBWhRAUVb461jUz5eCN+YmTghrluhHTGsuDSnibHf8V/HuKWBOyJloOldAT1J
         lE+Nea8Hmb7XXHx+ZVIVR2CbOrf7VeOxs4OV1cqaJiWQeVtQ1nsrX6kEvNyYAhMqjLwC
         FqyicMf9X2HPPBPEOyY6maGnz0/27MLNPIyApzkQ0+/rEnQViM97GpXlSDHXqyjkZIpm
         33J+naLnJ586jmMQDPwgqU91QVhNwCpPjWYtEqTwrCqoZHQ6ToSXIlu+N2Zn7iiDG5MK
         QI5hX32gDdfeGOx81cnQBuGYDyeYu3heKlJc6Bff6FVwvnUPXQqIdT7HUbqhyCy8MAG4
         Ljng==
X-Gm-Message-State: APuU4Z/8gCqzaIJB6wrnCsBohzIXkWx+czydtVWoK1XB1FAhFbi56Kc0
	V6KKPE0nRsBiJiQ23xjusM6eRJO/wUv8ghVWarGVXq1SIqEizdUlrtmkPjC6K/XAnLV/Y5sY+6O
	KilhkBdSlNLwJfAFjQkiPpcyKFcj3HmWTHc2BCf5t8lKh1lbKG8yACRINsZAstOHfbeUg
X-Gm-Gg: AYBFou2+bTe/r44pVEGNBA5kEwF3Bw1lEcnuWCVWzo/nWrpjmr8UNC9fKtiaTiPbXID
	r+19VuOgTxVpD4F1Hb0/Nnh6JNU15uavZXQoc6osrWNmt9g+aCJUr7nHDnA1+mTteghGWmBjVpo
	UhjGFful9Ova/LNj9NJc56fMhsJHOlq7TipxZCPB3Jaw6XunVZoNJmUsF5C+6Tdct0587k8jZwY
	2H82MxfotqHtkLT8v8i12+7giEo9/NhHWR7IUPB0Gge1aj4hiYrtlsXbJMDU1QkWS7gqfgqF3Iw
	Rm5a4L++Kw1ce7LtXCqblMVZ6NP07ATrM9vkzVHw4Bt5Sa7PLLQaskO9YqBDBxDFn3bcmzV7A1y
	5L7qFBuxdCCaah2wMbaULJaE8WDivE1ihmqQvP0SvveEo1zzXiZWT7eszAcUcPUpVbK00dww7ag
	==
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282690c88.37.1795027520268;
        Wed, 18 Nov 2026 10:45:20 -0800 (PST)
X-Received: by 2002:a05:701b:424c:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b543d0c613mr3282649c88.37.1795027519445;
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm12271571c88.9.2026.11.18.10.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:45:19 -0800 (PST)
Message-ID: <c495dc29-5af7-4abd-9608-43b0236c15fc@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:15:10 +0530
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
Subject: Re: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afdf241 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Rpd184sqDP2D46n30CoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: jMLUu_dkua8hA3fHaGFPkcZnMcPwGcu7
X-Proofpoint-ORIG-GUID: jMLUu_dkua8hA3fHaGFPkcZnMcPwGcu7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX8sXbT3LGjyyA
 u2nYCcVdGlbjn0EtKWaZ8iNX+xBtqzBTpFE2jYvYaGDv7JBwYAY7t/IQVlwgmXrHS4gJzdZCT9M
 iJPfnx1XDCMm8f5kWNjt8qliI45Fwog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX+tT4AQwr0V6F
 JIijDz34U6CtmJeTRZ2IUZcvyaUwi2Z7yQhC4SKhvmfAQDAgR/d65jQGdldn/2I7a+cXm+Owx1u
 WzrkOMLJu85Zd8b11QqKTuPM0ekYIImvI41QeIOYSrusWCmv4ZnlBhBh8zePw/6Eni3fPqxFsAx
 f7JFlOUijFKtADHmSNP6685Cv896NGdY9JbsFbAaX4DOc+2hiJhFEKpV/1eTPConDhbbZDAsAjd
 CjQP5gofXLWs2dzLvadeEZ/54QrVBr1kv85FIGvEgZSsoIp1fzDGUVkpRwtQsNlx5pCkXd8X5T/
 805zYlA+uz5Xni4ZB3/xqgGS5WlGETa7lfpV+Aic7qq0B27RZVq5F+hmmnLbBkWahVvZPvlSnGn
 UP/Jguw0GeisQN3wn2yjSbdMwVwa8sJTICdZmBbGazvX6VcK+MZ4Sj+h4tMckvDN7m3T/sw5Hrz
 hqVQgyKjFOiaHmWSpJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The CX SMMU aperture is a register block in the GPU. It holds the
> location of the GPU SMMU context banks that the CP uses for pagetable
> switching.
> 
> On some GPUs the block lies outside the existing GPU register regions.
> Add it as an optional aperture region, so the driver can program it on
> platforms where the secure world does not.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3c90a09febe7..5e4f3149839e 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -54,7 +54,7 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    reg-names:
>      minItems: 1
> @@ -62,6 +62,7 @@ properties:
>        - const: kgsl_3d0_reg_memory
>        - const: cx_mem
>        - const: cx_dbgc
> +      - const: aperture
>  
>    interrupts:
>      maxItems: 1
> 

