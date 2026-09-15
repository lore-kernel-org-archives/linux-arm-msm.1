Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A61332EC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455714; cv=none; b=dz1pewEstz9Snu4732e+LP4M9d2MpNS/o+tXduG+0RaIKJ+hYrHNOWRKEclvsz2MndWTqiEngm93GRo2LJ76elPYAZ7zWALoAF7cQ0BaOI8du5w716AoCM+C02wnqqYHU9KC+54SWOiatCvRzwTj3v7y9Nq3ltzn7q0K+me31YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455714; c=relaxed/simple;
	bh=+zP74EUwfqLJku+R/YHT+I6lTJ6QtgwPF9wTSQuz75A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTkhNAQIHAva1trgODQcaDpgmsIU5oC/OqF73LNiyu+1dMqRc58lIIXJD965XYBJP09OOkvXbKC2ISXctXAglcpeXSV0yns/Hiap3LyHT9snKb/NVHrTihK73jHWFDiss82wfMBqNCDkq3y/LjIHXXl/oRobic/k0Q1V6UsNGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3cWBCtC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9NDdF2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3cWBCtC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9NDdF2v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZdpC1661659
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 07:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=; b=N3cWBCtCVkWqodZR
	rsCgybNW4+yWos31oK9qxEbVIFXtlL+gnvxLsRXf7fPrqdb++MzlMSfsLM7Tz/0q
	hRaWpQ5phZke5bkYqMw8haXK+zFpBT/WDbiFfuD6xzWpQxkebIbNaff8cKn6l16a
	+9yaExM/b6/FQCUoBBFrP3V16HXhO3DzcWimRbd0L8aDBuSbqI+TpmASGOeI96u8
	JQYXgDT+X48ntIrEIlA1k4/ly3M4kSKwRUjUsqSDqk+J74+Lk0PO5ncre8RW8Oy9
	noX+H8Q0bYG95ILorEJVnXT1tqcUEHMihY5MTZha9ghS5QsffVIKuZT8WP8rs2qv
	59hG/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcdyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 07:01:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5345488a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 00:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455711; x=1790060511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=;
        b=H9NDdF2vqa8ZKJijykye/GEPrroiXzrl6iyo2GMS7CA2EPMCrc4HBDfBXDrMDDGUld
         LKOmBAY0W00z0BxvS59jLRY9YqCUI1gKsNXXaZJEKbUsB01PxO8qMAmDDVlQNo3bA/9P
         9yRxky0WE2uJSBsz+B+1LuCX+esAgTnPFhDMShnyQekFxG0/m/KA8EbfQ6sL6hW/dJCS
         mRAA7yvyXN3JmtUwvV0nidXpGUTT3XNsmBkQq9T40kfIGmX0m1+/+c1ra54/byXmUoBC
         OAozCPIJyXa/6Uw4Ef4rnpXDHiEEJRY86EwZcn9yLR9iOlhw9EA2BQIWBqvJ4ttA+B/5
         GoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455711; x=1790060511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMy2sOColB1dOhl4bj0aoB99cEXORXzDdawD2f/eQUY=;
        b=tV1Y4UI7aYRtZ3Avigw9EB4lUMLQ4U9IiqJ+wPjcANsqyWyivarzP/idzt2PCZU0m3
         K0cZM9l+UEAzVD7LIWybUI6au9rNcMdCUl28+8ayskspq8ryquGI3eG3RyBb3GOmjZZ3
         yFtU33nnrSFsvX8N9Mj8FNmg64Pw8C2cLe5gHSxX8tVqlo4oigDdCNfv5omVn2KccdiB
         0NjiAWsqLZkDLkDnqoBbT23sR4VzcYuilANpNVPe3B+p/U2CeW8CdxGgS3L/U7Ni2FBX
         Y25dSZ6QkyEqZmvBLhIH/zqY38jTaNhLlU2P7KZmQjLyXo25qeUeUJtQOlewzxzu4tTM
         p79Q==
