Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811193D0BF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833629; cv=none; b=JtNjLUTL1UTAIzDjIRNIgCpbZQe1iKAL4J9RAMOW76w+mXqy1G1AsFyL+etSq9g7vwL26PVyxUGQJECJ7YdXfUUBdzwplOBmsKRHO8o7t41jiFkq/lxTcWf9TASE7PyPCHsYzN1qc2yFXSDwgDR7wYSWj4RiT9+po6VwN5B3rjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833629; c=relaxed/simple;
	bh=rtoMW12MbOHAMhkFuhaCb1gwFY/CsybOHASfnKomgZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVq//3naC4HhxciTGcfzoE4cd9rL94neJDvD99chiu+ZyLrAR5u9zKPni0LGSWY1tmP2oe5spTxCI97cySSs5LpS5GU5J9H/7GtzV3MYVyxgkoIydwWB7SA3xNnP54mK4+6Gc/wLurPoMq8LIP2IySTFY1ln737h2aNVa/yzxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lL8rP2XD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpNNT7CN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lL8rP2XD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QpNNT7CN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImUP9580369
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maz1Ap2uB2Yi4KOKuTZbFxD/
	QNecuW97KMW4HvYQy2w=; b=lL8rP2XDHWmM50Vc0HCzAwO52r9Mg6FKSyCaMdof
	IlR+Zj94SZeX1e29cp++k3dbr4t1Uc7aqV+sPiRDYHOtshGvbydJhBCQjYE8aiza
	6hJLrWz6cYHFNLxWzZOmU4W+eLI4/keqduROjcYnJQGPryPMxHVVJMvzaqYBTU9K
	+jfOt3ojNjvDpy96IIQRfI9HoKIU8O7qFWh1D2Tvj6jIQ5FtWP6gTn6XYLIvMRBo
	QuZi+4jh2PgDwkX7/WYIXICSHnQ+rWzGVxxmC0wXQEpxCk/cnj3V/Oj6bnGZ9qpI
	dqY0OBNIbWVTx9EjtoQ+hiEokckdOMfMM3xXXMaoTHNytA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9ycs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso207476137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784833624; x=1785438424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=maz1Ap2uB2Yi4KOKuTZbFxD/QNecuW97KMW4HvYQy2w=;
        b=QpNNT7CNawdDGnvcpIUiovHlKfFX/Kf0IZuIEvgwnlE2tXE8WKsW6ah+SPDx7fLZxw
         uxl91nrhykgM7ngOOJfTDaRyysNALN0x9ahKpj1uLnF4dOSAE/vfAuxXfnkx2x2Rj8XX
         kyms2WcMKMeGZzuqQ6QdBjoV/AbYMtuQX1LLRcaXqgxmweLnGortHPd5ZTTYTPpB828Y
         VfgI/Dd+38LSczqiFFHdwTr7XLrDZe4ue4i0qdjWtBSHBnIip9NYkSESwt29xlUFBMqn
         M6vYRZ91mFg43CtUe7vwpVB2EBN/2ssCL0eHbh0Z82WWrN4uGH760wP3JuQWqYqp8pcR
         19RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833624; x=1785438424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maz1Ap2uB2Yi4KOKuTZbFxD/QNecuW97KMW4HvYQy2w=;
        b=cbjRE+VwUxI+VAbUvJGr8bzEcylzFuYE0qgWYUBpM5SmBGOJqGi7JI8ynFX93IfuoY
         7lHFhCCLSkrWYuAAC1kmxRu71zrmnooqhInR3Pz8yhrqqd/KWM0z1cRHb6kh9w4mYj2q
         9T3IBqxZx6GaY5M3Y1qWttoW8l6al9ztDNWZOVlnGlPwnoLvCGNd47mmgga2NwmGwML3
         Xd0CMpddEnMk9SSH8ph75OW0eBH/9NKy/vOEopMV1F2RhHL9koYjs2UIsAI0tHk69uiR
         pMwh2Z6AXPMweM+ZQgpsmnTHkzBKEr7UAZLjpEyiHw2FcvQkArpa+yMG2CYCmQTZk9tH
         8k8A==
X-Forwarded-Encrypted: i=1; AHgh+Ro8nZFpn73gKJ+l+y8gMyRV9e1rQewzA/kbuTHGLHUUPd/zoZBW59BAf2u5WXwOuaY8zWS3X5ZuR1izLY/I@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJql+I7tvY4rVkQWmNFQtX0vorlOFV75PaGgCXHoYyip/Qqz3
	7RXhgYFtW5nRcYMy4f5LkndWbVVlCoFTQFfw/Nv+79RfphWRPXh+zuwVcfc+bPPwN99HATwZcGw
	uoU1ObY/2a1Ogqllsl3FGX/wsmYCV2ziRGmaDYf9txkgHrZpjqRLOJRJ5tsGf34ysgaj5
