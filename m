Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB63ADB9A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146485; cv=none; b=HD8yuz98L8FPNzF2nkpZh/w4QIdDiHA1JTTt9MNhwHUhXT7BJEcPucoA7GjveSKBU+Pm3uPZwWYm0ycYVaJEEOLHHl7NR2pTi+NrTPxWBKTd47Gir/bvAvO5KJiSmnLR0jGuRXUvKAu1F7sy2NRyywi9HgGBnUMufotbOyDQ/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146485; c=relaxed/simple;
	bh=vFEvPO/XE+XouaYcVLQvOSzpzZZ4PJnz0oNxaLBLves=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRtozeXgbqeQjWu+2b1jGvEKRKvB0kAPJGeqfGkKlGvjH3mBnXQjHOo9AXopuIo1XMGbtQHpb9KmJfAILQO7cDpzyt3yjHa9qi3vpun/ir8hfwdNtAey0JGxK/ufJmjWvkRvrUzE4lGSj8Zyu9uxGt3AUUf4qgEJw14RUYb/X7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz8HFuKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu93wAa3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz8HFuKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu93wAa3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1blCB2241730
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=skvBLVXtv37
	xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=; b=bz8HFuKg3kY8H92sccfToswqmzD
	3X28cy1e6orWLibEztVG03wwJhiZgH4JW8FrVgU1cc8rusN0ksGkT1+WJa///H8o
	wIR8kV58+ES1tZjZXcyTSxOlBx41M5vMha35RQglidZ5XNw8r5l/lRLjtv9qKwN6
	H4e50RN8TpquiHlZvNDMvl1Fk4k2ZWuQTPDHTU3smQdZGXFt+PIxBOFKxLHMIHg7
	UFzKuywF/KJWfeRCLiMOHc2C5VgGATprhFbN33NMKnEfwyLLvkDK6OwVLypeQQWR
	x+TRCRe89X1A3Tcq6WXY6DJ/QdKqqctrj/uvbEv2hebZHAqp2ZpXz2T/bLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwccg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so55531145ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146482; x=1788751282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skvBLVXtv37xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=;
        b=Tu93wAa3161wtNoDK8ulK4X0gPJa6L2ephcuvk2oeH8EIsmHRYMiIShYnFgLUSSkxU
         /7lXTDNbShuryY6ieaBGNQy0rHmzydEgYtpRH3bBVm59oRV1ysVDn7lBuhVYg8/LaNfR
         vm9K4yH1l+wV0z6Jb2cGajWXG1zjyauHEkMjjTrAsf0ECcxsaMWGuKZ0yhSAo1PtoOOm
         +vf6EjsuITInznC5y94pNJ8CFUflGII7QBg0kJmOlAUGgT/omOKvKg6Vg61pmHp4kr+k
         3a/mJIS+f7m+vt+frS29l2Fr4jbga8WTQkXLZzHUbx+QhdYuDxbwKplXEB/227lPttFY
         AHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146482; x=1788751282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skvBLVXtv37xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=;
        b=QzvMUtis11Z33rnx5BWr75gtYWy+WTGvx+eHju8dD8XmzxzNkI/JlCtbD5rsffpWH2
         ibrXEcJrx01hSKyZUAuulFBFKQaZnqskRFDzxlfP7JnOxKe/fZ+9n78EldKB0/irGElb
         cWAfYU8GHuDrIEFMHbMbNVYc58XtI1/yPoxww+JyrItD0epbtL4u4Wk4BmWsUHF13pZh
         8BuBSsioTYYvzMSzAGngIbPPMWERZZvVaUUDF7ZkU+CKn9HRJYssZjTTNCkQRbSvTKx0
         Adujwrl6CJCvMdZTE0UG5gbTcHQR0rXBpZBJv5SKEK7I2VMGnkIa5Nb1Ewd9M9RMTJxd
         MtRg==
