Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627280;
	b=LAraMa6B1XKc/0PNWJTvm6epxF82m7LWGC3GHCxkqVj2PlLsvVTSpPe8LB5oWAIQdFwq
	 31qQsel07LSnqnAJl+7nv5FidPYb0fbV8o2AmtJko3iMjJdY2Qco/q93fJNSaWijKszxm
	 8NNRpM1JFalXzAykuYfKRBoWQ44CM0eBCPSkJ+iOYqvuZRIajf6jrwnAwln9Yc2mnZ2wO
	 Prt1INuypRUN/wPFbNbzU/BtQDB/mKV8eHhZl9uq90K+XDpIFa6We9l8NkRDMI72iwZXP
	 bavApu6jPpZ2q+0PHEqb3wbhHEWxaOvKVxDLfdm/xBVB9jZQuywK+UOosxnnM9pJKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
	b=GAWcv34WYz19ejzKcohGTBjiirSnwvdHmyZFbRSRlerlemC/IDJ5Vk8kOnolc7EUpa/I
	 14vQXIC5lAeltDAVbW50fqDW0nhtlXz4zOLQpVIod71fD5F+QAAXT24t8Oqw8vkxvjkT9
	 cVGalrq/WEo0OGBQCfj3IAu8vm41NyTmThXeLJoc2qQ0M785LLhZOFX4e8ubih0h0LcgP
	 9qbhGHIS8QxNR3FKHYuqhabe0JXaem0U528jwySlrN+LVTKnbBa9buHC2IwONPLvZeo73
	 Z9aa6pK6dhKTeYbHO1xc1ezGDRJuq7o5xh6skQOMSS4BW/LXJIjTYOCQr4p54viT+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gb9EMeOo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A6606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818A6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgg5wZjM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gb9EMeOo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAMoF388227
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=; b=fgg5wZjM2tsbZBkn
	gv4uDezjS1ARS8eHK17bP4DAvYmtsQuIvfAr2tx04FElPw8Stx4FFQW5AoH4UgKl
	dwwEgGU8l7n5dk5f1T2bZc6zkMJJHx/rqGudeOq9FjFTVIDPUgItrJUBADr8IWV5
	MjAouwmiQ4Su7nt2UV9xABytogc8WyqYXMcD8lzpsFPmR55d3lQDOkmwiKVChmpi
	x70nvnjr+NKdzgGmsm1bhw38QubFbm05e+/ccyDZJhkQ5pNBUBDrJ0TNUdGi0D38
	IPuWElnFZAhsKitXnt7C7P17WYyTggfBEd2Bmv1DPlIAUnRdBKx8SQOTu1OSaFEm
	2/6Jsw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19c6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:47:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso60155e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627278; x=1794232078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=gb9EMeOojcns0kl+/V/YWhu61JpRm8E9BSd4DNNIypKu8oX8wTxIHyBV/ZVwEUbaPC
         9RKpKYJV05ntyic231HV5yX8gR7ZglgMojZezn5/n5QxM1PGwx/WlprbimTxkohWNbsu
         +32Le4DL2uHDRSuLmwmQWtRijTbvWFIQ2nKC7DlwPz1476r0ZvA+xfcyEu5xJo1S3Hgy
         rvcfGsYALoCgz+kzwUmuK3gOABf1/J9zh/VLwi3VAh5/J3FMHRfrzhH1EhL0d1PzG7aO
         ZYKKSkxiD+nc2j/b0s3ysdgUq1DsYN0xPoqmMzPLNuQEo1HDy2TkGS7LOH28qJTT9QTi
         GlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627278; x=1794232078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkXiy7zJNKorCt+VPjjrN/hR8YEy6PfDMROpIRVksVM=;
        b=jNRpxqI/ScZj/vduEPqfW9EN0nMWTrq2vrM94WrV2QP3mnjMoRA6Z77pNqioPOiNYj
         c9sj2PNxHSeP53rqTR81XYG8RRqNWEXw9qWMn8JKfqqUpAYn2dRPLJqDyVhulYQGU9eF
         eiywZjXCI2Du3+t6sx6Rij4CXWL+KWnn4cTDGYqwSZicPDzPQN5uOmSNRSVsFLfZRQl4
         C+UiV//911zhONDegZpkrYilc98oNM08KuBukaEUp5wiPLYNgnGd3vAui4CZDL+PB9+d
         qye8NZJWf3i+t0iPdqTEpryxLZrkmPEHoBpgUxA6RUFjiefYr3brAAt7xF6+NpRAl9Zr
         o+vg==
