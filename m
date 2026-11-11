Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369646;
	b=I+EHqS6CwQSOcJ3zdn1IGYVbSL9CtyeejHtklyQF3q4obgyLltp+rePJmKeBzFfYqd47
	 4+0PcHPtvb9F4WiVnIWDRn2nu5DF231k5sNBucxX5Wz6OgMBINonAlUaoQI0gliI3HKSr
	 lDxj4bCZUuQnRbhEmwAURMrfWaDNy5QaiA5jDj0eJ8k8iaH0TCtR8kTel2ajRLxqYTJ2U
	 6/VzeSp/MKDQiFcgjvLMlUxxLiSo0Jg31NRVGKyUkJdQfIit5l6ZDpBhBDm2FPDZxCMnc
	 yFwU4fbSXnlLdWITaGiHyYS7jCvYR4tK2M2c2o7oeyaEoo1Go/PyD3E+ShwlN3T4hFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
	b=iFCTUKsg7gGCvCKPnR3YPPQzyCTJ39i0OLHZlzJZb8P0ZgpKRjcvCwOuyo9orZvnMtXf
	 5NgETTUv3XyGuGRorsB2DiTU0Qfr2zGvYD1tIpD4lKGnyXH88t+nL5J1+Z6h/wL93qvl7
	 GHM/c5UoIoA5Dsqh2fPgVxtDVC8Sojc6wW8fDfIbLio0hydT2wufniVhUeRO/POmeZ1NL
	 CJle1ymwy+ehANJ/ixZnf32Gx+Osv+jPMHwwOgeO34zx4tFXymuxUMlz93cwRn1czmc1a
	 cSEIRe+PqJShV4f5HbAYrxIqndNN+pKwfPDgWXssPNvZvGyojPQkzr8X6gYTTdV+1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016D606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D016D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1ta8G923327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJh
	SOTxy21I=; b=FH2Z4Cpp50sveYA9YR0ZNB9Gwvy745VBjhwlYRsIhZikOFq5p3j
	kXU4mwGf5GNYAeauUytxS5Xny5LWwATbquA15HEW0/zGQCM7eO/gBp6A4DM8TtNu
	Ss5gRsPHJgDW3rZOtnsHGFuMOGpIrhFWIjXQRDjpxnKn1WQa6eXANUUtnyuj3Nj9
	6tm4zlinmG1GETMYf4JvDiW69iTOrq01eO4Y0KxDth1Hz7TLeez0J9hhqPWgLlZU
	WCPnxR4rn6pGKxOZJGavmH/akD4s3JZlJvYNL7oHJiJxOl/mhphp5Wy+4ZrL0h4s
	I3oeI2Ohu9i73AXnNByIYjNd77x9xEGOSLg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpegvyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:00:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so3978488b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369644; x=1794974444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=izKeNjmgGEb+ohQD0Lo2MAj/aQnsOQBqGfHNjKP+5ahwFvmAq8ETD1AtOpQfQqZkY5
         3Ccfku4MgdWRhiqeryy3U30ZPyIcHWkE6E10kp/hy60LDsJC+W45uW3U6MPZKb3NFMGE
         TU7GYYYUWkF8slxjOWFa9MOBF5SSQgoSRzcj/nH60b96PgXijTmJwNzWYM8PsB4hisZC
         6KtNdCM+Di9U6fUFETUdxFuu0MDbvA+OM4tQfomqYUix9Y02DXSft+LOK9tHSMR3cRhq
         NGJ4cXp8wySDAs4ThKvo7+sLe7W9Oax5OYv9Hp0qYGrqjSDm3YmS8lyFmQ9R83uE68Be
         ATiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369644; x=1794974444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=izfLmPs5WeXN3yovEAXa/Vbf3Fk1baxX3djyROb949/dYlstgCvM0cdAbhxU9rpXsm
         CD6QNnp95s2LSgBx7f0u1Ogb68qyZnVRSaqiLN6QGhuGnPXiaXpYC1QuO+P/OmJldyV0
         I7ZZ6rs0XwX8uyxVfBjC0la/B6OMDQVS9+IK5QmI9ftBaG2M4bYf6glsP5vDYeVNFRqb
         yYr6cItOQsLGDWqvGuJtp00u+Kht9R+Mlf8MPCQwB8QJco08XiNar2ZqcmCfNTjWcJe7
         l387kZOkH6kbU1JmWyJU3nkRrIqs4+eyvyFbezjkHUNbgI02VUfa4+2lKpsttwbQ1t0U
         dsCQ==
