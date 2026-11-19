Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084309;
	b=kWOwiRC8OhtaeCmNL85Izo46YHxi5HAXy+WAdNop8DjpJuhg9lvJM/5LfTBK2Rjok0KK
	 kI3ZU42AtaDJO5/26jKWtaUQawMH/9Ztc2dIFCDlabJCWpGSvaLK4MvMNd7D1CoBocqih
	 dOifc8Jgt9VOYu1HjyFFBxIk9JX0miTLceu49eyGkHjeLAAZTnnTrYssp7q7zfEbzGGAx
	 edk9q4/WVYLskcJb4WB+/Jb92S7RfYT7k6sCjBHr98ixFrZxtRv0aVA9I/QHUf/SML+sY
	 1ZoGevbspUosuiWtmPmNFgUd0JsPGikxY1pG1ZWIm1C7R//bJgyj1QLUgaPdEt4IXow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
	b=VBIMEiTP30z8QfV4a0jN79hWqzh84pBaFJ/rlqQjwIFkeG3b5HCUVJlICXFv9OpVn/wT
	 C1Qc9WAjLE/xPl3LOQWzx7rWwtl+tKcoRaD98Rm6S1ZWzvrDQ2jmC2x8rS6lvsxFuwKiR
	 5yb76vtRP35lvjYUvEJZ9/yWMg7GUV2amxuPD3ydK9AOY2MRGoi/zlmZRDqbh5TE+i+eI
	 tOAx4B18WX1QBKu0YmHsb2IGrNW03E3BrUL8thMDpKDCsmBI7/8Uxf/6ER4CSJqfvxV1i
	 ZC9mETrZubgoEZ7CuTcIXdGCQbt857k7QCiqHKYiSoAFZ3Lt4iuu9Q5iAmA1gGFM0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71216606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71216606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rt8QaKIr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgQqxjwU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wJev1007304
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=; b=Rt8QaKIreejd4vOo
	tSBSvpkwnB+f3c3Xf5lf9BqbTgQip9zblH6bavvWtEtSlQSsjXlvTt2j4RKSMWVu
	OsPJFbYX1ngJEuTAJVwuY/ZfNkLokyYV5yuJXTRCV0h63x8yFPeGnMDacqH3SJmy
	ZV+FVqpcYU5GlURs0OjYrYAC/JEfGq2IyA6ZHnFepCIvrukZAOS2Ezlz73pj6lum
	KEsgLU0/W9QfTNg74yP5TOoY0+hoXkaIKgHyMmCsKIhArpXKBbL7h1O9eTxAr0cL
	4TM35j8akQVEbbrP/GeH0QLIc8FuLnkyJlapE/VyiA5zZ5lvLJLHltZ3WTps7Rlp
	wwtvzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnvbmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:31:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so391076885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 02:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084307; x=1795689107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=BgQqxjwU7nXEsAaxHrXhATj9uNnONr1+q4ln9jpgINdJGS3qB3nozrOO00PX4W5XRr
         RV6m+jti4g+uTHJLaS+WAL+A+R0iUpDwAYUJ+PSWG1UFyuyEwglxHEv52TpwSFJnw9DH
         k1+wqxRgQ0S9kLH8pHUuXuDc0mMRmfuXGt7Qvfv1+fSZTzp9UUvhiEZ+ld5AvKu0ZiUW
         rnMWG5FrCmetpX7q0fKmcaJFirv8hTVcnuXrBKlnNuvqa8ZLtIo4fVyLXXDGTLatM/95
         GkrLJJKK+9SxQY7UC6tV/j3wP/hc7CjpAmNybFrzwNuso/wnC012ym2vcExjpqnAu9fV
         oolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084307; x=1795689107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7SOOLu4G+MIx/n5d9fRiG+tkN2TgoMcpVaaDx9UbOQ=;
        b=vqDmIjtIzgVR7iMHkg4w42MdV9YUY+CKG/VKoWsuwtgJ88mkvGdPV9ceEZe0qzkBLh
         mEdtHP223xz1GwjUUIiJTuW6QmPT7pHRHeVNIN4RMWA7uEeB9OAE2jeKrWNhGrS2wseJ
         SB6hEDZlFRLo6EHLguKZ8LBG6riZeoyOWCpe1O+flBJVsi4RrjRj387XmSH3BAHdBlTb
         I1vvJ7uucTBBNnkyQ+ftAYVYPuBzxDcKJxiIDy5KANOwqr1YujTAU8iKs7bw054+Q17s
         xtzQiDsVRu1TKmqD8qv7VSW3+6zwE2Rqgw3kZjpUS3Y3GgyL7kMbcmCkXx8w0ExJcnmM
         Y77Q==
