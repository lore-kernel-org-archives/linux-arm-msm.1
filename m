Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D473803DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421791; cv=none; b=h3BazLpTqgoWc8DRasE5NmqHga3yIhIbJFlsxha0WOPHabvc1uBwCIn0SiCRPvswtkCO/I+vskb/z+QmZ7MucRQYEKvP4/SeAghLnbNN8Je+QY9SNus1WtxZ3GKYYCdeRXtNAxShj4wpkdeIwMwGCa8hN1yxXYTIFNr0jYju4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421791; c=relaxed/simple;
	bh=ksv/avRnK4UOBJ1PwYrAwimKQy13c+CjYXmlx2M+y08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1nIp1vFEifHB4FoMDJkskJzmWCRmtXdOGBSB8DQff3PdiuOsQEu8E2a4/zuXQ+DvKIkTC7uonFmdAYO4KKk3W0NHNy6j6XNCzztIpBKZCtQAuJUTS9wtZ+EKieUtj6ri6k9+j6yY5DJvOSiB73797z9lHdGmcHy7NaV0jo1pDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1oxQjw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T13BqZOg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1oxQjw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T13BqZOg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lXvj3244940
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GHibo9Blx2AAUlYEMr9nHfq
	J5O/B9F3H0pQUm/H9Ds=; b=Q1oxQjw/FsamPFoT6xhhMx+0cOMRK02mhvy518Zk
	ZrXvctXVLhqBKLXcq4ksiw5hIGxZ+3HNBq1gSumdq+mfme0gCrThrv6fjTC/3szr
	fcUql69XiY38pX/hu1FVCSsB18qPV4I1s/Q7ZW8Vsb1yhRCumW/iw2Mx+vY714OH
	cgWs8379I1YRcESweUqdhoOZMLDum2TutAL2U9Kn8yM8ZGUUna6IUEPmRkuOAu6l
	zPyxT624VozAINaIfXnQWowqOT/DktWhyIzaao3jC09xhf72qZx/7iWtJiHWAWMU
	UoPE5fl5QxqlE0ht3rdJ8qW0HxunKcTeO0+31GiYmClhHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcecctq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:49:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso296107985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421786; x=1789026586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=T13BqZOgjfdoXUEhABJkkafh26fRsW28zEpYhfzCS1Jv7ehhaToPeksB7/T+82WKuM
         LrDVubgDRs3JIfrCGmHRtD/X3gW4mPllh2OAnhkrh4WwDm2PU7KUCKiMiU1o4PYGWNzr
         0VuHFFnmpwEqQdj4wWfyXeh4N2hVRJqBaH4H7/IcJLmZGGBtzYogcfdcoFa96Rl5MKc4
         XFxc1j+Trv+H0jX93OJ1JEVvrLTRjNFF9xWFql+ZbNVDOkUP8xagBedXSGAXMAhxMke3
         GbwIreI1ckQw1v0oLYB/lAd6rGnFB33WCssMokVA/tDC2rrrP8fAxLDfTXmQ0QHZUzYG
         pAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421786; x=1789026586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GHibo9Blx2AAUlYEMr9nHfqJ5O/B9F3H0pQUm/H9Ds=;
        b=pZPxtVw+Y7aF+eyTIbmbDyZ7USaB5YdOZ5GCekJxhStAKSxwq7CRe74LBEAk939oXB
         2sk73e3mNRY0Y3aDPuD/H2SgxVJbRbOeL7o28hf2T+tBT/qTc3lZUqhZxChFpfONPvs8
         6UYeCJnAf0C+BHt41cQ4D0UR+YdqZuB0IOQ4OVDt8lucpTwC1rSXupoU4U2gNJbvIU2J
         x+aTDV07a8STJBrpYuhSn5/0Tt+S48e9rgQwgeoHvPI3P8H9oHWVG8SaiYVRnCpMr71Z
         NjlcTHB0asskTkURJc7TguclCuX5ikUbZqGl/L6XrDq+gcRuNoXekBnTfVclanOXB1Eo
         4Vzg==
