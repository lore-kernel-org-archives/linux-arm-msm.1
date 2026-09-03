Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF00A126BE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419749; cv=none; b=qibVAd52/d7Tzo5epYEMfi1C+yxt8ynnhLoVcSa3iQiqHh48bljj5vJ80WterZA3VE31/TJ6OCKHeYqCzLFM+OS9x/qmDOG53N9VaCx+QZB/fJHbyuT4S1NUcC5/vxbep6isBRG8gIcWrCAOjpl8v3am+wrn9v7MB0CuI9Ul+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419749; c=relaxed/simple;
	bh=C/nOroiUx2tLirDxWurDVQ4C//sLkZOgC7vYB6hGC2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7Pm/q0hhOXonZhaVS3rHzlcT/6sOSZjovzBGabkm408r1t7N00yAukKRs59Z0A5NU/bRVVUSAe+Brbp3Sqsz/kqNUa7JAaQtXaFGDSYMZpJAboRCtsVF2N5ySfgSYpmTN8Rlb2PmFuDDBiiq5kRbjt0RZwqAGXTVqw7oV6vpvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBWckHaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7NdC8K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBWckHaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7NdC8K7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lcgq722045
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=; b=IBWckHaXl3817XYm
	ukaExoP4nI8UFw2fvAiKrTF6yu9aRIuXADXsJEf1NjhqEBhVxMGuuji0xX/D5NPu
	h9pZ8r2HU1BvmmjEAJZgjChESDu1bUY4V136pjiodEcWT3Jn2f6lFLz3lF6zqXVV
	9+IxshD5RX3pKmDEdoBZbvXWAS2Xkpo1X+n2oJvEO32H4uCfJ9adH0YMVD2xlm/S
	8GRWDdX6Gk+9713Zl4SIf9Eldp6jYflfxnOxEEfG+/K73YRbHlmcQpJLYcCoQH8I
	GkRg60LZaLzASn2XLFoKbcrDXfMW7/QESq3CvjhiL8a3ZMbWYnbhTiNGLDz6W3RC
	hzBgkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnksqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:15:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so46379985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419742; x=1789024542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=;
        b=M7NdC8K7pUZG2mRnC4y+d2+APZXjqOvNJzwevtulITwsWsYjshJXGZYMEm5zaz9sph
         o7nkLtYbw668NIGFwtv/7y0cx0Q/xj8RaKxZ5AjiWONJmbLYh6cebbjrA3g/AKbidrFP
         lQDZB3g6apdIczAt31fr+fTbR/Com96CFYKmJ5a29vLVFoo0y5/zg5xDfRN01fxqvaQ7
         wBJnbhHERCCVKZ75Zn0sOUykitGF+kr6heCTkQfX99SaECIlXSN334oIbPA7Di8Ie1kE
         aWhKUB4MX9u88YaH3i35XScvz6SvD/Ver6LATZDpklX/cpVuu9yj+054FpEaVsp5Q4oP
         /o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419742; x=1789024542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=;
        b=JS/8cRJIF69AXjyjBwbVY+Lmh7S6iSRkaVR806N6Z1IWBW4uB4+xKHvLdo2FF5PF6H
         UqqPLT/1sD9RIM2wZXfq1VjeBWAJRa0T/+5xpIu+KQ7dl/oOtRiMxwZL7hyWJiHQRIjl
         iWx7plmhmqNOjCaQK4CRBzjXvaYH35Vcw/3UB/lUQFhvS+40ETcoGTKHcVyUW2r0D3jj
         ujfaOS+n+3jU4ypdoEvQEF/mIdzPxmIWITJeJi1WhqqhWHWtNWbRTWKGqhhOoSDWnO/w
         bQyQ/KVllVZkr7+BeaHB1EkqWb4DbHBcverC2EaVKsbdFQ0a7E/DRoC3R2glNpfmYYef
         WJKg==
X-Gm-Message-State: AFuF++nUrz2hcqSR8LsJ0tVhCexLmtLMLUXYnecKmB+qvAhaZjy/ltwK
	3TM2ktM2yo+80u/lJOfDfLWQAEtYAgjkCtYzEqGWquY1RzeywCrOBpLOR4kSrzYSsFQjIA1VZNj
	6d18NQUYxeACpZRnuFEWbjB7SbLF80IrGJF3OR/mvFG/0sPsW7Hch14pUlnCydOvPwvqE
