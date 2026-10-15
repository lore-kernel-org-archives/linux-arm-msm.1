Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6D4CDA2B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062806; cv=none; b=EFnVKHVMeddWuIzK59lqmS1eINcXKhjoc+W/WsaQXRcJXfeI47kdDlYVhAluAIDD7ZqiaetaIYD5s5Rv+6UngyGCtji7iGRDWfjI4Wy2iMoM5RLoCQiNqsGC3HX+oO9/u6fkv9jFq4JsaNAbOdBjudi9G1a1a64F2TN2nLhELfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062806; c=relaxed/simple;
	bh=0H8rB4746cwuAjwGUnzjcb0Ri+Ub18EjCtxmXFAIPus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxOHZ5yVFLt7D7apjG1GW+eEMVo06Skzex3DAZFFnttWtdzgnTnANWU2gZJ3mK48v/kjUJ+AGnZizuyZ4sQd00fAhimz20NchHLhzSNW0oCp7PSI914V38DRYBnmFppiSckFX2Z1kaAI74JY8SQkKrUP79dvNCJ4yaCHzkhGqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp2lIJVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/UnAl7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp2lIJVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/UnAl7K"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkHs3510589
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHTTYf5sPxZlm3Tzc2RndpuThPfXxZOWlCNr038mRIU=; b=Fp2lIJVTtJ6213P/
	LIGNoR9y7uKiTBh2/1m+M4eg8aP05RiJU7DHft+QSvHcVv1bcCi0eelhP1e6xi6S
	GNrZ3Du7yqi0vw+RXOlWI536YIRIyj9DbkHlA7PzfaLmojN+J6UjOE/8CLmNHlxT
	vlR+eHX8nJMtvLUv/haCi83Hxe/eIJ7CFjGT2fi5BwIPmoP8OTVsrrly6ZaGp6LV
	OtYNRn+d1XFJwbHMQnarDKx/P9REYk8cuEYVprCK9m/Sq8XYMrvUg12y2u+ll9BI
	kRNXigkjiZWG/m3GhEOMO2RTsDvNlQQ+HLDrQCQKE5BYRrQiMGGPQ1qsaeT3nnb7
	yCvUTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9qeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:13:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e58614290so36825885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062804; x=1792667604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHTTYf5sPxZlm3Tzc2RndpuThPfXxZOWlCNr038mRIU=;
        b=Y/UnAl7KbBmFCXVGxm/WjiBBPvhDkRogeen2gmKApr8OqFwxVBPp1PhlNW0QvELa/Z
         Fbjf6wTTNJ/tL0H3iaCJqaqhwciUvGjn0NCChFQb8BNg3lz2n1NEkmHx4xIR2NSmR2Ei
         ULt9Laj/FRNsfol4/MC+YETiTfZ1cFgpjLefR0dxN/kw06WTPuX/lEGpqcfTt/DMB+By
         x24i0bVlU4pl1EZv5IE7gUR+JyHsinqBv3ceIn21Cqox7BsvCCqT/u6zUpwX2dPk+NJ5
         3S0Q80YuPRHlkkkoqbX7s1at+1LGZJkv8Et9lEkWgQfsBE4Ad7UaRnsq9SOstHl4Irxf
         oUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062804; x=1792667604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHTTYf5sPxZlm3Tzc2RndpuThPfXxZOWlCNr038mRIU=;
        b=KVogVlWUixRVsPz/PQWErgRtpyYY3bAJVfcW17IZW2WmX9awOKj1+4Y4RCYW/wN7H/
         47/F2nRq86fr7jDJHvWjdYo8Aag306jOgEoFlrZKw9xTOJxfP/7Lw/XIz4AqsmDMYtmI
         2ncPassZ4/eUFweTgdmeUQsYZAuEsgxtRIeQ1MZsCOwmE2rmsxFt6C3IVGGZq0jjEuhp
         mGnFk0kyKaRf4F8eYrMGh2IQCw45VC/dLZaqL7XRF4ebDMQaymjicwyj3TjIVTkeU0+7
         EcGRb6TZlBM+6EoZbijHAdA7Cn0Uu/0FmUtk1mMyQV0dNVA874rIgDtYpttegA626crt
         fFlw==
