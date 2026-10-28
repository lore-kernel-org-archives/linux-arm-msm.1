Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192520;
	b=tTfIgR/AP0e0FLmXydrigVRNmrLnKyxunj2VpX9WANaq0V3Y2jimSJ390t3xuxMb38wf
	 Yx9qUodUi+8Urq1NxZBRnTWYWcbeMqr9K2hYaLP2t1G2JkC4DqOEc/L6b0WkAIxno+Il3
	 d46qitTfJHSyroiFfyf4UlNj1mrK00V/8cVwyP16Km3CqBoKRTEBvn3ZQCIxlhZPIYw8s
	 rzS2eF9ZB5y1SSV0fUzqb6ouwrzeVu7/pDaDeXZ5mzVB1FsiX3GdlVmH/oxufMvPL7o7l
	 bmaf6Y5gPdBXKyuyPYxdO22EPz8ihqx6yh00up3M0JkXP0rxc8n/sZQK+MmjJYT6Haw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
	b=qfGt7+JE1GjT/LD94AAZChbAzduVcxP/FncKKTnne/jQZUe9Vn/wzEt18tyr6ZZFq0DL
	 RAMkJjWKaD/0JbaLYc13l/W5GfwuDDq03Usy6g5P17g7feuMcu+kKTQvn25L31bgWfkHV
	 RXggUM2NTpIgUtM06TOg1ESd1d0/c0uRodbAijo3I1oU6NyjOe6B3e6sgNaToDJwyg9ia
	 Qv995+4LczV2tArlHBklBvmi3Nd7HArK3LoekxjIfK4lQcFLvtRgBlDbsaygZWzrAmVEk
	 XLUCLE8aXZ9KX8kyzzjERXVYk2BLuQtcBv1T4crWuQqc5pJRd7sJuv/W3ZRdXTNhWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DebS5eBJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F032606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F032606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+FumsiE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DebS5eBJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeB2p1606951
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=; b=V+FumsiE/zr12OpI
	DFvA1swVDcmHoCFSMeuxf6gR1hYAK3aJg97AZw2yDP8OeufhK62kJmBEp+gboxx1
	Xi8hsGiR7zyDrktr8xN1m+uBKHMwOk0wsVM4aOMATdrICf0ZBxCkne7RMXAuFAel
	1VqbuFP5so8wBEgNwGEGTT62Ja/jZflNjlLHbbs3hzqsW1EnUosHDzGsRCRCTegy
	lQEJAimnmTgBR3b3cY61BBkHS69zt7vwihB1XmsBSxJ5+ZO2Il1k5qFEQFIBDRU6
	FV9pQGaazuPUkMWvLM4kNU+rv1EWa0FWnbLxg1cUjm4II6mvSE8yAjrkmjcsi5yH
	96TlTQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j8y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:01:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso77178e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192517; x=1793797317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=DebS5eBJCrv18jMoHCRAHluLeWVYKQTNfE/IvQmOQ32zuLzETkGNk7Xv/IrLCkZaOa
         qFCH4u1cNtIPDgdtSXles7hLCeUleuJBE9I5YjY8XCKVTvT2VomqYfgWBCHnRawYa+Af
         jpgCDz5FQo0m2Wp70yo3QRnoNpWios+TiSAQSA162Hy+i0feA6V9FLtL6/Pibqn9UOJO
         vXxWSdN8Ln2HLO+dFrW4x8ID5/pEKL+a1Fhu+FTPjSf0tHyTmsxA2w94ntRd5X23dG/s
         P7ME49YwulAx0uGhwGK28O8wadBVzHZN5W7nZB2vASN9sWjgjbbfzcyhIHZl5vp6TUr1
         B+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192517; x=1793797317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JF+E1/98bAILDGzRZuRXRNPmaGCH431NnNIaFq3b5kE=;
        b=YA7+AjVBbXH8C9qUUpWU4k3SGj8erdOVzlSiebyX9kQX2pKrj2eqcP5eUnWEll3QxW
         JS9DKtI+Eh2xn69Z1HFfD3s5v4VxoJJXEk5a4iElqXLzz23//A9cDAy0lWGU00mvTSJ9
         BVwWZXIvZ7AOBoonv+SRj3JfXvP/EzWq7oZQy0Uv1LjIUUrdduGVk//XOuu/qrY40oRf
         O43mhb+dIINf42+XYKG9AcsTPbi5z7ZCR/R1ZD2Vro8n0++bVhd4YIitJehL6AeLkQ2A
         lLHC8wxtep3SUakIiv6SxzleeBRxJErUL7d6nSR4chujEKXz6DaPfe9eLPtXjaivYpwd
         7M6w==
