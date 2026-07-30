Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2B62F25E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415607; cv=none; b=rD2vvmNiIDWFXYBYKOuqAXiRgoh1vqZcY3dqG0mEh5TZ2IAF2lfOq42lNS2vj6LZVzF4d90X2GwVSLLb28Bg559lVDEMBr5X9ofi7LdVDJx+UZoT80ARWKx2ZMfXbeLyGPAhRXGwtX5DwgUq5+YRrj3+J22iPUhHirS0YahxZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415607; c=relaxed/simple;
	bh=fsaNZDBLc6AlfJCqkT8rUEVyYHFMd/H4nSPD9TYnfho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4FdF6rXJH1nc/SaNjh2XODmGYo0IQWyf29HpGIZ36uj5YY71WL0FAkxz14TXTWvXSrkiRgGtt9QZqyp6sgl+CthSDm01yn/UVHh9NGs0ZdkS8G7ntgBMjhr6BSKhyFKPr51kcBgACHoUHk9iXsyJD2oXo9qqDDmGG6lBxbR+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZPB94rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F63FE4di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZPB94rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F63FE4di"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCfRXv643043
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=; b=bZPB94rtURe4HPM/
	zVW4N36L6X1Yd+Ntfn3ELGZMRWlB8d22Yz+LIR/qzj/bOhxxMiH/dBAcU7RTfgS/
	sURsFwx7RCAA4kfE2RsF/9PHkdvvvsjc31uUXPLqi7HgrKc3s4pCs3D0+9fdx7pH
	5LpmZRpNaTg0ROrg2UVhkSI0ZpTXqtyUMKdkzVMHJmGFFtHiln3kt71bsG2iKtNl
	10eNvmBneQMEOzAChpsScRC8XhDXMIpo+KwH5om+X2YP4vSqY3JNj6SgzTv2sEIT
	KxZrEVy37X+7Z6GJ8N8Go8xstdsI/pEdrPoWULz/Qio1U0Iayh6PPv944gFVY/2e
	KUMLUg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ucr0th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737c728b37fso38228137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785415604; x=1786020404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=;
        b=F63FE4difXf+pDsRM5694yQ9ltx90mpEJSBv0rXGlriGUFusq+M61B0xos0nNNrZH+
         lxIMTNhICUjXaaC+rVmoqRmau/pT0rZlskX5yAEMEY0eYSWEcMT/BayQMWnepXlPc/qP
         pzke7WV40Y+yjjvsMGWmtOrtePxoFMD+Ibs7F1hPhRW1FVT/pw9hqRQ/440ebCE3UCo3
         g7oPBtXy0EMk/brPSh/NyLfuFmQBP3a/4OWxiDTK2iU4LENSqa9kjyFMVjLtPV3LbBLY
         Z0TnqNeUq59c8GuV3K5NXZEgZI2rLF/WIdvJlOupNN205kh2ShRfvv4r3XGhFLtwnTr6
         H4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415604; x=1786020404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPOmeG0lsjl+u2O4/DJvK2x6tYkD42+Z8Bxea3wDYyI=;
        b=btTRLi3X9CUmAPAvwd1rejUjoaGLbhyie4OJ5IEZt25bSa4MUk2K+1KPEX7qefiaB6
         4UGQRsHfE2E0t/ASi2udwKozw10F6+F3+fspO4U1Oux/3Y+2xYphgUMd/z1JEaKuWg+c
         n5A11THSz5jLezLTc/DvGnKstPfY2J1sIMTYk9dzp647z6OuQvjYHHqD0dxQCVHO+lny
         rkdgDRcP2cJu5+CvwwjzY03Ow4lAY0iARx8kVMI6zY5hLjtsA7MxDJ6gCmJMnYCnn/S8
         uh4PYb2a7DsiaTNC0CBDbHkx2g81mjBdVbOGzQATBnRWz3dDf/mml9wt2KY6DMzfD4gb
         Oc1g==
X-Gm-Message-State: AOJu0YywEY13sVTkzLjJhZQMSoy/hPGBAWZJ4hhKmuWGUfeG95zEqy5P
	h67/ATmuZHHBx8tL9Vo0/gzcmfYMPp/LZ/GKG2aHwySD2f2jUzlYBGb4KVUEOb44FGgPqF8Fs1b
	7y4PTCqRo9D9FsHTaQYduioAJkyTgk1Sr0UM2U6Le/RY22SwpGHbV1oSSPuNqK2xdJ/hO9iGec0
	rY
