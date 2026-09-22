Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02224E06F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077201; cv=none; b=D9mdcJPCbdb+tt/wZ5OuMiP+Rd2FqWx618stP2ZygYh8rLE3z+ob5PbmirmgaN6TVq+SKTR2d2v+liZCybDnmJ7tiwE4VIWFlDXUGaeoeGjoObyxplxxvjshqXqvxzLp468LBVVtoh0emSsHNxRxBckYD8gdBCzV1AB2hph1Jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077201; c=relaxed/simple;
	bh=KUQQsn6q/8dii7PHldXmK20dBoJmf2RA9P5XylQtRT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llf9SjuLRFLl+nLBuV/HBAgORnhdoS2H70TCo8ydnuOUTusE1J45mJXQRzVSm88/vTuUbJEwYy30PA3VCjedOJCPHykqxEihd3g2TLR/4OjRpx4SN99KV2EDdFDtwstqoE3tpRvwtnIKvaEhCMuYogfHX19E2jBNIRxkoiC5gpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/L8D7rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K17epFqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/L8D7rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K17epFqm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPDFf620047
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWYqY6xZrSrkn3IMyg+q5NeaLMxvL9SJQpSYj+FRMHQ=; b=H/L8D7rmPDzxSPUg
	GGefoGr1ZAeRfyU/n/sem0Mp3cVShsoZ3lRwCKoZ+37TS8UeVA4ORMLqoICQlZVA
	CUPwOLP1jf20NQ3SWyF86/irZ0NUc1+mjtz+2Y90YA0pd3ONE83ovk4ZVGx6u3+u
	6G5m1ZYwZKZP5JZGYdx/uyf5ivieGwK2SKq3jP/Nuw2ZHROEa03PiG+EsTuNsZtg
	aAitQDHCeV3QQNy0SjtqDfz7NJDyEjT5ap4qeb7OHxRw3IIkI0ZaneKRxdAg/d6/
	T/Fq6YmfzCh/CB89zi3dscmNxGHRu54XAD4riR4b4gavtYBTBDyPFkHjSKmiUmih
	xbvzkw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5sykx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:39:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9ea608ed0so18759e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790077194; x=1790681994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWYqY6xZrSrkn3IMyg+q5NeaLMxvL9SJQpSYj+FRMHQ=;
        b=K17epFqmuKBXwvMU2GE7eqrrHhW1DtKmTwR9P473M1XY8FqQsfIutQUaQcOsU9gtpv
         TvBWkRup2GT9vBJZgdGzlyTNN+xwShLEkTNmO8lDT5LX2qDZq7jIu0Rtn8i3Yi/BER2B
         MRaajl869cnjDckabyaJ6r1vgRxWjoNozVrUTWQdBmSL1m4Wrc3cmzmWxtkDfgLZNAZb
         VdY8BImG5kqA/FGqT6XYEd2jnTb5Ig4IvoOAJvqtkXt/OUVKruJpwEo+LQMY0QmTPaom
         VjJEYNrV2ERfszUfYUJNSm1NNQ/v739BKpT+fPlfjfdCLH7hmxynwdvgrLxgPKRWjLzI
         dC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077194; x=1790681994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWYqY6xZrSrkn3IMyg+q5NeaLMxvL9SJQpSYj+FRMHQ=;
        b=BCbLnnT4XxGz2aqY3kQVg6yfIwnuaNsg3EHkvTqdW1HPblsJGVnGrEXh5ou5lfh9rt
         KQTEIzVgOOuXcoDwntoPJHPqvPLEErPPRK21PfznaWBHPkvObHtIoSPkccNI3cWgFqoC
         xsgdmnUBRyCaheSYe2TeeVdplXiijoCmk3xTc22AXkve7lWpdn+EjIF5lwqjzQHHUgKM
         NRWDKOWOlxlFuW3PXhnHMb1v59kCPdziQRVOEBWLwZQRItiT7Z81vU2lH7ig2KYC3hgG
         wlBS1I5jivc8s4rwYf0UsucPPuZUc4NmdLhfkyztzelSHEwO64UYdiou2f8HDr25Q19U
         cQeA==
X-Gm-Message-State: AFuF++mH16xHjr6x6JkHea+yPNWSjLHR/kuxYZ6qa6ojQWJdEZVNnv7B
	mmIX31NFXEHnbE3+qPpnIEWJ7Kc88dhNVAX+Ap0OAAOGklQpTjLGegO/6qyxejWecQXXT5c2NxZ
	R9MNbGBpyOJNXLM8a0aWXD6IqTIVlhCv1LPhyAKcJZW7WnkyFrfJSUFkl07WPBhV27EbC
X-Gm-Gg: AYBFou0e71Rz/A9hCUKDI1CeeOZNqMvkva4PRkDDxgA4TszUTJYQtR6EGWAK80YriPx
	OpEK/Qf96oWKZf3x04/p+2h7B7Z/Beul1ClZoZP3Yd/Qpk8JlERlcLSorNgl3Qi0OmqJxUDzeDF
	0KgrpzPP0DZH8cNETkHrGw5A+xFPsvysxUiQo+3gzftcgmiN9aFUS6hoSprPrRy9zIBE6jJzGCr
	GTQi7ysA3WfoHUivte5ZWOvvNptACo6Ljo/2HUTA2Bq/qO40EUzNmwb8g7snUnlO0vjqbTLOIFl
	pDcxivCUWhPLuCsMWnuJCz7H5/celgnL/N/t52NtSWsMjQHWnUBfmUVelKlaLwOZseR5zUU/+zP
	Mtktl0i6wVqVMYiDJp7dMpw==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr5319833137.2.1790077193842;
        Tue, 22 Sep 2026 04:39:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr5319809137.2.1790077193314;
        Tue, 22 Sep 2026 04:39:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c647c3dsm70191666b.63.2026.09.22.04.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:39:52 -0700 (PDT)
