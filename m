Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0159D45040E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457634; cv=none; b=EQr5GQSp8kR7m37HxZSt0AX1+i2c9mdwdPN8d1Zoqtm0/ARo75l31K/9xFNKvXmaL2fk6PDgMIVRaARiXPO5s8HygzjfsuUt+t3tp7YgIfG8RXP2Ouk/m4iOi1scAukxVo1mRerU0nCYUNWk1ASV8QsNr64DotiAnA6lKD+3u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457634; c=relaxed/simple;
	bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJ6CPi5PNZuOxDQ3yVzWrb8PgyaDVfFf2nrc8KMnLtD6EsxswPAKyNrdbUcwG3IU2glqFoXIijLmgvIRXwxRm/5oUIR3SuEP7265qFC2/Cpy/KIb8l4K9Y25g7LiOpufrZXf8pfn7dGBDcN7kkz3yhsvVyhrHf7G6HHruEfBcEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGkCghhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsqOsK+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGkCghhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsqOsK+I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbjTC1174070
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 11:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=; b=ZGkCghhmuHBMmUdn
	8mQQo9JAJn/0AF9mWVPIwnilEPGMHPkV3SdpEtTDW4rPfZEg31GS5uwhPcMivbX4
	mpqXmWn6BKh5dv6xa2A92CAQ6J4XFmZXm+/EBfNIwA0lvOUUqTlRCc97VEc10lGW
	iRxTg74trzUcy6+L5A+hwP/r84dqTPM7M1v/MmsYWZRpn1Khy8DoWcgfRlD5FgEL
	rZ09OhvGTN2pkhyKuBSvDEh172OzXyLFbFHGaWUtSM2rUW/XcfwSybTz+h/R+hsb
	/Q5m6NEkemQOlBpFSUrznu02DcVG5xCQjAXgEmqZgzD289jmDso7qYFkKJJZ5CsM
	hzbLBw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32hm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 11:07:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-890a9a4e168so1893546b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457628; x=1792062428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=BsqOsK+I8WhCay3cpI3Abcq8NBBZibKcUEK7wtxbhhHty1RYy+fwIBGE5mNkg3pq2c
         r6zB3La8O4iws3K4tU/c8AlRPjP6TFWcaVYNkuPiieTrjYz6rZHsfyWZYKqqGvwTKs+g
         BWh0Ap6qYFq+aHoiMkdpabIjuC0JRC0rHuycFGMyqTV6TzmsX3Ta85XQMI5YSmxytrbh
         fsJw2FQ715XyZxf0dKB/sgOpXCoUunHK3ym0Hw9qzmnAUNS6+AGSG1u2xJj+wqe2P12j
         gwv6XcDldSj99NRw2By37sBGFe+gHF1JGufL77IcSdkbc3fTmLJwTcfjXrGgXzxSXAMh
         yNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457628; x=1792062428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=n6ITc0yRMrhseLryNlD1CtVbV7m/hDXsw84eRsqvfoF3An/vEbYuD8bZLV6Iwfzp7e
         wp9U7lwQ6BMKblZZmn/kj/jDT9CaL692ypiq3vWMT3otumyOUEkr5tLjfnqW3g2vCMUp
         ZiC00KKTP2BwGZHxFv/ugfx4FCvdK7EGyh58IviJCldPpQwZgP8cKk17KgVqqdQuuroh
         QkhlkYbccBxeucFnMqiyn8RPrKM13YRZuWKSzErrV2IxwmwNH+4WO8GPsAho3hF8Ins+
         gppCumIcPK6sGnkEv55mXUGyt/or+hxQPv6jM3gAsH6h9Gz90NGXxSIZ6z/MBPA3JP0F
         L+xw==
