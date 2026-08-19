Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB240F746
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139173; cv=none; b=N/0bSEQoIEgS34RRlzI+AGr6VBWpb7H3AybHN7nbh8jRpQ+nYnIsG2etnSTgEfR9TZvMvu1+g6cmVyGBBYXJuHXR1ls1jtPkXPqUKohApIuk1WjCT+nCa0z4VHQFcgd+CkVyzJvccMZeOChFQFqYOsiBjuIDgFqN2+4Fvfdexy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139173; c=relaxed/simple;
	bh=2rJaiVENcAslAsJ/ZJG0LLPqyf8TgsnKRVyB+Uc+2eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFhhiW425qUMntRJFK/HZbf4zqXwzsLKxSuwABezOkUvB8mzdNvePcMC5pQlnh0GN6xq26/sezZW8vPs8XXpfMJJ39afe7f6kHicEST+dkHEBz5pYgEh32MF9sry/o9zJPgcJQNmrdb3D1ogEzL9tqj9N4eezTsR5YWxAfKN6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgfnVdEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctP1ZLsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgfnVdEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctP1ZLsl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA81iP3983928
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=; b=hgfnVdEXGEJEyE73
	mNBROxhN8b0k/C4dt4yRiLnAUzaAwF+/r7Ex4BAAOp9vTt0LQuOptQLLh5+JDl2K
	DzicciUnptPaFYW07/qAEumwePUl5/rkhj2dIrkqQSRHMNLWpCUcnSRbrMiNTkkv
	kkDFXEhRebBeRcJHY6a89CWIxoGUXJ76pUJzcBzEL1UuHvht3E+3SCCej96ICS2D
	CQRWyKIUi2ewuLzPCpQLaKC5t9xLW2dfByFEwtCm9rlWaH9bL+GM6zj+pFzXRQ0D
	cGiW2ZpFvtp8Jh0RsXACtyZ/FVJFNoFsKhknXs9/AiLEBoCBpYl63WjohhKKRfNt
	VRhfqA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjk27k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:32:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977be80568cso7308241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139170; x=1787743970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=;
        b=ctP1ZLslimDzV3FWXUzbP3wPUMtFkBV+niEpSV9LcDaZzrjw9J5ucRiTvyVD1EFIcU
         93P2H57UqMRF87KL4cQVzYakIwFR4XgmmeFvraDBRKroJwIa1m2bRc9w5GEOe6VieYd/
         05H4YvHwIRzZvgKVpZ1Smakt6HgNTC7+22uxAI/nTPEzM2REwZBKijGFkcGcrOyI/CqI
         Ag0rtS6rv063sGD7sik+AaAvg1Vd1IeVMdYH9kGriv/vZbws4WtIeHYqVOLfj9cZBhQp
         qtsTbd/50J+a0AcUXxEUjfpURkT7G7+Ni9gRuhaAMYjiNNM4XSdhUtW0+Mz7DszFlyWt
         tNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139170; x=1787743970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSzDhfuybgj+6b38gQRwDwkRCyqNpzNvsD7fKem5A3U=;
        b=gT/Vejvj++TN7FwTta2M5nb8c5dvZxPgm78lSmAQW8iZqR51E7mtxOQfObDORx71Lb
         YrkVXzrxVl2Qa0fdwT2HcMsJjfpfzm9y6tn3eFqVwA9bZBXZ/d0FCjXobyNTSWIzRiYl
         F8nm7RZfQ4i0Xe8jsGfKGvTTkARunAktmjQmYbnqrXF1APOF4TB3NsRIMs4s7eLZW1aH
         uM1afShSgIHN6XCRKRru70/OIcoqGKX17chwpT28UGr3/pddgSYU7M+JGTLJjbFmD3/T
         mCrp4Ng6APjSYQI31Nl4z7sKvpFNogPX/E147mgOOvOglMRvuZW2LjPcLBnsKxep0XDS
         3ZgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiZAYaRPDT4MyIkmuivYF1XluSPH1RbA/p61Lib22D8WnbGoPzHuiv70pIR6mAUAaCxNqvVmo2XfAYvAja@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XT2orqLH7UqhncWkXPL/PdDSOqcSnTI0WgGtvEjQDQGbaDob
	DoQtSMLuRPCmKQtuoMmNpI12kVkFrmdTrftAQI4TXn2OOpikGl1VugcT8CfdugwJBEoyYmjmREs
	HgF0PK4J7QX3yGl6Zget14hQhZDNJNMVoBNF0EOWe+VqAoNxBgQSGYPhrLUHd/H7Fl+IE
