Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793895494;
	b=0Cnq7C2QI03hG8a9AfZyrf/rHzK8QI0oaIyWq6JbVBFHTde1J2vDn+z85V3v6G1nqbS4
	 E5b8ubnNtLp0fQFUCh6oan/GlvHF/GceBp5/DTdnutK6vGx0TVn2fYGSiDvWhxQvkeHzb
	 78ETHbFJcRlt0RkwqVi2Pt9wHe0/tPUC1MnXS0HeMscqSW3K0tEOmiLf/MKnWqFEv71Ok
	 faCARWnnSUdw/rDoVV7vlOXRuEzCZ6r4TEYizhFtUUuTaPdcVBXImb6qzI4zxT38ntY7M
	 WA9CmaGXdJfAVuwFBUxctb4/lV6jvgvSrpmlybQkbyyTThwUIRcbukHe+1niERmao/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
	b=ujteBM+BZu+Cu8XGmBan2V6+FXYgy/Le5ZTaXHuGU1OwKYRrthvWvRIxcF5dHja1p5eF
	 UZ/BZyuPx7uxZlbKLm78+JjXDYwy4sLsBhJOZZkqo9dz8ELeH2+htfNKljfgrpU5LAvK7
	 TMo0sklzqWpUNKYSaQmK5pmxq2q+el8ESuJM2lCXmPwy63TTviMgPt+K1OZEzDVTqB4px
	 wMNI34R9bsddVOnb9vE550pwER3rhJaHhlObwg/khtxM5rtRjq/DHN2vtLIGlS+kIeL1O
	 1IVTD7R2yp4zfym8tTKZeS11OWxGVidDbbzfExEmwHRGXlzJg9/bANet6mPdnTY/Mbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYPPa2uN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E00F606EE99
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E00F606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYPPa2uN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQACf1049737
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=; b=TJ5E9oPfEBfB/Uap
	OuMLttHgoJ+Ljst9nb794fGPdkaPnHil3RfUJcmQvkWZSdqnuC9jeImWBkK/H0v5
	KBldy6ubniZQcXsBd9AK7iC3WEOr4dOLVhm0Z4fG4SIbBuKbiMBrO+0WbSbx9vPc
	a+G8Ecljd4M0CkHKJW54TQYVbtdoXJL2dc+0dxz76RuCwN0k1uGRZ33XrMxhJUSV
	TrX4X0vpYEitqqlmkeAwy8btJ/eQI/bZlMRhlURrEgFkNKpKRuEpXEX743unYEnz
	eygLe3trZZQ/pV0ZfXAugabZdM2QQSvm4QQSZRA1RtJhGZx0Vi1m1sk4jMj0+tmA
	0uPIUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaahyy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:18:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so393454385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793895492; cv=none;
        d=google.com; s=arc-20260327;
        b=Cm9TTAYkLwsVMS6TZDf/0Ie6n0TX+0zqMDmLWm6OjUerV7kj1KUheeiMOZJqHSC/IE
         H0BaVuApnlStzvotYdLPOsUzztZkt9jrh+UMB8TLpnF9onN50YQaVVZA6gi7G9N9Y100
         Mgzh7uGbUW2B9vxnyptXJtzRofWQ1pUBuyztO1JVWzMHtTCeKKIicpzWt/QzOzoCZxKT
         fNuwfPNxlG5yZtddk2mzzaA+p4bCE/vx8sjcRDyqNONzU9ibkqTtK9FWqGpMjQMvxWsc
         NhvHYTrbjOePzdmxlbqoy54xZSpaFZ5wKnYfTBf1FipSxAVQgUS7H23OXDqRrxccJXzd
         EQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        fh=CQmQ7SDKavTvJEPFyyJYvKiPJT6e96Gaybe5TweU7gg=;
        b=ciMpye6EkxHZ75w1eHkqFcOc3f6Llk/iFEYdS5KpczYzpHSiwGKxbnVHKz0Uc3u+xO
         5t6ICXQvDquyPrvm/QGNlimwYtN/gj+yWkSY9WMz6oUbrgBBAbU9KbnrjWO6bgmLiQIw
         eZU21SLmS7jYJcIIrnGRzFWx3owxinFxlgaNmKfjqsYSXzFWZTS8d0Cbin2WZclffegR
         gweeRc0QRTdOJZhMTBHSaxIa1haO6lPBWHksG9b7Vq2BWw/oxySUYW7d9xCgbaFk2UNn
         8/Osl+vvLWS4NbXJ+wLVCbBfVZU0PydG1K1PapPBwp7J2bbxKncOUrZ/rXbwJXJ+FdXK
         A36Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895492; x=1794500292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=XYPPa2uNbpAm2KapZeeRonOZjUVriQB1nR9w9OXy+GiWjM8RrsYngiUSthq9V1706O
         v2s5B//ay7+na4kyVZ43xrVBAaT5+4XHy8KYTkXRAS1GkoKqE+dCpwe7pIoZtxDEGjGw
         7spnJGBY5xwzutDKwYMGS06mlZxqNuekoYRY8x/ityhJB5sWXKdgNTDo3YJEffi426WC
         RSz6BuXAhM9Kb2j7AE5dORa4Cn+UxbO2+SiIEtGm2yayKXJiM73btstbjLagz3eUnGiq
         p+Tc4dROU7hMP75XssbzpeV4eL4a7ARGSNha/uImOdH0hiJ7b19nWL78youNkA3uPSB0
         UrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895492; x=1794500292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=RaHid0SHRpPqX2hDT0nMrCIFAXo2yC9eKL0UGaopEMHY9+3XCp7vmGXQRxLVmxHRxL
         LhdK4wXkDyX+dSMWsxk3heqv4ss1LVFrp9k1dFYIA23ui81Tcc4/B2w/b9571UhIlbKf
         5qdb54LOepPDoZyrz4yea2NgaLmugyvO32NAxQhLG6BvmvEN4qBCS3CGrNkIb5A3iJeF
         WluuzXla/Xtpxj/kyXa3jthQ92Ruwk2IGCe75iJ9w+fGBuCtJqE8/yEg8QOvAIBF5mwb
         IHxtZKetYTkxWqErP7Io2GAnitlztFrjcU26fPbs7a2X/0jMrCC8UN8rJ9trESFZbDRk
         wAkw==