X-Forwarded-Encrypted: i=1; AKwUvBwvK6bPmtA2K8Jj0aScue0aqPxCVkk4eOaMErZHcFHpkWvr1Jf66LVDl3UUtH+MI9eMiLVJfmqsN1jaYegv@vger.kernel.org
X-Gm-Message-State: AFq9FYKaTK9oCDNG21NPFdL3eKjRLxuK+evy7F9YKgSnEk+szPp/hLoZ
	+t37oFuTjU3SCcQ9UHaBju5NKT/SRQh8UQeKSkSme17S+5CnvTcziGUS/QLiu65TujcgiFdlvKV
	SNrY8+Kg8GSRU27yH8jm3Z16BMrDpbQSEMOjxCPvd8o/mg0tRq9b30NM9qhbwUSSUu9Dt
X-Gm-Gg: AYBFou00KI46f31mxFsCxyALmFrdSWLah5Lxjuyh6lx6Ms0znGujIO/JiiuKnEp6vUU
	CKUTgBvhnN+bd4fsqtFZU9nnDhgRwdO2z8JonL7TIGmdNttLP3T69iPcFbujsqyFMYWQClRmDiA
	P5z3H/2r+x9tfODn0Eha5qTjCw+Q+44KzlvwbYXA311FYrokvbDmd9IzmiMQV5HgGta7juZ92GZ
	utEQyNsNwKIew1/PIsyc+ngA2X+yD++VLp1Vp65wEdnmiLw7JSWUNn1umA0+VsMaxbgrZM1IpfN
	nYmZLDwsY5ofkZfDJzW0nOvZKBbZTc33/PXe5uwhMuVXgWSWMyNcpgNUtpbqltMfUGXMPeNe6pl
	NphgGskcEwe8FrhFBeCMSTg==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3152466585a.0.1792062803615;
        Thu, 15 Oct 2026 04:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr3152462585a.0.1792062803052;
        Thu, 15 Oct 2026 04:13:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839c96sm2295164a12.12.2026.10.15.04.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:13:22 -0700 (PDT)
Message-ID: <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:13:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XgElqLObKQfch_BcwHepmW1-FPBVoKU8
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0b554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=I9o3Dif_SDxZ-f4ivgsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX6joOnwTveKQI
 2KSjPA6Zvq16/dVLjDjSl8n1IxvaXnugLFDR4iRaqCW0ymP0nCPTiVNEKkc1aY6mkNm8c04W4Z6
 okq3ltdv04cw2wZGM4yZL16D1QwkodohHbNwCJGgkcVJemXH4PQUODP43VMncsX35LNCFd/vAwF
 ZV88PhZ/ULlFBndMvv+pThGhH9DQNYiS2RXWsxTztqplPwu9rx45yjfDNxOa/eR4VDSU9/2CldA
 irRfQyrwPgoySvyDOqA+Fbvbs/Hl8lR6nDKAv0PfgO8zqnG+MXVrkLFNuE4nYRwP13izs9Kui7f
 HY4CFrZChldgUYwiMNgdUzgrU3ymrXGf63OJbK6xuOC6H7iLAetvyRuKgR1d7AJz3duY9AeSHAA
 lBpnvAw5iyvnMgx/F7Pr3f8q6x+RV0U565UrO98KVFM0VFEETqmiJVtEhgbg9EAsOOebrKdA5Ft
 VovJbRVue5UBTMBOVIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX4gbtGyY/GrFm
 4DgMQWwLm23KrQpU1N9N2esbp4+Bd34alZ+P+iBC2P6JgSOqdx57J3eBYd4RcS+SkZU/WUMbU9D
 cOOH87CAurwzh8vQydY2OwrM84GaFp4=
X-Proofpoint-GUID: XgElqLObKQfch_BcwHepmW1-FPBVoKU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/25/26 12:24 PM, Gaurav Kohli wrote:
> 
> 
> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>> down before firmware reaches the end of its mitigation range.
>>>
>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>
>> I thought that was the whole point of having the critical trips set to
>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>> it off.
>>
>> What happens if CPU gets to 117 C and the critical trips are removed?
>> How will firmware thermal mitigation handle it?
> 
> Thanks Abel for review.
> 
> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.

Does the hardware mitigation just pull the plug, or does it signal
to the OS that it's about to? We absolutely need the OS to be aware,
so that e.g. the filesystem will be synced.

Konrad

> 
> So the CPU critical trips are removed and the firmware/hardware mitigation is left to handle those thresholds as critical is not helping here.
