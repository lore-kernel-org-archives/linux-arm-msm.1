Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678709;
	b=T/2sJhb9TgvaEiZ/7ZmaSAV0FP89m2oXrj3zBc1oaM7XCrWmkR0ax1Kc01rXEOoK6o6+
	 IvvfMxw9lpjT1SJouhTJ+gHeAPoN+BxpFKg9HPGcQ0UsIXZJ7Qr0B6lJthYfuiQB+4UEc
	 G3amhr0pAWUylqK4mllC8b7CuWVRJIDLiRVhU+qIahB18QtVqDXn94TNSwmmM4l749b8y
	 gQ2pQ+0Ka/5nzOwb6tPBMpti64ozESJFrrG08Yhs4me6HbXPDJFjLapMi5KQt7BWMajxY
	 RDwpO8Vh+1VTrEjHa06sB2PCBqGM9lxciV380zpBtzKqwkoVoCXdI8IfwBZ1d4/7lvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
	b=36DXBUBc7TGDR+jU6ey5j5ZN1VivU8VzYbSTtJEf01nUzlYmjvc4IrMVeVicg19cWmuM
	 nZU6fwKxNKqm22nkFq91sRHQCNnGXepDmwdZ+L6h/jRlUrKCbuMFkkt8OBWjLhq2lPwHb
	 5jwWT5m8tJ44Bk+aklZ+UWLXUelR6eoo/mGExxqe+GoE2TeqUXbin8cLR7DOGWuPhVWD1
	 Ba08Nd7P4sQ8HzfjaOKtE8YNlYYQoMU7zE0fcUbofOjPcpPLhlF1BioExTMLQYT6Jq7sf
	 WdYiX0WKQtZ08lvZu2ILQMzoD834mAWbfCY3jte83AYdkwEvguCYXvfb2QcPhoheZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7899606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7899606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3mI1682478
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=; b=iOO6vOnIWc3jpX4c
	gjbIOzXErFehGXjcX89U/6ZHC9lBc5MtI3on007nQCyJgdjztLRe96wyAPkPq76L
	g0AW/VvqCMwHXPZAvQZelXSG1uQbM3XSLEqoJUC5xnlt5o1EvSytYmOZ8X+YU1sK
	wv5sWv/FrQC094KIPyv3oMBtYD0QhFwvdfHFDtFyg9SEYCfVK0xKXYJj9sk5NA+i
	m07SvmbWcrsUSurmjaDa00GRnlVltvcgxgMIyCdH/PFq/OOwSyFcaHmHTK7X4t7Z
	FuFsALPg2DtU+ZAa9CnDA+8l6BAADUUSy/8P52okxB70I7peXxhlr1nIEkaNC+8h
	wi/Z0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aek0mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde00369ef5so4097430a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678707; x=1796283507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=FPZXp5M0lTgXamaAv11egaXWd9InWa961xokXYw0XoY//+T1n+fQw5zWAecAv5w73b
         06vYGBxAoHuU4SF27cfCZjdg9DAb906Fk7uA6dnxHeiTAKxCFO/FXg+2508LQrpgulLN
         UYzGCw9r+5VRjEiXt4YtKF+cmiGc7kL7xKKxKROJfQbTKV+zkhUm0C27ykMMJ5reJexH
         gfGr6CFKUZzfkw+UAY1Bu/z2SWcjbl26kFlqDvlUtI8iKzQMKRE5wCbedJcJq2YGBi4+
         +yvOZn7LACvNzFH2IFFg0EVS7slzPMhVP0V2foCBL9JVY5Q3dOWUJUVI4ilHPUk9dK0O
         kOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678707; x=1796283507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=nuoG1zY+Byb4rjmp+8nqrXGoIGEItcAAkfJoQTsonUAh0i4dhUTqTuLooDWEsaZKPc
         CiEjOTEcODgNzjweZpnAvKNtcgkEpzDzt1xPF7msqGdLWOlzjkkjmhvTesDbsrv5HHyr
         7EO6tlMAfz5Gxi+iPfE3ahHSN5gJynPy+twZOCNekGdXR39/azxEIuJQ5abuX9g+avYR
         EyDHQk33svSOCKE6FhshBD949/8CzzQSejVVb7FolnyzUSlpLxNtMABQRaqBKbdeN0W6
         i2FiSVag1T8EbSb0BHtxyoTd8+GkUatbGIZhNwPtfWlZ3GIMVN/8YAg5yVarwpXfRcHc
         uvVg==