X-Gm-Gg: AYBFou0UIufUPKwA9oPV254gX6abkW1+A4Z2b9tMlWlrty05eMSNgdt8n5hR+sMjqjL
	8hiHZC2xdkkLSKDwa+O/77vAVL2Neml/Qibp1YKODfqlczDyqRNRozv9F5o8kAmFdTeAFJzqzHG
	GGmuG27unk9K0AhzIzW62r7OlBcj6UdsYzpzWEcqzGAjwENmYoxQ9K20DM3iZm1GmtoIWO5SgEg
	Wlyw4XrdF0lH3gjXgBnJcfZFcS/TPEifayQ+luJUgbWm7hE3q9uJ11F6u6FuleYtSrFjDSfgdxY
	Fqw9QSK5cNh5KkyQWKlv7/ahVqL5+6YyjXHFs+2AfpKk0hGOW1WKbfWqphURK93Xj7zu1hoLRs6
	3aSXGxqqDxXZCJrERIwdHeg==
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811878985a.2.1788419737546;
        Thu, 03 Sep 2026 00:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811874285a.2.1788419736851;
        Thu, 03 Sep 2026 00:15:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4173423sm55809666b.13.2026.09.03.00.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:15:36 -0700 (PDT)
Message-ID: <05b417d2-8522-47fa-aa9a-b82a252048e6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Add multi-port USB-C
 power supply support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E4ay_cbtqq1PXkkk7HOmdzsKEOrTr6Pc
X-Proofpoint-ORIG-GUID: E4ay_cbtqq1PXkkk7HOmdzsKEOrTr6Pc
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a991e9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ErecBaOdECMvu8LCLkMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX1NfFaUn7czOv
 SGk5tJ81GB68QtEIXP7tsVktmh1Gz/gxqIMD7sX2AiyorYACnoskMTFu9564vfHBJN9z5STT/z0
 mohmKWLWXh13YYTLwMv3gAsrMfZovPPJU79+4rF4xG+tc7f8FFT+iexac+cv8eOMHG/qU+UgBf1
 BcHTThvwehhk3/0NYAbjxMj+mgcDxJalkcsR9oCjrfsuTAWIlUIAeR6kfgh+a2VG8KX2RjWRBFv
 +vuEUhrNwvDLLKSOcbHBehyZjwnE7gt2RYQ61Qtat5mze43RWD+UyC5Nus70vIk2IgwwXwiQymA
 Gnw+9+Vp7mGxm0EucYh0gt+de/rAcfFfTwsictfkcZcRjTUXk6sitDNOtOtRzZFZ5KVhsCVLfDt
 UbjKjr/MQruBmTCdKLbcL52TT+PjKZiB52qyR304QpGUbAAwG22q5RWzOQah6B6FYQlccI7CEMk
 h3pg1X80GFukKpuwSlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXx24ZZYo7JxTQ
 n52Y3hg6DrP5Z1iauF37/58RC4q0bw9oOqj5p1Twd7a7GmQzueOZVa/YmZ800DsMZS4lcr84n4r
 Nd2r9xedSPsIGntsrGlHapGecPgbnmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

On 8/6/26 5:06 PM, Kamal Wadhwa wrote:
> Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
> USB-C power supply ports on the X1E80100 & Glymur platform, which
> exposes more than one charger port to firmware.

[...]

>  struct qcom_battmgr_wireless {
> @@ -316,6 +330,8 @@ struct qcom_battmgr {
>  	struct power_supply *ac_psy;
>  	struct power_supply *bat_psy;
>  	struct power_supply *usb_psy;
> +	struct power_supply *usb2_psy;
> +	struct power_supply *usb3_psy;

I think turning this into an array could make things more obvious

The defines also mention USB/USB2/USB3, so I think we should either
rename USB to USB1 or re-index them to the more natural 0/1/2
(or perhaps primary/secondary/tertiary)?

Konrad