Message-ID: <bc3d3df8-a2dd-4ac5-8064-d54d4eaa3f6a@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 13:39:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D4RXZyfT_SmpgyVLAcMUJznA2o8vCOyA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE2OSBTYWx0ZWRfX7LnDbKJrkvAo
 Ijbi0E8VkReaT9/6Vc7eK04P06w5gcKP/BnEiXBW9PNNhZ+jjqPHb6eQidUb6jAdvUbs4Vovp+A
 aheWyDaAE1uY3fn9p0Kx4zlgMoPV8rw=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2690a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=pmPbPCl5H-S4eEFWxkQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: D4RXZyfT_SmpgyVLAcMUJznA2o8vCOyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE2OSBTYWx0ZWRfXxKb1Glsz/xDr
 Oj3BhHgaAiNRCa3jr0xPvQPypgH9yRCFvEqSTsVKKIL6Ewlep2FbgiIF2UiNIvOOeMExpmJJm3O
 ovnr6TvYEwuexzAq2YSnQH8MZWXEagYXehDTCqkW5OUrvWmxOjlQxxuMRc2Klx10oWgXr+FvRxT
 BZ3FSjRzQ4vkwLB9AqGVFgZRyK7JArg6PuB1wxAqlXOo5+QDV29JktQvwPjEe1S8fGhx5ertqNv
 POPdoPVmatY54yAAKZf563Kfq++6nRDc/KNcXy38sCod3nWfe3NlSGquyv8HAvzp2w5iggmzWjO
 7c1LV2M+Npfp5xQBg5Ci9wOFGh706s347pkjARCZnMjaZ/tnWTC/7l+NP1Z3me6gNJ3mnQLnnnh
 +HWn5oKp2obYSEAFL38eND8VUjVkOfTbIEDNUp95WJZ5c+YhW6Mpc8mrJkRjszmbKZKWo0Pj7T4
 0aKfJTI0LJ3IP9Si3Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220169

On 9/22/26 1:28 PM, Neil Armstrong wrote:
> Add an initial DeviceTree for the Valve "Steam Frame"
> codename Deckard. The Steam Frame is a virtual reality headset
> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).
> 
> Providing initial support for:
> - System reserved memory, regulators, gpio keys, PMIC functions..
> - PMIC ADC Channels
> - UFS Storage
> - USB Gadget
> - WCN7850 Wifi7 + Bluetooth
> - I2C + basic peripherals
> - SDCard slot
> 
> The bootloader starts Linux in EL2, thus a bunch of EL1 & DSP related
> nodes needs to be removed and the reserved-memory mapping must
> be defined.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +/* Remove nodes */
> +/delete-node/ &ipa;
> +/delete-node/ &gpu_zap_shader;
> +/delete-node/ &lpass_wsa2macro;
> +/delete-node/ &lpass_rxmacro;
> +/delete-node/ &lpass_txmacro;
> +/delete-node/ &lpass_wsamacro;
> +/delete-node/ &lpass_vamacro;
> +/delete-node/ &lpass_tlmm;
> +/delete-node/ &remoteproc_adsp;
> +/delete-node/ &remoteproc_cdsp;
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &reserved_memory;
> +/delete-node/ &swr0;
> +/delete-node/ &swr1;
> +/delete-node/ &swr2;
> +/delete-node/ &swr3;

Hm, maybe we should think about sm8650-audioreach (simialrly to
how we have a split for the kodiak variants)


> +
> +/ {
> +	model = "Valve Deckard";
> +	compatible = "valve,deckard", "qcom,sm8650";
> +
> +	aliases {
> +		serial0 = &uart15;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +
> +		framebuffer {
> +			compatible = "simple-framebuffer";
> +			width = <4320>;
> +			height = <2160>;
> +			stride = <(4320 * 4)>;
> +			format = "a8r8g8b8";
> +			memory-region = <&framebuffer_mem>;
> +
> +			/* Bootloader will enable the node */
> +			status = "disabled";

Is there a reason not to enable it? Does the bootloader prefer to
only enable it sometiems?

[...]

> +	reserved-memory {
> +		ranges;
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;

it's usually:

addr
size
ranges
<newline>

[...]

> +
> +		aop_mem: aop-region@81c00000 {
> +			no-map;
> +			reg = <0x0 0x81c00000 0x0 0x60000>;

0.dtsi

> +		};
> +
> +		ramoops: ramoops-region@84a00000 {
> +			compatible = "ramoops";
> +			reg = <0 0x84a00000 0 0x100000>;
> +			record-size = <0x40000>;
> +			console-size = <0x40000>;
> +			pmsg-size = <0x1000>;
> +			ecc-size = <16>;
> +		};
> +
> +		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x81c60000 0x0 0x20000>;
> +			no-map;
> +		};

Likewise many of these reservations also exist there

[...]

> +	/delete-node/ smp2p-adsp;
> +	/delete-node/ smp2p-cdsp;
> +	/delete-node/ smp2p-modem;

I think these shouldn't hurt even if your usecase is different
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>;

nit:

property-n
property-names

please

otherwise looks pretty good

Konrad
