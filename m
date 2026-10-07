Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5E3932C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369878; cv=none; b=rKtLlhzb7hjhmmseU7s4o8UHIJRywS53MEnNLJCRfK0ADTqrZoHNJw0FdWHgtS39YM79AB1twh1q5p4Z6VXEhEC3J3S7E0JUEXdLMT1XqA8UioA5wrroJgyZPbTo1T2giAdqzM0a2leJy2Jladfvz/sm+3RJZNj9HUxApDTc8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369878; c=relaxed/simple;
	bh=eKox8evQuuqmlMoftMlCpCcWaOJ7gtEXdoiFAv7AlSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFcczBZazZsnF3Fd/tuKM5E1Gj1Y1L7cn00qOUBiUEpoHi7AL6bOMN1fa6ZDC5Lu+a998gHXUo1+5wK2PvljrT/nD85fODYmsSrZkRzYHt7L00KW4xDspzyTHQtQ9tYrdUamFl4WRnImcV4kaibsUsf5Chp7L24z4xMgqsfnhA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MF6cfFdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC+5n22S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MF6cfFdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC+5n22S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977joi13298567
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=; b=MF6cfFdEdHHNKFgD
	ZgKaNuOLVTAYvrGxYag1R+N6qQLqVl9tIVLAL62OKRzZihLVXllR5K6S/sihyMDR
	eY9fq5KrM/7BA2RqFV+rs+8IMVnR2sl5q0MBNNGohRJOaJgQoFZU/MzHMRvr/b/Q
	Sli05XiINqSaMVynwvdzNNRMLfdD70wXxTI7u1YI2r2itP4bz88onwKVQ5SCdci1
	SAJRko4zuupUdd7mRRUFGJpcVuym/rld1Kb27MFnNZHEh5d5cgxLfSPPhaMGDFrq
	e3pLIgzobxuk1jVhQcjvExPbp5i0uVLNW+suDrKTLPF2bhTmieGNYdUILbQ7jM+3
	Th7VPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrphm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:44:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3639392a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369846; x=1791974646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=dC+5n22Ski5TTlqbqhbZiriDgyBW5fLaHzqQ8FXUxmdxxuCs9PUTBKf+SIp0/MoTQa
         SuRpeqX029v0y2RW+ONO/136BOOtWyGvPCTVua1EZ3TlH5QYZizp248A5S7AKPCqJ9ni
         VrwCZ10nkfrTnLlSSD4Qlucyleq5pE8fiEK1b6iBdo/vKFXc84TN5nNa7gJiHw/twjYO
         QGmz2gp3jz7nvx5XOPPXhys5ZpECCf29dPvdnLtRiDVuNi5L1kr8CjpFDk1yALUYf5oG
         9Df2OdfX4WnAYjRtXWkj2FX5cdIk/nPy5ZVpOIFkuNtmOggKmmXid6cFnBy+8ocu2OPM
         76Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369846; x=1791974646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Vc/NsNY9W2/CoPj7zYbbW2QO5iD2sTtuJnT5u5AiU=;
        b=ihBV4GTy/2xpJJrkrXsni3YoVXZDTFcrajmcvEWHhK0YTK5RzAkRSZ5rbC3eyoB0Qx
         JdWvH8bfvV3z2udGNF6DCdfn+j/4x7o1EpOp38Xkmt3RdkiXDsNw28Chl0T63prxztxl
         de/mx3k0NckoQAt5umTZq51HV/pjsGk88UgaCpAI/k7HUnBUACEvU8BWIfW+buqwXNVO
         mletf+mTOqG1lraIkmbMwmMIs4lHQeiafkExhHW5r2ZoTFwNU5YSs8ZMvm8kbbH7q0MO
         4eWP6hxtLX8sp1Viu9Gt+JTGrkl9JYcCvg18OMRY6zr82bLWoSA0LjX3H8DOZLPeuJ5q
         YmpQ==
