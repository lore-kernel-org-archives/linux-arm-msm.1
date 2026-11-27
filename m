Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769401;
	b=XE+KwsvTHS5RiERHvNqYgRKi9iQsYiYFRUukxslEm7ZW3LNVowmaMkvqGZRccWgbs45x
	 9uQUEMUpLyrIcveHieKhWW48sbiiCN0bgsJWnEq5a6PTCBXO5uTeKbMqYr9FEQ4d2dUJp
	 DuaUenu2/jNFqvJQVFzimiJ1fz6rw7TcTKPc2w8gSY01VzqiI6Bd8jx1CtDuop+kH9nyw
	 hvGLOrRzELllWZ7QVWFBGjeLuHJGkamiUSYvv4zLNfOaTnrprWgxdivv4jZBGGYTkGLC2
	 n1lEGxQ02nAkJ2GVQwyWCLbns1r7IhkjYbZD6vvjE/eEvowBEJ5HkCNRc2Xn64DJc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
	b=AcFqX2qNSBqfTakxf0ChwA07N9Pyd2KcshR9iuhn0RZUjaNxboS3eiDJlf/7OIOdBsfp
	 fgTdH+yNGk9fSS1gRxM9FuJZ08V1ZFq7wRXxQrTtl4k2ryE5sD8UKhjnUZvwMJNZYKWjn
	 YoXtjRD2CjPO0fCCOxABkFfTTnejPlMiXm3bpmEBZYs/ai2A7BQNDaLe4gpIlaK75GQC+
	 obNVKvmb9azjawXDLYBMev6d+32LBIkgEMpGFrO8cW+h6ULXha5uod3AcQPWMVYaGMVEk
	 ASw98dTzxpzSehhFvJdW8o+m/Gfa2cVaSnVEc4mD8wDp6OZbOkfyEcHT+DCsXpOE4SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dFRCaNK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0C606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D0C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFRCaNK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdZQ3983903
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=dFRCaNK/4p7+RnyJ
	Y47wepn4POLlkF1UD1qcJga1XDFTk3yAIKtxnEE6BeqraJQOBrLNcIhfid0FyyNV
	r1/7K2DFVuLPxgqhTF1xp9lhmk9CIrmhforMtEgGaVz8yaejnQMdNoEZm7q5ksAB
	n4vCwAJtOgBp0X1kb1OQmO9xmThCEQpKaGXo0vN4xEQDrtCENvGhs7i4eLcNQbof
	lx34LDhTSVahbEKxcDpsDIT7gAuUqlaawndHezehJPEUzUqyfUolDh57t3+DuMqG
	CtNH/JbvJNzKXu1ov2ltLVmrkqPrKzZUbu7gS346l+yt/TaIeUIpX0iOsn1YPTL6
	eFzaQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so272523a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769399; x=1796374199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=W0hJj+vRfLgp8eSspb/yvppLVigfhZfo+1TuSpCEwQ4SeGldcBYS3crDVR/tEfFRrp
         n1m0ZurXcicu6EG/kKysE2k3K8RIRF1jITHqIszAVEzS9xqRte36Lr3TFtukk0ChMuhI
         Atn2vzVMvrOt+9jSSnJEU7Q7T3TMd5qZI5lDftDYdYSOFZGIteP2MXHN3pc8Ow8FuWXq
         3h5zq3tTuHTjzlS42o731yeg6wuGTfA16J3m7g+nJi23fkyCkD/d+D+/IqDYT5dxYCIw
         DhxUMTcRM9CCUZ2d5kXNBw3SAOy5WeyyTxJXibAUuO5DAvNGQV4lrYEWp0Uaw/Xl4hGy
         6jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769399; x=1796374199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=f7FGW6w98rRnlv4zK7UVkPexWdPaPvHnz2cxtp61VsReK0OKA4AMLa5wqohwn37WMj
         7GtsT54s7i2i97icSUXgGCrd+CsPWr9zsUD6mA0AxjkUU1E1Jvq4oxdtYJakVRjIhU0g
         KMoA2B3pQAWoXKM2FMBQMtvldbodeAhiyWZpnIasuT4w9OhX9KKGxog/rrvu7PgvlXBO
         gjv4jIzgz5+aLpQGQLyG3V/mpf0kPFHFkYK5YpTKu97gRwOUxLZs/oYaXsrY7LVKZRZm
         b7IMDgg3nyXptDtkdBEtG0uQnZ4TkQ7LiM8/XQTq/cY223WsegBwUo9ujnwF6PC7esha
         hkFQ==
