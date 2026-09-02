Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807323EEAE5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339199; cv=none; b=aD6m0fG/ZiUc5Ml9pnuNlrKyP6P9CwF0oxGUy11ZkUTAqRbO8J4vRazUdW+05sRNLqGiYfif1bfBaTYL8CZYmlvgpenwugHIEFvbEZDJYEOUGXFmL0mhkPu7YZtn5PlXW9/uAtt+CHDGx5Nl8aqDR9XW4rhOqEUWnrJqXfC7YhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339199; c=relaxed/simple;
	bh=T1JG3em0p1paRb1Xu5kzfxwh6/d4EsI28h/XLBeD/J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAthrBI4mbd5WidTH8Oq4O8WjZoXHHSd99quol8P6rfsnz4IVBrZPYN0cj0Y8loqXsx1GJbVXfiKZOjDsOJCuI/0iIOu3dtXpXiSyFYFGNkNZmWoVitqTa49KqKBiAf8u0pS+bTUtlZyIGPvnHxvj62Y5vvAAYRXxIV9jzy6GQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnyC6c4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4B+QZBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnyC6c4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4B+QZBh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VlYI205046
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K8a5Qeecw7yW/ZLAacnCV4Yc
	HDrzzzIXCU7cFMLwyag=; b=hnyC6c4EmJmACn6sqHDppoIb/MvNImIUa+OnwTpA
	2QSZVjFUOXWoZbcMasHDOjlc0t747iCBNhvGBmh7LyJGSZubNUxN2soncv1cI47f
	023VRpUgyylYNCodhl0Qcp/lUn+Gaq8OeeuTB1mvKfgs2UU/jlaeXNOWoE4PpRBV
	uFzjI5kjP+9/rthZw5C7Qi9M79Ku1InQaOWlQ4C3kOhU/CQx/t2qtXfr4Q3zql6H
	5c8/UoaFVg0h26hMGVjp7mg1a/z8HqF07zkR4oiZTiWdiAPp5xqqNctjBUsvPeEI
	VvaWruy6s32Cx/ceru52VsMhyUAkXdrB74+1OVC02xnC+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbj2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:53:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso106976385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339197; x=1788943997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8a5Qeecw7yW/ZLAacnCV4YcHDrzzzIXCU7cFMLwyag=;
        b=T4B+QZBh1xtZnJ0kKo86jk5G5NFXTdkM43gAY5wH/eqqpDJ8XevdJMfLOvZDcSSWDJ
         IeqRfXamXMMSCLxj477LEi0tU0qQUMIybpYRvgbXdXBdVgGU2GwkOkZCr5SqvU4g0uAL
         08/LueshIwkZvTh3fDVgRpwjImnVHDi+k1pu/dLfsUVdQ6b1pTp6nxTgg3tE4VmfXSbU
         BiUYSjUhWKu3Z3pFpqw3xLTBLOUEj7Amqo/UMghoqD+46iLOOpPB5rgbfBn8WZ9n1GIR
         11l3+ClIvlQHvwh4E9DMDAq4A5aRG+CFUylmJpKvIgKNA2zcE/RZMnEkuxwHr830+yTQ
         jKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339197; x=1788943997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8a5Qeecw7yW/ZLAacnCV4YcHDrzzzIXCU7cFMLwyag=;
        b=EtdnJKR7UufsqHBUbKzCHz8nTfUO5vWVH/Gtdl/+C8MxPzbYc4ZBs6XuhkWgzzO2oK
         +m9msNKUBJsgF+ZYZRGB0YWyiK87/UpCOsEwUpi6MDVTxjVcNh5G2yQdK9Wf95IoXvWK
         1ndmbL5XJyuag+XBYFTprNtj3WtOcIydx02sH3O3aglXhJ+ZNmU023Iad2P+3UypoBen
         EEBS8vIAFOvPDwJkonaOCDyR17bP7SviW3kuytWTa5hARB/MVmvreMBS7Hg0Wj+6P+oI
         DW7qR6tXWSi6n3L0OEiE73ZjUnuKjRNOA9DjZ8jAAYscHDyy41qT5igLwmnf8rZqTzhs
         7G2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEncqpPEBKpN+lLN6aDhzWyVbboBvpkyPlrkMjc/Ie6GuCA05gU62/QfkIx5IeHaJ8Dg8dnNmFHa7jQ6B0@vger.kernel.org
