Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120E37C908
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658481; cv=none; b=jN2YnnTSVJ+Uam8lG3Wjuw0hjlSovrQRcuOOXYwHdvX5eb+2QmqVPfKIgasgmBJTVGdSleA+3DjAb1mpZti0mOOO+BdoAmv9kgthviqRp8c2J4g/tQhh8tOSTRQAeLqxjdVwKcZcybNObyu1L3lk6wcR5L6BcjMBi7fIVL0r1Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658481; c=relaxed/simple;
	bh=twrgboY+FGQmnsHlBPho3Q6UZGpTdmrg5WyreHCXpw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2Q74OEJbeSd/lCZ0paauPSsWzQMTqy8/s+xkCPKuFAyIQKbGgPuUWn2Njvzz3iRe0JIaeIryU19t5EpL3wlk6lFfW6ft6kxAl+dmcFV7OQYgaCsDaKhlF0K5EnO9sv0TYpBG7HICLOVfnV4a6ZTCuVJng+0rJFcwTJ18tafhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELQo9br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b98Nm+le; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELQo9br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b98Nm+le"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRr22086477
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/tTW+lLwHomb6oSOol9clHo+
	Od6D7SaNe+Gbi8U5oxI=; b=VELQo9brRFGtw8IueZoNq4B0AdZhmVoNKND+Cnsq
	cb8hPrgnbgtKLsYNu3YcasMGXlubsgn68qzsfrAwcayO5YwThR8QdFJCm58jw9xi
	nuXyQNzYzFeZ4w7jL4RPkfXy9cHpNMhwx4IhHE8eLmyRzzUQhnMioDnxAbbKfSFQ
	Gv6ScnRKWAvL4KkcwalF/MhCy6OF0cPSFIyfWn/qwoJWncigxda/DUm0CVz8O7VO
	qneFxFL/RZn9tNSU3hiLNoWGp9krqVm2xRb1tWczizdAaDl7IffprzwHTG4MXdrH
	uSwmtGLGNQrGcnDnAgRK3IJZZslgeoES7tLYcJwKm1JvWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu4100t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:21:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530f968ccb3so13553531cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658461; x=1790263261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=b98Nm+lePUNg2PLFUj93k6QL2U61jXjyvU1VKo/Idl0u5HN/0HUQh5KNReK55m+vlB
         InLO7u3WO23AaK+u0J3becLhUIudA3W9jfSg+c6wniX21EdFHfIEjumTMJi15o3XPG1X
         TA3gSOPN+wzGL2mmpDnxDDqqp4eDwVoH/JwROzlLzfFvf3bwLASg1UTzdVekQl/H40GH
         0uUrBZ4ueG09gI5psYMbV4Aib0RF99g2YIh3B2uh5fs5z4kdZRK0sJ/ZlRWqn9MGM6bH
         ivTrf1zi9GXS4D8BCdEf70z5YsX8z8Dy+VdvTH9fe7OICleiRJStY1xASBdb63wzvJva
         itIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658461; x=1790263261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=jcyQk+OqqId4mnZ3DEhPxiKTbjlK2nU/Sed7oLcHQTjOvp3OzouLBnrZC7WsUiX5ny
         alX+4SKvCH/ilGLkctl5R/6ITOFhKiLuejcOi4se/pqKtAFHumu4nXz4F3rA4NNK7N+o
         /V7p2DDWoQBbinLmq+ziG8S9KhE8eVDc3KRXFofVgmnREFbmxNjilw2JoJ90EKWdlbgG
         YBbdrUmh5hSPEtQDDqbkgLUNm1ognvtizXgwMh0JjCsdFn378Jgc+th1HKpw45JO1jFh
         gxxS3dVXFqAgWrEjhNZRIM/AsjDeXg89YgyAviI1OFQDU6cBJMvmAVXS4wdn/Zh3iJOp
         FBCg==
