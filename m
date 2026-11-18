Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985425;
	b=IPioiGE6iecyviIReru40d0EfBib7nJUaq6Scp8u4WVM9Ngqr/rFt/Xu8sBPHi2Dj3Uf
	 yYg5MykNqvUUT6jJ/3U11AE/k73+SFhyo/qHbFF7SmE7wVK5AeLy0dulAmbxuRdhpimyA
	 s0/sFyceGH8oc4CJkT29W0CZOj/AwnmrO8jQk/KmSz86SQzdFgn0SS/Tz7lB8mgxro+Fv
	 6CMXFB28qWolb24kl57JxqijlD5AKPyouSbKaSjqLL9JVG12ELtPRUSZeZhhXLZkm7rT1
	 YxdQETNSB4cEPLm5C2KidZS0vpR6M2smVfxXD/sT1jnT52iysUUGZGMSkOznPybA5CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
	b=bKDJkv+3O3OZjk3pduGpyC9wnAQXZ7h22bIrE3ISKov98O9ImuWnCm6o3oCq2dGiAohg
	 uKZ4WZKP1qDmfxpJqVQvljOU1PmpXpGG0IqEoBYVTy1/bQNIqajQnTmrXLmEUKcVOxgj0
	 J4VydqkVCwjaSycyWXlDOZLHezlgo4dHLX+48w83QmuWYX+pY080HPClYRhedkXc33dB3
	 lTjZ99yf9ExYQ5fcoBinVdmtt1KDeHczGkHX2i2h0rT+1ypsNVcyTrGICqX+2Wt3qKGO4
	 +YK4ei53f4A0lPUc7dLNvVGu7IbWnY2oIXNLQ3dbsDf5C6mNKqd6iFuwMtWqwV04aQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7D9Lmcm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwiprkZ9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DA606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4DA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7D9Lmcm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwiprkZ9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uv6Q472516
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=; b=M7D9LmcmZYgWQPgw
	lzaGvDEMnSK8MyXRuenmvC+N1qSxD8Eblbm4eZUniXHJQdsyfRP1c+PkaIj/pcmh
	BqFOnpYdGpOJLIBUnwHHpeWwETdmasXF/b8dSFOklMkESssztq9107G45pjyAEN5
	a7tvbdTyMct/cckYFjdqkYet1AFVpSD/omTmESm5uGOebLBCpFQQbhxJ6zTUDNIc
	qnC2/p50wj99CGj/aM+8MLyDreBwzXvH0ik6SNyqEC9tQe2kTRwaLYPlXhWreCUO
	H74sQrXAdG03I4bXCX/Xgws0xHQCqSEeLZ5o82AAbygEpmIolPTaehwWoQcDlhaJ
	2O07Eg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89p9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:03:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee184a2474so5959215ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985423; x=1795590223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=JwiprkZ9V70ylD7A+7ZK6TfcX/zA7PwPAlSVpsCSSAHsnMWaltMl2mxHqjYpAsRLUb
         JOVY5UYPCB/1dNTY4+b//n/EYU636TB4sMjjhFOAVk7hp4rsApyyqpzo2yIfPUqnEtMy
         XxbOLPYH/GPfd1rCW9IUoVft2Lm3D9luf/wgguuvymRVh44fffP3ItHjmXvW+RVul7jo
         WlwVSGSZeIyQY+mtsUWOg7jsfhUuq2aWD1LB6WPiGs8hl6h8b1xcuvsdLeY4XRtynuEU
         I2EZGcLvjsUFGYp7IfrGHaOx4RyYmfN721ayHGgKWbg5kOAlg/6Dp5mLb7gRr3tjhS6c
         m3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985423; x=1795590223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHrBjW69PacwOrX2VC3GZ3UKAJWwd8oT/lHxmElUzd8=;
        b=BspDWkUmKIlFcsdAclp4ABKEjqWtnbXpnTXLbWvXiGGUMCety9ffVlGwEfY8ai7ElJ
         avMPKuzsmhSkSFN4fwx/FLmw3ijj30SHA6JboR7LrY7Iw5Hq+GV+mDhOP0+B3eVQF8Ui
         3dVhbajIp3Vyz+nfcOLKs+UCQ8ZhFYENMV6VuEwjkDNliVYtuJoe+N7MCJhkicQNquvd
         3960KpHUW73IOH1bxodW14HqJEUjmDoLoP6MxtWA87CevXhdaJxR246KT1X8Eknn+dxW
         HZ8e9ZEeQVPGI8Hj46bHkaTE7t4csuiV+08HqxlXcYPin+cBWN6frXa500Z2Eo9FUhSW
         vrew==
