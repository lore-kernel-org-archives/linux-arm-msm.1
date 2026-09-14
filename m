Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA83C1D76
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371385; cv=none; b=EiBh3yl39dFrtRMmRAuah94vc1PO6e3zgwHaOW78fESK06/v4On0lM3tdzmoXXr3ver3rCEXY6OZDYNcmvRMF0TR/u08e6n4J5k/NIrsPV3sgSV6gLvDrcIu12YvObIJuQwKP1c5CXunTkq2MLyWscOVeDA/267yBvx3ZI85cAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371385; c=relaxed/simple;
	bh=B7MHtkv6/yD6oTv/xPRXmsrHOkvhWkionP1EqQHyp/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4sl7NDVOOeNtyMTzr/Qhk9HrWb67JIijOwjk0/S2EobsrltDOkKJb7FjiuGqW6x4t9zAo2lLixjyCRmDPofWV4C9zXE9b2SfekBx/ZjoR4bSnVma8VlaQ3Y8zTxdxXH8qE4HB7gqOFGSzUmxtMKQk0w0M3nMtfKG0r8VsMJ1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2xu3dz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL9zeUvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2xu3dz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL9zeUvK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jEx13842307
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tFKWBAFx8JXV/7PZgw552re+
	8TzKSIPCxGywk3k8Ucs=; b=g2xu3dz7cebbLfMA6pxBnlkEhqSkknPIoV4MWKuV
	qvx9n8w6uG2HZuWn18X1ZH99EWGSXtYdW1aHLIDRkrqSox7r0kIEQY07Lwv/HnE2
	ziC6W8TAIJEBcgdLiUPtsXGU4MTES0DkdoJxg8UZwXibvsGyxGMmIlOzvOEMeiN6
	PPKyksspKEnDnVNr3CUmB++t6vNlVvHkXMYT3u8S8HBHVNacpmezS+ULfNMz2vHz
	8+egV6i0Hx7kJsPclgd7Q+N4/Op69xh+Us/dh8jswyzhE2WPHxD2mrsdJJDbBf4J
	pF84FTCAXRHKHt+MSd/o17S92Ah5u3frXTA9TnEsZw/HSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:36:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so462809785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371382; x=1789976182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=iL9zeUvKJgPQGu3KBVce57H76XgHj11IaI8zpIR7kOMSAG5O4EvKKqluSgQbBKFGc/
         00sMGxSaZW9w3f+AwRGm6r5bc+UJXw0foSSRFPtAtiNnb5Lr938lukPX/J0R05B695ew
         nkK5K+PDMAuvo1IKwi0hPov2dG7sQLVQPZNVkB5NtsvUgwcxgdLuemKcUqODVNcEkl/x
         878xaU4lqWusOMGsdRO68OQ7KXbkpxuO8PEGvMxlHSQ7Oe6cmsOA/3p9U4oPs7N5YZPp
         8GuQ41GNiqHqRwDOJPfCetsBGYOUPQI4GGDYRy8WYFPheR4u4wkbDIXef1mpPDQdz8nU
         6vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371382; x=1789976182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFKWBAFx8JXV/7PZgw552re+8TzKSIPCxGywk3k8Ucs=;
        b=bWBh529Rx43dxS/j9UBldbkXvd3QiD65QrEB1ObXtLrz4eNTMWYrgihTyC94b1tcXP
         fBXp5UGh7XDxcaLNAhWAF0+LCWqHT78V9DfXdkDEHhrBFeHmj7gKW1VXZGio4XMNGANO
         pZ1jFnyMFp/X7EBa4woBySQHEl7elxIxb7GlQfgqLk6675GaYeMofKiypkcCFYutwcdJ
         jCC2lD/NxYEjTZjqa5iayfTEiygvHfvfLQIkiMKgqzizKbtEy/eAT1uS5nW8ECRL0d7C
         rYfadE8GewwyrG5TZfitLL2hzXso65gioU78IyguJ0QA5lek7ZaI4GfgiDhLp660YoY5
         4LNg==
