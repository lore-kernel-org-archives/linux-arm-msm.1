Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E5747D45B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327066; cv=none; b=s65MQKR9G2vcx18cyBC4ASf5AqsvXcTyBxIoF9kMIttx1Zys2/F+2LMXHVx9OwHXOLyrXS1TryjnIcf/Ifl3FeQIpOQ2FOwYky7BgjFAv8x9jSuBjG2aRDdP4z0Dm69HE9PbLJL4nze6XUNhAYo/T+jjoCpivaLiVawjTc30JjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327066; c=relaxed/simple;
	bh=5k6QLzfp9EOmnIdr58qsCb+iZZ/k/Ku2n2OBXhKPZhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU9P9NYh3Tlousfm7zws/wEzsI6MIVXtXrD5aokr8iIPKnHtj8il1Y1WzeHXHtoshNNqozTQiaOFON7wBXR0OrOQ3xlGpCu4+U4IanzeILs2LLS0Gliz9zvE+asNOWzhH32Ka/Nrbl5B7V576NPOZzj8jTpe2+QT9fho/1IYCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j36KunEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgJGRuQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j36KunEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgJGRuQz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBt17k1767452
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7xRn4gcm0i6IkHFV6kZbzngWFhH+D/HYku0JGYpp5g=; b=j36KunEzlDTKGKCc
	6EnnxrhKoY2aie7fGwhJEX6YYGzYLxxjZUzYp360FNyerynTZC6iLId0Ffbr4LZx
	TnzqAqQX2PY57KSAK3fVueokCruE1ckK8jz2Qhvh4ZLACCX80Fi5djyY9uBeVC6y
	vSnF77fCPaJ5iz5EMYTCyOLLGk2sWPJdMPRKqMOX3a4Y8pPx6oJ4F3ZTnwZ4fPJd
	ZVBLPvwidnTZ/1PVp4XnLOM5KcPbx1Z17XvFcC9GFBoqqBRrvqDzMwf5DrDspkSh
	rMU6agu6gQxtyF9/vvUpfJ9uXIMiF4TIV0WrtB6LLQxsFjPbN93bpCtFWF73NBLy
	p890Vg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2kg1wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:10:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso15241e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327059; x=1785931859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7xRn4gcm0i6IkHFV6kZbzngWFhH+D/HYku0JGYpp5g=;
        b=VgJGRuQzQ1STxyr4m33+9lY0igzJ/K641t9fy6lIXlV+xWAYVkK3AmTdQOOzibMbnG
         QsDT9p72hKDNKlagCusOZI9xaAYA+CUjoVG01hG9+EM+dzgQJ/NPw0LWA2QpgjexLChH
         Wl/8T0sLnkAcid6iaSG8ZK9s39bVCwe7CNUCZwgNnT+3tDg5WYalbCR89ANEhMvho3DL
         Biw2e+wuIQgyeitfPfNB2eh3Y6aTdfes7r9/BI5nyif8j9zIwgAPSf+512KwZmK2q3K+
         gOiIuvuom4iry2PjHz0OtaOMjfoWApKXzr1uYZHWBi1KtVzJeARmHVWpgFETayCu9abd
         x7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327059; x=1785931859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7xRn4gcm0i6IkHFV6kZbzngWFhH+D/HYku0JGYpp5g=;
        b=gsW0ArqQIUTi7oo5gnAGMJMxCLW12CkaXy9YWc1cPh4h2nJuBcu4m04ZnyxaGI2vct
         B2O6Hs+XeVJXIF6WUw/Adt9bWiqPjkw/Jk5oEXRY88Dy4apFppDg7hVS3ZnxJUcivCWX
         TZYtRyp2meOr+PUsoxC9LK5Ow36Bsw1ZPTL0M7ksmco2p8h/hg9vkcLcNsYy0y0bQrok
         AUIjhv4w8PIX8OVDGK0cvHuwvwWP4VBk5i+8nzOnYPXYjwuFHpUgMNkoeBBoU007l+Q5
         UFhdpB7iQQ6b1vyAa3zL0PNAaB3UqkD65dq04Pws5sl/4+JrZQV6Y2jAzggfQiNtyqHg
         1leg==
