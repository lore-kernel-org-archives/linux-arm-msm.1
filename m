Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A945D92F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388566; cv=none; b=DqP6U+XZEwMdGCg4qRFvQrVecOdScUCICXy5wqcBEASN/lmvgF1PSczbkUfEVEKCgeYL/KWieK58Te2xoUzXgmgn6zERzwOaVHN1pcLcCrbhTGph78622o3oUFZ8QNDqFL/cUeiCUMjHRtuB0VKgAu55eWnDJS3UnI5LsegYGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388566; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqMHut17c6kcJgHWUXvUUzVAdarufekApc+hi54ckQDQugKNW7apblQ/NmiPUTI1RRsc8Ua/DlZs5L3vUval8j9K0AfJiHP+3pwcxZMgddpPCakDpEoR0958SHsKuhMEGMfxt9lUmjtanh6AC0fyFRXgDbhxuckckh2IWZ5u4S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XT3UvoL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvwO6OWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XT3UvoL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvwO6OWM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1Eu901898
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=XT3UvoL/jdjwb2wP
	kLOqTK6tUJPyIWwebd2QdW/+/S0NAaHlVBbrHZwDuQU/n54DW+XM6Vv6bFkoWRPW
	QKaFXLALTsuKqmhjc46JACQtXMvwXdDUm/6TbvS7kEylmUUFhvSAjGVA5St1Xkxf
	bwRrVzHcWKz845xmj+t1ZAYlCBrI8BnB9r8Rgl+znzrpiqgWbgJRbNfk5rYFxem9
	AbTwSVBchw3uLa7EjSuwchySnMMHrdnYZoz7EILGvXAtkRGdQHDxLlAeFRM1zGTc
	YBb20XY4oYjvPcMtVYXrglVeXBfIzq3LTvWwu9vVh9XnnyhaJkxrDSmceFpUFJKv
	o8AXRw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrtrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:22:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so54920e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388543; x=1789993343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HvwO6OWMPtrdbAUA0US8s4wRFuPx51IpAkYiYAHs9xhigDoN0P+hRhJdM5c8u6OUQ0
         BW5saWhshJ/VsqINskU8s+CdLzVt5j2DZoOOdOPB4JLh5vF/MQ/VMhtAIZPiVdleoUo1
         9YALaNjGG56TbllkkLrFmmzTu54TrzuKwjo82MZ92G43o8QzmAumS4NZo514+CvxgXDU
         sllPvtl8y8L90SYhcXjFecaSRDJ+zI4kIoFmXdIg+k/cxO7weHT+Y5a9dJrlqZyKko1N
         PHoEOw/Q1VNFfbripX3bfRdIf06acS2KAg4DOB3Io5194GBHlTfDcJxwW5FmNdsnEWFC
         6JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388543; x=1789993343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=q9OR+fzh/R80eniLxFS4IgnyEkR03yUStjoRhekAyWosBuANZ4ze7VDNSoTnkGG/Bd
         5VWOXdChmC5WXaa4iBKLrmVBIEx1xE8iGMDbIaaBkfpbAQz903D6MmdZfHr9AhWy+0mr
         cBNMfTzXgO0fGY6mYzkZWZhVlQsfnXh6F4dm8DeYP9JvvQ1mq6DQhmJALX0OwfhHBSN0
         tSqVzfnkiwlAD8MechGsuwzEFPDOvZGf/8t+CFzHTS0vppdgCyml2pwjCI/N+PDXwKPo
         Pu6nvQH4UGhMfc+WHqmCy+x28UCIWA79hWNy7VwtNmnJE5iLzK4uHgpKCOrflg3be2nv
         091w==
X-Gm-Message-State: AFuF++ngDoPLfaCDAsb9/FvS1ITe4YWYsB3Pkxezirn4yXyjS2/YIdQg
	6shVkp++AGYjZKzIi8+zrjsPfjVx85ld7vCVJkfR3zcjuEQJlyxQib+wjp5ugOz0BXU7aZ0EMTK
	8cKeOhlYZSFt1BlFo0jJtF1+uZ1qYB4s5HekF1owVOYjr9y1vJvTUCn8kGDwE8diCxmtL
X-Gm-Gg: AYBFou2SRgW7QHFeIAzp7PoI0inx2eEcShY8D9h7/84Sl30dlYDuV6tF/Lhsh1rIYhm
	U2TEjfx/vDL4kIbwGNbLWyGwH+zIWO/FGLjQvh16YkPgs1Qeyayd1PbdEK3mEtVva38BfDgWKto
	N6f3q7QIAbaVg5sfjbrib8okcXfn55lRUKbH1xVR5D9cdb/bo1rM1RI4jEIJHhgmf5Dej12fp+u
	dBqifW+CVAiJfASJyH+cmM2iPDwyH9TKzKo41u+/35JjtShlCDPsXrAWO96+aDKip54HuNSMjyc
	0Zt3CsVjMzxSftdALy/IGsXg2g/aieM1DGr6NE//DHwpuHlqqtJGEzZmdEeqK47At8PwP22CeBZ
	BskBUgKykXKskWc1odQx2/w==
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283042137.0.1789388543370;
        Mon, 14 Sep 2026 05:22:23 -0700 (PDT)
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283035137.0.1789388542964;
        Mon, 14 Sep 2026 05:22:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:22 -0700 (PDT)
Message-ID: <31a67295-b27c-44a5-b106-ae030a046c4d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XGcClKgHBIPueUPL8jTi8lsAD4Xs8BW9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXySoKCR+87BF1
 9CxPBISga0JykoTdPOfnRCGuIVrQj3R9W0As8GtGUezcklRryTTiRqG5qtMJNL+94WxVYV5Wub4
 MVfyLB+Z+UbseARYHdoOqT47SD6Mufk=
X-Proofpoint-GUID: XGcClKgHBIPueUPL8jTi8lsAD4Xs8BW9
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e712 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX8hNa1USDfH8i
 jSkR9AWEPl0S1SLBCNORC3INC49hyUDF91gPRBatM0bdfqB+VmIA6BPpJLtcAnvNQ+Gao20wCx2
 +ATGAovc9qADQyVMVnRNgfK7la3C3mrBFGRVoy6pFzP1NmWJblkVHXNudNsHJpvsVHe3toG+jWM
 Za10nVw5LeuyszVeEqhEE8NYNZfoar3sC9+MoFfxRL8Q+wL7OLR4T+fS7p2g/h8aXRsnj6a+fX9
 A5kY4Aas26evbAuQ1JzO5xMF9qrJ8BCtVYpcCt79tjYZ5sQ+GsYS2Wceni69VEUJq9QQoHoaucA
 zAkQ5ucRU1KJefAXBGM3QWbZo0+hH9KyQIQ4b0CEYK9Bstaqd5SVpAxPnGXioPZdxJAtPc69rjH
 TMvIReUqXhMQyHOVjXEkDH468nuX8DSBn7Je4Y+HRpH0ecYy4FIWurhmjhDZcvhEsDOpcG5JVvu
 iKr15MXUHzAxtgZs9VQ==
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
