Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4183B27C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644247; cv=none; b=Pa6Ih1cdPhZhYVNb2jqIFY1jebStccFG3zA/N8kweywNOVOvlN11z1YNf/2wG4fntKaxdalQx7+KwZ4fbeWzam4b9tKYb6CJio4cSco7Utd1hi6/fRQDWFdiRfsE7xaT194+ccS7URDKq3zG881R9KRAvgI9zfHTnZ+QvGdgzzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644247; c=relaxed/simple;
	bh=Dah6iwuBM089oqDaNXeA5gG2dBqwx7GVDzrvA22UYPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBe0R3Rok4CFYUK5KyDyKUqGQwQczfXE7DGpcOui7jio3mS7YKYiThGfEEyXxlRe+lm+7XpK8N7/bRN4Os/NpBs1SsawTlukpMlviqpRhJb6DR9LvNiAFqtdckCvMOq2eMMBziRH+E7dbzyYHDI5nccM3/Q/y6gxb3+E51r39fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAfIuqgr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxxEqkwO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAfIuqgr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxxEqkwO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpgn1590945
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3D7qMpxCktMJQz4cB+RdsNpxfnXkYUNHjKzS7+j7jh8=; b=aAfIuqgrTlhHZbM/
	giNynWh7qISMidAfWGsQgkyolSn9vgIN4Eo4ObT1W+USomauib5QZQLtPtpDN3Js
	/LLjq3JknIddvVCwSVgS3yNbOsdeLxpx5WR0tvJpTr3/mPSwRkW6/MoUSIjKhnby
	/p3SjrhjHKogXjAat8g4qikw7Gw7IBJEEG40jwlomFVTNE5yaJBwN/4jhXn3DQDY
	y2wdzTCqe9nBxornoQT9uAXAu44/TYAGV6SGLIo4PRA4tq8KgKZZU7dMNMraeVF4
	6PzLxXtgItKh4c+/QHnyec0UL/ebL0603SnGZSkPKMA2EU/QUzag6I8gbntZDIsK
	tAaesA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as3853-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso481156e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644244; x=1785249044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3D7qMpxCktMJQz4cB+RdsNpxfnXkYUNHjKzS7+j7jh8=;
        b=RxxEqkwOTytwQIjoRX8Z7yXe0VfpOYRE1WzLYMpMX1VNC8NZLCyAloPPUqqczneJwW
         Ga73sGsa60YskJxvYViME4v7h16YUjBA+apXOQWEmfzexHNCywUKhIxv0D8wcqUAHGWs
         ZXbR+ZnPXcj6ggfwWVu2VeyDXeMvTxFObwuz6CaLPnNAOUwutA1HZ+WyMAl7VNaJMMb0
         p8NO4cj3T0nN+X9B0JbGbdfHG9paoRNnM3GjPYnVsF19qJ0b9zBjFE56HNPW5IzyLhhF
         eFEbwS+yoY4fuVLceMceGfuXwUap3oFBrMTbNSUVa12XfqBTkHJ0Ivvil7tOtU/Pw1Fs
         vCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644244; x=1785249044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3D7qMpxCktMJQz4cB+RdsNpxfnXkYUNHjKzS7+j7jh8=;
        b=otyi90Pex8lJh0k50gGumONVUD2WVs9hyrKrkN+j6cH/Fnz2YnXJbCTCNxpDzsl8Bm
         6MOn8gVsmmPPHrvFpk3Haqh5a4SszdxZM516Y9bYZrnELWJNQ++P9CUiUKb2l+W6Fzt9
         g9Eap99X7jqNhsQnv3lbkhiXlCxWmn3udBngOyg++kwhvEMiff4qObb3MrciPMS8rXOV
         n1O/3Z9+BdlZSgNQHivjpwgScmD9etFKt6DaXyC7iXvwIZBMcJWJMV6Rpp5yuple0N2X
         5tLkvkXgRqTA1mb9pb5l19EBnPvn9hKFAl7+ia4d5eczSLUCaKGIPPbTvnp72jDv6sf4
         6Zuw==
