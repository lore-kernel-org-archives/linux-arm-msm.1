Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683527A91D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556828; cv=none; b=AiD9uZIorwqPAiEC1WNHIZA4mBBa6IrxXeGLLRPm64mMXyO5qbOJWRMigFDt+hroucbL7ZSDP2g7av2UUmtn/jixJk3KQpFecRF7tUxMpI2wXDAm8eP3UwccDQVXsvJVQysuF8v7gerS8GQNZ3vM50Mxe3xahs44EWzn2g3OxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556828; c=relaxed/simple;
	bh=AQ+D0CDJcFrq845h7p154JycCUGSb+Pwp+Xd7q7qs2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WiY989w/yrT0eey44aEJhn9D4K9TP8lF8zdGQdSapJRK28LibySQ8a8Vofp87IAKPsSEKh+a4mW00ZVDycGH4SIt+fhBaY0u38wK2jwBB5yaNhNjTbYznDkspFcDlrOqY3+UbqIftj2lTJjeKn/Ogq05PJkC4IxHhKWD53dHe2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdq2CNU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwmjLR71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdq2CNU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwmjLR71"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCYO3066897
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=; b=bdq2CNU6LLg4uN7z
	fxiM5yMcKtA45RGfsjy8sszAyei4SwlnHf8Z889rzUfV2rzvxah39Cf5T+5g9nP7
	S5gs3dW/x52RFVZt7CxuQewApWotP1OM0sSVjXCpjEJdEf2t6ahMPF8NZVU5LPcG
	LNyFAW8Q5D6/5I9B9hSjdkVC5OQ9pVttHsha6H9x3B/XNt/ENcUNErpOFtuEQPL2
	Xs7ZGxdFvH/kwDJ3krHicTjWnIjoSSbATUcKSiUDvbZAwAYXK6b1huezRiRes5RQ
	Wbrhi/F+2XLPVAIM4W1l1vusc2/RSXciZPUpQ8MsQvXVvu2UB3fIka/AwcgRBRK1
	3D1dhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphes9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:33:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so5451061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556826; x=1788161626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=;
        b=CwmjLR71pTt9ivuKcz4tl49V9kaCTUZh4mTRv88LBSXIXRTHDNxD5I55pvwsAr0/13
         KsXOXlG8xTWcKgrBvX2K8//vCA+m8EMX2PpWa08vOCc/AsxjA0V7uw85GHbOcp1rqVx+
         MFAHhoM3ARxOst7i2KkMG8rrNZ38gtleGeVq/iqyUN3xbXZ7guxm22enznVZ91CPRUJb
         QhfqSJHDHA0TBIsRKwelIkCMvFr8Ce8X5NOGa5zGrSjvtNYaDRbfLKfS7TRV0g9F3YKQ
         K0fN72BjDpMeexMeC+iP4B8rRYs3iyRKhIVEbuQzrsVUmj7tpXU2x28AxvWS9CDoU1+B
         eOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556826; x=1788161626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=;
        b=WfQZwM3wNFegm8GeevEwuAP0uMtBJM1+NcFDD82Go2IXw0oRzA6psdTAKzdYmCZqIT
         Bsq3Ahmg1dOX7bkhpKYpF3dZZyD8ue3zFzZ30EN80JP5vAjmPWd2YVHixRRTZZyCyGbl
         T1Qc3k5R/r/qvRA64kkPzbz2Wp2y9gHrjOyhQEKZQPMdkofIhPI6Jzi1Ya9r2rzRVFjH
         h2OM94nQcpiyl/MeeFWx0f4uXmgabXv+inxJCsJkxDl1F27vYGIb2iwOmfjA/0q9t0WB
         +ZD+5WtGCG0CnaH+Izk5YSfeV9a7H+thcWxZjTwSW5EPPg+V5xJ0C64NwVsln3Lf0oUb
         m3zw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5E/n39P/1hZre4EB5EFnELtA2akHytZ9rXetYH/1wKUTDmAKhkmlpnLIKU/37QLQ/Gm2n9UP+yJTfq/CU@vger.kernel.org