X-Gm-Message-State: AFuF++l0nKFJxKnMkQWkvmtxqKZ2f0MdJsE1rGdEXvTRnKb4R4auYLh8
	CECTJMC3ZftITn5HPZ5eA+eqcIVuSzrgBkjzkF8VmwhZaPV1s7RvwOTLDZXusY0EE6kYKnq5O1w
	iHPtOppEfjYdAbfbIVON0gi1BQPZ5J9r4zUajq/5tu6fz+T+RtLxGq2OrjXJnzE1R7YGb
X-Gm-Gg: AR+sD13OPlMgBB/hSA52YYUoW3ReQbtp0XCs0YrbEUAFm+GbLysrB6mvRhFvgp3XzRq
	l5mWHUI2A+Ke8cT2at3QirdutGjk2UkD6UybbcCXuzzJvb4a7VWKNtus8Ue7rExUwEC8OC73CBd
	WeGjPkvpuUi1ICFUVJ1FU2bhBjzzyVSW8LEqDFEVwRMqwJoWvq8YLmWJ12mzKWUw46cHsXuQDnX
	hOftzLJJ5vufVlvN8mLTWo3ukgmO8bMhjYXtMJ1NSN6gtv2J59jcXuW3VLkfjeLqYCLPnlig5vb
	sFRt3+16UFTDJyWH4XrwS612ZgWZky2ve5aWE5rD25sD75Fbf25ZxuSop/zst36yMULnm2xFqMP
	/Px6+ENK166h5eg==
X-Received: by 2002:a05:620a:2248:10b0:92e:e559:fe6b with SMTP id af79cd13be357-93960c9abbbmr285767185a.7.1788339196629;
        Wed, 02 Sep 2026 01:53:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:10b0:92e:e559:fe6b with SMTP id af79cd13be357-93960c9abbbmr285764885a.7.1788339196097;
        Wed, 02 Sep 2026 01:53:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3706sm4994717f8f.18.2026.09.02.01.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:53:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:53:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 4/5] usb: typec: mux: ps883x: add a delay after writing
 config regs
Message-ID: <btc6lip75jn45tidah3ij3prn4y3thhcebuqnomyc77z7egika@kiwgg73impot>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97e3fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=J1mlT1ugoPMniApVoKYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 35Y4eY-XwnJvOWdplY-wPlW7vPPSooEf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX1EOTZMerakST
 Pa3AiG0hZjrF3S367RP7ER5Q24psRlt8yDjh1hidACZ1d5jD9oM7jZZQTm/CiqBBbLeDR89wMXb
 h6+Z8XkQFVpN+2PqXRhzUqTUHv6jAyk=
X-Proofpoint-ORIG-GUID: 35Y4eY-XwnJvOWdplY-wPlW7vPPSooEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX0k6V+UYPFaIh
 ZdOev7qE3U+JqrjXbAS89PlcT4yP8j3ElDbfbe9r1gMm9mkg5O78qbdf9IkmkjgNmTXLAKh6GSU
 ycZCM+WJyWI7uHnGS33DE1n87YXGC3+dy7UxfgPVoXZMEHSlqgvuNR6bPMAyCpki0Uk5Zq49AI7
 EVztadwEFfmcIrypZkr7Gu+0cOHAlDawuOym8hyJii7zehTZPpD3ikh9wbwbap67XnLRpaOc4Qi
 PA1EHdQLgdq2U4UE/ho6e/Pt1bpHkHcwzh5Bs/ioFfa0+wRItzimJ9ZcG22APK6JbTNRP8ZuFQF
 FBNgk/GR4aqRiSaMJ+fCvsm+5POkKZbdboKwDh1QAcBTL/xy15U9RShUCRNLIQzXeCQkHmLLjDd
 D+jAW2LZO5gSPCliLm7bK3c4JWt0QdBdi2UzN4JWuMRkaYTZ9mwWA6EdlVTQOy82w0xvx5AQK5v
 QnHNJqWA7j7n+uYyDew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-07-18 19:06:32, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The config regs seem to need a few ms to propagate the changes through the
> system (like, PLLs). This improves the hotplug dp altmode success rate
> on the Lenovo 40B0 dock to 100%.
> 
> Tested with T14s G6 and 40B0 dock on the HDMI port with a type-c host cable.
> 
> Assisted-by: Gemini:3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