X-Gm-Gg: AR+sD12CAQPq3iRfnOOtZcGf+2zm4sg+C76vG9iycMGuCOcrCEuSRPxAgA9h5Nzff05
	R5EeQajn1/zFWGILlobxxd/W/RpgE+pWPxu9P7Hy7W6nFF2Pxo+7nHgjmMfuR8nwASuPrt1G1JG
	dsX6BMLAeNgPgUumyeSzgrgicxQagF54JWrP0YUIR34IhLQ2xebEiz5DvLgVoG9ycPLulwGSIvR
	944A+qNleBx6Eex2+NAPR5AEnMd9GQUqkNE4yH0E/+3jyvsjwATJuu9BUfr9/bBdC1O2avLOCri
	zUH/bsM7KrrgxFy70AdtFMp4CHMKFlWJNnf0hCURE0IpQA2IWtby7pPYMWkiuPbyo/2/gf1n16Q
	6Xw0HMSbbiNWbYVfcK99Ni3fg
X-Received: by 2002:a67:face:0:b0:778:17e5:d823 with SMTP id ada2fe7eead31-77817e5f425mr240415137.0.1787139169897;
        Wed, 19 Aug 2026 04:32:49 -0700 (PDT)
X-Received: by 2002:a67:face:0:b0:778:17e5:d823 with SMTP id ada2fe7eead31-77817e5f425mr240397137.0.1787139169502;
        Wed, 19 Aug 2026 04:32:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm828146a12.2.2026.08.19.04.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:32:47 -0700 (PDT)
Message-ID: <349cf07c-882d-4bfe-8f14-d6f36fdcc74d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OSBTYWx0ZWRfX5B9PzorA/+vA
 IGrvLvUeFUDTfWFlGyXcNAsutMLtX8vfWEX4YLUcImrjdCJwlU64wWHGWzIo9EtTgOusdwUXaXS
 uyNxk2dkApqyDuY+NEGpCvGLgwZ6TicXd30PzAN7WmXYdHJJl67y2R/I1Z5WmtZMgRm+fYo38wK
 1EKD2+wVbaVdPxAmp1iE0MFESVo44v3nsBlhm9yg36ecUSGfCuyET3/DcVgHrrFdLwkGabGsr4a
 l4n8Ez9yCSXSe09KSjw1U1tOqAri2x/PWl97xhcwvl+jXGxRMavwygNzFicXIzFrPmKl/HJWrpP
 cdI4hI8IQ0ERF/ie7lDqs4+8HFdCus1VtD4XyTTKT2v7fWccgHF6TJpc5x6iVWS1DcFFDOdXW4R
 obCM9ZiBEcFiU3/FMd9T1CmPfA+BFsHewXJLsZTp9wI6ZzCcpLOmmFlYjPaJ5zL+tSKh1ybUxmt
 +VyPkRUiQ8CKKtP96qA==
X-Proofpoint-GUID: ye22fd4xGOYX0hr_uGxck6PBLCiGAfIV
X-Proofpoint-ORIG-GUID: ye22fd4xGOYX0hr_uGxck6PBLCiGAfIV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OSBTYWx0ZWRfX27VBZLemTEqh
 bMM0QlIlX3ns6bE1oja1daHdI2uabypupz00gcc/wwOuCNExqhoaRItlI9w6jhFSRsBDz7BNRfv
 HPwflqNFo6PumNLKV4LBHfyKxR3PDSU=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a859462 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190089

On 8/7/26 7:50 AM, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index 590bd2432d85..2064eed01327 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;

RAM starts at 0x4000_000 on this platform.. I'm starting to think
that asking to provide a base was a mistake. Let's just make it
<0x0 0x0 0x1 0x0> to allow the whole 32-bit space

Konrad
