Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659955;
	b=qgQycgIRFCIb/xf/UxpUdt9po/x3Nc3C81L6/1YtyBy9YkOF2TH71cpXKoMN69nFlP35
	 /I/57jDJ2nkaYURo9I/q96efiSvwlfk1CtublEj2X9y0Pm2QecdrDBea1edjCencNnfXI
	 RIx5YbTX4lI1TQu0szI86Vm4DJMs9tgoZ/cMYoo/BtPN9qG40RnPcki++FMToV96SJCKU
	 UgFgx+yFqGjC/i7SvEmYrGiqOAvlV6ZXZEln2W0papCBjNYkP2xesGRm5JFotgO5jUox7
	 7aXZ0FPQ99/PuhBQt55JqftrqGV/vA2EM7gXUlVCfHkquWMLSGZFYxpd7bxjw7voMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
	b=qDUH6JH/F/VwehlVOVQYRhpgpHHHdh03T4QgUPI/qUy+GmaohZLVkms1Y0W87rgWBpEE
	 rArfZCroi67DImT7IAqTiqKnplWIVHtwU0ZNnyzYfcltCN7dq7GrLSO3paOAwKmra1Orr
	 yicfkVoI8W4R+MqgByDovcDTNq+5YdvtwFv0qktplvi7Qbt9qaDXkBWsxyYOHT7pHuNRn
	 BlBGVvhtEi6o7oy9fdYkNifwOFmN0x8q298owHT6GAFZfOkgjlkG9iZUTepjYeJATfpwP
	 5ibUD9gKhklzq4zFhzSkuRI+BH8+NZA/ImfcSvZbSluoQb/vnNv4GJEUU+Plbn2clIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2B606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C2B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702av3076364
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=; b=liVqCkreZmk/rJxZ
	bvPqMCoh2XwrtRWPRKpDCbxgPz1oHtOvIFzl9Kx3RVMLTIFPlLaXTFOYr2eDG9NJ
	dNHcWMR5Hv3ti6aBvJc9IUqP64tEZTkPMZ1xtMysbOC8JRL40ZmiecCe3Lg0kgXo
	uX7NWPGVrxTPTym82ehyZsgVurN+zMCsEtsK1sCyDtIhsT2sUGjLCw6qYll1lOme
	h+KbouQO6D9U1NtBzEFgfrtfntTNbtvMCgW4zo+PKumPmJR9xDQNtAUgJ1L6n3sG
	PXQ5ZHE/OFB5agtBUTOMGxw8yeB7KNbBZ1spYfBB4ZEzoXy6NVvf9Op3tGCQStLZ
	4sZqjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1kgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:05:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91795e52969so4382276d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659953; x=1793264753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=H2d4Ur0HLY/OpwYtUQF7x67o0xPAj8uMqnIdFSbMLXHU5lSfDS+ATwZF+sLEZyvhUx
         NcouU7CdlJtarFxKXdN8PHdTq+ZJchFhogyhn4Y8batvYuCMyltgUTYVeuj5rg/WE8i5
         7U4soUHVIget/zS05qYG/tRaxY2+ekrZQHEqtt13d81Pzvarlw9NDnECg36aLvPXkbe/
         2yowN3zWwH0VeQayH46mz8pb1WAIV9rJKkB7lhIBkCn43YK1ppAuLZVTWy+lPO8lt7mq
         KlEdoyi0IOMY5lI2mZEboqGIFkrjtDhlPZqbuPAqWq8HO+r6SUHeQ+TW0C/kBdpSBy2E
         /11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659953; x=1793264753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=Luyj8wzjFItktW2KHfpggVlUoYpd1ukO6/7Ohnp1X6w6/ONKiXDuAgqhAn1Nhttu8e
         WM6fgIsCkrVYgwsX+RVLLXyCx8vPZQirmLMVMbnKu8ZFMryQH6CTObRK1+YNY36d1/DU
         8H2xK5/sL5FIdomOw4OukF+gWNZoycfIj0P6I5qiFkVs8jUwkuHoKu1paVJnqGdHjLew
         FjT6k53+HTdDf2WaOaWzawOHAbjgrYaiRz6wIwUmHb7ezCxt4lxVGtdGp4TiR1d/VE3g
         bvTBzI6e5k2bWuO85DLhmngHHEaoYJuDkBeIzXRgoFCHAPrt4LWuRH5PYJ8RB2LmVAaP
         XkoA==