X-Forwarded-Encrypted: i=1; AKwUvBz+7EGuR8rgu8Ctlq5aYE+Xd4DR+b49yIJQIah5gOEfZz/9HV3PJSHeVc6kmYHde6R+xVdawl2ZE/xrO5/u@vger.kernel.org
X-Gm-Message-State: AFuF++ly9KzRfLIV9YfUFPPKiY3evfgtOhLPldWcPExCxMIq+CcuOJHk
	pt6PseZc7ZWGSIQtTx67ubxJ0o2qQb6zR063buYrkDsf2l2QmXJLkUlFxSdtsOi3NLhrGeXW13o
	RoCv3/Cn7Be4QHt+m0LSHbpqiXUGIUWCfMZ+SMS8uTJxwTr05NgP7/4+P2jNzO3Tw410g
X-Gm-Gg: AYBFou3m9hWEwbyPXYTtybPdlEgEulyWu1lHwNPEkkExOQq8R8riqpqMrWeOyHgs3UJ
	X2S0aww+8Kk4wtw182hz6p/XnBZGIOCRVgmMd4JbKAdj20IhMtB0/H92mZGC1/c//bhdLur/8gT
	z4dqGeKCuOvWgmqVGbPZX7FIwt49e5T1jxMMmqNk00HBEoDe68qcZTBkmJeeqN6DaIIAfCvhl2I
	x3hro530NJAiybjUyN2hozWJRCk+PM34c88ZzuAMIL6FmvmIDaW9c6miO2XUaDN1v2ExKMP7l5C
	qUm/XXCrMM3wWK+xRsVenaJa0wlhDqSfqTDIwh2m8tJRGg6TZKQHotGcxmpkYcl0QM34b6VryDP
	HWPYF0wKcHpDFgIQ=
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12931066d6.57.1789658461410;
        Thu, 17 Sep 2026 08:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12929806d6.57.1789658460638;
        Thu, 17 Sep 2026 08:21:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm16392480f8f.15.2026.09.17.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:20:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:20:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Message-ID: <j74fubwlkynw22nwsof3wylypf77ptrwbg64q6tmldvh7ckq7r@6nsl5fgiut3r>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
X-Proofpoint-GUID: EtJFiN9NfY3GNVQkL64H43f06qmTobMt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX2Cl4/jngcCie
 cAVjOsh8Y0FKxYrSgaR9gpU33rEuL0dSPf0MuW6jCxwJinJTP7bwWnsuZVVRj1UPBIUq6GpquwS
 7QA0+Q9nfwnkDD3oZBZFoy2etCbYOh4=
X-Proofpoint-ORIG-GUID: EtJFiN9NfY3GNVQkL64H43f06qmTobMt
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac0563 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX3+W/pRKnYGKo
 MqJNFwsXDf/ydt2m00JVxhku4a9Wf/9EhP85B4CAgzV5VHIUBo5OMG66YrOjXZ9Z5X1q7/OhgBh
 cMqzuSg6aJqU36Y6YX6QFB58BbbW3rlHyoZ51nVmVL+EGngfQt72njCk6wDxj6a9PJsyh5WW++5
 TivLpQCrs/OB0FgUo/8hbzomfBgMwExqq2Dxo4v1KTSIaAqlF5Xqw6nDG2R7gyXyaRA7Ddqh2z/
 Aez6HuZbqlU4p9Kf9Vn32flMJzvMpDUdpBbg8Pg6xrpW4LI+9QXdBV1gb3f6wRps2nElyZD+h81
 WmcQGfLYwbg2Vd0CyU44Fs6oPA6EPus1XoMwPV3KZCTCWnu9Tymh46MwvJP11Wpgp3MiVsSb/z8
 lCjjTZSczmxvUQiELaAq9r58vR7hBImu/0CK/Eqb3ncG9ZOW/+DiVbRGAomQPTt7gtPicDsHBb9
 bpbCX+USgPLyylbDjig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170217

On 26-09-17 12:54:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
