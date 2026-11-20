Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181197;
	b=E69CD/1JwP0VJBqyKqoiCFWdDxtgoVseXkvN2SOu54GzcrzVshDSDkAB923Jp3+v1+pr
	 xRWt5WkifWf+xfWT6jqwNnA4VbLatROGInN5GTs1L3tis0sJF+qB6ST/q+H0wqtY79XCs
	 ltG9qwL+ht0x4KfTALPeOu7DPyhXoSFCaIl3tgTQeb972eAbVcQNoDNCp/CvgbQ/CuDoR
	 TUj5IP5tU4+g6gZlHa4nESxQGm/FtUZpBcr20AtF4EFLSeG7FqeNvOJ3k+nB4RXcqnNOU
	 U0DMUuoeQBmN3l8iuFxnsgFiC8dd+0aGC/A9U9DIB4ShqqY32zEY51x6atfCggYOCzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
	b=NWWDFc5QDfsLhUrtx3q0RUEMR5uMlgBkP/QRvjmd/bTWc4DgnG5/cP9EGVxffqbUNrpv
	 XIjUqAyHOIYOyxFBXDeElZXmxFNqn6xck5oS0cOAxHm0OO2OA/ugpKk6QszSvaXCa5iK1
	 GLV3o/WGHE+GabX6nlEs8DahVYhOOZXj8/pAy9QaPNvvCy39tC6Rr55/VykZD+VkLcUQV
	 SLjTkqcf6MCwkF2MPEhnxVlQJXPJitu5ABUMLFYj0KDFYR308H79zeZAiatxZ/qKY4ILZ
	 azTjZr3hYmiZ70ztUwE/C609ZlrAhNlAmlyxLbUfGpTz9rD1T3yIDm+XpRajvBzEdVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j1l/B9Uu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBA606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FBA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1l/B9Uu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqsO1681896
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=; b=WW3IVOUgqZt2JDN6
	rcYX+9pgdjsLTzLooxM31+fC8UmexcaTte8Sab2dXShQeDo2AlpyRl9Nr3NN16iI
	9t+Hxm+0eCSO98atvXzK3nl9BHXmin1yny4yh4dYvQYzI4xkqogoa0US+sVhYCAc
	9RdJ+E82NtalK6RDuy20fsOsbmqeQ03JKs5te58PFqHyZeIPz8k3Q4v2tBQVIwiM
	C/THG8hXb+BRrzdxnEN7J0JPs6JFVqD/2hLNY1FC3nxY8QRmKwOQhdJZgPNfYrco
	CqZlnqiyiC0gpREHzfyEb5JBdYXefo0n2PopyQKo3ug5/VgMdvYJE+LAw3nqioeX
	woN9Sg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tnmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:26:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1129944eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181196; x=1795785996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=j1l/B9UuDLjEc0Jg5PVUu60ymjGMJklgVwx8jxWUxRGGFwBkb5tid8QvkCmTurzJrn
         P/36Jd6NpME2g/pImTQdvpQhNN06iJPGc5tdytgBW24FdHfAPijtl6LJhj8/NPcnOSlT
         JjoEJAol6q5mU62g6fkTGrun9U+tZyx+3tx7UDlDy9JX/5lyAVsqJlwe3cd6/D+b7wF3
         JJTBUGWKQOwTpAa3ehYOV4cXwYUit/ju+ZiB1hx40D5YKnV2j0QOmZqY7RAlJnGgGTf5
         2U78M7qbEF3ixh29YZTchyFo3dOyVdQ5Wz5piDvrjxvHUFAvx8gdKEcy1G1TU0rRytHr
         7Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181196; x=1795785996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=04vCgXVDwviv3Y/FhSaOEyROuFCe0C9sZVd8iBNkqCiFhw792U2p0tG8vOXiugRapC
         3Ns3OAMYqB1Yzz36bkkxy8Z5kZTSpKq8cSpXn72ttJrV7RrB4qlxW4YIe2G0/f40zmS7
         DygMYGJhuGBAEhHcGh+xj4eeF9N/MwUYQH2J8dUBlQIRhbsvUF2Y9N8SCY9/CkEmA0w3
         nV8MXKxbSHif2VtD+a7Wjs+S7mFqdXKBhWCmwR8ausHUplmztd/bPTJXhn1ZnUMtZo+Q
         MKP6Q7mtbPMzs1um02VRfIpC1IgQ8TwFFkfEhqIsSgn6OI1QLuw4ecEp1XK8qGf0+kyN
         XYmA==
