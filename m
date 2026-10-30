Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364661;
	b=otbnIpcd3P+XHqQCbd6Pee8EtNtvUH5F9SCu7QhSdN92Ascdm0Z6REmbWee6equXTzAL
	 Nw7uu6IVN9PK89xSk8Vzr24qLMq84KmQzkvrZ9Bcx33YnHVDPBx8m7l2BxBZAt7/9JvTZ
	 t5m7EOJgz7jPDZNyOn9v81li+1vU9x7bmX+Gb20b5OqhRBEmyoBC4qN9FmAEmdfc0HbNE
	 aAAzg5M44XFjO/pL0JSr1JNgsnaqtPbF8emjokrmpywaRI/JGtC501iI1o1b3wPr9/0to
	 Nmeok9Dq8gJ5j8UaCTqKMnnkedxF0aC661DAK9chxnKDIpEpJPpQ0ItkbfBID7m+gJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
	b=U6eJ2HdgO3o3P7eMzYVqBFqbFon7vSXIpParTRbN6oxI+PkXvtPjuEIQf5Kxw20BIbqb
	 yTBhQYOjJ1AiNIZoo2hejTPnvxPCqp32nM9PKCzNWneG6Tke7XiKZG7vdqANEjjE/mlJ9
	 vOqHtPg5DdbHnXLEdkFyxa3lrV/Aj/z8xx1fZ9iUulg4/+p9TKY88PnJRU9/Ide2vuvYF
	 40TMZmExY4voN5ZT+zZd89B2Iv59dUq7dzVoasMqY/GSrhUSqnAqb/JGWNJtQy4/wnVwB
	 QWvVYSQrm1oKSPBue7tjWQ4Au8U2TabfY4gu/PwDNahd14zQ9EHYlX2b58ze/auuvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1ED60A260F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1ED60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG7ga3142184
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=; b=Uk1XQeTf5VBuY6rY
	ERww9IO0Xx9JMZCsG+b6ToAoehRvNhRcgWEeSCp3bcY8iTD3J4Sz109t/9GQbYCD
	6pJnsCExKblc4sH7+I3I7dwz5xvpS/qUblktApuIoMV6L0EcI1bskoX1o0pHQXD+
	bubrU36IbjVn7vM9UoNQhwU3jEsr0aKc5a9QXuHl4xcuhuOiJZ8bPgctyCajg3TJ
	I+QAGDNKvIV/XZmy6fwSYbCqabqH0DCgcVJtJddT8SB8y625/GhE9X604Qj9NujJ
	Agjd0K6gDffoD4++126TGBLJLS0LtOj+vKRzMc4I5DPt5LlRWXnoln63MWKdcxt4
	dDh6cg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk297-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b6210181so7960241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364658; x=1793969458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=BbjxLpENK6NROq/blE54+pYHDTX47+cg8DB8Bzkr/qplFdBR0o1EEU2i0oPC0tC8Rs
         +y+ewt/jSODUnda4vjkiROZ65NinpuJpdkEUAHLLJGn+JjKFo12C1l62GqjvK/9CBxdq
         cVwGcK3mFJYCBV9Zmwfqr3N4vdsZ+7Kh6out5vp7I3ysO8yEbff+ec9u52rdiOZKokMS
         HjaUf+hvojfDovycByIeXHHHlQ/FfPZYNCnYPOX4y88SmBhHNU+26GOaZ1MqLANQZXep
         Pk9v6DU4/tbTwFikQqsNGDVNLmdVmge+494sJZqEjEIiRwahFsZckTq2psbr7+mvO3+p
         K38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364658; x=1793969458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=oORdNu5PWclRfzzg3pupOvVfPQ0CCb5uM3uAFoGtkx0p0FuhejfAlESKBMEzvZ1evu
         yFgmIWCjfnVWNJh57e39euSn0PSht0kYxBa/BFvY7wbolLmeGvbps2/1tPoDp6hicKRJ
         HFf+pNJJi/4UNvcqYEJCuaNENP3J6jfZPHMHndMa/MpwzxUMsl+L37Hr7QCMydKF9qDl
         tN/Ins+PRHe8qHAJnYN02oy5HVDaIUEG5EsnalS5+qfa+2o6ZiQXL25WS9e8zHhq5R5y
         ygussoywaMN9vJjQR+NwQ3gJgLIrUaPkK2MaWu9RM8Pz0y6zX9tBVSXZSbg+L556RKxY
         ho3Q==
