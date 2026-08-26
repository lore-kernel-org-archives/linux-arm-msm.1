Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA73F4841
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744692; cv=none; b=BKst52xeoRn1QasXqwcfkdQkGzS/F1toQjc4veFMe45kbW9jtTAzfBP7X+FJ65wTG+J4w/17SORGo3bejcm11cvXUuHfY3HRTgrcVhkJJlGCoHTN/NXS2a6BWFdo4EcXAjXZVWC5wx3qMPBkyUWBiadn7s99/EphaIRnilNa95w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744692; c=relaxed/simple;
	bh=gVF3sSWywvdVLKzNRTq6V2Tz4AUi82eOYbc8438U5Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqsq9szUdRNY8o910q0J8zGufXqu0ja9xyKE5Glg6jyd/3kCvvuO/6EkFcL14ffC31sG4lHRABC9ToUjTnqHrb8lGgzBi9SKHOB/sl2dx1izgboajk0s8+CYWYD0b6adw9wNWoaZZhVDtsoa5VfYTrfTcxksHYscZzjYrqC4kwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EryPjNxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrsmGjdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EryPjNxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BrsmGjdm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGfIJ017354
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XWfVXGHf+nMQqGrbPsSdSdb9
	e9beYZ3kcs5l8d2/fcU=; b=EryPjNxiSRPe6Dr2fgpbadjrDhpzNMDtd+1RcE4l
	duXgDjEkQPNyOhs6I17yJDGORbpOZvNeWPy3NTHW9L4Yhxq8eRR+b7g9+ubAUZbW
	Xo48Fh8ogoaj5UmedPwsYB5ayEayjnVTzyYlkl8QidhajY9SwU03CsE7Xc33eqG+
	HfFANAON+fstgKf2gSsACT9OjDUGqMtDKIR8w6Jv3q4WWwoFtYDNTURC8lb3M9t0
	zcwyz4LIG11im9f/eO8hJJVKy0eOZiEYY+gZU7ptHaH78Lam8BbsmbjDcCF0AJKX
	CqOhUyXvhCZ0FCOPJJ+Wla7pG0Ys1FEM/VFRiDJ/hm7qEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3p37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:44:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so17198071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787744690; x=1788349490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWfVXGHf+nMQqGrbPsSdSdb9e9beYZ3kcs5l8d2/fcU=;
        b=BrsmGjdmtpKgr1HCqbu8j3fG3Krlt9ltxchNJsKKFYbKG+2mywu4Sb1HnEX+8DYWJW
         M9416Tuh5D6EeUNW2A8FHp5XWuQYsVAKnJQB0k6n8uX/YpF5JYOYyaYUOftjv6HKEos8
         mT3h9eqP7icsop1rnmEzy5SeNj9WISmkycAg6e7Zybh2D4YuIpuqUpf8tR/3Kbqi8oea
         Sgr2pM/0gZ8NyBV5CwD55VVvTZsWK9rg+ZDyz+e/QGOp5lT4g5r2HBOY0CQx2j/XUTBU
         yWWG6U0TnlgOBIghSsWg5IpikEuujs0Hn/4CjOrz0F9+qyadzig2jIoUG5SUCINU/O83
         WkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744690; x=1788349490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWfVXGHf+nMQqGrbPsSdSdb9e9beYZ3kcs5l8d2/fcU=;
        b=Mi1LtsuLdTCaSoY4tO7Ley+BWIX4xTLmVB1EuEb9b7OMcoLJgAeqWIUDCr4BYnjgEp
         pI09tc4Kj+jtTZdXT2aQB796japUDinI79v480BEKinU1DYku5UWYgdn6FO3WOE1Bb1I
         YcQIl8QP1kMRcd7v6mrLeO0nkoTcFyEjIy0IsqY5DYCYz9gMOySnlDj4LEelsmCPGTne
         aPcynqPu3Tu/e4GafT1SlwgjnFIWIFx0+o3xn0hit5fpOzplm2pzUDXHskpCfNyg8sJl
         ldVcO77jlWevUtH+ejd9h3Wf5wczFx/q4L7HWs9c2naNmCCBTb5IO6roToHqw12rwWxJ
         F6tw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8exgc7seePC/Hiq+UcfAdH7dScEpIvCsod5tceReRl1o4bp+262LACfUfJ5hnGl5LFV6m9DfB/FnQG35o@vger.kernel.org