X-Forwarded-Encrypted: i=1; AKwUvBxtbihoPsnrXWAmHpWv2Xx0pWsiDDHifLJg/5zwcwO1mO/zbUrDtxtk/bAAGWt1HstpYf84tveHMbn9m2qc@vger.kernel.org
X-Gm-Message-State: APuU4Z8qg4ZQgHU/1Y5q6gP1GiQ9WxEW0e3gOTDJYChGkHSt/xE9GLY2
	djGS6z0MqSTJ1iRZ5KhwOqzfLroSJM6yOzyDZc2JKG9FMq6gqViDnNcugJLtktF4ukV275jLRjZ
	WErEu2pZqpnStFthNx9Y0S/uYdLGy4h+FxIR116pxvcMzZbf1AD31Vkplz2O+QSmTr2zpxh3Zmw
	Q08Wt587wOJE4yaKgyme0j112IYBmQqa+dwMKGYeh02fi4o42mZN4=
X-Gm-Gg: AYBFou0Oi0QxFo+mS+yOLfq8Ky0QUu+BRWoRRoCAatQ0cv2q0kvgJBUJmYJV3fG+8SY
	0QdOSIXFzPmU9tNR32GrPXNkGzdWTqYQBFD7uN4U8nvqqVoOnJbWnggDRQWhVgkxF5iAMMyR3xL
	fQX2mRqOyF1iQRlepkgybwfVpHM8wfyRq2JGQNTamiTIkMBelp6mbrevRNvdmCDIgbhSco142Ww
	rrfCZkUxebcK5+6V3dKr7B5HDT3/Y/WD7lFaxv7I/BKy8bbITDK710vxjxxV6Jqx1nas54s+D8=
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id af79cd13be357-944217942dfmr3213719685a.55.1793895492367;
        Thu, 05 Nov 2026 08:18:12 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id
 af79cd13be357-944217942dfmr3213713185a.55.1793895491627; Thu, 05 Nov 2026
 08:18:11 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org> <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com> <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
