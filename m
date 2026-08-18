Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09E3603C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043638; cv=none; b=oEnTjzVf3Rv9JdiyTqASOz0nbiQDKst8F9M85Lo36d9IKF7AxAHN8wchqWXGnxVGnDFSkvPggqUrc+3AtfGvsYF6pOIUSozrR/gG4a/6+hPcbVWoWTu8S6L/aZPAQlVbgHiHpFjVYTpDfpoSuBY7JtfbRMPBZZoeqlA+9aYgXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043638; c=relaxed/simple;
	bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gwi/TTfywT9cHcKaUXRjz9awKw2Li4E8FpxTy7H94ikm1auMIGopdL50mziZrV8IESL2qIoKAiFlN9TQledxU5RpnA7yOrfJHHRw4lLWXn6hnmTwm0ezN9f21KB4RdsdkaVAX/hNuxOhBXiWKfWADMtPTxK73IIpSqPiNYAOKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECxShCjk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYYisWsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECxShCjk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYYisWsJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJgJ547243
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=; b=ECxShCjkR2GtPzyI
	32OZlQAIhQKIt3ynmLWUJFBAJBLcQl77htHF5n6IH4xY8YYxyBDbrDCrPjZOvDyA
	EP6V2KBbPpcy7zkQU6gqVgwNR3Kd3bu6QzIZebsPdjeZb6fq5joaGlWDS43iyKjC
	hFdoD4eNJXNy4hsB+BL50s0xMDzOmrjsXLA+9YVgl3bV4VkP4cqTJ794zj0UUDmS
	oje+pBALDhIwGEH6/SA6EsRDALuJ8Z3Gcp8gkdrMGOshNHtJvkFO61N50gjhVMZZ
	+ZdAaGIDTk6MjoiMmNi6AdXU+T3wLltydHSwjXQtmmEpmQ0HBYQ+0k4/riKMAVP1
	0/58xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p163a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:00:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso42475885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043635; x=1787648435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=XYYisWsJ5Kl41NHW2DbFRSgiER/NnmF4r+lbQRkAFhO5vbMTEy0uswehU7HDuVI7FY
         FeU/t3FbuKnIw7yGCTKLPgJ1Br+KvqL+1vlsx72nb0cPF2fDLCwvF1C+jIJO5kKbA0F5
         CQo+m1HkErHyCsfFlygp3OqxNxGeB/cmMw2XBmqmcrH3maIswhzw3YJjIRRaAXZWWQ4N
         Jj8rXRWUAsC70v/iA4XZB+eIhtSVrnCB5TyoZkpO9IJeUDT37D7O70ZsiIviGSP+xTLD
         NbV0h5chOkpWrDdbSzvGaeF8yF2FXR36DUbO4vFz0Zjb/D+2HgVTYoUX3j4AV4WspAZP
         CUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043635; x=1787648435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ylqoGSHr6OZc2aQ4hnQQ8ZcxAh6qCEnKowInjzZGPg=;
        b=XgT80CorP+y+vqYnJe0jP05IWsZnjfbL8T1MoW9Dfv/6Ju9VTgdBcqeInOI0xLB0Px
         akkCu9Dy7XYIWdTlejjLHG489YxvMOBPkSPcToQT9S/rIV0x26lKBrvIJYHBRwVFxqWj
         5A1sw+h5Ei1EifV5ZWJizWxHWmop9sWsM40cBjsnCzZlnT6IIuhQuK2VmFuiTHvN7pJS
         AcEmIWp+mbjLObFm7Fd5sMsvDvFMOq8SJOXqidaR7iW1W3T2yFcOxAoPyLB8Ed2rUHww
         DUhuvuq+Rm9y+zvsWDZHtZVdS4TQb4qzU1QNaygAJfFsPV/mBa+5fo0w3XfoiPpdHV4B
         658A==
