Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1DA34D4D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794619; cv=none; b=NWBRJo4emzAYafKeZsQhGbcROZsh1DriQi0KeElMC+pivWpmxl5B0CeJa3PyvoKB6VheDs3CHilLMIp4JuL30tnXWK74BbANQoMJRRiy/LJbBZQgjb4PJKnEEbWAUtiZXZNVh3670xKiElfu+aAHTs6rpAG5TcaTffm8wQv9dlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794619; c=relaxed/simple;
	bh=zw0qrkMDPESOmIlELUVZ1exwSgAdG5jLeAJM0jyIjI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/JTsjx50p1gsRRvtVKm34yg69Ph1wCflRV1hSFzrMb7V8dG4Ho8s63nF51Qm7H+RmT+cb5SLPjn0vDgbn8lbeaTzQaY0sv9pPWlLSoClGe1GMsXv3OFbHYsQbbBW0p3rQqPkxutRl63z2eivw2FJn2xLpdaFbk+BoQYFG/evrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntSapto5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSQBDd6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntSapto5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSQBDd6p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BkJh234938
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=; b=ntSapto5HtuOo1tx
	+4Wyu1GfIka9eD9b3tS9e0LIb25cjH3/7S91iitGNy7DLR4Fx9d9AJZDs8hNXIOg
	EtfpPBI2RM1JebCar91HEqL/a9Ur8/t1iGqxLHTOyepqlyg1uRvvSndniBdV7KCV
	/jweb56WfARKrsHjqD5JVMJFiGsjKSoKVWpDBorAP31jEZnlovTzqChQwhfV4mIP
	d3PFRt5Ey2bmrNp4TxjcJ5ijkN4a8BlUiVxhLnK3UDXpqqAqhxBV96NVHJzN+tFN
	hZYO5XF43oGcsTKApztW7F/sfHa1btPj6rqW3/DlLKITozTEt8jVERledLw17x5F
	3yU4Eg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xu1mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:16:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso168052a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784794616; x=1785399416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=cSQBDd6pQ4lvTu4+E/SrcEUHspOuVDWgZEBWKxxoWQy/WXdJqAqg746KR+ZgZYgVyx
         ot1irJ1Vw/chvkUmgebabmk9+rxkLJq6h9fUOrSNUp12/cIZ3p9eLZVOSFEq6G8OWD/K
         07OxJPguSF93x5IJk0x8IknzesKLiKX3TmlYb9lH7/zUS2at1te52sYnJGOqagnQIyhf
         cgQLwRP+biOEWmqTX0h0lqUuOlxqT1NFjCSpGEcBnnGN6FXGmIq1AgJvHbHk62sasNQN
         2/ggouIGkcQIcYTQK4ErTaNYW2E3nZjqivW3HWKyRITeIblBcPX9Oaqb/2rd2iJfY4CX
         QS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784794616; x=1785399416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=NndSdjH0gmqxF9lPPncA5/Ud/LM5SzggpfMUaT6N+SgyneNaMsBEkwyWoVWhc5KdPi
         dtPyq7rYaS7zhORqz2Iv7FbDXN85h057f6xPNe2R1+iO/zLDho6FpnQoHgfyWjEpElVM
         1/u31sOylIN0pkNiLHLkkv9knk4dRtGC8s2L0vsu8u6+SOp1WJTRGVPze3vbvLmzmXKz
         wrMPTSLCVWR0N2sN9aD+6yZJ60aBjV+C3c+G5hDPKW+wDZ8CoVnQ67mdzWDg6hJIxpOx
         thpJePBPvPVtEq/hpHBVMKAPdaFzBtXDOYAKxPiOGwT0lxdGRWNlz9Q+X2RhqgWti1Gf
         A4nQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnWl4qV2R3YhXxfHisNPiGawBGbTRrgZ06wa7rGasrfy1hfmCzYWuOUPGsUMH2OFzSjm4pMsmBwo53aba6@vger.kernel.org
X-Gm-Message-State: AOJu0YzUPOZPaXUtLeGqqKyJfcPE8Z0r2F2k9lmWcmUQKdCG/ps7PxCa
	MpZk4JcFZe/2FEdxvDrVtIRPZsreFwrofq36rqN/kFiQ2AxTy/mdY6vXGgAHVc/Phhd9LVhjYT+
	AjlS9G/ouArRv8EJnrHhOH+3CpVnwD8sVlc5qhdi77Hk7oH1RTNTC3SWtwVO6X/StTCex
