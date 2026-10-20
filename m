Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477937;
	b=TLSAITEIUegcuVLsX0xDwUZd77v17HEO5oUmnGk8lTo/+NcX5uPWN1saZK91+HVhQyxV
	 NfzrmGxRPvX4DIJPYw1LYQN0+yrVLFWCLFlAjkhbS2JfWGs0D/2B+1Q8V3Fr+Hd1U1dvW
	 EjKk/lp1G27OOSqKo8MlmMDO678trSSNvjcr0KTZ+a1qoC19F84Oz5WNWS1HdiOXhNf7P
	 jHh9TpTy6oGEWb6kGRT8CEMJ3PSt+LCqxbezn3vGyul5N8ypyVVo4mKPQjpV+MhnA4DYx
	 eUVokR4xR0zaZ8lCGI02BBwjYrga7Zl0fkEicgYY8e/yepJcoEBALK96jm3VMEIvYxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
	b=nvMoW6HjmaTuN/6Dzr43oHsqurOmCSk1Qj9jRg8I1s9NiO0FslHlOmDI0OZh9cvLynG2
	 nzVdicAVidUsf9p3MsLnkLDePnjDIzmOqYCG0FU82l8jtFMBrAN3AkAhj0IQzy0ULXgiE
	 D8y4z59N9uYZPRHqpidHpRagOJqFW13m0QTsyYA/zi5cxgUzfs5+AbF0L43aoCsMqSt9U
	 srM/nnO/sDiKWkNNmmJBk+3dYY2SHvjohGZoSMIcE4IXW2kcwXAuuSInpaU2p6pb3AibH
	 4jnNnvVDiy//RdEjn5pwPD/iOQ6fTuQY0Qj2Tn4GlMieSQxVRZVzenY/DwYXisXS8jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B63606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7qp1254476
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=; b=iAKdP7Q6l9EwQ+FD
	k1vMbc0KJs1sjjcBfe89BztPzmJH9eXvzHLjXTCa6yOTNp1/9lrM2dZWD23/NLTr
	7GAVfv0/rgOEB+x0LLpPCx/omrDuCsBC1i5KlhtnugDmOX+lEce/WFb/oFPugeos
	8QG3BMNPJl27ntPV9bHX0kBe/m11TXGWzfU4DbZpSFf500nDskx0SX44jzqEwBXE
	vxp5Xfz6lIQH7HYBSzWzDHYdhcBChKBCUcbz0D/B9W9lFLWaPd3EehHF1rL0Xnkr
	pXH2dqbvHJPkNTFShtvOPUigaPFpVVugDQ/STAdo5wb1yAQPvpSWceqQmR3Bn4pP
	2OKAmg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n95xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b89618384so3691266d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477936; x=1793082736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=YjemuhTKYgxZyoW0gTQqAe5YWqmsDPEvVx24+nzApkPUwvbCI3af9SRbSIEYjcw7LR
         1cixsj0o1VsClq0KdzuciKwlZYMNJWLMEkbX68VpBK1SEHXNZZ4iTnBeOkPtZWLhEq3Q
         w59cuXPOKPCVvvwKDTeHBRP+uAQ1C0rPT+OemTwjCbZ0v5Q4dG2DO2Ls/tY4X6mIeiC1
         yH/dyLkETlRIYzV4L4PZ8yOLYzrEa6Sf1H49ACCXhoWzmH8TfPrmTJMOerSQiBIeSdq8
         m7FX2vO1LL5nQlsQwsW8dElRbO6HYR1QqoKCNd+bTXghBDKBQcBuwo65MQJ+2FL3lfge
         jPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477936; x=1793082736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=hNin/zWZen+mHb3nD4WSxH19fmhh39vpXaMlxBrDl4Sk7CYRPcp6GBZagtV+QIDPjB
         xJ897n4JTxh2JFeoTxWLq4miaCEsoQJ+OlOGZGj5TFk2CrVi8xFOmI5UVeDvAzGw69VQ
         YIMLrLcXCuD8Sj72lcFcbQj0K2sCkn+/u2ixCR2FV/6VJnbtXDRr4qOFx+mNvI1IESsn
         3JcSwvi92x6/9nSJuGA+VAnvVOPRV390z3+ZP9ralTrxrrjdjb8EIUwCks6szy9WFSHI
         xR4tfEfOWG2BatSrV+/d4YuVUQEnMVCl08hF3xAFo9gg1wZcN0aGFYKy1F3bLjm16oKe
         GaYQ==
