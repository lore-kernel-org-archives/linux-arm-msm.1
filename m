Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193085;
	b=2ATW3JclDVbN2szFxGr7e3qmZYHTgQ7/jT7PTpPO0UiyPgTypFomPg9oK1TOXf7F3fNJ
	 5dcb6cfCzt4jo6DYa+42ZOu24mU3TK1L6oi/WDSQTiRCxs9sH7RWGI+1dIDHRm/gw6eFr
	 ZbY3095pocrIRZLmreJ6flqzLg5roHFXoIEha23ZWCqnm3ia2Lm4gGKZZhXB3V04KkpOQ
	 6FxFZbhte3PoaASBpuN4Zq9gx0JBatTJj8lj7YmP4zdyuKnEfYyxxB8e3D+nq66jn6nOG
	 PwFWJbWCpLtyRPNDKOBBd+XvZSpOGdAjei9Ttu3rSZtjize1lEaojNV3w7I+8nEhFHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
	b=mQ0QmmP8sdwitoTXG2+uo5QQngzlp5yo6iI5Ijoe0ufdJwt8fnXyNyoD3sHNenZZlUv8
	 R9iHDvmbFZjzbWmxixEG6DyzAuxXDPS9wfIrT+wyxehVEYmzZmur/BBw9Hk3DuDlZaODg
	 wCW6vCBqfOpB6qfzNi8xHv+j5uStC5FMUvo+NiaX+DPGLJp45MetzsZ7CFW5I2SaoOPKw
	 soeD5yBnwdbZLMwOZN1BlGhaJbZGfffo9VReP5D+shTgXY+SwanndbGj0GNNcBp40uvSD
	 FqvKVTq4YTgFfGLSTXX+bBOcmkuE62auS7maSl6IejDb7aj/BDxPzcODKwwy3sH+0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDs/SelQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C8F606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C8F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4KU+Ndr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDs/SelQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdv9F2082338
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=; b=A4KU+NdrY5SWcHMH
	AXdRRFZ8KYnGZdgJm/3Ak9itR5CUTDWPK7Q/T5779I1OfCGJoUIQUutrJYU5ChC+
	xGw/OOvy2MtG8ehXdN5ARNhAYnDqxXV5ZgAz2oFacTqj4tGv+98RKqwnCsaPeNwM
	+1dnkwpZ4pa13I4k/BXc2MpknB//bSGRZ28XcVB8pKolM8BlaBm+HD7Z3mNPIGhH
	MA7H7GFMI0/NrJ1uxcMlrKsQsWYm4xajrF8xO9IQC54zpDWm1Gvz8D8mUy3mPsRU
	5Lv97QuJDyCuI3JE0rb2H8EabK0/Vz9mMycAdTKQ3QgsYnAiNKJ21c86UONjMwHr
	4IeOrw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv48u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:11:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead2112f11so44824e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193083; x=1793797883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=JDs/SelQPxnsIF6VYKq/R2bGxs7amcNTNX2a26zG3WU3oGFGe0VUZI/g7OfsYDRKxg
         mdkeMt3IMkpPWZvAcQCmIMAgaZg2E7a8Gxw5Rg/2vCG3z+bQKpK8WerDRaMgwU/FvXzO
         wAWM/SY9oYIiwiH5a76mbPqE4jhHonShuKdxIvZjaCsgPkbmVAvoPqGlBNwgPbAgyXS4
         U/7LfEh3A4iPW9jLG3f5qDD/9gWGoNEnD4KrSJBUKCqllLNjqUvBt0EfINcz/ywgutG9
         4dh6NnJXAD9wp7kkk3KT9LZ718wKq6AVdG6zKdkpxttcZjnf7mKrXqZUYu2lzsQ4dSgC
         lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193083; x=1793797883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyEZvQChmpUEviU3rY8DmvUGfLadj5H8ux0zdPUq4io=;
        b=YIfs87YGVUm1Lbdpp2+xqwFfe+hQWS1tebr4Il7/U1n96106fL6t6L3Ks/74tivvUY
         AoxqFORmsjnuAmoOQnmGTaIp4QFMupUm6Y3r3s7YDA1IJYn2iDAW2Ym1e9hqLJmw84h+
         j3sX3nnhFY4SIyzWS8V7rXUwq8wLKItfDMKuELXzoZQ9HtAwqrY0JFT8zWtH1M+zZyrM
         dAjMWtqhBCg7hJZqYe0gGwYrleD0moXUUZhcxOIxQPrsflGTwD0pN5oen/2E93zTGWpj
         FJm1A3TrwbP0yrmS+8K+76uaNFAXvjcdkIj8JwYxk+v/qgGWF4XDcq6QaQ1LbowNrjDr
         CcDA==