X-Gm-Gg: AR+sD10cc4OwddDbQcT0yFsV+HFOaC5G3Ti5y1s+tDEFwl5vu92orhayq0kmO37JIQO
	9ut8FrjQ5b+XpVfSeHYokwGoGAIEKmqn+EoESsuT8dBS7qLQwzTyQeYCfr+8WwvdlBy7QWyn4Xk
	RkcApl7nIIfMwhDWTBoOeBwqG8rjBVAzETFe7gx0B2SSiSv9s/vsL3Ub1iLICmN792j6G67eDy/
	2U4H3qVnAWSO9oOps+3Wi2uX7YPhKVj9SDu8VdsaEZNHQBmWWXuwsQg4zm4chftcvhj/96CKkR8
	TbjstKQkwEcuLIr5J0lZ/JOoRxRZKcJv6sNivo6b0gQ18+2w9l7wKPD2Q5vOdcFQO80aqdviocd
	y7LXbmbr7COUvtp5qTJ/OU/6EXZ4L34uuxKdSS8uM6sIkg1V9amXi+VW8vPki9AsIwg==
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882206637.22.1784794615510;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882171637.22.1784794615041;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0f58dfsm2314697a12.13.2026.07.23.01.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:16:54 -0700 (PDT)
Message-ID: <214c704d-4979-4dc6-ac91-db672e792c22@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:16:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R0509dbG2RWHruGDyDx3elO7wqZUEG2G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX29dnPLku2Ukb
 Ep54NHeYnu2s6NK3xUm2Djim1k2DcfH6D8RUOjgoBT64UruJ6wjdeSN7HN66jvATCrRm2OM704I
 aToLjNeSM+N4TJLq5XekMzpPoSuVoRw=
X-Proofpoint-GUID: R0509dbG2RWHruGDyDx3elO7wqZUEG2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX6E4h67nEkCbN
 Xhm1vJx3CHTDxl5Cn/vui5EPDQmgnvb4gc4gDQsfbMbn8PYFcWzxoERU9nSUqJIMIP5GUXlLQBM
 lV49l9c8vKE6xt4UvQQmC/RxwwgdP84dHNXkObsxEFgmBcDW3Q+J/2exLgqlGg1ZUMY4eIZUPGj
 o+UUBsBghn9FapF3Qy2J4YZK79xEHGQAuCce45lCQ5cuj1ppfz1PeyxkJB8eyDxh5Sz/SueCbd3
 89uXM1MBk5L9uvTVInhMu4sF12blZ4zLq6/ijwvHqJihx0ZU1cy8/pLaMwr1bloz1E8p8coy6TM
 VxJk7ZickqoFCnUIEomorWKVo3UDnOLL4X6lf7dl79Pg3WtnExRBu5fNhWn7Skhae+pDmLja8z8
 cWDxDsdcRQB9TFpvXmH1HD5bFa1aZXkI35RkM07gwnV+2a2Z0n/7bZj8PN3hRkYgRe8g2usWEa1
 NfHe04bcfs5MEHLwrfw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61cdf8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=nMW6oa_Obw0FX87ioUUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230082



On 7/23/2026 9:46 AM, Jie Gan wrote:
> This series adds the CoreSight debug and trace subsystem for the
> Qualcomm Shikra SoC.
> 
> The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
> Trace Control Unit). The CTCU on Shikra shares the same configuration as
> the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
> "qcom,sa8775p-ctcu" compatible.
> 
> The second patch adds the DT nodes describing the CoreSight topology on
> Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
> per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
> with the CTCU and the dummy source/sink endpoints that model external
> trace sources and the EUD sink.

I just found the version number is wrong for the series, it should be V4.

I have checked my b4 branch, confirmed the version number has been 
cleared by mistake. Will take care of it in the future.

Thanks,
Jie

> 
> ---
> Changes in V4:
> - fix the wrong subject for the dt-binding patch
> - Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/
> 
> Changes in v3:
> - add correct subsystem prefix in dt-binding subject.
> - Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com
> 
> Changes in v2:
> - remove MMIO for the ETM devices.
> - Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Leo Yan <leo.yan@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (2):
>        dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
>        arm64: dts: qcom: shikra: Add coresight nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
>   2 files changed, 1296 insertions(+)
> ---
> base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
> change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1
> 
> Best regards,

