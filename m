Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCECA42A177
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499455; cv=none; b=rILjohgkJzfkqzZKA5TejBJU/SLyxqrj9MbiNiZU2tNoqXkyvUGVHmFXk/dq1FYMriRxaePuejb++gnH8Zy0iOJEPfpzvZsmmti6C2qF8wPNauiDEAwscQ0Td01i7Ekxv0lH/pxhWcVjdZ5Qil84svdUw4dPhFEJZa1lscbTa7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499455; c=relaxed/simple;
	bh=AT61HUd5Sr/kNlWaDc3OcSlk+XsaVzhn5dCkwVJtWF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lx6k3OcKaw5CVoNiQzxFw52QU+jtfyxrD4C1H9My5XsyjopA22IChAZlpnPIBr96Q4nUKDiHoWdOd3G8tEP3AeChm5CE59TCrdnSTNxz+b21+NAAibftwdp8fUMEH5z7WHuW9JRTYzpTWjy1dgOB3sUhupqjWHOvkFWFZ+TKOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpyt3QQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBG3bZ+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zpyt3QQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBG3bZ+l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmB3B3905284
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=; b=Zpyt3QQmT8JKhRht
	JLYoi+oShxLiW2MVmaFKfOX1bMAJOAGd+l082+dP1sYqi1OZAccv3rJWy/RVMOWp
	Rx7k85kr0bwLKc8MBjq5QeRvDgr2+euceDQeSy+/lSDu8qqUq0SIg0a0fxDRs7kj
	PEfZXN9bNhK2PSR2aqJKQgsnqTlRa/9//L3JpQ0Ft489b/SqLEMamf2TioP1/Mck
	TS3dE1BL/Jb6B1VapHPQwW2ipreUwHaNOz95NitoPM+Q8tQQ+y3E0GRYNKHw3olg
	ZH0BkLXDj8kb/WeGQ+g66i+Y8P5F5ndXd87sqp83YT/uAzAdyd8JvkhC3/WboJEg
	oMUXLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dg25n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:04:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93105103d06so16149485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785499452; x=1786104252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=;
        b=JBG3bZ+lbM7VXHObyLSHw+FOeMh5taUKe8g6uMVvUmL9gIG36azJs0W/nka+D4a410
         HeHPZx5cvnwk7ZxbRx6xVaeVqiQxSDMpUxHx59cYo3Q7XvXq9WJk3sgVvlzvuTCLXmME
         2YqvJ3JeT0UO+XziH17d4k7aDPLzGOIZlnu1AbUPzZtPU3o7d32P2C6ZyGosTlmfBw9p
         IhFrNhO689QtC+NW05dx0O4U5yTltHcAAvzYaIxXSWzHwuachlymaAJgL0dWIgagGLQr
         E4uOBBCqm9cc7Fn8IiGa6cMYpIMHX3tKZD5ZEQFwbdWKfocOWNkfYcr1kYWpa4wcZaZu
         3wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785499452; x=1786104252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iyUG7pnwu1clV2DomNXXgYjzSkMRDupACxhZLQXstE=;
        b=P6POe0VcujG30zI2LiQfza0CoX3j55B/VmBONAQoSCnKRPAW63lBafJJCwKc+Az2ql
         PnafvoDfMGkAdk1dctrGEAmNS633wo2P5QgmzI1BjjJ+t06JYLFpnzD9k3sUHsh8Knnf
         Ent5PCDZ1EMyewWKWF8L+wgfC1WIAExyt6g/k1qsC2+fvNzl4YaaKA9NJEsd5kDiGQd8
         9tU862ENOQ3Zn1zpgqH9Puu0oWhvOgrrKGUP/G6hDootnAkf1KJvrhAGXAYRK7eEukE1
         k8VHE2tsDsFyyk7M7qZ238qAMHTTlEXO5ynvITJBI9r6esQtW0MySNmgb5uzzpgpwgp8
         z5Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrF1oqF1Ye5JchB4/FWz3WF6eBq/8DX224yEkWZRACMnE5SdTuexqkX6jAuRGurtx2Z1qXHh4pOb0kFfUrM@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIfd+FFd0aGVIJpKis+3SprBTsF/BET1atVWQJEaDmMPvYbvm
	GvqA62ziIAI99Jvy208eKy6rVVYHAWiO7TxGWTW/XUSA4UgQKp2seiIR77oc/Mmb/mplU2VLDdv
	FpMFYbuDVJNhHuWpBg8/QBsllKC/S5D1uYSThMJs3z0g4liDYoRtMlW0Ze5GFEv4w5gyY
