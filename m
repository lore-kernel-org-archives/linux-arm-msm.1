Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476893;
	b=w5TQKqeK6omNn8X4RWNg94m8BeRkp+pF//+a6dRHKhQHAxenFJAJqcO0A+emcRsvJr4m
	 3gBdJqQVtEOm5OVKqUCrNLKG+VVlrJQci7t80HkZ1ppc8L4Zar2paTvn8xEOShlOaKTDf
	 envzkp95lh58HyyvVbKOdyw/bu2f/DMhR30u5Dp8Y3uqK3GEwvjfXSTFsxGYThZ9k7akK
	 0vZOsOZhMHrkFGURn1FSz50x84RZ/8LAiaylAys/p7CpoZ0GKIxJm7yGNoOFYbWXob84v
	 230+fjUJPVVLC1xLpF4frHqlxbkfWJvGjnrsox2lsXp1EGxmx9xl9J+xo5Hcwkgd3CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
	b=ua0wi9Yj3G87+G30AKLbqjV83o1ODSFrzWjWwDDp2aJw0AeHaOGB5TBMExe6NXqTAO/l
	 0fblY8TmATIyQBOWVllOeB8aZmCuSFTXuFSmhwyaTbeMfyeLkoZgaphrslnY3nYVAinwV
	 DDjJ8HIopV+CKAri6q+QsMan99Q1E6farN1oiMZXI5AiEy4odkESSTw9v+Q0oH9jH6Pa4
	 oL35BBspJRdRMTbuORzyFP5neP4baiMRFfTdhixo5n4LVCTURRel7bAFMJv067MvOupsx
	 W8+/K/HTYPstIWTGxirsy26Tq0H4Ld7VS52s9FflwgwOXTCBDEGe0uaqD95giXEY4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC0606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BC0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7nR1254476
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=; b=K5O2Qj8qb6BT9++k
	UOJo+dkca2Ppn9kklkvRAEawszaE/2n+i32Rh7MM6//bqjvM3NSrblCLmul6G2nV
	6poTzZuDq1P7LTZn5BJ+sWkK/lllH9M4Qw5pe5ZauGUTi5vZfNZhhcj7jPxx8dd5
	vs77lD91TUY6KeJbEexYLNPZ8onlwLzmFiq7nh+NpBKAGGIkeH3G4yWDWH3gdID0
	GwISto8IC1QN8E+Jh8cLhL3S+jwrYt8nUgEUYnShFbGjFzL5WFp9RlOgz/bZz5PH
	m/+WXWxLbFSkX7kH2mhjKkQNsTsfKn9EwueM6MqfZCpiEp4E08n2zm4glhwWWDAn
	sSmsfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n93y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so693591085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476891; x=1793081691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=HFelRwvQs/xAl1VdRuJlTlIMDqJY1USgZwrG3zzf9auw6PLJ3IosZoUwUUkshBLYhC
         855MzEf0j2BTDftlWlbV4qTCgDZ/ilMbRaMZr7DbRFEqoPUm6nUbJIm5AjsS1IRCEL8Q
         gleH6S0GuvWJuBtr3PYi9E3T6R0SRBtWyVQWuCcJ2HFqgMi2dVs4v2+dJYiS8GpIJjGn
         Llt04IR9q/qs8E2rcK4Zsl127qqRMBw2Bli7YVWmajJ0/7NOQzaopaDJ8AbvBAIJLuXn
         EWSpWi6J6ESWCJGeliLKZyQVD1TwAXb6ZYrxFNLKe2nl3IbB+z1SgNJyHT6pAPxRXweC
         +lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476891; x=1793081691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=2yluc4y2IuQWOcQxoASNMan0lrpkFAt742KFaUGtsCM6LqxHmV706wQtu15ifzhuYy
         CnNKi8CEEZ+Zxi20yUNnq/CK39nZQrAy2MTfknlQIejQFdu3YM+NmJkYMMIwVtLWJhLt
         6Y1xyrSYiorfKYM/FZLO8q7mBTItGCyCu0Ude+6ss6WEBi9AKM1qvDhqkh++ao5EZBjV
         luz+BxlyZjLbPT0qzqLAae42t0ZYOB6LKeHR/XVTFyCKmHuoxrh3Aw1VCJ+c78EVSMJX
         bYlRRqMC7kLxVdmOCw9CQTzFuNwZnpWaj8Or16n2jn60/VIF9pSg0GRdKwgVsXR1zEpX
         6sIA==
