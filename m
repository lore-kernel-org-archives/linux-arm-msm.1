Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610538;
	b=RTXad2JQ4nydRjLGnXvjHZRbxb2OcRQarp/TnbY8vdvNdO5q+utl2uI36MEA4dQtosVt
	 oeKQc5FpeEX4/xldUHH2vK6KwKfCI76jQKxeXLfcn/lpg7cWZKQZijciRMvAX7SNx1pr1
	 rcoq2o90Ky1GvTpVxw7KwuP9U+kA2t23N+Jck6LBI/yXq/EVnOCx74KBR5pAqtbOoFEQa
	 YYuo3cgctTDWoaFYCfG9S1yIsd9aF7bD3ymOlZGAykn84qpVUyVFv2aAk71utr0eEUWTu
	 cszvfWd8jalEoP7eil5cESby4DvBUVdpCvyTXxbR2M8Os++kTsLAJijWH6AB2ztidDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
	b=sITkQoJjCPUoET9bY94VZ1O700JVslnfE6I51TkwE10s4EGI0/tFiG8zveFkNhfuVB+E
	 m0honGlHbUbF9wqbD3EaiqysZ08aSqPRisB6uL98geL2wkPNEthbAU0zTy/+fBtq7P6RU
	 iMEZNZhPo3ddnjtnyGKPFKwUniEf5QXL4Us0NtdlD37aT9KrnQa345NzFZgIi2M+aEgGO
	 biG4J461Ewm83RWZDad+SOJHct2jBItH2fDHMmzykeBQAIQITRYnJuuYHbYHs4EMIksvg
	 u/wSQEZDLun/Suw+WEyPP+bxw6ag0b3umjVFAr7j+BNyA3FhtNcZInhKHjjQjprU8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoMp8Q2h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5DLpbee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C5606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37C5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoMp8Q2h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z5DLpbee
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9noEE1505311
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=; b=YoMp8Q2hy6kKxcBG
	1umjIj3ZIBP0C2iyyYjf/pcpCSgxuP9/4LbWPyFe9EMMnjmSeZ2vGjkmw0vA+oIa
	7RdtUeu0ByfL5KL+hRXG+xReQoMxs5yvsaYBZQcVTnxN8nHsMhmNfUNb7ilpJlis
	eEmBEH2wS2TDyrmxqOfBqTrv8wvrIP/gOa5DWKH1gbfUEprKyOdfHtRlT7FP/0Ci
	0R8yp9evZnz2W/CKFJ4wJ9//Ga/FxzWomqLNhyW4l29TE4WHbWAjIkl+EKZNoEll
	vE74L7TCi2AjzrTa2/ZrIx+CHz7xvUfT2Q2wODABSUXURsBrHAc2V1XwafU1ARLo
	Ss4TTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2a7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:42:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb96533adfso3525993a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610536; x=1796215336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
        b=Z5DLpbeexLsDWoVF+K6UoC6rbHBH7jaopku3Ou6RNk5BU+iQvwUoOnDYqycoSRxi4V
         3K84+A9gz0zeqbB+rfmwJoLs5ZRarw8tMqSwfYSK7k1k3G3qtHFCLkncfUoXSqNOV/wf
         lCR7AOgYv261i3L6oAR0eXjQVG/hHqLLt33x6CH4GkerYtXJtNltFvRsL9fvHcXo/czN
         akCy9PAnolfyuEBfHaYtgf91i8ugwQVSZxt01aWtt2WmwBop12cCHYVHjWJ4Gl8J1U3a
         JgSwVOfb8DxQNN4BdXiCOPnE4FY7cMWsFBn7zn+OcKtClan9wv48TMm+M2cqfXhhf9xy
         axhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610536; x=1796215336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6GCM2V0jKSRe/TZ9SpYYgKb0vW1cHE30CX742jw7Y8=;
        b=pWit8ciZQg9ugbUSHg3hIDOv4z+b6TJMZT3x7TmVwLvFwOH6gORKOr5MVeirliP4gY
         CcOQYnt7hmlaO1k8IMoT5HlQQbCIzmgrBDE8g56zdOqtlHmHMHgx2DPgAa6gRZ9w5zUR
         Mh8xyBliO9wlyZbMjUymoofpKjIp8Jux1SdW3NDW5SFYQ4iD+FR2amp+VtQOQQRVRXx6
         52uwusWU/hngFYO9VGZ15ATuecfKuE7quHUudyYiXGPJ9NvkZ7zAcZWZECloiGLzAqvJ
         eNlmL8J3ZjrUSiPw5LbZCl7axPvVnc1vvHy+HXDwso5Obg/V8VprPYzysDoANL/6uzFu
         ThNg==
