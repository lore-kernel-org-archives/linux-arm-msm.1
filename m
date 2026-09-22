Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325E4A2A40
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104605; cv=none; b=UY1Mktq93KL1GFmiYK0wgtPUZYWWD4yf9qpJWtBq1sIGLcu87/khLXFEO9quA4QT5px8d/6CBXIjZ8GjprGdxBuQ90Uyj0mF1RYhzErPIFMUySlRggKTLB9N1Y6m4QyxupVxIEPrgliBZGFWcQ+QVNLsoYUV4jCKLc+ngSvAMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104605; c=relaxed/simple;
	bh=J/1lIjFGeiNqfLjljJDLTbZDhxthd7iJm+KP8BBIn10=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uYfD++s+HqZjXYXv3bWFqEhY1CUjN3TQl8Ab6Xe3+Mlu+sqk+51ucTV8Qw3ld7tsJ18vM9XqrOuZXhJV4GwTIJoiTvN/cVf8SnYtcNxpjySmTrpeJ/LygUwEPQunhxxYL4G2pInD46H1dzsdMN20YXSENINAXYfst9FYX8rF7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1ADCi8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+D/fczp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1ADCi8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+D/fczp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBmAO3897644
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=; b=G1ADCi8kpSlVZNY/
	wy4USVl13QGfszXumugmn4e6Gr7BjqN8TZmtIYSK8IE7EuVVBV9A0Yv3rc40jtYS
	26xcDOhoXXf6ygzoy6/iNma0NlKVst7wSvXHgAjP/RLh4l7EZLKscHh6/o8pQrYU
	bUlYXtiH7C3H4nZGe6kJZ3WNtTyvi4Kwd7sz7MD2cD/ej8nBjr8cbPOqbZa5EBTo
	Haz7C3JHMUQkhkIiUBaYxHEueu3J8m4Mftqm0fHUek26gNBjkL2y6jhz7KTBQMlV
	wdX7bvcJthgfO9pXlh1/wJzdDR/OQ87+gLpEqZdOMtD7p/J60DFWIwVudAGFhr18
	RkwEbQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma00k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 19:16:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso187533c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790104602; x=1790709402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=W+D/fczpWgLG5ZyoS0+C2wQjM19KbDmTB8Y8MCGURKXjsoASRmqI79DDqpZcJi8pVR
         77x6/vOt5/46G402u23QlhZ4p68qabD4SikUcdISVuNrSjvd4jXFZzx3QClmg7yRGzj4
         eUxwEBBDOJuO2yvWU6ArbINaCJpG7ffnjr/KIYAYnYsrWFeo/xTa/ZE/AuATN/DKu2hr
         r9rFDxEGXtyt2voq/gWmDF99mB10E3F8aVn6vGQyvayRv5Lmu0Ft5rUkg12AMSNdOvuO
         /tIJIXESAj8Rh0w2/hJ/Z4wp/WeSwMeb+vlykgk8fw26eIbQt3AiBWnEwXT2iWeojuo4
         mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104602; x=1790709402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CLHSThQF4YpDbixBpn7NIlnhlNb47B/KiU7CmG8zbk=;
        b=fFK4qJxzLKVGXOBRVGWVTZ/QviT2B+UWq3dLnGjzPvOT32UZUJLaOEsergWh88u785
         NRNkqWFR10Ji2I684zCX55SvWY0VNcjvIXQEO/nVDnLUnIKkVGRI1jWrOuhWua+3ExNz
         3B16/NIyxPaSmvKiXQcWgLfTO8C/7USwT+JuIO0d0IhCLPgEY7s+FCiZ2+SPg6e/5RBe
         QDsZx7vnaI8+n7kWT2n3szUZahTJQQenA2LjuA51zfVzCZe6ZQeGEkLqeyckRzZASTfd
         EJ0+2tgy6fvZ+keZGtHnFUHkO72Kv4LYRxgs/HFHlF/IB930DTFocOZ97/AWwLNtR4Gy
         PzIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3LS9dZ+AZ1cOaSmfnCCOvtSMQoK09Hi5vAMOjqArR9EGVTTjp/LlI4ktdZt/4ScIUUdreiMDnQnGhou80@vger.kernel.org
