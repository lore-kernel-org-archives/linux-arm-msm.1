Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579156;
	b=fJcaJXEI8B3fy8m6C0n4WDycbl9sAk81AU3xh6JBck5G9Pv0ikCGwD5keTlm4v3jX+IL
	 54Cl9c6ZUT1BabUrbwS2d85x3I9iAU51fzGhqm0CrM8mZRVTFnd/bc1Sb23tQtp6HniMh
	 WsGPfdVyWlxB9SeDBN4117I9qnOYqfj5Kimq5s8451vw9qiZr8RuiUxtQ0zHBfEo0G2M5
	 IooJQPtsJYL0HvIhPxo76Kn8XI0gfKiRRlCaRwMQslmiHe9GwyAiNPptygm1NsqB6sk/h
	 Amz0iC6ijOSYhtSQihV0bspxXrt2d+LNOgO3mPbv7uT6wkMzDtc+Znn5yDxetzpJaZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
	b=seeyuvOGmjuuRNVqDpOCbCPMfT7EudNfTztnGAoqnrABQKTTZjn5NMoAztkcY978QMUw
	 rCCM4yuAQX8/Nsm4/Os+5wqnIlVKKbitswNWH4wV5RsBmfOGyKa4rUj2HoffL0/75k5Ut
	 ZW6bW+fJcO64mkypopzEXM98zPLW95QunJhBo2Kgv7JFgnjZ/BUzSDwc+sAacbNsNoRvV
	 YxAF8+P0MRu/vM6B1HOcCgOBEc1yj9omIoAVmX2h42L0tLQSmL5+eBJCXYXCVVqwn0ejf
	 L9pj6qLQb/A61hBw3TIdXhL8m4f97y0DpV2SoqBNYJygc2H56jOusDn4jSkDxD1U1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A23606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LBrZ6vV9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0C4IUtC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA68Ax3620939
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=; b=LBrZ6vV9wbfCWKyN
	OgAUV5H/hxe1IAjXkR/Z8oQTaii0qMQ9HIYkXmwL5dBHk+rNCLykzKOJ9xhPSJhm
	FFBvU62YZNPzgkH/+ni0ZsjwmFnF/7EBFaCk1XcOxUj2EaKYj/8QkbwQqRJ4fJEU
	bsXQtTJQskbjLc6aU8Po4V0r+StW8HwISFRcTyu2w+aNSCBrIpftoncudeQN8ua3
	T3BRizN9ZCLqr4bTXHU0YPlbe12pcWUO7nnKUzTfkr7YYYt5CM6W6U0sKy1xDsYy
	1bnW/DBS6u1dIFMuDJNIg1jxO7z5AwDCy1U6EjgDaTV1bK89pweMc3ThAAVAXXrY
	NWUrMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3whm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:39:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16816185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579154; x=1793183954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=Q0C4IUtC/bw2tDKyj0LFJeQOva2JOPNwbT3Kvd13egyTrGJjdSthLEdGedRhLHGHsd
         /b+AxOhKhBex7PtiOrMQ45PmgUZ8XywgrcutJaw7keo5teD6o1gEc7D6jmx1LTuDqi9k
         dt8xui3O/mTaoHc7E3u6j1OwPVgk4O/vZC/A2eTOJ0aFdJbT+rZblKCR2bBjUjcTsvyE
         ESoy2cQc8Yd0EZKdduq26HFpWDXc6WhTMxQURKQLjMxmSPsoiN5Kunup46rIPq/aLq3L
         GZJVo9LRJnbesuecLn4fRPH/DM5SzN4Ob5e+AmZEU8jW58b7oPOD1suDoWYmFl6MJZaH
         URrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579154; x=1793183954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw7AqWlrFqvZ1QkzdIfdApSVhnuYiCOQAA2DeMcFAbM=;
        b=SEdxRLrhz9wFv5636acozGiq96wtzsEStijzWnf+tJqlp5N4WrKh+rIBavvqO58mE6
         NCXZ3weBWX88A88HtjJhhMwMLrTbqSQOl92hBfeFh0UJy1J1B0McipFfvIYx2kKi6cCn
         dhrBDrF4EVGjlJ1yIrvQLak2JXhQTlLcLQ/T+scfYLqGgbNxAC9i690NdarXtWdE2VPG
         c5Pekz0VgQM+8LoeLdHDoBvlSwcVKQBdREYzzxG38hRtH3tT0O8Sb3vPmeob/jiHHe7t
         JBMrYDuIAhz8U8UQmQ3fqa7tn7A4XHIeYcM6wVGUCPDcnxAW3ECbsWljXLSdiRc1HZQv
         76kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZkQu5tx4NeGrdWu4FzKWKUXADWnXInW5oz1fwSDCXREzw9YCgzL2IU4T4mYga6Tsy0UTt5miFPiJ3P7wT@vger.kernel.org
