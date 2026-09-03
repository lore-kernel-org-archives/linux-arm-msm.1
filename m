Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E4439341
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421483; cv=none; b=hXp2iWUI4vLxJUHWKOBmndVicmCa7LEfXoICWQ9+j+1wsehQv1aLettIV58it87hu4OdeMQYUM2vFPzDmqul6mxcuPwzBtvc51v7i214+qq3KHJdivSmIw4Lqi2yXUCTnKYerveQk1C/6kHA0cvXEfARlvs34h23ATq+g2HBOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421483; c=relaxed/simple;
	bh=ucF2EVxtrIYoxtwjlkqVyNBpVkby+vfh+VGNmzhPjeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS2fUnxCugzIyIb7DxUkIqMZk1rAr75wKJRp2BlzS8t198NMxCOtLTf5s7/o1uomRGgPXNKWvRCZ1B7HPQeWDqblWshsE90bO0xjCKS8yW8sB11usfBKdpHRxRYyd+Qo4WC7GN0moYAZL4dxNs7tQvzpBBITG7ADVtWPMLEIUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9GxE2bY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoLqSSp3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9GxE2bY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoLqSSp3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMfp324615
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=; b=d9GxE2bYbIoV9J6n
	3vAdo8cRpuhlBJpyQyad7H+FU7PYcbijJP1ETlOhTt4xdJ0Xl0ej/Axf4Ez2yfzo
	7SzmhzSuhOM2tpH4P18CCBXOockXvXOnlGxZdEiY9hmek4iyeFvT4jNQnzkHImRS
	0XyUQsYVqLkFHQnhKdnAnIu0F55XT2M9HlSJz1UiRZthqx/YS6IwmiM3TDW+Pj9y
	YjCehQ7iDz7IEJPhgNjTEvimqCGkZtVVvGf8AkB86Jbk06arLz0XgLN6lbGnap3V
	KSAFy9tjCo8618qpilFxAa30JMpECeNKIVi1Iowkaj2wT0DuT8XnSHTp4pXP0SjN
	xKp56w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb581-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:44:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so40803985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421480; x=1789026280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=;
        b=hoLqSSp3Z0LmnLzd+8Mn4M2cTFE+zHv573AMMsgLQbMOXPmdK8kOIJ4/w/6Bb1BsHQ
         klnDsdej+HEHOtzAXFFA9pCx1Eg7TIxd9wt/KmQlFqNVhw4KLwEiL6snj5adAUJzMLHA
         Wcmww15pJnQ8ijh7OdsvcM4EP/Yw45RhIH+g8P5+VOpDgKx7DenrgR+fsVgwu01WbcI8
         gmEyw4FSlSHGJGrE7njQLDC5Zr+1NLMEKKYylGOYp1jXrwMypUEJOY8KeWUjBYY9ArQ2
         gDLv6cCk8x3LNDc//5wxyWxpN9RyX0wKArVZ9BGO9XcpPnXWIBTexNJdFAL6lTu0YLnH
         3/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421480; x=1789026280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4wlcDg8ar/Y5U5ai2uST/XXVgdvqbZerTIKwtSKorg=;
        b=rvqprbv6PP8LS19MPF1vcIiKv31Chj0la0jUICf9p1C728+qoJpcXpzjSnSst8RJoJ
         FILvutGlaBM1/Z1mprWLs/HIk8X0WQ0hJBlLXz3yotZYf0HyaHZ83bQf/7pXDLknpQjg
         2dfzJHY+8N0qmSnkw6xX5l5mhjYqB05lT2eHT6dJvd2liS4SdE/YIPYtDKpYLacZDX/Y
         lFXtnWjEa0ecEEsfkQs0zKhW8mnegm7QLmIGZIvK+/nFkmHfR8TZSr4vAOB0xk6JSrHn
         kc+Typ0BcEwcvDzuLJeBM9JA0RCN6iEhMDhLcODhb33T5gxkxrmDxjAN1W+P58Jgmek3
         depg==
X-Gm-Message-State: AFuF++nFINq5mP+sjMbFkxGatPtRxD0+fP9VDE1eOuzMCevpX72nbGQ4
	a2JDcWmseb85C0iklo8Y/hjevmQoPB83QABfK9zK8KtX+IRmNiRduvC020mdkG/DrFJ8D2Q6hSB
	fa946ZQ68c5K6yl5fLzKS6v2IsOfs+GUtVGDEmNIM7nLYXNDuG5SxGqCmf7f9YujKo8Q5
