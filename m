Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510153A89B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986753; cv=none; b=EqLpb9zLbl49ZibGp8KS/mgRRaWEhCC6ZmUDQadKfSVPpxwkVqoEQShrIIRR+/fMq4PHnlYqy0yCcKnkcrhBUgT5Gndqnwhp3DT8ct7jummyxGCDc8kiC+VrTk+tcByqQgmsW1DP1TyNjdaGFABHHpM5OvJy8yy8TmXE0Hcvz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986753; c=relaxed/simple;
	bh=ISgqwQwd1WJVQMG+3HZ82LwF02NXekQ8kwdnDHTu7qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PL/IuisHUtes8EZ+yrxgqLadwgnx2YDF4bdaXq7G5u0i7j2DRrUv73ajROypGx0cX3tf4RVmCPg6l7fAhP4hV1wm3cblpcqQo6fuYNebfGdiUSy8dpr4t4iM9nEdakVCZiBWfMBT30ds4d4tsoo80aso/QUdDYZf7hoyxpHP2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCe1EvZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKdMGIGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCe1EvZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKdMGIGq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBW7jM2515949
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=; b=nCe1EvZP/0aHf93I
	BdHU2vT98aD5USlH/P+wqwb22JSku1+uqNnuW6l3q9f2qtOUMjuDDyhS/AKwQ9f/
	YZsVsxjWmMn76m0UhAtPtVVw2OnpgqJrj86RhZrv3D1SsYGwuvAbIDXGTTIjU9aS
	6hIIK36//VRJj3FSeXCdrzcZgAjxwDYT4pQrKcalEL9FlbJYj3+WuAots4Hqm7PI
	m2KpLgQ81UN21xtv0MJ6aRUs4pP5ExZS5S/81C9CgovP1HKAtUzm4iqtzku+GXDc
	GyGD9QLmffNJ4wX82sO2ms12M2t34WgmqIhOLjMtPm5QGX2Rnjt3ImmytdLfFg4F
	ZV+MAw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709w4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:05:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d44237e2faso196923e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986745; x=1792591545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=TKdMGIGqBaUsFvOYj2Z5eagxgq/Eye+f86Qpei7NhtMBEHi5tcBvuwDRv0PTqYLmiQ
         yw2RPCNhFTUvsZkssqUG1GJBK5yxJLjbQpvd049JXpgnm751WCpmTr7ym8xvftzeOFee
         2Dn5DL7TaaYKmxLTgum6aW6SJqovRt7pNY0SNp5T99sPXKVy5Od6UddG6xJFCswfMCvZ
         Y8b6v4z5I2igzitdsSCVKKOZmJUcqpHPOsFd7TUHP1fnRitrx2MxDxE8qdTSO6uohmY/
         2xzL2vTe3hdYSxRxA8ewCl/qj9JvO8V9TgU9J279/n/Ulbx3p/ttZHAsW08z369LXZ3H
         YCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986745; x=1792591545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=rN+6Ucc6+8P0zxUzkttiVtqF6TQi3GgUnlC7OmmF8bBI3Oy8VN8laBrZFpRqWL0egV
         gwumZysMc9gBEcq2OQw850WVbNisQdJZrLxpqaQ+oAENQ4mKiuxUoGQphuPhH0iprCUP
         iEsZ4esXF7eFb34XHSEiUwUoTZmP5U6vx83a0R1y5bkdcwjyC/3d47kagnVZtix9e/BB
         Eta6R3UWJuVSg/2lALPBCOEF9AZSg6359jChyfxzpBo+kD3OIsPs6ZqsIpEwY52h+zWS
         yitkxawkpz5AOScY+zpuz/M62B7INydjy/iz+Ajs5HXaGKYvd4net4l5cXLP7+f5UCIl
         R59Q==
X-Forwarded-Encrypted: i=1; AKwUvByuMTAik+EkeSmA8oUMGyP9Bd+DYA+GO18t+M3f5VzsfoZxsbtbMIjqqFc4JC6L0kWrTkVaCeq+Z1InCkh7@vger.kernel.org
X-Gm-Message-State: AFq9FYK8n9LvCP80oJ0jI4ORk+jGFL4FeptxydWGw4agrT8AhNDz4SW3
	YzzoZZV3/0XZsznhUxpNwF5xyOgBtt8uLQB84tPp5obxV/hBGRq0vnPYhBDn1yo9GN+SpBcLCMM
	5iXwmeq6/1k2PcbtHlrqSlHP2rnoZQWaDNphBQ0cQsYt372ugj9uXezqXfQGC2CgJC7k7