X-Gm-Message-State: AFq9FYIS+AcH/l6Bm+qpAjnKw+YXscM+v477CDpnycnIl3kdcb0ZNA/w
	fchwJUhaTz0XUunNQSopBaHd2Bjsul5CIeTO8PS6aICyJDJ6LIecM/AfaVO0x8iCUvc6dmhH4zi
	iK0DDd/8H9F54RLzgkayVoWkAUrMw4M9hMNDyc24OlHaW/zig45HQYs+aVlDjqRm+gTcjcYVhlN
	cUbQa4hg==
X-Gm-Gg: AYBFou17g8gek4yEORNXXHmNFSzyOzkcSDDmXQqaIEL1YTYKvrgUeD1LuIaykG1mBlT
	VuTQBipIwT/ToYbnEP+sxsu3hCQ9jYIMus2qiE2DguM4EqIW3m6gLVPOlBV0bpqD7qnkGaJyMpL
	ortxkT5YzbopPNImdr7gZg8RnncmQNJiGZXuT7p3gky8lrcvhNbIvhFfxyKfLTknkf6Pz+gMlJY
	Qk6jnVxKrJ8tMNW6yxi2qlFPbpZeX96+5tr1LABqO/LnAhaPkCKK1xJks34SZP3GvA0SrriXeeq
	SNtYdYGVyAhzVY1p82N4+GcXaO7pKBbLu2Homm1OhJjAS0ew3zqrZtS3Gl8nym1jH5ObPFlYqrZ
	7dXKN+NRCUB4yNXlzrhV3qQ==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393139185a.3.1792579154413;
        Wed, 21 Oct 2026 03:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr393135785a.3.1792579153968;
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78b22sm63381166b.15.2026.10.21.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:39:13 -0700 (PDT)
Message-ID: <dd641bbb-6012-4d6b-9bd6-5dbf4cd849dc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:39:11 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: store the RTC offset in
 SDAM
To: Luke Macken <luke@phorex.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016232528.4012876-1-luke@phorex.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016232528.4012876-1-luke@phorex.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXxMlidGbpkK7E
 atW5IVN5nulk1mguWCr1zH9vviZzEni7I8FHGAHVqQXnjvdGIOMDnSV55sRwoJ2m9tepsrjG/hd
 73GA+h8UFWptSKq3knaM9QMVyzNJX1LKxpHG1SEOKWGajBK0gEGf6FNpXotmoQHu1b85gOE+2da
 Y9jTaMlJH/OUFlunwnOPt1tyRc4z4IViNSOZoeKM5n2x04dIhY4ZnTqglzibUlaWJJUc/FqQ0j3
 qw6otvNTG5OMwQyWmWIwBQ2v0XFAvfsAzyYUtp5UUq4aTuMU+KAw1rsG4CzZqnOqz1WgREGFsE1
 v4ikm6qPAvFr34ZUbUqSqsVvfg0iWRUi322+3UXSUZTFKroLPiFOQtJnPrnTA0ODK294yTSkMKI
 +6FZD6lPp28HBWXzlMzJoz30OXutl4tP9GveIRbj3dh/FdjaOKPn84jB8rIcwkHA5y3vA9KeGb+
 fBlvxd/CS/gJmuZtFhw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad89653 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=supTg-EGvRqL_ogkzMIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YAmdabnXAjgwJW5aY5846YvndBh66QFZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX9JwO84Upb9n7
 evgNlda19+d298OhvI22GUYLm6M78g9bmymNkuJbE1BOzwDyr+OoMIo466B7v0yz613P6ln4gd9
 Ff4InVeyoFRPecyXYajKms0AGvuXMm0=
X-Proofpoint-GUID: YAmdabnXAjgwJW5aY5846YvndBh66QFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 10/17/26 1:25 AM, Luke Macken wrote:
> The PMIC RTC registers on the Lenovo ThinkPad T14s Gen 7 are read-only,
> so an offset needs to be stored in machine-specific non-volatile memory
> which the RTC driver can take into account when reading or updating the
> time.
> 
> The firmware on this machine does not provide the RTCInfo UEFI variable
> that other Glymur based machines use for this purpose, so, as on
> sc8280xp-crd and the QCS8550 boards, reserve four bytes in one of the
> PMIC SDAM blocks to hold the RTC offset. SDAM 2 on PMK8850 is 128 bytes
> and its last word is not used by the firmware.

Bold claim, there's a lot of firmware!

On Glymur machines, the RTC is coordinated through SoCCP. We're working
on providing an interface to that.

[...]


> Note for reviewers: Qualcomm's "rtc: Add Qualcomm PMIC RTC-GLINK support
> for Glymur" (August 2026) would move the RTC behind the charger firmware
> on these machines, but it has not been resubmitted and needs firmware
> that at least the ThinkPad does not ship yet. This patch uses the
> existing rtc-pm8xxx nvmem offset mechanism in the meantime and does not
> conflict with that work.

There's another access mechanism to pmic-glink that may unblock this.

Konrad