X-Forwarded-Encrypted: i=1; AL+hErEy6EbtRFFrJ41Pbdi447ohMfSchXwAAAzAIfXuvrpv2TNXni3YNxqW67EjAvAiH7aPrumouu5sXNdEjAgW@vger.kernel.org
X-Gm-Message-State: APuU4Z/IsdprrAYt9O1HGHNmHkUgG8gOW3tL75C8o4pFg4rV2WdRTUIe
	EmE1DxZ2lL5Q91TVucgSj/UQ6DGQKgThIbaY+Udf5GupTBeW+qhXnzI0f29FgUpH5PVJgqJ9+6L
	Heh21MyfaJTT399bgusRavi2rz2iFwtrvA6E0TkNRpoDKW8Dy1Cz8s7b+4CzNTS/lSBeK
X-Gm-Gg: AZFdTZcdxqcAwZNRnSNzTkiLbQNJNHnBpi5B9JocUljYlLkpnOregb+66jCXc+IA6yg
	651LLsf5LfPrs9zta9cvXPwAorV76D6qFedPFn1jvS1UYOoOhhKfmy7n3vXNjj5PF2oPQnjj6XT
	0uLwOhJYZGP/geLe67MA0BL7alK0072SGOFmtI224RRQJj3FHt7gBPvwtNlDXCYAMAZG+YvH+YI
	fJomfH1AgTzBy6j8LkdXZETrpI6zJrE/icPsdEsjWXjR/E1qm3SrJNmUKYzGTeGDqCvLLk+Zrx1
	bRt0uofxFmUfmqo4oVcf4PrQcTZWMY4yii/2DyFXslBD64tHRfQPvIvJaLzwWBUMLTHzpelreMx
	wKvWXZNCf6hAYM4brPZlnz8Q5F3TzYUQLytl34ijbMXCa5+vFqMDE4wq8jRd2BkwNzyqOR5UJd0
	jvJR/V8og2
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23111020637.25.1795678707460;
        Wed, 25 Nov 2026 23:38:27 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23110996637.25.1795678706979;
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:08:17 +0530
Subject: [PATCH RESEND 1/2] arm64: defconfig: Enable Novatek NT37802 panel
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
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-1-3d65c89bfe7c@oss.qualcomm.com>
References: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
In-Reply-To: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=775;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=ZZYbGuj3f2mQMixE9TOtkebXk3Us85AvqmAyOEEN4TI=;
 b=Pgy4FcCmA+T5OrU0DcgozrA0hYvJFN220piS7yBQaifoY/tjyDlz3VrWUXKG9sYyXqhaGnAhl
 m93kAJmWij0C45i3qFoSmXbspDPLHLbdGB96NgfmRU9W0dOHHn3yyEi
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXyNjmK351Uom1
 7+97Y2on6EV1la+ACYKVgooPp4w85OhxuJyaTPrA7GxGF03DQDWoQ4O1NfInirkGMP1vqw+7nVu
 9I+DRbCwZad4Q4hnCtezxhlwc88JUBp8gpvQqQya12x1iMaUWolY7Rqi8Amaf1InNfVCNTW7m+D
 rq3IANHg6b3HSqp1KsBpeg7nXd1xDEobRhVG+rrGGT3FyrXJ7alz3Ms0fdhy+Nj/IWtRQyFaqzf
 FOyCqQl/NCS26dic397pz6xzcgFFKYe1+UT2hs0+x4sN3C7zmn6C2Xq5WmI0axTvDJsZbh/ARoY
 6IJxvxIGnoFdEYyMIB/IxU5I8wNSqEmrHW+MJd1kA1uSBAf0zHNq6+vbmmLJm+aVWbgVQ/ZhmR2
 ymygynneLDKGFqs63jOLka5CMhrIRmZSUfTxePN2w3IK5lkW++tSKIGkuo15PA3Ge60tlRjTfb4
 2WovP34ZlW59BgVYgxw==
X-Proofpoint-GUID: Uhs7oyzJlDTfAN5eM9U6DOWvLgmPBt6I
X-Proofpoint-ORIG-GUID: Uhs7oyzJlDTfAN5eM9U6DOWvLgmPBt6I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX1LolVgXk9qLL
 7hJcWwO0n5W5E4XMs23+RK2NRpqd45zARqoSBuYp/QTjmYGH9Y1oWQs4K8t+jyOB7jMzEcr40uh
 iLu9XpNGbZYDhZvTdC5PEBCeFWbYOg0=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07e1f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NdkDFog87qYHnjjv0nwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Enable the Novatek NT37802 panel driver as a module in arm64
defconfig for use by the Maili MTP DCP display.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..bdbc68bd9b2b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1040,6 +1040,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
+CONFIG_DRM_PANEL_NOVATEK_NT37802=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
 CONFIG_DRM_PANEL_RENESAS_R63419=m

-- 
2.43.0