X-Gm-Message-State: AOJu0YxGYFUklPen6qUfBLQr+0Qzq3V/JMxl7hXwnDQk88pID68uoBpE
	VUhxVoww3p6+OHO/oI7VIHEZf1ZspF43nXptP2o7OmgXDKfwZnR83FgBk3HK4T/Z0x7mmsSoMn/
	J4JrIYFk+Ho78ZDgD5RVueHgVzx6G9xRAWxTQ8FX2GHNotcbXuzQmSY/yiwbIiFM6ANNZ
X-Gm-Gg: AR+sD11YRHNgwbu/jCiWn9bDh1jtcpqpO/n2ThJhPJREyr/Ag+jS5dLfQy16lcb3s/X
	Dp9QcJquyoWSdtpGrZhZAB1bMvPPIDvZ59/+h7lXa/HjsMCGRu8xRDWZpC4TgtPif5v0dOGbOlD
	9bUEzud8xXN7L9JySg1+UV4KH8C9X9n+LX9FXCBDj1W0K5isNeuAGH/gq95efGLAqdEQ9lLiqad
	+5/ivV9gcbK3ZfhziQT1k/vL0qAyUAgUxiDc3mCngotQnCgwGtg+upWcFNvI3tE9DuxLhC/S5cs
	rZXPpCCuQZ1Zjv+fgAG10DLy15iBxuIMmIsdVpR3p1HjMJ/iAfCXWs1R2oKBzfv/17uK1B2GD5E
	T8K51RpMjox8X9CHUJhhZZGTo
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358147585a.3.1787043635130;
        Tue, 18 Aug 2026 02:00:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr358140885a.3.1787043634620;
        Tue, 18 Aug 2026 02:00:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b60asm1026805e87.61.2026.08.18.02.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:00:33 -0700 (PDT)
Message-ID: <161415a0-58b8-4370-81ca-dd26424d726b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db
 property as documented
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-7-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7rXKWGlK40NUmwsGtsDAIIM1Kd3XE1lO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX+OgOaJ1562R/
 KzLHB67uGzwp3CWgl/AVc7LsHLVUvPLsNUsZPjTaQFYMM4u/7X9W/xkrsMTokWxpBBprMFYdStU
 1WdrzjMf+ZHOLKzbwA3/yM6T3jaTaEM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX3S9tQQMi94qH
 4G/j7yYzxsX3My4lMPSYY6/Uwq83EKxk5Cb09UhkxMksK2dqR9JtQ9xbKby4yRiAaS3U90dgiK3
 Nppqbh0EUj9Yx3jaiZpZXmQ/EUkZiz2J93IAW0Gnr+TXw6XewUz6Coj/c27HFmerAIVy+FB5oGu
 bDbO2BYDYplbSttAlhuOuZG68hQm/J6pXBmTLIIiQQpCPxly2xIqhMAw/oOseYbSqgXIKr1wY9t
 /VYKvFizz5c/u9/Gbm+gQLoCgfG9YZOhXNyLcj5lOjzZG1Yvj2NWo0YTSIIjA3LJRv5Q+ij+l4A
 B8im6JcpcZZnfp2BLVAV74P7lGnwJAmxWnaLqoZ0RFCOa8NQFP72A1s8gJ8+4X0nydjJPWYLS8v
 AD5QgaCpTRa44GZgRu8Z02Yv2YXxL1rcapbpWZZdd8YD0C1/Y//XKXSgP3ZVdqFu91OeSI+6u+o
 Wq9xHSq67CkQtBWyBWA==
X-Proofpoint-ORIG-GUID: 7rXKWGlK40NUmwsGtsDAIIM1Kd3XE1lO
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a841f33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MF3fq9KJeJn4W8AoZ4UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The driver reads the transmit de-emphasis override from
> qcom,tx-deamp_3_5db while the binding documents qcom,tx-deamp-3_5db,
> so a device tree following the binding is silently ignored and the
> default is used instead. No in-tree device tree uses either spelling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
