Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038BE456E03
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804716; cv=none; b=ZZS5gnwavE+AJCF424juYg1oqBWcja20T5iYAmrKaWk3Qmsu+jQ3VeKS7U7FaHL0KhKchHoAyU7ePPe+bKJ+zaBOdE0L0g05xgPZ7OGfjqlw3aXZ4AXLr96a9wKx9VAcW8iO04EOL/D5j1PHsS8ftf69uEQoezMAWoDg4iFkKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804716; c=relaxed/simple;
	bh=JUrzZCqhpr+6E+MrqT462051gDoUBC8OqfAEbMmtKk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL1dHeQ3v436JnVgL9rA2PcGgsqtOLNBxpmvc/QK4p14O/C09EeIvoNSXbYNhtc4uCyctJi1uTOZ/iR4udF5/ULNsQhUs5lLs7D1yx05AHqsS0FSsUtpwF3PnGBGDONo4nbNqs7Jq75R081swNGHa43cfTxz6Y4rSCoukwxtgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=duRWL3Ce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6+GV2tH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="duRWL3Ce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6+GV2tH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Km0w2181481
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=; b=duRWL3CebqWstGBk
	LhiyhfPk8Z3WHzzyHSmiLSR0RscJNhZXVAMK+Yn//PiDA/qa5OCvtXlOaNw47QYR
	/OXL8m3Exx3xRyw1i+mRLPNDh/t+k5W5hRCPmQt1cL09xzadNR9zEpIQBqpajEyG
	3NKhmc7pDldIGWHcTt3xIt/6xaedNdCzio639P6Gm4xh/mVZxASetH/B3JUlbN9g
	BgtjZKmPqWpI2Zn6J98q5PrACqPXzPqBkaEtqe0NihiMkb3rsyjm80ZrMbAZ5ssA
	sU7BB2rN6IqH7esbaOLMjNgN4rHNMkNkG/5xXExFmPyfGbW+sIVYzUyW6JqzJ8vQ
	bu1zfw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1sp9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:31:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5da7a39e589so35855e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804712; x=1792409512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=Z6+GV2tHJiN2xVqghhVAVonS+TAj6gttGHQChOsQfowXJewIDn/SaAOv0qYhSop9zc
         uE+QvP7wOwcasAdF5muL2kLe7VlOKCl1Jjdv+zhAnwJ3HrMaqbSYoAjGWfE8XqYnWyqi
         oz60JYiqztr07e8FCKRTO6D0U+PpYwGX5/ud25Pa6x5w5+POY1qzgrBzdc5/0yWW0Swy
         9JdzMM1Z3mqv8iTyjPKSWKEzrkMzb2vXok342nwYsrdYb4rElBvTqB/ddXDXUoWZGW9I
         bHhT10XdSSTJlsoNZ09ApZGWAGROCydLqAfHDd0FSvWtmxFC5zlt0tKU1YUkWWQmlwqT
         rqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804712; x=1792409512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhAsnUJQR0XtnLbL9uGATdXzBNkrKbvYlxu+kfkmiW8=;
        b=YSj8buqVWQ2T2dveLbAnjkdYTzL7cD6c7nC5+AaMYsSq+ij552G7v7kvwm7GkQgYBb
         MUhq9/p0rodw0FvUb6W7JS1QcKLuilQ7G/rbmwH3nigc3N5x4r1iz6aFqTEbwWx9JbH6
         I49mq+Gy1E59RdLJlayYFwLi1vxsEnfq/+71c2IX9Qmetkny/DaBnEeZv5hRGJcFq8yR
         /Z40Xl0PKJqfU4N86o2xZ+4QRbEcLqnw1lSrgcgtIHCg/bABVDi7ZHk2lXuKmbi6ELlI
         FFl7A5KkMKRmm1YVORTZqj0I3shMX4Wha8zPCQiQ99nOuR+i8O9pBnOg9BHKc38cdptB
         c6sQ==
