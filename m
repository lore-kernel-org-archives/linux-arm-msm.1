Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626367;
	b=V0lUE352mqY5zx3pIxWcSc1ASNosXhefhLm9AQ8ncF8vy5r5XX2iZx/DuPAmSkSBnOF5
	 8QOWXNSjbsGeO5UGHFrUXfwZr9Oe+CVGt6qUYKjDwDoLkTqf4dXljHjFUNq1GfLVfWtU2
	 o4NpgQNo4JETlfYefawz8cnIO4PMcqxSzuyg9czsa7ktgKoV5brTw4OTpirUol3p6Qe1K
	 0gsrKuVJuqrt+oE4YqoBULdVneFx0C91PGMiu/fVO5xNXO5dEKtVC2b/eaXJj5ICu/cIS
	 DJy+oGPL3pMc1ML6QiUMg5gOZ3sGDS6GaVNY23jA1BlG5It1ycTayoNnWiD/HHh9GMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
	b=U4ktyIjmpjskd8w9Mn4L9sXMCHq7y0rwkOY+aOBXhgN1502pG2x0vyrF02YMm2q6BnY9
	 xHsAEnua5Oy4e8CCCZRxPt8sOSZ2Te9wcUXtyFZIkaTLlOYIGFpunOSsDU0sQlqlaX/F1
	 eP/T87J/gSM5+0oM/5FAQrflHE/HpMvZlmBCt9VEssFdp6MfcyOcyslHx0RjNDMItc3wL
	 zF56NQgiC6iTpUjippgunGEn970UT+pUJWh4ue0BVVzMyaJyT4fDOW76iHG2uXwPuXt11
	 6ps5ePyMIvturSd2qF4d2ZLfNy8sv5u9SbaxA+sWGRsgL9175lqTrK7lXDjLlSqpRog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P59XSVoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dU7GnjLH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA1606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P59XSVoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dU7GnjLH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAN7Z756973
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=; b=P59XSVoHrOScgxf8
	JGN0AjrgGr6OODVYAzeCgr1p/pvq3QwDKplo1EDSSLQt8Cm4xW5VD9C949ZhH4B9
	C1P8FaxXatNj+Utbl1taKQ+7GamC1FPHchBqjKuHjOGol0sTs2+1GXW4GuIczrWm
	OAd9aOtPMfUBL17YDSHg9Sthv39ImYZ+RAAFJcYJzrsqe36CJUh2LcAkEvqPIO1h
	er5fdgUmIhjDg8rKPfByKg3MX5Rl815mwX3S0GvJfV2RfDX4rwY9pw3BJM9T6zpP
	lIdUMoDG+cSW3F2J0LFzdbE8nrcdvW5EQ5+WFpoKrYa03mc758EIRwCiNPO9HG4A
	XLuqJg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1stak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:32:45 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso62084e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626365; x=1794231165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
        b=dU7GnjLHsQDfuID+vnOmOcMTdTdvdbcF+nyEkPfXu4J/LFbrsjdhhj3Nq4krZWv2oR
         ITA+Lcf9BNho8QqQGjEDPzajHo8zd+DuN26FTguZ6LDP/u1cWdTkwhl9a8mY3JqZaQ3L
         OXRr2o+vHEs5fn/BWUyYyYADQjb1wdnULDfEk3NifoqVDA0jpDYNP4BOoP+ZxRF3SRGk
         dX2t7KcF3fHa9LC+RZV+a+h45gHWZ6QVDdzbzLZg1TtydA+J5P1JNbEfR9bRGskTiD/h
         zT9kb4K22usmmiVgO6UmQhJFPJEdxrVS9tEE4B2mEKGrzB67I+I12Zv5jYKvwzruBuHN
         k5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626365; x=1794231165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
        b=CeBtnxFuFojjQOe2tZUuMHwBJN+iCXBasqCM2rtwqbO7l58Jr9J5mHzLkcyizAbV2x
         qJQC3rZR5GkAvgaXH9jMG4bZgy79/usHAftKpewoKdO8VEaG5zgDZdbA0HNwD2P1LCBL
         NvnnRgMi/0/sPDlfpN0usXboYpW3wwUpTFLNRvsmmzsqPQ8BHWiDhQ0rUHb0JYJYrPCj
         qj60H64tAAgXCed2MgNNydIVJASaTQmABpzeXZ5sETR5UlheY9bBBxz5uytsyXQVZPaV
         qYasnhk4wam7wvwAfXT8XyuwktXzN/tWovYQvtBFGuBaBLPRK3tIxLVi3L9A8XqRLZZg
         4GmA==
