Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646548094A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787074717; cv=none; b=uMp2tknxwJGmopk0atDcxC19RpISQoNOzVJv/V1zXxB4zXBHbUhzvyZg9zbl1JGowlKtEhVK49PSGNV0H0u9XBKbPKq7olVofphwnx6t0J7pdVAPRd8j4K4rNPm+VUafklkRa9qtvJJZDchFgMLL8rPHCIl0gGEZBrGl3B/2YvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787074717; c=relaxed/simple;
	bh=G227ozOR6YZGsveigSnSJ/VD7xq2jTvpGPaHrNvHe4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EprRSCQn6nDMh8djRboIkj2XuMkm0354mjjciosU8tHtMeTVnup68KBRWOxbaRxORsZ4hnwdVCrDIQnB6oxWCRFhwTXOu30kivUzz0u8bTAzhMcA3hLbf7RY0U7b/uc67XfpLqRU32Al2dthVOugeTRik1FCce3zZQFIavSzvEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAv6iA+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx8Ed3FJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAv6iA+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx8Ed3FJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IHJJCj735716
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 17:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OZzXO/L4OGKla/e1sm5ctZ3k
	8+AOXfY4wGZlOTKQYrI=; b=XAv6iA+M+SfVm+feu4Lkosyyt78zQQaWc5OP/wQO
	2/TupyxDFYqIIRG0Ouzc8cPr22iPl5BgRfS4JjBM47CdGu5YACi+CfQ7bCLnVhNN
	6fJKIN3kG0hPeGOB3QXR6agByqHoHksBY/XFtcPGGgxa2QJanY0WoWUb8wzaOPqS
	PH0LlPHntaNZEPtG/2LgTfqInDKK26yJ0iOT3xeU+FH6UXkU9jNHkzok27QWZ8q4
	aGlwvQVSAoqJhZvLl20sxBw9TZ+kTN5tZXs3ADIV7aZv+stx0KpMpC2xy8LcUmFi
	6EcaREQsxf1DE6p5MaLRd7RqlKdNBPPDelFI9nOOJ3JhEA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4resh59u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 17:38:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso42488a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787074714; x=1787679514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZzXO/L4OGKla/e1sm5ctZ3k8+AOXfY4wGZlOTKQYrI=;
        b=Gx8Ed3FJIL77b1/B7M0ugOPQJUHvG+xmJaLhvqc5/rz4jDef5IIpYupJfsvLJ/xllH
         3n2AFt1i3ubaM93Z6j/9h9KvY/5oEh3alVzyScpoke5+JDTtNWt8EatTZBNgVnDLl8Ae
         DrHjLp2j8PjbRhFSdSWp/n2oqfRb3rPPnaj0YYxLKkVG+ISzJnUGCJCm0lD6tC8rc2zx
         jk8KF1qpx/4bSb4SheFHtRhnbn2S0T1rr8O9kE+ZuToBMKQ7cSSBklaNCU7plE9y8AAg
         e79fnY5T0/XM6uwdj701f+/qTy8VXjCx7+F9dnCC5FZfTHHLGnZbGW3s+NR3C9obTVS0
         hPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787074714; x=1787679514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZzXO/L4OGKla/e1sm5ctZ3k8+AOXfY4wGZlOTKQYrI=;
        b=Fd7PG30wAZJGbZXeI9mjcxvnT3hkWKA9dDfP7YcaSeOhj3kE+DT4MTk0yhjKOdTKQt
         LCwQ0TObvBHXCmBdKAECH4+dOw2lNW9hPZUDqOgW6zcUNctGI3fKbs9gKFFoIAPLZ/hh
         yRhr0J5ptuVGTBCOSyLJ9E0DujADhihtR9IL/JuXl61eZ87BRB0JN4kY4vjA++6LHAlg
         qx55VS+piBnHm2r5nFFqiUkJkwMxNIOctXC8v4L7f7YEW5Tsz5T9VfcfO3rbtgqtCi0n
         aYzt8qpsQ/N3z6b/E3lc5Yd6mmBPmqMPGqdTWWTTHC3r9mNPVg3VCY1AFBoi7kWQLras
         uecA==