X-Forwarded-Encrypted: i=1; AKwUvBwlSMaxAmlHjeuMVCGUBaH5e6xQjx/7sui0SvZfR/Z8CjbOxWmQTgGdO3a1v7Uthd90Mf5t1qiBZKoVuXZT@vger.kernel.org
X-Gm-Message-State: AFuF++ltG+hZW8r41AHvRMCkR17Bp0tdhOj/KDfgdYHmHZZCwC8jpm5o
	lU1OgL51CENIYRIv0SxbcGMNfWQ5o2s//NSnjF/yPStttbQ5Lx5VWkF3RUoD8QCvAc9eH225SHA
	xme76Xf1MThUfXxv3UfRYYKNPy3IzF2/F4jN2iZLztSGy+cmJ+EFyfxTc7zI3N54WSwR/
X-Gm-Gg: AYBFou0cCPVpDJHgPxbMWXnKT6xJlHYm3zJt53tZEXyY6AJrFdEwILOcctXbY8uF64d
	f6i9UGwqYuoopvQAq4UjwKyYhh0v0FyqqSPzU/Avnad7TzVnSme1h9JnMQhPt+2l3hqCIq+/KFt
	WSgGi7zd5T/oVRinZxOWKdvTWGkyUg0HVREgR5/hnRFGWFP0DnNs4mCaK4LERqqyrP4CyJqcYxs
	zEJKJxn3ctYS1AoigzH3Ru7QGeixjQtd7sycI6sT3SfQIaw8vU67pJD/7YRoIYD7DB22ZfwrEV9
	vjfVObmS2lFxLVpTaa6QKdOqUG8knNqcCWIRyxq0txlJp4/5PkdGBQ95O23jh6H8L8P8HQVMeG9
	LXBb3WCWp53lgGJzmMxI11arQcSjwyz88wmWJi2Ngj0B9+qcNwnKE8Zbwbggi
X-Received: by 2002:a17:903:4511:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d74dc83cd5mr299096085ad.6.1788146481725;
        Sun, 30 Aug 2026 20:21:21 -0700 (PDT)
X-Received: by 2002:a17:903:4511:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d74dc83cd5mr299095765ad.6.1788146481348;
        Sun, 30 Aug 2026 20:21:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Mon, 31 Aug 2026 11:20:59 +0800
Message-ID: <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3s-Q0hu8kszCFaJB5wVEBet2-K2k53-Z
X-Proofpoint-ORIG-GUID: 3s-Q0hu8kszCFaJB5wVEBet2-K2k53-Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX4j8Kc5XshNNC
 ir6OM7bhJMOu1HqeeECaToH9NzUGoBUFqx+03FCSQT+BvOW7qe1NeZDquiZyQlvXYrcyf5uopp8
 mMUBJLGvfMCTdt7mRWepiiDzPYgSQbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXxNDeT1DkfYzg
 LFEV/TmC32ajPixPv5pK9s7hawKISV7Uwfd2+ZejkrOVs3Fodg4grki61lM5AP3UqAnd5WYJEm5
 3+W3UUymnoS9+c52sgd0m6l0ZWJM1o7Xqh0jTZYbTeGoGj3B8h/6V4B0/zsMerSeepFNrPmgyyd
 ggmBMJBOrhita2wi1ZvLuYy+PR4euUDWz3x6ZFTYgKE9cCTmfKVxAuAA6ChfXMkEsJ+WKSpX59I
 BCh4Dn9DXW6LGoGVf5kUllDDh7y8g/UxH8n4tQr6fNAKvKgm6WUEQV0z2Ft0IfF5/CS6GFdtlh5
 nXzZsNSiIzECbH71OJYEVW6N6024fyjbil0TUetnwpWiZlBr0CZhdbwmTd4FjCJ7wNxzW4sLSjL
 s0eq0ER80o+S6OVRIEFWY6AXyukeZySJ21QUWhr34i1IOW8YfGjl1cXzASlw+tAh+CzbVPovATt
 7ybkQx2rWuooDM0pZMQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a94f332 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JJ9q3QTBaA1S-rdQf8wA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index a2a19f2304fa..c25113676008 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -517,6 +517,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

