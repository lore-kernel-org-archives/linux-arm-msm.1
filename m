Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F244E67E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388626; cv=none; b=TcRrVsfJhL6goudh8P7Vr5ly5HUbkv2KgdMSyEhSgQfer9utGq4zetQwXcCD0xIWRmv0E5Ol1v16lgnzNo1lI8xqhxwenXh/9liJs/Afi1wh9Nxh/kh9l8/haq5BBgRRM/k9K8jfVLazqYfDVi6WXZ8rFBgL5C7uguL7lgF6cC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388626; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBpwdsEKWvdUFqsmrniX4XzSraliCa6zaaD/s0i2QgbaGwqhkCLcWIF/B/qFB/s/3l9YlBK04Q5Rf+B7JSlbQMYhiHmWRlK0tYU5GiFEmmWFe3hAv0r06DvPMLsdCmYsBzDwrOjUvRaPs/c+TV8yhiFKwlwqDFqURB019/ysO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWiZ+hpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOFoK5c/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWiZ+hpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOFoK5c/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2fC901958
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=EWiZ+hpR34JIqbYp
	IpJZ3212ago+FCdTmeAIMLtmarySHiY+xBoGwciDgfDvdL6PJ0zsRL49ULlpNh05
	kJsCXPgK+UaW4Xo4nz/Tv58Vjkh5cBPhpUPeG5IPsGqcn1ZpZbm0hPYl8/s18Dbm
	O7z6wBDI/oZiOrEOovBVbcNKLS4P6RynzFJNWCWACZDNmlI7Hvz7IfNkKEtWKqlX
	Z3+1firrB0op/RC69+B/cRYdLWpaVR8uj+XXIrOacuPhVbspftd1qomGR0xgBLM9
	XyUlMJzoOWQSXQsV3ssIZACvqe7o8UH+rx2JTgzba0UcUSMJDDbSO641hIsdJ3+Q
	mm2Uww==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrttk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:23:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77969cb40dcso91536137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388618; x=1789993418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HOFoK5c/q84IkBSYU3UWyoF8T59RDXHSAp0whQszo3LSoNi6Mr0i0XHrkesmBPQxM/
         uusO7SO3nmZZi5rPnCyWaShcQLq7uv6TbQ1UyzqC6TvwNiDsS1E0CkxJCvjFJLG6a6+o
         FxRJSjHX6uqJnmihpVcJuC3baT+VqyusjAj1f0CVQ/MLZkIEfnaReJxKvy3/T5VnLYIa
         R/+IlFwnuoMgPi4ez+7U9OC/GElASyNznlZp0jvV0A25ivllepCrgVjuvcMZxXi/H9ej
         hRD5iUQlLOdu3E0fNg3eHTv9F+fLT+lDwS/fIMjfpiwyorBegskzEme58nr0UY+vmzPQ
         WtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388618; x=1789993418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=irtpPisP2f/vvpoW3YTc04PNinfSl5A8WQluCT3NUQQC5Vau+g0GAqQSK1Gq7mvbyd
         lRROkfSkzetEw2h1v8wefM+XrBK6wW+JiVaZzjjPg7qEue24wRvHT/Hf8uT9z/hQifsZ
         L650tyyY2CVlH3WWOr+aW7e4lVmjWXWKs0XDum43Di/MXVOf6XgcMAVCSLQWNQUrwtt9
         hOxCul5hB9KYIbxpIjmd3EnADb/osqbRORRcGMEFp0rLxJ/ohc2GKW48Bx+T0n9BFey1
         scz8O6vNJuNKKe2Qaw60g03uO4PMNWjWBTiQIwkJ/tjaz0mCcvO8Ri1ZzZbCZLF/P2io
         f5gQ==
X-Gm-Message-State: AFuF++mxoRUQgA7mRJoH5jqRLbNOpbOuj/s5RFvy9iAARn2rrA4bDT+U
	sYzSn18OJmDQcuAD4qK7bsLy0J2pdgZwAFDDnS4FLIk3vAuZNZf2oaxRyoTH/S8RStiMTAjLx7o
	pZ5NOLMpUmtYaq3jeaX5uaV5jOsaC1hFg4VOX539xdjx/ZCXjUv+FchARJRiby8V3fYL/MX2vSE
	CS
X-Gm-Gg: AYBFou1D/zOv21Grj84W8N8HoPrFMn9EG6cxS8UOa0pJ/pCwx4nYCIHoHrTrbfysCSN
	KpVLZilPP3JntrK3qeT8KVu2JK2JYiua3mk2MDriIcstcARpRgt8wi/5OBS0Ht0c4h/Yc6SO6dt
	sMgrtNRbIzTodKVAKYvWELqyjqsbHGGR1ICEcvP/Lmv9l2sLe+NeiZdr3VtiWfJ7Fzx5R0904vS
	wHd2rJTBsMto1MlDAhuFD4agncvjLs/6gmOmIpiSAEyMVeEn6nsP35oq1/CFOfZ9dfadhgyaPfn
	lG2DN4s0Ll5mBckYf9UJ8/2gz7XVm8Wxv0MGLUq9JiW6oO92ccDmMKLgtrw13XcOyzi9i6NawKC
	vopYAx7o91vLKyNA9TjncJw==
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283600137.0.1789388618405;
        Mon, 14 Sep 2026 05:23:38 -0700 (PDT)
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283591137.0.1789388617945;
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm22882931fa.34.2026.09.14.05.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Message-ID: <059601f1-d248-4251-9373-8126c2403470@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vPE7jGWZxAThqmZVOBPVZO8rCZgAqIiC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX1jbrhyA6ZaKp
 tYqmH2WSL/D/n6bcuf/AeqV9alTMazu9aLVaiIw+O2zcHUyvBdmVnx9EoNX/7yTfejvcP7pynbk
 pj1qxJZv93aE7VRDJUF7kVMEetHZrzo=
X-Proofpoint-GUID: vPE7jGWZxAThqmZVOBPVZO8rCZgAqIiC
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e750 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXwXhyHzaxhEXE
 ftsFvoQCsp0pXmZo76FO+qcLHDxVmodKjP+BQfoJMIIoM2HzNSGDT1au16W8npskB0Me5OFScTg
 8F8PF4AFOe11/K0g71ntrq+s/QlYEMTLEoCTJboKme+0VwVsvw8GFANQvuI4bdnAM5039zfzcaW
 T1VU7nvvond0M/oAFapK0eQlqRQjmYgRzM9GXJuIaQH2Da8O3IuXK4vO4DHmYOqgYZ37elV54nM
 4gA68titGQwxDELQZxW10/Ik5L1cSFqjyiekATaATgHWYmZD0GgTZqsLfxxW7jVhOfV9rZZ8xry
 E2qQ/kNMNgXL88yGw0nzvCdHDfx2FU90kk4L6BlfqHf2U5cMDT8ORiPoYSZYHEo8+Etl/4vq177
 v9iZKVSm0DiCrTWKtUD4dlTWpJtm11gnLLrr2iRLzbEqA70HLZb+0w1/ZXQWX0FvM0WjLGhQ4bj
 Xg7qaftTDoypaaJqPzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
