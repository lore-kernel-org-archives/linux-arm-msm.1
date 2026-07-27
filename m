Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1E36A341
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162283; cv=none; b=HRqX0f3XpUeocW9Ytydtqg0js5G+g+QRhCGVZHzqpe8G8gwsHHbhoxsCQ7ZSAq+K/FRM3oKjsz99QOy/STTNXBnbhAAoWY7GdrRmk7s+zIG+38NBxfvRMTvVl3RxF2OgknHLEAvwmF3zQkz/502G2rEEthJ7RuNlX4skfAqtu64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162283; c=relaxed/simple;
	bh=3mAT9UG0+1ju82uu5uKy02/xIaDL8I/hhIjnz08fkBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R08cw1MFczkCCJXKcHpDqQvj6GNMXALu13FAY+ZFSWrCCCHBgWEzZvrsIv/IKbQ1QMyR4Tx3h41fNHhMNXabdc0jsMCit6nnufPOwv/v8IhpZY3jSGOrzMMHA/HAxfs2A5m0k9DN1JH88s1fvPisPVfJt9HJjTCdeHvYIT3LLiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQJtbZDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2l2IJCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQJtbZDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2l2IJCN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmAkr3823665
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=; b=bQJtbZDUhZWVO5yI
	pdHskyTFt39bOZDcY7/QYcY8O9WXDkudFTBVQJXakg7aYStYYicj9tvChjiCYPP5
	hwch5HMMAm0f591VCP56DTdTPw2tY3SM9rhyj3MyKsczNajBcIuLsoOQ1b9mfUep
	6ksg0oWCM0LupL1Nbjoe5uorMCs4ilxVTEaY3Dq7eS0t/4PUAWnuyZ/tII4FBpaQ
	zXWtIldlaSVKzgf5QMgF9tIhc4w0a+FV0gEn2ApkHSznKZpQpkdfu+kyKvAScJ75
	+e5ZyVmzWWthEN+Ir54N0IOtsE7vnlEiNU8u/AoCxXn1KdnxSq0WBnbOu78KmGJF
	BymNcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs4mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:24:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso31149201cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162279; x=1785767079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=;
        b=M2l2IJCN6BU20RPGfpqXB05niuV2Q5n9exhVrHs5CTavfghUPWy0i/fYWHozEHannj
         zOAlKkxBUeV8KZTBPfCEgO18Oo0IOfxzPJZ06sYaDpWVrKpo3Ril6k6oYZ3VBItzTI+V
         QpxuUjWuU7XUmH3TXNzxZxZ2S+FWdy0v7D74c4y0o7GU/LkAABo5N97W9yRHUsMJthrk
         0SXPr82373993RrXJ6CxFiA+tBIqvh+pcZl0cQd12yCG5kfAFvmgxdyhdz4fLqZ8/XRB
         n78P0BtrPgG/gF/RWIPELEQ1MYg+QbG4oKG71jsL3EM0hAM2kMF0mPfdl69Mwi3+kJ35
         JQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162279; x=1785767079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9fjSlQsE+bogjI4QCB1WAwqrOdnkvqIg20lJlfw+zk=;
        b=KD6nAKhp4q+SIb+nMNwzj2g0USdFjJ8GhsnT9dif5cOnY5OjRkef33fLGKOPlO77p+
         QDoblhb7Z98Z7AhdQbqKl9Zxma5+6sJGi9+vejwm15yC46LjU8ZrEJWsKgR8tOVZZCWf
         ucOjYbncVJGtNUXK1WLyMT9IxG0D7PFJgtHP43hbrs+s9071sla8zePjdbrKsSeQzB3v
         H4gGhdiPi8huwocuGuTnmpEepIDqMfL4mob+tRxhjhTkjzcxY6IdE87Qc+LOwZ+0zTxC
         lVyj8C84GIYXa6ZDRLLlWaZPvCtqzDP+W6BJ70q7aywGedGUOgBTzab6REFzfNhvIWok
         rTug==
