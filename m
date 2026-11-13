Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538245;
	b=oN8Xj6iqB3oXVrMMRA2nSoxXPmz+XHjucR3cz8UY1EIpbajYeWXZ4F26k7t3e455I/cX
	 sEHbLA3m1nRhgJRLCvXr5sdobTHgnIFEpRYuoykQ2HAppgMbfbk++XwjL//8YK6zb6w2S
	 XMXKKLHu/HogFcUoGKG2RcezvkJaw+Voqz5rVVXVAAyHIPWiNuLarw+y0iTl11Lh3JFaU
	 CkJndBA8cgu6U9aTJXbvSrt/kseLraOdRVth8HhwgjBxxp9BeLTQIQRK9qtJuczoeMDFj
	 x+TjuuA/clzAsRWX0FbiFA0z62iZY55rOxNghWtPFGyMcoakAwPsFiJ7qnKcYviTzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
	b=FpwJJ3pgNu4E7gElE3vkVUuhLPSs3hcyz9OW4F3dsVy8mfNMOW2hSnERXL8jJYXEXuW9
	 1TwMmjx6pV+osyhqErQDGpSJwoRcy2UwFGbp7+OUvbXHVHaMv2xIv7MY+vacXVBzrdS5t
	 /0USASba5BJU1g0F38AFxic8HaPXvYaPu3e+Izhv2ck0NbtJcklqMsbMWqc0qzSfKhIO6
	 j4FR+LKrlB4Sfns4OPgaicuQqal8z5PLT5OtdnQjwpBYcZuyzAvvV0C4m/mBjrSvqnPEu
	 BGRCpSbALDaO0aWC1Fu6k4dugBOZb4J8sZ55gnAI3sgZP74DbFHm+koWcdlthy1Y1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CToyPsbK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/YLeiOu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DC606A895
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0DC606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CToyPsbK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/YLeiOu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K1044120216
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGiFHSQcrHd
	3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=; b=CToyPsbKFCoOPs3/EIqjX3Ihiap
	I+wwiO3W2C5kUeqHrum6+bapQ5dtJMede6vqUi472f3aaJEeugYRF5+ZqNEyG8Z1
	MJQb2yJ5OvS7R2DLuB8Pc7qlzFFbDkMxF/VdwPqqMjq2+ZIXO/eKkUVupsERuZeE
	wL/L+EEkA16OywuXuXmdWVVPQZ0NZaj2/n4Xb/51Ruc9bPtpbdzqC83YV9rah8n6
	pZSb5D3nHJqIOyCJ77GWZA7Cwwb2sPP9gHMMuzbOECJAgRxXuF1hA3kENNJghQrX
	1PQnIKA/gnLQ5bNA1OaJMnEDO2WuNNiOhRBKFEtBZgu6M5i/7dfrEUiH7LA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed276af91dso8879645ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538243; x=1795143043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=K/YLeiOuQe0jLhgYQTa4eAW4FvDtMK17+glE9j4W5QalkJeURsdtSodVG7Blw86LrV
         nyAJ9J3Oaz4xm8ZA7udTnJ2ifA+VlnY2zKydULA1PjaCXHghJU2/huL+psNNGLEesLQ/
         LUiM0U91yisRhtijDIIEJkvuGFfQ/LYQnfsyJ66tzSUcJeueS69LiaJcG/szBAj67GG0
         MF8vuywQKgLxyHp7YkwGCR7N3BqjMxqOH2APfsiZcMwwdVE/Z8511z3c+EFKvJMsDu0S
         wnoiWe7TPvyluRKQWcDmWgXS4bXwhjZxbn42VnOnIVCaptI5qmiSpI9IGuCiZrRrFEaj
         TCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538243; x=1795143043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGiFHSQcrHd3AowG1mq7JE+YciQZY+oV0jLwWTyUCNo=;
        b=MFKgGCsQyOyAgroF9utJ8AJ0b1FjdRCY9s5AxyDR40zc958K45yQSarBolHfLb4wSb
         BtvSHNhGhJOhtwfKPU6PU08eXuQZfZVTV6CRGiUEtMBHXRa22ZtiYdNjWntvw8MOdZCg
         F+81gMTT+xDbTjkSpxYNfg12amZYU9qvjY7Y0LXWs9DRdbpxLdsD2siwSMPhUzJnphkm
         zGWvCoGGLtzBbWYTv+Q69M1FlgbVHqkj6Ox6hYa9x9p+9eoxQqRWfXl/VQWJZmQuhxjW
         TKFoTWBNsJKh5LBadUtkC8mKua6y/Cd2KPaD9cq8qBmrLBq59TmDAWaPUMZT+7vopXQb
         EnLg==
