Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655E3B4E88
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858056; cv=none; b=HUyDh6zWjjt3CAPpS+LObW6yyuTUPKW+1U/oi9Cx9g/WJOkxI30yHLS86f44gC0zTVHigpHjPIvVCYCKLQuj1W48bn6R6BXkYyEquIO+GYrKCijAuMiNDbY4R5NE7bujK9GPLrFgdN1BVwCwci1nVM1yFVppDTTDcbOGk+v/AQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858056; c=relaxed/simple;
	bh=lWJqTAbNe8S0v5g3pHoGmeKe8qZ/vwoxmehBKfILlfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNebmALiwrIOTswoUTOyptP1FzwyYHDI82uWizCflqwgdkOcwTHGCPIMr2ioD5sAGnIMxt74LrdKrGTbkIduLX1LPdVn7sLtuGpibkO88/ezsLxUipd+6JDJIR1yCOzdiK91rVjvE21eLXb311I65XriO3HosBKWsVmVnGdaJ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmhKE2ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVmXRMSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmhKE2ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVmXRMSN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xdDd1933282
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=; b=YmhKE2ovQR2CEARb
	waPZU8N7mLWzLLusjBW5OxSfrucQEsB6thVkU8kQJBRTI1qW5U3hgaepUumjaq3A
	MW9nb5V1P1qtM8/rV2NnuxNgIdaeDCg8YP6H0b4YN9xbgDK1Tho8UNLh1C0h7D/q
	Q/9X0S/VCzNoVupytLkmobt6wFmhfJiIW17NVXirh2KWpR0d46WW6wvNzlqVicje
	fTNbKQAS5oxI/BLEMseThKv9Hd5SJWqviuP2NFNf44cZsek/OyPLDHKfC8kHUc+R
	iterpsAZm1AcB1OAi5HwVl0Sb7QKup9VOFCrq8lQuiZNXVdZiQv7M0Zvbxj/kWeU
	oDUsZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfsgmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:34:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0b66ecd9so988815785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858052; x=1791462852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=;
        b=ZVmXRMSNceMoPXAw5MDtCgR2UmwworR53lcmtQwIvuGllu2sBk4fnY2fvN5xSF0VLS
         kUBZROK5uis7fBA/zVL4/ANyXpB1rgZEdHHZBXJGWSUROurRhnzi3ay7rAo6n7n+Z4Xz
         ZCd8NlkysYVaVYkxnM84n3hi3Qkfr2Z7U5y02s2W3TX3MIYP9ieWhy6zin4mKVVuCkZu
         bAHfJH8ec1Swvcl3oEsKvlomAgWrTUkMTO9H6HmUEdraHFMhIn9qSLM5GHAbScNbucvu
         jYMtbnzF+frXYVEgG0WCxxBA2FPFxwuggMcEZf2C5cl+8kUGf+YAdgevAzKDdNDx/Yyx
         PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858052; x=1791462852;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=;
        b=f6+uLssZq73rvbh4nMiThFdtJeSdslzuYdBEYWkdWLkfyNBmJj9M/RYu2IMcY7pBz4
         mpe1/JYDrrkUkfYge5VSNcQY+P22e11xcafS/Om7Bg4dAntjUh21yqQGRwTylYv5et0o
         x9M/4/O8C6h5hvgKWw1c/sMomKRhjcvb1333Cx7FlwVsyOVsKKbrcZ6KCXObkHhocKWm
         sTWdQmc8ZZBUgbwHwZmL/K575ZrEg7wxHTT6wlTyOJKaB8FUgOLeZxrpXvZbQovTeh6z
         bZyMMOeGQrfjPQ+kRq3CQR5izfuYsKCyjkx4yucAEMAJuccG1H3hi0pSePudsFjYw2PC
         /wBw==
X-Forwarded-Encrypted: i=1; AKwUvBznsE5vvU6IRFooKfFMOTybTUGSUP9LG0k5KcZr8xNNDhbqo7BTaOFvXUGCoWk+nw38tzrSIZHvN+eKNa1b@vger.kernel.org
X-Gm-Message-State: AFuF++kpMf2jAaNEaXvZySwR3gWJ3P46FB9EhvfOSt34ZKJaRdIshMT1
	3E9p1FRRwheyDINJE47lvo2y9WV7ZvLfjX2SyMRtlB7Q16JPiNbFuwIS1VBedlxP+8XnJmv8OQr
	X84I7tQo7fIDFqdA7dY5+6mfK0yrDIk5HTiCtMEmUyxTr9y7rYXU8nfewkGw3EQk6dFXA