X-Forwarded-Encrypted: i=1; AKwUvBzceIbimwUFLweOoW/eaPjaSBm6pDiFnvyhGekTWXQf9zB3/or3kNBJZHsZsujlyIXZVMcLcrKjyhasWhZH@vger.kernel.org
X-Gm-Message-State: AFq9FYKfZbhrElvSRjSio4JSkQhoWLmE/ILdfegbpnxyDt7D9XBV+UT3
	t2dcHkB3JQOZffldjzJpARv+NG2f8ImGJAX5QvqbqoOaWfArcDTIgZQh8yMemJI5oCPmr7bB/+e
	zYNr5RXpxTmoGONXsuYYH0ZT57CCVXmpyCYf9CWh3vdwzbuMwxAG/L/BTD3fAl0T1qZt6
X-Gm-Gg: AYBFou2cOa2Cmt8L9215X/eWvImqpzfA1tTTEqFolZJLugZ+Lh1SGs8hTUroNpqPTaG
	3/TPUGeqWHFPNpJBXU48BDG5o0yWY/oeLBwsxwb+8aAHEMJQBqx+JWJq28KKFefuQP3SLIqxtGb
	w1GMCrbKFwBD0PQJHih1JZKW40YoIdJuT0TF6G118JSflMdE41kSeHxmsLh2QlLT7FOh6ldMRj0
	dbFJVlBQCwDlAhxarOzPOs6zvqSAgnojisRASvcjQjG16LFMoEv2SM7jVajvWLhU0LQ9kZ2O0l5
	7pPrSzfVn/sPm9TSSoDGDsG5JIku81HY9KgQuxEWgXfxEM51VbXnrOyF06o5kwNzpPbaV9voZNU
	CJ4i0hGcXCPxVOTHDmLoA2uGQ3hg3vQi0ZMJHAPguVHYCEziGhPc3LA14WuqrKPDHD4cBtsg=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883388e0c.4.1793192516773;
        Wed, 28 Oct 2026 06:01:56 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr883211e0c.4.1793192515300;
        Wed, 28 Oct 2026 06:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4eabadsm610575566b.14.2026.10.28.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:01:54 -0700 (PDT)
Message-ID: <4b373217-d4ee-494d-a5a0-244fc9181b75@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:01:50 +0100
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
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
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
        stable@vger.kernel.org
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX9GpEYhivIa7+
 SsAfGMHyDYPLcNKdoOndbyZbzrJ5crCdL734JPKjdnkRJnp+XfVVQdnky3sJ/379RlSQHJHm8ci
 oc1/q4tAcd7mu88vwCJ2lIk/uZmKflc=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1f246 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IYGMUUFy9tKC-wNfIDcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 7FBk-3WRPW1AG9XkRvixh3Vqz30blpbr
X-Proofpoint-ORIG-GUID: 7FBk-3WRPW1AG9XkRvixh3Vqz30blpbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXxdta1WyC4lpc
 1zZvvwWSGPSpgYWgOI68rRzfZ+1MPNskohJe0LJq53FjGmS5y4hX1vA1soUZqp9oUi0ycsQ/g46
 VgPM82znJhnxsRMgPE3D4noChBpwtDLgCi4jAKra64eZ8h1sJTq3OsaNM12azm2zemp1zZesT/E
 hGahHcugyM44ZDWmQyr47GzYMCxjbnj/ZjZnKVbrwy5rS3MVipDEvMvZrhf9ApcbzQSscFc5OTm
 biD8KqKH8fQwsDDAo6XpYXo2Pc/1PM0qUiL85ahlW1vRR8FCz6R1/1LFD6I7QH3ThNmfcaMZu1g
 L/IP8bvjIztqRz9v+KM71qD4MPa9Ks0HGHZSvlvQgtoaD0C5j/7TQfVR4JQz4VcpmUgFiayiFxX
 zIvD5EHiDcTtGdb+1Ie1OLcgTKk7u96iG1o4D+gx9wf4qBMyPgMe3QXLR79DSW8tq7Oc1FonFL7
 faf6XiUOcOXwQi1YUnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/27/26 7:08 PM, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
