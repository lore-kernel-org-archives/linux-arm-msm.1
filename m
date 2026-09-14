Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A023EEAE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371690; cv=none; b=Aapt2dS27ls0T31CnY/Sz7zZ/hLWthkfyja/XrcLt03IFW/Q4300YcluT1PlyfD74bHmPPnOXOnt8PY+yTw1K6X/msibVzRyxmtJYogsXauDCEpGlAUYW17kpr8nbyEozQdvaIYVyghffslU7FD4MGsnvfRovyL08UwR+h2Q9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371690; c=relaxed/simple;
	bh=M0xL8A1MLG14YYpIHMTe9AZyHw3LRq7oQAFVYejE5Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYFCpzGfWs1o4oWwHqwJehQ1YXVgJDFURNsXWIPYMsjkd59VZOt0Mx9PV5Cb6jDBsE4XQZHhHA100D2a1DibGBxOrD04+yaJ4ElZQZssAiGfd9DyaVzn8NcqmXM9tIkSxqAj/kosyIHXgkFMA4bXCIDJJyzzPRdBUa8fPpDSzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9lLhaIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnWGFtcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9lLhaIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnWGFtcp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jekU3843056
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOzHFgngzR2fvDrsDDS/Q47T
	gX3el0oe162wnyjcEuE=; b=T9lLhaIADCRRJeOMV7cbh+wUYOJB5ABiTEUyL6+5
	N5yKi9f9Gxqxd2Q+dC3VypeiCFpVhyWDVlYcKlMFHkc4w17czdnaiQX6iP/kWRJC
	bIKnZzvYu5EV209Pf4FhWC17FOHOpMy3wNEDFLIlrjMIKeHuziyR4k0VonE26Em7
	q+cj6Lwo8Jdb0iE189bAKb9eXUpIiorKNp8Zd5abTNUgPPXLdX8+CajYl+0H1AAX
	oce/DYPxMb4xKnarG8gES5LiGYAqRANAi/fZxq3M0sTu55JjMqBnI4jpDW92RreO
	Fc0LK9JYEaMJjx9kd1C8c9iTgE+y3yhidj+cXwcv7kMQPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5k13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:41:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so792587585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371687; x=1789976487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=VnWGFtcpZc7pWEJk6lUyryrrcegSLo7QJZ7kGRcMUdfNiiSvdX8pBHaxidVNu8Kx9u
         zLRG20gR2ZSjj4Y/DkYsXAT78hsFtWCkSkFnJUNvsQ+dl+pZW3CzHLU3CnnnFG0RxtkN
         hT1Ndw5UwqRN6idYTtkhsvyB3G2X3wgLUEM0IEjPVdFzW2ytlQI9cpZsDDkg1hdnv/sm
         t7CoddoqRmoyPuUAOE72XHeaAH9hcO4S8wZpPxyEHa5e2wi+RIJGse98m8phrqozW+PT
         xdaBAo8Gh2tzFaNFD2KdFGktd079eodY3h6uP1RtV/D1MtezsQfXji/8+oERLkO7IhRe
         NZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371687; x=1789976487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOzHFgngzR2fvDrsDDS/Q47TgX3el0oe162wnyjcEuE=;
        b=CA0OXPtTqaPqd9uyBMGycUiW71qmWJ6rvUpKPwhhFuLw2LgP/lox9HCEOQwiLznrt5
         e3zh0ek28pynnYaaCktmYvXoauOpPiUDhxMfCvg2SxU4M3vJZuhcuhI1cH3BTghQX7nM
         KV4I+YnupD8hThw1uVkRpErdXbGML3v1zrMeRLIpGixSbF9hrp4SW7G+xo94aXMTdM3w
         9X0UrFahnubSPFPmnAp4m9l2llz5ZzmZtqIsnyHpqR2foTuoaTw/KxvcFmAdEE3u7EcU
         fniXsS2poPHkWFQh8aMQ5WriXDBQpogrsI+9ntN1AvTZiGY866fYqmFxfBrpLw8sn0ir
         bljQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsu7qSyk6r8ZJ3SOSdcROlqrcVTBvlbz7nzkC+7HOHzzX1ThTm6voyPMb/17L/zjVz3aygDcL1+j+XAu6G@vger.kernel.org
