Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477881;
	b=NnkYZ3IROSSJV4sP/rSuDzk6eG5dKqgWORsTWD49ZG17wF69Yid2CaOVRRlh2zf9rlDr
	 Vq8ramCPL2hIMaamZNLs0E8m2IM1eMNTYY7a7rFqMIJKldzP3cavfgK8pIRA2S4BdBEyw
	 f54HuW139ff+mZA4fEQz+DLHYl8DRnYaW3i/Yt94DpkhvTY4F+HsnNOBKmoKmszMX8sAC
	 eE+ybrR56mbmMN8pcXsdqzN6SV5chbfg0TxOXTmANWqonIPWI8lJydLk0qVMP+NiUMOIS
	 TUhmGwNdKDC9LugCHAbNDu4IrsJXI5VmCo2k/AnoaIiFaHjGCL+6k4mnnZyjuC3YBVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
	b=5TpR4Wr06aKCvOIdpYMar/Klu/PwLs+h9SKdwO2Fg0WP+lPl3zmEI8zbUNWyWQztA7bo
	 G3rkFZ+4xXXX8AjdAuB1WXb+cdPH0mR/Ppsgbdk0e6CaFbjvOKQbDFMnch0mAGHTXIAcH
	 4dimb0E5V0ceU4xuBdfgF8PYhoFQcbJlKnjIHzV5bPU+LlMdzX6d5ajZIaPflh3u+iw4u
	 6lTpcsQvbQwow3eScl7aRVr4GWUjqMdSdBnIGQy18l4lR13/pXAVbSXre1boxT2HxKvmq
	 L2109k3obMrRyb5YbRpG5c0eemzlgdOyjOp2KN0tVF5ChArMPgav03+yCLgH0K3eV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F429606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F429606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6FrdZ825621
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=; b=CZfoH7RQmv8/vtfE
	gNKgogaPsrwkO7jBSRgkoIZ1WgWVsfNwRrHe/vbbHApbFlHyp6jqOtDU1hcbJ7FM
	Lh9iQFSavTU52kutaAeP8QPhQZL5aX03wau9GBdndavqtstEZ/Dvnaf41kXOSaOQ
	Uo0YYVjmexQU6r6jjUyDtoWg8Hgxl2X9cPjEImE+Jt/aeVX92aHWetM27rgoaMrv
	is6Wnrki+WKvhOPa6l+osIkfNMbz3XWYbqk71qnqWDc6CB6lN8lv1ohBFkbL0j2c
	KSy9zX4eP/epdIU1Sw7bUG97RgRRo+U1QBzF8W863ygpl7AT4cO9o77uCtEgAopu
	ppppng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n16ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso9128151cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477879; x=1793082679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=KWjDz2O8HU4SbDGylmcQeUUPmj1Qjp/+45EeNyzqA/GY4mq9BXXuf1pcFOphyThsny
         HvA6iOpDbixaGpWOrdrLEoB4YmjwaRlZA5Y0Wxa7IjZGleXEjUnUCQBqnSIroLyYfJCP
         NDRn1GTHuKmjoPjYJYRAJ82xA1vNnTdpfWkkYOSlDpPioFaseYqyzgOFMItJWJ4eqZ/j
         /8k76A8npyCNl2M+WaI3UK7jD+xGQ5i8tz1iy9wmrF1QqRGGkaaYfIDsv5ZkMmtWe/MV
         6vqgVYw/j+N1qRQn4dHYxVybR68Qg7XYRdHQ9l58gcUdnN98b860W+rHWA5U2bZ+UACT
         lDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477879; x=1793082679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=MpTtWA6ubw9nDCpJSGUElcw84B2Hqt42DFSoKyajAHh1Gi4MsYoT+009ZBwz/VdlKY
         TJjey4UZnup7QfwLHzgjD1n95gT87bN5/n0kT71EqZBPX6iZYO5hHambR1KCsxhe/EzO
         KIJWfxPJbNV2FMSFoDN/7tOjpRhz2MPQFqsoDzl5fQWMBbL6FVlp3GoT6xe27qft3Uas
         yUg8+7lubLw4wATh4ikYrFw/Do1FzNZi/c7Potec3eEf4N/tKnzwgf7yKocgAK7BWTKo
         vtotiAbnHnM6MOhDajKB3HVDacHTSdTyRWHhySRfQ/tyeJJPGc6iqHRNkw5gdp7MzwbL
         qbbQ==