X-Gm-Message-State: AOJu0YxJBdUEvYweJ4WLZ1epnlvWo7KLat4EfsuLI/03t22BgngSprZV
	DOxN9DeX/IQNUw8agKqltvxLpJ0Bxhd/XyJzpqGtmquHn57EEIS8UsUSpV8QqIbLkb9SRnDjGul
	m17orCnXkMSy6HTLvQRd3RzNohfr38cN33IE2q7g8jT2uIMX6RCXSf4vJGNz3xWGBvvdi6V3XPY
	LF
X-Gm-Gg: AR+sD104T2BzU/PI8vDoIG9QZEFcWRTffmJLg5ZOHqNiZNiAbewsnPLTeEEy8O8CKYv
	jeYwMKibJBDt4HgR1o92StYtMXvfBRs8OOM4JZ1v5Uo5ocz/2K2oZwFR6eYT5RurVxWpPrEEB9O
	tIly3OvkyifoFGE7M815rO7CdsGNF/LG1LSpJh9odR6wuO/3W32DmS0wh0o9wQItIwIucD06/x2
	OeGp4C+FqGCbZl4vbB7+bLj5HmxROmwMxnOdq+HtqWlXvpJs/T/RSqja/CkY8u5KHgDpmZKVRKa
	jjRihP8aBqkA1KH49WXftsW3hZqqpjdVgRVAvKa/mesEOnxe9gObDGzcqHOvifnRp3/gGjwREby
	yzN3l7yVKmJ5pu/gJrtNws6EW
X-Received: by 2002:a05:6102:548c:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-754a1ba9552mr1418604137.4.1785327059174;
        Wed, 29 Jul 2026 05:10:59 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:738:8d0f:72a3 with SMTP id ada2fe7eead31-754a1ba9552mr1418588137.4.1785327058715;
        Wed, 29 Jul 2026 05:10:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fabcccsm101740366b.49.2026.07.29.05.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:10:57 -0700 (PDT)
Message-ID: <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX1ZjuCR1+RxmH
 KqUGkw03mGkgfkqaGE+idnMnFLWGrjnpDa9oco9wjoP38Vv5E/fdGOkmgmUrdVMjnx73xvv9Ndn
 8YuclgbddSPC6yO1jDTf9nvBbbH4Xi8+hCLjFKpCAJgx2R17tVVHkQvldotmQ2LQSreILZfu9md
 sJ2npDIo6xVAj0hfrlUBRt2Nwzo6UesX/IhR8E8CDMdsEMcGGrEY2u3SOAP6d7uMYhvxRv4pZnL
 u0um5/H8BWmuAYgrdNSbP+XkZsHReGfBP5IokmdGgJwe/8Fg0pL1vRp6SRrOQVl4JR+q31twi1L
 FvQhVIpvss7WHNGgPyz1/JqITX4hbLobwXSrTCoccBBUOUE9x4NFwXQPLOvdOgq5M5QBe312lJw
 YRZDGrxlCMAc39wyPrwFp5M5YdH/EANlv13Wxmkv7vU6peHDKYPOeriKy5Yh5OhxOvUxP6MYBoS
 dLFOjAQcItXApGI74eA==
X-Proofpoint-GUID: GdsBzXgPLxGgaukkqy27y2gid00bTr8Y
X-Authority-Analysis: v=2.4 cv=Q4biJY2a c=1 sm=1 tr=0 ts=6a69edd3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qsMvIBxTQZfwbozelBgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMCBTYWx0ZWRfX2aK+5pSGhsvN
 2S73Lk//utqi+AWl3YXl4nJKyGNh1/M6hlTx5d6/gCNFifZIGyQrS/+4mnLkxqaP325BQWcvinz
 IocHT01CnLvxbXgIvh5OajtfyuwU05s=
X-Proofpoint-ORIG-GUID: GdsBzXgPLxGgaukkqy27y2gid00bTr8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290100

On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
> 
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
> 
> Remove ipq5210-rdp504.dtb from Makefile to avoid build break.

You're essentially removing support for the board for this commit
Instead, this commit could be:

create .dtsi (90% of the current .dts)
add #include .dtsi to .dts

and patch 3 could be:

create another dts

preferably then, all new additions would be done in patch 4 altering
just the dtsi

Konrad
