Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68147425A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865138; cv=none; b=ptymTw3/MNEeQsCQWjQ2zFMPbG8dPDjYRdTPoMsmM92RJ9f/np73SEtR6xrJWA5ZzI/I+wMMgbBl97WFetTXfcZE/hUBnziGw1Hx5hmQtIxb3buTPHy4ZG3woy+iF9BcvoHgpvPnTAUjvSq7XabThsgI3QmzvSey/sEOO0w8LMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865138; c=relaxed/simple;
	bh=s2QL+3PSUX8WWARCToIGXu835aTMJb1xf5KO5gaCYMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD2+RSa1SR7M1wY1s7P73EVplJDwYbIs0ZMbSP+DeBxC5jhLUoo3qPNxUfYiMRZ/SJty3Dil4O3uoGe3dGv4m0JxpVrGHQFj5Nvd3YFbWWzq35kiXICGhHgdensBJ6BykPFj/pwu/JeWAHmN7gxHsrQw1s5SPz22MvntAyjsyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwnkhZD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8dd6EWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwnkhZD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8dd6EWh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Gg2iS774767
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=; b=TwnkhZD5olQv7ZFw
	LK2jfU8KDMR73DxbrsGgbVNRlkWIrkP0qYCBVxHSXnpshrG/O5qetJkt21krNeVn
	EHvE0frrfWnQdps1gwTUpFFrSDyIy1HDBkZgP4gGM72yDWvVlJPLBLk6c1b7f6rL
	Lz6ulVx0PNYqCwUugXl2+9bBKm5Yr4wpgRWVDyI/4UgoCCtGVUzauKttVx0WHWhi
	35YDjMuNogwZJ4vWDRqJgLbAlrk/ODv7G3elbhb7qGcPqcjQlwDHBTqgnaAUt8a8
	vn4YHqq/QetCziVGYx0yuzKfXLoaPw0p0BOx0Uqz1T770ATRF5Cr0Zq+v09kklap
	65ELEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku308r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:38:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso1115635ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865134; x=1786469934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=J8dd6EWhlk1+TQWP+FZU1IMkCDSfp9kG0o8mmKttoRhDpW+NiNBla54EQ4niTFU+zo
         UX03OzFwdHXLVifeXR5KBesF7zgHxYAWltfw1XrC5k4uygsrtuTBpaSz2Hwwwl64uRis
         jGL/iTf84j0tmcp5i6/P2WecemYsUMTboDcTFsuC2J8g57UQyboNbusBIbDjatRwf8Yh
         BqJo1hPqkFgccIwHLznxDMsyHuVppvrwuHpfU8PNhEwi5Giia9zkOSKBy1pDTz9iS6Ub
         hlvdvHcLOhCbu9OeCUF7mTN9Rs+SFQyiYdRigNAkj0EjPC9K1QrdqdHvwGBzJdwvkTeL
         sRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865134; x=1786469934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=DU3KyalCVktKIfts2pLQHEYNeX6UjR5/h4HzY7vewOOLfw28mujs48gjZU/av4BT7E
         guwAsSXsFz7IKkk/2EEv8G0yqtXyNkinEnrYPoWVld+w4wr4ggxfE4B6b9WZ+xqZxi0j
         cbcPf5yOTRziVQBk2zo0GpC9IJoUXIXJ70YHCLa7EUcHmZGyb7qlYWUy76kXuaD1nbMD
         aKhEzr2ZntApFP0U3g95p1jrMmAq4Z8hXLXd8IwASMLZ4/fjyMhnqNrKxCaJ7ka1W61S
         NzfXGwlmoUy3IiGaL/yoxGe8eqt/sc5U29FKxzKz4Fw7AkGcHVZkBFKHCWOWqPKCIhhC
         4K8w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7BE0/4s6T0lEL/P8Xs3926hSQYaFuRK9OM/ALGNZM+/VkNQPsltywqhX46TRvCbxcl5gP+T4RDBQMQOqw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nHypvKZ8PP/tmlvyo33xOUPzdekbQwksxXpdTM7gYfgUoRIT
	m+JMNdag5PUJmCwLUE1lLyabC8y0p5TJLL9W3yIWi+kaipmuCNQbs+xsxLFgEXO+W7GeRNx6N02
	QsLM+ta1VNZahoqAmmSBBw8tSR8P9133OhkKhOW4WJDiALoYKEiYdtYU4cAHqIe3rcuMq
