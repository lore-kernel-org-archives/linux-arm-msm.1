Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593976;
	b=IWGw5pWm95yrTcLimuaki533r4bKKYesrf2CZh+6SN/Xwz1L2HcTtJLxrU45xuAj0YDG
	 VH5tfqvuB1S/nzMB6ys3Wmtjik//4JL24eA9GsDS7z7CjM6tWaCEwAu9szTeGo9XiIjBr
	 Lidmmv5YIkJohQjlbtsVPnBnfgFDmMJfssUhPbiS4fqVhKKgt3H4/og514RiyLRcP6Fbv
	 oFrStLMrsrhK21BP/c07mE9L3i88BLdtANl6aNLGXSm7N7T8esWEZ6saEs7hmzy9/4/J8
	 ceg7aZZSS/c77idFCjjVoAD7OgCrBnyf17GgyKNQOZq1dYFAKqlnLbYshgEuw51QTuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
	b=LyiB+z1MPo0aRzMxx4qO5d3Fcu1/05WtOCqiH6k8/JIMaC0D0BgEmqYDZQsy0xkEgzGD
	 edowLZAyDLKtvkVQeTktO8IV070SWciblglJHGhHrHnNlWRUC4cDiBJ94bxkV4d5I1sOm
	 QguQ0xJFFr6k4d/GgkPXU5FSD6gz3ehp7NedWN/Df77bIrpzInGA0hAp+3DXRqr/1R2OC
	 andVMSxbU9YwUySmtN5ahBderbQLV6NLZ4AZIkOdP0GKRIDoQMUe7xxKc11+LKOFUIw81
	 +rdUtNobiXDzMh3yFBFH/94vDadXIZhj49ezPLI7cCSoSCw26CQNqooaQXCCqOuZXZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv6BOtQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DB606A336
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 04:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987DB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VticY2ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv6BOtQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vG4p3348795
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 04:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=; b=VticY2cihfFLCDyw
	a7fpmLIQtwYsoHmu5fMOcfnHUfhcAjAT7hxuTq1gVTv6fpDcBsJ0k08aVakzNCmU
	PmuLzcvg7gvyLllTC72QWlQiQhVnCZ+Uk6SYc/RFuTS4Kd68M4jCEo//sanIgMYR
	ED/0m0a7AiQP0XX5pSoa226Rew5xRKQ7IEoE5f6LUUtVMILdkFRVP5unr96eq5ZK
	MKH8agA1iyz7y3s2gsz2lSQc0rcVB8y2U13vLOMP5b7b+bkaWSLuIlOEO+rdUKpN
	/+sE+YosHELDRLK7z+O75jQSv+SnDXvZ3GBaU7ddgZuwVvT+LyrjIpd+xmUcaDSv
	j5ssBA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxn5gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:32:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9f0319e06so6333605ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 20:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793593973; x=1794198773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=Slv6BOtQ+i57KuGxeayYkbZ30av4raCBjqKkFBBzOnQuaSIlk2yGroHnyMWH38e2O4
         WL+3lbJHPCli/FgTp1UG9rj54v7N2mEl7AjBirlw6nwoRgypLRJSdOUEp7Q1zlWf7YMY
         jqOhBlmiKUgxol2MMb0Z47Ljj40PwuIBc7ITCmNqeRIFab8OOPBgmzJDiNM/OB+lshIk
         fI28+WPY9/qE12ODmVPv+KD5FSaagccVWHvv9V4bjJDu5VQuuNyQrWDP6mKOc/1cK3H7
         TVQTlPpRDISsmZ5BM7hycDqI4i17pNgjb3Wdqs4tGB6emcV2aWPTfYVzI83oqLzfCKPQ
         +DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593973; x=1794198773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZsx4kHQdXlvl+m91/cU/HmYwWh4oFFZJcdDaksSHOE=;
        b=Q7r0fhcEXlwD5ixmoVI4bz68lSYlTpL96CwSeYElN4jNfoK0VIHWQbYipbACufH/yL
         nz9DwfDqrYbTIreyvecmF5I2wmEA05N2nCdgSALbnQUdxmuOh5xAG+zRz0lHPzhkF4GY
         jF4BPUxNsCxXgTfE8IdqwmvjtRf2woTJ+VwH5PH7FCYVeFjH2XS9IAyFWZubVXtzQ3qO
         62d01nqImCmZpZtJJG4Snb7bvYr/Q67joV7eakSxbMNSXI2ijd32b5yBsRKCscdvhtya
         bNbny35jHfW72dEsn93jH23/ukb5x37ZkYpUbUrkzh15eMZhOjAfLjsRsivVWKxQWnls
         6EjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwotzFHGhmjUgNFhvXh3on0+iwSGD/CpfKyIS20nMv3AbaGacP2pbsAnZwRQbfo7GumY8qaz3Fis/Va8I0o@vger.kernel.org
X-Gm-Message-State: AFq9FYK5BCqnVkKAHnVh19FtfxDG7zZI5+YKfoRuFc4KNIsyIUcEOQ8F
	/5zNhe+w1QXPfKZGDWqPuHSqkDbPl0Q9zLbuYhyXACOXaZLlrpQKUPjw8cveWyKYg9PGwuxAzgf
	FuapS3thvZShLPX61JHOzZLsAEaqGXP/eJp1kuVzWfVaup7UNYqG0q7riZl2P83vRhisL