X-Gm-Gg: AYBFou1rba4w0vfh7vL8be51nY4Dsf8KVjUnv4mTgQYjcNWMajuvLcbtR9rJUyTnlNB
	+J9tD7Fs//QnoXHpgxF+Dkpq5RBDIDZbpW8NAbOQykEbX74yU2FvKY0XESzWDvAjJPsLTVbDYWn
	PCE/KvgCCoGltCfsUM7KzsYbFuB3Q3PcgSH4rWBRuvsAsDwkDozlfVqBanwFIuVQ7eaFtG2o61w
	Zve1zHAJSWRUm4F3onZLk/tsoI5ruCyobaKGB4YeK3NvglfA5kBlqd6cPj05svtowSjKfCuyzMd
	vTON30MSW2nHr2A2QYUOWPt+AKss59UH/YgXDVQcyy7kJfFP6Q5W8PAksPhw4lfdWjRxr/3oAht
	EgFUkeksQGxRsKJiOBkPWwg==
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr745809485a.2.1788421475079;
        Thu, 03 Sep 2026 00:44:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr745785285a.2.1788421469895;
        Thu, 03 Sep 2026 00:44:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f6c2a8f6sm46285266b.35.2026.09.03.00.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:44:29 -0700 (PDT)
Message-ID: <e4338457-dd40-40c0-b250-b13246e8215f@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:44:27 +0200
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
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992569 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=katsNAF8sUe2rKcHUFUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX0aa9eS0MK+yb
 4q4KHcsPF5FWJiLk5F6ZrN6ximQnNchx2xuvtzoX9+tlqeAKkwWGSAZGXifrBIfogVZEfVzqk5e
 PZ6cMJawiYlUSaGscS/KD1nqUyMk4H0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX5D+LN4N+0aDE
 pcM3aj4+rCQZ29i1pgvIJBs//24HNauZpN6Z8Siv8pSfZtfn5wInyw+8Y/5tTyEe/lC81SQ+mqQ
 VaaPjn5nZM3SG4wUF2cEuQmxBPRyW6rU2LqUkHY8BezPmLYj6ccAvaWRK0D1gr4mEyeablxKvFS
 tSvJYQpe80uiOFAlRcqmxj8lJaR51hfi8FJf343dPjxgBOuAfVj59zJOQ3wH0hgSqw4hnXG26uz
 inlxF9ON0q38nBWns4dJgIWcHEKPfSHEkDUwk8QauEX9NGzkNiTDM92TeFCaxE8AMZrSOG2UPeX
 wFH55lJ50HEoELFU2kkLZ6hKfjB9DTqLTfbz7kElQCYwvjQ9cUOPwjDYpiUC4cU7tRrRnrzdTQu
 5PacCX10lBxxf2UrkHF9KppOyxcrviZBFn9lB8mzfCTrQzYnk/yjgK9tgusu8irN7QUT/M+nY/O
 ry5sk/HxBrIXMw04G9Q==
X-Proofpoint-GUID: efol6U-ItU9AUK59T8oGULF0m266hgsS
X-Proofpoint-ORIG-GUID: efol6U-ItU9AUK59T8oGULF0m266hgsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On 8/6/26 5:06 PM, Kamal Wadhwa wrote:
> Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
> USB-C power supply ports on the X1E80100 & Glymur platform, which
> exposes more than one charger port to firmware.
> 
> At firmware-enable time, query USB_NUM_PORTS over the existing
> BATTMGR_USB_PROPERTY_GET opcode to discover how many ports the
> firmware actually reports, and register the additional
> "qcom-battmgr-usb2"/"qcom-battmgr-usb3" power supplies only when the
> firmware confirms a second/third port. Each additional port is polled
> independently via new BATTMGR_USB2_PROPERTY_GET/SET (0xC0/0xC1) and
> BATTMGR_USB3_PROPERTY_GET/SET (0xC2/0xC3) opcodes so its properties
> are not aliased to the primary port's state.
> 
> X1E80100 ports report their USB-C adapter type on USB_ADAP_TYPE
> rather than the SM8350/SC8280XP USB_TYPE property, so add a dedicated
> x1e80100_usb_prop_map[] mapping POWER_SUPPLY_PROP_USB_TYPE to
> USB_ADAP_TYPE, and use it for all three X1E80100 USB ports.
> 
> Give the primary X1E80100 USB port its own update/get_property
> callback (qcom_battmgr_usb_x1e80100_update()/
> qcom_battmgr_usb_x1e80100_get_property()) instead of routing it
> through the SC8280XP battery-status update path, mirroring the
> pattern already used for the usb2/usb3 ports.
> 
> Also add the POWER_SUPPLY_PROP_CAPACITY entry to x1e80100_bat_props[].

This should be a (easily backportable) separate bugfix

Konrad