X-Gm-Message-State: AFq9FYIQDOT8KfrxhZyscESwCrqob4RNmk1N3aE4tzZg24eb7eVBN3rX
	gzlfuHMBAqAuJcDJGN7mX+N28eoz8mEokDIIu1INZ8jSoW3KATn4WlVAI+tZ3xO1h/uSM6VHgyA
	2Zyri2q+mzdypoH160Dg7dKNxMstTBhlsgFKeNCdi1cHX8DGTqD1EoBqfq9deRLTzbuxr
X-Gm-Gg: AYBFou3oPwbOzVvL6r/idQd7WtpT2cQZ5l4W2qXXh/4Jlnv2DJLPmpcuss0+aXSPkzV
	JhRh2SIuatVj2WMtK6qa46VbQLuwvsW/gXwQqLiyv+LPVdOcUvqvSs4Gsd3mCDTE5aOkCm8XCFe
	OUtbTBIZc/KASaQTgk8FGt5cb81VqfkfO88RrD/FFEcIuoBuYgpf29eLNe99N3M2+cMCE4QxdII
	Co10e1a9nmwWCBsAODKoQSiBcRY1NyYYhayO75nZtJxHN7Tzl5Ujt4ne2Bf7iJYUoC52Y/EWqSd
	1LbPRYJjIQMmLbBhum9gnVxkDOLiTWTYGXGKLqR2fpDilpbs4lCRcD9lhe0OoUKmW1t36RCUAoo
	c3V7V2N5twjHpltlsP0FUvsPkE/pViHd7HOS6tYBiv1wtan9qBHIIqttAedLwiS2pdVeLMUE=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840677e0c.1.1793193082863;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr840624e0c.1.1793193082038;
        Wed, 28 Oct 2026 06:11:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7ac041sm596435066b.82.2026.10.28.06.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:11:21 -0700 (PDT)
Message-ID: <cebc3404-1f9b-49d8-b459-0e31d648d989@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:11:19 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXwwKbE5BrNfqz
 UVIxwLn0l6Ja5JyrXt1FOakSgcNLjdCEWLOQrl1jnj6SP9N0VB8BCICU65EvCha6mqplNlqjdte
 77fH0BDVzeSm74uUFpUqtQ/EsAGgkTe9lmkKc+t5BbMDMvaDtX1M5V5W29kq4OOM+6HRRp/A5TT
 ghuLMHcgQeE9qD2OKpMZ1uw2mJ69XsqHq1q27rQ3Q9VVdbiCEsRg4vOpngk4MVrPawbSaPu1Ite
 t6+gP1jTFr9nzkIoPJJR5Zm3Gz6CGD6DdLyltRUfkSeRFI0/BWw1qQbCkDYMdm5uA2CDc6JC9sW
 XbNg5uQ4KoiIum0gUeppnYBkR0zzz24KnsP6dYS5f3a/3lGPLlhSCTexOFiEGGtjLMKnfr7wWZm
 QBJRQSzMIR7nwxYfxJfAZRVzuDDa92xvqaPeRtWPsi2xlKWubwdYSWq+G5hZlEYI7O1vPaXfTSz
 J6EyTCpbPHU55FVwRqg==
X-Proofpoint-ORIG-GUID: a6D_FB0xHo66LVd6CKoJ6sEnEbMwkO-h
X-Proofpoint-GUID: a6D_FB0xHo66LVd6CKoJ6sEnEbMwkO-h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX0uVE6Sy6UgfV
 fKbu19EIkZJ5aByvagmfdXMIp+9WbqzkLIl1y+nde4m4ujwH4Es9/SNkQoBnFr6HfsXTuoqP7f1
 5mdssQ6aovieQgaVaFSHaVYjy6W/ToM=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f47b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lYDSAuwiKccqTb-b3IIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 1:01 PM, Anup Vishwakarma wrote:
> The proxy supply tables of msm8974, msm8226 and msm8926 list two
> regulators (pll and mx), but proxy_regs[] has room for one. The second
> entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].
> 
> On msm8974 with a device tree that has no cx power domain, the
> fallback table then overwrites that entry with cx, so mx is never
> enabled and cx is enabled twice.
> 
> Make proxy_regs[] large enough for the largest proxy supply table.
> 
> Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