X-Gm-Message-State: AFuF++l5chChzxL9y+WFUzTWVbfbGM/6g4UDoxlxi+thQvIyKOsAz4Ub
	jMI1MaEtc8fsnhYlErJrCeGcN+yLv9RWQQdg8gC3X16Hn5yljcn92yYXN4y1zRSVuYdkipDayke
	M/rqWH/HgYU7FyehSIf/17DsxEbqq8bCWqfOpFyR4PWC3CSDidRo+71E70R9+k57TwgFS
X-Gm-Gg: AYBFou1K5D/WfSVfmsdN2T8U/wVSGk6EW7z0b8uRrbbBrRALC+XW/YgVA/bNc2poe5A
	d+LHDvVgcWg/V5muH7Bk4k9y5aJyE1JCS+RjDIrVvXV+IBrND+T2xf1/bdsRr6JyiXPV6bIcU5r
	dNkzCEZ+d3n/Fj33kmy26zuKB9u2GRlB5BuRDNw48orwKcKjFy969jK36gH5xOOb38lDPVFUQRT
	YtQ1TPzdoVD4EuSuD0yueJuaS5+ObIC9ksn9eLmoA1Z7HlUaletaa3iBjAQuqgjXv7ly3MoOKya
	aWxVqU2dlkJWSPZJzXmhY+RYolhIvU+8RWPcXTW+JlK329FPyG0Ocq3wZg/jrcA58GLES82xgqq
	UNKtCNZawK1ajZcm1aXnKBmgNDD2f519B5Q==
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374888c88.9.1790104601535;
        Tue, 22 Sep 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a05:701b:428c:20b0:141:5281:8a41 with SMTP id a92af1059eb24-144f91377b3mr374847c88.9.1790104600692;
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm521798c88.13.2026.09.22.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 12:16:40 -0700 (PDT)
Message-ID: <318f7e47-8a23-4253-860c-0e9874864a13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:46:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Keke Li <keke.li@amlogic.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Sg8sjfvbXNAJvSQfCezTbiFBgEvryQ-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfX8C4EEwCsG2Cj
 TnnZ3BPG020DsvyuRToPtSIupFBtGt3jibISL5ghgxbS66TL6lhjv4I6m9zqgXRAs19xPCa0Ofx
 E2X3THSDSwLV/+irdG8oZAApzn606kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MSBTYWx0ZWRfX69rmS2ZJdN3E
 yhOwSDC56fNIti9ZMtHXACHaHqw6Efu8bEtPuK+69TlyA5JNvK5XbKcUYY+IZulRL8cSlykvbBW
 sLnK/TInnpQvvJQ7NIsST17gE4g6V+xdS62LFGNKqclwOaBdfQIVkmoerbkKMLusIIaWSfR8Ddz
 +tQ5dZeedQN2WwrEqrFjTN8EZK3fsZzv96pkNJL67JIKy+qpfmw1361VvgQKgE7Bc2W8Yjdtee/
 HraLny57vToeoGlSkVRpiC2ziS0wrwU6w+eIuayU3BU2KvsTpomrJbnAUcDVZZw7VgR6BmdHDGn
 vmEETtlJM0mDrWSz8DIiUo2GjNuHryZUUqGhkhyfDdGnoFU0tNa7BaAYxTV9+ASzap79VHMbQ9l
 Wrxh9CpdYaLtBzeF7pXbVlrZ7k2Xg0mI0VYeW0r8/F9LWWFpcV87dPeGLjcYSWbvyIPa5+Wrgv2
 18/rSYru21/84mDDH8w==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2d41a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WJcS3fml3CefRcin8NsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Sg8sjfvbXNAJvSQfCezTbiFBgEvryQ-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220281


On 8/2/2026 1:25 AM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>   .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>   .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>   .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>   .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>   7 files changed, 28 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

