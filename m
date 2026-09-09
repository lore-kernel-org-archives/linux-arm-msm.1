Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C15678D8
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965447; cv=none; b=SMnA8NiL3UG0NFlFZuXsDkA4qFP/5Qws7Yj6ajdw3Wacfv4rqMpKZXJA2RDoE9QQZHmGp5ythZH6TIs9IS/x+mT+PpHBaPI0JRn/hWCgXwnqUW1esgHmPSuCyoF27oumUHZlaGXyFtB5Dmw+VbwZMSYoJo/v2NZoXvE7pP2cuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965447; c=relaxed/simple;
	bh=I/3jxJiKFAog04xwE1TjUVclcbiREF++kcvKc8InRjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYsINMATRLmhiLeHQuff/dZ3WLXEv9gKLKD+BdvcXxOJ573X/mvM1onyWsBZ6Lx2KWDC0lwEpXawbV3vbFxVqMLzQ37Z+mvfr7lTV+hWMoFjlWB/rA1RH/8MtaNlBMa+REIS1jkM2JF7lWH8eeh6HO+j5mOTPac2HAeUM110HQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iku3K+fV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+qyKtxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iku3K+fV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+qyKtxd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Bompt2698833
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=; b=iku3K+fV7u7wHY5q
	VA/Q9i/dsYog2LWsig7VmLJruKngKU+46GhI42u92lhNPiNq3mP9soLjzh75mlPA
	1TxEXKcBpa2B7NxmKqwXMyIWaespUQ4UZPLyjEhoHUCeySVdtxvVhZVpUUmwkNHK
	vbLbDy0lZYcGv4zLYfny4/ipdPUthYGefSMEAS54UWquyADN5etGBPEEis0U588r
	hgV35xALbJYDu2i4Ys7jAzijoNl44MYCd5goOq/8Srma4sw5fmbuk2RgyY5YQrIN
	rtISU6QZll1416dHhL56yo3Sx+Nm+spRXvlKg4app5dg4CXsn2dgvCqxpudmsuWS
	e0c/kw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0spp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:50:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78ff33b2292so28062137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965444; x=1789570244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=T+qyKtxdJpIL8SS3/5ZT0zOh2kXCHgmyB2e0zgf2vnxpKPHAZbXlaa67QSsO6Dlzif
         PbVhzPFXNX3K2uItLaD+lA8THoGZ0umI898MWrYErdlv6Dcf/ZRJp84RFp8DCozFClro
         Y6EjSaevLhOPTtYnfquUljwZnxeVUWbJ8srgPN2jfKpfJe55+7M2xZO+oBKY8GH+UwwJ
         pSXtPNLfDI08n53b1KNEoN46lMVhqFME/UOaMNJ6OYPTBgiz1vTGTihi9Jt7u09ZpcJq
         qUC1N57UW0RN8cp0pna1AU0IL/51JS5AcluQD8TX3w2OR2uz+kvjEXsp5GurxqvLpiHs
         zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965444; x=1789570244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2TWle/jVnMMQgyBK/ttXU0NgWk4mPE0ZQLNLhu98M8=;
        b=Xh+ShlRRqE7T9KG2ZQkTyfwSOwd9M/JfjPovWjqJSQZZVEczuMmsdafb3SQRQh7mvi
         lUV8ytyV0hUsfsBLfZ25qBs/epTCBMvLzPuEr/Ga5WQgbvqVD7DYQwlxVaNm7nxMZE3v
         gT4NGQlN5Ow4JS2LMc7mdrOI1rDNmkJ8elmx/OmTussb5B1Ig33fnPznHNUgbyCjOqVs
         vkpZoRibaN+1bsxOTgpLrQV2zbS/s5UlOzzp6zJA+j/IG5eKZsRBlWq1RKHtMv9fWKmj
         S2HDOD8czIFgEsnDQt0CfIlpp19G2Y2fKwOHNhegw8iw5sgFDhByu4VIEqmppRAsSWPt
         WffA==
X-Gm-Message-State: AFuF++m7nTyiTzaOUW2o9PHFSSEWCYVYmiCahtkHZiq+9O6pDsaCyK8w
	RmwEQ1gHV6DRK0T7HQDCju2UZtvAYWXhSsvA4I7g1AftMeHRly6lcZeUN9DFnAWRj1d4ldHJbo/
	yTTW6r8SV2WOAGxzjgNAaZ6tYXHAbEEe1pFaDsquaUA7AtC4MiLyU9SZQfEtzuURcl23f
X-Gm-Gg: AYBFou0EbAfXAeIBGe88f4XaSx38/5DaPm01XSCQFwQxpDP5EfxEUv74zmZLsbeRk3U
	drpr1MOvOkQGMVl9cIEHCuF6Qr4T9CyvDaZTxEHvG7fNUg5vTeA2ji0j2v7Jvf2P41NBnRT4fbw
	2OthA9RwYapPeCLdj4KBmm42jmcT2rYd1mEKSs+yLxt2zggtc06Mt9iA1QmmC+VpRXNowMWj6IA
	MnnI9VON7Lqzvb/JnAguJEReARcD6W4V1v9MKeNIOnV4b5yisXqjbSOHMeGM5NE+1ThXN33u98g
	DXyCRE1zD43rbZe8nYAEp/27/ui91VuEEoUv+bxuXXZ1vg6vb9VAOfPpB8FNYKFP1rFQurEKFGg
	2ptehSHoHQjvMZpB7jR2muA==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883035137.1.1788965444082;
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2883021137.1.1788965443567;
        Wed, 09 Sep 2026 07:50:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d57fd88sm767240366b.44.2026.09.09.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:50:42 -0700 (PDT)
Message-ID: <c2f3ae91-4f0f-40ad-b03a-6d6340ec6244@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXyEQd5ENTPsyG
 G+d7eB8pZJdPMkjRkddWjnxS05KoE413J1HESP5viVIFKaymZxZ6itzk5qFBaovBcU/lb3em5EJ
 loQh8RYrbIeD6UOO2D+9LAHrviDQr7+TXbZsZVs90v7RNl9tLTzDNbLDR8kJna/ozuoA9gO0wqw
 kNcbX7vCPpVy2MXY6qkpb7FwtoINv8Ot7ehrQU5sktgLjIa+qH2WSPKfMk3wMdKhOmybSPr/tAY
 djkbkxU6gqgNpeaiUEL13ZH3IVOjTPxgIh/hH3GiIeuMwr6iUt+HAFK0vl4YCTngR6Oo9NlFiri
 fIJM0DG3CJtRt9mEk3BI0OLKqgaZGuVbtGhunBGtSxGAS3LVrNBxvsoqwFnciKEoPy041OsiuKd
 Bc3jwgK1pvldKXupEk634U61aco3Ywvb3x9Rm2JCQAogY2hbNeZr8k5jXt6wOE72vJUG99EHwXc
 l8vz/0YYWSD4Gn191+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX3tRX9kkDgkQZ
 g5TIXDf2sNcnYpChn4HeRTAsOSQTZk6ww3w85JPg+pSVQUmWMUHhpBb9S9Sq7i0iO8lkWNUEGmh
 XLQkNWfHSFjDaTzZXO+9lXNx2E8TG3w=
X-Proofpoint-GUID: Bo2n6qEeKPwvIZ3qZVWiV0zPrRFrbDYu
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa17245 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: Bo2n6qEeKPwvIZ3qZVWiV0zPrRFrbDYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On 9/7/26 8:33 AM, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---

[...]

> +&i2c8 {
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;

This property is undocumented and unconsumed

Konrad
