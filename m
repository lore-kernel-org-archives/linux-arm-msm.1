Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10F8441618
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770947; cv=none; b=IbVdTKEnqfxBggR4MfMz+bYPc16eztq9KtTlz0glRVnXpGXYVJV3C2RN7cLZyQUSSKSra/rzQuVSRtojeJKH5K7Pua7eebkGY7k+z8Fj+JoU5rzV/5FUy2RCjoBNPloccj0LDj8bmsmgdVE2tS0++ZUGSaOCOKxdQo/gATcMf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770947; c=relaxed/simple;
	bh=P1VJDbE19zgiEe4SufUpFuATy+q3+uTw4Pbh2fAtumo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgUtQA71pzwXMOO3/p8Hl3Jvz1RXL96vYOqjBLgAV6FUrtAMLTTvByRj7zO/fUrK0cpaQJxiCaMlpYy38E4Oqr09k6L/ztil68FGz/HZpQ07Xw5T9/QCov2n1TtYOL1NLuuUGNalU7eg1dcF05tZvzpLm/ggBPUZ/vnbonpy2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAny0RjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwDs/T/o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAny0RjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwDs/T/o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JJF4161130
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=; b=AAny0RjV4FfKsSsV
	5br7coai3dU+WkirStZRF9HjHNRZAYIulKFvsiFuTBKC3Vr5UtrDj5BJ0LhGGeEP
	Wc1jEv+O2upwIeE8/mtqGzx+yvFI146ZXD99L+M9vi0TO3C1gFJi1+1QQpnUH4lT
	2ZG9EIwfCJFURI3DSYXcJHYy89iwWToq+f1p2c9wOCn4zrOFKKZGcaAcB8mOQfq0
	QdVu7qvoMDhp9VkVLagrh6HbRT6CFUghpiCBVkyf05s3PEnmvAEc8wtE4O37vjzs
	IuPIYcJKg5AXOYAci6Z4rKuW4jn+WEh1W/XlE7S0pGdrkFHpLSETavPo8Osf7yVg
	KZgBaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhtad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:49:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91045c83dbaso8360346d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770944; x=1789375744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=;
        b=XwDs/T/oSYzxmneT+ZSP86n7IuL5+PYETnbDtq1QWKuEuj243t3KD8MFgQGqcbsdiE
         njajQjoNOMhAt3z9I3lxBggp4Ihu0m/yz7Mi/k+k0RvSPXNw6RRdF5Xf9ujSFgzmYt1j
         eUxo9E4wbrU86IOhLIGS7SzdsIDJOz3e6jw1nXhnRgeZ1a57j5TXNAeIJJGk5bVVbUR3
         1cLPS0Tn3lMsjBMII2pZS/ogpFfJsOPdMe2nKqGFi9sDj1JeOwdRxACKuLVIotTxEs3F
         CZbPNDK+L6GhfpVDU9vwe4dlaR0j5lEYaOLxEwifHGFNeTrqoCEY4KNzJyw8YNim7COe
         Vq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770944; x=1789375744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=;
        b=tPaSpniqNs+bThDOR9YyHE6NKhbrtPanYHTZYIZSJlAIqCHdzO1Vo3a1NVVNUGuTcd
         aa0pbVs1RWzqOCyqR8Y1KGSjdqBWnQxyWcx4ai/1mdeeJqc+xvyynOzqr/3AzGnpmJLs
         MqvftzNKazGQcfaQNWdbVEdvKO4E9qz90xgS2Wnez0Krb9158sI3Y+vLGFGXVaLQwZW7
         nBgHERyEL5YAdBhAhPnBo2iDH/wz0MGADA7+MwNiPMnOaBw0EpSe8GOqG+YGP46M0N0a
         qdB5WCsFp/WWee0M2I+ChEohluanWcjJDUgH4KeWDOHytVbPUDI92vizD8jzJ9ij1YfP
         48FA==
