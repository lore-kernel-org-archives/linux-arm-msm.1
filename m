Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13692F691D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067748; cv=none; b=Cqhlxjev0GmcoNSg++JAVyU0EPXZkPbzwu22g/GwdBmkehSq8eGRyk/JK/9iEi0mIXMvgp90HPfcs8WfsD1vJRSLycZCWeKkJArAwKGG04tK4PHrXTmDnbrRnwuxqSwLmzY1rFvT0hzQJobplaWuFqUle4Nsiy/ssY6ZgdGCFzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067748; c=relaxed/simple;
	bh=5akQ45OZQFL4P6oJdyXFWpqb0V2jfRL6Qo1J3sj7ZY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLTDr2QQPL6RJmgVpS3Alkf+MOZDQvU/iqCc20a2nL/0stoGnUKareizE165MhDoGDlbrXrXwbPnQ4uXVSEEizSPn7ePQpXOLFyUPqD4C6Qml+md9md2EHCO4Vrtze8bYwJ1O/LaTLJCp+Ab1KpUbBKW+Px1rzPpkzfGzh5Tewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKGcqWHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlLKvEAe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKGcqWHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlLKvEAe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0oZQ1084724
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C82d/+UAQNXbeW8G+O9iN6tLHSBIaUfkFkI8qR5+s5k=; b=FKGcqWHywCNRTvhW
	r3YCGBK/lLZfLnApS9RjN849l3AU/zFIxI84Wxj8QwD5A2x0VhEPgxWzfqW4ANaL
	Pmr3zscAiUjGvVW4IuiAl91SYTkNiZsvzDzWXMDfVplJXEvjoXqANXSvGfHxGBOs
	z0aXKavwHhMDf1yT56wTM6n3icNRW40aoGlxEBB7lNp2jzkcxRHoefABNi4S32jN
	c8JrQW6xB+ag+LIoeJc8uQxQo4YTXifnk+7RnL2/55ReBSS4MJSfxLlj1IIaMeIe
	BCt67MKqa+G3FwfJjFEAg7fyRXviiBoKKeBBmHeBRBtg0AbO9+Bc284f6tjvBFRP
	jFIX4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbab4qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:42:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d57d17d6cso6720211cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787067745; x=1787672545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C82d/+UAQNXbeW8G+O9iN6tLHSBIaUfkFkI8qR5+s5k=;
        b=JlLKvEAe1Zf/QsiMQ/XE9UVE9xTeFRfLYBBOUXp1eITJDqPds38yjUeu/QY0QexjZY
         5HVvzgjWyAzSp+AQhPCXz6pMjbniiGSoICK/rXusN8jtbrWt60qABca8mwsqP2bCugfq
         ELKbB2bWoguG6gOoupscQDo59nQ8NIPZgHEVanfhA+sqW/8ioGimHvbRfsQRzeGDrjRP
         nKavXuG6DIPMUKzAAURiEKvlEIO8lHEmhgQ/aT4zu14ha3yka2CaGYxW8QWPoZdQ6b1A
         fw9yNeX9FAQ8Lc9i+IxnTrlo/V1XKbOpoV7yxoyJOuxSxxBNemUESrljs7+eKQLXL1oG
         Oz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067745; x=1787672545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C82d/+UAQNXbeW8G+O9iN6tLHSBIaUfkFkI8qR5+s5k=;
        b=LEPAPJxVNNPEs6+6zyJW0IXxa2k09x7/bCOZ6B+W5Js9eb71hocLCFtD8y1ZSnjoAe
         65cPT3k1mKtKD+GrHYJYL6spL5l8Ui8gbdVJShzKv5xCvmj9wiei1CPBdJBQWlQs7m2K
         rwK3DdNFfDc0BqQqe5/8tzVHrJihvuraaRFzdnvoWUS1sR3gONq+WZ8E5j2wcAfFYypN
         6GWzyG3yAMTy1eQRGQCHPYNFQxXcImj+gndGoY2wPinwDykSbvgQM//UE4/UQmNvLEHx
         7gza9oYZ+3Bx3ns7o+D4wNX8LkJgDazQCILjL+rIzOtvbCFEJ/L1euqIAPZrYmpjs4Mq
         b0sg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Rao2FsvVpaDqGKVQyhtLncr8QVolqPJWAuwDA00axut7A2CprSdlsm5CISFhwaaKoQJpc0+tvkoSsxZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bVoES27Lb2RQTOdEgqeMfPNdGQU50WV/nMbaLvr9Okmo4rxr
	Pn4qoeOadNfvYDW6HNCFMgihonGoFPXYnrTuTYv2OuWSB9pJzEcqrqJ2isXxblVtHLegK/1xs4U
	t677DcG6V4qi/xeIkMh1LA6CFnaqanDfM/3STX7+jOLGC8p5LjN181td0g4P/pBnkZekn
