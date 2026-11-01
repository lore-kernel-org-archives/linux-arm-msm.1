Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540267;
	b=5dZzKq0q1c3oeyOW/cMH88l/UlCRgXHR+cNdkAGNZvQDrIV7CnYZFJEVBhP63Tvbml8i
	 jd0bGCA4Ab6HtdbsnTDk5K3xkRCX6UtwyoXRDZZce5H/1UGUGyTmFEYUV7t4pRGkYnLeY
	 jrzTHsUTwkuOg9Dh+zz+/FfKNUnpi+2zQJNcLwMRoqgG6eV2ONyzxKsayK3KnMxGKPCPn
	 F/yI6lcYlQy9k2JX8BbLaU6GKDDYgm544RGOIfrKhxIlJ8vNy8DKbE3Rnue3ap1EqhW2z
	 DDsN8m+upjJ/M08ORQJU/UcCO4cvf5Aqxi4ZUzA3WePzeQxWib9Xmr+vGeHPeAn9FsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
	b=NWH9LAGlI6teHtEnrv0ETqltC2hsvc0dcSuLQFleqpqhEUDMKgE1MKur5NXnv1k81sr/
	 osUlKjnSGi560FQi+6NyVnMzquT6+9J4Bx2mRz8es+7jRMT/osjiVTZqWjPqSNsIYP4sf
	 W7Cmbu1GWtVdzMUwCy5BUozKXrwt5VmWlr/kW8oWPVqGVzxWnDnQTtrV5opgsdWtU2606
	 aKDSx+YB/1GqHuj48ms9qfb5FmDPnbGJduIW7N+z+UN3nqpZcVPhNsyhGQUILIhN2j9b5
	 1afFEzxsoB7dQzxt4X6yUdCr43y2VP+P/zSbWobMqHT+HpvzxQ3iIBH17P8gfzQaBRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D4606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 13:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB7D4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hy5n3c6w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FOBPMW3L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1BHKmO3824030
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=; b=hy5n3c6wVjk99iUm
	GTO0ipvPEU4GmN8j1ywo3HUCdo6gKV63UgpZo90/cI24ZVC7T4z3GTwNoDsbNXIU
	Xn7JO+KbH3Zdubva4tt5dXVcca9GTW4Pl5YXlXUQArsxjjaVcjBvjEo8rln9Oaam
	iE9P+h+OYJSNwhw6GPoh03vjJ93kFB0eiy4+GlTO5+2kzt7o/Os4wiBO75AE9CL/
	ctOwpQFYIKQVhD3QTQwhzacr3VhVl76ohnX+k2ALP2d9m5afIo0wQxW4sWym3Cgy
	YZHLdtdC4YKrvslSK5QR4kTfRxpuLtWkSM0YaNJ+LnaJVoAK11ew0lgZOi1qFkQs
	c3ZwCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7ud3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so187314285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793540265; x=1794145065; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=FOBPMW3LQkSm5q1Ly7cWyNuCzFpoGfxBoNUdSQdyOo9GlNgTw+yjPxlGGcWHfMAFg2
         XAF3maq7q1hNH/TJWmib/9jLC/zUO9EkO2dSvSiJwqF4FCbOhuqo/Wlj6X7YYM01VxHi
         kP/uxM0V3URgmyhe9KnI99m9fnYTETh64at8j4o0v/cui6Tuk+s+nWgl+/zM12h+3nWH
         NbQz7Oe0aQAoBfBQ4MYgqKzJiNgFtpTuYJ6GBpq8daKNXnJ8CJKTjrAQLvPbMd4tUoEB
         XlBicD/jsXZLxEpm8VbNKtR8ekT0AY90eVIFsDlnRDB2qckmdEYa9PF3WttMZXPVxBql
         KKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540265; x=1794145065;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zml39iM6MR/ygN8wVRI24Bl3FPpGOdm8F9HGs7bPa3Y=;
        b=wZfM6ew6p8OKjTP0Fha3Q6tj5FYgN3ump4pt6/A+fJ9aUV2O51sBOIniZeuD1q1TAV
         RdTZ1wdD8EB6bqxolKZTbAUBvwO8E8IEanmAWNIBZuRVIXkyXPIehFCsMFQLERkdbT0R
         xMDUmmUhxqtf510k2Ub1opmfPHE1+BIFEenwPpdyTpxnj2/OtJiS3naCjG4fXW4d7OsU
         DhhEvjVbhE7nZdpWF1g8czO87iY4R19yi1xv6pF7sD3GlICXGsAeK7wj5vX5qyXiOb77
         zplEnGdlGmNfI5MfJW74Th1RRB+XkNQnSbWFsn2iBIZxyI/1JFSfJ1euNw8EPR1GT9TP
         UWhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBSFOcdtpieQNQI0AUx/YOONIUtrnXHbTyydb2I6Bv2qF03EBTxgVN8WdKpMooSNIhaTy3t9k+4xreImXx@vger.kernel.org
X-Gm-Message-State: AFq9FYIUFPq6wW+iIKYAuoU9tk7JDwJeSAE9I9oYU/dmu1LqYYx0U4Oh
	cLUy64MCshn64NwvjF16yYzhjeTL89+ZCNEixRntnrOXi9WZYDGW29E0MKmvg7Ga1Z1jRbYWfde
	dFk3laViBKqRyh2X3RJQ9gxJeLz4XvwOSX9jz3XvJWswnVg3C7gY1Zr+yi+M1cSGMnjUs
