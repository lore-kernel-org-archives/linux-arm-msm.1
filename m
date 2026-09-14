Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5012397922
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371536; cv=none; b=mH2DwA7FfMsiqR61J4t1uN8C+Z+l8kAWKt4xHqDmwLsPeqCC0KwtiGMG/jEpNT4XyNflbki9Aw/inW7OWtqr7G53xEwEGzpEErzpvTayqudqo5FWjLtL5RyDZdwgHtziEGxCOmPVp8TzYkqexb2yk0k7KvsduIKQ985Ygv1THCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371536; c=relaxed/simple;
	bh=IZAQs5Mbd0VHxeZKpUFNEOb0Cu6bsj2Yfmj3KWn/wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxZc/gTKWW4MpRqkOeVjr9C4MJSvaLKkd8foxOmh2MIoeTBkRE0ASnpoMVFWFehsWmPSyHqCBndqQSpdUQf+wq7xp/i9C65qAHzcV2A8i0JeHm4Yl86WXbuL7wzB7z2pZEg46kXeiSbQi72AmlMr0BO6TvuBm5GoOkgl9lXRCSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyUmKA9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6yfFJLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyUmKA9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6yfFJLp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ip1Z3901209
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HKYGjaoMC5AkTZVbZyYUvH8u
	rS/boJ/Q+kOD1Piid8A=; b=KyUmKA9rHARHtjXsMn5js4pUi9S8yQ9bUOMBPMQY
	CuSef5gESsVvphF6Hw03GL8jmubsV0b93rNMAZ8R3jZM+r3Tt0AN0JJZdUphynK1
	lHDN0TyM7Xg8xlO0SvJKgmp793FTTDpM8RKkFNEMkBZfKbQRnh8uLDPpI5r+3NIN
	+D27kZAC+BstxTyiG3fV9QfobNxqsshf/HiMODeu7k8OsoElVcY4zysx9/20q2Yv
	nlpyxqETA7GpK3VhzJi2H5o33Z+6s1IYApeUI6DGPHIoQiS1eIVeTdJ3ZYqgllSe
	aYOoYcVsuETD0NpCP5nVjaGbbjcPfRyhTOh4GpzaE7i9CQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:38:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso715962785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371533; x=1789976333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=h6yfFJLpVVbxxcyELKrCL02D5/g7q15xE1oOWIltseht63m3ieYYxi2VajaDtT5mql
         rVcRo5vnVzIisSCnh+3xOYhybEYZc3WXq+Gw0ZyEgun+w9tvgtmz7gtlDmwq4/lRxmei
         YTG2ZoJwMVMkSQ1zfabfsl94pSH5152jq/9TaMmQgS3aWviZR4Q3tZPG7QJ9wisyYo37
         /5kldIp5ih3/a3ULRWpKMd6HxRB0vyZNlisUftUSfhxy934R/QtSskItm+L5Gql+/PkS
         EWbsOp9qBi68FISNl1sXIICzNv/w+6ZjKGpGCwPXHHfuxGDlf29ebskXqWgg5dr3Dm6F
         O+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371533; x=1789976333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKYGjaoMC5AkTZVbZyYUvH8urS/boJ/Q+kOD1Piid8A=;
        b=LPovnz694fgrLRg99AS15BdZsNgn+EPnuIVRFwnEB6+bFnkHPj99NacNKH2JKMIobt
         uLrR8OFJQAvlaPsDWwOv2YVjzqPvX0h7wrEfa4cSMbsYrv6oz1Bv8q/0wdRPIwq7BtjX
         ZtTFNfHkauOBAICfpSlm/BmM5Xime6q5Hio6kPf+D7vzHyHZXaMYbLtTv+u1nzY7CIRv
         0HMoheXvj3q5z9HRW6IbScH8kzJOMENssbt1mgZWdThry8em4o7SNiiuTx3qGoM+XehD
         0o+L30NHtvl/jfl39vBKSxstjH3TuqnmQ/TR1az0/Og/zQD2nXjcUJRXTs+2LnWdbvnQ
         I9rw==