X-Forwarded-Encrypted: i=1; AKwUvByZxBV/+25bLivKy+JJ/1kCv5haQ0hTCprCOh+3sLY6xa4Lf4IPo+ferY7FY8NKTnVCbSUHdeARwHkWNiP5@vger.kernel.org
X-Gm-Message-State: AFq9FYI+nQ9UHl0V/lpUwAyvw7GU6iTNH+5FS8Ey9eQnx0dIUZF/iYhW
	veLh4aJka6rkUgHRB2bUAWI6JzhYoimFtdRfbyKTUl2Mt16gti8h3NQtHh1MvRZckP1Rwb0yfyr
	LBLoOe3wRjcT0lvyEHeLCtapWiQ3PvgyWLoWaEl4HfVIDjpOpWQqU7kbYsHGy1p0F4Pal
X-Gm-Gg: AYBFou08jaCzzaqHYUC8QoMOZPpaIJXGv12TA1Ll7A0Og7i/SZUJH/cQf8fScZXDWlv
	ArE0CBp97DoHHiBriNN8lOuNrEuD6yQZdfW+//1mziBiYZJYiyheBKltmYLgCXSY4zs9LxFzbwM
	cH2ejHTCyRTPIyrMor66N6WSu4HI5jbfIhjGFyNztz9Qb8KNYb0sUDMOykHt6h9YS2Iycc7XbBl
	CoMGxV86VGrg6Di+JVLLfAQHwK2j0Bg/kTieAXAFWy1ukD8GYShLi9EnEoMkhsO/91+unM/N0He
	op7IzucvATuNo5DHN9Tp0j2eCHfNkHiCQdyTQovGyUMoOB2pL9Rq5ZyHKtoWPN6uUv0coby2LyW
	mAE9pfSaCtDn2PLofPS2UZA==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210580e0c.3.1791804712108;
        Mon, 12 Oct 2026 04:31:52 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1210569e0c.3.1791804711604;
        Mon, 12 Oct 2026 04:31:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1453bsm157724566b.67.2026.10.12.04.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:31:50 -0700 (PDT)
Message-ID: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LCmaJL7G1rDIklUcX4gS5BaTtTEouFQe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX4CqS4sJ4/UGe
 lyEZyBcyvKxbsNFD8IvpgdGZ4p9AO3oGV551yxPUILhr1s4PMEpfIoRuPrNWKfLilhJE9XaPQHx
 EO2PIc1SjHcbt/VNdS/PpG0FXgPsws8=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accc528 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ojr5x5PTsytl4pN-IXcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: LCmaJL7G1rDIklUcX4gS5BaTtTEouFQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXx/6e4vQcvSlS
 ermeD2Y9ARTHG7wferTR8FGPqV1ZRohZGbibhYAXyH91tbV/LzVU1pEKlVxNAMs8Vcb4TiPClYL
 Bp6XAuMH1qQ7vvsyzM/8/fs0/JFLfEdM8JLKYLSjDBdPwwLp0E3Ik2eajcLPY4cbKgzSfOOzx5B
 hl5h0ceTYJ9hneDz5K4SAWDVtPbgp6m5E0ESMUE0ZVoyCjC271rWczCg+XlaV+LsojDipAEDYkq
 0lXQUoezqMk6n59PZqQ00ton4p5HCcevxadWyo+S9tV/7ePlI+3Rpbu5vIkWBFk9pgYTH3lzKab
 ZLy9jXpTE58KV/JRF2J2s/393CyiYWzrwxP19Shz/LqewIACD8rJyiNC+Sz3koL+eQtvDIojS2W
 iUCGDQ3eHIB27eL4wjlpzXO+3g9oec5GUZ6oicCVYlBCME6H58AZfSch1/HM5GdtH64jQRBgu1C
 25jbSAs4u99y9kYqFhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
> The BCL driver provides
> - Real-time voltage and current readings
> - Configurable threshold-based alarms
> - Interrupt-driven notifications when thresholds are exceeded
> - Automatic threshold management with polling-based recovery
> - Hardware-specific scaling factors and threshold representations
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	bool			irq_wake_enabled;
> +	bool			shutting_down;
> +	enum bcl_limit_alarm	type;
> +	void			*device;

Why is this a voidptr?

Konrad
