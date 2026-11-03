Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684837;
	b=s3uhjiPAVi/gtwYk4xEIUuV2t6EUS5ZEzxb03SmruXK1TbmFI3ZqlMkmE/K4AmAnhpcy
	 v9EfS5buDFq3htCFBLZ4gp/zq74ueFVxz2dMmXOtEFUngrFdr1o3f0nXQuvkGg892tOT9
	 niucpkInvqniL//PXqnBn3r09JeCWEZqSVss3Y6FFjfYLLXFq3KBT/lE9VhFFdpq8Yfpj
	 2EvFOVthpoqidbpTdJtERHyn3Bgl58RNkEP6bnRXSjmTvKwtTWdtfFz3J5+ofHMOLbWb/
	 phXicHWaRjxEyXu9YCeIxpy+ANrmd8LDWO0AOrScrffPTp99NYxsWaK1EFDxhHpD5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
	b=X958Z3KNatRW8rnRZ9nEuWCJDPGSybi44aiDyKcdf/VWP6JB0vev61BO1Fsi7H5KQqy+
	 ToBgQMeDbJSgKlwcrEy2oyEnSDMec+fqSJ43ar9egUMTCQvR5enWCHp8cAUzm6yY6fuXV
	 jnrnEgP8HLlyqnv1L5YqvjExykMgFfJBYtotOd28dcvqGLkRznu/bHzGR/mZ3oWj5iJwa
	 eaQqLHPI5cs3Eze2pn0QUh27GUZWzdk4Cvg5agUnvUmbgrJsEwNxBVoh0g/oyYXabEf4f
	 7Y5+ko6PhI5ReMar2XSn05mmwr/+J52seFdc/G09XqSI7McVDOlvrb+6t4RO9Hj46Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A176606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 05:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A176606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A358D5d254432
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=; b=B9WPCRoHyNWKGB9D
	L4dsvqEUClvH8NYUkX61OcAYrQ7xjNf8OsnFL8BeS8ivn8fOebHh8j2Gr53ZrKh6
	6ctTJdl0ZoS4wmHYDLR+/08RvCfJxzW/kPXa0K7cW41jngrpCOWaIY6LQkDQwyJX
	pc/oqb9Sfa1/hL935YqWfv8iL7ENTA5UNB6XUVuTVOZ4NG1qYy0RYXXAn+i6+JaE
	dAtNI49uAU+gger0nd4XxtGguv6Heck9tdclAGjAIlIbqcV9UwW5+P+biYRG2YaU
	pDVTCiB7IXKU61B9PByE9Cd8wuz4R9xucjIUAAdWtJMAiw1U+M7kvVF7/je2dwm/
	b3H4Hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ej4pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:47:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so4815417b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 21:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793684835; x=1794289635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=g56Tr5nYTBRguwedEcBQiCAihdNQBz0x3U8KSv4CKoD5x1qbdtDlrpaDDpbgYZ1Bd2
         U9GWKN88ADi57o/kysshNxRjfhR7SMLlHQbngl6W2IoEhjDDPWGxfSGqd18v3gY1bMdF
         Ro7XaCyaL5VfZcBjrnztEZhilDGytP5PC5QGT7oMSctJm5TZ0u0VK0cXsBaev2ppMVir
         bmW/hj4+dzczrAGOcp3EI8iRoScRqtp0sET9Nofp+ZLAf0oO6qRafd93lXvd+NL8nvLr
         1D59Fqh3ddTIPT1yQEVU9QrH3ByI4F5tq7F/Am3kjAa1jDQjqtIupr11x4T1EMqd+5D0
         396A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684835; x=1794289635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=gEAM4QebUpBXvvxzCoxRKwrJLASXWN7MUb74AfBk4YeYzXfVTtPgnATcptfERqEffz
         QHxf5M4igf5A+y3Faw6L3EmVY37MF5RY2ttTx8A0FubmvpFxAy7p0vjrplO2a79e6BRH
         iWy3DAgvFzrG2pY67JwcJ42vJPxsg5M6HumRzMqueZr1CMalls603smvwQ8fQimOmmPh
         E4gjg+RqPM3LcULPcKkORmilq9/c6VHrsvF04p0+cMjhcTeNll5aL5tKme5s61l3Rr5j
         1UHwLcnNTN3iEhjHz1Y4l+7xXIU9nLFYiaORZZRogVfTN8p7zHZ67WpJk4WewXj6STWx
         Hmgw==
