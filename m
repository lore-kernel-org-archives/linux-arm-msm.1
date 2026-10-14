Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77D47DD50
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966703; cv=none; b=eHzf2qULBSP79Ajqo8T6fguX24ZjSZyWeIqUsiDzNUUQDn34oVHJv5NJNeXrkifMATi2Jsy/0pW0T1e0wOWpzvGzSWBdHyRkCT3DjMwVb2Koero3RmWgwbPnXR95vnjIJvrtEztfONjveprhyseDZLOUz0hOtmKX+q3JasNXP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966703; c=relaxed/simple;
	bh=v4qNB4gBxrVDyEyoMhbAek1SACXeb4y8XYsThT2ksjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdmm+9rSXJA6md9Bfdn8XpBczNw9SYugcXLyYnFMdbIXDTQHHuPrQLlC2M0n1Oaj5CO2NawHYLk3NjechNcz9ZvXhBFxUpALdl9M58QpvMC8T1o6WgJiPegiA5mweXAXHIeIDNiC4dwynPAm/Lq1tVjsXrHOrHOJYCRuIRpypLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFazlCiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdl2XFNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFazlCiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdl2XFNv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2fM5Q3000890
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT7P391hZ9mUKzWVuhWqjH/q
	Y+4mRg2DolVij0B5VH0=; b=GFazlCiPkIEo/hOYm50ghZbFhjttvY3jFwAKp0pX
	HHIiOCshSZY/gOr2jJDZ0Vc4b3h7BK7Eq4AdzExOduBSPlDSecZfRmqiU19QDD69
	hwgSC448fUQkk+848ggwXK39yKdlBaFIP+sy2icgHfajCZuXm1NhsrH2ffjJCA5p
	j7anZOAR5n/LPO0sberWpeynTGuF8+VwNSvVGdMPH/PrRvqeB63mwYP1H+Wmsg9z
	MJehOnhsmq/yM+JctHu6MGHXcP0t5/dIjNyKFAVJH/M851EX40o3WrKOvrffqfpC
	EDuZl5FK+CxZHOz5SMHnlNacSESn7P0rOP73iyYAVQs38Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu0ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so877977185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966701; x=1792571501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dT7P391hZ9mUKzWVuhWqjH/qY+4mRg2DolVij0B5VH0=;
        b=hdl2XFNvtE/J0+LzaAqgnW2PgiJnPkPm7WYTOoH0vS85b/CinlSEvJ/0NL2l4kSYFD
         ZkAUz9WYgktKHVbAS5hD2c7X9VYqtIERVRdHxExTdt3xJjF8oVjKUOrCLnsyxUGoQ8ev
         ueuuLdGuG39Zq50ThfEcttALAKMBtWZS7Lb5zdPOW0jXPkcZGe4tvliTOQKxFrfw8Rnw
         BcJwpESGm8yAmWZr7Ldg9E4ZQHq6oFK9xD6SzYG/oR1tu5hdNOLC/d7m6TAkBTFXOWPG
         HKAQuNrGHvGg8EM0Xtyspd808mtvO7E+u3lI/uEw6ho9ZR9SNT5pEdNei4Iaek0F1zNN
         qLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966701; x=1792571501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT7P391hZ9mUKzWVuhWqjH/qY+4mRg2DolVij0B5VH0=;
        b=dNT526OnbFhFfczgbHxAKhSiTkbG9YKiCiIFbZ7erK0MNb/jcpv2Cbf1FhUXr/nJgC
         RUfP3hlMQWpD+O9/W7ZPsMnHTqG7/0gEfJgYbZb7oTUmm9qTYKh4D4usK3BrFAptoGVL
         3Gfsd+XxZ0GLnwIkV1q7ryHeEKOK5l49necr6ysHF/vdD0g4rShuP9ODMlXfzhjJY+Dg
         xZeZAm+4jDH/SYWxWnO1rs6ov1VXLdNJn3wPWfd0dTBBs5ZxlWaOKt+gAb+7sggIMdFa
         MlC3VLAfsJmqUZN+vCKbV2rKdMOLMl1jZKOwQlCnJ9+iCv9QbSdSEHRvTwSdSEWXuLyt
         I8TQ==
