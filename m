Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401776;
	b=H90lfR+/0g6hLGJYFTtOzT2JOyxQd0wG7ldrnUo6wVXd1A+GqRhD00pcZtfPrVaDiRk2
	 1o7i4+PgOUrMLVEvH2MWceC4076x560Xpd9ZsUnuZdY/f5oDd0y7ybnj/eoKvJhiTfR3A
	 9WHUZFZ4A9yRMuyLiU7LAgwhWcYuFpg3A7Ef8kG12cHjDrXPO9IIsuF7gzjo+R80psp76
	 nONJdOBRbLP1sivTprVTLZTtOFwzCrBoSxHZwPRxiPA1PtKlI6MgWr8vEZhoPEh2knLNd
	 R8nX0zWMMQ9bMn8B0Wa3cSDu1c12eSrV/caVSfzIyVw8YznZiMyvFl54ZwcMdL/d5Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=;
	b=IaiwW5CQ4h8R/1NMJtugJxrJp0xzevHx9uNNqPYb+DrhthHomXt9AYbYB0WwMVNkIcNu
	 hJ+LVROvpbfqCAo9zkd7CkUHx+jE+f6wn80NMJ9Xv/xIGZf7kLx7/PubvKLJA0kDQrcLR
	 lQjT6f9LG9y76kGFekIaYPsH5zSWs32usPP/uFUsasO+am4e5r016td4w/hDV/QPjtD7g
	 suTIHcxMb0xIdjP5JhGNrsbI7NuTpl1FYLJmwMEZ+WZlj70BJVYsRF/7Wq/sHO6WbVxdF
	 id3G2UJ2IKUhQsmfRoeqqZ4392HyKxvy3qlhvBI72QHImlFMEPd9GE9fYehIjBw3OqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOoGQr38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgrcYp8j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1404606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1404606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOoGQr38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgrcYp8j
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ3nf3292085
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ad4h0wJyIiViI+9hJbiLak5L
	oWbaFHwfvyPe7w3ekM0=; b=EOoGQr38r8lZ5ngTgdTSXrBTWm0mohr8VVJE0Abc
	ekrq4b/SNRhVK6MQ2PDMUwqLNBRFh9L/W4mSzvO5WRIp2qCEQU745X3WTC2Ewn6A
	+9fLMovA8b/n+ga6+WAV3dRkbYbJMx2PitkxXMx1/pBxuvzY3RSEL4Zk/3clsEtp
	60SUQMWk56LQdQlSRyJ7yHl+ochr+solJK010jq+TPVwb/oXujB0WOxtetKzArCK
	4yZjS+54tz+owNTXfsmjqiR8h7Q9A1RWvs523gjcxfuyjTTaV4pDLXi+VI8x0n7T
	jWAIZY4/jLdwTNL6a9Oc+oBu8WqpzdnmslSRbhHH9lMQoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2ja3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:56:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so367739985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401774; x=1795006574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=;
        b=RgrcYp8jWzSn8H3IEMN8vjMRuUaYWJv1DRoh2LGwFOzsmrv+0auUy+yVBwNUqo6ulK
         2LAqlSjBQAQrNlqHBJZw6sTS0Jsk8v8qS7bNF37WVte1FD9tcZqb8tS+HjxY9E76wUOc
         e5bKjf735iqzwEiuudI/fy68eiwpB8zRPy/f0kgJSl+FK3GA1Q/VpxWeiAvs2vvK4cB2
         HJ+Kb1pE65ViPlAPvvxRB5bttgO0qVjjcwsotEXlpaBQCSqHNRbJPQBGbCsa0wphlAUk
         YBg59u5o1o+ngpTV2x1TADpu86k282E7lvY+uqRXwzRo/bsg9klx7wXJDEWC4FVTbGnk
         7VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401774; x=1795006574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad4h0wJyIiViI+9hJbiLak5LoWbaFHwfvyPe7w3ekM0=;
        b=gTUFzCeUzyBTmQ3P8tSGbdkLY5LqwTkOO8nc4eoV/PpZvUUXMlPIBkiqTar75RxvH1
         yOSu2cShnT+8dWrDoYfmCpBiVEWn/5Las4sBCYlxEb3Hm08/zj0j+eh4F1RWXtfP0Gvk
         gDukui6cQvSvsiQOWtDPUNlpNjvRaL1yuPvMV9XRReP6lKhRSyZl/ysb25x9wX6zbzx1
         8llXafdAOQPhcmqDOIUk4OmqPIbvLN64g75Kl26y0iirFIKSMj50Vw2Hl88R2CINhRwh
         zVP5MeRErEgGNMCr19C6nTwdkfUGTV6PY7KvAf3sQUfBxJmlvxsKZKHQeAlecB/1fmTX
         tfCQ==