X-Forwarded-Encrypted: i=1; AKwUvBxUlcQWW470C5ACtIic61CmJ95Uatck/PkPVXTNemA5F1Sz3x3OCcRPzD4tPlhhEFQSSrV9FtYCvGQ7SDhd@vger.kernel.org
X-Gm-Message-State: AFq9FYLMSCi1EKlqvwmnXoGLSmxlkyd6gDLKZb11cvk+rtNe4Abpc6DQ
	TcPRcZqz+tSXiyT5G8usW2F5jFmVissYlj0hDOotsH4ZguWih7iTBn1jvLXa4tt0x17l8duWsF7
	xzeRTQp9eow6xJy3C+ypgYtR/aWU7cRWXp1/JfQuKnsZCU5RmV1itOpQnLmAT0toG3JR+
X-Gm-Gg: AYBFou2pDgzuzn8cTU8DmuVinkdBZyVF8zDPRaIyBUfkKm7E0+hJVtA7D0ZVzVAEIao
	f4h7Wbe4nW3Y77MXp78zLGx6awfQlQAdJrE8Zp24vPyt88DuD4Y/kpy+GyCN985lOFmelXNRETU
	k+4uT9EtfAb7DYWW72Dk1xz5MXh979UNc+KdOYAA2wNUl5dKQHsxOHPuyp33wFn3tl4w/uKDFvI
	+WxKflW1I5orlYx2mxc20YE1MPVWS9a5tlCEeCdeoqSa5KKkRK8ZEDNROfjKmyUuMb4fguF2jcn
	igeWenTvR9i52r0VEBGd33yy0qyVcAJZj1KYhdO/yl1q2K3pvJkK1aZmS+F5ffH2SqeGk2vzDs/
	NuXmwPLZmYvIlw6YZgQAfiUjCbrA4T9vsUjJh2SFVXVkKWpNSWuVzX9QA
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567051485a.25.1792476891162;
        Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567050285a.25.1792476890705;
        Mon, 19 Oct 2026 23:14:50 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm41347755e9.6.2026.10.19.23.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:49 -0700 (PDT)
Message-ID: <22163445-115a-4c41-991e-de5daf5df03b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:14:47 +0200
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
Subject: Re: [PATCH] ASoC: qcom: q6apm: Fix the wait for
 SHARED_MEM_UNMAP_REGIONS
To: redducc <sushmit718@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019161805.2427-1-sushmit718@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RRr0yLXvKNVQVQ9kG6BwWkZJFKztw1zY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfXwIB8LZ787EPC
 G3jwICop/URhzjjWEWegdAY+oHv1/m0+pccMm9wZ1Pgsu3gqUOYU0vXdG4dIM4lzjKRjYVCA03s
 k2UGFHc9lP2J7p3tPhQwi1XPnz7RxsVvT+rNr+BhOZ9McsmphD0mWfhPDV6Vc1S9PrhJ1pqUywZ
 jyCKjCSi5j8mzsa3NDwDxXx0eznQ0TJKDovVfSpUcLsKr23R2uX5maUJU8Ckk8SvnKz5o+7OB4r
 g+IL+idUs4zY1R9xrRKXhf0GaTCBRk8nqf2mzLkIMIEvWyihZpl6BJAhiL8uzEqNiEvgfSApDU7
 5hAkkGR79fV74aPYn72mPNQjpmNMp8qIkqvnMP8VqVbl9LChDxnkkiyHc3XHb5lmjtG9s7SWw5J
 Fs5SBQepK3ROQzqJvfBiCe4N9Zq70DchtCpZ5gPKabOhDhHSaoCCB1tnVPBVcHs2E1JfN2Z72So
 4xHepDHSLQmPyDnJqwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX5HggryVXxrk6
 zL2NnvDePUxRW6MTy05sNEkl1nMEt2xCVwMjxWNPgURIz9SO/foe2SZMK2xzMchyrBFM1yQCIaI
 MeBvRykC92Bxpo66/IT0woQm6foTRqM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad706dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=I-3ohRW-80EDcGXojW4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RRr0yLXvKNVQVQ9kG6BwWkZJFKztw1zY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 19/10/2026 18:18, redducc wrote:
> The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
> GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
> GPR_BASIC_RSP_RESULT, as the result opcode, but
> audioreach_send_cmd_sync() waits for the result opcode to match the
> command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
> so every unmap blocks for the full 5 s timeout and logs
> "CMD timeout".
> 
> Store the opcode of the command being acknowledged, as the other
> GPR_BASIC_RSP_RESULT cases already do.
> 
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Please use real and known identity. See submitting patches document.

> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index b6b1ef6833b3..379b15b7e503 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  			wake_up(&apm->wait);
>  			break;
>  		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
> -			apm->result.opcode = hdr->opcode;
> +			apm->result.opcode = result->opcode;
>  			apm->result.status = 0;
>  			rsp = data->payload;
>  
> 
> base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
> prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
> prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
> prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
> prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202

Why are you fixing patches in flight? Why can't you just give review there?


Best regards,
Krzysztof