X-Forwarded-Encrypted: i=1; AKwUvBw/7neAR4hA0q8wRphPT9lzIu3HOomYZPivLbjktZX7nRL2MieyWD4aYM+YZKmsGKtQowSOUN3xMZ0lEPGV@vger.kernel.org
X-Gm-Message-State: APuU4Z/UzEQvcTmv88IlarRCDbPrN2KKPay9dMJXqr4QAYhwtxKDsAep
	lz4MKtL/OCOInRG3n2NC1uv2HpHOOjGzx227iPZGtJ6tLXgPz2BaUNfhjHmr/lHFsF9KKT+3+S1
	FeitcUvFnZ7vFNHXxJ4fDjFGDElAeSYPVbIlP4kjMVFHYyV4VclO58s/ia1IidM28Lky+
X-Gm-Gg: AYBFou1MPPdgHKdbUOmX8xBjQeFXynNyTjyXTbLa4P0uHaHa/nOrBdEnNlzTyzgq42M
	aTwtbsYFULV7TM7NMSLbqzS0DSlkQsuylVBMYBfWf2CKBJ/hPFVFOHwZ00z8LPOMVsjzBQPb1aI
	P/Ia0OoOyfHdzevURcJJljRhE1BRSw6LY5lQUPykzbVhkdgBxiqasty463vZws+9mDOQuTg8HaN
	0Wc1waRvtzj/jKkeTABXMtSom91kVmHi5zbktbvfD/wh+1U2E+KiB1knSlwN4Nwp1xs4B6XKJ4K
	ydZlZXqvLMEvWaN5kZshOr9Lu/yCELjWFV7517AR5nmpGg6tKKVNWSFq2Hbs2Bx0fOQnYF99EN4
	q5XcuSNhH+vyc/0t/mfvNJTyVz6fUfXW8ZldJObSAAXbxOnK6bTB19jS9a5ERU3ofi38QKyDD/M
	8n5i+o
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570088b3a.15.1793684835534;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570053b3a.15.1793684835043;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm2896689b3a.2.2026.11.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:47:14 -0800 (PST)
Message-ID: <e44d3e85-8dbf-4ca2-9c88-817f729fcdb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:17:03 +0530
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
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Codrin Ciubotariu
 <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>,
        Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfXwcpgr7T2uXRN
 DXYwTCQkggH3/j+WLLAl50/ZG5YPn9Ly4blbWCqybrvwO4QrDLr4TcabxUByyvChnfSdolFdpGT
 sC035yA83pIr1YZO78+lyF+SJTHMrNDPj/0untxsMVm/ni2irOkDv9XWYJQZ5BWZlmrfMGcO4qw
 AEsKqtD/VVAnbx1vnNmlaYThupkCTy7CdDNUiSm4s3Qnzyj/w8Zh/nen5+bXBgjJR9VvprYFPkC
 i0jVmYiN51sxP3f54dW4xZk/tR2FAjRs+oX9oYrbbgkluxzbqX94cSbRGzln1XxHIU7V6KR5i8G
 ztHzZ0s/hP+pju5tg3yPf2byMOrmENsGcLXOYxLIVkzVi88Hl7fb1RBwjDrFwKAQc4Q5IarrpDj
 wumavy2mF1o8V5xq0et1/eIe9v9HnZUQxtsLWd8I3AXe4V5eLbqRGE7tOC+zgLjtmsPP8iWx5Xh
 whywsq8nQ4YcuVXkPPg==
X-Proofpoint-ORIG-GUID: 8ZDRvoOtifchxqnFQhELfBGT9m7JWwmP
X-Proofpoint-GUID: 8ZDRvoOtifchxqnFQhELfBGT9m7JWwmP
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae97564 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX1j1mQ5PrE3nS
 dIMgNMQr1pS/kyFX7S1MTTdzTf5R2AmfjYDVUxD8Gx56Nl+ijFg94C+ft+O2vYHfEv4esm29+1h
 WD3242GxrTkzMqMUfvtLqpSzbcGXnYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030022



On 11/2/2026 10:30 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
