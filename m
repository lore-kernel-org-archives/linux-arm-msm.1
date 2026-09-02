Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB523EF0A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338651; cv=none; b=XSGrWL9NtaofAf/9gkmuHEE+M6nFWU4Sb8nouG3yEoOGkuSD8Nh81sv/H2PPaglhQUCprinPNfT4KlFj4Vpje69Q1LcQolgGlVr00SmUotfz27NxA/gdhb4Ap3AJ6t/QGhNhP8LHFo1H+ID0qcw3EigFp1j37tALCScDl9hIfkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338651; c=relaxed/simple;
	bh=GstLgIHtvyFTm90ArYuPevwty0lzfMMUujZRrcj/Sfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LecG3BYB7wm3GD2HlF6LNsA6iiuvTrxGnfjF3Tbdeqd23uzlYMoxm7QvNPJWQjmzlWDs9Dww9TwVGiQAeEwzNP2L9ToOMVGwpE4A4PQGbedCPoEDc5DooF3fhKH230NchpymBWRKdEwfMoQqvvNXgr/LVGWvv2wIEd/R/+W9Qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0JcRGmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyUTlRe/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0JcRGmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyUTlRe/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VY6r143080
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=; b=h0JcRGmOW3yXBfJ3
	Jwg/N1/SmEx2X+CMj+1kJeGOLtnZ0m3Hzy7ubZpgM3LSK5QO8HNKhvVDxFOTFL+n
	cdKpYpumJFH8c12HE2yzjcbcsPSkXkpYoHbCx6wqEzWdGOad2n3eYt/By4kq8tsm
	qXgWaWidssOkHkYai8YrCFKBDW3Lnrmj8tiwsYd5vzPPMq+xZuMBQUsNZtiGvdpa
	mwVGB9FXu2w5aUUaxzAuIKl6Ssexe97sB8v3UzobuhuBSunsQ87miV0XuqtsCw7s
	uSXJ0Se2Xbu5nXqkmc31W5BnQ793GX4bG38y+9NTNTkNPD0zie7MiSPiUNCfr8XH
	TjG6ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397b1g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:44:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52845bd815bso2117771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338645; x=1788943445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=IyUTlRe/AH6AjjQh8pCKRpyEZHVHnBLhmKj5eECXnEhGtBAeTuNoOrSWUPP32pLF4y
         Z66q+oYzfGkqIisAucPrz1JYW3bFvAY2PCpor/zMdLeDPlmReVnDk3wdIyCUQ/6KajAn
         V5Uteal+Ho065sKyi0zAnbFh4OeTd7L+s+bp3+iiy+KoToTkiAMGHu8n3osVmCDwkiyJ
         RzvZezcjEdqpTYDPuRmMuR36Nbsa0M/acmTwfYnU4wLvo29AmXpy2uIxLC/u5+49JC9l
         FUEkh3ARqyumtJ5AEniGRkwpfXOwPCudhF4fCLNDG2FaEuzt6/AA46K2DL8BM8row/Kh
         bmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338645; x=1788943445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4OzhxkrdUBOFLLFsotE5mVozTuaUx95en4vSNcnE/g=;
        b=Kn40l9YwRXlm9r/38+tbAPz0XQnlsNLSSvnm8NNnhFJiurWdvFr1vRLriDWeLP9RrZ
         BE7AKFMJBOZlxG5HU062vQV2DAkuw5w7GMZuu9X7Q/m9kHWXlwq7spbLsq/sCDO5Eafr
         iXD2m8OTCWU/C/LR+cKZyJ4zXJKUjacNegsn+/Tyet34fcq4yDy0kGx24iybhcMU66C7
         j+59lYKD5LFZ1fHdlRLevzZT6iC5zThxMHr7leb2U3S6N4wZasWJmG/CDdxo6BaVWx2W
         cg1EqsGkT3OiKNYdfMUcHfTfMaveuuyn9slXRgcacEy/KqNkpvXCYDINtR+NQ/iot2ys
         CVWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2thCrhla2+wVmlM8Qmbj4aApwz5GgseFU3iAvysykhb+e3QvZDz+geSXLoG5qq5Zj+/UVs+3iJqDtjoiJ@vger.kernel.org