X-Forwarded-Encrypted: i=1; AKwUvBxseVKRX5qQC8UXjSOAojGeIuqAh/hVOr4vHlQkM+GeJkgsvGdqLfjeJlCmlb2JDyeXMOSk10I+k0Ev6H2K@vger.kernel.org
X-Gm-Message-State: AFuF++nf6+CGcpjFITz4QJ5h2ckU2IEyO6am9rdutz5meEzhyIxThNy2
	ysh+rfx9Mee2mze3HjdRBf2iPhh6Tz/ldQTJYVBH120IBJ4heqlIE1wDRXTHczkGrACVJOzpUoB
	FWQOLROkmXkaOs9xYM8nE6mJEw6Cp+NXLykhaNT/3vWEhGJ5O4chYj0eMwYCCUq9RPza1
X-Gm-Gg: AYBFou3CXTdcbTCOWWp1W/Q4/T+YHsPenFp+eOmoYbFDvoDo+0pm9lYEA966OfZ+bQT
	J4XqbTbbjvWmiFhib9JlAOOwV+j3zzsOPAjczEgPVcQBaFORyrva4hzBH4dq9umhxSB6R61hADq
	kTOmfxYfTIMsBYL8ScEA9qe5oShWciosCLPZgklvP8NOgIwlhoMHBlP+DvFnVYMU/fu5+xBsIaN
	EAxYqjjpTVC8E3C2DCpt38URO6kk1GN3y0SGPgXVzIIUkqk+mKTM/V/CcH3lxRErQgCE5pBbbx7
	u8PdfRYg+YJfwI7tPfRhG7gZYAQk9m0REuAxENZvt3+MMRS+vQwXYmevt4DviY6+2GyxataQXLf
	2ouoCq3nGkMjtVA==
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206228385a.23.1789371382257;
        Mon, 14 Sep 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:939:a45b:76ee with SMTP id af79cd13be357-93a2985d12bmr206225085a.23.1789371381764;
        Mon, 14 Sep 2026 00:36:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168052815e9.4.2026.09.14.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 05/31] arm64: dts: qcom: glymur: Add domain idle state
 names
Message-ID: <fxziap2amutjmlvqpsne3k3iwwszh64z335nymbpmh2o5vbw6o@oa32rit7odgw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-5-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5O2QkQO7SHXGwnjKCuEBwq5DpvjgOEUe
X-Proofpoint-GUID: 5O2QkQO7SHXGwnjKCuEBwq5DpvjgOEUe
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a3f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX4p7S76TDj9i5
 rvvyO/nHNK7Jf/XuG5XBvxyu94il+kHvYqoTlJfjaxj8V3J1ZSsXh+AI57LwBSsnximkrpWHkE5
 ZNxS2kvtSYNXn7OWa8Tvi2b6122GO4iC63nGWxgwIS2w/c8Y7Uc1BLo2pOmJaJYvs6i6UxRyleh
 akflGk8EJ/rhbqPt8u9yQRyzWqwu/CjDJTeVULazZwjVWC1zGOblCmSkxTUO4Pyt/QjCfz27dVl
 5Nas7DUDsqJiCV5rIz6iqhQyOXyKm72pN22KLycOQSJz+mj1HMauAZlUwh/RzYgRiQ3vMz7rArn
 kBeOACy9A8pkDg6OZ1RGh83wZMr77A+GMCixaIN0dMcwaQKSB2UeT+L8lkWQSrpD6bxFUrgz7B+
 26IKz4xs0v+Vgegg+LaKrBi6L8/sJEQqVzM3wzmXFcIx/raJ4zgkS6aVbJQz9Whxe1kMD7+8qFt
 HpFlnmJdKrExKnRjYOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXwVPe9Rj3a0cl
 FEwDegEKy4xy/cJ6CBr7M/DJwNbsGlDEv3mvDpKLxR62OReXrwbcHaHVWMciN5Rg5VFEeTzdeQk
 UI5oscrhm8WxCXnHn1oSDVgwrFFTonc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:37, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
