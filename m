Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A56551987
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092183; cv=none; b=Hsu8Q7O+o/yKmhs92O6KbiWCnKfVnyjDfq0z8qPXdSL//ynHwvx9MdI91ssBcplXwzaYjSFM6/IMWPyNYe+IjYd9KAhEaVQ9IEkVgtY4NJWKg6qBcVEUS0Ix5LVINPIwbct4J4kQ2mi2WyvR5eVZ+uCGebhV4VgBnFypTYBYPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092183; c=relaxed/simple;
	bh=SvfJgaoLSpCmakbUe17qoz+lxdUj97alkD3V40jAKqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5iCi3KxbtIePp+RjMYgbfzYrv4yCPBCuY6E5J1BpiJFEojErTyHq9/N/JAEZpVMIeVXtgS2qewhaA5BpX3xZ1lLazRtwU4QU5ACdqlQd797Rti32ZxsvBO5kIygxJiSwquPkdVQ0buhCo2pcqU2cNp5neN9n8AsoCVyQ32PZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ia1DSXs7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2nWCK7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ia1DSXs7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2nWCK7l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjIDF573106
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bINesjw+nAVl4oJ14NuJtA23tyojJN6lpK0CHXUwD/0=; b=ia1DSXs7SuLgl3iz
	aFM3jlAqgIzLhsqxnRssr4wEBfyHomawCXUkGtEk6YhSCHiM7aQ6nlbEsdFloLUp
	YYisXKM7KVMg1zuwf2gR7ijqebWtAiwB0OHCB9qE72Si6Vne6z0xobqBtWY8jRsQ
	9dh+vU+yCGEiIVKCng2S68X2F2S0Urv6tZ+NT8BaAYDNX//XUZhGTFeFwFP+K27Q
	bgJV80ywBrHQe3nJ2Og47w/EVLP3hEpRQCabh9czE5IRTErc68ZeEf4ocF07/Swd
	15XsHO65VNZ/raUXw89K8xoM53nPsG+xY+cKLWvzhnP+zYTbgrkSHT0bR4KgZZ4B
	yCpEjg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjavw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:49:40 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9ea608ed0so68936e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092180; x=1790696980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bINesjw+nAVl4oJ14NuJtA23tyojJN6lpK0CHXUwD/0=;
        b=E2nWCK7lAaFdtpAdK1PaJkyX+yDchZB6fMkLQZ5c0R4rNKQr/pTK9jPHXUYc7Tx/jb
         kHNGuNKYG3okoGR9ch5G8Y3o7VRwlruwlts7ExrVfXnvmIMxiar1O+wLlTuS2fnWeuOd
         0buVrXNE7b4UCjJGAvVUrkJ9qsvPLXunP8S4j65xq28/0fNFXJf8Z35E7oEKxlQQIkTC
         VBHEaYprnv8hEs6pnw+S+TAqsyE1arwtUbzARhWt6h6Ek5vae5htDDJQTg3kXrjLXWJR
         CLNn/VxH0ZxvGSjOVZ+PsF3PaHv+cXTVWaqfAx6+iUf+6wvX5iOgkqlMR8V914TvMKWx
         qvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092180; x=1790696980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bINesjw+nAVl4oJ14NuJtA23tyojJN6lpK0CHXUwD/0=;
        b=ioKCqRUWOn6fP/tAjIOkCML9ivu+l/Z3NUzxeCXY4W5yierl2zlnVJXtqRLAshfBZk
         e86SgFE37kWHRNMNblc/JbBZ/iivsAjXKBooftLdq4v+BK51ycEZOm/cDWR6tz8OHeF9
         nSmsF8DpXLbdbARNQ2nz1aqFJ23Slr+39rHMl5z/3lqGkHDt9fw4dvQeG4GZD9HHz8Rr
         QmgHDvJqIploy2tP+JZ1SXTToqHm7Lxibnt9zgv95A/Bqa2QrG7gydcRLJkSNLmUIYKf
         mkw0hgRQd46ghkLFMtEoAhuIdA3Ot7BR333DHcKeFEMCX7afB6Fgn7BZo6ZDyIQA/qFD
         v7pQ==