X-Forwarded-Encrypted: i=1; AL+hErGOYktojOKhFnHIf5kJ5PoZiYbzg9jD3fb7rJGInKZTc50jH6r9mzwfTCHC/aKvA010gzm+ptc7uVGZuE69@vger.kernel.org
X-Gm-Message-State: APuU4Z9sjEWFgLzfBSclID6GhVQ9bo0zrvnScjt6JqZ9rGi6VkSV0dsN
	FtYurYxB92gv17heW8tsrpcJuM83Qftnzp+y7P7dTjWjLhBhbHkPZzp3AUrvGW++pHufIpqR15G
	kIYmeRLXmurfAarK30DbAlwWVwbDn9eJddRF0Pb27Uviuy+J20LRhrD288NZs+oN+VXVa
X-Gm-Gg: AZFdTZcs1CJJQ4Uxjbei7HvyJAEx4PpDy307PjB9HNq0BJvUj3kNNzSdROAHMXx3HLG
	kvi8gyieJU4q8+hKdWECo1bN41pxBshBtD/6Wm+P5BYsQ3W3IAjPscpf14tMFbs4nbq9383svQK
	9wSJIxIv/L4sVt+x/6lIqKmMMg8f0IPXmn6fyCYzALVDrwTc4r9B6nuWAgtSppVvEqiRGJEjXp9
	bw6DoyKyq1BpHbLAtu7IIa0zr/uhDQ/twNLwWVtI+PFv82+3gTsTVAujpiHmAHOGR+ZJJM/cPT4
	0AIF6CPHVil2ku5UicL4Hn+F5jkNMRF0DgNg+xGUcBP516AnLfTtamfP6NArHCb04WSNaMREyzN
	LKHilBKu4rPZuaPVkJWmFB/dn5omZij0NmizQclDbT8ZYD5hMItL2rtJZlAforGwsP9hu3A7YQ2
	L3P43vB7BaSaAUr3fYrO0GMuUhG3Ej7wcTcoE12+LjwenmDlYoTNfXXAaxWobtfN6LEg==
X-Received: by 2002:a05:6a21:898c:b0:3fb:5a07:e08b with SMTP id adf61e73a8af0-4014e255372mr13799963637.80.1795610535694;
        Wed, 25 Nov 2026 04:42:15 -0800 (PST)
X-Received: by 2002:a05:6a21:898c:b0:3fb:5a07:e08b with SMTP id adf61e73a8af0-4014e255372mr13799939637.80.1795610535285;
        Wed, 25 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm9140199b3a.4.2026.11.25.04.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <30910eb2-1bff-4f3c-ac3d-45628292c466@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:12:10 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for lid
 sensor
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Sw3otRS8WUqgrxFTfPDEqpFpW-F-Vqgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX/JHfvWdEA2tb
 uFVtR0oOtWEEC3dgI7v+IFdblR0c9C0Xx7fcz+qSXlZNq5v78Hox2sUbTEcxNK5P/SSQeSEr2Ix
 M4HluROvrIphoroWCLVvG//pbSiENQM=
X-Proofpoint-GUID: Sw3otRS8WUqgrxFTfPDEqpFpW-F-Vqgk
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06d7a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OL9AEtDY5FzCUqsNUMYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MCBTYWx0ZWRfX2iJ+V2wfBhBr
 jfTaSeU+vcTtp7pKUwYnAjgwUU7dU1D/l0txpFpQt1DQHBz1Npcv+E9N0R8B2D6BeLz1Iclkbp1
 iz6e4qSmx8qSiC5UuCjJWxNxfcpOY74Yi6Ua6OH9ihX+MdnUBJBfodravYKB3nakzQiodhYbgW/
 leDWvxnGtI95Fw+mnNMLSztcrDtTmKEPiethQZdg9WPndpxwg8bCwlkCy3lwZ/iVT11rYxezZSX
 lTOVopTOV5silTiOw7GYFtkQ7NNg44G+8NqhSpMfPkgTF3ycvxm03wqiDpOJlbvirbYHKekefSw
 8/lZ3rCKtzqzgpvqy2AYULh8l/bFA4uFudsAz9EP1ya1Z3h02PqBWv6o4BBWhFmWbNNhYDD0IZf
 UN8pvfWAmpSNeMauumU7AEToN65KNi2BUSWH2aIrm87xHiVYJsc9o/C12HkTx2cEj1onF45lY+F
 weQ06rsY1niwF32tCyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250050

On 11/18/2026 11:52 PM, Pankaj Patil wrote:
> Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
> Fix the hall-int-n-state node to enable the pull-up bias
> 
> Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b..74588f4f7a86 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -819,7 +819,7 @@ edp_reg_en: edp-reg-en-state {
>  	hall_int_n_default: hall-int-n-state {
>  		pins = "gpio92";
>  		function = "gpio";
> -		bias-disable;
> +		bias-pull-up;
>  	};
>  
>  	ec_int_n_default: ec-int-n-state {
> 
> ---
> base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
> change-id: 20261118-lid_pull_up_fix-123aa8c6b744
> 
> Best regards,
> --  
> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 

Please drop this patch, the additional pull-up enabled did not fix the
issue in it's entirety, we still the issue but the frequency of hitting
the issue is reduced considerably and not consistent across multiple devices
This patch is no longer applicable.

