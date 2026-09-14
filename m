Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6075944A3EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388828; cv=none; b=o4XUxeAjJxvemwgNO3up8vevTWcsLDsz6oFR1ElY1Fx5SPsbc6//cttQtaQSTb98eE4t5TSUDi3AgFggyNSXBD0/TJIrMNYaw9V4paVdgkNH6k2a2S64e1EcAa+egaqhP0R+4/9jIr4KWr8SdhSlpQ6ulcnP7Ps2k3jJONRFdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388828; c=relaxed/simple;
	bh=kaHTc8mwyexifTG/gEdjPikKelXz4dglxqdNskT+sp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDdAdVNSvy8EIrO9VGGlGNTbWL8QyvHOTmpIxqAZ11SasADB5fNa39p5JBjhOCgXkGJzIRU+aXirhL+/wOEL1KUQL3WqVKxAUOn9Ycb8IP5QuInhE3QiyMSPIOqZYXXvUYpGVRnvGBj3S9k0Q0z541w8QzA6IPTMDxYDM6oWy7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KamH1ueW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5TE3juP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KamH1ueW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5TE3juP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRIhr407030
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=; b=KamH1ueWtT/sXz3R
	ZIqgwYY+wc2e2D3fr95NeUwEUxgPOBn9GIZ+/Udrklua4gniFqlSj49vwWw67ri+
	8iQpcC4sRsVsGovuxm1YoOLR33hNvAcXkMZsHkgYLaCRNl8ElyOx9RxkGvRFNA8z
	xP4jAzFXYVOCy2sWyae8A9y/p7WQxzfDtDSeuLO9NZuKYbO0Y/2Rk0KgcToYqdk9
	BaMXj1wgfK6sIKZtnK/Yb974XXI9aueSHwLR6WIRVJ1xrmf+UIBysleVj+2jEg2l
	MAmDhCPG1+ONGOiJSKuOiyTz3L5vAfyuYkzg2jNwgx8TfFZpqMEsYo0w66PUV765
	nEyNhQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr5te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152907e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388824; x=1789993624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=;
        b=B5TE3juPj04rgjwr2RxU8vrTY28inKh6T/GGo+G2CvRcrMSSUleYBtcwkDu/0/4TKD
         95lQhlKH6XlKLa5wUfh8zG/KWfcyOJX74sU4R7vcGhL7L6KYvstxu3rB96qmF9qUdECC
         clQp9RYAdBOTXpvNiEvksCBiEcyZHpoHG/iELODVm00IJipiJps5dOPGbbPpPcKcYoCy
         YvIayBbhKtWD0i8gQF18HGtFdzcJ4B1BbIgqua11PHWeMmYjwtsDEVlz6pX2LFz2rLQX
         W7krejplSOcj02PVqh1TXJ7QKfGXeXLINWpisa7rnes0qgX1uxeIBnlWpUkH1jUBwbwQ
         vfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388824; x=1789993624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cu19DPEPP40HQZKxOJNhMMxBP7q201tiaMYjNBEzxUw=;
        b=r1kjAFSWluxVqEa5UJr6WKPf4dRtbTzcpgM/3m6xNJaoha9Iq+1k7nkMUtomR5p9/k
         oPvcG+EBauflSsn9EJwl1WR0YntU6ZR06ImVVd80QmhHNwqj8u/zLRvS+TRUkWV14Nh5
         fMCRgdmfMet+4A5UF09MohSISO+cuATs+QVXOvnwcYFqZ1pGyo1AQtG180ATW0oojo0G
         MoAGFt1nHGxBIq76GlHjn+DsUTJj5Xlwnf7RjVv955Y3SNcLK0wIl3UP8P1OCMYPrB5u
         b/1aEwMr7+DrlF7Sl9Axg3yoT78SePJC9MThu6+66iglT31tRvC/6L9PJ1jgpOR75zNX
         Lmpg==
X-Gm-Message-State: AFuF++kXgjKnS6aTXkPAZtJ8lDah60I9w3b7Y0uKwPnPORtsVv3fvCB0
	+cxuanSPlSUnszrrSLSR1pFu1vzSwy4iQI+zjQu8vFKy+N4FyGkZobafMs8RybzGFov9uUwAn/h
	K8qoxB2QgABd2M7kZmeToOV3/YMhrZvXujZ1knHcBbw7Trl7lhsonvEgTrebu4k4pdXqN
X-Gm-Gg: AYBFou2e6EfV7NBk//AJzJ46rf3rXDA21qnxxpc4C9KC793glM2rXJDEQcFGTZII8Ru
	AoPRNxb5wEjrGZq2X2ob+st8cptjQC7E8c4MqlsT9mHj1KhWkh3LY3C6rU18hAaetkDT6OIxxdD
	715MNBfwUaJSCeHJCzmKW//hIpAj9N7XZ4DcARd+R5w10Bmbr5isp8xy0iWa7p23AkM6babBuCI
	XO4XJa/7/V0HKdmUbecb5c/0JSmsbtNhZQUCby4JsaSNh9lhNWiPZFsqdJs2nh7OFPJswKb3Cnu
	qTKdoAVwaVb/yWcBuvgsCW78rRwLbDB16HGxyjIynmQc9b6+awJ7KR/o1UZOb4RNozevl6bp5XB
	Xjz0z2ZFlMGKO0NiTCM9aFQ==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr377226137.1.1789388824192;
        Mon, 14 Sep 2026 05:27:04 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr377215137.1.1789388823814;
        Mon, 14 Sep 2026 05:27:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33262c2sm28658961fa.20.2026.09.14.05.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:01 -0700 (PDT)
Message-ID: <5a5ebd09-580b-4a97-b8db-30bdbfe8a81a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -nStK0AmPY683kCS2oPp3BV5eieQ6eK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8pYiAMejIIWg
 tbgUmbVy61gN5I1bHnyAcU3CmW2Vmwfn0GKhWyzQ92gvoyYOZgsGqyU00h6/WT9n10IoFhvq2f6
 AI2akrMLRbbHNuqfkBBE4gHTGRbsEeCA/IltQhbm9sr+idhW0CjtrNJ+Fp80hboLNq9ZqqcyTFF
 ApKL1TKwKGHgdTXNi0Yak+VI4BeHuvBjmBPTzVxvNqzXVZMF45Ayhuf+8OxctorzdlIvZmdEvBV
 iKDskH42WqLaYjcgOxmXS9ksyhhqAwN8x+X35ITvSGgY7nD+vFyx8nF6fEg8ZDIq9qzRMFALyGQ
 9XBBwFnhEN7c3oGJAD+sZln6nZKvrH5ZVyDmkkgbBEgy6k9qDlD9N7ae+8TRdiqHvXi4+u7BeLC
 eRVskY3Gs7kNGloGed5UJVF957ocuYJfxuVMx0xypmKVe+d9lbJ0hFHuQUCKrEzcJg/OM+cD3yf
 QWtwSgY7P/x7j49Mo/w==
X-Proofpoint-GUID: -nStK0AmPY683kCS2oPp3BV5eieQ6eK-
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e818 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VzlDMD57B-Cyvd2ajsMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/kEamkyuMc8U
 /jk3y6TEpL7mDGmkDBfw/0lFnNo8J3fGIuJgNtJWjo7iK588ySZ7haShfA4YATziSaZztJDA/ON
 511BjcYY0/VhHCE3pI1sPSDnhwo+vug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle states so low power
> modes are described consistently and their names are printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Use a big CPU idle state label for the shared CPU idle state, since all
> eight CPUs use it.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
