Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576704;
	b=I4YjZA06XnXPxpNYJMSolB7azRemATrNAFCYk/crmJrLMVROAVYKtR2JYoZGrGLz5w3+
	 ISzbw9epx/07KahFWp00h4gIQIIiHAjm2diZAKPs9AWfjlnZQxtI2nVCy0+0d/2K7MyDT
	 r3C4SrTIbuYsaDLp9pQSXqNybGgRko56c8KruTpM61sBcFam7fysJzXNFi3rmEGBpKyYZ
	 PHmWrCoCAogoY4GX6ywyKR5ozSgo/Pyts+B1527zsf8UqcU+rAYiDfW3WoknONHoSMCCZ
	 66joZv8HYr8dSSZOVFB5zVFF65A7NP0hvANKl91a4EfyfwWeaOPJGq9WJ1buiR54qIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
	b=rBXPrw0pdTnFX3Rd0R5ZslH/5qX7U3skk7/sBgl3bNMWsdZiWoUXj3AwS0OAy517Cjke
	 rSUse2BqbfPqodH6VyQOeRETZjQJOIzzFayaQcq4bdtdu+FX6Iwjiu6rKj416Rj3X9qqy
	 T9aLTcmlTps4gd1sLhh8hAFQRGg/yCm9z5wEUykP/vfCsbSaF2TcJm8mGNVp0YHdfWcQg
	 PJTKev26auf4XMIkTWGsNrge0fiy4QeeqBF9H0rA2rN/gxHn07eiHgmXMyrQbugF9S4qN
	 h7bSWP3v/r5GKvMWaBlnqo/u8nogzvZhhSFi7a3BWMLrnH6OSYwP7LJUpCTNCz5g+UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qngahx5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAVDZygI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4B606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C4B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qngahx5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAVDZygI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2xA3355908
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=; b=Qngahx5pOCG+dLa4
	bcvXWYxXpFEwiR3NldD97e5gsW9PhD5dA2oAugLcc4902BDv4ddgLIshLcYA9H1P
	yCuP3MCMqoKOT5ehqYwiph0qW9NRZk4YqAEhiP7Nf95Y0yeIiWLoamD0ArxsoAxP
	E2T0O7ukTops5IbswaPbmj0pbNkGIH4t+oW3XLUhMGVHtZNkrggmYZq6g+qCE/0l
	MSF0H/1LNgSiy2gQbaPrJngQG+AMAv0xWn4hhNF+wxu6rjBfW9hAJXtwPlZG64E7
	mQHlz/YO54dJOiemhz5MRe4qE7V8l5xme7umViZ0mA0yN77+izclG2k2tiF/wT6Y
	U1axKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kbkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:58:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so1505941cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576703; x=1793181503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
        b=QAVDZygINpHE6xras6mYJnCOPRomGjhMrPzzAVi+g8NwVHbCh+mgz34JiHOaoH/INS
         s3fthS/WYtm2B+Wy5gqaDDa2mh/7sjrrsBfxmKDhtLQLS8ZZK85BRDEE5bXfPc/JNjQ6
         o7mTs2VibimODegc/IoSw+ljQxc5AGofKG+bhgF7OYgMr1axqN1jKtHxy2ZVrPdEZH4v
         YRYgVtTbpK9Bc+FC0880oRBv+WIZziPLynumSHNSDCH6E7LX64UG6La1Uz8bSzXSIelZ
         dZtfxbl3XA0dDKh48dmMAhfiHPWUBs2tZozdG/8CdSL24h9rRgEeaS3T3PQpRYUWXXYt
         x9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576703; x=1793181503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ubkfmXIxB950gCeTdHVEMg4HSbfsabXa8swan3tUsw=;
        b=Cj+xQTb4n4D0L9IX6umgio0R25V1r5rud5ZeTSz5LNbmOh/4kVY1OJDYEmVgfCAr5b
         41dZWafFiJm5svuGISzevmNrlE7RQUo3V6pdXhibarKorHMZOtE2qYOyRlq66nCu5tDp
         lG6wKF6ylR6mES5V5ud4POEYkR1KQd9ZUUWdVJp52VV1aB8v6wx1oXqYkoKmri+CZuOE
         TdhdYC9MnncYCm8Q2qzdj/s2E+oVeEpbV3IA4aMSyp5UP4CsK0Hr4CEO7TJpLhoKMAoF
         7i2+ZdOWIXXX4h8FywaR1s1HREwW/yqn68nwot3TO7L6ytw9LgAd6Bnx0EkeCz73XFOl
         Qhnw==
