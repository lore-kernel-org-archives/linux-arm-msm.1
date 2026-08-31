Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071F3E49EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170750; cv=none; b=csJLENLo0fbx8B9V1mOR1J0BjdpWuSrEeQ7/cPet9OEG3Hsl0xp6ZUx/NCl06Zb4Yo/rb8Nw87h24/OQWa/9H5c8YLhJCKw2pfKUo7W5WeCvQZ+8ZwNwrziiBrkSA6NSi89kUkFFjw4nA/E8mA6DeReMQXWmC6K7B2i5cOYwONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170750; c=relaxed/simple;
	bh=9WUTQgRakephEhhifi2ai7YVHSAGw7Ewg8/ZVPhpY6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMGN8Y/ID0QyAl4WfZY1EzZ3eBQ1eYiRYvGjWMXjpk23eoUGOuXahWFmpgm3t7HHMPKvHN5geY4pFJPsqLdu+fraZHJMTMSCG65QsVBlhvtkjKEuC/Mc+g9mUg4siYNLLoE417nk0aNGLZqTcSTHyEVHgHfQ3elkkxIPu7iqyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA+BHz7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDlrDTtX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA+BHz7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDlrDTtX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9AC6b3182618
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=; b=lA+BHz7xafasOZM+
	OeRtipnaY/XyUvBm3wO+CoqzMcFzXqrxNw7TYMLNqQ0/Mo7xTjSWWRdVNfDukGb7
	GSyLEB4X4DRFyn1TzCoWI6Kp9AiPou5DQAsjwoYVT42eCOktgd3nMoVxRVcr+Bag
	+G2JOdl5kFCFR/tINGFyHtXqW1KncdIQYcN+3V7u80VUQ0EPkV2eJGH9tJqVTDWn
	ivjK16vqK8erYRAHWd+F6HMpqopwrvKwDDiQrOA5q9mQuJGybXiIpY+t6JPmVQ3i
	sPBWHGRiviLKu2SAbDf1bYfMB5gTu79MJFP5DuYvxBdqQ7dEe+gi6LBNW2MQ4A0d
	AiI1CQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb8796-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 10:05:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4741104a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170748; x=1788775548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=TDlrDTtXM7bzNpXBYpAzARmHlCKCWrNY/ebGX+rfEMxwyISOu34LJhL/UxVVk452UP
         bc9FC+IxbmqoLQMYQg42MNUaIgO7ijKeYBsV+PXDAt9SEt4BurBWLmMwN5bIl16SMKfh
         etFYMsrz6swMtBNRl9JirCvWvOyob4sWzTZDfrD/Cnbl6YZx3j60Dq0vMwUoLj31owB+
         0i/6toQEoEBU7uqwVeuXd8KE/oyLJidyBOB6eSzpvozcd/EvzOuqPlJ/KWmPYPOrH0P0
         QrBKoBVH93m+fnCqrhhCtjtbI/KSX++BJAsGF1k0AiT7PsBZb7zI9eaOng0KNrj1lMSf
         qb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170748; x=1788775548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=GJdm2/wAK7V4ZSvky6EQzt+aKWrWGx6w4T0ZsZA2svP5p3giz40BW6gmZILZgRhxMf
         wlr2cG+/7TnhlXp5Fclg4l24xN80x4KgaiBg/MLiDu1TvZ6XwjJbCNr4kFTENVJJydx5
         kMByj3dZnf2lKb3sWF1uxYbYjFijygDkV3uRhF+wvdBwArg1X+rc2U/tFtZ3PAHsu47c
         0FfY1cNtjUFwyrYdgzpSJZHMTG+4Bp5H7J1QWUa79AukG2n2EF73+gyXWsPJpniq8W5m
         HelYPWeeHKTlCoGD930uH+61UhtWLizgt+xobgnyVo296qPNVkFsA6mtNJ9/IumuSd1K
         dlaw==
X-Gm-Message-State: AFuF++kQFSBHVPtYjYHojO1PMqeuht3dX5EJbiQWjzj2Fn+zDN8wAc1y
	dxFhA9WirGs0LgiSa6vv1zNv00OD+DUp5uzTdjQL6uHZTCs4pA/eU/Jq3bkPXXyUTTOeiKp2mu4
	5v76Dl0zmfwNnIbo4wRLWtvf03qqsJIcDOnsP8bF4dUWVAKOa80e1uhvmIY+30xeAfH13