X-Gm-Message-State: APuU4Z8QCQR7eBAecNkqzW1Hjl3Iske4YSG73bN7ONrd28pz1Fy8n461
	A/882w0BZnRJmXcNrE51fXpoH8nPylugWG26MdPqQ7f/Cs5pgBzR8bo2b1yvkQ5Ani/cBXXdngt
	jJfqet1JkS85kBBNHLyR0DEtl1aju8GcGHftvf6puoUtI4naLy4FHQTPgInmY6RNEB4+G
X-Gm-Gg: AZFdTZeJqoZBPnp0uItU8oRCENbJa4oRhVulONydzHzt3dCush+f2E79J5rqTXnFR5s
	47kxjSlHUHNSGHPIG9H4noemSzubc6lE0ZTuSJ5Durpn+DlU1CQAW+p6zzzAt6CTx/4Ydtsq8IG
	naq7TO54qY6Dyd+DxLaZMWhuGp9tRlps6wEpnLNJ0mzCpu15vJ06bjQiav7cj28pHYKIM3+GLPV
	7ZWfBSFN6kLlpiKY/ePP8nM4FwkeXvZF9797HAxzlqRBkcg8+72WipXx9yjbX/lsLmm4l4I32D7
	fdPTCZZX7yL/vGgH6b+kqK4wrYZV2b1eINOIx/kQjAT4zEnBRUnNL5hUR4jex0JWjVDlHlkXA6I
	JPSiG1WMtXNLblUtyjHv7X3nw+THtKNF+Cbd4KoOAaTs63UX0W6il/g+SaAiwnM0mYB+vIyjODs
	iAYUzFPIRY5RrqU/gV18xsX8f28k7RAiZJVgzVP7ivXwB+1jRVmjqN6I3O8kUj4U8kkiEkacvv8
	eHFA5hqVzUUPJg0VkO5zCKk3LMx7w==
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294725ad.3.1795769399477;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294345ad.3.1795769399034;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:58 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:26 +0530
Subject: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=1089;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tkx+9mrW5AZ+HOy6XzHglysRWK78jQma1MhEIAFTTJo=;
 b=8s59DlyRSZewARMpmXDeN0BjCap++JIQsz8Fj8QZAwu5z52tfIwwDwzARFsRver9MLXktwHAL
 GkoYA3WNzQmBx2LBkykLEnVO14r488O89BTrGA8krDwxPGxcenNWjyk
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: CuoqKplOdPenzRAGoiLqWNaA1zxAYVNY
X-Proofpoint-ORIG-GUID: CuoqKplOdPenzRAGoiLqWNaA1zxAYVNY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0VuX64UyUqVO
 iu/okuDycOUTnIpXRiLzLZ5KcHe0TCuUVRUCcX2IM2XJf7cJM5l5A63zDHWym0jHvMxXg54PUye
 sEcPzmfPop3/++n+8/T6h7mGAFxMwMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/vrTkCnSzM+U
 BdbSLjurMMPaGIlrFLFDQWI6L4YT+IEIpUbHQ5reKr/dDgigKAdvLsDl+ZOfqwC8FTRqFQeLW5j
 liSGFpZyqN6ZwLs5hKaxne095X+ZipLlhqbBOAL6z0fy7EpMkmfcJ1AXnPkCtPTdDG8X+r0IlNi
 Ybpl00ZhpH6nCet0jPd0zAedNcCr6Mm28VaQZZQEdaNLNNLjRpkA+zfvTZKFMNzYcLAI0xQFaWX
 zAclICMR1QHAqkFrDwBoEilroMU4uK0aEE7QWSmXHzAqWCe/vCoZlpKT3c913g1lkoPS9ob5+sE
 cLlfN5yBdwOkIEo+WnWYMo5pldzl8GUi2PGGl8rp07lPFnpKi1sdQXJrtIss1ae6/K5BQ4+xqcO
 BeYi7jxggP0iAwt281Lr8KIbyHLr2p5HdF+LvM1jrmBlLlh7EA540SKJ1Cr7jN1nAxn8RpVvCc7
 KG1PkCLxkRAieYHqsuA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094438 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8FmHkYH7MGniFFCvUCUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block compatible with the PM8350C PWM programming
model.

Add the PM7550 PWM compatible to the LPG OF match table and reuse the
existing PM8350C PWM data.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 98e39e03b9a1..6c9cbc75bbfb 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm7550-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },

-- 
2.34.1

