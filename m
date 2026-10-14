Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFAB4AEBCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967591; cv=none; b=ZNuc99rNTiLWdIDhl9lC4HFbHCNHr2GXbogEddghPpx+Y3i1Jc4OLHBOH6KevSbYudXRRaIAsZ67g6ispbZOyHJIqsygKZcWp08heBqlXJPldERI28TB7uVhPUc9XPtMCywurAkAJ6DvyNyd4VIvEs/IS5L1wkTqcNk0sJBw/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967591; c=relaxed/simple;
	bh=VAmOCcySXayrvceVNgYYbOmGKQT4ami3zg9s6voroO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ3KGsz51TTYZm7uTj816suKbRIJQgf/ZyGEUZNMnWYnw/SnSNwpRkaQSuW591uxlDi/JRyLBDauVIEPdb5HFV3XrqFhxvSHFU8MFOmC6b4VpDsmpjADL+zQDH5U/yXl72ZOH7WB7xfsoBjzMP764W1QaDGuWrHpcqvrqwVT+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXTEl0qG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ig3MSsbQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXTEl0qG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ig3MSsbQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6lEir2088418
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=; b=LXTEl0qGZk4zW1Kk
	oaNJ581xTUXwP9gV7tFCygFSw4MB6EOPl6WqArlWYAwhMjTl0IedI4aUcQk3vivq
	Q/Yce/hyJV3NnVmhdf8TPFn8DkEHB4HfLltnBrSCXjjlkViddToddf/F7gUQfKiH
	qUb9qAOS//9JBSXVsl2LTrWXyyf81FMkjwU4tjwkvF2jZvAM96LOl+6ywAOWf4x/
	8ILLpU41x83l1/Q4usSrs6yLLYC5xc/8wWzH3/ljlAFysb1z4Yyf679VagjROwJH
	SGFfdgo3eXJcar8GC5Dh//SP330JZrVBn4+9wiq4hvaHSKoUBIikTBvUNuVXrqLq
	Q37c+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hx2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917aacb7abcso10490956d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967588; x=1792572388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=ig3MSsbQvLPic+D/EkgI50LmbtEECaO0sQ76fC7/Jr0Hy2Zo4t4B/9sOTo8RgSdsvZ
         46qZQ8a1Rr0VtE/DNCaxkaMnnQfdDkT4LsGX0Y67ER2LFjoCO+k8aOZBziwflJADxdoZ
         QiFt+maMIBZhJy6mKRE0XhQnJRqPazvRNOf3rgI0/SByDvkcyO/QBXX34uiBseSDHV62
         Li7t5HbTUMmgYG6FRkjwwpMsUCzt4S/CaBvf6NxnlfmmwterHNE/iFzdQx/mmmNrV2e+
         eu99ASmuYY/xTLopcLvPM+0AIqgYLgXTwyIz/yofFUhCQHrIaLop/PdEufEI4t02M01f
         e3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967588; x=1792572388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=DARtkG+64QeGtzSZzV6SK+Ss6tJeicMDxxI8QVx06Xr0FcIcVMkAgISupdO86nd6FN
         6I0I8O+nM5gzmafWEF4WiqDQR3oQE5cIW3rxmqQbuMS7W9FApxlls6x6+jimUNrG9D38
         ZuT9amn3qDG4YziuIbN78j+tOroYHtHTvR/pxcrN3QZuWJvRbT69WW/DkYWI1aCrU3CP
         xvvSenl9+S8uOtpVz/600aQg6IiJKpoEOv800YovwJ1HUuymwMFoBaqSY965uAzgx675
         qKEJyIuC/Uw1XSgPCnosTrW3htiUoeSON9ephEjbr6T8P0Sq5j+AEaQJrXRGhA/umLav
         BEQA==
X-Forwarded-Encrypted: i=1; AKwUvByo3nLlBgoVN8weOprrAkM4EcWr8cV/aJYTKydn0O+ZFuIdcV17bt1MlsSXzLU+mYjY0Kwe+fpY/gfF9JSC@vger.kernel.org
X-Gm-Message-State: AFq9FYJcjzKdvuQYDGxJmFvEsxpr/JgbzEB9BzkzBok7WFYEbsIPr+wC
	tHTaiZXs2EoRa2azIJwCOXsGJiZ6rgVY3+u1BBRVmzjWh1qc4ivkBmhcR9auTYWP8QW6zgH/Oyw
	jCYc9/70bojxvsWYApvMUuLC7JP+uv8zk9Nvl3+/nhR8FiWtg6hhyv+4BOy4+NIyBMATo
X-Gm-Gg: AYBFou3WsEohIRd72HVMfl89uF0YCSSrIghuOiDOwsfNFHZNhkANxpR4360qOImFO27
	+/0/uRE6kt1CASzv4uRFkeg49zlTBKQgXl7OAzBtlKuvUeIvvasfp1UU8WPXIV69nkBv+6Ar9QK
	TxT4a7aKem6wOvY17Itc0DOEaQcpkPdQ1bACwsSrjit4eFqfnKW04LjT92n8BbCiYG4xVNZ5ZH1
	Wals3yW4RCO7ipmBPLh7Hlf9e6xFog14xJI09DgAHtD2YZ/AmL3ZKYIMzovS8yi8Z9afaQodqNL
	mh90z3UOGe1fnVnYhX9WiYyNqQk5CD2Iu7snb3VSeVWjB/sLOxqA4nuhaZLbboAY7azZcO9Pfx/
	NENpbHuASBdAKEZoZxKBcRw==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556743985a.0.1791967587539;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556741385a.0.1791967587018;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038aa1aesm853559a12.32.2026.10.14.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:46:26 -0700 (PDT)
Message-ID: <d6c62256-1fde-4995-bd32-38c25e59ff4f@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
To: yoxcu <mick@yoxcu.de>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf4164 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXwrZap2wQtxe6
 gfR6ALww0b9Y+ZyonfMBBR6yCtTLeML1ZhfDo5L/+Vk4BZ98B/QPAx6NmnU8iffbRY4EoTi9GEF
 tAE/Of3Mg7V64vc4CyFuJNwNO2iBsu9hkpLCKu6jnfavUyoOpc8LQbUwuT6F/rKRBVmoKNwokXr
 dnwSTM3eR0Rj4hGeFiu2yKqm7/I8gwQatOgsgdUXWaGMDl7sTtXOWLat0CXT4eY6VLSq9/4X9Uw
 RZXAzbI8iBEF4Cmj6A8lP/14ub3dUCAJ9qkJulzLRnKU87dz9Y9DmOUoVsnUaKZaZr5kDVy4Dcz
 2bdfIfMIdx1qm/lpAuMUEJUeRJuXhDOv0g7mJjupV3/e9bPuf1mFhEjwgf9I5PP58pOOl1GAe5z
 vuLedOLmMPvIY5ViimpVPa2dwI8Bp9X4RX6vcENd3iiQf+e59ULgSAQA2G7SGTF3IsKqnvGqBvI
 5qlWK2egLopArmIWSCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX/DbRvBGt0Evg
 IVlfDCbA9DutrRHl6F5S3bz2EqT7COQOtPTRKE/leIG5jj+NhIx/wMjCQxkXXugJVXo2CzCl4TA
 hqiTESgYkd/ch92Q+Fq46jLsO2cs4Cc=
X-Proofpoint-GUID: xra1oBGvBw8AfZsWkK_RBMTMLqxRyBal
X-Proofpoint-ORIG-GUID: xra1oBGvBw8AfZsWkK_RBMTMLqxRyBal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

On 10/13/26 10:37 PM, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