X-Forwarded-Encrypted: i=1; AHgh+RrXafyage6gSXp61+IuZ/zLiyEtkwvLw8f8Zxe9OqiMsoGtig6OGJvD2UehHa7g0J2OH1CRrGOh0ecs4Kus@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0seQNfK+KZU+nxn3Nksrzmwo3TwsYEf2mRT7DmPXilsByB+J
	f9gMzOT1Jlynp8w6vypVo5WDp/X0pDRD+KhNb1HlPkdBtt2WF86DaGF5JKOXTFXjdR+hSKQYjTk
	IqeV9lAqn9hZN9RFQx53zXdhJLQBf2CUBQGPF87dJzsuivZmiIgzevZvG7pYUIJiiSDw4
X-Gm-Gg: AR+sD11Fu/1KJzELui11C6v3xUczrz7lodTO0/Xp/Zh/D4QoiCbhbuHV5D6WsEb4J6s
	kbGveSNTe+jpro+/VY2Dc0cH9MqXSiM79SZKCaSheQlal67w2Bye+YjOIPUv0CDoyqI0bGNAJd2
	jr79Jjz2123Rz/cKcEKx1x7JNXImeZ1MWzRauWoQIRsOZ8wuv7sF+PYw5ymGXtncffzOk9OGrWy
	rvE5+D7oXxVl4gnLlZnvDkWWsNrxrlOzYy9hHaACq+n8kmMwwgQ826lcuD9ICq+jKPROncbwGZ8
	JhV17ej86eg/sd3puq1BAWtPAL/zL8kpCiJV0XyJgQntTYpDvXbz470VwDcZNv/Um61EpiAyHNW
	06LFSoIqXenj2THEW75DFuMEUEX0=
X-Received: by 2002:a05:622a:138e:b0:51a:8c97:938b with SMTP id d75a77b69052e-529a86c6a96mr89951871cf.66.1785162278873;
        Mon, 27 Jul 2026 07:24:38 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:51a:8c97:938b with SMTP id d75a77b69052e-529a86c6a96mr89951461cf.66.1785162278433;
        Mon, 27 Jul 2026 07:24:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm48955047f8f.2.2026.07.27.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:24:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip
Date: Mon, 27 Jul 2026 16:24:35 +0200
Message-ID: <178516227335.59204.11412409197069855135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dtCwhD9OPEFrwkbLvrTAZ7sENRbD19m8
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676a27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jlfPM1XiwSsKjbdNI6QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX/tIPDZwMPh/n
 tnLInLWmynVLnZm/ctMeac3khtlYZriqSjDKgCAxc++st7gQnEpq7hP6yepN0eT4H7mSS+QMw+b
 5pX/BWgqWNOZ1jmZWhJ2jsbzvl7pXXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXzqJnC4PRotPz
 jD1K2EI3HKCB9gkNkiMigwDdHU9siCNSPnPUix6GsJGsQ/qIjGPwGLhygyjbvDrzuHAGluHKsA0
 E+XADRC4yFUjowFndD0wH+og+rB6PwIPHNZGmzD6k9MdnL5K30FTSKd50fMiKpYNm2oadOqWPIO
 8hu/GB2x3yKZX9fW664gf7bcZp2dsRFpp3SJ6MjdsYgkZkDWvUOeLDPNWbN2yQjopF2D4Ednw0p
 X/z32cbF8vMjSHDQJwQdhMH7bfGw4en7D85hLM3U0RwuxXrfYiyPd9DkEGl6E+D0PEnqm1dvyY+
 gWUMIjW+C/ronasCYdcTSD5rIerxSJXhScXKVEjA90dbep+MPOdbvOEX5ikSXlqHdcD41/yEcpG
 FyMyVsu9Rjn2W3lU1BoaATQ0B5OyWjXNxtpLJDcUR8JM9skhiBvRSDN8/7RRIaPKP5zIe/kTAo0
 3gLVec+laCS2pXrzWtg==
X-Proofpoint-GUID: dtCwhD9OPEFrwkbLvrTAZ7sENRbD19m8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270136


On Fri, 24 Apr 2026 12:01:24 +0530, Sneh Mankad wrote:
> MPM irqchip monitors the interrupts during SoC sleep state and after wakeup
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
> 
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm gpio irqchip
      https://git.kernel.org/brgl/c/1860fb0be224dec0e4d170f46d1cbbc77e25e09e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