X-Gm-Message-State: AOJu0YxXU4RgYcMsblCH3EJXYEmoy5M9iCpP04Rwtc3oBAby4RXwDkdH
	O1HPnuEqhJQnYvyNoD4BWEVwl/01q7zmmo6G2+QcZmAJbVsFoGxlHgjLRU1O3yTkSeD/3xaOtFe
	sJwo9LxRwTt6PO9pF0dsTrO2RjOesf9YHR3h2DpUsKquVP8Jh0MEw5dP7vRoKTphgds3NaLaA2Q
	2R
X-Gm-Gg: AR+sD101IeAbvDqpx+k1SQ6QOuPpQRCXYxVTBPkS0kIN2MYvipMGLCkl08DxzJ5GlSB
	l4WutSsDIppWbcyPZHTtZiiydS5yGfsJ15G/7PX9+NulOffXNw8yTCuF6eqx8Reij2meqaoqvH8
	DQo78x22rMaoYNZPw8UgxaefUxGXvsmfvq66ujPB+xrna4A0dI/10ngIJWp54jyruHtruT5qXI/
	jr34DgdvLsNvU5IV5AF6yrdn2mBnkqif4jcC3ZNtUr2ii74cFsxEraFq8fcZVsDhy2DOwv25Y3q
	1ihw0WhJm6/K6jzaQTBHpi6Y8MaBQJkT7rba0yChC/cM/1N1dZ+2llQt1aBQiAehVusgDsXDID4
	E0P2mel2V0fFGPLp1Ccpsbxpy
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr594864137.1.1784644244006;
        Tue, 21 Jul 2026 07:30:44 -0700 (PDT)
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr594851137.1.1784644243602;
        Tue, 21 Jul 2026 07:30:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff71d7sm5960109a12.27.2026.07.21.07.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:30:42 -0700 (PDT)
Message-ID: <e78b603f-1144-4af1-a14f-16822e95f523@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com>
 <20260721-eliza_evk-v3-3-92b10038f13d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-eliza_evk-v3-3-92b10038f13d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX9UAKJVCJv/3k
 wj0mFEDr4MRzQNNRA5QVrB44V6mrD9SaOSTDQhrbUddzcPMNK67A8F/CpuRLwboCy/bxpUI/Mba
 xeRVtjg5g6OAtgMCQOnFmWgDb4s/T0/rU5OWhcm9N3Fi7tJ+Yw4MV87sE5J7fhxKYtETGZTlFiA
 oRyCZkYa9qTFvr7etA0BDGBAgEl1dGk8nAr5w+jOQCr16/rS2vCghxwHmZ6cjm3zIv1OCI1/acx
 H2T0dHcxGJB2BUqQ9axGUrxOTbssmWdlappe7rjQ/R3BRIo3yWEI7e+CxEifp9PSBX3qsHUSsk2
 xKnL8VuOEN5FcLTx4blrNwPr74NuDIfFcp1nXrFd+YfoPc6nwnrpcFbvJZhmsOrJJ8SFm5aD59C
 mFo3+WIoxEDsm3MNH8+iXU1nbX8o5xsFK6CMbXQvLcFVtTBFHW0nYV5NYycz49uBotd8TlKL4IY
 wL5RwtJOM1fLYlYD3sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfXyLfBb4LMit5E
 vE2V3DfODfe6+rNsznte7DacDRSgaOs83FkCd++trqG21T2kisEeFSKIoiB5vbZxbnBNau49Axy
 pAp/vW/2/DPe0oQ5l/wQN0fRdbhg4f0=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f8295 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SOEqy0c3B-33mnQezuUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: uTny6WGEIY9-jaYi9nFFuCxlqo2pToa_
X-Proofpoint-ORIG-GUID: uTny6WGEIY9-jaYi9nFFuCxlqo2pToa_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210153

On 7/21/26 11:32 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 59b3cf7f168d..cdf5decfef48 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -2103,6 +2103,7 @@ opp-16000000-3 {
>  
>  			};
>  			pcie1port0: pcie@0 {

Missing \n above. Also, please consistently name the labels
pcieN_portM

Konrad