X-Gm-Gg: AYBFou0qBnRv0FdZtVAR3gZJvFT4Noo2ZpJFrYSSw8DRWLKaYn641OM3yrY8GpDjBJG
	igjt1nYVh5Z5uL1yb7e615hnSpffZE9cNOuGj5Sn6WYIHC4Hmv8tfMgS4g+Im8GW/QxrEgvemSP
	JLQS7LB+4QZOlUYQUbnTMzLuAjXq+kk2yi9ZZvqBHqI6ioh35DTP/WsJvA8uiX9MB0P4egwf7S6
	LUMinClilypI0IMnECCGFDlPPtWgX8j6dxcIMZeKRclWWwtQhMMDcrcnN+9RbRbjIwU4M9B0y1D
	vvujylkizVuujzJHeIhcoiMOo1/TV0BHQ7O9HWIiAbUuvoJPL9rVzE/HcQo2vAfcFrxq2CAeiGf
	/KZ+1ZIVMwUw3Kt9Rsm2e6pkSLXshcMkAUH/Fs+wte2nKvnFTyrOqO4P4L+nCypx2g5Mh1mslOA
	==
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630153637.2.1793593971959;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
X-Received: by 2002:a05:6a20:6f89:b0:3e2:7c10:d48b with SMTP id adf61e73a8af0-3e9288ece44mr13630135637.2.1793593971514;
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Received: from [10.253.75.206] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm1391140b3a.55.2026.11.01.20.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:32:51 -0800 (PST)
Message-ID: <2798317e-69e0-4dfe-9d2d-30e3ba8e1aed@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:32:46 +0800
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
 <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Language: en-US
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLyhWzPRq6MmPJedbzVi6xLFS3zDMsnCt088jU1y0aZ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DSaVo2XV02HgGnhlzx93K5gIYOLzyFrc
X-Proofpoint-ORIG-GUID: DSaVo2XV02HgGnhlzx93K5gIYOLzyFrc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfXyL3G1K9wWcH7
 lYOcy8IN9wpFkxaEh84LX/25rQnYmfqas1UC871X02jNoLlqTo6pYFLOCm1Gp0t+v/7erBIt3EC
 4CTXXEAl+U1haQ7gZubMaTQ3uDpUlas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX6YiXxRaCoU+W
 L5GqqTCFP3Q5KuCvtNXiXHLOwCuEirmVLgwTpMmDTQ446afrWxgQGnhIaEIuMiniu0njicjcILB
 ARD3/U9HyfN+JcewRIGuFYIYSvCdg9k2IV6y588JDm21ZeS+vPqsxrHGDWoHSqS/G5U2VUAwhg0
 vqdX8UpCX0a8ggKHwZ+1xsRtL7EBoBW6tbdsEzxXjjUEAg7t4rdhF3XVInMLSjQhwlwExnTVnQF
 o2Jezoxvaaax7R1uED1AeuevBM6jn5r+oT1WIXdCI18BmUa1ah/3WNVdBT+sFMlfymXgC1GdXvD
 zmrdFKI3o5UVwhwWWr26SjyJwj3SyATuhUZLNF4mSaXsg0FBQJixrTW/SEOKFO83NnrD62lUBwm
 6MvEhYV5RsWK7pOXHa3dRj5+M1IWWtQQi76tTgnyUd+BkdHkh+wv4xbh3AS2gUwi87lS7+LpEQu
 /QNu2ZjN66JDL8VHZNw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae81276 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x9Xzq8uMDaG3QzGCHd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017

Hi Rob,

Thank you, and sorry for not replying to the earlier Sashiko reports.

I have updated v4 to use the existing composite DTB build pattern:

shikra-iqs-evk-m2-wifi-bt-dtbs := \
         shikra-iqs-evk.dtb \
         shikra-iqs-evk-m2-wifi-bt.dtbo

dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtb
dtb-$(CONFIG_ARCH_QCOM) += shikra-iqs-evk-m2-wifi-bt.dtbo

The composite DTB target makes Kbuild apply the overlay to
shikra-iqs-evk.dtb and validates the symbols and fixups during the build.
The standalone DTBO is retained because the existing FIT flow loads the
base DTB and overlay separately.

I am rerunning the kernel build with this change before sending v4. I will
also reply to the individual Sashiko findings rather than leaving the
automated reports unanswered


On 10/22/2026 1:18 AM, Rob Herring wrote:
> On Mon, Oct 19, 2026 at 9:09 PM Linghui Wu <linghui.wu@oss.qualcomm.com> wrote:
>> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
>> Shikra IQS EVK.
>>
>> The M.2 variant uses the external module connected through the Key-E
>> connector instead of the onboard WCN3988 devices. Disable the onboard
>> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
>> matches the hardware variant and does not probe the unavailable onboard
>> connectivity path.
>>
>> Describe the PCIe and UART connections through the M.2 connector, the
>> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
>>
>> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
>> module. The overlay was applied, the link trained at Gen2 x1 and the
>> endpoint enumerated. Bluetooth UART and HCI runtime validation is
>> pending.
>>
>> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
>>
>> Changes in v3:
>> - Drop the unused reg override from the disabled TC9563 node.
>>
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..799faa32e2d9 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)        += shikra-iqs-evk-m2-wifi-bt.dtbo
> Overlays must be applied to a base DT to test that they apply. Sashiko
> has pointed out that this doesn't apply on every version you've sent
> and you've not replied to the report. Please reply on the other
> issues.
>
> Rob