X-Forwarded-Encrypted: i=1; AL+hErFpCyqfqczjYtzqkXZ2JOqmb6dpXj3Kcv6XTF6GfnOD228AaGobPvigR6OoVka6YOIXf/0nB6feCRScUpnA@vger.kernel.org
X-Gm-Message-State: APuU4Z+OLfraA6X00tDa2rNlm4orrm4ZIinWDsmI87C1fofIJiKhg2MW
	sz7sFaxFvy4W+3CgsvEBomzXxbSTDzW5jLfQG6s9NyslBD5+HtftyYPto4V71qICsLjYcws1Epi
	jYU3zv1AQo/5JX12c9ifYrHhixIy4peKEzemyP7eR9J/qKderzG6gd2YhHn7xQKXX52qN
X-Gm-Gg: AZFdTZctHO5qcmOZIOk91VeiyDn3Y83aIWIizAmZtvsOy8+L05y1yV3yvn+75Zi6jr/
	FOmwTZeb0AMpkkcRZ2g+DrMD7RCstqiwZ1thAeqsCszDWNLVYGWySfbHI9tPFQK9kFmRV8vXZBE
	Upio1uIreeGjBOCXW+bM69KH0RPip+WbCOorzvxRi1ok1G4dRulCO4sxbOoUpEbUT15ga/1+EuY
	RgwGuZUKkbLxGJMUcYXWhPfVbEI7+t5n/yX5QIHqoD9kTX6Ua/IktErjzBT4YpJhNphZ1mxAxrT
	heOSdsTHjzMyXvPYOnMvY7UykJifVk8rlvaZOOQGbxIdhsXh7G5s8ERJFj0IW1HS00kbnRh/ZTf
	mnC9W8SjRzwTxs5oObno/uJc8ur+m+pzCmL9CFzi/qxQFFsihMFvrxP/8ynryR/cYPpO+9qzZdk
	QPPDT9y2T1rTFcjMgDcuEHV+xHBMSOxy2sRuln
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18649905ad.57.1794985422725;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr18649625ad.57.1794985422281;
        Tue, 17 Nov 2026 23:03:42 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181433sm8341825ad.29.2026.11.17.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:03:41 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:01:45 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
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
Message-Id: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985401; l=1327;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kgQ1nupiTU7cGt0s1oNpt68ivh8BGxPL454N4D/a2j8=;
 b=MECHIIWyATcE6g80NzNvI7r1HOMEw61S0t5yum1KZifdukAn1WfInFoS1KuYRsIcmALEzyeoy
 oZVMbLnouF0CFNvN39+PTO+kD7BshxRVR6NE/9btCbih8wPdaKSeL+Q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: QUEyoe5bXq61Ma7m_sAy3Zaji2Euz-x6
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd4dcf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kLiTxru8Czh8OvV4UKwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX238todp1atn3
 WK4obgRDLD5b+AvxrZlGVmGWtASCAtveu8Imk+JwrT34BlPAaiV0DagpjKpJFImTOdeSIDhKVFG
 SuEFitfglpgHeA36vhr5og2opGSuYaVaRpO/5Bp9Q/aiPfrxOzKb1hrYyRUlXFI3VVA1RCdS2iw
 kWd6HbVd6iQGt6++Onz3RhsLc+k6wA5auZ5wkSKZjxlyNloejo2jz2iCK6QVwsO4+JknYC6Ctis
 pioOx9oeGeq98u0DATBIXv0L0znaF1b34KioSoiENXjbdc16CWsqwMzqhirlbecV8lDYTesj1by
 K62NTbVo3304SPg/jp+oGKQfdukfFVn1MKhi/MIwkr5PhgYOhIDMmLN1w+ApdS6oWNQycjGXrbO
 YugZWBLg4qJEcRTJYiJWGULEEfZmJHIzxFlc4fekUDuASZO8en+id1bdGS2fBQ6DDxELlCyYn7t
 sZdupZ/AXl8IQue3yZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXzuV6cjl9PJ/p
 FExMxu4nkx0VYr1s7giZTWIzPl/QqMqgoWNX4gGKfb/SUwJMNgssSFRoEvSacvmq0juKzX59Syo
 N9V3vgSNY5ptpiZH405MaPhpy/EiTtc=
X-Proofpoint-GUID: QUEyoe5bXq61Ma7m_sAy3Zaji2Euz-x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The Component ID returned by the hardware is 0x00000000
instead of a valid AMBA Component ID, so the AMBA probe fails and the
device is left stuck in deferred probe indefinitely.

Add the "arm,primecell-periphid" property so the AMBA bus uses the
specified peripheral ID instead of reading it from the device, which
allows the traceNoC to probe on this hardware.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb..a9507ec56b61 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5179,6 +5179,8 @@ tn@109ab000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
+			arm,primecell-periphid = <0x000f0c00>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