X-Gm-Message-State: AFuF++kcwOD/psJ2IhEWc4UNmXYuYWTlI9gFbRVY7BeASkxA0DFxkp/b
	bbKmWCBw/V7hgoaSvmAGsjhk3C8LYiAvj5Z4z73rAzv/m4p8RXVaC/hpMx/xJC7tdMiCJEbN4bO
	Fpd3WvWw8B4CfFxisHQdyK8CAystk3pWadMSF61XgDJSVroW7Uq9aUnPkOrEsDfySw93K
X-Gm-Gg: AR+sD1041ZBhiAJddW2tSeHe59iK2qX6ZGyrW3HFkMGOp5rees58zTdRPaRAF4ZuNb9
	RJzbjKvCfyN3vc72XMrNqagrKjCPk3wbfateLV7jWqIUYNmgomT6AEJk8q8vQFyzPrPqgwy97rV
	Gg+6qkETumO2rQR0yiIvSBysevUb7nB8Z6BVSSomBwabkZayd7Z5FK9GSd95JdmBK6uv2FF1qwW
	q94y6MsOxDJQZN1krB3rdDyYGTKQgo8tyZcLLaDpxhXXXLuXFjJ0bGMdF6j5FpxnkKoqF456erf
	5a5E0Vb3mlPVjbT/ZjuBvwoe9pD8tQMg4D8Jzms4KG+dO5Oa73SmEu8hBboXkkEE3rOIEeI8bjb
	BYCEVV7qijaMADvMejTTaGA==
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276231cf.0.1788338644072;
        Wed, 02 Sep 2026 01:44:04 -0700 (PDT)
X-Received: by 2002:a05:622a:115:b0:52d:9a83:419d with SMTP id d75a77b69052e-53036992976mr22276031cf.0.1788338643648;
        Wed, 02 Sep 2026 01:44:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm673780a12.3.2026.09.02.01.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:44:02 -0700 (PDT)
Message-ID: <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:43:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX80lyZRiHXHs9
 Jy/nzczfvVj4dY/zniooaRgKOitI0bwgRpmTKu1DCNGFvTaUfCOYnRImJSBOa2LjX6/DOYX9MOr
 tAofPMjZoLQ/UZCWoQYnTau0jO/B7rIzMBD3g7stJpFE4mVnOm0Vq8uexkLF1lzoswCpkP1dBtT
 m34LDqntr5o8jtD/P9VI7I31nLp4I4eyRQ3X32rqgaSDhRUrPz3KNxJcraH9RzThekLB6axg05O
 WGaN0/b+xgNT2aFlI06VE3+7xTpTOJd2lllUTSmkAp1rwPA5JW3XWZIks82L0y7t2AyJwAhQ5/6
 I8pq8yH0dL1RCWH1vGat14+0pgohH7K8Jj2XgCj5ZzZBxiU5ZghHp40GX7j6/067a6UPc4rrUW1
 2fQz2gujk6uAtY8Ha15LJcyG32jo4k9/gtu+VwnWHJQob7qr8Gy4Uln/vSb+neOBrp55cICMTDf
 fbAEae9P+cO2ZjETUZw==
X-Proofpoint-GUID: cQiOW799l_X-PmN4kWyDuxKhAapFcN0b
X-Proofpoint-ORIG-GUID: cQiOW799l_X-PmN4kWyDuxKhAapFcN0b
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97e1d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=i7MDaAbus5dcvw8aKywA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX0op2PZH8iztD
 GIKLaojRSRBRi5JwLaKjySFcRzdmj5F9NqqFxpfleMBjSp8hs1wOG1vG9bjN46c3Fh0Lrky+HdR
 7bmjnt4KrlQWK1t3rPkojXEMLtp35ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020076

On 9/1/26 10:47 AM, Xilin Wu wrote:
> The TC9563 PCI power-control driver powers off external downstream ports
> whose device tree nodes have status = "disabled".
> 
> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
> powered-off port functions during PCI enumeration raises an Arm SError
> instead of returning an all-ones PCI error response. This prevents the
> board from completing boot.

I agree with the premise of the patch, but I'd like to understand why
that happens - do you have any details?

Konrad
