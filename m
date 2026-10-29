Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264128;
	b=tf9MJqZRj9vVDJfAefgQihB1BcLSFzFT3CFzfJ+JGaflYa5kfjDST6UCr3GDuhKCNRpB
	 KcR9plmSCqVp8i0KlrkOBmAVzRxSMs9X5iNPk9nel3+mSfIlZ29xezBqfc8mVGiWmGJ9I
	 LNEI8X4SxmAWKtu4MhOA08MZz/btJ1UJF5t4Zj6umKZGdkkAKc67brUjwxny0AqTXRw3F
	 UDr0Yy0UThj0oI7HqVOyPru3Zt3wuphBRNTelpCzxVWOQsATBiEj2yjxHcCA//avia/rK
	 L3Oj1p5OpzB5kJ+clNVQt7LRBx9vcLUxMrsLLl6tLw6Khi9ohJaHnxGTTy7QnlnUPbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
	b=WPculTkjF2ZE8POsSwfoHZC00gAYl+hjQlgaOo5nV9fp660z6BQJY39Dr5B06hpQVsL2
	 f6merS7N699joDhParTJMvvlPntQhXijp54WV7RzEGIRTQEohlmM1v/u1TtwibFiMop2u
	 ZJsxknSu3yGwU4tg7tgGjYzKC5HJe+9230bHCWFgE9D/IhtgzAo2nqw/fbGvfQRaS/XW8
	 yRdkQHVAfiNuUguGOIF6X1DOtkcifYjw8vyD7VD5lhwmJVRDarvb0qDhjdoljH4UFpjIG
	 Rx8/ALTbF3f64DqMVgXo+3HBmsj6hXWpliK6orEfjnZv3wWD2t1fi7iuCxlHCuw2NXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="orN/2GPp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8783606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8783606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orN/2GPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6iv3282399
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52z90qNXU4fTO2VX++tJFlr+
	k0DTB2MGrjm0OuMj88k=; b=orN/2GPpMTDSoklv1RrKjncnRQGMGceGxuLJxmJN
	MrXUBz5S2h6DlIPE5TSi4vK0mt3fKTjwZtLzIdhE6fMzsI695bOUxY1kG1ytKSGq
	hVkKcMguhoYUwE4h030++C9iRBO2n2W5FRWI236ceKlkuKKmh6XRV5aGAm8OfNTh
	Vktks62Ya6RPp3Z5WUDmoZXx95Y4ROsAHwi1M5lBpV/Gp6nrbUxN1JhzKys/V4CV
	v4iGzT2WCHMVJnqBsAUq2lqS0nBmixDBikCkbKbfezxzk5YntR6U+EaCZfYNUOO8
	9hee2CNn+eoOc6K++S7kL6hN/P/Zjf/nG14SX36/T+Kk7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptrwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso96456885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264126; x=1793868926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=XYDSRqK5KzB0tLzj7IGp7RoE6isFaFO+UC1JrlwzJRWlyTpmb65AAigFfxJAhC96vD
         zWukNgTou1GCz7TwFkIqo8lAaBiYLmIj20q+FzE6Iq5a5gYCM7hAeBulFK8pbUxfqunV
         GofGMcZy4jTwnI+sj7Gp80ckQgoq1QZ/ewq/WQj9y1albk4ThCLURX3hfIRAFv1Z1LuW
         1gkFxnmyO94QQ1xSROIqKiiKgxjZR7w5fIOZpIRdFoy5/e95rp/26PMCP5r+lWmQbC4Q
         l9HHfu72JB9HaCmJ877yGKgiQAg3RYRNHrlVECBDGDYcRZVDRwcQNXtZb9XPC/eY5k4k
         6zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264126; x=1793868926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=ytB3hxQOS/8dmqmenHPmuiaiKrHUqCW4/OGf11X8oVmeGotmwNmAEJbX84RaBFajWg
         5uZ2J99M2mwK4Cx9hTqOXCH1YRLU3FuVLpzwIXwa1A1L8moQbELNJmmeoEl5OvxtalCG
         oB4KoYVVIaNJO5DgZ3q0FK0BmH2uk7bQ7dWOEae6qK3pDN/tcHBprs+IM5i2Qwuwf1Cq
         o8FaAym//VybyuJezO/EX8nJoFKCICcifUvo9LUrl/Sg9gmYXKt+KSvdbf/zk31iis2N
         5d7ASMGlpQaq7fcaDSC4zaBxxn21hx+jcgamkv3mWQSUv55FinlyNLAOY/iLqGL2Xp37
         25bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaDbQV3w6TSOPhxQn/JmcyNDNtBe9e+0BGR3GU8oFVjsVdL7arrtie8SbcaXVDFsuLkRFBDcLmUggJHUJH@vger.kernel.org