X-Gm-Message-State: AFq9FYJV2BQAUuGpo8NUC7iZHUIkwI90jRrqJQmUYC74TxB+R4j6Q2HP
	4eaqyHETldDJvlk/wXkBXWKRufwtDzVyl3NOySWRyfx3dJKwO4ng14rjT5ZRUK05KN39/LMCrMa
	jJVJBdUKJIy8XpXX53M3kyoGrE4ZP6rVVGY9uDZqX1jOIumIhu1fOuCuMFdEL75Iztkb8
X-Gm-Gg: AYBFou0i5sP4ckKETtRGsNuoNIXxorTgkNnchD2FStwkxNui4L5k3nLawvbIw8Xo9n/
	QGu1vFLMvWgo/PNmHVEmHhENTDQvEsWeVkN8JwJ3d0d7IHCuaVoOrwNu+1qDHtfNz5v1BzEfOgc
	dMGveFJWr3spMaRK7LFhmi4uZ/jpPrDjSxU2QPhOzNYh02FDV++vO9raZhAVAA+yLLWoPfod92g
	WeF8LA6VXSPiWJiwvkv/U/cSwDGQbSmR192LUoBSMP0WZztCzeZoGm50LNoRja29+QHEQD/yosA
	MW7ZbikYWUqeajsy0AzsrGCF4JDue8vd3CfDoiWtiu5MyI8CGyEJVzBxX7VxgBanOBU40jkmv53
	jgqciLO+xMI0Y0f/L
X-Received: by 2002:a05:620a:1711:b0:93f:6f8:9d74 with SMTP id af79cd13be357-93f06f8a025mr81596885a.77.1791966700775;
        Wed, 14 Oct 2026 01:31:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:93f:6f8:9d74 with SMTP id af79cd13be357-93f06f8a025mr81594085a.77.1791966700159;
        Wed, 14 Oct 2026 01:31:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm1682892f8f.18.2026.10.14.01.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:31:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:31:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add
 some sanity
Message-ID: <s2vow4fvhwczwj7hldtqntg6vmoqvxuub4dc6elvypi4cahv3c@kgu6lgndcu77>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
X-Proofpoint-ORIG-GUID: 753kwZhYeuOgZnNSi3RfXu8ilh0B64oX
X-Proofpoint-GUID: 753kwZhYeuOgZnNSi3RfXu8ilh0B64oX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX2uAwJhuIGmsx
 Q+gsSF99Fb654++BGNT/1qFnwF7BXnr9rH2NUKSDTyQYrbsMt9PwTc6vbMppefV5yqu4G3VOxg3
 4bCkH0jVi7DYipyfIznPmvq0oHx5ogS7+3b65Zv/lVCY+grmhClRx/ryV/zyrl8PrvWy0bW48oS
 HndaQMM+M25ApoHAdpGG4zOhjWuMfh2aCAzu7TFqKHdRwc3IsceG/Auo604DokVBjeUqLO5OTVc
 o+qWbr3uKcp0fVF6wMogoq+DyoqJoQnLK1HMTRgUV1ECV9NhTg2FGJnKCl7SbywtbToiMz54qPc
 cOqNluye2PM3bz41zUxV/rkE9/Acm2mo5H+yBCvVZRcfOVWptWQbkBo4jzyGNu4twt3DGgbs5Ql
 YtXbnjLOolvunRZqYKHW0Ek0RkjBEAMpqNFcm7lglLge20Z8KFcJeRLAVkE6cCZ+wQWy2f6PN8o
 isiR+JnejXU7xacLBqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX079zQo9NYuND
 4JD+7QF8QTVK4CKjm76ctQPfrAOgT9OU/7vyXT1bo4AhRzvnzQS+tAw/3lop+U71thraIf1teHM
 GI0qY0hdsGJ+ne8Di5GG2ygcSnA632E=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf3dee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=LSfqNlErfjkisOAvbMwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-02 12:30:46, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.
> 
> Link: https://lore.kernel.org/r/179089728102.434549.12368098081790653201@kernel.org [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
