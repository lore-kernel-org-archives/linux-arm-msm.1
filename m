Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000777;
	b=l9Y3mTaPaa2BrcLYHl87Dv9u9QpniSslNRImh1rii0rPCHflagkikYroV5EdwnWp8rSQ
	 su733Tpxnb/6NVPPjuwq66qfNS+Io2tcWpwJF5SJW0EV3pSpimStrRRrLsQuhF68xs+cR
	 TIT8eW3+X8Kf5LavjNjQXKtKZtoyH9Fju4Wo/0d75qUze19TOsinKr6JV8Q+EX9TNMJ5v
	 GbvtLAvT3RVjUEVugbjsJph4nDSTVdn2OECzd6sTXeJeVDcMXk8CXaZcUwp+vIlPxqngH
	 +tT/aMVTvirmPGm1HN43cOTm+SZfnufpYPHQgFsFGmv8yOwyCshjB1ewF/C3OajDnqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
	b=zXJJIcH9e4Ljk/nyJokN2Ef7c4b/TVNoZQCpVuttC9uaZzB6VhIemT3ohqCD/TCxYigj
	 qSnhlJv5elcIHBiYfAexbxwHSGpd6H+wFnZUpjapKCCUcqFydSVALsimWUWMMnYluShXx
	 VcKdR04KLSVZztSS1pp6SSzfmrHRjD7um7rVPq9dEx8CuoWZjQYfGzQwGPBz6sQ/+VX2+
	 +iUEJRy9qlDvniFP8t62gfP4wvJ89aFQfzbmOTCub7lfwb17pXB98VLeekk7WiVMgZObJ
	 8WNX6nlJFIAfMqprogjhTCW2hcpUhpl6jVAsrjLXXQlEdhbB4rOxSi/2q1WR67h8DiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AShNKIfB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA7606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AA7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AShNKIfB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kQdg2930605
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfdUdOtc3RiS06TxKquH3bKP
	EIXQE/OFSkda9ogMo9M=; b=M6dMGV+w/8Gc4TL7JcdVB47TpayE6jT2Zl/j3L2+
	SIYV2p4JERPooYOkfo03opj5K4yaqbELYTCnPO9xAtfgZCgYHnCWbR2wcvA5ub0g
	u/f0RJQIaK0NQUZ2FfgPp5VNiWvvoXLUbgxns3j5UxTcE+2jfLfINm9+UzN1sB7f
	dSm6C5Y+WSYaQwX550EF0QQ/QMFQTFs6ymB5YqpUZFsxZhvRd4INBZ9wbZys9HQ7
	t/mP8t5GTIJtv6qP4L0/vnMFqJUL6Go6eBdTGFTMHayclA3aRcva21HWOm4q5whi
	T4tf5tEJ1XPLXRMS+8OWMPQQSBPO4EZ7HicNgXnM4VLn1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jqru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:19:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so156105085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795000772; x=1795605572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=AShNKIfBp0yUBo9FJT0PQZHFRRd22TjVTNKUeHR1S4/dgdXY4TLyRAE+CzQATbLuD7
         9yVrUXWPoANLu1mAPN34YegVkwL4pcXZdIXZ4GotrMnB/vk5jwpD33eHrwX16RCvgUY6
         jtwcuTmkcpR3jsIwM1UmK8BGx9GPGPVL2bqxvmQphVe19L2qjNWRWsdF95FNHGNKJ/Zo
         E9ao7i/NhTsXSymR4mXIZxUS5rRJKJg4Fuufgdzu8wUxHSoh7zlEur5lBJ9O7GcLPVVm
         A/k8PGw+GYNiMRVOzltrxOaG67ndzfl1Ao7ypbFsSNBEJd1UG6qxCYLogHkmOEbRgcce
         zOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000772; x=1795605572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=wmEwjpQlHPGrGa685Y79fvQBrtMwx7kdUatfT02RWoNoCdrOK2hvIKLeudM4cdjtYf
         ZGGytmSnqvaFhitn5N+lHA7aLzH0yUnC6CKwLQGUFT4SOEiI+MF56vD61ltuNjdhYUpy
         3ECC+ZO+9Pt3Qecz8tkrR5Db/a6p91AJqhmLMhJGbS3PjLDLcHwYfzXw1gT7SPsJUTNz
         6mj8DRK9JE29cQqbRmgknCDbq11CkRGWASjyI+lvF5GADy5fU9/MH4w4mkc17whE8P5a
         yy62l2zotqClkEbGSfkbvluFTC9ApkoDTnJFSrUIjRZpPsg7XbXNFOARonC34oMD3mtQ
         yraQ==