X-Gm-Message-State: AFuF++lh3rD0W7rm/igofTFosDere1P8Yc7fBm5nuVwEYHrTMCvKZSWI
	Vm5pULOg5TV4xZy1croc9ycYtHb2nojUaxM+k6wcxH54/i7aSIj+Ptaf/7UkafDXAQqvrO2IE6y
	qtM41JJOwoV9HoJ8oTQGJZO0ghxa6G70yIekS8ApfdYnUbf0/9yBHFgiPjngvZ7Gkw65c
X-Gm-Gg: AR+sD11LoImwIdmjRFnpBDZO+YMsnU86CR6PJ4KKlq3n77UiBCM788vu7ZwL3WRaqm3
	NmiPXWlVsa2jMWyBHGHqOrWNZZ5PvRVib1Z2AiQGBgg1fXYjUakDXAsVyZ5lUPiEhvfEOYgXorv
	PbU21KpezU8FzNntoiGc5qsdxE/nXL1R1A/xgIT+JUyomQTZJQRpRzQ/ItD75P3PzULO9xh4kvR
	XSc0FmVXoBktUh2tKY88iUaqepHusrHJzhJuvtBjF6G+vHiFACas+YpMLQV8f8vqhZQt7uZjvax
	LxSKdWs4batyVWSSxsZeLmJoY0zoah/WLuSyn0jIdC8LSQxHfjWuJZ+YpqtzkMe2C0/1b+rStNI
	V9MVyCQ7igd3r4X/SBh7exMNV
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr170432391cf.0.1787556825607;
        Mon, 24 Aug 2026 00:33:45 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr170431561cf.0.1787556823723;
        Mon, 24 Aug 2026 00:33:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm1095552266b.38.2026.08.24.00.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:33:42 -0700 (PDT)
Message-ID: <260ee89b-a839-4795-b0d3-ef381734bd26@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable DisplayPort audio
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX/2s/1Ei1Miro
 aL3JrQYUh05tjI5xWMtjeznB315h6cvESvw8DjUmehJ72hJR7rhE6UyjsWopxXWCQT2A1EbtyGJ
 DJRv1sW8i/DnhtjMcJCakKyqf1KefllipIMTrRuMmkOGfiGxnpGikIm2sBQ1hbZba7Abd45k066
 JiB5yjSpKnaEIB1WsX+fCj053sKSIqNshqud9WIfI88laVmcbuyv8Ftm6ZKpaAlMJDnD0AqzooI
 bRra5ZwjKVI5IIiscX2HCazBhtyfVfQvEgoe2OYKipmukP9agbV32PdbqfwO4QtBND3JA+61TX1
 P+N3aYH9yHAw2IJC5EFjJAMaCihhwNkBf9PBfo+0AiegtOn7XYo08u7CvvvWKjmMRzkdXJ1oZqf
 1AGPTAp6Ig8qs54xe4a3WEBw4php31TtV3EUSWyt/Vlx8OgGgbe4vpCYFi8DBGeFTzpbIOz744X
 2vmz/RyZSga34dZGEKQ==
X-Proofpoint-GUID: dMcNk-Yz0JFtPdbob-FU1zrjaY_7LHce
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX/TQCX2GXi4Lu
 j6igYlyVXABsr2/RpX5pi4xBlo7Zmarp7LjPyR8e/RO00ww2aiy831lC+TGwmnoqQy0rm7s1sHG
 XGirXPCx5QGEvmORkUhcYxEBI7LMvf4=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bf3da cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gxl3bz0cAAAA:8 a=dlhiPCt_JNRidUjbL28A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: dMcNk-Yz0JFtPdbob-FU1zrjaY_7LHce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240065

On 8/23/26 10:35 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.

That's a good update, but it's a little strange in a commit titled
"enable DP audio"

[...]

>  &mdss0_dp0 {
> +	sound-name-prefix = "DisplayPort0";

Push that to sc8280xp.dtsi, please

Konrad