X-Gm-Gg: AYBFou2lZjpSsYfKDbXZIYgSeHv2nu0lsP9jtw2yScWNVRIu9MwIZVwQ7PA8NmHmWiq
	82A6jTuiIK0Ug5dut5A7WnzWvhHU8qNxbJSYxm1EobUk8VP9LNcxyWNIA2PAcmPrvfwHr2852XX
	PhDqdaGtFPa0A6FMStzdTViPVd77N04YjEi0iYTWmkNfKGTM+6vgo394BuGqVYlp0XiBB30FCHl
	ObdBbhEiVl33OeW1NkalA5HVybBbDk0v8WxxNOYrcGu/jDAWALX5IAL2RjAtRItTIfMAI0dWXda
	FyVuoHXura2yfGFpQfojxLkgdCB/LKv/cO4156yZ2WRgBAD8Ia5uqHcC6DL0iZbUoumX1qf2axq
	UKp3IJmIKuR7IfibZ6dddgRcROb+UUlOPlwuG0XqEX7hd5BAiep3fmyRCztsyNAE=
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299172085a.29.1793540264867;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93f:211b:a7a with SMTP id af79cd13be357-944216b7a6dmr1299169185a.29.1793540264396;
        Sun, 01 Nov 2026 05:37:44 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm14029011f8f.43.2026.11.01.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:37:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
Date: Sun, 01 Nov 2026 13:37:34 +0000
Message-Id: <179354025489.2686703.1864959237402110457.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdvitGyi+DIn1dy209zldQ8u1g3NQ/x+0UQJ6J50KDg=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq50Ch+KOlEeSf8bGjUIvznUwOG+mV6MffOXTSk
 FOVArKpaHOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaudAoQAKCRBjTcTwaHBG
 +MqID/9O1uPoWpRwRV+yJG6AktczcmsHm8L+LmqPdz4L7UOSZPrPkxZpSgxPtP2OeArT3dQ2t1d
 /fWDLke81cc78ZmFKDU1lkYgLLILsCDF4rIQJtYHezMz74NSGsbwRrnUZ+A27GrU1gUyS6uLJn5
 1kMx+lBq+MP1iMSyZLeTc87dY/k0KZSEGUkT4p06wvVlnF7QDSV5hdNM1pISAsXbULxBMWr81Qn
 kEYGRTcUK7+ressnLeVGClGee4ZUHpO2aS+SqzAYOHg0lVgzTunXlOQY7KIUTDffZpbEuaAC/Ri
 3eOOnJ/+luvFU+bBM1PL7ly2EMKNToaVGLJHmUYWWyoGUPpInmQGsRohLd5HpWH7y+8/QHFpelr
 /ATS+Tn7TD+4BYeC7iNacTF5YswB2cfxeecjgPV3eUTPOL4nW/wMHXSUPIcBPXixa93CMmCSHa9
 RLpryTpAOIegFe8/hDKyUSF3UeXz6y2LDnpVFgDxIlWPWp8fX+TGDqrA0jrwQRksz5EETkC3hN3
 u3v/3m8NrbYo0IBsIxlyrtVKXlPBW2NjQzdPFQOT+F6pLQ7IIiJ7R3lroWyNspIKH6HayzD+tNC
 HoTMtrKA11if+zgSm1Vq/nfD6mwKKqhQ3qx0xrgTahtPjgeKRutlRledxyxdHXFfT6rv53q6T7A
 96gJy802YO1EvSg==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-ORIG-GUID: chdNsSt8xd96_FhYYRFaU3-6rkFwuHrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX/OqC/e91nFQ7
 eTzyWo2PAPgZPEivcvacwYQOMWfHm9018BoNOndCMuYz/gVFoBkXBoTLTXBWCEP/GKfwxZtssCl
 MrWkPCVYjsMRmvsxhYKKV1bf0FM/sEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA1NCBTYWx0ZWRfX3ZS4BGvZOlJ1
 AMQ/kogn7MuzZGYY0R3IJW9OTtb2i0M58Jn8QRHruVf0Sh5C7s2njwkFqBjdvUBiJf4VLIs01LM
 rzZsO1tThXtF7c9o7bzPpZUzhRK5aQyMoxIyI1J0Qw6lDpJaZETNQeZi3Xlts3P0IOEiNpYebnV
 iFX3oywWzWAX4FKxSnmrd9/vgkvYuhhK0z9gNtSqfHEcw90LBqeA6H/ycmyAYmftML1tcA75r8s
 ajP93JzA2wJrZ4/1iruSNdOOkV19Sux6EWarLCp0pFlCBKnGsYASMzWVE3tsW0Rx9x3zPg2XR2h
 0AXJa8s/4AfzvIudSJ4DR9HdgfJInhhqZj4EXsUCeu987IBl0NVfhPIs+yhZ3o6wK88B3jxNppW
 vdwhs0kzb14B7ded8kEYzCCMndekSU74N7yu3WFSLO0SGJX/8Eat6tzrxaY+00yQnrpDAqV0BSC
 xK1BLHSxpQcT4kYt3IA==
X-Proofpoint-GUID: chdNsSt8xd96_FhYYRFaU3-6rkFwuHrV
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae740a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=mO8_gwkcAAAA:8
 a=EUspDBNiAAAA:8 a=DTIOQyTOvEYwzOPpGJoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010054

On Wed, 14 Oct 2026 17:49:49 -0600, Luke Macken <luke@phorex.org> wrote:
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
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