X-Forwarded-Encrypted: i=1; AKwUvBzG14hm1G4/BUoMiJQDAtSG35qFYFp7eV1WZmjhpZRCOy32tee5iWNH7AgdaooqO2wvcWK3m6OcxAHv5eS3@vger.kernel.org
X-Gm-Message-State: AFuF++mWWmUA7a6BwxBBmUl9+7uhKhUhmMio+spaQy/RGbWcxLt3JUg/
	KVn0BI3fZvdisA6rRfUF2mFMoXTxzJlvRzVcAAYLKyQUQNnXa8zR4hQ27b+XK90EYNPRkvWJRBv
	JoYWVK9KoUSaxAJ4QiVbs5a8TC4MlPonQgoQSeJfJSuSQe/e7TuoXrdotSBd/SSeJvcPT
X-Gm-Gg: AYBFou0wFt4xML2EDrfaCHhz5pmsVU+zIIlQjz8Y0dfCYNlxtov6Ke0X3Lvcq2PdCN2
	TFRTIHIT4R1a6CQJdpLlDrOF5XiyQ84+E4N405fAr2YW5oq4VJLlkEJCtE2Xna7GI6xLP9gspT0
	LumPJHs/sMalqB58AbExLUEFYJjFqfJ+jQzi0TI5C5K6rDBK12sN9QOH8i4Ts5dB7shosTxME8f
	vRtTuDLSWFJ19CgJhDLlm1rOfzydVCm8atDetDHr2XBVBNnLYYUz2DFI5vW5YT1H5oCRZ2hoAb3
	6KIv7ddq+WGIIVfCd/EvMX9kwGiEHW1f6mo8AqXTM4Wkmux4r+dZA2YrrgkbxEEMSG7A+UoK7mk
	qk0S9EPksXSJDHyKN0wK7fWXjJD96Xo7bUQBW
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532922b3a.38.1791457628307;
        Thu, 08 Oct 2026 04:07:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532888b3a.38.1791457627847;
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:41 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-1-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=1193;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
 b=HHluHddjG71Xk1Tme0+QZga3U984Edo9m5MNNgaiBlVVxTl9AB2DyhXPWEeyW9xIDsKKwhXwl
 NlE1RwsWR3MDyFXSt6+386vvEjMbalKf03FGkMxC9CO7NoudGGraPIZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX9N/F30+rtgQ8
 S6737yr7V9p8mq4ydz/U0fYiafsFp3EmTMJpM2TfbnumjflcLooTlRkPub3yVHEhC3eYzT3909/
 e1jx0yk2qKzdb8EBgXfBj+zrAciJJg/eI1wakiAVXFkjjOoXQDHQQpX9kJiA8iA10uv7gPl9mNO
 +Uc9Cf4agIWZrHF2vJ3l8rmse75Cj9kYRPGJR9OeNbInadzjRx62uuSXJ6JVkS8Xk2r9+rGuuIx
 teioD2uAN6BOMv9frNYgkPkNq3T6pxOGzD79cMDc9bCWtDSeIXmR9jz7Y7M8/MKX7Zwyb8avYKX
 6Uhsj8EYGDjChoKmuo2fpohroAnCb+uHtE9bylMaFd2sYh9W/OKyT2SLzbsvvPNQC7sHjwcWGLE
 8kWALZN0SB6CcXZdvAyk1KVTJdwOQCX1WYH8SPMW8zJ0LLCuRDX2Kh7bjo7GXBkeMTJRFNKMOIN
 iiiIaldCwLSM9m3Sh7g==
X-Proofpoint-ORIG-GUID: x_i8U6kSm_1s-E_Ob9shdIp_vChltrwl
X-Proofpoint-GUID: x_i8U6kSm_1s-E_Ob9shdIp_vChltrwl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX4BodRQ6Smts5
 ywAxbsnDnzgJk2h8Ag4XGYw6OMk367/Ah9YP3y+LitEcoMS7cfuCQen5Mn9rCAHAHHhbDLUF3Tq
 J4r3zgCaWOYiy5VZbRMVkviT/1T72fo=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7795c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a..1b3803518 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

