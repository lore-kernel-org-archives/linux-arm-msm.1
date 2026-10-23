Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742792;
	b=35QXFKBvjfZZabFOa6ofA5jK4SPHbMtpTGvKMFZ7KTH+kVhwT0X0Y7UTxe+lluC1bkv6
	 +kis58t1Mp7oGSQ6EPxj1QfWtRjObQCHoYTB0sDXgJa2uHoiG/ZS0xA0iQU7ZoPPAXgb8
	 H2+u7MTgdW7bN5USHuVJNBUrDl6NPcM+gxdkr+sQjrucprW0+SOCEADe/k3IiVHJA075o
	 jzz5893LKc4Lbd5+21oOWWh/WQXJm2hd/HryXqyXKqQQSZUp+my6ovsGPsCxXSn9nifQg
	 6yb8ImVLhNjvpLbtKk3omRhrsb2Hr8vNTKqlgUr/Zm2BfZlIUJApNSKwMwZ+jKpKPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
	b=GeY3MnIY3pN1K0j1c8Eufj6P1gttHGleYwMTVaUGN5aafZun1uunsLKub7G7Q8jywPUM
	 2Tl1sKX1pO+rNHZ5uPOySmK+hlrM32kcacRwgNS713eMG/4EwVYIOO+Fhxgz1s9mpwYFu
	 Wf/dLr05P1IEHGtckWnPlmqEugG/mNaHn25R2tVSNEau6Awsk+pcrt92dh/B8295cLWIU
	 M6MeYvEYaDu1b0d28mUNimhqC7eBW6XJMdKNqfXDWx0eZr1mvx0cd6pIuV6ggG/7/Z8JG
	 H1w5JrsuRiOiUBoFlO/MY0hkUddnusP2C9G/sEDmdryGmPjVJK/TzeWze79tBMhBF7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb9VPXJo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7590606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7590606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb9VPXJo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F79F3153984
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=; b=U4UQBO7OvfeVT+v0
	++oqPsbyXmrsA7tzlP+uwizroGuKX8cWnNIN1LH0ZJpnDSJ8y88P9EfEQH0Fzxpm
	feBGBzmS4CiQBc1uQCcypry671AEWQ1hKDf+72l3GmdvwMcUC3+CrUV20tfRjkUh
	gWd8QlybeNXQWyHBckO1C7+0hLRQ1djNec1SosahkPj1T4zG0hIlMXvOa3ZEgIGH
	nxlFr8Z0mf/WMpYgyVjRNygIpgBioctlRvXTnY7FpkpnLtV1PcbEkDpfKriXj/N+
	SWa9xsmn9H7fxFsEt0vawjeSWyj7W4D5jbCaCbukP5ddVBOx4rBx4ki7LSBdZFx9
	Pm2hWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmramdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so10629585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742790; x=1793347590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=Cb9VPXJoR31KKoz+ntceC1BsiYy3E5LiCwBI6e0rfCnv9+W4gGC23KmA9yQP60ppRa
         Ndpx/pmt6nBtQnRm998zRCVKefhGdmhaRYZkyiwgczESy0iCOvAp2IXnU2QfEgcIOSZW
         63Q14saZ4/cqrkfok4k7k3QAzMGylTqCTfVa8OrGrShPBLkuX7DXGQYSi5demWGnIoGR
         7HwPZ0bjHodP4iCrWyU1XPgB93feTk9WEsHOKRx1X5hvtWersuP4n5xw0jCARI/2TpeW
         Fcsp6Q3hlRQAy6jbj8KiIuOkFh2d8sllqJvHC8w6IOg9ptFID0kt7arCofee3FCT9aTm
         GAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742790; x=1793347590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=ps7YOBa6Y7sFrKvcfSrQKCDGZ1XB5Q/GUxOkWrOtvjU4uvDfbDA0jeo8UlRg48wsZO
         1SIpIhQpSLhAZj8xAZYYd5wTeD2AulkEba9tJiJ00uDhfdNo8g+H5GGZMVvhsB91MBSm
         XrrEb2tT49cruGNPTbD8ZJfufOu0Tm1G6+xbTVGSlHdAXBNmw9/yimP8KbKqG/tv7Zsk
         yKQXLczbrR20hWBBACsiDb1Diyl8GZQPNLt3Zu9ai9tO2fsAO0sjxzEO5uZcXE9MQaXJ
         Rg3fQsztf07fzLrUxfCi/vuaUb9dBxMH/kx+Q/k6LpbYRd7TKKtGS37dcmfhyes9f6Sb
         S2Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzyyMEyTjwlnnPY6ddSxegSGSfNx/6HQ8RE2opWwbb7IIany+OD2K4chYUjcHvhKegb2+2ATeAgDKQzv7VT@vger.kernel.org