X-Forwarded-Encrypted: i=1; AL+hErHT32z+Bu3UDP3WJ0AsEEbR1ROlbpOrM3trN5lH6Nl6RXpX3GT7Hjc4943iRoMtzNr6wKbhPlbqUrx3NXS3@vger.kernel.org
X-Gm-Message-State: APuU4Z+waRHLaEWngkMSA35JNx3KC2TMUH0BQpp1Cc6LInlaVNKNdV5b
	DFwfGg7rmRcUuWsvbEDkbTISQV7SEo+kqCKCLekNrl/nwfEablfxQALI8gk3qRo0d+3oQHIHzKc
	aUAvleYGe63qovSE4xVa4JQEXDia/tjgbJ5AL+46zXZmJZ1XcXREmdIv41yLOssbla/HFz+zsAX
	Al1iw=
X-Gm-Gg: AYBFou3C+3XLQig5cQTOyGmiYAkJswfe4mGUhRuvBrJYaPx4pEM6tyGdeEvIPCMr9U5
	hqn1rQDt9xSiBnSgDB9cwllCu2y4kAGB0zojuR4mK6h/8b/3+5UXuigEfFg3UHpq/dif1jdvwLL
	5xWdASZefjaOF8t5EmAmbvHUvIltDtf3WwGpwAUs2/EtXllLIBcAETwzXmlVeDhr6uVEKZD4Eu5
	XZpTM6F69eflb7BztSO0POFQhKiw+Rp/lgWuLOXsEdz2TPDBlDEepTFJb3atgCEGbjRhkq4+V0P
	eJOvkVJzyPz5Bn+lLAENTclUqz9NwIBw6ON0EGxkAQarFunktisdXQIemaqHT2WYDDs0Rqwd0+5
	/4AXcgzLo7wPyWtzFZg5c76ukN61I6OKOlNw969+uz77kXTfXqCr3mEgOASB6dbb1gvMNicylFX
	+J/yr1yNWATMs=
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370172985a.19.1795000772608;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370169185a.19.1795000772100;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c7b7sm47426705e9.5.2026.11.18.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:19:31 -0800 (PST)
Date: Wed, 18 Nov 2026 12:19:29 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <av2JwTRWxL2BXU8e@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd89c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Mc1FV3LHUU5Qy8fZID4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hFXDJSdm4dAgQ5T6qtrWXGhpHV_q0DEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX1xeouIU2yqxR
 P5EH6mim6ttXJUR5nXpMg9bvNI4zTV1nNsqL89Woe7T6F/W9fmRwWYV4ogaoqyhD8qMDbVWKioJ
 x/+us1jm7JL/xSL9fgSZ6YMmjeZreLpFb1F2FgL9cotdOLkblMjX6f+9KBVqm3swLvba4M/s5+F
 QaXEpVpxxPyE5XhxGKs2K3sY0LySPnNlz+xDgAbqvwR13NUzfsVX2pd/e0E56lu5JChr5xCtR6N
 jkw4xsif5KeFqRem91y+UwDnGtAd1HacZ4ZIxt6iBW+uLrIIIUlglGrwn9ileOUbMrmWzOytFzW
 /mYyBpuEa65e/illMDJjbJGdYUIN0bGU7OJ2CIn1+mH9VDO1sCqiv+OlegSWBqUUcfg7SqLhTrQ
 J64yo2JotwwRBWrGzXoJ8p5iNnKX78UhOkPr5f3vMCIYDBSbVVrp9IoM7/bYu/6AcnubgH5SOU/
 xul6gIwlere+Zgu3Jfw==
X-Proofpoint-GUID: hFXDJSdm4dAgQ5T6qtrWXGhpHV_q0DEI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX7xawMlfoSF/1
 HWUd1n+AFakMzeLV3HEMnyl6iwlontEhgbv1hY9OfKhVoORJABoMj4fuIHchCR/fAOsMZld5z8D
 MwrDm9eUtXqqHtxUMMrgZ7YdxMrBQpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044

On Mon, Sep 21, 2026 at 04:46:57PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.
> 
> The DT bindings patch was sent separately[1].
> 
> This series is rebased on top of current linux-next.
> 
> [1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove dmas and dma-names from uart nodes

I'm sorry that I did not spot it before the patches landed linux-next.
But v1 does not have dmas and dma-names for uart nodes at all. From what
I can see, v1 is all right, and it looks like the v2 rebase moved some
hunks to the sibling UART nodes (identical context). The QCOM_GPI_SPI
channels of SE 0-3, 7, 8, 11 and 12 sit in the uartN nodes rather than
spiN, and spi4 and spi14..spi19 have none. v3/v4 carries the issue over.

I'll send a fix for that.

Shawn

> - Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com