X-Gm-Gg: AR+sD13YsGNONteS++oQ4q7V5A3gOyAKg+1cfSbLgkGOyPlNL9PtsXqd4gE+D637a5S
	pT84vM+IXvS4X+r4Fyuv/uOYdrx5lYg0RY+jN4dyIrxmhWqFn8kSr0+QGkljMJICEgKKlDcRpgp
	TpeL3QWGv4sb8weg11ERk+qzSbwer6WjnX7U6ZPFzphLUzn+qSVN03Ju91rXF2nSWpoUC+QI52r
	97tcLN+p24A0bVZ9MzO/BZesLPtvucMxOAKgIdb+ifVT/uQ2087g4rY19Hp+f0rzIjfbZCHdGGK
	n03LNMcAatvgH3G84ANOfoU8DNIi1MZuJxZ/yLAojmH24Bs5fBBEBul7v2v/6j6KObOIitrjTIM
	AgviS6yHV18B9Zt1WVpstb3oeGIXysAysMW3TlcqzLYgZoechRn66e4in9ftsdf9a7wQdBmNdfd
	Xo7/uIN5I/NhUpvw==
X-Received: by 2002:a05:6102:3f87:b0:73e:5068:824d with SMTP id ada2fe7eead31-74d5fdd01a9mr2069222137.14.1784833623911;
        Thu, 23 Jul 2026 12:07:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:73e:5068:824d with SMTP id ada2fe7eead31-74d5fdd01a9mr2069203137.14.1784833623474;
        Thu, 23 Jul 2026 12:07:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888579sm10165921fa.9.2026.07.23.12.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:07:02 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:06:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
Message-ID: <vxyc3lgvofl3yrodrzgxh7dtw3aegdcy4bwn7nf6eivhz3ld64@i7romsdep7e7>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mxd0DF7lZpTaOF72Gbs_Uor1c4bHnnCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX7rUaQ7i04b3r
 oAASHiSb3wG0yZvLreR3a6jpmlJ3IgHVwSSA0xKet8aUuceP54lqUUv92H9KWiyq9tynRh6aZhX
 nrjL+ZgowINdMORbEEx7QcGkw4TJcXzCQxb7siIiNJkSLaTJ7f+Mnm+BaFG8vhXz13Efhkyyb9X
 w3TsPlBFmB0e8Vwr7WuvrVlGOH4aSlCIXp44vh8AYmFqkyqduP4DF3J8fsU3/6JNJBlKQ/93WOG
 TO6bfzF4bVUJSXaZwEFOsg+f5e0mMk3uvYKScrB7BN6ryo8Ms7aBpyKcRCM2nzf0xkpqt/q50x4
 KGX8sJz8tzFy7hyuKo59mdWgaphqVRTlfuk68s/Fx4ENXmud5zY8nRDTSMnaScHz48KYGzh2aAf
 pgTSNKeYWWyKpQKkJYB3oOld+xzSaVenEyLfCUw3wKodYX/3O8ALHuQZRqOroxGbVLhNPSvQwsO
 5tsd1H0qV2E6mgzUgHA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a626659 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=80F9w9wYGjatkqxmWU0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX6D3nAnl3wJBg
 5VIjNKvM11YqwOI71HGkKlgxAuynkthMxmqN7fC1g3Z8aYTDBqGcugMW6zUtx+PW1E6lkl54WbJ
 jTIM0aPu0Lv0yxHRfMJUGrdafx+KxxM=
X-Proofpoint-GUID: mxd0DF7lZpTaOF72Gbs_Uor1c4bHnnCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230186

On Thu, Jul 23, 2026 at 06:01:07PM +0530, Rahul Samana wrote:
> Add QCC2072 as a supported Qualcomm Bluetooth controller.
> 
> QCC2072 uses the ORN firmware and NVM naming scheme. Select the NVM file
> and BCS calibration file using the controller board ID when available,
> with fallback to the default files.
> 
> Register the QCC2072 compatible with hci_qca and route it through the
> same UART setup, speed switching and power-control paths as recent
> Qualcomm Bluetooth controllers.
> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/bluetooth/btqca.h   |  2 ++
>  drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++
>  3 files changed, 95 insertions(+), 1 deletion(-)

I think you are a third engineer who submits a patch with this name and
with no mentions of the previous work. Are you working in parallel with
no idea what other team is doing, are you ignoring the previous work and
implementing it from scratch or are you picking up a patch made by
somebody else and killing the authorship / SoB tags?


-- 
With best wishes
Dmitry