X-Gm-Message-State: AFuF++lUqVwcM6xnKiR0q13fPENa2doJnoeX1kO3m4Mus1DtYsstJ52t
	iB5Z41xstXvi6brWJ4phVO8e11NhmbS6K1rZ7YyY3aLLhsMmmQwIyptveI3SL1RVz5hvk3Fiyfz
	0SBLUTOavwhsfSbi7qxKMCKPoPJsm1Wu9fg3jipiCL8aVAnGBpzGrkqkYUYUxFRNIZxF2
X-Gm-Gg: AYBFou3GogAsG9+imQMqE8ZYOVJ3gNmWcd9Zmt4PpsJ/2D4TrgLZoGBDxNReXpohX4p
	L8nWZXVAzs5oUpYZjSywXyGoCZLdCj3SIioa6l75HOt9wxtAwMoK7dcp8J4jnSOhVMkaPhDAXQb
	RR3GcqrMRl8rnmq14fiLX5X6jB9RaXHYXaBbPJY6IRvubX3dgb5zR4Hxh3e02HiqHCeg00tbt/Z
	zZhCfvqI61WVnzcSxATBhlRIFPhZobDSZIK+cFOqf5nbet38Koej1dKOLAVQ/mgyyrf3RTNwloP
	B97Lgd3i7UCHxPsVWhq4ZYI0ueEyoHb/FsQwKlZGoBDqdjjg3XJkN/WWFe0PXINbAjTmYx2JsDt
	njoD0eKyGlJ/Jm24jBXBHug==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1173060185a.1.1788770943840;
        Mon, 07 Sep 2026 01:49:03 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1173057385a.1.1788770943381;
        Mon, 07 Sep 2026 01:49:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e0esm4108466a12.9.2026.09.07.01.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:02 -0700 (PDT)
Message-ID: <5b7c4e88-3370-4083-9bcb-8ebf1071a759@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: Split IdeaCentre Mini into a common
 DTSI
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-2-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-2-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX6D0n50znSmZ2
 i5NT3kvBQYmnoMzwC/Wcdz+H0p/2I33Nrd1oMvPJOcbAko3hplQjeHijhvzwi6ADc9yTFCGQUj7
 IANrFqjjjIVUiMs9flL073NPS0trdyo=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e7a80 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=J9qVkMaQZxiu5A4OjBcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 83KzlQzDequUVYdI2dkIh8oKm8bDmIL_
X-Proofpoint-ORIG-GUID: 83KzlQzDequUVYdI2dkIh8oKm8bDmIL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX/Kmmm6T6m1bm
 LO01IwTdCs/+3StDKJ6Rsj5uZpo0x7/xb7Ky9fQcrGnFVJx+UdH1RIuzsDo5Ay9WWaPblAi90DF
 /YV6fRY+QFzyTBEsGOzcHnnZB1Sx41FD9uPV/1ZUyXDS8dE2uYlQ5c1qCJVVXt97iwr1a1ihJmx
 a4cm810d9x4/KujGWxdTKOhJN3Dkdb66d/2FAToMpgTwg1ApoqQEk2u1pMxDcBT5QS3YORBLQQI
 /zG+inLJLWhAdnTcrjJkvWujFIpA1wj2pylTTvIa1iQsYOauZWXnMKoz1GlkZe8O+D4GH9wOnGN
 PU5n9mfabRH8FHmDo63feMils0x4AU7NHc/nt7J7pPtbjgHPC6M1ZR3wsc/3I3TyNnKwJm2bfk0
 XoZavdeMVofVGbtuoBbnLPs2w6Ofryf0IB9TBWtXbqZx16wBU7A6Hj+ezhIjqR8wfSzUc9YOjx9
 82HvH0nz/4bsT/dnwyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The IdeaCentre Mini 01Q8X10 chassis is shared by Hamoa (X1E80100) and
> Purwa (X1P42100) SKUs. Move the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and leave
> hamoa-lenovo-ideacentre-mini-01q8x10.dts as a thin wrapper that includes
> the SoC DTSI and the common board file.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
