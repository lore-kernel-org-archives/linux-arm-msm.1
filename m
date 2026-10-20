Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477737;
	b=Hv17dqID1PkATChEwqIzqhL9Zah+Qh/heuHnjjIFyXec6ebxLEolTjZNvMw8KcByZhpj
	 o2lW8bCi7CuMDtMirmggz2MxEm/k5YZw1ZNq36bB1vWLOZ1yPi6Imb5apL9c5ufP0abl9
	 yEf8deN9EMZUR0+ocQghymSSgLotvOT2IZHopoPYksqWgep/Y2u2tprSbr1MfAVO2Vpse
	 2vEtJnGfKGO/xng1FxcocbfmqyWyg6WhuyeR2YarEkP70T6ZaG0fwzZsaHGVZs+nmDsst
	 mDsqiSr2i0a7N221wQ842KdqFmGv5uuh4vXJ3Y+Su94CnMHYBjIRhCWB1ImBQwIi4WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
	b=BGoX60BTDy3PG6rfDoOWFqb8zYYyFsd3OsFJBfmEyk1LayZWdS9+5LOC0pPekat3oOGJ
	 lxsN+zsFa4ZhbrPfw0q4HRYgNIBefPz9Lfm60ACRFDd4CAGHqDWlCuKUDLsUVi92jJElq
	 DV+3Z1XHfc8vmqN3TBDNKEbazE+sTf3eVhpsTt5lcDLU/2DombVwAJIZbKnNkAFejMbLV
	 QRlr/Odkqync4empgXgcmBE5hYlwlUUOpQMLa65L+KahuRHGG+ZIOtwFOPLnOFbKeVHG0
	 YXDcfrnRhnSba6QFrgFLbL/hidW/jc6tTtVKNC/99mDtWvV6MJg8Y6/llB7Hwr/KVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdX7H4VS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=boMd2yM1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA3B606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HdX7H4VS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=boMd2yM1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7wo3806848
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=; b=HdX7H4VSz6pLF8gH
	JpPZacGT7sqCuPx9k/anR2BYBwdh7nfNZ3U2zbqsrekvOw6A3jP0YcLWLMSOhAl9
	W9sODGkcIV5twKlysosQIpvT2R4ki9JXWlWx/XYcWNMT4j8tQ21DXH8Ycq2shPzs
	8Actnb2ajBD5pBfMqKhB2NPfVgO6pcAvWX7zyEvaFi5paH/472OfQQGXdFpyVHV8
	u8KTemw5COVfhSzpAUikKdS5FfWfkR84u8UTrH6IkUGcbTX/frWDGHzFwWE2HX7J
	YHbO4Uq/5WKlx8v3GUtxMo9Z9AdzMkRrrdByup0dJsd+bpj13tkRjhHVrvM8I9fW
	8Wqv+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p963k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:28:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso570591285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477736; x=1793082536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
        b=boMd2yM1bvEE4WKB0fjuiiv6L+ofl3Ky8WMeOkCOKgF5Kzzz7zGKhrgSYK+w6CT4ZS
         J+WFpQb5Ip2p66nMsFoqQwzVwfktgYd75mb2z6IDnlWZn/IRNkCIhDjN2uSLdFc6RI7s
         oaHZa5Edn6UqN4UuvspvmhPlRijdV/a5Al5N2P3Liskeb/JPWgm1nUS7rvh42od+/88n
         /Ufr9ph7WaEqAnqhC28GZfuHUQGS+JX/sL/ygGV2FSqv/KoZi4TEtoNlK1oruo7VvdqX
         k3l4Sy8DU4uD86Vx0iAcksGwQ8Jox7MfJvMJ7Q9ljs/LWWmknmOAW/nEJcVH9mlKRkgD
         C5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477736; x=1793082536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZcm4xn8R1wI1FG/ihJT42XES5tbZ9l7S/ULBsgYweY=;
        b=PAIS+glF/Py7Blde198cZg3u+u6h23+B85tgqUZO5D1SVs8wkQLf/D9uJq8NkD0pfb
         H45NZQgt00HNaZ6OBte5ihxX85bqQaSaX8I5M+awSm14lZWI84zLpmAeO3af6X1LCNMp
         mrt1bNhN3sQ/fjz0yNijPJvZfEjfRzREhhQmbydENvle+r+uKxVewPZBoKMJT2uD0K2V
         1qK4uhfng7tdMvmlJiUZZjf+IXhhOiX8QTnxctMO2UqJzuEnrtSai5dgRm9kPjhDPD9p
         LtL78FkqiHwy6Hz2HNkotJEfSb0PJtLPpMk++cHiXo+dFeUC8wq/Aj4vyZJlsBd54UpS
         GOJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPWIWARS1v4vRSwsz9umOp0CpUExsqAwPUXdSClsCAoWiSD25bbihJXrhXGUNuPRBeP6pmKq11NwZNboKJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJxwfHmCmljx/Q7SW9009N9M24BJovSo/WGgznSFQYCyOsdGluW
	IDSx6wulzfuiMxWEJ9wDr8bQuTLnX0JLvSvD9YxbC3007yD/tb8qsT/LpWAmzIIjqpE+e9du6HV
	WN1983l0OrJBfqM9DimR+QpsEuLstKGMadPMwFmUDmTN89Kh/My/kOL7z/5Ce9Jzs8j9U
