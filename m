Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2E9423E88
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235725; cv=none; b=gR+SLVjjpYAIVur3fyEarVTAneCRqtstBSpX7U8+Y4nQDsWGen+wWs0LxsAM8F1qQCE4qY333jGtgU8uVd5InPG/Nb8Ziu9Ibsw4nTDe64f74Bp1MsVLAr/SGgoFY3hutDSQ3eYoyP3va9NUrf0sm8/eHgxjMT+4BxYoOZYvK7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235725; c=relaxed/simple;
	bh=+2VXiGMIOCH2pmyuRHa2hoo5DBgV4E80jSEKqltfTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8GCAJaE/F4gIn7R0BL1rUbYhJF4Tl3Jw5thsM60R1nIOsLe/vFJJ4sla/mBadyjf1lcjb4cOCJt5vlwQFTS3Mkb6ImbVSuq6FnzX1bvsIIphVHEkYEl5ZdXJZWojtQh7pa58S/pUuzLWA5EqN5ZwutGRyTclgL3ASlktuIVzQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rb3RRpvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGcYkXDA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rb3RRpvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGcYkXDA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgi7T2289004
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mYrJRtpE/M58oknn6w6g6s4C
	5iZ5GXjvqTFr0fKnh8g=; b=Rb3RRpvNDCVmZgKAWDSILLWRAEltX43yQo8Ftzdh
	F4DPobVjgY/XhDNK9SmMEpx2id0sctqiUSNakZV8T0ptJO5SrHGhg4LJn5mJLxM0
	GvhQVSo6EOoIiHzB0cV9zf7M098wGYb2w/l6b6ZAMWT2zsgyxyYmUi+NtZOQ9T9E
	tSADJ9gP0qALRepBxvRL5unRcZcv7aVSZvtwHdp1j/E8J3GWWqONVqgUBsmyuAZN
	92ftSV6Uvl7WwSoXx5nibWv0/H/32z38G+tQjCwwA7H400BAA21UZ8Qr8w0ToNxr
	WyheF9UfznuzcRxnrsFFhEzTzJ2xIcawzreNt11gf/dH5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bwnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so45073731cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235722; x=1785840522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=GGcYkXDAjR2TFp0HV8t82BmaikYoh8w3kKbixL2HpVoyuLx9jp20hEmhj0v6AnbOa9
         /PRLGKJNUIbfWLyiqClwo/DfUiyxvl0zb6jsuB9yH5UwfOv4rlda/WThSgVlUl7XUeDs
         FUxDrO+hFrIh1BR1xZs7ACPUdC+esulpXNQYjNpbsq3FLnZa/pb02TnYCfWshzblBIoD
         xPCtn5urtO14T+K6wXbDuQgW2SvKXGNsAAuRRrESA0c9Zzbwkjhht2/SbivISFKcH8+/
         d0i2BaCMlVT/b3VwJRM53Uw/ZzKhLXiSBIxNmdf/0uCVPpFkHtkkaOM4Lcnd9fUCTFn2
         Ubxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235722; x=1785840522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=HNUANnWVT7QHNvUCMYqdovAhAi59lxIBmRkiHuDPp4sfSdL03K5v4gxu5W+Vnt23fx
         ReiKi918XIuCyv9KoBVTP3Um/qyuyiCfspAc/1oaw+m/3vEj83ZJNd/82ErGfr3SZF3k
         of6X7LC/jExQzDD0oP84Fkhr9QqQy3sYO/6qe0rqNJXI3sU1Eqv96KEv/DExkrztJGAD
         xwHlWhypF7xWpDnX9NYvNwmqLZMWE8/IGS0gZ98fjcTQ34RpP8d8HfIRLc+i5Kf9G1yq
         X3d/i9JQti8MrTRtTkooqFa4WmCKUGm9e429T1i59A6XtJh3J+NUsMgdzzVOq40n/0Sn
         xAxg==