X-Gm-Message-State: APuU4Z95LrjTFukqWIr8vy3O6/c1XW2feHLn+G+pmMdMvz/aT6UVblXn
	Vl7KWI3b7ySYgG7U5LCfcT9YKa8tx/jJ8rlo0D+3HxN0Q89G5MEb5s/3EzQ1H6IBjteyzfQd3q+
	nJsLG0nTrZhwmWqAxuYxAntHRdCvlUeJdFsLfaWx9PX3FOx+3Rii8IoM5zGJdOKs89sDV
X-Gm-Gg: AZFdTZf3CCSi0P6+5WLmq/imGwTGkexe9ldif4F5UTRte7UegyEYm+feJcisbJM5Vsh
	Y2uPJY3ple+WRpV42HkGD9lqZNZchSD4VNN/qmpULCRFkbsei1tdy6eugE7TEKNIvl7zWDk2Xst
	gnP39XytGG92HIqNakqXekVDbb3kVDW3raNQBM3zVzgEV6/syi4J4BxwRT9XVPTMm8Qkq18hk7z
	x0lmC+oLqLkBSVXV+EZz6syXOOq7siOCpqT81C+FnbOxdUykYHJCpKbUB51rKdlaZoUtchFtj0j
	aR8Wx+wSpUrTl2Fb46bxr5rsjdO6n/3tok7UnP6nAmNYx8D7H4NOCMvK/PW+c7rnzhRiiNWE5T6
	+N4r+9D/r6bu9ZQATIf0hNeXDVkcl8ZtQkVio5NYF4hUqlVur98vFoP7RsHwOdnZzMFEY8KlGMS
	ec
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679283eec.7.1795181196139;
        Fri, 20 Nov 2026 05:26:36 -0800 (PST)
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679232eec.7.1795181195409;
        Fri, 20 Nov 2026 05:26:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm9691731eec.26.2026.11.20.05.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:26:34 -0800 (PST)
Message-ID: <293200ef-a480-4732-82fa-e452bd5eb61c@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:56:26 +0530
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
Subject: Re: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004a8c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcqzsH88EwdISXoLbJQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: IqcYec_5ZZkFMvNEPW9H6T1fLMS6koTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX2c3IZRnkn5IP
 Hc/Zq75EKRL4OoxWa77n3uZ+d7iwj1mf00wwZ/50lFV78c3o5L14Cx14z8xrGHqkEkqM8HveYjJ
 +oaYQsEqCWDBQ3vmwplj2S1IxR0cjU7oz6ZyHkPTbMZiPwgiYOJGCL1J05Smfyb2l3Id2v408SK
 Fg4iYaXLKia236y+EudCkK35Kdudnzj+CGtXv/NwUCXZwbfHw163dRf3LsrEPCbNZzJdABWUI6C
 mk8OvI6pZN6DSCbkNSA3uqkECD5fmBqklAGM0W1NnwQRCsHVhT4FYrTcT+j5KxGRSOVO/+haO+C
 jWPSM3PSeajZK9g34uqF+/MBVdJy7y5v0k5ksDydvml1Gyrx5zQVMgg5SPmT28DhLAxjJTkjG/2
 yqF3IZppSbhRfxXtifxtdlHdo+C6KR3sdKHWJcTGfnpo7TIZaZFiSNFXnXJaQuqI46g1u7Pu7tw
 Tj9MP25FKL6yR7evsjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX3IdSXwB0DJmO
 qUNvjnDfgyNPjTNl9QsbdjYXjeQDP/EMFgh9BMQOYChBts+FRT9of6OZO+pd8yjNK+wY6t2FNPT
 ckcEwP81VCdb7k32S7KXZeQXuNvIYKs=
X-Proofpoint-ORIG-GUID: IqcYec_5ZZkFMvNEPW9H6T1fLMS6koTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

On 11/20/2026 6:46 PM, Komal Bajaj wrote:
> Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
> default, with Linux running at EL1. Booting Linux directly at EL2
> requires the remote processor firmware IOMMU streams to be described
> in the DeviceTree used by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> generate -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular DTBs.
>
> Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
> Gunyah by default.
>
> The series also moves the Qualcomm PAS remoteproc iommus constraint to
> the SoC-specific bindings and relaxes the item limit to accommodate the
> remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.
>
> Komal Bajaj (5):
>    dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>    dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>    dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
>    arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
>    arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
>
>   .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
>   .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
>   .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
>   .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
>   .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
>   .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
>   .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
>   20 files changed, 220 insertions(+), 3 deletions(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Sent accidentally.
Please ignore this mail thread, refer to latest send [1].

[1] 
https://lore.kernel.org/all/20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com/

Thanks
Komal

