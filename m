Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56335335AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954309; cv=none; b=OEJNjWqk7BA6gIbzNpxBZZfWcnlHZI3sXNl4zH1rrpRDmjith3FAFOiPpN/DECFS64VeWN3chTlJhAEa7Du6lSi5Xm7pmKMuKeCTd74fif6YUU8iCljeb95IwseyEF4+qdpjq/JLoSl/58GS3TS9+YP2jJwef14Zv+RxQ4L0KEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954309; c=relaxed/simple;
	bh=A8fbtECilXcXT05bGS4gADzn1R0DQYSuDpwR36o1s6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEVzGOZ6UN9NfIZKuoUnYwBlYUVKdRkai71P3pERfts3s2Wne53BrJPrsSlCiYFznhdPdmkEv+hUCQDunhQ0pJmXuNd417h89fJQzEZE1x99VPU2W8DSRBn3uOF1n69ae0KqxerBzj8yw13G5ZqTByTWXS9dxcdF4h/NYg9bJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbEM89a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwfgYzYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbEM89a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwfgYzYt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFFt2959641
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BIAcKnu4PYwR1yQKunqDZK6
	VZ2d055y4cTbs1O813g=; b=UbEM89a+IyCMUH8fbe/ZDcIHuOWqydmjtSVvoiPm
	Nl96voSomED5T7SASKY78Nu7lWVixAZfc5oOlFGGD1QVPNGU05kouUJmmwAk0DzI
	ATho82FJYipFdvlWvMX2yLKHcxHUQtmrRHfZCBGvpQouyFO0fdQXS1drVJ/Vfz6n
	m2w9swZscbvwaOUSZN7xC6Vg2wzGqV8EU0rrova5mF3hFwE3ei29i59Hk+IKYwKH
	LXcoQWt6bVQtuWNMf7LBf62Ppbk/1OEqmVOXPVKhxct1LZjbwg39uJnblC+7/oTy
	Rs23nM1smCaSB/QgBsIxnxKjYSZ+EqnmMgeV42j7QCvMpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3wb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:45:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903982af1so1203457885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954306; x=1789559106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=IwfgYzYthhQIPCgvO1V8VAxKcVXoCmblGRVjMG4KVtnfHoXFreGc5a0yhl4wXNGqEW
         kqfr/ng6pm23Y8TGtl6dzqISwahFceF9+A9vs9zhCdEeuFsmLfD3tVsAvTG7oXVZZFjV
         a/N8l3WBgiobRlR3hkLb4A4QTRt52Y3Ej8njLDX0C95VAaL/1deP8ui4edvkTk7hGxaF
         G3JsT+Pr8qMUqbwa3I9xNA5QcHgUVZ43HqEJzdflWSzYLx5FoNDO5YbVLrM1H7IFcefE
         zzRWYSOWQ5U7hRaenrslm1nIzNTqLVELFVvvBLD39EeN5QPJgqrLyvEGocCujvV+OVjg
         f+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954306; x=1789559106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=ToyLS7DTHxY7p734ShAd3wax7NTNGL3SxjsNUFstXwf07oDag5L7e8D4ckaV50Pfwf
         y9KEpCqzol+fytJSLsjN/2wXp24Qx87JBJ9eFDce9mdjnzP51RHlOn1gTbXFM8I5RW46
         rxFZ/5jfXG2vrQZGQsiiu4srqgF1p323lwF34lqNxZRBVvxwYl2dxynJinJkRquGO9pi
         E+Xa+0RbSKL1VPpl2GAvKzvtcpKt7Khp+4ucqjvcSeZt6nqpR47wisMzjOwiOIwYIKkc
         cY2NSLP0YosFOk4P0l2jHFT2S6ZJNlEMwV1TbU8yVLWv34PcFfj7PCzXYsDpgMsvph4z
         +ByQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9osKyE+InLTnHoM4vE0gD6zBRowgUcxP8UoemGHLmh3vUD01kbXP7iC/YrRIIPpRvbidMcLCzZvq8ay3c@vger.kernel.org
X-Gm-Message-State: AFuF++kWlrJJVOcG3DzwfmbyVDxU2h1Jb/n1dJvbEuHGpJZS2A5HPRfg
	T+wKaGV4mJZyCSUdJIYUSKUraAKGBnheAPuw6XuBbfY3ZcEn0J0/ss2BpJvozovcohF9pj63S3X
	TPA1p/HV7YuqcJ5fd02JQW9zQUw6tNGsuEW0NJzVlTcJmKmBPcoFO5vfVcpFmls+kalik
X-Gm-Gg: AYBFou1L79akhgZiZa7VwlDzRXF0GP6F6cut2/8AwB3fCKFkRdDZOAXn4GRXFkIkGV+
	sWAcb0m17NWZt1J4aScHS02dLcG0XMo0PpPGWvS7h/z1K9rg+y2DUU66OPxUCymIS+5AvU51oOI
	D8nmJ18JzpyJCyXH7h645fo9OvpNOu1T/P9FZwvIEwYnT16YoGiUJdKcWO+Bvn3wi0Mhdr/adW4
	qywP5/KHrNFLArmNKMzfcUWkuD6ENgf/b0dHAz9lYCJR4ms49jqE4ksMW5MLqbR9z3z2RZtFWy2
	5HcB3ZSRtmFr1z04eMUOr2Vr+lU0uVbiOVJonldTRfbDkfKzAD0AoPcdDdr25ylxf+nMvLsH8fy
	MEXd0eKAnLJc=
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934358685a.52.1788954300090;
        Wed, 09 Sep 2026 04:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934353985a.52.1788954299549;
        Wed, 09 Sep 2026 04:44:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm40029685e9.0.2026.09.09.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Message-ID: <eu2j6ohmt7yrhkvfcwiwfdcsebezdi3rr6vokc3t44ynfucuew@633443hrwqwf>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
X-Proofpoint-ORIG-GUID: RGsWOGBsiOH6-XKQ6SNaz98XOnZS5jKb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX8mDT5g04Frc9
 G65VYLoo4IrVCeU9BhwiwLasm15CL8qO3wg081mFfVvAooKihcKNIsccd9+YLqMuKy2d4olWgOw
 rhEHffWkjh3FZmYt8iJ5ir2jo1QiMdk=
X-Proofpoint-GUID: RGsWOGBsiOH6-XKQ6SNaz98XOnZS5jKb
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa146c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=7ud9App8h0w1rxOIwrsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXyn97748GLWA3
 r1MPMOITpA1l+kNbfVR9ZtsshWjkGx5K/rMw/iDopzWji/IaApZnKbJ6BoDALdcyjBREroYNXvm
 d5M67gOz7oxdZcuwiifwVUeBRJFKfH1mXLv5TzOoiXD/rG3oebChtfYR6J/hJ2/3hmvSHAiF7bb
 phgH0OsGMLtKJEJd3Mdj6Gh5YR3bEzAnMcHIyi+qfpNfEdwpS7phr/4HEu/0Xdo0OtJSPcnqPHC
 RkDWR0lwpYbRQP9JlbcixirmTiRr8d1Z0oo4du977Z6ekzU8l52N+RqOd3Q4QBGMAKJoB9DYbxk
 5rbPawU9cuDaRcvra4m3RLz/haJ3VkQHwjGoKTMAzaBJrUo2v+SV0Fxj/8crqe6WbXz67j/qYZ2
 1K5QEIKsqu2gsY29c9t2GeqUiJwxTm/XS7Opnj5A4YDUuT83nhQw33rg8HYuznqSXcueKnkbLZK
 PnBfIs/8jrAsRoxyt5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:19, Brian Masney wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