X-Forwarded-Encrypted: i=1; AHgh+RqNSjuJL9Vv86a0i5Pj5xtebIkJQ35D0QwH+6R9Bk0ZKJooZuCJW1E60aPCI7ZPFEjHMs8VSZfxliL7BxdI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hPZrEsjictXvePSDx21tBrEvXwtLbSQWobEksOop5qYmBL9U
	SpJXzSmsxn79NUdtgrRtITIjsWJQTv9+H34mnSQlevYh/ke01XNDpPDhDvmWhH1lrMokPp9ihpi
	hNFGDI/cuN+yVrSdmHrhiHvGFTgufHEmsiNq/MAVibhf3buFX3Hzj6sWw/y7oQgUVs9Ys
X-Gm-Gg: AR+sD13ILgRQiMzMOOLyDTJ0luQIXkoc9A+wgrN1QomUTab5VIKF52+Aiq1mnyAJbLk
	7xXWHed9xVtvoDeWteqlDwuf8enb0xpTtAoi0vLXezLep21zp0iqDdrSvkJPdc7j81obz84FrUA
	rC+3uwJ268VC8aN/hjsg23CZQSdG43qHfrwDpWrOmcW2cLbKwWw8keuVb3YM9NCEQ6V4bhaeYhN
	9jULSdVGJuFfMYHL2YEyoI6l9jABk465uuANVkIaZHxmDV0Af7Rd96TRQQh0fdwsMwrG18QX4fv
	YVG5Xqrj1/RWnFoi0EWTmZA6/s7VgSrFECt1wQ2EN1C4kTlFqhVh168p2ErQCr9IAecyusahXT8
	SDql3MF+69kvl6I2B2WIDCzYFaEEQZmfcLduw0x+xC4wW3pxxDW/zNahuWQl/mFEE+BvhBN9Ymz
	OJro2X6gXPU0vAqQ==
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419891cf.69.1785235721470;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419721cf.69.1785235721070;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f9721sm1917162e87.76.2026.07.28.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:48:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:48:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <jy2gc6ojh3sh2araz67vdk4jo6wsmx4xamgl6hjfuqpdphxxjr@aykdzj6ewhm6>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX9/MmSzWlAe6e
 xi4xRvm3qUyiWnBajV7Ign3iyYQfFT/xg9H22kak7OCCxoH4Ut/y2r7BaTStIBOYLQw7zOeuy5t
 zPC5oZykadonXzwEEZmCPJR806Hj28o=
X-Proofpoint-GUID: nXjjdSnQGqpfKv7fkSHxB56W0fsJ1XG8
X-Proofpoint-ORIG-GUID: nXjjdSnQGqpfKv7fkSHxB56W0fsJ1XG8
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a68890a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX4lWkJufEGpAZ
 84a9l9EkTpt2T4v0P2Nrdt/Skhdxhfz+UZ+85pl4gHcfqstJGYkmlwtjPFl+bOdNQs/O08wObmi
 X+QN0ei4X1uov4L5bXKUot4RDzE4acmgr/CYlaRXK7XX7JtZz5SEsu39EMabHSY1vRxMQdYdHWo
 GDwrmAafv2uRwuYTqt5fIAlFtiN6rtwMt48S6fNwzCuztVMx9v39lcD09zX01kD6GMfSoT48mAv
 68VZhwlbELk95Ph9Lwy10NyrdZkIDksn2VdpfOnuV4L1kWOMHwpkkK/OV+creXBtb6qSS82iyvW
 k6MWUA9KYHkZjfGkKPGvpDYFNe1gD3VyFLOufPR4OKM52ZpvpBwtUlcZc+BOJ1Ez8l3YT92qJbo
 c5j3bRrOzJIOtScDLYNTX/0KjXUg0qcQ80QZs2IpOWbqDI0OcLQmbfQC+4z4C+S3xLElLpOsnsu
 aOfjOy8f57ADHUfu79w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280094

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
> 

This is nice
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

.

-- 
With best wishes
Dmitry