X-Gm-Message-State: AFuF++mUeVNMPx7iu05vl0r6nogD2ouit1mUUhsxxAU1rwzDOB8+MALN
	1/Pfo/6dMzTTC3cSrSw5GvTuHieca7O6B8S8VMh+tniMo+hxMUGvgCRG28BNI/E1N1xh/deSELz
	PO3MMcVuYzmfn4bqz7sVrAiYZjrr1A5s0Nt6qDs88xr4XeTO8AZRDHXLtj/VPaGgXxpcTtW471D
	2E
X-Gm-Gg: AR+sD13CT9tYQtQDudUgcBQfJBENowxIpvkO451uOga6RsZe6Qy24gKcLlLYlJ2Dn+P
	TVvAr3lsYbmdqdJyyOoH2CfxdHQg3+SeG40lVC1AyXDOJGOvWCPeceGquo+In1ZMfEhqDDZlXFV
	dAFd09AEVeo/4CzF5G8vl0i/hpxXdR4bW7zbTC+1fp/7tuPTaTideF5q02T2La89fxb29gl7vvU
	sJvx5q4SFA01Jb2gVOJ89qpyeuuiT63cgPPh/Z5q3OJwGCR2j063O3imWIPoQBXOUlZzuyOexrF
	NDOr5KlmfOLhz18C1ztLQXnk+LpfRA524Qjhf9is83dkrYY+my2zVwyvjn58gzzCLVa3wYwi+2C
	DHafzACy3uF9Yqw==
X-Received: by 2002:a05:622a:5c09:b0:517:c582:9161 with SMTP id d75a77b69052e-52e2ec50ef4mr149048561cf.7.1787744689596;
        Wed, 26 Aug 2026 04:44:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:517:c582:9161 with SMTP id d75a77b69052e-52e2ec50ef4mr149046471cf.7.1787744689040;
        Wed, 26 Aug 2026 04:44:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef4d2sm343602966b.59.2026.08.26.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:44:47 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:44:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Remove .use_rpm property from Qualcomm
 clock controller drivers
Message-ID: <lo34nwtha2kcvlipz6csphxhfgswiphion6yf4clulwf5dtk6j@mdsidldaqd5j>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: 2frfE5J1f9AF1kXyJ8YEPSQD5i_0z3IW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5OCBTYWx0ZWRfXxa8ZYZlBXMo+
 C1iMhk745xgn1+/lTbbxQfjnkvw+H93k6UTIxxGy2NwEg9r/qu5wNsotvY6uwR2jZE7ThwI0MA+
 aeTnxkoya7YXTCPeD1XDwmbd3/sMvG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5OCBTYWx0ZWRfX7bJ6zgDeBcrd
 Tysq6UxBmWYofhrCGP2RLLYQl6aoYJC59dP7lmV/4rlzp1hFdITQJpbiNmv82dQjJEnZWKyzisZ
 mGdDna1Dj1MPbaLqVl8tEYlx0LxYZKo0pip6Bb5Mdq8Yzcdwn4JDIasdrlXaPrV/8nep7560+ya
 wd3zG38VT6zw89OCD4yPmapZr6EUOiPKcw0/B1ZcNNt5LUXRGLQbZI2RLLYbC3zp7782/vDpg6F
 pJiSBS873k7350IabmMdaApY5dKPEZTYJ3YLn919BB4eIO3WduZvRX9gIclsy9FOoyqfKO0INNA
 0TeJYIe7w83uAOA1VRJnatcJOL0L78ka2rkpca0QjR1AUgazuyPSPMKo/VOsUC6nRhQ79ftQzp/
 ocdv8iZ8cnB+M0oIKwifnPrTJBVDRXsJNAsrkQrDjlz/PGDWtMiPsRlnv0tv5dsLd/sO6KKR3gO
 SL8Jp0aA8yQAXxFxPig==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ed1b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TePA4wMJW_782JG_vPEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2frfE5J1f9AF1kXyJ8YEPSQD5i_0z3IW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260098

On 26-08-26 14:20:19, Vladimir Zapolskiy wrote:
> A clock controller driver is expected to be embedded into runtime
> PM framework iff there are specified power domains to supply the clock
> controller. If there is no power domain, then it's a noop to add
> the driver into the runtime PM framework, and if there is a power domain,
> the dependency can be considered using this fact rather than relying on
> a probably stale data from a particular clock controller device driver.
> 
> Since the decision on connecting a clock controller driver to runtime PM
> framework is done independently on the supplied platform data, the outdated
> property can be removed from all Qualcomm clock controller drivers in a bulk.

Please use get_maintainer script. This bypasess both linux-clk mailing
list and CCF maintainers (which might provide some input to this as well).