X-Gm-Message-State: AFq9FYJvwIvKVF2OJDXqPt6viaCew72v7ltnwGpzBlyLk7O55dpccEMW
	iBjGn28mJEv2G1CfZXtp7aTk7Cb3EPcPMUwXzU5DFA/5wSr8KGHYZ84vL8738lx1KXp26OUip6B
	RGhIsDmZWZb0zTeGbWz7IRpKlrjpSBqE9XBKFve4eFjSyVCU0FYu1Pf0YCXwxxbbHvPJJ
X-Gm-Gg: AYBFou3HLlYlZe+AsdlKHJQb9K/Gn7Qom/QrH740/aAHGJKtHYCHbFe0c9Yi2OKx/tU
	xxtmYmSOA9MnoFyNpGinrEPRzoM2f2hSvTa5NvmCYSUf1W3R23iJKGEttEI6NozIaatbS7I3Rig
	24i5xDnpqktEo5SR1HS3x0g7HMBjFUF+WVf0S3f4UNfE14H2mMHMlRjWmSxZTM+NB4EvMAs+nZE
	efpKCDhI921d/zsTXOig8Ben1qjYaPtby4btpi7ybQjlSuTGvxO5L2zzCPx6vB9w7v5eFZgvk0b
	I1SUAaGB+hk9iUHd6KyhtHQVDM20ctxE+cVsmjHZS7cJakIn7W5qdrp/4CPBxJCyiPcSpVEaToV
	Y3nILBer5LLEr/cnHQH5KAoCJLm2tPI+QfeEPHe4xRzHVKs4i3G8EOqN+Iu+exEzEYTKttmg=
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915233e0c.4.1793364658192;
        Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915216e0c.4.1793364657717;
        Fri, 30 Oct 2026 05:50:57 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:56 -0700 (PDT)
Message-ID: <2f3a14df-4443-4c61-b479-c0402636b737@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:55 +0100
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
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JEd7vEBTbrr68A4MKW1lmUdEXAzMA4iG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXyBWO3jfylyeC
 ZHxrL4pF29v2RpuO52QmAlG0RKrKdPsVZwht631ClZY4itfOcUx8kMjw8yMJGhq9HzSSt4Ywk/z
 umZQIltVNZ1ZTnErwEDAApamH4N38u0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX372Bjx3UNTD8
 Ka5lj6lSkBV38Pz/WvHa2KGIXFlUiacVS90tIjx7M2lGSLG9myIUAPIizcALYCyNHvcEaNHxeCO
 +12i5NFm6C0kIOr0yvB+Jf7j899/vYmfBXffoXU+3uIudwC5aF50D+A8cEfQ4KMDkQXqLjEEs6a
 rZxwZGQK7u5iBcSR2hiEPMD7K5S6TQ7DMfZNHnWd66Vco3CB9bfGuL15ktanQ4tlhI5nL9cF0t1
 7bI4s0vCNyt3BhjYMksCmyW3xqYN+r5MzlO7LqTg5ipWA6Z3+9LCOHawZNTZmR/asCYLw65+lkR
 a88GnxGpeQd9HSkJbsaOJjfNks2R78pQiAGB2JKou77UtckbAD08+3axTSii/aL2WIPBD2JW0cA
 RxPO2NXeaMIvIjAtfziAMCKdc48JMYukDj6I2239WpIm+4F26CVSncxyXBpGbDt+/l8PYM5NL33
 hxfIIMha6fV3bxgeOAQ==
X-Proofpoint-ORIG-GUID: JEd7vEBTbrr68A4MKW1lmUdEXAzMA4iG
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae492b2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FBJPXfl-2ZM4KHcT95oA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