X-Gm-Message-State: AFuF++nGHafowOUka4dPuPlMH21DK4B3FOOeklkqOD62fE+Wmh2XtV/V
	5l1klg9BRf+Kriqsv7+LM6R+JPJJmriibCKBtZIH4zDisuvq8xq43MyJ2zoTZqFqHwJXlV89mln
	WENIquRUNKM3VMh7BNgIgBdznLSHNZps3AA5kVwaJ6o3s1xdWYWwmz5jf0Hgw4iufjjZ7
X-Gm-Gg: AYBFou2hM9DDhy0tE+cKxUjiXCo5vpFoFGJx6JQ+XH0qC8nwIrFBoB84eG18H0O4ggH
	oAPB5kOdgL0xA0ao2Nxzfj+05vZJWiqN2ucvQKTaW0SfNQJmyK7uXVJkM/qk+FqKH/fKLOXgmsD
	d1stMgIdc7aFa69rq2OQvVcp5IrU8XjZnmPbJBMgWlGYBPHaden/IQVyEt20rlODJgapTf37Ohx
	TYJoxAYRgiaGjpykxsZ6jjNHm7Vzcmp8jLy16kmGfvotpBp2o5gJWVPITA3+NtFb1IEC2CFba2c
	XLyk34Fmsf36Y9U6IwkQ5U7eD2GWR2g2IHaRcxq1l+tlAON4Y6uSQNxApazgakzFEtV6BEmXQPP
	kV9LnHXLKrywLoW/shhx5kkB2liTMS00=
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr8133967a91.8.1789455696068;
        Tue, 15 Sep 2026 00:01:36 -0700 (PDT)
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr8133194a91.8.1789455676013;
        Tue, 15 Sep 2026 00:01:16 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdb3045bsm3754708a91.17.2026.09.15.00.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 00:01:15 -0700 (PDT)
Message-ID: <62cd0c26-23e5-4662-810b-c9f940b79a36@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:31:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8ed60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sNGwWByCUGpZoCTVRkwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CEsEnOyNzykKctsXa03y8XnQexBFI0ka
X-Proofpoint-ORIG-GUID: CEsEnOyNzykKctsXa03y8XnQexBFI0ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5OSBTYWx0ZWRfX1l2C+bl8xRTX
 mZgiPDUEy+CxIM/L8FvxFNRrjGKY1z6vyNrfIaq8jV5FX6f7U8rZRWpmW9DULusbFwnWRlrtJ2o
 cKBO71DvNwFmu39+Y+esA+XM1HpIDiqKi8UerwsYns8pFKJ5H8NNXBz1k/QIjtdweeFUULZzKbG
 zBtbnAfFIIgnjwODGMPDrK0helBS3Dq9xvYYSBRdcSBtWQQ7s246STfQWYwnaDyL+28e01SgUPw
 ZVoXXHGDvwhYCfpacDNjx1K7OnjVRJUO23a+ylBifNWJh92PoLMjPb4ICJDgVX0kaUOBVulOe+y
 J6w2jGxoRJMm7TT8Tl3bbsFu1edZ7GH5DvYgSCOzAXCGuVMmOFByl6Zth6U0JtuUIRrSWQCJ2Nm
 VdEemAL8EqA+dbXbp0xxrerW5cBHqUa4UBIK+ZrjvQjuXne7CFi8Da9SRv2C4DRaGY5CNYaCoY1
 jLoh6eldZ2ld1Egx0TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5OSBTYWx0ZWRfX+sX1zkgPfWfU
 I/qdEhsIn10+tblnbXTmwZmPgtln6YxTaMU/jGF7za7mItM027UJldfL64/J1ILW7cmLjxzoQxj
 nd1f1P2r45OAM0+VzWG58RRf1ddnmDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150099



On 9/1/2026 1:10 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-gpi-dma
>                 - qcom,hawi-gpi-dma
>                 - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                 - qcom,milos-gpi-dma
>                 - qcom,qcm2290-gpi-dma
>                 - qcom,qcs8300-gpi-dma
> 
> ---
> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
> change-id: 20260901-maili_gpi_binding-37b12bf9e5c4
> 
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Hi Vinod, Frank Li,

Gentle ping on this patch. Could you please let me know if there are any 
concerns with the proposed GPI DMA binding change or if any additional 
updates are required from my side?


Regards,
JyothiKumar