X-Forwarded-Encrypted: i=1; AKwUvBxLfN8z0VAbCYioLmAC8aL1qhz7exawbYWDjNq9IrsCNDoFdx3LEw4BLzUl5nP2qpKzx3FqfU8j4wxRl9hv@vger.kernel.org
X-Gm-Message-State: APuU4Z90y8L27abcZDS7T1MeHYoPxsStJ3zLk2Qx4wLk8PWT147Xg6Mc
	l03VUSs59a/SBju8n6UyiZrbmtMqLyN0KKhlsLlwEcLGBKpZKGwsv6I597j+WvoWjWyd+XfQGR4
	BezUuiC5t8+++Wne1Js+fFRGnLCAd4WGzlCddmyjtdnXY0gHQ5XPYK7GXLTE66xbza5h5EhN1qp
	d0
X-Gm-Gg: AYBFou3jxoOKrMbxmnvDtFRZcBwgsKEalXatfaG11QZYn4ZlMIevpHAIsd9g4jK8Rg3
	rp+I5q5PjZ6HAFlxGVWYdg6rq/SkitTQi4QY9T3xRvrQ6CIlH1skqYZ80sEo3RHpPCR1Qsz3Ts8
	JyyjADAXOGuz/WJymFYauXKO5m9sLDMUTYF+/1FeNtpFVA0FPTHpzXtuvHduHr5RRR2yjG07gh1
	LFkvLUZzSShHUlCL9zw4rT28GMnC/R+oDAdk4PBq5L29/edoAdLbPF4xnVatSRfC4gGT9X0K6cC
	bxTQz31VZsRqdXaSkt0hmNcKDxXo+0Lpox7X4JUqkJ07em9iwEA6K4RpPrX6CGDHOFBPTjmwYs1
	pFo+lg8ANIVVqCFycmEikJfPQJo7Veri3DEb9oCIMNjtgx526HOaiPUllfaggWNlejlfmfLQ=
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263385137.0.1793627277477;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
X-Received: by 2002:a05:6102:a21c:10b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7d071f390d7mr3263376137.0.1793627277041;
        Mon, 02 Nov 2026 05:47:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca29382sm3342417a12.37.2026.11.02.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:47:56 -0800 (PST)
Message-ID: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:47:53 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mVgERuj7rYnDhWg8MHw5XvvV3lXFr2D7
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8948e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=b-6vMC33NXqCuZ8Zj8gA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: mVgERuj7rYnDhWg8MHw5XvvV3lXFr2D7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX8JbJYsfb7xx+
 Pte3OdU9e9Rz8NN67+XPY8cxdQdWqITK33vNTkIm7JlCqAG/BimM69Lag2it0WpzM5I/p1fh2Xf
 Sumhe94yRe3JP7MHRnUr73NH+Xr4OxBDuetYBknC8UcLGvGSSIWY6Nfn0O73JINRTIhpokkjCC7
 MvKMiSFruDcayUx7uanKe1NV70ddZV9ey5vxZLmyVlgSLLlMxrz+cq89ZJ8kvrW0f8FFA/KIm/r
 oQ9MIwm4qA1vBDs6IBib/RtUzqsD0Pr6duDj1rRYL33pxGgZH/4B6u62kne9q1icG+ooQEQWU2D
 Keh+p7dfa/hlAJT+KhE8qNAimKO59bSFMZzuotgCSh1jXtByTuDal49R3bJK/c6ds+u4REPY/hb
 1NMq3RmZpAKHfr/6NLjLJlT6hBgJQeZH98MQRdyZA+fOYkCD1IPVf1Xd9TH2A1NJxL4Oz9Vdn9q
 nNT3XeOuF+8u61o09mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX/nzjvjp1cUN3
 Jg8lhSVMwdHex7pvP4qZ+oJEDyu8juUK/oeNqkWhquk8MIzJmWTzLgGEfZDHu/3bGW9/Hdq0LAf
 jWL50bIw62f6E+xPaYUyFywMClf4yps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
> built on the Mahua SoC. Most of the board follows the Qualcomm reference
> design. The keyboard, fan and platform profile sit behind the Surface
> Aggregator Module on uart22, same as on the Surface Laptop 7.

[...]


> +		serial0 = &uart22;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

This sends console output straight into your EC, either enable the
debug UART and point it there or remove this hunk

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This hunk should not be necessary, it was on Hamoa laptops because we
didn't have control over the PCIe SMMU and needed a CMA space

Konrad