X-Gm-Message-State: AFq9FYKTwi48lk4RG18DWkGZO3oRByLaKVK5glFmxiiBeBPPIJeycnvj
	k6LZ/aZz2qySjMEUcPWTnHBASELdSzs7tr8eCC2OT88q6u0wIyTU/irTcP2B0S2axu17cg20ECp
	ni18DaxGQCgGX26cXWVpTxX7cxPy6ZHsDqs6CJNsatBgD3PxrxWAUWjYxJfTei/yKUj/CEs6+xi
	lHk2LO6g==
X-Gm-Gg: AYBFou2Tyh6VUlrklno8RuuR2XYUbaL+DsWiyhQ0LDTzWZpY0ZdnZZJOCRVud28KCNf
	okFq9DdJ/V8cfSEgejynDFiQOMc+TJg/OzgWlI+dpTyu8xtGte7epsj6jtmrVT+D/9UrykH7asv
	s+vsHPMNPFKw0WcwyCb1YnecszOqTUaKiUhd2D1z1RpL8fIe/56/wk7kbdWXCjlm24SzxsuTJDZ
	19j5ir1f9mqVJNrj1fVCQwoIcXqKi9svYdemo6l+IPm1Bj0EYzHFM02oX1cR6G1Lbr5MCIIKSkf
	b6hTm8Ms2/YsVK0Wg4Os3RjtzOQfQkwbo5YUr6DKSKfJd/BUxtNRjGgi/JQQ1zO26CLoNaLr1xB
	js0Br4V18YHrKas6ReBvAvg==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr30062771cf.0.1792576702566;
        Wed, 21 Oct 2026 02:58:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr30062041cf.0.1792576701609;
        Wed, 21 Oct 2026 02:58:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678faa02dsm60710266b.40.2026.10.21.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:58:20 -0700 (PDT)
Message-ID: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:58:18 +0200
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
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init()
 in the typec callbacks
To: Oleg Keri <okerixx@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260916133814.3977-1-okerixx@gmail.com>
 <20260916133814.3977-3-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916133814.3977-3-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX6gkyRhxe+3cl
 oP/F25GQwjm/P7dgYIE4NMincv/Xcfy798KVoiTI9p/szvKJSIXSov/1UBfLuN8jdbU4v25ujZL
 qEeX+GO5B/LnDuNVB9lRwvcDZY5XVtQvSqB25MNNx4hToFWjr4Uda0kf+Q/dMsB8dqXGbS2IHcP
 zzqfqC/PxHlBw5ouJyAUlThmRRvqeRVav71GSLxlXxhxOwa3MB95OhBCAx/SpEv4EQK51zCZ2G9
 G9ZfoKsGCkAWPbe4Q/JJ+x3R159TlUVRvy4FWG6H9kAUMTKLgkzUroK4uqB93hUAyxXh3i/ZRrB
 kJwGJrbIYhCzE50b+6je/StGdZXFLNK4hLjDPBrWHs85dhi8xzdX7z2Jkrlq+Wj18+Ppc64CjgD
 KOuzTq925PRHVtwRdSBP1jJEvIFboFtYNDtkgnHRe/hrYey5VFSG12GNb524eq8WPl9zZTHFHK9
 qE4hlbLndPRwr4BPjXQ==
X-Proofpoint-ORIG-GUID: WpHpXAuYM71VAVUApvtSqTVq0vLcxztf
X-Proofpoint-GUID: WpHpXAuYM71VAVUApvtSqTVq0vLcxztf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfXz8aF6108uLw2
 6WVZH/BZ+EFL6PRK7AnMKdjzRko2pUvhkdT3noo9X7bCsQoS45dInsBN5R8IYrLPMbY1fDZIJIJ
 hrhCAD3YNmGu8U831GDdDUQQIqGElFU=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88cbf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jGh8KTe8EfAoFKc4BLQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 9/16/26 3:38 PM, Oleg Keri wrote:
> qmp_combo_typec_switch_set() and qmp_combo_reconfigure_phy(), which the
> typec mux callback and the USB4 init path use, tear the common block down
> and bring it straight back up on an orientation or altmode change, but
> they discard the result of the bringup:
> 
> 	qmp_combo_com_exit(qmp, true);
> 
> 	qmp->qmpphy_mode = new_mode;
> 
> 	/* Now everything's powered down, power up the right PHYs */
> 	qmp_combo_com_init(qmp, true);
> 
> 	if ((qmp->usb_init_count || qmp->usb4_init_count) &&
> 	    new_mode != QMPPHY_MODE_DP_ONLY)
> 		qmp_combo_usb_power_on(qmp->usb_phy);

Sashiko has some comments which seem valid

Is this something you hit in real life, or is that a static finding?

Konrad
