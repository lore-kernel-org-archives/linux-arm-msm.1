Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646DC47F786
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967073; cv=none; b=aEwwbvzheh+8q58XOtXxGmnFn3M8iPC/QriWcBeHJFEk3wjWQ1N2KtcuvcaFKUp/tef/KH4Icpir+oy4yp1SeUIB2FBt+xpKHQ6MMKcZPof/4pLk7z6SKVYvuRDzc2voLDqdLBqFrN9yeJp7C26UknVZQOXoxXPZyaJ+JXeHvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967073; c=relaxed/simple;
	bh=w6i7lW/hwahzDmlSA6tJQSUGt6IJk5yjdUIT7PvGf7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRjELeIwjWIBnvFUe4Hk4QN/oUPaED7wB2k9H5VdwLUfWYFfz+SBdi9NOB6BmAxJSSW3Mia/AmZ/n/Hwbdh4JWZKtjpJqm0iaV//5wbmbTf7IADDSjQL7ZfmDdTLqVR52FQR6j3wP+AjJumueHx1VEQubcVnlB5svwG9P/zOO3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHTLEYrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQlcIwuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHTLEYrf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQlcIwuG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6lEge2088418
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/dO9wEXpKZ351zph6knNuG++
	0aS0MxQ81WRUeQ8zWvw=; b=nHTLEYrfHkTzxG5g6MzkDShNgP/4lVqSYgfELiBT
	B5R1VgO4aXByJQP28PwMmdaZwoWTRpkcGZfo0cLRY0f8OCoQxAxNNuzD1KFJFp91
	PSXPp89W3fPwK1+nckz0iAUDtFL4zGGV8K5wYdRRVOk/+F8UzDVEQl15ASgMHXiD
	f5H7/mSYutVG4ddfhKIiJMpvdAlSNVSwhOP7pNUsN6WgiF/yr3HfFYAU33Znaq/V
	qruLhlBgHX303zlA9U1q2DKk+xbvYH3nF5mb0I6HaEXohPgfD3c5MyhOTMooBZ1c
	viPyvboM7W8fvPsVsPSdaesN0IvxGGM9jmUMGFzH15kMLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hvt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:37:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso178113285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967070; x=1792571870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=DQlcIwuGJwc56Z+nXopZ84HFL7hyqsnP/ciBPYz9jEWKvXduYZbeUT0KBG6UbeUQyL
         R2chSim7kRnK4S0Au0E7t87LLcN7KVwjLuZlBjJzBNql8Is3FKnPoyjbCQwtHZLvaC12
         SloCwpxsc5dkbglUdplwPWep7U7werOtlYfsVjoy66uth5BGEPxQpT787gVhdZHLma0H
         38On6MBu39W1qznKuLue4dxYRlWsVfIq6r6kVBl/7L2KTenTz5EvAbS37uc7yPGWF+46
         IqiawUK437eRcJei5qLi3hq2xkJppQ4HDd5e4tzvFsA38TyGhFP8gHkzAw8OqSBTDRBi
         3RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967070; x=1792571870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dO9wEXpKZ351zph6knNuG++0aS0MxQ81WRUeQ8zWvw=;
        b=DvAS6x9e9fQC6N/KGsIZjYufam5m7PvWjYoMS3Al0eXncVszRDo21KZqCpWLa59xaE
         he34q9mRJ+OnK8Ex44gp1/N5d4UbOx6Lc/WTdYlRJooJ1YbZWUh7wbK3uGYxeM+TPmVk
         vQQbPWYc8XJiD0C0Fx/SrUi1/jAZyJm52PRWFEBRzK7C0nOa1gvRCGRgrdzl/vHVE2SR
         W+ky824a/xISVxhpFWcWhCLP0LcZ1dMDQT9eZce/akuEYSCkndrYMDrR+MXZY2SYlzZ9
         12ViSHpVNu22lJeYkBB3vUwKGlX5lFPyQZLPrBOTsnrBbIWsGMvWjQBnnPtTE8O9CI4o
         40yw==