X-Forwarded-Encrypted: i=1; AL+hErEjwAHxjDMo+SUV742sogOuTr/TlqixZxs09kd0htA2pA2nawH0QlNpiD+TuXram+3OJgJ21NYydLHd202V@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y3TjKHJdJZDf9bvu5B2iPNAWSDX1X5AghcIgZFt2X5EDz4Wf/
	PzUzG9DpXcxYuCGpxpqP8qCDqxZAkiLocQjJty2ELInF+LZ2HCGsZnpq3YMZ2Y4Cpoe5ddrNQ7F
	Mw6AyNtVcSYytJh/R4sF73PnDn4FMAHrVanEsRuKGI67WQkjasodmuf4lC51xZmo+Vv+g
X-Gm-Gg: AYBFou0isbdpxM01OVzLwBe0JtlHR/v2ZrXjYlwJauHDs/NQ5VsxGSSOdAKDm5v3JTX
	UTi4eQ5CXAJpMeR8GWJ8Vhc5X5m3j4uyCeJJl2qsgYhtxetYl/fG+kNfyOFWJRRp9DJGKjrNt3D
	ikGVSuzcwJOOhoZ8NCiUfQ0qyng5sqP5nTa/EwRws5/IZEiKwh7lTgTheihS7yxKdIJuiwhcUuJ
	PKFyk95CO27zmHojrXbXHD7Mm+yVWR7D7dIgZMUjzt2IxAQwfQPWZzwmWvvf3guvEauOV8X+0BB
	j6q/Wrt0u1wxdxUwIRyqkHzcmhSA1PYZqFGLrB8pn2XQqwSCyqkjQ32pUlDFhhBC7A/9jIeaWxq
	xUuF7bY8u1ZznNWSWPrg+bxE8wcYSm4USK6w3NXl7MdOfrAYG3boFsPRA/IEAmKzZ208iBFXSJc
	aLmXVQZIs=
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990625ad.59.1794538242972;
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
X-Received: by 2002:a17:903:f83:b0:2ed:1b5:8443 with SMTP id d9443c01a7336-2ee0dcdad0emr11990515ad.59.1794538242578;
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:42 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:27 +0800
Message-Id: <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67b03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=-8ZncIIG5GjyyUODfMoA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX6EE5zTotctgk
 CiFAZc6ihvRFoPXKeJr36v78SpTShD6SnL/P2DyvST3f2m5GXAD1o3h8bxbpeQPX27OkdDBsWR2
 CR8pUtF5sTeNKeU240fbjsXH7i5LnfmJn9jpiXV6aKB7dkFO/LSzCkoi7mKJZ64jhwju8GLGavI
 sLPXrow8aDTuExPyJVFaGk6uecpMf0qyTwxMGEt+GnlaaiTBvZedjeYzneZk0C2U+oC6DfktBXr
 258V85sxbAiLev/6kRgIeQ6BTwvm7Hh/niuVXM4lj0UUiO+RlrJoStYG1VJnE1ITGnRT/arI0If
 DhHBuktkXMEZsg7OGvbtGXZu3rzqPMhSQNl/9dVHlhfyLee/A7cykO2+MSATwjlxGAM3bh9K5kD
 Tpos9iTPmDlIKwe6MsqvaSM5in/hJpIdwMizUnWIlHIIueqyiF+uORNB9S9S4muHhyJtFFlothd
 erzFiOe9FtY5RS93Zhg==
X-Proofpoint-ORIG-GUID: uauW1CCUQnNWKpCnxoZSlXkl2PaHgiP_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX2ldyypCKOPim
 pTVxi2Gnt9WWIDmMBaF8mqdyQxZI7QlAhfscyMGzgUtDonhQPRjpxWN2oloTsyykbnEZBnGgbHj
 KDxFZQ/GIX4TA4wgoyJGHE56GJRbFXo=
X-Proofpoint-GUID: uauW1CCUQnNWKpCnxoZSlXkl2PaHgiP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
 include/linux/coresight.h                    | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..0d3f6229b282 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_ITCTRL	0xf00
 #define CORESIGHT_CLAIMSET	0xfa0
 #define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
@@ -116,24 +115,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
 		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
 }
 
-static inline void CS_LOCK(void __iomem *addr)
-{
-	do {
-		/* Wait for things to settle */
-		mb();
-		writel_relaxed(0x0, addr + CORESIGHT_LAR);
-	} while (0);
-}
-
-static inline void CS_UNLOCK(void __iomem *addr)
-{
-	do {
-		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
-		/* Make sure everyone has seen this */
-		mb();
-	} while (0);
-}
-
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..0168f6abffaf 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -35,6 +35,25 @@
 #define PFT_ARCH_V1_1		0x31
 
 #define CORESIGHT_UNLOCK	0xc5acce55
+#define CORESIGHT_LAR		0xfb0
+
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
 
 extern const struct bus_type coresight_bustype;
 
-- 
2.34.1