X-Forwarded-Encrypted: i=1; AKwUvBxFegFXpyHkLqCT8HEl6maIGPY6Mp00wXnivZrnX+fSiSxv9phXhdx19+swOaYig1F6X7eKg3590UR6SARk@vger.kernel.org
X-Gm-Message-State: AFuF++lpzcOiahdZXG9DqQhHAOga57prnfTzZV1H9I152uLY5Ne3tf0/
	3QeNIFpWFbF4CwMJOQYeH0+44KqSr7hCoy0Qxvn1gWoUSLKgPt14hCazhzJT7Wtssn7myY6F1hj
	KdXR6FYutfE8wMqyTjXQgXJPGJlkX9LLGWg0BCL92tAAlf55MUU6/Xy2lQXHAb4i7mzPY
X-Gm-Gg: AYBFou3+z5vAvRSNkrDdc8x7jOQaN+Pp/JcimYgSZPm+rK7ZDmPukfOkl6ONkh/WdtW
	nDUON7lYjjt6xO6YYcoD/Qw26LESINtYX+05N8juUgRUV8sRjkZVNGhsa4wjosrTQjOXFivyiRh
	A0GyVQqNpco2+7fJ0VkaRR55tau+zZ1EyfYfXZGPMhBV5fFVIUADbaEw+2JwADO/r5/7n76IhwR
	uw34/mq1HexMQYQhEwAFo17El0Fzw66mw646Q4polOvDHR4G6ll6vCHns9UmZdU/kxio1KFfyDb
	m4hi8+dSUTqF3haGN9J5wzAaKcqJwklfVOFjAmtJSfdTbVGAcFRQKoJCX3zgJKkXHkdgvUEur4R
	DzDwixckoz3bz53k=
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183312885a.31.1789371533259;
        Mon, 14 Sep 2026 00:38:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:92e:bd39:9993 with SMTP id af79cd13be357-93a299475a5mr183309385a.31.1789371532741;
        Mon, 14 Sep 2026 00:38:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm25373986f8f.19.2026.09.14.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:50 +0300
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
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
Message-ID: <7mxsmfbx6qgzfn7vaz23ylvhoixolc5ge2ie6fer3bmzydwxjd@njd22lbnyyj5>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX93ribPCw6OaA
 2mVyefc7Wdu7kxted+LOuPEQlAI0ZVqrr+pO9uKCSGB06ismdiZK8RRmejGrAnfgdpFohWHVaQc
 ZuN09lKXaP6whg1rVoX5ctOSQpT2z08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6uN2Zv7oxqGW
 ODCrWM5b1YhEMaC1LuAREYv8yh2NFoQ7cbTLxWSmOYrdXzPSsN0kxv7P5fxfPEQAffEoHqjYCEQ
 37wcSnEpYMA8atlTAycaMBk3UK53tugNmoYhAjwGNMY77yLsOiD4ojj3aNIbwKHGoi+oBi/BShu
 1av9sAblKQNi54TtQlOS3YGK8yvIrlPmJ3wiz5fzgnH7DTL/CE7fUFL0kgwkSa/RR/Aai8cwA+u
 SLT/tgiaW8HHHFcmfqRvvucEGH8xzl0uqZzHuRXxPDvSCFTrBhm8Kqu9ha+vTdjwjTTk8vFl292
 pLfzivQTlLJKRQBwK592uCMRRTqU2da10lcJTrPSepTVDC30Pmh/dWWmXEOBOmuumWyB5v79tyK
 kw/3RCEKQ2TV8eHA1njBjMbrbW8N8VujXU5WQfJAsdsPiTt2FkI2XJNPiOLHFFHozaUu0tfUYzD
 YiDi4dCayb8AlThdtUw==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a48e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bySCk5FWaCp5QW1PsQnQkMfS14USjRps
X-Proofpoint-GUID: bySCk5FWaCp5QW1PsQnQkMfS14USjRps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:44, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