X-Gm-Gg: AR+sD129/W00b2uYRFU3P72gqnXfU2Yu9eU3Rwau5/KtUQ+6UblqMJ+gUv76wuq7Lr0
	Sllqg7AZ7KDuQmHdllfLJl+lJOx0tkN27jEV8yhZoA7m0GTwqx1fs+Tvgk51h9i6jeCZ5AAUcEG
	F+CKyc2z2k/beVICP8VcS5voiJk20UOhoRZlyKcNNJE2o/ZaJ57Vzt4a4x8Om4dll/PCIJvfsQ0
	uXv2w4tbY/Y4lv9lMFenBgZXYPUo+Hfiu6ex+TlKaM2ZhC3VRWOdn2j9NpVNingAzqpovXHNEMc
	gUkXv1imKflh5DqSxTeMR7MGpAeDp8HkLeK+hb7RmNFAkOEzMzw3A2ZKnDZP7WrqqnBo2dnukGz
	HWxJlHojixkIzFQtH8XhGryVq
X-Received: by 2002:a05:620a:19a2:b0:92b:7420:bd58 with SMTP id af79cd13be357-934963c058fmr235024385a.0.1785499451863;
        Fri, 31 Jul 2026 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92b:7420:bd58 with SMTP id af79cd13be357-934963c058fmr235021185a.0.1785499451437;
        Fri, 31 Jul 2026 05:04:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a09acsm1181221a12.4.2026.07.31.05.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:04:10 -0700 (PDT)
Message-ID: <966d4093-69cd-4683-a98e-a57324dc2a2c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
 <20260723-imdt-qcs8550-sbc-rfc-v5-3-2fb988854623@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-3-2fb988854623@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zBDAVm02yCkfgUshHrBq9-5WEmt7lWta
X-Proofpoint-GUID: zBDAVm02yCkfgUshHrBq9-5WEmt7lWta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfX8ilqFBy8b29p
 Kvijo3U6tal7mrywhSwUSRFSCltIXe3yVVKWqZxrUOJkWErk/l2fWGvXEyprQpFtR3/Lfgn3WZn
 voIrLLlRDGG/s7Gf5LsUWhmkQP9CKWDVoBDdUExFZXZI/Q5ByetD4afZaqm6neipb1ruv+oEBXY
 UP2zwNTcSFiZAmyVnFSRc7Anzx2k4L+7DTBwjmaQUYLCftEMkrBRiXFVuMDTRzF3W7oBvmuPluf
 YSxbVDdXea6l+idfadyUYVlcN7+uaRHyt+xopB9RgsloA0XfRbSowG0E/104Cb22Sc76Pjg5N22
 ZGPzEfx/P++2tWJp7MzySiFBmrUSCDYo8tB2Z19NMbWf7wi2Ly6snGTbmsnka0DES4pUCeKxWJG
 XgYFc/2sAj9GFwi3TxzcWItIe3MZ+mwjSilQkCkfq5guhr39Ml1x5bCRC9CK4v+ToOikrDX6QOQ
 P1ZHi5m3Act3aTuA7dQ==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6c8f3c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gNcS5RXMAAAA:8 a=EUspDBNiAAAA:8 a=qfocr26bbEtc0TLUibIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MSBTYWx0ZWRfXxpjRrSBH6wqJ
 YuJ3NZ/GJ2vKl19LR/2XDQnpOdD6KRZ9jJsT1Osz8bQTuuJxAmdZ9KWYZ53VAozXVuCIsMBeddC
 lV8rIThziAnkbscDqEYLJf+v/55jIsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310091

On 7/23/26 8:18 PM, William Bright wrote:
> The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. It is intended to be soldered
> onto a carrier board that supplies VPH_PWR and exposes the off-module
> peripherals.
> 
> Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550, PM8550VE,
> PM8550VS, PMK8550) and the apps_rsc PMIC outputs. Compared to other
> SM8550/QCS8550 boards, this SoM excludes the PM8550B charger PMIC.
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
