Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3B42125F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530427; cv=none; b=mp+vxKMn1lN+/R/ZetBHTo7r3Vn4MCipCAv6slYGE+7JV5l+NZxOAl4MZg1SEiNczZQP6EDq/NkNTp0028FM6CPBYjv6RJa2ripkYQjtkjdorbQ9PEHXR6FWECl0SF+B6kCcpxZQe2d3u7ZWHQyEN2qB/iLFDEOSkMfriYCQ2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530427; c=relaxed/simple;
	bh=0A93pA/VhMlMcCcOOhq7yj86uFXhscYwCYZ5ylaDr0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOBBhjquoaz4giSXhyIwKyhDngLDu3eWwd4oyjR/ewzXhvqQebNhWgWWNG+ivFoerTZbDoNaQ+eF60E7Uw7Mz8EfcYmZFZ/jm+ez6/9OuUvyeJV1/qRWqTbdPpSckMSJ8pgnE7eF2TVt0yaZy1xfo5U0FpXsiHlkgjSjGvSXJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN0HUuB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYQNAb0t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN0HUuB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYQNAb0t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9gECA2211806
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1/y4ILfqQT6FHvqHpmsSVfBp
	bakwfT0CniCQEUEhWNc=; b=EN0HUuB7r+9MMvSSDM4e5fKAk87QZT00qrWux6lo
	DR1NLGu40/5WFLUEQ5DleymJfZic1B3tlkrwP3j8xYb/I+5R+DdLSxYc8J7+O+rx
	VNT4C7Hvh7SVdPnwuSc5FFVARW0ZkxNoqAINUiEmZoWqkDSEdB0KcwqGirOzEzZ0
	Cnanef1g8iR+W4cvmqionoabENEeHe78XJEFbj3MScv3hcFG1NdoMStyoxJjWZmJ
	jdWFTmNGLPUwYtd+ic3wiqhg2Rk0I1pi48PVc6KKfWhmAhmskjHcat4kbWUFhEc3
	U850RzBeq82StzX89su4EJpEpEHJTAqTCHG2phw21CjA6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw1bua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:27:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so9630641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530425; x=1787135225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/y4ILfqQT6FHvqHpmsSVfBpbakwfT0CniCQEUEhWNc=;
        b=QYQNAb0tD6AhIOCu7WVIWEZ1rNYgDBNhJEpC9sNy/RiGA4S7lZi7Jkmt68QKpDX56M
         uM5C8TaYlK8tGx8vz4asgCvhJi1MBsqmTgARzWC2VYAZizkH4ImwzgFN4M+OgmAHJkfY
         QQdMH2HhR1EWZA+q9XNoyM4CHxvVEGihbp4eA5fI27kIRgAhHue8TocYI9yRV/ulOV7n
         79/NsqAI5E+C6vjXfhNIxxNtyr9fTbXXq8wflHLiN8p/nnJxZEM4qZUqoKUtcae+mV2S
         TbGscFYFeFBo8TzUA/aa0tu2C4qwWbpIRteZbDxQ44+vwSu1Xr7aTUN7cjC6QMqlMQ3p
         /KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530425; x=1787135225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/y4ILfqQT6FHvqHpmsSVfBpbakwfT0CniCQEUEhWNc=;
        b=BuN05orxNQ9JHecSGYzXnG37DTYuNMk4+ymHEO6h28Yke7xHM1tsUmWw7eNBD8xgbn
         s6r0myD3kWA8ncenLM51pDqseicf/sP8joMnXzKx3vEz5jSZ38uIBZdJdUUYzRzO3PAX
         3jkzLNhiD2yIZOxjbjzpo7AtPlNZyjEK9JKBDhQ7Il6vHNWcJ4iyxm7aqfC9uF+zqd63
         VoGJfzV8i6KcwIcFO7rGcv/GKngHm6uyLh4WkEPMuOtQkLXtO/bCMbQHgcHBGSvszaGk
         fWcy0SmjySR9CSItJysGCnlvBAn5l0fLa/ORSwo3QXNPriKw5ROIxYLf4nRnOtQzZrn5
         v4xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSP3QtDdPa6FE6cLKcPjDmkd66nWUzuF8EYU8hxK886iIjlpw0knQXsAdtlmqBO656gE1y4edHB8A+VCgF@vger.kernel.org