X-Forwarded-Encrypted: i=1; AL+hErEw/jc3x3fUJNsCk5Cd9RCeFPt4e+UyUOgYd8thuV8028HeZbruHsyxvfdbFk5vwRK3TUq17BR+rvx97xge@vger.kernel.org
X-Gm-Message-State: APuU4Z8s9qzL5Qe3GDdeCFFefgmW8xAv12KPGLJdpJDmajYLRUqBV8d/
	ouHE6CJrtqEn3jbqTSOGDYfnkWmtgZ1h/IEe2RQYc5wBYoYeG8v05J5GP7H5VT5pqlsUDgbL3AB
	702Gm1VbuBQHnxfB+q8aPD8hs4S2HGg7lh/6HFJ93QnfQE9x90HXEcsh58KHocvT3ndNy
X-Gm-Gg: AYBFou1x0tm2SfSnuhVo1VKgrz1o8SOuinqIHnDBIP3e5CLcuWDdWN/t76u4l7i/mk9
	e2kGGJl90+jPjBncjsv76mijrlMqBNTiOThLqBUH6dSJfos1n365UsRJDlLU3gSF2ZR0ogS6kHw
	ZiFOMOXpC9gxCxyQEBcfAWNRrh9FtWSd+XDeUM21Siwx/t9VNcCoFP9dwRk+ybPK2YDE5UvJrse
	pdwkGfeNcb6+k1wkkOuFycatFxEghEwG4uHJW088r7Gq4kTTkYHlKaF9zebxPbZi+sF6aoBDAKS
	rnr9bqZmvaGxLG9FzNUnnF1JzwURxU/UnCv+orGl0w0JTvEOxh9X56mjuv1AoJ1pw1uzzs4Vwnt
	FraA9HxVF2bZ2XxeZL+DRnVAYFwSvBDLjRuDYmgqTHhXpvQeYhK8DObuAtcUthISFYzAe7JKnsa
	E=
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085618085a.43.1795084306647;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:93f:22f4:f0cb with SMTP id af79cd13be357-949995ab612mr1085615585a.43.1795084306168;
        Thu, 19 Nov 2026 02:31:46 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm26124995e9.5.2026.11.19.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:31:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Haipeng Lin <jimmie.lin@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
Date: Thu, 19 Nov 2026 11:31:43 +0100
Message-ID: <179508430131.48541.2060654933340230751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
References: <20261114-up-sc8180x-pinctrl-dual-edge-v1-1-aaa31ad633f3@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afed013 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_HFaMYOssqv2UMXnlhEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XhzGZ1ISgf6VMD_LoiS-2fCNPBBJReJR
X-Proofpoint-ORIG-GUID: XhzGZ1ISgf6VMD_LoiS-2fCNPBBJReJR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX0Qzh0VNRud7B
 /+5Wpk5ERYpYLhU17YVpb1iZ08xX5vKxfOSFEtXrBEU304l5Fg8sttCk8H45SCem1NDninWE50n
 uKrP/XG48g7QxEf0daQwPuksn1HFAro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX972EOUaXy+oq
 SPWVbjBi9rTT6p7vEvAfJI/9ooCmmmByN6tIPgp1oW4DZM+2QYXjgkSYyezGe+BTcGA4nb9AlFp
 mNE2P//Ow4BxxpGTvyVCMwdIlfiZ6KUTw73fylPAP9I1A1gR8CS1//6RYpwSG4MfVE1s09k8MnN
 z4Ms9gBJPgyAUtijYyNCH16db6gz9wqpU8UPHFHOPUxBQ4nLM2LTbFgeJrqL7msNgf7MKacAbUA
 7SbFikOdkIXADBhbW4kA09JAh1PNmoh4EBmWFsC4kCfnuwuwqzORlxpxeRifSOA1WZj7dHxHqIF
 JuLDZ9rvM/wxzXcGzc9kmR+ry2D5bMBPWvoPOtiY+XK+gu5kUHwEp4fuQx/4IZXUxdOYWKIf/x9
 vs9GI0WuR2xei0clJLz6Iblwdl6yr1JSLFOpDnxoTWvMyKrkYBQrUeeZxA/je2g8T0C43LeNhUY
 i5D+Quv/p46bwzwebXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041


On Sat, 14 Nov 2026 01:18:41 -0500, Haipeng Lin wrote:
> Wakeup-capable GPIOs on SC8180X use the PDC as their parent interrupt
> chip. Like the SM8150, the PDC on SC8180X does not support dual-edge
> interrupts, so dual-edge GPIO interrupts only fire on a single edge
> unless emulated by the TLMM driver via wakeirq_dual_edge_errata.
> 
> On SC8180X boards with a gpio-keys lid switch (e.g., Lenovo Flex 5G,
> Surface Pro X) this causes the falling edge (lid close) to stop trig-
> gering interrupts after the first suspend/resume cycle, preventing the
> system from suspending again when the lid is closed.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: sc8180x: Add missing dual edge GPIO IRQ errata flag
      https://git.kernel.org/brgl/c/a67b4f18ae1c0c8597e2e4804c6f5460450418e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
