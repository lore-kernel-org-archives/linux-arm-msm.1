Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670654F68C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902695; cv=none; b=sKuO4wTii7EVvIabuKk9DwUJTWf4dSbUszoZVM6ZaliUlwtOExm9Niqk00EyXqMmkPydOLT08aqX9dkO+av/S5+Oua3K6em9E6euovuqI6LXD1fVAvmRcnxpZH8tBSTeNbbfQ9pqtdJx/ioUbwVkrRamVdVAjAQikhmA1lK+3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902695; c=relaxed/simple;
	bh=hwP37cpMczyq0SyfyPPgo0PEVEDBe8eAaeSNpuvc5x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFkaQZGdMkVa6CbI9+QNU/I+7Un2Q0fZC64atlnfQ8xXKmV2S30b2fFzfYmCss7jRZjPi0o7+OZ9IPGrcrvyzXhCc6kte6/fca+0UqogB43Z3pwwQoJD5NmgQA7ImaxuewP3Ye0ZnDj1sEAgwh3/wsYUCjknyXguuo87EmBONrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJEKeZYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoEzo789; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJEKeZYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoEzo789"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4QsD2571123
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=; b=jJEKeZYpNFKDiW88
	82aujY1TiobMCa4RlaigQh6hX2aolJMzHOxVnBTjqgCcwpJKtZH9Ma4f4Tde8ysj
	gx0akhTgJf1yd/0Q3uBgQFi/9zctLFIbkcwIg9sEfiNiOBnIaWKmAItswDuwJVHS
	qZiIxOJvWJ5cGxRiHcDW7gh6eMBC4ecJLriNE/pE7Fy//eizdO1IfFysp3pxj12B
	UMk/QV9jMwgvk3d5wWQX6BPiKRz4OwDZ4YEG5iidprEH41UH4QOiSrclnbDpQI2Y
	OJt9zhvGcPP/wAGf/kG5h7I5l7r/xiuFC3JcohJrrGiUsOu2CP41ZX34tRnVFeP3
	6veqYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbg9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:44:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso22649785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902693; x=1792507493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=;
        b=RoEzo7899derSOCdjBXi9ZNsWz+5Jt2Si7mIiJSPKL9MMcgGXMUql2qLbM4a2E9EIH
         LpKhxyp/FmGLwwaD8dbPq75nWzFpMaKmuapU8Tx2Tne7TQNCgGLYY2JY6DF4fLMmyo1c
         IHwj3GQOq6amkw163fKns6Ub32ppYPdutawR9v4D54nHv351Yd33CXfxJNt2diXBufma
         lU2sOvtK/vBqdisE+uPPVbXSI19qEX0+X0Zycppmft7qbsqrPx6hzCbwGGhdFQp1WFOj
         VwZtRm+gsuVtFGEKoEderkVUMnER0cjPJkuffHpKPibUTDwp6kZIbfTc0oD+VeKVO9NQ
         yBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902693; x=1792507493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=;
        b=Zv6TAhdy4mtJRLF4aaEVgElHmiGJ1KhHI0UdZ5g8x/0LVejy4ltxAaZgqrA+39JJPi
         lOpoKpFWyNifdNM8O0BX/XEEjBxLZvDgRYgduabKqL1id+HiBLHNCqaCEgF1HTiZq4Lx
         CNe99Jxhj6WF6/6wq2scPHODCtK4la/dVL4mzuUWQACwu9kZM4pjK7NPqejFpPHKrD+P
         xj6YOur3aMI0f/S8kC018GhXuZrhllopi0ONXWECHdHtzki3CadxKmsTFRmGTflGJYMI
         KtBGehcrQZj+ELgocAZIQb2gC1AH1MoTcDQzua0x5jEv3iC1FWU3tZXMmofN85v4uETI
         5wnQ==
X-Gm-Message-State: AFq9FYKBAKjsZzf6qomvDLKLprGxYr5ZV2p0VVYXNd+wZHEGq5fWrH9W
	C2v98DhpL2KUe70CbaaI4CY4XGGnWPthIGpETm5yil03O4wL1dvCm0M4SxhmrK9XVAr/YmuOfF3
	Z565dxxXnY2o0WiC7mRcTZQQzITj/XwEHSrqo7YTIqmfrxDNkuF/rIxxvFXiJgT2QZyM6zDuj1N
	Vp
X-Gm-Gg: AYBFou0vxzSwNsmj58PX7F4Q4t52I8JT28R7Qn9phUqvxK1d7drkdb9jLkpovUr5WVC
	aHySCF9ajwtb8W+lJ5DQb1lPtuWpaP33SRJRNPLjcCxfvba6iZf+BaGS3sZw3WRUAO0qpqVJLC7
	HdVrrRR2iaOAyWtBQXUqH5n5rv2fXi8rd9azY5TANqtkOT6QCEURWszB0vIAE6kVhJxZtR12dvq
	d3M6Jrtpm2Gy5ovJk4S+R64/xxw9KNVT/FR7P03u6TFOkuAkejGk2UXuqh+2hPfya+52QB67WWj
	6LKVfWw0b1Gc9bGI5NuIaEySFvQEUZXd49mt2AIPqx/D04h55W76Js3OP8H4z3d7t2PPIHKp3ak
	Z/9R0lo7K2k+dUUstL07Ttw==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2560163885a.3.1791902692605;
        Tue, 13 Oct 2026 07:44:52 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2560159985a.3.1791902692091;
        Tue, 13 Oct 2026 07:44:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm6636032a12.14.2026.10.13.07.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:44:50 -0700 (PDT)
Message-ID: <071becdc-c312-4cb1-a7f0-49f13abcfb29@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX6SgnfzMz0ivb
 kPeBnYn5GRI+Ua8orsgxRnSt2hg07Xjvmeg3OoY1aYyUrNxjC08+qrVVPmjerkxCHzquMjUzx53
 AfSWC8lp2XPbpqs415lgviVTyDE/qdVHHso9ScIdJnqo66yvcpavLgoGHmFV9iAOat7L4HDzqt/
 sVZiNTfEvkwcVzm2MBf04okLNDoXtfuPgb5ujVwwJfmdiQwUhnLO8VZ5NmkHrEviwZPFrlSL75t
 z8ncMYgLgEmYGtb7LDg0+ElPRnoPDdNUn7tx/ZltLMbTT0OqYkQaW247ewQpYT60WJxr1mm1uIJ
 35EkHvIaeWtI3PdXs6Q3jiDtEtrfmg3wDh6FZT7cyoIdZ0JIBXWRzp60Y1aaJ5PfhwLmAOEU0kU
 0rdo45G8o4Eq0cDyrbsqUFbivoAqaDQkQi2usWtSn0inivcyQlnHP4Iicb1W1FmsTwJmhYzkH24
 L6CL2/ZTElkhgCE9wSg==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace43e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q6H3BXWa3Vqah50dtTUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QTn-aS4_RMpzvdYl9E_x6FexBR7KNjWE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXxwRfh3eB55ZZ
 e/NTFNyZcPAe834/1OBd0oYd1nQwozI9R+yr1kjibwbcNvJlfnlaCLp6rGtGHSl7+Q4qmPL2mer
 sG1BvoT7onLVWs1/1k5o2DXs7Aop/mo=
X-Proofpoint-GUID: QTn-aS4_RMpzvdYl9E_x6FexBR7KNjWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Enable the support for download mode to collect the crashdumps if
> system crashes, to debug crashes extensively.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