X-Gm-Gg: AYBFou0FclXrGCtkqQvgEQKoWxp+tqoEqzvukmVqtLsNYzFz2+KoGY45Q9MyHAlYYYm
	Z6+ygyeLNCG5/8GDnaYVPCT8YkUrVVyxiWzw4V0P6BCqlx+xzFe1zT1b6d8Bxs//gRCDyLAQcXk
	0xW0D+Kqab3U8MZBcQyJWZDQuNjvKo/VNzNb324JO51Xv6wCMAFZP/Rx6xQOPVSmQ7OmL2zIW1J
	1GDyg15aO1d71vYG10jvDaacr8B9N9RNJtyox+huHkBZKFfOlESK/QdK37csVxVh2SEMZ5lTegw
	oAoLDrkC0UJGJh4FzznblujLgasKcGQ7H5XLI/qAo9lVt6RA2Iw6hetBJVjcXWrZz0D5i21SU1f
	XGqo/Zwx5SKL9Rxth5+L+yw==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449595e0c.3.1791986744672;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449553e0c.3.1791986744082;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203862c4esm1222206a12.16.2026.10.14.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:43 -0700 (PDT)
Message-ID: <d2ab26d1-2feb-4759-bdfa-7db9b923e7a6@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX0uczFejvJlMT
 T08YadfZC/WO0pvyS72f0yh5v0JoeOijJwhth4Ow0hGYlePMJtdqPqcFjkkEQqzArU1GvWEpU+d
 2kVMzymVxoosxfS1sc42NBOgGmFOrKhKQyHcsFiYJB9J3UqOKfWFHJYlaU624fmLUM4vpb0a8cK
 pIRP5jKZeZLvJ3B3v6fJesReN3JP5t3/TErXjPD8tODwCbQ2XR5fA+dtBFB5Rfl22QOruFcrpDD
 a3Qo0HLyolGHwFxiU4QnTKRpcxg3pLl6xSAtI1G1sHqK1gyO2IIaRLcw6nDBdpGCAL6fm6U7Pgw
 vlobxlOPlcEWujOWDWc8WWSHd3fXd69N7W6e5JHzm5uL3P/Zht3JCn0eVsf0enzKnKbqX5NZRnC
 L9HqcWAA9SwjRzbFSIqZ3lzgBH1sQQ==
X-Proofpoint-GUID: 5qfRDFgl9NiHAcP1e51iaXmcDB3ELUjc
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf8c3a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PngBsCrCUa3bum75zpkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 5qfRDFgl9NiHAcP1e51iaXmcDB3ELUjc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX1Fx3BDpBbksN
 IoeG6IpVPtC94LQFpg3761BjBeR02cvkk53woAJQS7z9GJcmfn6tMASrIfc7MP0oOD/0GCrF5ds
 pGHbXq8eJNzZwt1p2q/jWC0V6MDt83w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On 10/14/26 3:02 PM, Abel Vesa wrote:
> This is an RFC: I do not expect it to be merged as-is, it is sent to get
> feedback on the approach.
> 
> Some values a platform needs (for example the WLAN and Bluetooth MAC
> addresses on the Qualcomm laptops) are not always available to the kernel
> in a convenient form. They may live in firmware-owned SPI-NOR storage
> (e.g. a DPP partition) for which there is no straightforward, universally
> working way to read them from the non-secure world.
> 
> As an alternative, this series allows such values to be provisioned once
> into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
> provider that exposes the contents of a UEFI variable as an NVMEM device,
> so the data can be consumed through the standard nvmem-cells bindings.
> MAC addresses are just the motivating use case; the provider itself is
> generic.
> 
> The first two patches are the actual proposal:
> 
>   - dt-bindings: nvmem: Add UEFI variable NVMEM provider
>   - nvmem: Add UEFI variable NVMEM provider
> 
> The remaining three patches are included only to illustrate how a
> consumer would use the provider; they are not meant for merging as part
> of this series:
> 
>   - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
>   - wifi: ath12k: consume a "mac-address" cell
>   - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

I think we can take advantage of Loic's work here

https://lore.kernel.org/linux-arm-msm/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com/

Konrad
