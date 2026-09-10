Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AF3C09F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028271; cv=none; b=P62sdMe3qQyvJWFzMF7lbnD6EOfIxbkLacNeoP1AbcY2wZFIvrzTDwdO3NSqsFDgCfl50mTAKrRPwDmsAZ7t29iYXz5W2kfhZ1tb5A9Qkdk59k3Oh1vO4i3V4wAPTHrHnLrUJWh6fgMzDcd7TnC5u5oKRsqK5ySbWxSvslbUXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028271; c=relaxed/simple;
	bh=PAqcHXy8LZXAS6z3iAsn07s1vKnAVd/2G6kkS2rSYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHkrCp4QJER64zQIueArAIX4e7uyyF6o0Q9uafLp2EXgPOro+6Ajr2eKi7J62fLxyPAQtfasqpeyDQf9cx8lDXqAIGxPPizsJsX47FZUhvayb1rpJ9lyWsbL9xI7jgsPxeqFO3SQl/K9x81LVK2CYaOO1kgv/8ME2o5pmHhmHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8gWiCW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0UwHL/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8gWiCW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0UwHL/D"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7amQG173997
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5AEaRW4+Q+4g0E3CSuLIXhC
	YjcEmOyKhDjUtjMfI/o=; b=m8gWiCW/244l48na8aW2DVd+CEhL+jS12sUq5UU9
	00s48fgPxh+/ghXT/IqYQjaAwvE7myfYikUraIQVkBoTqxC1WoLwd25DSjDrp1bY
	NpU6F5ZqwFhXiI4KhwVVyRuLSokyos+Eezh9ButWZ2HyPRtaMr7j6i6Siudi0+Vh
	+tzfWH2THZ81xKfaoazS3lI5CiE9MxOW0ZQkxR/3SzYNX0OWjazx94WwQzDKlvxe
	K5ZnAF9WcIIc6ovwt2nRX9a5ymQSC0LKaZfgm2S5CNvQ2H4wXKrmsr7SV08fQCdG
	hXlkp4qs76clZcaJueJn/1GMpTqbWOYYi2j0Q1l0ME6TRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak84ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:17:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1350780185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028265; x=1789633065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=L0UwHL/D49jwbq5b3pNdQR6BGrr8+/5mbnAkafklr61jyAhdwtuuzfux8SsBc8YHwM
         aJlAO+kaN5NysW0ZAHdT55u5icEHPxh/XvfnOI4K2xNEKy8u5GrYnKWw3hk9RU8pOpni
         DeDXYTWVFuTPFUUv4bLbbIZoh+b41CDXSCN3XC7gQrDGc5tSK0A+4UqtbdtYWHwsLqxM
         YomlZ8F2Uglt02qtQnSHb3yf4WNEuV8VD7kQnmK67DX4UqkIio2rQC35cn0xTB6N16s+
         lMaQFeDIZsYWV3oEFL+WBC3HmJQAGjQVmxkS0BOsDfD8Bp5vmJEQ2ilT/Z6YPzQ53f0Q
         /PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028265; x=1789633065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5AEaRW4+Q+4g0E3CSuLIXhCYjcEmOyKhDjUtjMfI/o=;
        b=md0VQFCjzXNnf1vtgmq4VNsg8Zk2N20GAYY+/ozHzKUc+TPT/jZtmgYKnXZX+W7lKu
         N6Fjr0mFoHniGOgz3u/AkenA4ypViqB1841Um3RMd1eOByFgY5FAw184ePIhRK4Nkt1V
         V7iG0ST7AqTU78NySXfuIuz/Q/10fA6bOfhxxU6qm011FTiDt2xMpWp6b6R4HFoU/u8o
         ZXxAX+g95WI71Pl07/mWnXe5tlfeR3xo0lUowT0KgoY67GEw5ma0FdH5xeejBiRADzqW
         tpIgsCenTYFsXU49qLclRMcy3pQP6pyLKLbmJ6KVxiLAW2mPFAHiIIsz322B+NJSLiyM
         apLA==