X-Gm-Message-State: AFuF++mVvLFUTHGqPZG/AVv9zAqV5WIe6Ij/VwJqUDa6e/YzyHMdxKdG
	dWx+IInl2YpnHpGx/OtJuAHM0WAN2dDYMRP4SixCxrh6jYwD/BcykUSDEOKStxknSiyU1Q1yFVP
	6+Wm6JcP6YrA+k4KBScwgYDjPg9Q7tQoI8ih7HrXdATVixBv7OGact+uDohXTC0sUuEnH
X-Gm-Gg: AYBFou3qRgnjs//1T8EX1jTS9Cu6oTnFDCTxelTcvTzRFFNJe1nblMjYl4qThkRXvR3
	C+4hYh1w0XWx2a9ku5IZ0CTj/VMLAAmtK/usZv1P/E0sxTU+HIr9a2trVBdC2uvwiuluxvf3Bom
	vNYdu4fMdLAYPAYW1ncfLFdzlSxp4BPpqIYJ+yVB+/OL80qXcfT2MTDQDfgUTL/UuTF0EzbUKI8
	YbC/Hn8T65bwGhWe6kWsTvsencPeaJ0MY3LQq2X4c4BhtofNWxBY34JCghMplQP49Zt528yL76z
	CXkla3IYCNWSghPtPdRNdweO2Wzuq7X1csktrv/LCYdHxK0Qm2I4GTmiwEEfqZaUhpkUCshqh7i
	ph3/Xhgj0Xl9fUw==
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202428785a.3.1789371687201;
        Mon, 14 Sep 2026 00:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6f01:b0:937:65d:d89e with SMTP id af79cd13be357-93a297e8fefmr202423585a.3.1789371686637;
        Mon, 14 Sep 2026 00:41:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm26403471f8f.37.2026.09.14.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:24 +0300
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
Subject: Re: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
Message-ID: <gpfab6uc7gp2nxp73d26zd5iuewtxwoahmjv5dny7xrw2erblj@dpwmpdepgcyp>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z2oQlp_ucfst1Slj-ZLP7qrsN3YiiuQi
X-Proofpoint-GUID: Z2oQlp_ucfst1Slj-ZLP7qrsN3YiiuQi
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a527 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VzlDMD57B-Cyvd2ajsMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXznRK4Ro++/vQ
 gMp9YXLGTs3X3ONfJBoXhDHVpjvCqPuBYc+QZKy8o00WzTKgnQrGVvUuQDWFPyBw7yodGfBAJfI
 gv9Sys4c6j8aI/CfLgHhENpFk4BYngPz7c7FVe7v9vQiPhPYigKGfAz/bM5RprgruhOMYn9LX8G
 n7GgLsgLHJY/Z6eFDVu6xvChmThYCSXqv9ZyW00TUqmUOVhPKPnRLc7Ww74c8FDhjopDrQkoCNu
 hOuQahV0YmJDrPQbim8SXvl9SJFtihm/i3hkenAuXRS+lp2hQxjK0STK1iRuj8mw4SHeJ5X9B1y
 nn/G1qZIOprxhZgQkUgSp3/dyelk74/0ps+EeP938Gotn/aEPqsUyr7I6N3SBXKj0TjaQdNrbnP
 Iu8Y1Po8PN8WAk1zr37PhfxaX14hte4gKM69AE7hRInkm0qOxrM1LQmYrmoBmXb7boIMBinq7L8
 gIt0ZBFg+TOoNTcW1Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX6maHkEcKCxsZ
 fL3OOVnZCOsaCkLTKu3ve69FmZSmskxcOLhVeDRMX7OaJnyRp4P9E2HpN0QBnolAUqCwHv+4v7F
 DvQCT/jJwENu0+E/bkiHy+7eaYkyAWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:53, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle states so low power
> modes are described consistently and their names are printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Use a big CPU idle state label for the shared CPU idle state, since all
> eight CPUs use it.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
