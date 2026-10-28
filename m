Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201932;
	b=0ItQn582n5wBGYRJAFVBtL5PzLEQpdBupY3xbtbDE7ELfm5rlD9cduFuj65Au6j6PSgX
	 uXWEn3WxP1jxf8F1rf1+n/bsX+hIQZGhgWIOl9+KNTbn9xrM7KWcwnCZijmkUX8UDrf7z
	 ThdWbuPv+7Nv70NePvWcxNi+5U6SfcNLad5sFncPmEUFl/D2lPQ3Cm6AaHic+Qd6f+s+4
	 DPg2nM/iKqWqo9AFifgHAtHop7UJ2F3KZ88wAtQEchCjl4wys3HenhJBjccpKHUSlZ77L
	 Gu0nxZckvHqyxyiuHsUavt+s3K10yAJCrXvqshaSjOQ174kwFmkjpxkRYP52gH/ogLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
	b=3ren4CUA8oz/W/v0ggLoHy1pgt+Sc5HNWQ3R/+7fB0beQRfOejZp2qjote/m65mKSvCg
	 KTBARmFedzBFexeES39Fny+SWwXSnHJ9MSHhCd9QUDhkVQdqP0B82lLqfOoRJj7Uxx0m2
	 otnGBZ71p7LP6OY4eOP/hgrkPipc1NnX3qVEobmn8aWno8o+kn5jgc1vx3TGyaPAvHe1K
	 jeOSQpeoUV02VtskDIReJzjshXzB5RQYY4zj9XFCWXxHFH6PSsujp0wPF1izhtwNxoW9v
	 zuHN3rSY7BUjKe+UNnGy2zfYzbGhHX91swTdqC6M1WONdrRAy0O4lgN6DEiE+l+J2AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B0606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4HJ1471785
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HL3n5xlRKDyRhGpMHoz3nl0n
	GwGhziyan8A1Wdy6cno=; b=QwU1UGoLZJPPRN1rjKjGfwL82bt7KAKZeEDd5JdX
	lgGFryXJt2uQKelf7VO+9DwvDMUtXtsKW1QQ/b8wbqhfAp39J5cmlXdcbHyzgO2a
	1FNgUPI6aTo3UttCONl90/IFzcRGpRrSotR/6VE8gGRDUzj6sU8YmIXh2a17wpLQ
	yRA9VwfMCU67L5HawXfbG+X24BUce7/JXYTP8kVP0R/KBli/yCElfTKfr8Gi3FIt
	mtO6kya+5FGH+dMXA9RH9b9nC3hUPjqAbAAdiQUeeGMbnON6UuyNfDhd7qDlAOA1
	Y2p8jxyHgp9J0SjHhEeT34Vi2b4Whmh3OmS3Vz3gbGyMBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh7sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so163275085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201930; x=1793806730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=UsLvD3PqFbaKS77peXGZMcBuu4z8DXCkN7rEVnT/9rxbDQu/0IlWLXnFGe+kPSzljv
         nifHWWV6zi/2XQWOJGFSv4+iLTwhLa199r0Fw9nygP2u4dVQZTq/EaLuvns8SFt5Qb32
         f+DaeoT6RiFkzsoO/L0u+G/mT8KYEzjteB+yKJhBbUU/iSMEmE/8L6igzItnzJNmg0sX
         s5Wfgwz0tRRB952I+J6iMoOurk6voHot3BYCkiA2iC1BSJ3pAzztbS97GHPm1PE7ALcL
         LAG8zs2i6W01NZI0Q6OB5ixsqg5pSUjL+kWEFZjhWXj13kpy/kkGv3yO7nY9fybwKy1x
         0n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201930; x=1793806730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=SsGDNdgQN5lD13zK0nRd16sNoXI0EQ6jLUJVJ0nOGdVaEGOwSq8yMMbWKklxp77p9n
         cKIfuCP2UqFZ9F95vcZ2NXqdokyVfvKSkYKKN/Q87w+tFfXlN/FPoT/wEoZvDmjNEkDQ
         tQpPqrIqK+4Ow5cOL6TxphQIR+E1/cB17MQf84POE4L1N3B6io/8dopKS1xXe0tCi3Me
         +C8SZZlmxfMJZIExG6exL/937f0SRyWHFYBdiD1DN4xPvKLXjPD35JdVDe1KlMZ2znXk
         WOW/GU7SwSpbVEiRQEZbUIjjeeEjQWVzmg9iZu6pY7/6Ca5uVuQF/x4n76GYHRyujQcO
         v5Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzlX2zcpf9o+tZQRRRIsfhNMjqt0o6FcIFIB6XEjaxgx5F6OCzyhLtRCxMQVSleXksTgyZpTdz7sgk7V1LW@vger.kernel.org