X-Forwarded-Encrypted: i=1; AKwUvBx3FQTzUD9DdRshqsD4dfVDin/3GperwU62+43vJTklEV82dv+V7M8U5/IiJ2m0w0C1DhkhCT/KuVTW2mZl@vger.kernel.org
X-Gm-Message-State: APuU4Z8e+YvbZNcolmrqOoybbSChBk+vTh8dHxf8Rj6S4a2WsgfGrRVy
	a+n9qX77Pi8/Wd49djiJFtivopDsFUTKMOcDH1c1e1vpxsgwYQ2cS1ckaxH8SgBsZkTMlTefvXv
	zY5FQLcJFxFxhLyYab0CR9f6QTtV5Df7tNw24+jGQU/pr5PMIChO3To5+ecpDlUvPJUbq
X-Gm-Gg: AYBFou1XtBVDhLiv3zZ845MwCZ4mchnYbTYnLlFAHP5+esJUmNsZAvnzJ8+FP4i7J9s
	+rvO2i63g0h1IH/UVqHu2Guvb18j0Q9+0nw/+3av5vTs4McaxX1XewbxBlwJefqFFANRcvSN/Ui
	foIps3zPbsXMvwRvy3netC+WhlPmM0TGhXddMld3gQcfdfp+rqzbYgzlTPfSeY/1tlPt/PJIMRZ
	ZUR4ndOSST+D4zdTBeUcj49BY1tFMTijHA3B9C0qFWwQAiH6Sw/PssWSDsGOXQsduyEqF3dsukb
	VXDBiLsx5Q5tjdNNo08IUqrzmSMcqwUf6nY3dvbKhMnhI3iybMOgnloeKYOYoD+wGBYVauLEsu5
	3vW+YyDw4eXewqRiNXV+QYvhKyw6PSvW8G/GPoebjRJjFZUuu22UuDiuSDjV4MniGdA6PLm8=
X-Received: by 2002:ac5:c3d6:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec6894cb47mr4070323e0c.4.1793626364638;
        Mon, 02 Nov 2026 05:32:44 -0800 (PST)
X-Received: by 2002:ac5:c3d6:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec6894cb47mr4070290e0c.4.1793626364119;
        Mon, 02 Nov 2026 05:32:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a98asm408806566b.59.2026.11.02.05.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:32:43 -0800 (PST)
Message-ID: <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:32:41 +0100
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
To: Joonhoe Kim <26rote@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, val@packett.cool,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023123512.1912-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z7cSmM2aT24Bgi6sPHJZbD6MSE3xYL8n
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae890fd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=nlylCrhKMTYJnl4vkq0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX+U/6klL7A3ax
 s9X91vb9QA/AG1/GuA8YTVMwoMX+Wf4jzczmSsFqq1P0xjNiDgUaLJQeMLl69ciyFGsV2oHNeqa
 fSawOEozj/1KWXqcP4fCJZ+FJJsOpO9t//8sxgrQUxKeshWE4q08GkY0VmHFFW+kTf4pLSzUkfd
 BWx/RWQT7xZwY91LdgZNwN1gowOQXYRUpKzPqGTaEj9eFqIrVL86gcOkvDCrU61Nm0+WyH8hU40
 qz3o7BLnrjHrRUcYuEUjI/mXEGt9bEbIniLZWD3zXlEaj2ZhB6fyX+jCl4XfxPgQROf81KHH9Qf
 9zvEu60InbtXUVgVomVJ0PH/Azjdssdg1pD6GzB0Wy3VdnTPOpkqpXr66SrZAUqU1kjhrZJfaKZ
 0X1smJD8Y4SUGcsJNeBCfa5WSvQIRvyzw3sf0pWEhLH7VzZFDB/AtSmCO6Rd2zoaFxCHf6AxVXx
 2ymQMovHFF0oCeJit5Q==
X-Proofpoint-GUID: z7cSmM2aT24Bgi6sPHJZbD6MSE3xYL8n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX3PmIAHaFDwEF
 WjJdfCfCtgTPlg44Y/TvAjpidY36SkcVelKcHN28QPzgMlH4cACAQG67MZ1FjLJVNp+8/wjE1KH
 DU5oLfJREpDb8YShxGLzWaXwBD+4CoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/23/26 2:35 PM, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:

[...]


> @@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_combo_usb_power_on(phy);
> -	if (ret) {
> -		qmp_combo_com_exit(qmp, false);
> -		return ret;
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
> +		ret = qmp_combo_usb_power_on(phy);
> +		if (ret) {
> +			qmp_combo_com_exit(qmp, false);
> +			return ret;
> +		}
>  	}

The USB sub-block provides the PIPE clock to the DWC3 controller.
If we somehow enter DP altmode before DWC3 gets to probe, or if for
any reason we need to access that controller (maybe debugfs reads),
I think this will fail.

Konrad