X-Gm-Gg: AR+sD11v2XbxBjv+LqdZfU+/M67DObnfwBexJoQXLdgiESmEQTSl7nPnuJuc5MnNlCx
	PRIgg2Cjzvph7OAxr2V60UN5QTF4xzYR9HWtQcFS+03fEY5v4asm1SdPr/i5/nH1I+WNqaQ/c9C
	g235cPVuksj6a1RfxnvbZR6w+qwOXdFqKd/Ykm9QjU/uc/hEvowfGNozuC21Xj4JMJWsq+ZxgBG
	wgs9DlRWHhoVQk5Ji7daC0T0CAVj3Q3Rd3QkVpttQ68dw/F6/gUYqOH3b5g0vuVUXu8Wp2ZtIjw
	X+XBxC+0a5VvSW8OoQ+9hBIXvDFjKqUyOWvSkZthrQK4l6XDFIqITUfJfqSMyyh87/pthvB/8x4
	vYRoIeO+j3WHzQLbuvXaVUMzo
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr269352941cf.2.1787067744921;
        Tue, 18 Aug 2026 08:42:24 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr269352451cf.2.1787067744407;
        Tue, 18 Aug 2026 08:42:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3f7111907sm226210a12.16.2026.08.18.08.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 08:42:23 -0700 (PDT)
Message-ID: <26c49938-2287-4d3e-a6d5-afb9f21d057a@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 17:42:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: phy-qcom-qmp-combo: com_aux enable fails on a DP-only instance
 with no USB half (Snapdragon X2 Elite / glymur)
To: Jesse Casco <jesse.casco@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260808164148.123057-1-jesse.casco@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808164148.123057-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNSBTYWx0ZWRfXxG3DTgaKjsLx
 SrA3opdf60iUxe33oLBQwANScjVW5uWGpUw+ubs9KaASCZQJMbMKlUG1ZTl2LnInNVsmhSjmypy
 eYLjyK37+s4qXPkAFwxW41mHF1VLQ/o=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a847d62 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=koz2UQyQ733Cima-qgIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QJQrFzdPeZsXO4YFpgEDUOPPeJvlx6_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNSBTYWx0ZWRfXwIzugZtSyW5f
 XJo7+PxLL2biOjRyXFRPyP0fGICM7LjVRFvdxuCqohqKBd+6yivZMxfSAel0NdntpJAuxzg0y+x
 W1yBJtxXMI1BCNXYxIHR43xx7NHuvwzZBDjq9FNvLP2d+Qg3A/riwpTmApzsmT6Vl7GxxRwgJhd
 qi59A30e3trVxz1eXqHVQmb01Vb49kd6KzvM+f8Uxn64NbrTdYkcAMAJI23PAct0O0fB2kBcqhL
 dLqFOI6d1UQn3e6SaRY6ipyXCzn/gU8v2mKb7qt8WKa6mfRKmWPJUGBXHVX4pWqMW4GmogoPbrP
 aULzbN3d7jGIFkOWY5QU/f+0wFQcjE3DpBKlX14mg0TNhCSKsdgl7FIdfRs9ckgxYVF5hr2EBuk
 06scccbP8o5J+NjjrsXBeIaiizOmLr463WA9NJctycaNr5ndBjBrX9FFkb2EWpDuyv/gYO9mpa7
 noUDYHAcgMaY74oBQ8A==
X-Proofpoint-GUID: QJQrFzdPeZsXO4YFpgEDUOPPeJvlx6_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180115

On 8/8/26 6:41 PM, Jesse Casco wrote:
> Hi,
> 
> On the ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme, glymur /
> X2E94100) the internal HDMI output never produces a picture, and a second
> problem turns that into an unusable machine. I would like verification on
> the reading of both.
> 
> The failure
> 
> 	Failed to enable clk 'com_aux': -16
> 	phy phy-88e1000.phy.7: phy init failed --> -16
> 	  clk_branch_toggle <- clk_branch2_enable <- qmp_combo_com_init
> 	    <- qmp_combo_dp_init <- phy_init
> 
> Plugging a display in afterwards produces only "phy_power_on was called
> before phy_init", and the connector comes up with nothing behind it:

Seems like the display code blissfully ignores any errors that may come
from the PHY APIs.. Checking the return values and adding any unrolling
as necessary should make such failures non-fatal.

[...]

> Konrad, the merged commit lists the HDMI port as working, and it does not
> work here, so I am sure I am missing something on my side: kernel revision,
> a prerequisite, or a difference between units. One thing I can rule out --
> booting your merged DTS, the board brings up all three USB controllers
> including &usb_mp, so that is not it. Any pointer on what to check next
> would be welcome.

I carried a local hack to ignore this warning in my local tree. We're
trying to chase down the root cause of why the clock doesn't wanna
enable. I believe the DT is correct and it's a Linux problem.

Konrad