X-Gm-Message-State: AFq9FYJT0jdh81BQekh7pfxgLIqXGy24ILbsvsBDKndmjdaao8RIohFg
	r89J+SpIGF47LxYbpc0YUG3SKvN61aHtVnyybAdF4jysP3rpkgtdl6SiuLLqypaLPaoGfPk58fM
	uadBeL5EHS/oAjZNGE1No/WfxwSGzSGs2qzTgcDbkWNX9qeyhWPWNDPOeYwfKvTX7geyK
X-Gm-Gg: AYBFou2sf+IizF1khqzABlVPhIm24fFT1oTbv3AV7xn4Lt1n3ONc3SidXaGbpJZO9CS
	0dDc64C7yFUVXKmQutySWlH9/LhCoHOJEBQCR5lY4VFSy3OcnYPVoeOBwv3RwIhwU95e1xf5XqY
	DTz0SJ7pAzrNfVXhsn1/c5aPCKV3ctf9e472EEvujSiL9eH6Pmzvlfof6wCSusBe+uLGBewlx+G
	igTIkMt5vjIzWcTld0SNAr+mwOhm2Dlrbjn9smEjwMqEZ6KRS+67HyAZj96mmaQDeB1KQWoV6qa
	e0agwJOdgitwMgGNCnquoSiTQLj/hT4BZ6WCYKa3i0fCtN5+cm5NFR04itA9F4+1EZqlN2iNZVr
	uALzK7iHbhApo+Vwd9s0h18dNaygyQCRPrZ3SYi6M2UAm/ToeG+uzbeiHD9D6H4/L2ukFeQ9ESy
	Gqi5BHuQ/41g5kLFASSBlxZVqj6ig=
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567176a91.27.1791369846056;
        Wed, 07 Oct 2026 03:44:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a8a19b1e33mr1567149a91.27.1791369845562;
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Received: from [10.79.117.106] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66560sm9393796a91.6.2026.10.07.03.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:44:05 -0700 (PDT)
Message-ID: <4318b36a-8fee-4207-a232-0581e2b2c69b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:14:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HMrTMa6_Ip3Nd-atdGajZ0540R0YU79j
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac62277 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IB2eJBZJimwe791p62gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX+BuzSAB3JvMh
 wlbEQSru4G4AbwKAqXzKOxqAYo4oHB8O7S90lR7Z3vQ4NbDZGDr9oca1DHAkmk6cmcenpnOGrgF
 3RbSGqq04PZ7w80vV3tictzNlH7teck=
X-Proofpoint-ORIG-GUID: HMrTMa6_Ip3Nd-atdGajZ0540R0YU79j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX7wGKmGlXRcxe
 GGKQXmfEU3JqQ7XUSnLQdctDpDgVpzM24Ps7KrRDca7Qph8tIuPjQrBs3eOCvrlk9uL4F9OS6RZ
 qlkNLune3ou4biTDOzAPqftzuQxboALX0U15ONzAIUaGL/arc6STVhLnMNfrbuGdOLjLG71GE2p
 6xQYFgdpleQk3sCAiSWxmcoRYcEXNAZ0P/C1Q2YWN36j6UiGQvAB81WZV18yBh0/c2e52NYgPQ3
 fni5slBseBGWVmtfbG1a3VtPWxTzzI9Xvq46593/0cDVN0geKMnBN0FgrJYMxFLVw+6N7gaHUlQ
 l/FhgKuLCnhOLegAWyJOwG9AwR/ARur4Csw3eCi8MS2KRaIw8ui3a66SWCSHxbw1yJDV0ntMes7
 a8CmUU9IvL1P/X0Go/D/i3HayKO8cR3e6oUexuqgYUKXRXGqVJnsPN4nbVihelrf0KyXlaJyHiS
 elg1FBYMf1yZwJQ1EDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042



On 9/30/2026 3:05 AM, Elson Serrao wrote:
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>   	                   +------------------------------+
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> 
Tested patches 2-7 on Glymur-CRD, EUD port selection and role switching
work as expected. Patch 8 (Kodiak DT) not tested.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

