Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306733CF1FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164208; cv=none; b=PylyNSxE3TcKQixp6OoJto8+pczSKnc4xQtSoXXufFYUy4O2oNwR1/MxIR9xn4j7ZsjuA+2Jsa1hmMyMOlA+3N9ICCvWr1EPPxNSyOhZsQFKD1WSY3jCMDjvzrqnd05UEnepcJzYqsca0gUVoXKe61GSbZHW5hzIWvgia8QR69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164208; c=relaxed/simple;
	bh=vZi5S7ZP1eW0VNgKaU6jpf5sIBl2piSGBMCPnTu33yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntZqPbmPCXbrhUBYhO86lPIEOtNZ8uLCp6JaNrhbiyDDZ4wVSu5VgyrfaAdCvDUaIcGne2m1eXm3tU7PE7rAcRaL7MFtRmb0LuPcOdx6Qd8nR4LTA+LVZmrDseFCgb5uDmTFL7Yj3Mku2SOh4Qaldu4t+wG3X20goITxBQ5KEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku+l96Bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf5+V9j5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku+l96Bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf5+V9j5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xKmA2460299
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o5Mqt86zslYM87bOrJaqJw3p
	pv1OLdoxFWaouUU8Krk=; b=ku+l96Bvyz7ShvMNqbdo/8u7+hQvqMrUsbjutG4h
	zE1vGrurjEYmTe4UdRQKmPbxuNDR+nqmZ6q1MjrQKlIKuaVrR5+QGUzBDuunI5XM
	XHge6dGHZXCV0Snn8DED008GOlOZ8AaHhROI99vsBwd2Il3VuGKdIY+Ryd8d1Mci
	6IA1yKrA68pulGLq7V5chdt/YWqJEIjbpWhQMZGSF6+s+zucj4/v9kWm7G0TMzjp
	kYwEJ2v7Kl5VUztY7fSUbryFf2HGerkZDheqFA8OO3LL4oSG4HONBOcFKcVd1IdH
	9MZhP4Du0ArBS5OxrDWJEaXXWrrvcM+/zJGYpFtlqLGDXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r6sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so486781685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164204; x=1788769004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=gf5+V9j58slsnsMU2qpKyqG8UMJ7kiKHaSw5ROT+N0mUdMMmyCvoAi0bdd4XrEMMtZ
         ddP+OPLsPgWlf5u1xScXk6ysMvOyZAVKfYGv0kNS/LB4XhQ/nQFyJJ1SGWPXeQquJoma
         iLIAu1cXIORYzUVPKH4/R9BXg8p6f82L23wTlbMbrMP6lHI1gRtcEPy6Hnvy8eO7kVSE
         G6IGBqjbvssOlFHgQ14+IEVyZy87FEGmD+mlgO/gWgQifQg1xpm5N13GK89mFzAyTYs+
         EzfsEM7E5gmMXyB1zys5ENNSSZy/1GfSYsbdnSq5dTM6Xxcl3D3rL/GncYOJaeyIqNhD
         47lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164204; x=1788769004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=dflGFZtlewPHkQ34PmKAR41+X2QojB2JpAAVIdt3Ufv2Kvqu06BzBgcR37iETqSUl6
         o8OWL5OdWVGYaT5DnOZA4KL6gmUbLVLeXsqjQNPi9bgIaz19O7ZI3vorpP2KCUE8Fz3N
         GwzvKaE9iepESn4FA9ANsXlfTiEBmZ0KooXUbLt4UhgzTSAJjUkM0rJkcRBX49ygP7JR
         lYVPFKV7x1AS6M9w2rwACbguCHxbSohVfm9mukdpnU6ZN3vVfJIEvb4Q3p4ISk3/L8ly
         O2h32tyKiwgD6zyRrk2+qLGB8ZyXugi9QAJDYscV9wygMnjMzLSIbfnqBeG2Ur/K4LBt
         SO1w==