X-Forwarded-Encrypted: i=1; AL+hErF8GstM3IEuN1sDZz+mNXlUNlRKXQU12cldYKmGFRIQFQMbHyVYi0SDAkrScWB+foIgAWnDUkIVE6neBjdY@vger.kernel.org
X-Gm-Message-State: APuU4Z/qSX8NGlSf1Pd+pAjEdkxXm+xXh/lG/JsCPpzAYV1BMMLUe/XZ
	nEY5FXcQhsWRFrhTJk056vHHq5FFcP7pdM+Y0CQgOLHEuvTevoIL5oCo8StwObHH5+E9Opr7mzJ
	xyI4DnPDVc/d0b/2lHwurtXQZsFvd0j2US4dIvHTb9+PVPml9SMKGGbLtJkS/r7d/WPX1
X-Gm-Gg: AYBFou08Wnz+yi4EDPUpXeoR6JZKp7GcmLNeOIaNcX22IdWwKGBtjkZ+SGhTdEaMi7r
	Fl6v37OekcnqXAOA5HPe+JKa/IUO/r4qvdZXsak+6XOeCGZoZitQ4KTonAcP63kDvVnwL2fRcoi
	ybbKkTJ/JQ4/548eJVqreykyLhvBcAmz97DBwLf73VE4HkZ6htG0J8T65OReNTxHOzll+MufNr+
	QwI+6fzS/8xG9DXcUL3fmF/Ebzddi0+bFbJn1zfarKwQ19nDwqoKnXTcUKSaHBondsrWfwmed2d
	9dIk+khC84Q2cFliDfQ+rxrKXPjOsv51DlTQ8f2LCmuhe8dVFCwtRvN9tKAsjCgAJkVuu6jDu3N
	11A59XuMcaiMUHF9zvQRY2gWfUrEnBPL+oOYYfmEZ8WUIJHWlNwqZv9tbg87Dog1ssg0STcUdvG
	MdKY/OzkyThnAIWJ6n4Zo+EQJqCdGWUmJPWsGh+1AlfGockKCAAEX4w7RRqU3Tig==
X-Received: by 2002:a05:620a:4626:b0:93f:237c:1019 with SMTP id af79cd13be357-947b0008839mr373463585a.62.1794401773685;
        Wed, 11 Nov 2026 04:56:13 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93f:237c:1019 with SMTP id af79cd13be357-947b0008839mr373459585a.62.1794401773202;
        Wed, 11 Nov 2026 04:56:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm4886431fa.19.2026.11.11.04.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:12 -0800 (PST)
Date: Wed, 11 Nov 2026 14:56:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
Message-ID: <wbvkoyspzusw37aftgx7r6trfq7xdhib24sqijgrm6gowsnbos@gehfvvpzua3h>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
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
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX41OCiQ+YJQJ4
 NPm7pdSOlYESod0iKaj47CVW8FVzFLYm6Wrb+pGhSjgG1jMRihtVLLk0phXVRB46/iGNmx4ZicN
 XlVaDER5GlsBCeO1Xm9QlJ0RZlQnFCjEhqLy+p1nYqDh69dURO42OZE/6++LOS7TWp34aQoFxZR
 phoWKlTXh5KGYL9tWQNHwWRqByZ8svaRFfl/Vfwex/HMAWkVeMTJiFziTz329/4Pz4aCj2eqwQN
 jNTuciinznHMSPagNmjlifpdxgMpHucp9yT3ZgbMtgbcZTpk/Qth1eZS7tfLG7ciemhK6fXY+DR
 E5ZWFCluCKIUN2d4Oz9mfKJP2TPEim6FHWxJGeVV8iY6KrFRwzO//mIQT95TNaUnIJWH3NSpVTZ
 gaZOjBstfPN5zcfDmexNbUjvrg246zU6qDdfcjQez5h5daBgkFvU5RyqjpMwp34t7+Pk1ziTFVi
 zmB66relWLxr6uYNM5g==
X-Proofpoint-GUID: vSl3atl1ccTbabqgjm4ZBz29Ca_ps5rb
X-Proofpoint-ORIG-GUID: vSl3atl1ccTbabqgjm4ZBz29Ca_ps5rb
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af465ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mx4ymb323s-aB6Ux9hoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX0d5GaqpqqOR6
 4ov87gSQoCftaTPNlr0azJY0msmd0de4OxDyYvurdfVWwpH49SP3d65FVZYimYctgS/8RGscOW0
 LlOR/p9U+uuSnYyF5iFQ6DoaNrwIipE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Wed, Nov 11, 2026 at 12:53:08PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 25 +++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