X-Gm-Message-State: AFq9FYKd5sNZkq5VejGNn+Uo0D2H7Yq6r1NSIeENebLnpLGvN0achRNW
	9DPZuJruyGosQ9BnJ0K+tLROIVLvXqo+CsQ2/R56QweycPz6n9GHnlnPtS+d0XSJLr/6/MH5a/5
	DD86i8P9ObbrQ1dEthq72ZcX2Rx+FsX3JXmmrYqeXDWsH/l3lajdFppk1YEwflkhbAWYe
X-Gm-Gg: AYBFou2cYyrI3VyB3kzjuQOtvR+tFJpmm6s0CDaacP7IkXcH4sqvzgTOHqIl/j8EQ0Z
	8rsNGULXSs45mUI2s1yUMtGkDjoYlj6lZNUl06oTqB2cuarbsSDOoUWFP+UUl2avz+AnjInOMSt
	1aji7/du5prGBUWeNvjrzcbfsBY8M6JwtM46mLPTEZmm2KSV7Xsy2D+EwN1qj177cnUw48Styqz
	k2+m878u8c6Tfc3KhwHMrWHwlxTDG22iyxchJYqdn7/QLlGOPYkpXPAIAI4WCpXlNZRsAC+tOFP
	quLl0Sl1U6ZWRusGgEnfICnJqiWzhwLDVc/ZaH/2X5G8b9BqWyUOHhCo3er8qv3MnAY3sOhqKA+
	cBJ0o5ujrhi8H1Egse/QP0Q==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296823485a.2.1792742789562;
        Fri, 23 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296819785a.2.1792742788961;
        Fri, 23 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d54dsm73770766b.24.2026.10.23.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:06:27 -0700 (PDT)
Message-ID: <f3c13144-660d-49f6-9933-9d9cead006ee@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:06:25 +0200
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
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU
 SMMU
To: patches@brar.si, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
 <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UkQUq8rqK3Apxh7lAA1bBt9yQLiw0pKF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX0M/U+kvIOB7J
 jaCeNFSHqDbOZPf7h3Mo4uzSHMeh4xRDTn2FCjPX1nk1mJWdpekqVC+55//zFECsUHDI6/4IaVb
 bXkiDg9iEZbnkhy939vtHh8y5KBVeOw=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb1586 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=U7Z_fe4AFx8LFHQn5dUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX2KzJOfFEbzlm
 m49SVIlmU4e0FWdr1BH74AS0WbPsemqlxTFQX7vSc/y1ESUyZ+Zm7NzTNblnJ/dhwYjo2lJsbDz
 BHFyQOLgTiZj8w6FMIJjESCHOU/SD27n4lcQrVkjZ4uf0FB4rI7dBo2qUMfCr7ZNThIbuSBUS79
 hu2KrO2odDHytIC/QZxW9evxwpe4E03HHnz5BNqhtWPBAbkCUmVN+Qa+7KUTUzSc5W1yrWjEQph
 JN5KhP66EYbVUWRirB6lp8MuopVIKpt41XzaFgbsGyT0pJIFkCjqVP+v04wkgWcuARgLsceFA1J
 j/TNLYf5xuu9L4AJ5HZQ6DD8CnnwUNmyGLwVGvQ4IbUXUUYtz6HnyCypAiWqvf2FX9L5RX4fUQX
 qskWiW1zPtolIaCsklBbhzSKzYJ6qyW16IOLvnXeGyKn5p9MLK180kuMiz0nnkvo2bMoVpze1pB
 CFbsNOgwhoCxukk6uTw==
X-Proofpoint-ORIG-GUID: UkQUq8rqK3Apxh7lAA1bBt9yQLiw0pKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/23/26 9:54 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> As on SM8250, the firmware on SM7250 resets the device when the Adreno
> SMMU PRR registers are written. This happened as soon as the first
> per-process GPU pagetable was created. Do not install the PRR
> callbacks for the SM7250 GPU SMMU either.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