In-Reply-To: <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:18:00 +0100
X-Gm-Features: AclHuK8YSQ-kFGWQeNw5tClylojuV0W0oBaKhzme8TxRz7tVIdZ33iLLr-iQkJ0
Message-ID: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX24pdKXLp19xX
 VskQPlsfMgZHpbYhwG8gNXQbiqtfPq4Ijs8wPXt+jkY8xmuXZLy8h/Xp60UNAUHSGQpbplznjTw
 u6rg6Q9AP9gzjmDrUIWPk/ddE+rumN/ow5rNqXIDIen7AnO/EUoS0xwnPuoWdoXTgBXSd4WRPzZ
 My7wNQMDtOvLOwz2FForMv8RnqYSZ7GqQgBRgVUJFulyrgcdOZ6orqCyo5lG9TH+tHsczfuDQt4
 LGWJkAoK1DgW8Mp9W78E7dy3Mw0BnMm91dJGD1AxHnRQXG7j35wUJL9zxRGUMjSqxEB6tlS4IKG
 bIRQg1Dsq7iwFfNRZjN48QNeg8roKB8FHx+kEzIgQRt31vJW1Q2mEX8UXoTU/FAuNATEx7GKJk0
 z2nYlY/Zp7K55jkC9JDKWZhIQYVQH36jbBPTlYEdfGP34Y7fPdaPGMiUcsdgAi5/VL4TCSk6ug3
 pnm4h9ijrAH06hV0B2g==
X-Proofpoint-GUID: sBsQJamoJE-JOvzthkT9-8FYADwBMxnz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX9oUivOqApDoC
 beNiX1jy2UUwJWLWhc9Ph3DeV3FbHTTyhuWTRC0ZkE7PWJ5eHBqwktwOxQQd4JoESOQm8HYbgHz
 mTGJwszLSyRy/4IIgFEeBe0WtvMqSBM=
X-Proofpoint-ORIG-GUID: sBsQJamoJE-JOvzthkT9-8FYADwBMxnz
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecac45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=oudGAjWChX48PZ3fjK8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050064

On Thu, Nov 5, 2026 at 4:46=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 05/11/2026 14:01, Loic Poulain wrote:
> >>> The CSIPHYs are connected to the CAMSS input ports, which can then be
> >>> multiplexed and routed to different CSIDs. The mux identifies its PHY
> >>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as th=
e
> >>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> >>> connected.
> >> I could not find that information in Glymur HPG, but maybe I looked
> >> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I =
am
> >> looking at wrong device description/interface...
> > Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> > (CSID_LITE0-1). These blocks select the PHY source to be routed by
> > programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
> > PHY_NUM_SEL field in CSI2_RX_CFG0.
> >
> > If the CAMSS port ID matches the PHY index, the port ID can be used
> > directly as a routing reference, which keeps the implementation
> > straightforward.
> >
> > Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> > makes sense. In that case, the driver would simply maintain an
> > internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> > } to PHY indices { 0, 1, 4 }.
>
> The media-graph informs which PHY connects to which CSID. The
> port-number in the DT really only identifies the fact a PHY input exists
> - it should be considered a mux in front of the set of CSIDs with the
> media-graph being the route.
>
> Since the route is runtime selectable, the media-graph is the boss, not D=
T.
>
> You can try this on any CAMSS device right now, PHYs connect
> independently to CSI decoders.
>
> PHY_NUM_SEL is derived in the driver, not taken directly from the port
> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>
> More work should be done to represent the fact-of-life - the mux. This
> was discussed extensively in the standalone PHY series.
>
> The ports being numbered with the PHYs was a consequence of the PHYs
> living inside the CAMSS node - which we have the opportunity now to
> break with and should.
>
> Port number in DT should just be a linear 0-X for the number of PHY
> inputs. Which CSI decoder that port routes to is still a runtime selectio=
n.

I think we're all aligned on that. Point was not about describing the
runtime muxing or routing to the CSID, but rather about describing the
CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
block (MUX input).

So yes, we could argue that the port ID itself has no inherent
meaning, but it acquires meaning through the convention we define,
since we still need a way to map DT ports to CAMSS input IDs. What is
really changing here is the convention used to describe that mapping.
So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
inputs { 0, 1, 4 }.

If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
the ports are associated with their corresponding INTF numbers, and
interfaces that are not present are simply omitted. As a result, the
port numbering contains holes, for example {0, 4, 5, 6}.

>
> Honestly I don=E2=80=99t see much value in continuing to treat port numbe=
rs as
> hardware mappings in DT now that standalone PHYs have landed.

As long as it is clearly documented in the binding, that should be
fine. We will need to introduce a mapping table for platforms that do
not expose the legacy PHY numbering, or otherwise derive the
corresponding information from 'somewhere'.

Regards,
Loic