X-Gm-Message-State: AFq9FYKoc7k4WsKJsyqiaIBAtH1QgayPfvYXN6Ozyz/gY68ujrgyq8tx
	XC30Mww8w2rGS8RPd5Kvm5326TqnJNWHFrYRq1IJnwLyJVTPmfLz9/C9XobkXrPkIwmvMUfdwoW
	/mVnSRjRASeSa4uBxbyDffmMvQZxaWtlp8TFugBmpvfaswk0G5QfePim6dOIcki6Qjzad
X-Gm-Gg: AYBFou2t4aHFiYcAPsNLg/CqQfEUC6gmpB06+Z8Iv1XVivgDSYc0ckjsjJm9DCSKeGL
	l/uTL0kNBqVzDyaesu9t2aEGWHg6CIeFYW9Xlf398zXueoF5Youl8MZSyaufh60OU5G81mJ8wLH
	ToQrlDL3+AuW5iqs5+PSwlATvtHinbwmUMZLNEIlOoxo9ghBaV8ZHdB2BRFYdQu2jHbLBdiIeV4
	4MXPrERHLdQSrPpvuXB/0vsROPgOzKwOv2T9X44n5iyfqqgEYvEAoWojInflLS2gu5uJuYNgWjf
	jUAd/uEANP0wcTrEabx7SjyhB2HbRW7wWFWPQMRrWSfZXNUqn6Iw8rLU/e6bop0XjLqeVAJ6yn6
	WwmlNT+EIqUOWtAXHpM4/rUzZMKbQmW2PgwYBsL1QVS+Tj718bOtg1cGTQ4noVq9qZw==
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381726185a.15.1793201930337;
        Wed, 28 Oct 2026 08:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381720685a.15.1793201929666;
        Wed, 28 Oct 2026 08:38:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm28945e9.10.2026.10.28.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
Message-ID: <46qu6w6grb2alv6f3pnvefbtbruoojwemwop34bdehosz4s2dv@l6ib6qgzvmw2>
References: <20261014234949.1730808-1-luke@phorex.org>
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
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXxXXL8DKG7Ijg
 Eu1PeF784ud7eKGF6fFpbTwirg8wLfKscZWd42+9lePfC55C5su+3Z8IDSNe2lr+Lhk7Yyk4E2m
 mJW04sTVN7BJHCzPokb+QBdlnzywqq9I+25sSWOCtdMOM5AuIjcKMIdtfl4yhDLyQycirbjWHw/
 Q+g0Uus46KdWhMs4tO8+Eicuv4HdSCAsDPLx3McmB4n8xHnbO30atB7WVd7U/kggJIanqU8iF5J
 5Y0z/aX3WEh5TvXgmdjv3tvp4zuwjrhM4wWxisX9VGZ7ySn3uqN9RfnM2QCuo9/fB8YG/EZ9pit
 DrHPPJ3VrJ+FIbIgujuRp+q2ALIFSrX04Pau75mULGhztRevjG3V6/toPpZKTc6gK4rhgwvJNPX
 hhNoGP2mo6Nkfux6adJYluAzuMsJ2EvkOzkuhouO7SG66+UaU4YjJusVUorfjEBl6BgLEkfuIFd
 hZrq1ac+DQsO4IpSVNg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2170b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mO8_gwkcAAAA:8 a=EUspDBNiAAAA:8 a=1ncODQROBz-vSmanY1sA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-ORIG-GUID: iK1Qfm55i2yxrrJIlA2byi7BWod1Y7LI
X-Proofpoint-GUID: iK1Qfm55i2yxrrJIlA2byi7BWod1Y7LI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX+HdBLGhU89C4
 Rnmlz3yi4ArkAc44VtyZ/sR3O6Ev2ez9+/n51NhFJ/2LwcCDTnVMrIzIX4V5HZtz5t3I86wC6g2
 Pr07NZWRz/jrh0UpcZRBP6fYoj1F/zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-14 17:49:49, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
