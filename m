Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601680;
	b=dV+3fJ+7NgQt9cQLaOj5iUBAdBHwVCW3mb11v9DTk8GyXPA95vEeJczpuDdmLlcKa9ti
	 EG+hkALHVbb3/jzmeDDc1nCGPi9uDZRmOZYfxwP+hx5i05IA/5/BxbC2hbs85GyLmBfuK
	 Rl0avL9a+rME+ceHsi/NCc3UpW6xBZzMliNBulMAyBd2wrHlyvkOnZ6WH6wMmtRstehnR
	 4R35zE0rV0GOOg6nobaJcSD8jCHVuftzndtae1BYn4lX4+O4UzG40pxhvrPCsH2jNdCnn
	 W7EwMmDbwTA9qRBrknOmtnxbyhyzNdxP2G9GvDLXDPFQm2ew+hSocXJoy+WjaztK8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
	b=H7L5Sjn4p1UlqPsTqR/xYREOs8dAVoygdE4OP51T9+4GArTsO+h/bmL0WE1Snds00/Vj
	 Q/dDmV/+n+byJpr+B2OaAfTA80vPu7KtyCvRhAbD8EK9Ob3ymPg3a0k0O8Yp+Oa1S9UYg
	 YSVP8yC4L4+oHbsFT5rrTormDymltzwlLWDPQQjvpUD99hxZal4cvW7zKAXY4MhZ3Yw1F
	 KDmvrmzEYGcDKg/9tJ66L+7DxC3Y1igrv+NVSeqMPkrdtFniJz5jtHupngENV0vsQB3aO
	 7C/H61Jp2/bE/UHMWaJ1/uuwERn0X30xBaPCGnzPfAlQNla9VljqbqB1waOOcgSVmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhJEjgl2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMbRbE26;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F0606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhJEjgl2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMbRbE26
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9miub3642179
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HVdsA47aDoI
	4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=; b=nhJEjgl2y/o4dWRJQXhb3irWSqo
	3v08ifC5n1ZKlNSSPCfwWU+klZNlvPKSwLl3L3JyaKgFOBltKsOtsOEgSiVIR29F
	c5qrDL2tN+hRucvwk2TnDvorH1m5ecFjscYULfMJV1C5UC7JqJ46//eqqWnkGCJu
	RkGxW2goq2gE78THjTotQI9Jo//44rK7UdxYAd1Eoi4PRY9aq/Af0ThJLaYCo5+P
	4jr53dQ2KYTobcNl3hh6DxIZEEiJowrvDIbWmh4vd+UZtZHZpz3PIQ8Y0+VjrpPu
	Zzq+8FoT2olOsXUO2cvosGToCx+njYSPj7Dfi6inZXlIxKW3fr+KJVBgr/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aaf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:14:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efa9aea3c0so72564365ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601678; x=1796206478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
        b=HMbRbE264zxJQf3kKhzRFUOphLByXq9E/IV3nzUYCeOV2LDqgQyMR+JvpjmXVTZG6e
         nfXnyYzFINYj6rbw52bytqs9MXXPl97mGlAxJFJw82/wjllp8TFX6xaHjXIp1lwaHw/8
         0OzhitHy78ReD6YCRUWCvK7lzw/mQW+PoZX2FPDA9OlLI/xAz+2+YU5LktVk9gkRykl4
         R3K3ObdjNdq5prRRXSDt8TwRh7Rx4D3ujATDHUi5MRJ5gSTtEmUc3AfVcT9tYoG8Dke2
         Npqp8Rh+iJWmaCAV0YAW3eE+3oVl9/wi7yiwJE24DVic6Oqj6Kye8saMNoZYMrwVJleE
         qA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601678; x=1796206478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
        b=uTDvARFQThHGxyDNhM3CGCWMUyOPVy7NcV0oWnqsphxKYglouZC/FhrM4dkNkCUAlk
         kTcHe0a3+tlZXi4294wTUZgL0al23dht83hSeU4Z+e1M2Nrbrw1rgGoufZq8HystuGqf
         sUoQ1zdDNEaYFjzIfMbVWHuBnUTh1nXuvFhrv7/ufqy+04ky+du8T5cG46bIPpJk/Exy
         RojjIE6ttrOrBzz6iKbYAI1zOi9Tt8Vu9sdUVyDNss8vlBskQD6fLMDCueHAOBiaed+v
         Qcbi5zvV92+44JVBCAecACO7Svsm2o7zWULxqtde4C6d6/DafZ6fr/jFWxnWF3NgfURI
         XF1g==
