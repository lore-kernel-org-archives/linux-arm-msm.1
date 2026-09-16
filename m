Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF7627442
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561801; cv=none; b=oqNOs0xz2YpjAhZHzfEGBDb8mPTN1uR/yntaTZsOxP0gZRIvstVtnSDUrHSyBhOWV2SVGYDHxXFKwH3lavI20E8br5aqLvFg18oP9BQ9u7Qik8HmiwpaXPM8kY8yyOqqBg4bZUKGO38eCRhQyX233Eb+KHXBnu8mnutujqouMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561801; c=relaxed/simple;
	bh=VV/ZxcpkxyDx6mlCeBCzzhp0o6+5/SpiA7NzDJ1JKcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSqPtgoxU8io6TO/lHxBAT507c3C9xHoMcB8tHHOeHvU7DK0jrkScu9M+v9464FK6no/e0UBEE9NRgrA5zDkaHFuP3qYpaAFxszXV+LZiRjKbAb/gSTl+M+ueZ7tSpkw0MeyD0LPjJtaKZUi6ITTUoAyls34u5FAApsHBL5SQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dP707TW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4kpfSo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dP707TW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4kpfSo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G930YU978476
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=; b=dP707TW1UpgrbwTA
	f85h4lARGOVSNaL6AoGJPaIGSa/dgvtY8P5biUxeEeGinIj7xvmq++s6M+NWSC2D
	nyCczuBCWqZ1Z+FV56f8gM503+f8YNRRyOz7GP+TTKFI3U2zMlx5tkSwU6RA61An
	RNHwkh5OmdWq56FmO+D47uqzpXmyfA4xXNpjYq98Aus1UJnp0afeCY2UiAcUQru/
	1VNaEY1IsmFufkTTeT99e+up2TSu1nmedOFyY50ckVf8HLqzlxlqb6+SGT1ymgvo
	PZMKossW3z+4YHyus9qFvyhHo9IeYxPgBYmugwzTMI3+i+zL4AQhQDrODl7Kj459
	Y1XZng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rxu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:29:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a399a12baso37894185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561798; x=1790166598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=VY4kpfSozyowKdF6LHrxHjwUZWwwxQcdmGU3nqq50rRlbkHkXgdk9tlfefZ3BwW6bk
         JxYJfpLWLDGYGkGx9ifYNDH600l88cbhzE2UwLD33tmS1lQWs1p5Pwyjuox33LjPcaSJ
         eH8kBlufBq7JBlCA+HF1gtBwe5A7kmCeC0HecCd6HKdYmWQ/JmXtUI4hi/dfOPP6/uEB
         NcOkxYKAO660gKSezGsyDftxRBruW58sGg/TXHgrqEU2MoqRvhxaNe6osSggUejCykCP
         GNQe78arA/8hdzbvlLxkLFjD+TunFtLJOLWHb1e4CbJgi2nymWtYwSlb8+LBo8k6VYWv
         RwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561798; x=1790166598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy4R4SqF8jXijlVWnUPUTEknCsWxR9i03yH4i+tHqNA=;
        b=ucpRYmqU1XNbplgioBVxIZd7Jw/btHsuguFc2EsDPFDi53/mlF8ICZqQlTUrzgJ2x3
         52zaNCjuMIOV8QEArQNRCsd7s6I78Hq4ZEobuH8IVVHKL4G76EQmYMZGrH8FXrVmfcwg
         DpaJ66upFlMWoXOeXM1BQiNSXMP+nedgJoeniKSqmScNOb9aEV+OGTAo9IWzU9hQ7PsZ
         P1xDziwD6wrSkMMY8rbpnthB3lt3CS+hxMf1b6Oe7s6DO2+77edDXsb/l0mWc2vV/e/Q
         VatUta/PSGp0WjqlXVqm+TcFwncOxHqph6guqQK7Pipl0DZOvzQjbXo2+a28Yenm8dv8
         n1oQ==
X-Gm-Message-State: AFuF++kjJKSKSGu8RNrw+H119I5jMqVYkx3LFS+f3NYi87Fm4z7X5dbL
	E1jHLandh4A3KjneYTYzfykC7rVeoXMBsXC8XY/fTmZmxVXiyftszUn3oXRqLJCxz0Bm+F+ETl5
	uZmEOqJvSJX5hE0HcGquzQrZvRqnhMgN9S6xPssgwhQSMq6h+inNe7slmjjdREcThTl+q5cEv7z
	mf
X-Gm-Gg: AYBFou0cl763Uc4fGjzLm6jlLi5sAHhgQGpDqe08pU0tQIwc9KJMNwMdf7T3aBXdThd
	oVt8y2Oe8QQL6Gu3wua4xTqGrQ5Y14JGsNcabf8nsZi9LxiVrOHnVLcaQTTxCtTz0d4K/LEFpC6
	UftOJylXzAT4Tixx6JX6Hxu8l0EZVBIEcQFig5pYyRu8j/AAO7kQS0BnWNJZ84nyNOjsXVZLM9F
	f/VWif0w8wi6DDeKSnCOqQ2uWQ5Rl4tKBjZNLHUp54FPkID9//jSec7UoRKgBgYAjGmAQNVqciS
	S1zgOdgpfWkNeFi8nSRX63lgsxdRfz058hlE/SSurFRu1k4hgYrhYHO1zz6pyO5i3SDG2fBw4J6
	bLUeh3pjgxCxkw5zTVYKtBQ==
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298860785a.5.1789561797873;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:94c4:b799 with SMTP id af79cd13be357-93bb796fd75mr298857285a.5.1789561797372;
        Wed, 16 Sep 2026 05:29:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63a7c8sm128217466b.51.2026.09.16.05.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:29:56 -0700 (PDT)
Message-ID: <85d212d9-533f-461c-8af2-b8771a4c9b8d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfX5hqYEHe0g2Kl
 PnSRokPyYzliwYS9wBgQnBQr5Z15dos735qce2PNIRsnctfkOdtrKJ4YMkQgwj7znwu7XrobjZF
 wijoAbVbUmONv3DX9msXOdTw8UFasDcNz7ix0YyOloLY6pFDeJ5LWo98wuhWtVTrN0j9UUgUbr7
 HUU8f6qG50TkTP9c/vVHQK/I4qI1CA5z0c6ZGb0VcZ6VQYg6vmB94ROR/IagT2DvYru1+3rIFZX
 gLQqBNlNisaNZG0EFJLLKU8USPz3wcm2L0rFyG+VdU38S0ZPdODWje9u1TvzVaZCRfduBRzlq8V
 N4pPfZp8TJzN3DU++/1tIEINWLaSseBmhjxR8s8S9CezuDLBc9dvM4tFragSAPvtCIMGo5c4BCV
 dAt5cnCdysw3mW7ZbHe47csJGJ7Grpe2MExrnIgicxQg5/UdlZLTTe9e1TxC2Eievopg8P8lUf5
 M6tDBfY5TL5qsdwYgJw==
X-Proofpoint-GUID: 3dFKZOokB3QJjNcUnzGq1v9vrHUfPjPE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NiBTYWx0ZWRfXyZSiE2DOuM+q
 j7afH1AUHuoBrtyHDhN98o046ZIgEuQIQltGgBFpBBYJvQn+lws/3B7aiO43Lqidw3YTmtQHl9V
 /Ae8okTxLi7Xv85wzDOkj4U2O0lr9r0=
X-Proofpoint-ORIG-GUID: 3dFKZOokB3QJjNcUnzGq1v9vrHUfPjPE
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa8bc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iJghmAGICTQdFqE060AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160166

On 9/16/26 3:54 AM, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