X-Gm-Message-State: AFq9FYJoeU0mnOPIjYfPdl05yrnLZXZnWARV6WPUIGnKJCyjjGWmI7NL
	FsZnc8HRPc3uPd17/04hVUrqdOL+tpvFeCSVRiBFW3r7WLJRuBW4zqCXcmEzlUtnjsiXMC4rLUJ
	6I1lRPPCY1SWl3vWEMIkftZ7LEeyp0yzbbTKh2Kz2oEFaJtA+T6W95gHQ3drDNT6CBt51
X-Gm-Gg: AYBFou2Jbi5AJjs2odW2DS0cqUmEBxrtt910U+8OsXTUjK5P+ooIF5DC/XrfLw6GeJ/
	Qs0/twh3AbilSKXE0LYh8gMkh383UJtFHjWKV0dlB5vpTyrYj29amvSpC6DCFrV5bVSD89EmIjT
	mg3VrhhT3jCbr8aCtwIXni6GISPGuBr5xT6CXn8LDcArHxyeNjK5NIK7TeFS+UnDnPLGp9Pwg29
	7oXOIJOeNkE912TuolAkYQZB6GdgRDaRKToWen10RsWShZwmyRXE1ETr+OMEnZ8Tapr3ApWKvLg
	Cd16PbKBCX11Uk6oEEkKJgJ99x2c/xY///oFqulDnFSHlirQQi8mopjXhoV31wCqcwHn66N/VSs
	KRUGfE2Ijcg5BCUS0zD6I9uECrfH8kNHP9r+AvXbMd1XC8snfBVyZmef8ejQcpiRW
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256649385a.32.1793264125906;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256646485a.32.1793264125336;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm48686055e9.8.2026.10.29.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
Message-ID: <g42dgla5pdrswflwlfnddejk3kkoasdooecbiwq7zkdwxzfkbv@c3zanmmdyzat>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX2iDFmKnLF/1n
 sfugWicSvDpunxftZUai5/61p8ECGKpLU73mbGWCvsrahtWSS2jfmdW0A5sDGeQMy8SpiQUd+UB
 t68PpXs7ifnp6M0Y8X3NuFVEKUQYjgLNugEYL5/RLXPGwE5Mxc3Rw8CTZ2b7/y/CGSeHRkGYZ5L
 w1rc+1P6vWtvZZDnVjxM1WR/Kj7VwYvtSsXyXnXzOo/3absZIKXbl1iL+sYhtM7wAw58qcYuDHF
 Dtxsuq0/3bP52glth7Ji6wGI48InCgxtSDFn2yZ53auTwFeCpA5y1p6cmW35BxdpNCrM3ugNkuH
 Oktwb42HbCvtD+prhQyikJLaZLtx3mQN+HMfzKdoA68k4G4lC+xQbF1Hx48hoV9hzG64hQZ/faW
 dafrzGITlBsT2hkRYO9BOtaOJ1tiVZO3YXY9LRJcUBYdzy4GpnnoUh6LHKq9u7cPSV7AP0d/1sm
 yxDSjp5ilHx4SnxcRNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX3yrDBeTcCYIf
 MCCu5ywORs14Lumi/okl/2Hxk6OYaHfXPHZMbn0VWlPDhODYgdZXBOFEc4ENDFMLt2bmalX84Bd
 QB6dqOO1UJtyLJbIQxeGoW1Bbgm85t0=
X-Proofpoint-ORIG-GUID: HvMs8eYps5HwjrVTfOXUdJR7XssIpasq
X-Proofpoint-GUID: HvMs8eYps5HwjrVTfOXUdJR7XssIpasq
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae309fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:27, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
