Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C941D214
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970641; cv=none; b=DizwNtPWm/KHD8xVMjD+AXS2ccnXYniFTIN1o961D70+BgXXN1qclGoDBTsGmEIcbkBOEsNmSXk5lx+t3n+EjrlTQ1rAMBfkcNCP1LGrc9aX/QMG/eIi8dfdG4tfQf7mHieaDKJMry1Ltkf2bbeLenzFb5zcGq9UsVLUzZvq42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970641; c=relaxed/simple;
	bh=EoDEFKf5hHzd4mY7d2njT5TPE7Yd8CeAwMOX58VdXjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgj5DcBuHvVRDj1o6fwhP0+Gv83MFVrqtKwnI9WSqtvRWXImxu9b50ozFI/aYhEt9hyI4kPvjvf5ndlVB1ZKXtO5dIaXrSSpcEAJGCKNHYHVE2F44SS8a8xLJnVlPPi+qwb0GD16arZweopfngQIIjWnCEzItnzFjimzFQR99DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2beAW9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOOufO1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2beAW9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOOufO1u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9skS1388509
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=; b=U2beAW9mDNw0i1CB
	hCdwsS6rPblRJ9oq4i64teS1l94O6etBTyUh9Mccg9xrEI3edPLb4XNNq7PzmOcD
	SgMcVQItZR8UTf6LTe/NWl2AmpTOckkhy804394YM/7cZUNFGwkfmwhfj7Gqr6si
	fGwH4PtTGSq83l2xT65dHYZVz2oQ5rl0kOZ/SQxdjNdFW3r8vx3wfZAq98Umavd7
	e44dZsx/3Y+Ghi85ju1Iigpda8YFb7rvJZ9XFrbLJIgmaeZJir7EdvvftnLxVAER
	wZszJ5G36K3c+dWy9+Zu36Lio4xL9VH5xwn5repgQKbyIWZvEr7BDIPT7491DHeN
	QRC16A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30h2up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:43:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so3813221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970639; x=1787575439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=;
        b=XOOufO1uU1qR3VXrUzRQ0GfP9wD+uLP99X4U8fYsrcvVI1ZWavzS3eMIDnCzuNz4e2
         j1hqcTVv5BK6X5XoAyFWT3IlVA+d2AHEOOKUflucXJhwe4CMJovtsxS5HJqi3fZTAc9+
         Q4mr4qSQ88NVo/2ArO9GvyBw40PY1CbaTPvSqCkr87p+iskEmGA8xQcTKyJ36hq2AYNZ
         U0LPEXWK69nGD7xelb9zi6OZZCci2r8kKI2/yjvz7I4ce9IPTA833AsHOP/q/ueU9/rq
         eWPXl48D077/epEM0Rn+VkEYU1assHpbbl6GF1DmH9SOtKmY0PYVWAXkT09Th1yFoAXc
         d7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970639; x=1787575439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=;
        b=ZTfx6unDhhK+zXJJHZhXMLxgXB0rOJnMaWde2CJIpZlketUcPbX9qGqic8UkSOWOV8
         UWbSc8/l9iFM0HXTuzVVxI+W7bNxXixQrtYGn3dbTTM2tqMqXToMOT3eRIUM148fjlZc
         MyI8viJFm1w0Lx6x/ADUmwJ5Bur4M0cxHTDaLGuVBZfMgH7gruQfUiCnCFxpp7+FgvCp
         AIAmYvQxMLGFQVeYyD6a4lntnNXK0tgkdy+OL8pSR8/O965dmx1OIibVr+YVJ7jmgHgg
         dJVhVyVCYidd/2p50hHk1mopCUec6nDDkZePoRD8gZtYi/iPgPVtUuZtPaAnEsb6xUIX
         1IIA==
X-Gm-Message-State: AOJu0Yw74tXZOTQ1QdxFC/QqaiBoOLp6LhwSe5hwf/HPJ4MQG2l69J52
	Q0cqd/Mg7i3brYEyvAFUNvsyHPpekwbpaxjgKXkm+I/wzm8gh+ySrVLdK+7hy1c6Kd/biXbKZ6h
	ds/8tWbRWNyF79jdONt8u9OTBrk4i7ojrUMa8F9ibBKs59AxZ2vRQDWD885JRKiyXKfE6tqxjhh
	Uw
X-Gm-Gg: AR+sD12LU9HqlHfn6pqvdcZJwAluCZzE4Bru3NDds2lT8VGQis0zalyCuvgH7FwAT1V
	QtKMZ89m2IiRb9ppCucRdPuTQFVnXtD04pRtgv37y8fmMAwXQH9FdxskGZxiM+dEoYm9wqvylk6
	avf5RxuYO3MEuM0wzfhvPErcX84bBGdzO9pKbZ/wZr5iRZdW2dkh4GvTFFmfYNPd+tWyBNrb1mE
	9arVhCuV22lCReMXsArcBih7r2P2dv5lUc7DnCnvlRuCq9brQR3Fl9ECd2scd+xDFgSGvcA9AdB
	jaFrFpIDC3KaQoQi3YnM9lS8uC5enkSla+nj7k42P0Am+G1KVwqrDtM42TLwRhL9kBN8tDNOj/C
	apauwnv9OidRxpxtOOjnujKWS
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr101709291cf.1.1786970638820;
        Mon, 17 Aug 2026 05:43:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr101708911cf.1.1786970638349;
        Mon, 17 Aug 2026 05:43:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa87f8sm384996e87.33.2026.08.17.05.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:43:57 -0700 (PDT)
Message-ID: <56234c79-389f-40e5-9d41-d487524a9356@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX+/46ZZpSHyhv
 cI0SXlJlVHbDWAsI1BfPVvSqqYXjwgpGgyNWiILCZtrTmVOLQ5sHtEn5JwjuOLZ++nKKeWE+B6o
 1/NRqDk2ai/Cd6w/7WKu0dajaBr05Q+0Vxfcbeoss9igWRbH9ii93YbFdtAsoiskv/kodKbJCmk
 M78hu5gfwM0oGtfjfIROx9tidT0U+J8paQKIcxoWcD9fyIK6T0lv730TocQVVkBNOdrmVonSsq5
 eShzBvr0SOgQwSie376QGEHqe5Dk6gSkT1WgT+dy67YQF4DIqzqGByIFL9x3/xp69RjJ+8Czugp
 73LQ/G4NECH+ieoezNlFGyD9Oz8bMIzGCkAR4aiWFGVVWVafwmBY6E8GgbgfvWYRzNwPi3tFu20
 cKSzEovEIk01WmhYhLGm3j+BCjhMYRbEQNjO0qkJfX01qnXZcH6I23+bkYbu+YGGQBgMd9QXucf
 P/H564Ho+upPRhQq+1A==
X-Proofpoint-GUID: is5MLvvF28Zm8W4wm04PDCPDDnxkXecm
X-Proofpoint-ORIG-GUID: is5MLvvF28Zm8W4wm04PDCPDDnxkXecm
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a83020f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4FRrygT47P656_Zvv6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfXz+4hH5y/EOIs
 NK6S8gVZgKw/mAmYrmF9XOzoONJOMGsTUe47DaQr/akNfZ/Nkf7CHCrqJa+ItxDQ8p+FOB5AkzG
 diHvtOkNtFglBZIlc/ED+PMloEmOqJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170097

On 8/11/26 3:36 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.
> 
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.

This paragraph is a bit heavy on repeating the diff contents (could be
just "Add the missing states and reference them." instead), but overall
this looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