X-Forwarded-Encrypted: i=1; AHgh+RrzX7zsVHpt/zCbFI0U+3D7Z3PD2l+2CYmKbiRf3hJ3vSHOcnjVAtWsN7p+vkwFujlmSErnTweRj0hpCpOU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/UbJmISVDuGv7Wnw2+6+ycl2R7FaZ6Fza7BewNNNCMXRO0p6B
	RpMq0TS1kixiLKR5eofiP5oUnYunK/rBFQdkIlPMTrIINQ5lTsvFnGiTEv2edgz7ySn3uGfiPsh
	4CKDY6WCGw5ylpg91zU9Efe4NgoGs+QZq8EoYC0j99Bdjp7GWj5CfBvZznp7nG9BL+jkt
X-Gm-Gg: AR+sD10Imr9y2UAG/pzFUX7l6VCy5+LcYzIgQC6osoEXrJa77BrXOOpdwza4JucbWIo
	6u3SUBxc20BSZ4iatkqqQi/cVGprvSe4lVfKESfjfD34UdzvEyjG3JvcEz6fF+RncSWYJIgQZwT
	nkaW5QKEfttSyEKezT/4qU+79NxbuepVCO6ARdEOIi43qTDjiMkYxBkC1Rd+fenUaV6hwS7VzVc
	mIXrO2ygOg+gmUYBlcyTH/HgId+EIkpZ0k4d2jzfLs8MBz50SQFukzFGOunoOoVCqAd+TaOtWh+
	HgTQmliJW2MZXy44mB92tkhZh57Q1eRGIRWeIjNwd9E+68BMzMBXA6qHtNWJee/XZc5/9/qHVtj
	VQ3wuVhmzAWaRcNw8nzm2roR0SQ==
X-Received: by 2002:a05:6a21:504:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3ccda405880mr16182279637.5.1787074714147;
        Tue, 18 Aug 2026 10:38:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:504:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3ccda405880mr16182184637.5.1787074713619;
        Tue, 18 Aug 2026 10:38:33 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141530793ccsm19640985c88.8.2026.08.18.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 10:38:33 -0700 (PDT)
Date: Tue, 18 Aug 2026 23:08:25 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <aoSYkaFTTlPOKz+w@hu-mdsor-hyd.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
 <20260728-shikra-work-v3-1-e08c322596ac@oss.qualcomm.com>
 <ee479488-9f36-412f-b6d0-725180cc1122@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee479488-9f36-412f-b6d0-725180cc1122@kernel.org>
X-Authority-Analysis: v=2.4 cv=Ne/WEWD4 c=1 sm=1 tr=0 ts=6a84989b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8K9nRV67sesUJCHgNhYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: BWQvUpWOFMIaUkIAQuN9G7EMMEcrNk0e
X-Proofpoint-ORIG-GUID: BWQvUpWOFMIaUkIAQuN9G7EMMEcrNk0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEzMCBTYWx0ZWRfX+ixvp+jD4eAM
 k1nv4SjPPwKq0ELZV4E4JcpR4xhlgly8BEr/o7F53gNAS+0TNENeMak7PrAOOvkiKEnJr8DLX7P
 s3MzAsnV0lI6qWnjN1VShyNfoZPfCE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEzMCBTYWx0ZWRfX3M6MD5UaxiCE
 gsWgWxAEyW04BM1DPFZgPWJZAXtDiUjSx8dETYo4eEUvh0mu/PkHH6ulNDUFdnSZM8lNdzlE8cf
 e5UhB2dZijrP0q7N8mWTf/5LV42W+ovlW7xjZkUaZPBzmE9gEcO7EQ2oPazrnD7KQtCLVAKjMgl
 yG9knw7DYuMEB62cfeEtXpASHrB5PAkiKnL7nONDjVSiT9CYiaCxD2Rda2QZ0xA7Vn5QtHfEDaF
 8ojaP4C7oP94tdSluAzIfCwQvOpPJ2zXDQO5W82z6PihQoWCkH5DfWkDYjIaIhK4BauGwtbVwPy
 wOH3w57sxhhWGziGIadhKdiF8vx/cpnxertCleoRT4ovsqMfOerS/L0g0jJUNFc/YwIGyC4GSxn
 IxJFkpY6fX5VFkUpLkMu8AgakVR+fQBZvlKVoY+7ikw6IAWXKVrmwUwyKBGEJ1Bp5Nq+Mu+q1PE
 nOcIxhToTdbE+itU3qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180130

On Wed, Jul 29, 2026 at 08:19:36AM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2026 14:00, Mohit Dsor wrote:
> > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > 
> > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > 
> > The bridge receives DSI output from MDSS and drives an HDMI-A
> > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> 
> Did you ignore here previous review as well, just like you did on
> LT9611C patchset?
We will fix all comments here and submit new version once dependent patches are merged. 
> 
> Best regards,
> Krzysztof