X-Gm-Gg: AYBFou0pUQKwp8DQQQ5sbnd2Hxo5RBdPsk8yaWWfiQz4p36+N+ODTF5ZqThnI1gidXd
	Qw7Uz5LbSpFm+IUmMVHj5RMOeYuPdeu3cXcFsYb4pFy7Saa09YTzmSJ42bDi7tlTGNUtvPu5WAM
	6brRNS408NdRHd3tE4HJ4xBHkbSSMwUr3o02F533fNmJmk828pDHjETcuf3jUMqjthXDl1qYGpY
	RYxus2J0aO/wCIra0sY4vz8vwZhj62Whj18GUC7Dew7VUAFc9C335HS5TwlwhvOKM/IJrVvrZaK
	dpZpGZA2/WgQLjU+w6i4yp9nkWJXM3/yFZtgeEaPiYpWwPWp0yXDbEoOH/dkDVSLw25ZG0KHT4c
	L1HwIK0dg4wU0cRLbEgZ7LFJv4RQEgArbEn79RoKUdyxLFap4FnwwMnEXqCJmTZxqIA3AnFQ=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25646083a91.17.1788170747890;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25645956a91.17.1788170747310;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
Received: from [10.133.33.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm16294336a91.9.2026.08.31.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:05:46 -0700 (PDT)
Message-ID: <89805886-ba34-47d7-845f-904db15c7b17@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:05:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qnCyliGJVhmcTiZPEGTUjVBD_GraByXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX5QuEk4iGRUmt
 LJLXS49Rof+YaYJcghneITG8oQDLFw8K/B9V4lSVrO7Z/Ga7zIRYo4FTAGq51jbvWGR4nmx8RQ7
 j7cGvGz7BYbxymydlb+lToh9ssd5vk0WaIwazE57Z5Mq1gHN4d0NWWZ9Ksr1JgtaAirQrM3UYsd
 Gqz3/ucZjgL5zKCj6zRM1GkCsK4Uq4dFkgrw+c0nCY99Ag45IpbDFCuX/VAKiUUM5pvavv7l1Kc
 gJwXTFxhxW3S6vp6ODas5uSdMt6wZWvZbpIM128ywe70GFsgOtMnqhHHdIGJw99py0SRjFxtCnL
 R0ies6mlTvxLJ8XqAjHn1LZ1hN/EFImXxqZdT+IbEL9M6iflQE1++IkigPuymtOwk60rOMkLfsK
 Qd5tVpmaII7Y4YlFuvgA8t6Tsm8bC3s2bHhd2SL+bv4rHC+83qRlV9jHyGCmnEEYNwwFDtJ0qWH
 8HSZiC0QAtO7DS0l8tA==
X-Proofpoint-GUID: qnCyliGJVhmcTiZPEGTUjVBD_GraByXB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXxRc0StIGGGgI
 7r0kLgSHRf7VdlSVI1wVyF/AnSRsnhB0FKjrn0SbQvFYV9xTSgltWgXIFI61jqNkFLmBdvN8BWC
 c8+NFitCoopzyA6EAs2SEZ7ttO7un8E=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a9551fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6mMdS-TofruHI7CEqrkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086



On 8/31/2026 2:25 PM, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
> architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
> Changes in V2:
> - Rebases to the latest code.
> - PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
>    change is already merged, so dropping change
> V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
> ---
> 
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

This patch did not show the falling back relationship between Maili
and Hawi, please check and update.

Thanks,
Jingyi

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -23,6 +23,8 @@ properties:
>         - qcom,hawi-qmp-gen3x2-pcie-phy
>         - qcom,hawi-qmp-gen4x1-pcie-phy
>         - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen4x1-pcie-phy
>         - qcom,qcs615-qmp-gen3x1-pcie-phy
>         - qcom,qcs8300-qmp-gen4x2-pcie-phy
>         - qcom,sa8775p-qmp-gen4x2-pcie-phy
> @@ -202,6 +204,8 @@ allOf:
>                 - qcom,glymur-qmp-gen5x4-pcie-phy
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,qcs8300-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x4-pcie-phy
> @@ -232,6 +236,8 @@ allOf:
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
>                 - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,sm8550-qmp-gen4x2-pcie-phy
>                 - qcom,sm8650-qmp-gen4x2-pcie-phy
>                 - qcom,x1e80100-qmp-gen3x2-pcie-phy
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4
> 
> Best regards,