X-Forwarded-Encrypted: i=1; AKwUvBya8mP15A/1jGDD2HgOmmesL0nFnkVJuyfgOZgmkYcHj275Vy9l06r080IaAqs8K0d/V4wTWgqDHkEw+T3c@vger.kernel.org
X-Gm-Message-State: AFuF++lZKeiZd4gDG3ulVYogGMUQJtwxh2FYRsvpapluAF7sdaYxkLmb
	AC4KdqzeiyCA6PfqssWaurS16tZO4UsOGh6gd+m/uKkkfNMmF8Q7IGCmLJqrw79jhVQofAq9+k0
	qGGt5B3C1hgPwcfKumGB7mbhUlGv4Ue4+cNPi0U6qj9MUpfetMbxmzABbPJV0JbICvJSs
X-Gm-Gg: AYBFou3XjWEL+p8UhTwdSG0Qzy9bZLpjwnyYo8nwCcq5QV9c2r+OvNe+Jv1l1HR0XQj
	FR5FrHFsyV+guRROlR9y/MVUEyACLvJm6dpD/XZHEBbcEs3kBcB7ph0NsAbeIeHwfHQRjsE4vgW
	eN2P0G3WbSXcpmdLpc+37aZQZg+xi191ZWpgFoyCJso5kuSVOG35mZGjytlbIUqm7GHmCrM8vWV
	93y9jYyUoMyZw8/KRz2WL7H+3nuK9Pzdi+X2SFgRPGElM1WuElICarAi/UMsYnze8ihBG56KAe3
	EP/OT0rS6HjFS1gWgFjXdbGGYFtCzSK8R2elFeWgVSsVq98WMvTBwRW2BAizrcCaOEyWU3+DCbZ
	yv6E/+s2Hf/Ja
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371901185a.2.1789028265256;
        Thu, 10 Sep 2026 01:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:939:57ca:7e08 with SMTP id af79cd13be357-939c939d179mr1371896185a.2.1789028264730;
        Thu, 10 Sep 2026 01:17:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm52018039f8f.4.2026.09.10.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:17:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the
 mic sample rate
Message-ID: <iavjnu7emwyxrw2ozzuwa4uvk74to3fwi4janpijkrpg4x6g3t@ftzeyvnok4d2>
References: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfXxADlMpbe5BWo
 uJsV8Gk1OR7tAbhw2J7ymyERRgvL3Ubc1q5PZD6ouVmY+YYbLiCT2YGKnn3RGfxgfotV3oCqUtm
 MPjkDBYIO5B+e+2ssHpKqFx0jYYHIsk=
X-Proofpoint-GUID: V52OnmFNTQk5vCOI-Dzz3w-4LQJt0y9c
X-Proofpoint-ORIG-GUID: V52OnmFNTQk5vCOI-Dzz3w-4LQJt0y9c
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa267aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uZU3vtNHNVMDsrlGVi8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MiBTYWx0ZWRfX2Fvb6EbFXtSa
 4M0b/f77AYVVCqRYnvCStRTFISYU7YMCwlS2q9ik5Q8uFZ+UaVOdg1ZIMhcZiCBh/OWa5/1ESPy
 BkU1oQcH0QFP2IcsFO5UI2qoxWCya0r2Qrctogx+FQbTFcGZZX4Y5queG+l1UHf8+s5Tt9xg/1a
 RG8mfMeAnuQAivP3z/MwhXGHtO45LrYfmKyPCWjrGs3GSUOF8/6JPCN0wiJH9oQR2kdD5lM1gNZ
 3FDVJSnj/Hbj2YNWRp2Hp722vlgB4H2CHSFjcNYOBRHpQ/xXFb7s8PF9dariAs+PuznGIoMGVsA
 suWeljdJipHGQszkJV9nkg6C9gorQ1c5ye0UPHInNmoNRwDSDa94oijlgZnV38J1bT23OPj8rRg
 RFgiw2Qd0iwXEsXPRTA8Hhh1sdGVdXsJNWGQnopxTz0P3jnQnSKpQiGSUsYp+4xg44fOio40p/0
 HIkkWfyqy4sv1O1+rlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100092

On 26-09-10 10:15:42, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Set the correct value for the hardware, matching the readout from
> Windows during audio recording.
> 
> The microphone seems to work fine either way.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