X-Gm-Message-State: AFq9FYJ/utxeDpxY2HqCwGKarni8kpdNSnXMGlbBwqIvGFhyFPEowoXq
	kzULKvDq2t6BnWWPERKdM4FAe7XcbFyUmuOZ/GVv1G/jRStnRrKzTKvsdvs39AFsuM9j8w/nAFl
	TGHqb0ARO1wG7svfo217zHTE+Oh6TqzeT1S55cbjWWS98my9x28GaU56b30EqLTmyVLIB
X-Gm-Gg: AYBFou0HLXSKVn//TOBLZk0W2q0+M8LIsCYG/axRqDY1vLiS7FwIoJc/AWcqXjiaAQK
	8Dii6TnRWAkxVI2/VUYFKH5RoM+OmM5Mn/d2pQOU4gHt+C5xiWcbH10iankeDq94ON/LUfTmzKv
	1OcfmR29treiakTBb1X++MROxkWnSj3aD1nQdYHc6CJ4Ygp84/7tMp481U0vQTMU3O6NmyG/wa8
	M/rG98DfPqhXRbtlw3RyJW+3PtWTbXg678Zn0z/VCXpMWeFcwDlI9hiXsg1ZwBzUZeIfLeeULdb
	o/8fN2j7OUZsvGCOYAHekKbXxt5zuTIQZSF7+SeHBuLVpVsdwZtZqdk4W/8eB+E7omnVL0/mmax
	0T44Hdd52TQJlsdFP70BCEg==
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775501cf.1.1792477935577;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775201cf.1.1792477935127;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm446762566b.42.2026.10.19.23.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:32:14 -0700 (PDT)
Message-ID: <d01450d9-94ad-441e-855f-540f45aefc82@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:32:10 +0200
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
Subject: Re: [PATCH 03/10] clk: qcom: gpucc-msm8998: set the droop detector
 bit in the right register
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
 <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mqCrJsnfjdVfdyBHTzFYXArr8HF-f0rz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX02ov/SwIoYxh
 l+Q2uDyKXixgTgOtsDIYF+MgMyBk2VLyzOMw2gPsiBTA2V9sirduVcr9Uw/6ZdFkOGu4azFWfwV
 ADZ7WsDuZlHj3u5YJUhSZF77KRtlhyHsN5cyv9RhziqN6HDIjnfLTfIf3jAmLUTSwmRK2+u/jXE
 5z0v1p3BSAY0wFWVJ1WVUXsuq9eIgX3RKG3+MQsOqg53ZPKAApRjsRqjvAs6cTPMSRNv9svjiXL
 U3EnXw3ZzB/dO4OtGp4j2RUJhbnTGFQ9i1855UXuAP17QRR8CLRWCURcDj6YKStM/fzW9E0QBRY
 4/+gxbzo2NvmWr4HhqM1xML+t8b1J6ql3cRS9piLDn2a8MZtb+91/3FmWA9M7IoR1qBuQ8p6NYc
 BfxbYuIPkb6V+o6krPLqW6soiRJiauU1wexEuuGcpC1qnbjTiMHkeqDXMWkRWve4L+ebKt7Wk1x
 G5KmsmVHNwOJ/MFAMiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXypf47T4bt5v8
 vXNVVyygYCFdB8lAk2kvjeA7KghyMYIBoNgppIm/3xLCDjPuKa6k+1H4oYsYIhdifG4E681WvXo
 VRexGn8bPiQGTZe+kbYTlvaA5w+OdfM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad70af0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=d4jy3kBXdueBcoqUgmMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: mqCrJsnfjdVfdyBHTzFYXArr8HF-f0rz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The probe means to power down the GPU droop detector to cut the leakage
> between the graphics and CX rails, but it sets bit 0 of the GFX3D branch
> register instead of GPUCC_GPU_DD_WRAP_CTRL. That force-enables the GFX3D
> clock and leaves the droop detector alone.
> 
> Write the bit to GPUCC_GPU_DD_WRAP_CTRL, as the vendor driver does.
> 
> Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-msm8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> index 066793e47f79..8da10027f1f2 100644
> --- a/drivers/clk/qcom/gpucc-msm8998.c
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -330,7 +330,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
>  	/* force periph logic on to avoid perf counter corruption */
>  	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
>  	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> -	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> +	regmap_write_bits(regmap, 0x430, BIT(0), BIT(0));

regmap_set_bits(), would also be nice if this was moved to the new
driver_data. with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