X-Forwarded-Encrypted: i=1; AL+hErHCWeQ0zucdvU5dheI46KrhGg+vge33yUWNSKf4UHMvLst0Cm6lcssPDPKGRY7prdjdZeI5QxIz7Lly/TL8@vger.kernel.org
X-Gm-Message-State: APuU4Z9rG1QUrsMlFUcmW1gOlZenXEuXQGJX777+JV6xZEFkwh7id1mO
	6+0S9WnjeR3Ouq6IS4V/abYiYaU73z5XRUAByYI2Nfztl5x1/a9KQp08tBNZWS4ANsPJnD+Jz5U
	rwK/R+eJpucDX+FCa+eUD8yI24HPDTJ1McdjA9BsaHvl13fdmN2HFzPzuu+iYZz38Ni0v
X-Gm-Gg: AZFdTZc1UJ+wMxDUFiOpFKTbxtnPMY8BYBmcV+G1ZMkt758lT8Gcc1B6sKU/8TYI23a
	0BEeOb0nJ3FEuEZea5V6Hc5349JVI/iXHkhiKIpnKFH8E0RB0FBcTozRcJlnJIcZznKE7Z4P3g9
	nMbIALshF65+R+J8dkIEYdKVZj3sto5b+ezQmx1G326uJaBRLzTS/clo8A13iv1SbcOJ/rfOrgY
	/xmCLi5caTpxGrHKn4tOlJMfZM31vM6QXgD6GmdTHZfhrWmhSrzH7mFABfrBueoyNta3n9Ahofo
	6QyMEfhVF1R9g7dDJzElxn3FM3RjQXfODTjMfplp0ls4ahrphS6Daos99g1flV57FXdUT4KAgmM
	z9/GM6e9WXnMgKsp7j42TXSYz+LjsrjZC8V1rFRYS+TvygGjOaazbMuICJpDONTa95RTHB9FYd3
	sLhrp+DRXa7ci4TU3kIKR8KUm4d0aJQyjjxJ/kK2kJatkBgIW5h+9SJWgQ
X-Received: by 2002:a17:902:ef45:b0:2ef:ee1b:8e50 with SMTP id d9443c01a7336-2f03f0fc314mr164139885ad.18.1795601677964;
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:2ef:ee1b:8e50 with SMTP id d9443c01a7336-2f03f0fc314mr164139575ad.18.1795601677447;
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm84036135ad.50.2026.11.25.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Add compatible for Seca SoC
Date: Wed, 25 Nov 2026 15:44:30 +0530
Message-ID: <20261125101430.231766-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6835fb3e-5f05-4f32-bf5e-85c5c5803459@kernel.org>
References: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com> <6835fb3e-5f05-4f32-bf5e-85c5c5803459@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b50e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=nsDU7YxpfX31B6LV5i4A:9
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: g9d4fjCzpM79zmXfJ-jL-jtIn5pFjNon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2kG/QAzLWwzX
 bXA7KI3yIxhaQ9aMSiwrFFzoJAkbe51gE2gD2FAwAsXywgP59H0fb0DhdTUCf6+mlhwc5R5VFnT
 Tgxl38bqPPzYkM7KfqydDXXyo791nJrd870ESTmWmBfWGS9YFGsXpyKV7f3vARhgHskJ8e8QnbU
 JYApdxVkpD4BHFKh3+4FBM7j+UDGbWsh80klbC/yALY8UCTQhHIL+eHfgmhxvN6+9ev5O9DonO/
 YEuhzYVtEh9eXw5l18PJUmpm6KOEM3OSWpPhraD5If2o8ASvQxvA4EOY+QGnCvBahXIhnlDTTva
 aePR0MbeoAw2QhRrkQ3Qd9qlIFwb5wZ/R689KQ3F5gmrihU7w5vNMNsnLgkPYHI9MdMCL2SdmrC
 IAVNqEXWLrY2KY+lo6wy9E/E/KySTo0w1bajRZMeFDqRy5u5rFsiBZhiz49VIa7q2F+YOktSY62
 +GPLcvQ7NXH7d42Es3g==
X-Proofpoint-ORIG-GUID: g9d4fjCzpM79zmXfJ-jL-jtIn5pFjNon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX9/mYGYu00fAK
 W11AoJwkXZ0B9Olq6ORtW6mKYh9KU8PPAA0r2RxBFHaqONvSV0fE1dsBoXefdCJM5cH9Gj3B9D4
 TFZK+7ZaFlmmhgWgDM+6bXRywKtT+PE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

On 24/11/2026 16:46, Krzysztof Kozlowski wrote:
> That's enum with previous entry. I am dropping all your patches from DT
> patchwork, to avoid repeated feedback.

Ack. v2 folds the new compatible into an enum with the SA8797P entry,
here and in the SPI, UART, UFS and QUP wrapper bindings, and will be
sent as fresh, regrouped postings.

Yadu