X-Gm-Gg: AYBFou0ZOzjdgvVQ0GPbEL8jCP9DZOQuWa75P4Ra0ef30F4b3MSDyBhn54jfctAq9We
	6vgJDYDA6nobkdKxF5x1LbFDCUP45Y052iG+tsnMq58r0yxn5LlQ5bs2U1eDEpzANbjiahvvHu/
	A/4+G2Gaveq9PVzaOn4oe5klP4TPMsMTsR4a8wE3UtQVo5VLvdZW1aEyM4F1qCwY1b4mF8dtJ6+
	aD1EmpUi18K6gpGQ868xza36s1G1xmuRSNjmPUQPvZ2FVJ3r1CnNCfKKGJKxGVsciglhpSDAj4K
	jKMXOup62ns3XP2xPeSf+emQBmGNd092T4DxLXRNQZjhnlA2XaK+rFqpMDjqHAWLLZxTP/wzn9b
	nwqGeZQPeu9cOqTvA0zSIvCEG2Q==
X-Received: by 2002:a05:620a:8014:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-93f4d4f0025mr166739185a.12.1792477735826;
        Mon, 19 Oct 2026 23:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-93f4d4f0025mr166737085a.12.1792477735360;
        Mon, 19 Oct 2026 23:28:55 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm4094816f8f.17.2026.10.19.23.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:28:54 -0700 (PDT)
Message-ID: <d92aa5bf-30cd-4843-9a4b-36e41e25a1be@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:28:53 +0100
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: av-lCjZFMXbqPx7X8-K1SoaWNlvgVtDI
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad70a28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MqWYEmV0nRCTjd50ys4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXzPeRRigDY7RZ
 T9su+XbrXxtmp/YboHBLCpbGMRoxKtSeZngcXGgwqnaDt/jey9XNcxwHVlfXW3GChfCEEA1TRrw
 i8JsOK1v5Q8G9pc/ACoFGlxfEnQIxFWCXbBgD/b7mTs7mtS+VKa6EBNGNWIte/NF0VJ+gMS5RSs
 rHtpAdL2jtJ1CpnurMpNHbKr9yLnKZdrJVaB0x8jRMJi6SMFti0cRN/pHOqMpr6eIdwWGcz8+Cc
 ztFRuzwekxA/CyPPnwqi776xxEJ2bbv6H0MQK6n/YfG9g/TwPfgET9GYtn91L0uk6r1iQgnOa86
 sWW020nQ9MyevRG+KDOlvDf02phuop34WCz7o3bE/NTP4O5Qm+ZDjs4ofgLMeQAtd7g7PpGP8A0
 5OXYMP6VYPgp6/YBJV1UFL0Z22RYBcMV8WDKgangvQjDEhpw7L9cyrpH9voBsKLv/6jWibFJqIR
 +GHGT1T8/rTiFN22keA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXze0WfHlFiIuq
 wepaPZBhyAPyZYI4UKPwSzrCfh3FoUKrOK5qlhZX+ALZEtv+Px6zJ3CcNUAGvV1eMOCbdxmJbJe
 Qi5nQ/9qfk/n5q9u7hUa/GQNog0jRwg=
X-Proofpoint-ORIG-GUID: av-lCjZFMXbqPx7X8-K1SoaWNlvgVtDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 5:18 PM, redducc wrote:
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

This issue is already addressed in
<20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>

--srini
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