X-Gm-Message-State: AFuF++mBzsRmhnnbQjrS2R58Yo8K5f+kGEIXumwsc/Z34MwSjbEhSSZX
	837XcP6TNBwnXkxITce325J2NrnNnwNd0XhqiobCjh/TADWXbh+lC1K7wqIBxfvFj3tpM+PYjFL
	efG+JjUcnQYVHAbj6MA6BefcC27sS/jW7Q5R6N8iwXiyZvPm2Tkbskrnps6FhAahzjGPd
X-Gm-Gg: AYBFou08uAQeveGEq6vP5TvJt7w8Nipafyj3x1CVPMsV+v9Ww9KGCoBSO6i7vvBNSk8
	UvjcG8nf2nlMmY7bso0gRo+Lln/YUHM61PYNQmYfpNfeR+m2UJtitpLCzMJp/0z8qsEZfXbepcw
	fRnRgGIpGbYJDwcyClDJHZbcWZCRXlHNibX7EIBzyLXUMwbfuz1JjQ6n4ZSja7B/12QaMYX4BJG
	sPZQ9w3gFDHtcY/7uoxTUdumxJ0cbyHjEyUnmupY4oyhAHibvHWsAejXEtoOWc4A0zTqMWWYn5e
	nnMUWkhIfHwavh26/QdxwoJK2DpI0YcMPvM4MD67iCaLy1DaqgdDFNJGv3WGtHG+V/ptW0SfL0t
	JLKWJ8lXiSsCJgZoAFfMahw==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr7262412e0c.3.1790092180000;
        Tue, 22 Sep 2026 08:49:40 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr7262363e0c.3.1790092179542;
        Tue, 22 Sep 2026 08:49:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa431935csm1361594a12.0.2026.09.22.08.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:49:38 -0700 (PDT)
Message-ID: <31b773cf-a2df-4ee7-a5fd-4cd77f336551@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rMy6EpiXSLgtCePu88blvIF3rqRbhzm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXyqjmMqum70kW
 ithHrpaNLest3Ja5qMuAnuHpjdmTkEYfLeh9+OO0CRPHa0F6Hf2rp2p59UymWz2X1B0F4C8Oo9k
 Y9HHkYNSOgVJTuQSl/zbLCBGuAAS6kRKBrEb6CiiL15onFjQCy3V49GlpBCSy2mOuCRyZUw3EMv
 2F6QH8hcEjUxyAeN5jm8PfljgUlu5hM3jdo98/9lhtAZlFl/CcH445vLV/+OWjF/sl85l6dxo1s
 iCz6/I05xNPa4zEddkpH+mjoc2HtCBgpQJL3Q7qoFkOhi7i/EfOe4YBUDpXO37KhF+Ao2pJDsDg
 EpD+h+QNLXwghtQoQnjZPGGgwGyt6YOv6rKi8rYAVIkP0oKWeEzKMoTXvK8XdUVYLbMHUQh7HyF
 NxaNz8TkOOGle8ncRTAA5YxY/CBfztyukHp4vx9inb4NNodL1FhAY9buzEb4M05ILeWPjKJSAfR
 3ZOaI6f7qT7eapNF5Kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXzaK+u9KI2GK8
 8YKM0vvy7IA8HWQ5vLwVG28sqvBudk5EUmMMdHQxGsPY/GGrA001XNU9z92BUwvCV+j7ZN5Di9n
 E/IjWYIaxLJEM8J7nQ0GRujEMw7VzEY=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2a394 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: rMy6EpiXSLgtCePu88blvIF3rqRbhzm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/22/26 5:01 PM, Bartosz Golaszewski wrote:
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.
> 
> Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
> PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
> into negcc, which so far carried placeholder zeros in their place.
> 
> The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
> QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
> out of reset with the rest of the USB20 tile, driven by the controller.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