X-Forwarded-Encrypted: i=1; AKwUvBxs0K5ZiL7wdcUYiJS+575lTVGWqwGW/Xlxaei2zqkYLQwanShCLCNbKvxw+qfvZBubesQNpP1PqIim6atA@vger.kernel.org
X-Gm-Message-State: AFuF++meLO7KifUBTEJaH5AsI8rLYATHCHCdJsbv3omMixVb8fk9GnYD
	wcOKbPEDy5J+JL5AlBdt06oYh1U9rj9xZCoHaHenrV30TdekoHC+Eq7kYMzzH+pBfV2U03XQ7tZ
	/6CR3MewazjnxoOUMMYWUYkyRovwvNp3Qb/nihGhlpawjeVIImu1tKg9e3w2NI8huIN0G
X-Gm-Gg: AYBFou2820G1HEMyL9icq6LKldzxPw0TYUBKPfR7BNu59Tm3KUv91S4scRHsQe460M6
	6WR2TppGPbPQ+NwN/dU/AbAjTjacBb5dLNBMNvSpdSIOocLb/Ny2S0+hAbQ7qKllmjMN2ckHbIx
	RCtCR0Tz5DJq9oc7a76ymq+p20V/94mYAusd3oToB08nXQuR2SxsBJ7avkmOlHUcFBLuzW02g8M
	eCw07svKtAcOqngJ4N2p6E7Zori8Bd64MD5D/FMPil6Rok8j7+jUTxBduKySbhyuFo7gmDAyF0I
	svdP16cEEKOhHE5DGy/bxYrtzjpOCEWYYw0+EKcLWhWe3jwv2Xt2nBt3SES1b1mBYvcMFMF4eLn
	MKAM5XENQmj4K8w==
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279827585a.41.1788421786128;
        Thu, 03 Sep 2026 00:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:937:2443:341c with SMTP id af79cd13be357-9396100cb30mr1279821485a.41.1788421785465;
        Thu, 03 Sep 2026 00:49:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm11219681f8f.31.2026.09.03.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Message-ID: <oznqr22wo4tuonlcs36uabppl7anwax6hcpdt4j5ppgjpmkzha@q3qmtizrtzam>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfXzvzPgfqzjFIU
 N1poeaQmP1APr8roSJXSAuz50BKMSEzVyags01yC0dRrEQTqi5xoCJVK96OPItG+5KNApBBhwd9
 Tyg9NY1D+EMkhLnpcByV96D2HozGxNTK7v8PjEWU7ioW5WoI1rqeINgiw0qRz/e02pVtFxHqdGF
 OOyVCGy3Xc8XdzsrMWzRN1xdQs+yKpBFC5a2ZNrMnT0nWZQYecB+DGGZ//xmeh3cxFRzmbYzoHk
 VJo5e9JmQYg/Y5olkl92Goc3t/bRBV7Zg8qbm0OY+znBimU/NWGTo4s0EG8EQd6/Yo06guzgtvA
 XGYTXRiYdGzkbSk39Xzbs6NOjzrW+ytvMZ5fRy5bMsfzI38kgsP1gbc30ZqCDi7W9vbhbwhEIBa
 dOV96Ne6nRG8KJ/2X2I1m067GABslfmJef8u7PcpfrQ6UtaN78/qyM+nn6PyRMFHav2JyIVgGlB
 p39GIcUoDDFxxGM19+w==
X-Proofpoint-ORIG-GUID: egt28ltOSHMEXrqkGZ8DtDy6dHv4NWJ8
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a99269b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: egt28ltOSHMEXrqkGZ8DtDy6dHv4NWJ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX9KXMPfpzLELk
 ZeKPDl6eg95OJkxEKlJjjehMDMthJlu/sU2r1xVzEeje6C1y0TL5MmVpYN5KhFpsxIYiC/9az/p
 Mpa2ZYPes9URURczFgZT7zIUbiMXQ6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-02 21:22:25, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
