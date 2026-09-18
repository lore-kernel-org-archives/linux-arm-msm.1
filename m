Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2B4C10C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725885; cv=none; b=ZE/Uy+1f11RltKMqfxSuylARmc4t47tIHxF7LBLRLYGyv5Bi/M1zGuSri2OoT6m7B+DkMQzvYAkShp3ft1uaHqM1LLwSXQU/J+woow++gGOv4YOHM1xCqCprw/H6/NSiouZ4n38X27HSkOtfl+BSahNg3rLDHs2uhN6GLcwpwv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725885; c=relaxed/simple;
	bh=yU0XvgwFhmxEqdBCP5BExwMxGrmilL6xdhhks9FDJ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2OZ93whsWUpeyuwFYsCan6rPEikMc+mRAYHet80Dfjv5KK0s3upABWYydC24E75CXsEh95D9edUIRF7vXMbsuw/zJ1M+UKe7UUkO1HQHOyksRg6QpbaRleCfHlniP5m5u+hy9u4N68eY+JKsQHjA6KLRsZopuvUWB8sZIJCTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5FHRnfz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+Rk7xDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5FHRnfz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+Rk7xDx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dd0t3801897
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=; b=A5FHRnfzpsm4MLFi
	/12A3razuwm4VtxAUQFMwCxuGY8vYaK+iv/ZHUu5ICCRMMX8J2Ribl7A1rE64of+
	T8AxG01PWTLlzjsrLbg9n+PrHtaHMYxWqEOn5nsU24qtpYHMt2aSinVNorN1LPHy
	C2rmUel/vNBSJhn/dJxMzA4jz6hiYc0vVUGVSJ4PVVUvBsnZ4F959K8fkfR4dhDR
	3qKv4EG/e4ONVlusjzOtCO8VdEKvL0mWukgddcPuQepLel6fhCF9bbzVHm6HVjpT
	SRoXN8+AlsG6VbV8De2uGGn4PrRATGLGpAwkzOBBb+YXDvcjaQgd5f5ZJLs6eqNg
	ZYPIdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku0jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:04:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so14749185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725881; x=1790330681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=;
        b=C+Rk7xDxIoiAMZF4gwmtsW7pYLTE409yAyBRSJYzqy93zF03s3OQA2kwkiLASaObS8
         duL4hx+xjPm8Y/vNKfUdhbzdmmfICRbhv1f9OGyIw69b11os+lfJFFOODCtXe2kU9VBi
         RXLPWvk/hH0WpwgwDqJ1Lu+lO4r0TFLuf4XIXjn9FdCRvcFr9RhKbx+XWIDamaumDiBe
         qJUqOSoMj2ND8p5CRNXuKxILRgxykVqcueIUxGoIDPmZ2HbBoqCTLCXocpRm+7qxdATx
         jFDMaYy2vmHZA4FszwiFSIaOPHG5gvGEEm1KyR3J7RwrycV1db/zCTn+WaqhG5m6pOzs
         gV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725881; x=1790330681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=;
        b=xZjtiZfxuZ3ZDvCutv1ocRsnOS6GB2rVA2sCkM/GnuAxomUUMvaWv2Q98luarg0Wzk
         k1qxgmc4vAOll+RYewinMCUm++QDeNLpvljTQH7SRCgR3XF2FLGk27xoyjFAhMXbeNxN
         L/9WT1oV7x2ln2aB3XAjrzPGoZQKW8Ed/9Es6U1WWoT3RmBA0sW7lrTehYT9RVPn+SbM
         VEkVrZv4fU/zFzr4KvxUXCIjcfARX4atEJX9iiCUd2L+ahv23LAs17617FWsY0Q+SlDF
         aTtWqgpbyNTj6d6YC7/6IcIqNUD9/voy8s6+LIzI5NjvOsnt+MFskUsp9xaqEWlUy+fH
         +kVA==
X-Gm-Message-State: AFuF++mbrxGAvV8mqrRyglWwnXRYDDcNdS8aMT6TCyIFJiZwTZxPEUTU
	qDYygS/BrTPZ3g2jP9Xmxmugbm+26vovf2r1DZTxBbRUoDicAGq4PdFihD0UvGZRC5OJCI0MnrK
	rgEmJI9/n9XHi39nKyCj37TGRw5DznE+VDXdyDNdkbmZtNeWFEGK6yfm3h6X8V6HAsagS
X-Gm-Gg: AYBFou30ASEcZbh0v02iOMEyamgUo4ND+M8ppFgi62O+fwMrqc/fbS5Tt/zchayKkHl
	+ehgaggC085p+e4e88NMr2jQJ/kiPIvNZ05s+JQFWdiaB6IVmjw/x26kVrnOHIiugQvEHxOrk7C
	7n5n/QTREfTs9fX81o/DYe9AK2nEmmOOm/0q/vvVM955KZVOfmKyuoYg377Rz0onwKWK8iskYeL
	IjXJFUXCkXXA3864edZ4JdU9UynSmdXmCAqcLgfd77B4OElPZfYNYGFI75jCCgR1rxXG24MsEeP
	zJOTl8lU4cnCBLiRicEfLZQIKgAydUGyv9u21TYc51lACji+9RLRtfHnXKghFrmIeBBdiTFRNij
	l76kCAE0eRKhvD7Od5MFiLQ==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr184228085a.3.1789725880399;
        Fri, 18 Sep 2026 03:04:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr184221985a.3.1789725879785;
        Fri, 18 Sep 2026 03:04:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a241bsm40094766b.6.2026.09.18.03.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:04:39 -0700 (PDT)
Message-ID: <c0095a4c-0f53-48f1-a81a-b411b8756ae7@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:04:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX8i3B23em+ThZ
 d2m7ywrWvDVOB7r9gjeCvRIOA68tRNXlzME0KmsbHhjvfQ7H6xWLOrL5AyLnzDatepes2P4IK4m
 ScuU5nkOVT6ohPJAeR+3iI3I9YqqX+9hXg06JgIIC1oBsRhl/3+VrvHb83olwvGg1oj4DL4ForP
 QaQcjT/QxdhEuNMR2YdQRDqbjwbdziETk4PIe9PnhfZYeWkgoSwRYcrXcRuAbfN0cm56+WXJQFA
 lPg5uG7JMBa+tm6TodB/ItvRMsey9Xdr8tSNTfMQScvwPRy9un0RwHoOalujBtnvvlHB10+W5n/
 49kZP8HDA6ZlyFSFJggNbX1ZOjh/LsU2OYdAHkBl4CHs28TM9tBASqyXmGba2Impeu+sTpSwGTc
 ndeDdVQ8n7Wzj+5DXAUe1Rfzap4xRUvugL9BIC9VytppwWMKnXDEkyrVEw6A4ffnsdQzzYvLw3B
 sCsCdvb6cPlyhHNqEfw==
X-Proofpoint-GUID: ZBhtf7RjbLs-oBSAda219rOsVK4wEP7Z
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad0cb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX3VBl9fTlFDTR
 6ieWJ2c0C7z9QPdmjDIctpgsZxLHCCWPeVnSexZeFonuVO9Z7WBwT5Blp0D1hthjxIPkjhUcmxj
 Kav763WKIDHxWzev6BqITmx6XBIgdXc=
X-Proofpoint-ORIG-GUID: ZBhtf7RjbLs-oBSAda219rOsVK4wEP7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
