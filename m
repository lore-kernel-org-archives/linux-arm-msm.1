Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E55435CBCB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729933; cv=none; b=ZMCpZQsohrlgXywf508iuDEBYWLEiZWf9wC9Nzmj/Q7Gtuj5zRE8sAsde0v7RL3Sum4aVGtXFwJl5Qi5u1bnz/C7xRh9L83embUXV+pEBoT9gKBwcU5d67F1yXXH/BQ4o5Gr2YqXsJBTe3lc4XCHdknLt/SPeJA6bBWPnn7Rvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729933; c=relaxed/simple;
	bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rk8WOgZGYwCOYu65IV0WKiuoeh9J6OlFOZ5PFLH+iToirckwDfkk8vXpOV5YF5i7jJnFKZ/C5gbzRpEdeEErlAF3/7Ds2wgH2hYO772HJShr1T1Lcclbo7vrZ7n5jRSo/defwZmo1dhy3Yge8o3TFA097F/opImIVLlO26FksPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBsYYn0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=befWHXya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBsYYn0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="befWHXya"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWcVR1027256
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=; b=QBsYYn0kVccuhlew
	PR/hFDKMjbZOZpxNuV/SsThksPzvnPiq09vBci9M7JKQOuq5O4RhTHRQDuq5MR0X
	wJgdBxZ+MCRyMhd6HGf36wV8vKgcEv5HoYlXC3ZrFxqs5X7dmLIhQwARfjnuIX8L
	F44DmSminONJbvOCij99Ik0J5znHXxaWPyWhYtBbF0aWhRpZ/lxRZ+KP5/jyVMAX
	L2075EzUWvalRzUwLdBQ09Kj99rwoPgpAnAh9Gjsyi8blHnMlYqKYY3nledOh2Sq
	xgWq7mtJH3jh6svE548COJMyx3lPxEWiPXliObltf0oec3/QdDHh4uhSKvgfBUp0
	8u4QTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799ef8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:18:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so716004a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784729930; x=1785334730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=befWHXyaDih8uH3PoYgnisEg/fnXHipcCKRC+XU8fzPzMrVmV9Di1adyhogWq5CZWa
         mxMi3WuL/j3Cl+MuB8jzqIS6lF4DmdP0hGRasI+Dn+doWAOTqaESJQn48uLHVoD+mvAM
         jA3U41Zc3sT4UoDxNtSu25GCfxyiZ1xlzJkPvKDgNDVK3124pN6kvII/murpcuj3TTqf
         Vj33R9rC7dgiUlX6MRWhVrptPsS8OxaPtKMMdVFerUoFYWFvmHdBA+O7eyRO+mHz9bM2
         9GGsQTyY75IKBk/SACFFQ7+pCqyD0BOTHIi5ZmxXIfJMQm2OH+RUfe+qfNSPcmTlDbMX
         pdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729930; x=1785334730;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW0yyY8JykH8fAlc9I8k68jNlTSdPXYlp1Ov6aHWoco=;
        b=f/QMSQavUnvSpq+i0+MgRMU/SNE9Upc6AroUa+5FSBHb6LgtOXQsgWwgETLUYNpdvd
         7g42SE7ns92l5n6eSIvQbAe6ogYQR4ETdxXVVQDBTXvkAGFDO+9T2lz/UrjubzldzLtG
         P+VRP1nvFY4zZUhPC7gg+E2Q3ZZOpNFMpY1GZY13ixTYpW5koWXV/1avaFgsXizQQqOB
         yCeq8LeDPPE8gdB2acNfx9HAumMVkC5jRV5EWqxNsKPGdTCWwMKnLnI54XEAKmjhi+AA
         ZFzHoWV0cAkPM8lqlprIajiYwGHjPjJVcy8sceJhVnxQ3cEbxeUflHBPbeIPcL4+OLnf
         GOjA==
X-Forwarded-Encrypted: i=1; AHgh+RoORg+KklgmIpCQZOZ6dD8gw7q3qt8qRIQMrhIH+2e+TQvVHjQSRRe7U9pn18k71a31XoqDcDfxRob3I4qv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++sc0lpGpJ13dewHrtYEm+E5zCqrIbUXCaLQgnEFXtp93PwGU
	vz/XabhjVcC3E1krL1t8/093X+snkY5xv2l+zmF/3VtEHIJ65wE75m2dUqfTB3aw2HCg30ujD3c
	Vjcq6IFUWmeIbGjrUVFiqhSNAr8bieWjEvU34aH8wHcSxELZ8iKB9PXF3iMsiwyxqqrnU