X-Forwarded-Encrypted: i=1; AHgh+RpGKuMFuv4d3bMYo3qJZ9n+36E4vmTxFDeNTS7/CoScgmUZ+jC6UsokcmXbdgef4Rp3131uT160Kh774dI0@vger.kernel.org
X-Gm-Message-State: AFuF++km5WW8oTUTR932P4tiLhbJ+9MaaFDQKwHgkGiQrwhXUkYFTWv+
	KEHSX7As6dU3VfvMycfbm5U755vwjbJV/upIHe5JsP/WT30utQwhWSc+IFkibvWqWEpWp8AZGbf
	fWk2oXNZPCWYDLNTvA/d+MifgGqyuMzUe2/rgkHmurTCcgFHLaS3jQAOyTRXqGUvWc4mO
X-Gm-Gg: AR+sD13EnBk6O/z51sIBmNMW8jADbfAlUzMc+pqqv3+KD5aUUj+Y95puJFaGMPv/HaF
	LYf+cFy7qzmpBMOCWatopk3DT5ugK/XpOOTRuxXgcdDSXWPdxRrq/9csNsxPVk0t1VA3jhmTdSl
	RMgcto5eYdrjOi3qxJhxR29LgT+45lrFCP5nkkSpVLdxGNTkkXzMJ/f0Zw1UGO2fhJ156PRWixb
	B55rtK5calvEYhB1r0cu9aXR2dQo7qwv9I7u4fSg4ns0EJTSjPlLBnFucpRML9QOGLaQAAPcZJm
	JncujTLWuQZna3DwMyYjizMANW32041jFiDhGIiI4pOyFmZNljI8BRnnt1y/+Wmr06MsWN/2w2p
	coK/gIRcRmy6m
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293028485a.23.1788164204251;
        Mon, 31 Aug 2026 01:16:44 -0700 (PDT)
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293024685a.23.1788164203684;
        Mon, 31 Aug 2026 01:16:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2fa779esm114204405e9.2.2026.08.31.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:16:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Message-ID: <h2m6oky5kqmm7ci3rrtbkjme5w3brtgljivgkgwoqf55upbgbn@pcjlbqf7c67g>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX+58qgDgKRQOV
 A/bQd72hj6QOxF2M7ZepvjYyS191XzBuz3ds9StSdR8JhLSUlww3lx4oEY2BvjhCw8jRCqbda2U
 jVqyB/XKCEBWr7lhsl0zPd1oSK0bf+Q=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95386d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r_5Z68Ezhs6jPTxZHdMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QY251uouhrtdYTM_tvtECA7rcgun4Nhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXyzw7IP8TqSRI
 kaAuMKC+lFFLuWwhMP/DOT69JNp2BIJEkCLFWNpZ5KOnNG6x4zW6kc3GnZGS7NegtR0DHwmX2vx
 uHcRoYUFzEq7VZjsaePi5ANwdBhZMKo7elZHMfpOwyiEPk47c5Pv6yCJS7KVrlIipZbG+ZVzaCE
 OoS0Lgo8lkWnEOypeLhHemXA4+yqvy/N/QgtyjeS9+Rm1s6YNKbz45pVWnEhWO6YHp0pRqSNyRb
 rkDKY54hBSw6yH6RFq5+z6A6ZhIdJARcGpJNYxGbHAVi0oqZkC5rKUTeamf+BAq9ELfJ/9/r213
 +9Y26mnZERSGuglrKZYXhIG1vTTVFzG0WkcLeJldEU+UOOsyyepv0c6p2quIqiPN7w7lj7sZrl4
 HKK+yU0OOk2eCPaOnM1S0lTewwDXR3neUSThlleB2seq9WrTzC6dYi9MseWLXA9zFV7xAYDTIKE
 t7V0Zlv7Q7HtXqvocGA==
X-Proofpoint-GUID: QY251uouhrtdYTM_tvtECA7rcgun4Nhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

On 26-08-31 11:21:00, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