X-Forwarded-Encrypted: i=1; AKwUvBzLFnX4xBJUIte67nP1jfzmwpC8X7zVukDdir93hUQUiK9Ut3AezkFX8ClCWoYt+5FtrbMjH2fo4vh0Hf12@vger.kernel.org
X-Gm-Message-State: AFq9FYLGeEkzv8AlthuJgFGdxkTiGlULxgmNbdH6OoUkRO5TeBI+iqGk
	aKoCBrUJTBdtS0rvW+GeAcZY92EurW1O/DQ1wjFyBYfbGh7Ccgnu3ZpXZOzbSeBqd6uUegNO9tp
	prNeFW8Nqm5VMq2AftBfNWvT2M5BsZn2LvZYCtdwFSpnafasnltM0+z9ndnC+7easeZPD
X-Gm-Gg: AYBFou0URWx1zKlURWoT7Kz/QIb85atn1t2JVxxmCnQhN1SisJUSXdcbnpNTCMgNWRb
	2uqnhgkkEggOprnf8FF2EhZMB6lC25la4UwC7aCibYF8XKCnauo41q7RT5mDRH0lIjpOZ2nfkto
	T0/3yp0E4lug5T0/30Su6HReOLejgqE37hs2WhSJYZyxcEI8SCenhWRzLD55dSqAUVhpe1p+LKq
	Ve3QvFzTzVEm9Jjo/2N6BQAHHyYJF/ws2h3TTT5QFoBw5/868yTpkuslmhkdb0vP8V+x+in/iTg
	zRpupldBpGbKa3ObN/J96fBM2a+GZ7VUtb2+RHUGSlVf6j2ndgqc7Wp+v9snBfcU/OKXz3/Pja6
	OLNqJO+WRNdJf4jSB
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481090785a.17.1791967069955;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2481087685a.17.1791967069285;
        Wed, 14 Oct 2026 01:37:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm767149055e9.9.2026.10.14.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:37:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:37:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: yoxcu <mick@yoxcu.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
Message-ID: <juep7e5qyp3fnlet2r5fqfeepwbkmhhaey4xxy46s2rfsjtg7c@ax2q5tionsuk>
References: <20261013203749.3078262-1-mick@yoxcu.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf3f5f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX1D3cNHtGHkUj
 mOnVlT9h7Pk14/jfhOTwGNsN1UyxuGuP6jSrhBR9RFrpl/N+cm+xlIr3V1V9Je5yuSaGplbX8P5
 M/PYBO9t2D+mbmh7PPIpAvYr8W9wsxqV443emg5tUEGCgXTs5ViPTgc/vAD6C+rVgsph8zOy3UO
 n2XprSfwNmTg0vSKAOKkW6hZVWyf/0E+XR9XE1Baou09RlY6+OMMO2fGJT2MGzgsKPavsTXD7Rp
 Ecx/gY6DFCzFknsldjtpSBjd+9WoJSeewZBYF9atthvKInZPUc1I4OAHJcZxtmy+phinuJfjild
 HoGc3ELfU/0a0CgZ9qBUVaeOH7x8jcYMjUBnRz3GRCVvprliM1MU9+ogDtTWDH9g2FeV0xe1ZP/
 6Oxt7LZSMuyk9HLGAXPUV2DgPnju5WMkiYPri6SYszQ+gglNgzCWNnjMkkNNCJX1zg5Rkq6lsWT
 pFNprHO9+w3K1jeS3mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX+8Rjpmatlfg/
 LS24MPl/sPSZMocqEbcoG9kX96B3jDkkY/pbOWp3/QW3inpvtJtk7CRXfh4TTn/IBLBKcOz8RM+
 jvsEVtOeaUK07nR1SZXgHPew9aBTLQQ=
X-Proofpoint-GUID: ITZz_mI1QYGg-aVI3qhzHeYJl0XHV7-O
X-Proofpoint-ORIG-GUID: ITZz_mI1QYGg-aVI3qhzHeYJl0XHV7-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

On 26-10-13 22:37:49, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
