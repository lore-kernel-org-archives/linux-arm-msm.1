Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6D47F784
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268423; cv=none; b=u+Av2RjELFM0XcvqOM2HbUiHpqo9ObWYHvOVeGuamzAfbmvVBKaPb8R/gMN3yl1b2q9ggXV2MMYnFMmRqVbCZzSUJw/W/TtRxdwXtrzjoloFzfW8Io0tkAu4BXE2qRnjLhmUBUMBcSgPM6Tx/mGTFLWGBHSfPTr/b/FM9ZUwP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268423; c=relaxed/simple;
	bh=YQAKN0YiI4XtvjUzINbwFPm07lgR9cOPHmT1QSjACjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIj0/cV8IVJERr4HBEKeBnG3OgsjNdsmbhMkRtWlFAOz+EMA/bprFVR4WjHLKbYhdIoN+JiZyclyqN2pMx72JPToC1gKmAi0LSm6W8+HG0xYfBKVgmRigISJGmFaMecAn3SUihZlAPiBYENOZkzgIYcXqobWuPRmxm/qlWVr8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHb9FEdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbEbVV7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHb9FEdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbEbVV7l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681D6Q0L3357774
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=; b=VHb9FEdttwlDQVrZ
	KgQWURvBgc/quc7TJyE+w3PbTByG1vYi7MHXpu9ZJbFakEDPqZ4ZLJ5C8tyuymiD
	R+7dKT8ekg+8+PoVKU4ggvVUbzuk/9RtZisOjUHjmR+l72TV/pukHRzOIuvbLNVD
	7yDFMG4YlzfERKbO20hUNq4/TE8DxxhwyYPS94G5MR64/53lnh645KAJSCarKly2
	OlrL5uiFHdktT9sXd7p6bVldos6htxzX2Dl9vmHBKWa1Cy3BVcHKCBO7aazcYBTW
	VOig1Ndd8wD5AbKUiPrK35o396tKkUGtp2+2yjZ3O8LVxUB1VBuAJXdVrd8mvoNL
	XuJV+w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ng0ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:13:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so101220e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268420; x=1788873220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=WbEbVV7lm23Pgd0kdaLSc9q45Jwv4ZPb8f+JWIeFAZ4Eao/yUz/udww90wvAuCQL1Z
         o/yBKpVonxlJO4rTizlaOuNaNqUR4AzZiABx/lAe2gH9VjqUR2LbvCJsxqBEV0XRj/m0
         aFxkayv78/boB8LhS+AMAukr8Z3EPCl+LEzUR6oKNgEARGwkC7Gl9i8NzHJtmSncoIn7
         NqmntY9CohFCTpp5UDDdSif65z0cRZSrdT+V2DCMkup9rta8sk1L6hW0lQQfjvyapT0r
         DCHPcrn37pjnE+FJYp86wYI2JHRjHn+9wtjURnp92+F85F23lv5Tdn+JlIh/o1sgXiYv
         BwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268420; x=1788873220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=tMWjn7vBppentLgflguMHd6xP5eM0r0d+vps+m5i0dtMLeUHlUkUuygkyDx/vy4SIz
         VpJdTbKP92VFyJyvnPE0/T/gn2eTCUIOK0GvfeybXo8KnZNz3+1+nOTwLLQRd5jwKygy
         d8Yy0ZnS5oN+e6x5lCE9D2R6dFndSvRUVeHxXOxaIG+BTe8KirxzFGWgUMOIcPyZtQ1m
         lx1ZOqXurpL1UGNWOKF9CO6LRM4EFbrMhSdU9V5r6hcv08Xvq9TX7xJQL2c99BDjQ/Pg
         HJ9aJzM98u/ZQbG1+kYBwbbyzxMk4jGI6J8p+zfAd9N7DYfhpoMeQ7Dn3VKrYcEuIS6G
         hbyw==
X-Gm-Message-State: AFuF++lzKjUjs0TllUU9Xq+limtqWrhify3a5Q6XwTRZoVbNc6o5vcax
	FeAXIDgHLsKKay8k4vlsF6ZGEQkh8Fl/mWfSBn4FDEVthMzOzx+vSv3EbwBjFUx6VDGbKyr0wzR
	162AT9LMMkSnq0N7QfOEzTnsTZuSM33pLgTu23xAsRebOD8B0xJm9+28neXW5vY1uyTmf
X-Gm-Gg: AR+sD11VqcnNC4pk/z36W/xWTFQYTC9OKVKO7o5aKQ8zfRTnnXOl2DfDi3BQXFEmwtF
	16xYwHH6b3KMMs3+awMnenjeAwtOpcFxsx0lM8bVkXbShjPChI++KDzuEw2/hIZ8/7blKSIwtLK
	zElvQpOI8a0JDV0rnLaYEOyeBfBi1A7/pm8sOEw4hPWq7YdZklW7vSyVb17hqTeDbU0o52zq6ih
	LhIwTLJL5oJAI+bSmiTaM0fr+VwaPazrSn3i5emlO1hdpITF080ZQxwEy4kx4HyY8tx9oneV28p
	Yl8hgK7dC8kPAVm3kUgxg1Fphvab7HoykecCgDrIOlPImYFFKZQtTQ1rRdVYFhqojCvbyBGlZ0A
	XC7TsslPTgPmf9GycBg3e5g==
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837917e0c.1.1788268418590;
        Tue, 01 Sep 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837859e0c.1.1788268416683;
        Tue, 01 Sep 2026 06:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5e1esm2901431e87.2.2026.09.01.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:13:35 -0700 (PDT)
Message-ID: <a57699e0-a0b4-438a-9ea3-db913301d90f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+TLkhJfcwJMO
 s50AUASbj4H9k2ybePVYJQYHx4Ppv2+V/VJ4cEYViRLR20oi781JG+KPOfH5wCSYT13sZAg/oAE
 g3YQWI1eSVKN6ypGQDlIr+V538T/PC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX1yPLJ8ZFveRC
 kE8a4EKCsKy6ZqhPDda/ia4sbn+GYkNVBh8P7iKq/LMToD5ZUB092JKxFPUQqq6tbhjumUn7iy1
 PtBJMdbAdCTs79vjgXC655xsFZBEzvNjoeR5KZneBDkddgsYcWSulMJPT3bq6RhWjf8BRo9oVJb
 uiKoUxL8g7/arebGpl76c016QsQfj63l1LeGndzu6DnSWN/yHITys1A4Ngms8anLqK+noRqrHl8
 SJRuwLF4eFoWDF8iwHCXQX8Qh1ybs7/zGPPASKNDdLngbwRdT2MRWmXBzVvnEqNu0s5vi5tPTvx
 xtv0Ym0uAgMrnFYxAPFB7LyuH/fpwOxUFWWKz2h9tLaoGBpPLIoJy7MeT39mo2TvLGTHQM3e8ZV
 4IlNacoa1FAC4vJDsiP+MiHVSZQU/vFMhGzxakUp7biGA7m7jf/2/kcRtOK8djOzzk1gowX+Qm0
 eHqJc6pc0YX7nONKIMA==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96cf85 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=XBovKe10WAMj5E-UAXEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: rr7hqvlcqLc15giaKjiV7nDL_qnkBDXS
X-Proofpoint-GUID: rr7hqvlcqLc15giaKjiV7nDL_qnkBDXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
> helper macro for register/value entries and converting open-coded struct
> initializers to the compact form.
> 
> Also remove an unused include, drop unused macro register definitions,
> and rename the IPQ5332-specific PHY CFG register macros to make their
> combo PCIe/USB3 scope explicit.
> 
> No functional change intended.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
