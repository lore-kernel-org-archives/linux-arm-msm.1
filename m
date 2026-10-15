Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D64CCDD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061328; cv=none; b=YItHs8vpM4/O0fTBnuXYS5aR97rsemdzYlWr50PBqMRNa0jakPfpMvDqD4g4WKzYLy68a3eVs0S0DgrvVGJNIRmL6DahotlwJBN7FFM5lV0OvBi3TOkctVfP91Uy4jBspItSBAmSXvEs8LJsLtoqZMV62JwU9fBz7EuZSBwlrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061328; c=relaxed/simple;
	bh=gkVjJC6goWoZ1wVSLbVPp2ny8CQGP2kljYYcgJMcDx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtzeVp7fnBcwemYFHtKT5yb3+TupgGUADWaRDhdHPAt9IBbakA0nbCWD9itevyOEVyhVdj0CjpXDWANZy8tDA7DbHsclkyZxO5Sc2RgPAKLYjRaLtOg39qkV0PmTFTZEE7Uy/MWKUA67cy3OIks5t67BUaX+WQexrJgk53+km9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGEzkrva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok2VrMZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGEzkrva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok2VrMZ3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZla2966413
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=; b=OGEzkrva/xzsPw3k
	FFF52HXYiJffBL6gde3MMJzNJtVzIncBkLqoZen3uOFl+kNL+r0zdeTgyj5Dz1Qk
	T+IK2oulH1tDGYGdm8AIvUWPISjop6R/4Wjfb2Mm3pg2F0ura7Yx8QZ1PgPcMOPw
	hebYv4ZrM2gBo2eFdZ9hf1/6/ywDmG4DPJlfc6Cw3FkRoUeJpTdJ3eCjZIQe1Zkm
	+60p0vrAmC9zU2raXcBMcJH9YBA3IczUEok7NH02V8TULNNwAtdAKil2iX6SVji9
	iwVBtx0KzwePLreL/yx4b28Zw6XjhQ2Oh4e0XMXU+bdBhY13n9Cy7RKYGW/kBUUm
	l0nREQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wun5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:48:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91782d0a163so11935066d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061325; x=1792666125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=Ok2VrMZ3ziwiSMtFVuY8xp0s4hlha7ud13EkWTg21K8N4TGzgVjYpwsHQajUbbvWhz
         FQB8mTiDNgJXATvlsUSC5jzVW4njx525VzvFEqQV2GCysielY9TnyoaONb+T2IG6ufSV
         yBLK2iuqtHUJ7fl1tAkGvGX4Ek9/pHzvTcAgQWlS21jEXDa73xdJKQc82nRuF8RDw8iF
         4g1OtzwDyy9YJ9y5lePT4k06uK20JuneHrtoy8Q34JUtcUUDyVMqUOYZZXWQRkGK5AWi
         OW5DPXhS5M/rV5omYOiuaoUmwD8JeHOdvVKRED4abZqaKFT2tgsaYemPbBlKLaogP6uO
         GUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061325; x=1792666125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=JXKqffIylsQ5R1GYUJXolaXXucxMuxl7Ipyd+OTfkM65EHJf97LvOLMrjGzW8+fZ2I
         qcWpu6cVa48BwaHQ02M9HcJJLhPg4Rm8sF2Xkn0RbKea9JAQFclaG33fxdcjS75iy8qg
         9wZs0o55NSTDLLOqMQcCAQwcKAYH6rMmclrEVy2C+LM9elR2b4fmro0hG1z8B+NqEq/X
         ExCRZKYdPRIKVepdUYu5McHgPmlF3Jj0bDE4ePGGHi/MF6Xiu55gkJk06SdeSbg5aSe7
         s52I4Q98HIqNEo0RN2m2rUUuppncMJpCNY9LaedEavYFJ0DEeu551AbT6Qj0y0Fp5cl5
         KcRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQqy9jWW36JcSCRJoZ2IE1RTn4iAvOtSKNzS51++cl/0/nPz0Kf1Mxd3LcVuwQTgRaKFLhfKvEHD713pXK@vger.kernel.org
X-Gm-Message-State: AFq9FYIzubUPoIh55VbQxZ9lVSzYfTW9jzA7nW9kn4rbBq0vOIClFVgQ
	9KPzbdsiiUNEWIUW+f8JZx0UJygDZmBpyU3ZlARIkUKDvQarlzpKTDXvAX2FVfBv/eIMfcXqv0M
	Dibe+MkFrjocf5BshTPR49VkcAykQoEqU966wNMm2DG4g1bXH1xkxGVsJixMBcy7esJEU
X-Gm-Gg: AYBFou1LsBiswed/H6dMC2zb8Gxb9CcMmBpU6UFXU/Lmg/9zpzFiaavGuy1Y9Z692Wt
	Bvml5hwJk2b7MSlNB0frVKuPuAbfy0lPYnBTHKFsKlOIZdTzFX8wQfCOF4aKRRgZB12KPy8jkLp
	gJwN+lxamNIt6CgW1v2jKSSmzqUGhQxcxiGT/l7GFg4RSodD/ZDnRasEnAAO9/K6V3TK7YAJv3A
	4OvKg/VxMlwIbNTzOVgKwP12RKiHbf71/WQ/T8I5a2mOG9PtMOsNDkFaAjFw+YvI6QK5hVbcgdy
	yHu688aKlGsiEmFM3rTbw08OgtaylsHxjiXqxNZJneuWxTWoGZluGjX2Rcu8WFqws8X6aT/C5KV
	BbWk6P/DsMTO6QD3ylw9k0A==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641738685a.3.1792061324915;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641734885a.3.1792061324391;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e710sm109029866b.20.2026.10.15.03.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:41 -0700 (PDT)
Message-ID: <da480a5f-ac8d-4dc7-8358-e22cbccfda52@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP &
 MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX0Eroc7wV5INS
 D6flhciRblGsN5osb8Ho+clqJrQI1xXgBdvgF+IoPqCwOvfFnfq9p8y89UUBY2gnh8sP4GJxPlo
 Lb3ZgeHaQnnEiQp32rq2XhcraCqJoo4=
X-Proofpoint-ORIG-GUID: -SQGB8ogpBiL1Pe6BzZR2QCdAmC6EXem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX6mZlTNySqZ8M
 n5TBL4FAmyp/7bhf3IjSP4YOnzYHZdTM4BAt07gQmKxfEwuUJiQlWJaiTK9d87enLHKC8LjzHHS
 XAo5f20NlxLYNgCZZ3NxL2XZ3tCwa9fru0kbjRmE63nuww+coaqJ3XKisfwV+T1KZvDiLENj+Wf
 UcYdC5AQsFQPdOpMROkb/6prYRkIa4EQuJomlSW4P5n2GSFjxpgWP28d8LRXXOucnE5Nf0uwLxC
 yitsb/wCfg5vPGxl3b/f+qvHBzb3+ApFQzmEG4x8O4zAB9YUYHHajcMuky7c154Ko065mtC86pe
 Mooat7v9JPcjtPqcqOTmdXc9JVgIT6RCVcREEbjovJbOxCXNhzB+gZTBp7v76sh6VoWXbD6EOL6
 8u0LpPlhOAUBFcnqzCk0h3GeeeeZqQh3bvOJu6CHYJqhw82fZRTdrYiBjBZjvP8yB+0eKHBo6Um
 Dkkc/zi9apxLXZeAauw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0af8d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=81bJPUnbi0zmkLSSE44A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: -SQGB8ogpBiL1Pe6BzZR2QCdAmC6EXem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the ADSP, CDSP and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