X-Gm-Message-State: AFq9FYJRh28oGFRuX0SXRZ37uoe+VKk/fLcRmgkf7CDA713+AEHoSpZ+
	fT6wk+ahawvkOf1xZvk1v/fS7X//dqaqDS0lWlSW28a+A1BKFCFu5i3MoVJU5kO+QqZLcx8962/
	zID7j+I1fJgJf/ci/1J6r+zNRQVp5wfDCHPfwIfGolsGjrZ6lWLqIurgq58z5IC1kJmlF
X-Gm-Gg: AYBFou1jb8DCyD8t7UrwMI+SZ5TmiLjhVgaE5BDSvPxCMXOw953p1rKgOB1/IpJCHN0
	mfkJOrFdTBLkzcOr/+saccyrVunWDA4klrzrzAydJ3pqf5NfiI1+tWVuXCdyLPOevrO84/AkBw+
	K4y4PehiRuqqyhUiABmcROdJRAsIb6QodshrPD3cF5DdQrqmO0eGKrK7dkde64EX8zDCeLT36zb
	vCM8HT0DLCX2DfsedDXCnUN6MJZEgd+iFsen+ZYyYHJiAo0GmvW6bDYD3xjxUJOkBxx3pOzwbX5
	8VIYk+1OSiiMqPsA4P+u/UHXgooOxKm2Wv6atz5mmUPpN36icVFxCBK9CR8gcJxN1kH8+tSoPZN
	XJhRSppPOvQt2e7kTIvPXKQ==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988866785a.0.1792659952777;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988863085a.0.1792659952237;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316698esm1638748a12.33.2026.10.22.02.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:05:50 -0700 (PDT)
Message-ID: <741e2f4a-c49f-4a4a-a376-8e986a609bf8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:05:47 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXyunIZAnXIDWW
 ZQB3IKrsosDA2MOESKHS5Ajn94Oy261OyYGJcSTqITGNtWHspEV3Ucda4isG9x8hbIwkFp38p+2
 c8WrEvT74SYvIo80JInOqTCGmiQ0E07Vw4cNT5rea5intrbieiSfegA6nO7ehJZ/OMvq5/4z+Ju
 QoNWovmxFDUfXYPSzeik6gVTWLNRFTcIPVZoCAf8HIeTrMuY0h2Thgt8bqX5xSBpN21ynFqz6C5
 SM1rhE41bowNWcX6SkuNJEBRQo7QQ06Uk+/j6hOI+i0zkNKLuUbjMivksfq4zEAPIYCvzOa36JE
 l9M5AANLtZXFToM3z2Sf6JUjDIaG73sdT0kjSSdBmkhC6Q2rPiyy9pqfrzZ+j84c2KnWAnVx0bt
 TMis3blXjZqBcEFc8PH8uQay5ErOeigDQKU7cj5QRYa+JwbQppw8Hhu7NSqC3uk4PKLwdH3ao60
 dTxBcWfWO9Z5BbHDF+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXz9B/9OYxGE7S
 gwXkyzw2nvQkN79jhn7IymclRdDNOa3oAgPZHSZJR9SzZMu5ydWiYoT7jiuUtZYn5Oyt6O6tdD+
 5ny6VdNHUQWYItsQeKkmxbPpMeJhFNk=
X-Proofpoint-GUID: kAbGT3KI5TXg5tqYElTdZPzuobT7pSLg
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d1f1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ix1rd1RWtsmLIZAbYf0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: kAbGT3KI5TXg5tqYElTdZPzuobT7pSLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/13/26 1:34 PM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