X-Gm-Gg: AR+sD12h8AmuUq0f6ir8vYT9aUkMCm3XOlI1tVM+3FT5HEDuU+gQugUrR8D+lUJ+tTd
	SCxv+BjzB0H9TUwy2b7XEgrm2B8UdleuyBT1kRxIh7ytVQPidqeTyHIikj5TOAgaacPjr1FrXmk
	jzCFKa3zl8wx1+yYbwVF2OaCsqRFhSCi+Ht7DA8cuUkDsqtnq4xBsTcdLq+V1GJiG0DRZ5rXP00
	U3vCXp+YstLuNQoUgGldJsgPYzluAsz2jmb3JCRiYzUnoW5wSA99+LIylpNrygna1X9xrG6Zydm
	fVdLb4FYR5g/Hyz0f7FleHvZUGHpGlGKN67XFuecF0I0vR02tBHP0jVcRMxiC+mspDimoW7Urdl
	7hcwq/dAZofJ/MjIt8w==
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139890637.15.1784729929821;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7a9d:b0:3c3:b5db:cd07 with SMTP id adf61e73a8af0-3c3b5dbce30mr18139833637.15.1784729929226;
        Wed, 22 Jul 2026 07:18:49 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081978sm8899001eec.24.2026.07.22.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:18:48 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ASoC: Add LPASS VA CSR heartbeat pulse clock
Date: Wed, 22 Jul 2026 19:48:40 +0530
Message-Id: <20260722141840.596101-3-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-outgoing-bold-tanuki-d4db9e@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com> <20260717-master-v2-3-ae200627ad62@oss.qualcomm.com> <20260717-outgoing-bold-tanuki-d4db9e@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d14a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=4euMmpHkiu_tE4R6rnMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: RKfSIckLsx9hsk0FMsi8u4atj8rhfASn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX4UEWfsei2/Lp
 FoEo+LDrR720V6nGxxXnHA1laViaOPSKGh/qFeLxITzo6xYEZELXHvpPgC2lm6nbO8sgaPaz1/8
 Z7uTF1CVLHdIN0UOURv3ybdpbAh6yF9QNjWCJ3H50WUS6+1Vu1uv8L3ZeTSsoCzdQeneR4WUsvc
 06N/ybf1nmPZ5ujl7Ty7WYH0KOporTwNbG8ssP3xJ2BeolLfhm4Y0eBTHzHd/nZsFvndGGj1ouH
 LvvBWy8XPeRnuwtzeWgnGZfs7uO78XvBAfz8R3cyUhSRIedLiHeZuyo/WbrdrUT6mGretLkn5wN
 cDCCdebH+lVB9UcXM5PVLjI3rKlnwgvHwRKxQxlRP34kFuTKsE2yOpDkC1ZsorsDuTCPsA+X15p
 +ZUZ2G64RVbQovUFpWJYWKLLf4xS+ffGkUQ4iZwfPjL+dlehRo+b3A9sQbuIfIj5srlPH1Inb9C
 jXMZ1InW3jfC5dq73hA==
X-Proofpoint-GUID: RKfSIckLsx9hsk0FMsi8u4atj8rhfASn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MCBTYWx0ZWRfX0UvoVRcz/wJs
 yN+44dL+T/KXVD86jk6vlS0XK/KG8MKElpKoFRuz/f38SuNY4bzyvYGk7yAg3oTy05Ovg/ygkUl
 j4QMKdpAO9hExLG+z/QPWkgKBTkoa24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220140

On Fri, Jul 17, 2026 at 11:02:41AM +0200, Krzysztof Kozlowski wrote:
> Why a clock provider driver, which has nothing to do with ASoC and uses
> nothing from the ASoC, is placed in ASoC directory?
> No, this is really wrong interpretation of Linux subsystems.

Ack, Will Move to drivers/clk/qcom as suggest.

Thanks,
Sarath