X-Gm-Message-State: AOJu0YwzyWjM0Y2DWfu6bDnKTHLWNAqkKLcIZyI/yaGBqjieCoL1rm0c
	4U7Nq2F1CcsJtRG5oUmLzcEzaFvSVxjtOMFqOM2fYy335+gq2zV9U5X4uXjeHNZjHSASZMjSb6Q
	+uyfK2YMxozAi6HHLRNi/nQVXxRQyUu5o9U0PXJCrAC+xFKXwpUh6qLbTf0FnSWYkc67E
X-Gm-Gg: AR+sD117HSbHJMIUEwdQcshNP4NHxgyg9yqIZMS5y0ZNN21uZK5p6VpdRDUG+VHJDGC
	AWeqoWR88XJckz6OxDmMHdchf8iIGTXbqBMrCzaKhDhdhchdKC3eSwq5BSYgmOOCCI49j7BUroI
	XqxPbZfIvcC6DwoUdEzYWIPu35M9oDwKYvRtTlGn5t7wHuePKtk2X56tOFihaP+kwFioklkpC5G
	X8R+GIhatqi22XrzZ+FIE0VWZVLfusBflxTIkRvLzo9m1uop0oSxEkdDYV4a9d6hVqUAtGKitpU
	q+2/56uPTghtQk3GV2ZE1e42HuHVeJlh9MNNAcSd8QOuMLUaU0J4uBYE/zVzmBx41zWow9rF9WK
	ts2Gse4kvODId8FU=
X-Received: by 2002:a05:622a:1825:b0:528:38b1:b550 with SMTP id d75a77b69052e-52d6030d315mr59917921cf.16.1786530424542;
        Wed, 12 Aug 2026 03:27:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1825:b0:528:38b1:b550 with SMTP id d75a77b69052e-52d6030d315mr59917601cf.16.1786530424037;
        Wed, 12 Aug 2026 03:27:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa3ebe0sm70833055e9.0.2026.08.12.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:27:03 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:27:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <ge3ufdl2dwvl3tff77dqmkbcddp7zepvves7uqyyuxkiqsewfe@nftn252kk5zt>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-topic-usb4phy-v3-3-ccf0f7ea98b5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX2OOCzK3CQbwT
 Z5FgDPfMGs8EARgqVtMsgzYJAS6/QYZJaVCteb38657FgeUNpqUTUhSnGe+9WYaZpr5gYxOI6B1
 BpxA0Ppn7Ptwf4rCye59U1o4SRNneOA=
X-Proofpoint-GUID: FsbqJM67VqfpkzTW8GIUFMYlBOm-n8IM
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c4a79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gEJiVQBakSoUq9HfEjsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: FsbqJM67VqfpkzTW8GIUFMYlBOm-n8IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX/JbOnOcVU5Jf
 GPikJr0QvMiUv0VorTDHVumY3IZBLHs+9CcJt3yb6OnFUcnzVCZZ9PpVPPHLfalpn/Jpr40oSrX
 kk6FgkO0OPjSz6LPvILWASOCdBevWuLsN9773DqAXYTBGRT9EqBtTOdjRmWsOBdVPJxmnIon7v3
 8WqpjXVrqJi8NdJW9N1uujyReduujOHiN5/PwWwJe6mS3SvyLTDAXt88K6+Kc7Lae1BLuTgyErt
 iWJFaDqf494HiS7hBGjBDvnnjtijeKLRaAd8fZ5AXdDnSSbf7yBFN/0BvPAo68AxBKwDb1k3go2
 PM9f48bW3HP7iws4RYcGUNpAglJBv4VWPXYMuQKitfQmMmnBouaiiy2tv1aYxUdVzngiDKsQnzS
 nNBYx0bX1+7vysE2MbUrxGnw0Ig8BYxDrHsh8kLgYhlUtb03l8vZ2sJRONHwajBL0HUre6D/JTY
 BAdt90xB91N7TXUOKYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120084

On 26-07-30 16:19:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