X-Gm-Gg: AYBFou2DRitqwir8ITy6dpzmSA1NJYnCw8Kmyr9EV+H7Dr/jruiBGP+oVC390TRWUb4
	Kl+vk+/T0OoV70hPQmzMAVYLImQcUmrA5nUfA2LorXTrsENI54DKVwQ+XnlUeqHR2jPDCEg15kC
	4/ap1hq2/5r2byukPrwvg2cvcg2P8lSAtKVYVifkb0WPEfhEvLoQgCe0KSqy9LUV9J2oQZCunLa
	rdegzLbuYFSJxZXpoAj2PAdRnNA0drw7AD2RmW+k9amKPO4bIgxPqA3vRzAD14xGHyWJJGg7skX
	8w32xbylyek6qTaEZdcy+ZDc/Fkp2orEdlkKzmsHp38ZFcBNUUdd0eCU5fPqK+YuFwPMfg+357o
	8J90Wb5spkOQP8pgCUrNO6RniKDI=
X-Received: by 2002:a05:620a:890b:b0:93c:16ee:ea03 with SMTP id af79cd13be357-93cac199d85mr769957085a.38.1790858052320;
        Thu, 01 Oct 2026 05:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93c:16ee:ea03 with SMTP id af79cd13be357-93cac199d85mr769950785a.38.1790858051595;
        Thu, 01 Oct 2026 05:34:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm54683465e9.3.2026.10.01.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:34:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions
Date: Thu,  1 Oct 2026 14:34:08 +0200
Message-ID: <179085796993.11844.15948697775614399550.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-ipq5018-pwm-functions-v2-1-87bbcd706bc6@outlook.com>
References: <20260928-ipq5018-pwm-functions-v2-1-87bbcd706bc6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXz52em51aZQ2R
 Nq4kAiUviGgbgdyrqGgf5tJWwFETKBVLefF64YvKbQqiOr6dIln4vP5XTww969pkuS5IlJXKCMI
 MycSr0vZkhFFvAzqko/g5ZgPkOsdwG4=
X-Proofpoint-GUID: IKu4JABVn-PAI0fB437D7K2XkeSKFGU9
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe5345 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0YQyuc7wub6QuVhEsVIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IKu4JABVn-PAI0fB437D7K2XkeSKFGU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX5eCjtP/uDzI9
 OzBGXtaJIBHiEdp+O1P8aEerxLSamO+k7EMsoMgCV0NfxuiU3QEetB5g0MgRZ0u8oy4gv5MbN7F
 HcqOe8LJVAYrYzDLsXenSOYRm1KTRPLc2pKVgXt6Qz54PV0NoSh7X9NqWHjGRhf/cJs7QRwGluu
 HqyM+RfJch79a4ugja3iuLFY95a4N5+czJk4B2pBbPKb+Mzn1BHx6OI0BppnQrj6CuxznwuujxW
 Ky/787r1g2NYBPE5CoPugTxZzl88aNqAeMnXQ7ZYkyncTAMgLbXR7I3b7goitUu8+S3hKb8HYAF
 n25PzYyxB5D8iyCEyWditvpQMByjT3ooBWp9U7IWq8RanJKgPPg1hibiEUxxK2+Z2DlL8AaPYCl
 AMWh51ut4FCtfr8vNpkwJOf710/wTh4k2bz2Q+uTR5RQP0vQjSj1oA/0rDvg14n1U6wOvyPyyK+
 pSS8lUaF4lf72AOfplg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050


On Mon, 28 Sep 2026 13:48:47 +0400, George Moussalem wrote:
> On multiple Linksys routers, GPIOs 1, 30, and 46 drive the PWM LED on
> the PWM1, PWM3, and PWM0 channels, respectively.
> Update the corresponding PWM groups to include these GPIOs and allocate
> the PWM functions to empty slots in the relevant pin groups.
> 
> 

While we discussed this not really being a fix, I noticed that this is rebased
on top of other fixes that I have queued in my for-current branch and conflicts
with my for-next branch which is based on top of rc1. Linus doesn't like me
pulling in upstream tags so I'll just send it for v7.3.

[1/1] pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions
      https://git.kernel.org/brgl/c/65db42a9fae05c46a5df5b7ca5c175b80f9c4278

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