X-Gm-Message-State: AFq9FYIx8TZLexwB/Bi4NtB0Rosp+P7M3eJPwkgMBat3IJpZubXKni+4
	g+X+J7zqxBw1GYOv77i5kkefvm1WDMUiQNQmzyA4J7QLURkNXDv4vKfDAngaEkShSGcX/kjjyzz
	/M4SggU6qV40U+LfFgL+RhCWmJ1LsARnQ0k4d6uY/GSIePDooT2sQd7GDDWzDJEfisBSm
X-Gm-Gg: AYBFou200VaILirrhiCdy4wWNsA3nc0dJTUr8lD8k9koxi4el16tDAigseItISfE39p
	Qkiawa7dxXXW6eNQMyZV2Cdr51mFPbvPeWFXQiW1eYoHmOTO4+/+RQHaj9cQA+6jmx9IiKl81G2
	u+7jF9t/OXkzkHTMWpICbeqUiFWkwXCb6UmzwwA3kg/MOlmYw3w4aXUC2gBzddhZDsRq9VM0FBV
	vatgI+6sT8rl+dRBYMMFbKybbRB/4MQvZVMOa+mQCeezYGMTvMJSZ5NEcJyVPB5ufr7MG6ELTsd
	ga4UOGdAuKUOZ+q1LVvG1NW0WPgJvWBeHMcw268DKdUPoBsHahUXnb8AdgQd1UF5WApWW/GUGL2
	UZQjYg5p/0oFCq6gfRQHLiw==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134351cf.3.1792477878515;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134161cf.3.1792477878105;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm447200266b.54.2026.10.19.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:31:16 -0700 (PDT)
Message-ID: <d1070a58-98aa-4a98-b0a1-96e974be5abb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:31:13 +0200
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
Subject: Re: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JkIb8-B5jn9l4ik387fJSQRmtLReq2pz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXz8/3UvGNbTkU
 hoyPKjr8L8kPuTJ1EFgvx9Mkm9T7esl291Zuo3WqIJc/dEkFsGyC5IUe4dHZCa9cI/+BHxKT1cF
 GY7vnnLSRuCec4HCAZPfuaGdQ7iieWU=
X-Proofpoint-ORIG-GUID: JkIb8-B5jn9l4ik387fJSQRmtLReq2pz
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad70ab7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ldyKz4HnRpUghmHhsoIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX8Owl4IliXAif
 7wONylyYQIBvXE+gmxS4mdPFBDVxrinxjiKj+MZQaGQuOJhzdyZzwNn0GE9AL+ayX3oCdpAaDTl
 dsjh9kKmldxD39TDCfoLr7KGLMBrfBASwIV5wcU6mxdam5evfD/GzkGXBMEVZK5hkKZ6WbF9PJw
 nvQKsvhEwAiItNllwFSyEpVdYr2g4u8Z/nhWmEy+uUyL0D9GHenIjCceKGxCRuOrQcO5nkOFQ6Y
 9FLzl73RJW84T9NTvMRmwPkmNLbu4DQMekGi48QYexK2Do5pJVElJmaaobS2k66pY1IrOIwiZww
 nu+St9UAZMIqto2LxXiB0af4Kbb6zxRDDwnguwnkwV6IHfBj395sv32ybq5Z1oR/jqr8O0qjsL+
 YQkl4aaSaTdDi6GbirQ8/Rgk3tLYGetbZXPTtbfuUKVHzxLYYmN8Dk6TN6D+wRuf7QMK6w50vuS
 x4eo44WluzNRsUIhxcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused, the SoC resets while the
> modem is being started: restarting it in a loop takes the board down
> within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
> it gets gated, and keeping just that clock on is enough to survive.
> 
> Downstream never registered gcc_mmss_qm_core_clk, and dropped
> gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
> support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
> BIMC source and SNOC DVM clocks: stop registering them and enable them
> at probe.

[...]

>  static const u32 gcc_msm8998_critical_cbcrs[] = {
>  	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
>  	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
> +	0x9030, /* GCC_MMSS_QM_AHB_CLK */
> +	0x900c, /* GCC_MMSS_QM_CORE_CLK */
>  };

ideally this list could be sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