X-Gm-Gg: AR+sD11o/1+A9cLWPIjtbnm7VC4aMLwfWKIrOoxqVs+XElNRaeJ+MZJXD+9dBW6rzgK
	uepyubsyiaM1a7I5baRia3zqYiyTp5gUAawK4VuN73Rggrr/cOa2eNipaM6exW1zSm7COXDLaoL
	WWcIDWGxDPnkIDkfhCo92gTNyVQWx0UmJrc3A3KPmY9pHf5OtZKLaF2gw3AHY+RreYvv/lCfRoP
	LdDGOMPE8Tn+QkPJuHFHUltC95rb3iHlBbk72s1Fks68kp+w1cefsukfQTqGv+CFlQcQ6R+iIMl
	gRu22IvmIeA6icBNWevZgb6wviKbPYsdCJJ1STmvgbo+IyAvKQsEW+APFxG2Kr8gnzDU1fhJb+8
	SkQ4rhxEzxmuhNnifRVSAWgM15yC0XTfi9yDcxA5v0tL8IDhHt40kasfF5oX5
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5638245ad.24.1785865133864;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5637505ad.24.1785865133333;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm10441282eec.11.2026.08.04.10.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:38:52 -0700 (PDT)
Message-ID: <9387b504-4506-4066-adc6-7ea73db086ad@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 10:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
 <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kL2zkYtJV4Q8KN3RZlGr7HQ4t9-pIqZe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfX/rrll08447XU
 sHnzrvO8m0BEWXh8A+mQB43VLFOCddjwWsMVbQA57/l+1ncm47yEm4567ZzJLGmSYEKJQtTNfHF
 uOsPthFFrMm0LSwcWtftB8kznxP2eRY=
X-Proofpoint-ORIG-GUID: kL2zkYtJV4Q8KN3RZlGr7HQ4t9-pIqZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfX0YEU0X991+yJ
 PjMWSjRGusGwzvNUEw4x4Ddxaz5ZPxv/2/FDLxWfVXdg2Mrba/16XMpHSthheD1lHZs7U7k2U0A
 X/xQtmw0BzhShtLZ+1YR3wWv/xTj4RIiHrgdas4qr9e2QEo9aw4fKrNWvvQeAQs7IaCIuP29COo
 VVU/UINWR6W1Ad+LDC58AuPj34NDo7wX1MA36d/5MC4/2p33ew5sgaVVTBr6hkWS4KgLtglvVtS
 tLRT8JeaMs9WWPhSj30i8xuT4EvtEIsnduVUMhkDO5D1bNQJOgiNfXWL300J8LfEhFPeCnOa4mQ
 IW6dTD2mcFAEF+XbG9TFLsqR2nVGZcGG83Vh3QoyYwHAxfoSaPerKsLWsV/eGGvMECXP049r15U
 DW4X6nJyTqPzBpnjeCx5X+o70BN6euuc1942xXDtnrLpWCByIR1JehQHsaf/D3xYue0F1bS2NZe
 dl+bEZm8YMP3Wxaa3OQ==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a7223ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=855XeEJFKU-ae8dwujwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040142

On 8/4/2026 4:23 AM, Varadarajan Narayanan wrote:
> Mukesh,
> 
> [ . . . ]
> 
>>>  	if (IS_ERR(gunyah_wdt_dev)) {
>>> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
>>> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>>
>> stray change..
> 
> Based on AI feedhack changed %ld to %pe to print PTR_ERR.

That was bad feedback. You just want the number, not the human readable string