X-Gm-Gg: AR+sD13MylLYYkWCdrOzwJtZPgqqnagC7ItrOGU+INDVUXlu0rMSzYRhLi3pxe1+cm6
	xQHZLY8IggM1W841jUssKJSewKm2Onv8IgU76C7gVHsxhDDLbVOPOCte6mLqYNs6ZCo72h1r+mV
	2Ba555/VmAOe+LZ7XkXalemnzVbF7W6Q6obXidKP+/NwN6/lcx61Mo6Tnb/tA5/+/gOv59xBYGR
	h6yzvZkIZ+TgC72Az+LoL72SQvoIjyslpy3B74gEDg0p9ETtcTW8R8rb/2WbpNcJtHhk4ucYMzN
	77lWahNSXNqCB+FqrRDtDW56H43V179do62VwnbAiLvcBcx3LJofKaDOG/Tm0IbCWufkZAFaXJ/
	e4Gy38h62hd6tbJk+KijJ8BgT
X-Received: by 2002:a05:6102:e0e:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7574af0542bmr616370137.0.1785415603878;
        Thu, 30 Jul 2026 05:46:43 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-7574af0542bmr616343137.0.1785415603302;
        Thu, 30 Jul 2026 05:46:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3937c9sm592673a12.20.2026.07.30.05.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:46:41 -0700 (PDT)
Message-ID: <343332d6-2a63-44fb-ad5e-1058444ec8ab@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] arm64: dts: qcom: Fix the PCIe iommu-map entries
To: manivannan.sadhasivam@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NSBTYWx0ZWRfX9k1QiqADyvI6
 IQxQQgY5APYEH5uXG0qVA+yfcHsWeoqnVJ3auDPrMrGGIu/vMtZ1PMfr7vFfYIczkPTiceRkzI4
 txAJCztzEaiy7kXG8AhcUmbp98Hn7V4=
X-Proofpoint-GUID: oSHAGbyNYtPYTVGDywm1ff_0Gl5nj8kT
X-Proofpoint-ORIG-GUID: oSHAGbyNYtPYTVGDywm1ff_0Gl5nj8kT
X-Authority-Analysis: v=2.4 cv=W6QIkxWk c=1 sm=1 tr=0 ts=6a6b47b4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FIRGNMdoUdLwylqrcp4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NSBTYWx0ZWRfX6A5M/v4xDDkG
 zgsB1028c6vuQFz+4QFu9ecM8qRroAAxbtqA1HfuClM0u8SLqaNaZNWmt5r8XrthSyqZ7slTZIa
 gohzd0YfInGQDR6R8NZ0earnG7DYa+rAb3PKVxIf5f1dqWH/ujXWQWYWmaa1lAmjnPYrcgFiGtk
 0YYNhvGxLDztZj99OHyZwE3l2BJVohLuL0BDqUt2RIGNZpWfyCoN8qP+EY3vtx5bKzjSM/qZPjC
 nl6v3x8b9ydp2vL1sTscHZtzcL84I8zNrGUY9+mo8ApFheAoHAToo3btwqWgAu9W0vJ89Xszu25
 0OkfuDpZE+bjyxwrAxb49JSXs8SWyU4uHwZpHgLeiUe8Lpga3MBqb9JJSD04g0C/D/Ht7yLiTNg
 sc/VNK3URRCCWurJCqtMSvDHsajagT9CmVMFxlgzs3L9CKrf9DTLLugToabHPPnKWKo5d84tU6b
 802bq01mxsFUSWyDDjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300095

On 7/30/26 1:55 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Several Qualcomm SoCs declare their IOMMU providers like apps_smmu and
> pcie_smmu, with '#iommu-cells = <2>', where the two cells are the SID
> and the SID mask. But the PCIe iommu-map entries on these SoCs specify
> only one output cell for the SID and omit the mask. This went unnoticed
> until the OF core started warning with commit
> ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps"):
> 
>   iommu-map has 1-cell entries targeting 2-cell #iommu-cells, treating as 1-cell output
> 
> So this series fixes the iommu-map entries across the affected SoC, SoM, board
> and overlay files to match the provider's '#iommu-cells' property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