X-Forwarded-Encrypted: i=1; AL+hErE0+s+H0RWs6r9jZJS3mGeULvLZg6IMIwVH24sCOPKKkX6FYi+YrTB6yzEuF8Zk8p0WKEFSUeu3NldmIuAv@vger.kernel.org
X-Gm-Message-State: APuU4Z8wQ3cg00F1JYinU23nRymXzKrKXtjqS+9QEcFwOd/VDS3E3+bC
	w0F2iafnMWtzfIjFIZ7hVCtAcHTY8np+sdgl0FZDcKQ4KzTHZS3cT/AEY8PEUKw+l2fARHbvo9Z
	9hbP5U8otnuNHEs+KoAX24ScMKV4rKThx8afHsY2py61b1Vb+KB1B5A+QTseGxeYIcja3y1IoRy
	b1
X-Gm-Gg: AYBFou2MOlEZSseCiYhNoQ5dQGJWoHIuXel7S4HIGdhucNHQzo1XjDM39BfZWZTUYc/
	ChYjcBcskVNhY3Znf8wmgSgjDb3o3Zb9hdiDAtCO2HgyuMmMEjYv/c56xFwhJhZbEvQeipA8XEV
	JC6Pq8/PtnjHkPThaSV6I85bX9VTsc4qPALuKWLYY4Aycue9VBpPBU955XJIMOn6EnfOxzlzYgW
	VZ+3POWbiuqkGeXhZWR7TTEN5G3CBe+nMsovtAsh9xVPyxRUI1WMbM3k8Mff7P3sp+It5KokOkh
	fRI9sqf+hjxvSzX0Y92Lev2mP8/7s4kz87EMVAmFqBWiG9M/MURHIRonTsoTuIKGk48z0qj4hf2
	sgVsowEhCYVm46wajCDzPndHcjElM170iCfa8XsS7tPeH0u5URcDEJRJQP7brDSpR+FAxMpShe1
	8H8BLdqOtIcf78xr6TeGY/nZBA9w80yzvi
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045806b6e.15.1794369644000;
        Tue, 10 Nov 2026 20:00:44 -0800 (PST)
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045783b6e.15.1794369643526;
        Tue, 10 Nov 2026 20:00:43 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:42 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Wed, 11 Nov 2026 12:00:18 +0800
Message-ID: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX+jpnirqM1CLQ
 5YxB2NxIP/O3Nif+aaQFIkHZWFUWujIAgjbii6DUXk8JAQMlZnVdLXhCZUHQWo96KmJemByGztM
 fhr6N7EC4y4KU/OIFx2Yr9P7fX6OK5nFncBhgkj3MnAU++OZ3cdcNaykPRJCXbU9CCLinPNRnWH
 klalXSm0sOlSeIGxJZKnabp4DS4p+Lc1yvTtHBALRGjtw9kynvDY6r7TiSjhSpO9KTdHauaGNX/
 6l2BhWcNhuqrRARkDQWzwiqwylrV/IaKVxFZz//NpvTslP9XNOkUFLyemblJSeZnfnHte4XVCLS
 25g8Fk+PTYtcYWB2Mgf5l0nccmZr+OFmTV8lDrCZcLrffH2yK7gPm8yLHHRBFmkdxE1w+aP/VUh
 PBePie6B+Hg8d7nfJRuEXXGVaLQoM2wObs4eAts6L/FdbtL9M0EV/TxWsCKv7Me3IEDGSOgAVPT
 fynDOCQf5GX84zfpNnQ==
X-Proofpoint-ORIG-GUID: agBdMQsOIpkm9ZCcvz6c1pRpsbiYHkzA
X-Proofpoint-GUID: agBdMQsOIpkm9ZCcvz6c1pRpsbiYHkzA
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3e86c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX3nUL/GNoxexS
 3BFQTkwwmtJJLjv0waYEoj53UtnZGCTQr7Wqh1M53AlGHD2qjJzNeeoApDKPd6bU84VNxpaxn4x
 HBta89ngRopM8LZZkNv8RNCldm+ysy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110015

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as the dependency is cleared
- Link to v2: https://lore.kernel.org/all/20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com/

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels

 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 3 files changed, 176 insertions(+)

-- 
2.43.0

