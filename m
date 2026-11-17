Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900809;
	b=agPz01ph9Xqth17+4TxY3QO9jjCtrxA4jqLvgsPetNwHVnKj+zHw4UBU66JTxOaDqVFR
	 N0IV4qS/Fl+tVvn2SedKPG1CTipiniJaGMK2P/Muafk2Ot/EdFQ5uW4kDXxycn+Cm7QKq
	 2YramUHE9pGjQFaYYa21kYRn0i5XbL2mMSTxeA/m7yVYU6sCuMrDI13WZvgToMpX1ezjq
	 IN7wVjACbaGsOvgxnzHHI8sMaihKvAWwsvEyq3nfW67w3K5/c03W+zn/ZKXSxm71knx5V
	 qmwR41UHMp0p7f6R866xjrJGxBXqqDlm8VJ4glHv7MwpqcKfF+pCQe2DkyWpSr1kgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
	b=axqb72QLWv5r34E+zpRlCz1p30SLSmPgCi05PWnQvyI2byTJPp8EzjhNyVuW6setmUcN
	 rawV9udnZfDzLRTrNHFCefoJSK0ckT38lUKDAAaux7omrxWMyhhHIW+NM+BvZCEPJpxdB
	 jbzdI6m6ZdNE9vtDFL4PteezDe43Rpftw5KjZ0fqn2fpRlNVsTRvKPqp9aN1LOLgbYjmD
	 p6V8uc5ykuKJgRtj/MP2BHECKQZuQXoN3FbMEXyNAzCbw7qOV8vD0fv4zdYedx4LKGnxc
	 //rZRLn1jVW7LbhJiFpd/FGkeK+DVC5H50Kecjm+mGGFIFyyk+X8vFsL8b6YxjE2OXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=McviBrH5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=al8J3cNd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD7606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAD7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=McviBrH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=al8J3cNd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aEJT4146662
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=McviBrH5ot36gVyf23ER4mCOgxt
	0YYd/02r4EpvN0INqsDq1WaPFGHhYo7c2pODJIJRbRoqaLVfXC8oHOgH0rEow9uZ
	cLbGDg0N2KHIahNMZmJfRYiG4uh7x+Usa+Bw8+dI2Vlf9fu0plaYD1rinISn7kdN
	6rshjFaWax3TSEia06b/HwQqsLzdA2PlTt0cdRnz7aiT5+5eW9l+f+Xx/CyZgFoP
	qNWniOsHaJgCDDUhLsXXXoNlPfTK8MM8yZtB0W3TpeKTsVXwrOI3e9wRnd1vjdf8
	0gvZmepVTpmW30KStzzAThf/x8v+4WvvHv//MbS44UVavDetcJbt18p3maw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfmank-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8628955a085so5733366a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900807; x=1795505607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=al8J3cNdHILSBFYmtYFgD8NWEwkrtjIZz8WYEE2AWEaMRU6QflIJ4Ww26N6j9AzzCS
         jfZ3lwfBQ3WDOlcRgzJOKGsf8gdoSQp7oDpHPs1PMKh9DZx7C9pfeWytfL03PZfCsizo
         dxCjpUIA+ZrTpcvMnOC5XssNefoQF3qbMCKxNJPPvDzi3SyQ/L16K0OZXttktjeRWBIL
         6S9+/nD8MM+e0DcvVzdUkcL1u8kP9Qu5mlnJPpgLPFdaNvsh19FV55BSwK6Iahjz9lmn
         F831GpcEcNPIb/ttTI8/SoXbzK+1bC8q8t0LpKCZih65dCRnYhBx2BATvzsLnlAlMwoA
         9h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900807; x=1795505607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=BOp9CrWOkvASNqDMqdM7897qWt4uHWtin3ZH02HWOmjmTPbwhxOB7lYKjTEpi0Eu6/
         HqKlPkvmHpE066Atws+1HBkRb8arHXKaAATHE/GMq6nE3T9IbrtzCO72rHUu17Q7ognL
         Z3KE6ESX8e804b/P9MkF0mlu1BFpV8P39cJYNJ11fubqCOIe6D4v9BiS+eYrVa/rvQdx
         j3VmNCtRxkbigyyiVpK9ATBlRROzReuN27VKKRXvIcVkoFEDeq1ouFhT+gNhlpAvz1fi
         Q18R4aVoeUoRtEyZrMhBqDqPFTrpMr04wZGJCCX6oxP+bnYhIT4Al+WKxY4UAc9hJ/wW
         y+oQ==
X-Forwarded-Encrypted: i=1; AL+hErEGweykwV0HElQexTK3jJWmwl2WXwdOyT0jhplvt5Klknj8GpxSbn/O0QwzRmj6qxO1HjCRzCiWSEaPzF6S@vger.kernel.org
X-Gm-Message-State: APuU4Z8jxNZpA0EkGfkwkuJjhcBd0TmiEThvfCeyD71jWHLLTGFr1Nuq
	AOlE46yONe546locCGh6gPchnpN2kGcbOVx+SzHYFHZz/GFT3GX0KNtAriE2sAQEuHb9QI8fdM+
	XBM7cbNi3+/8LzacKnuQTZCo+KbGkQFNN2oECMWf0BcpMd4j7qxyKsXqhQbVOnl32q/zj
X-Gm-Gg: AYBFou2tuSDM4WRmybDLUK+6iqvbTk2hv7RsK1nVBJRRFzT5IHm8fWHVAi9Rkm8DUx3
	Vq/QHw0zXvnUVeUSs9GrWf7lbF/RaK+dfiDjqEhso0nxtW1vxXHDaRouoRy/tLraX/x5bdmgYKj
	HqmqSt6eyrJu3EKSvlLTlofTP3kOKn/JKoww3cRlklyd0TpteDe50FNKh7yfIaFTedKs1qunXmn
	r7qxOmFAFfXjaheITa5R2i3PHHMVwFDtawL7xZHd4Log/Ol+YeMltptHuD/7YRu2w1TP0NoI6vG
	DNbJA8cNOYQV3ASTw1ByA/a2SCi0dJ4eyFIp6EiMVHoyYgEgU8mpJo5Qk3kJKXpk0QeVdz/4nHy
	0PKMFRCY3dVFO4BGGGLAqW3XeoFUz33rRttfZZFcketjgGkTTI5GWz/n5qlzRVuDxI0G9CsBJxv
	wRtPBJvzxdXrq4CJgWdd5KJYcnIO+w5cu4jA==
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933557a34.30.1794900806834;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933538a34.30.1794900806329;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:25 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v19 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Tue, 17 Nov 2026 15:32:59 +0800
Message-Id: <20261117073305.3854951-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afc0347 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=EXS-LbY8YePsIyqnH6vw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXyV+8fMR1rFP9
 SBJ9tSBDnP9RpFDBWGPCEtmKYbPMsNar49AtmHhSqg37pK07yAhBlwhzNo3azJ/1Mgdz4MjR66v
 1ah4OuW53ehAPE3o7YmCRzaqqvtukOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX92bynXO6a5LQ
 QDovtyl5/HVn8Z1+orPREJ1busEDNx6Tu8kX1ILXi9aEuQ7vZjAw/odFE6HYarqnA5s9SeCeUpn
 sy/uirH9X4IHX+cF/WwsZ1WXblbyzZJDzB4Nmbbx25HV7dsZzuhe0p3K7AC84tUf/PYb8e4GSQc
 2S60N4AwdXA6DEi6Vw7ZoMJKUcWdgGPjX2m1lC0D3UDe/+7gcjOUJ/4WmBaYYW4k+RAFA+M41jg
 BWHLGRbBJtyyg3zzN0UHMPKwDsT25qFbVgxDhqDafHXZpI752otPjoLPVWGUS8taz8SomeWrezr
 QUpCT+z06dTYqnpfpXGDuUN/41dL2H1VFrFg92Dk/Nu1fHzWAkHPb5zqjLc4JFLUEDkpqnaAmcK
 hhs8HVMGbhV+wM37xAocT2O6vAc25oybdqefRHlAcY9XhDWt/nknUgj3WbblDokPO9sa6rH6Ahj
 MdCkZYDhZH8wpyCHeTA==
X-Proofpoint-ORIG-GUID: X064v18bB15QbSjeDBcxCEvOQb8KDx2K
X-Proofpoint-GUID: X064v18bB15QbSjeDBcxCEvOQb8KDx2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

The remaining CoreSight management register offsets (CORESIGHT_ITCTRL,
CORESIGHT_CLAIMSET, CORESIGHT_CLAIMCLR, CORESIGHT_LSR,
CORESIGHT_DEVARCH, CORESIGHT_AUTHSTATUS, CORESIGHT_DEVID and
CORESIGHT_DEVTYPE) were still defined in coresight-priv.h, splitting
the 0xf00-0xfcc management register block across two headers for no
good reason. Move them into linux/coresight.h too, next to
CORESIGHT_LAR, so all of them live in one central place.

Also add CORESIGHT_DEVID2 (0xfc0), which is part of the same register
block but was missing; it will be used by the upcoming Qualcomm TGU
driver to discover the number of implemented timers/counters.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 34 --------------------
 include/linux/coresight.h                    | 34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..c365cd881e4f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -15,22 +15,6 @@
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
 
-/*
- * Coresight management registers (0xf00-0xfcc)
- * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
- *		  Trace		registers in PFTv1.1
- */
-#define CORESIGHT_ITCTRL	0xf00
-#define CORESIGHT_CLAIMSET	0xfa0
-#define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
-#define CORESIGHT_LSR		0xfb4
-#define CORESIGHT_DEVARCH	0xfbc
-#define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
-#define CORESIGHT_DEVTYPE	0xfcc
-
-
 /*
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
@@ -116,24 +100,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
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
index edf2a2fc697c..1e2ce7861ce0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -14,6 +14,22 @@
 #include <linux/sched.h>
 #include <linux/platform_device.h>
 
+/*
+ * Coresight management registers (0xf00-0xfcc)
+ * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
+ *		  Trace		registers in PFTv1.1
+ */
+#define CORESIGHT_ITCTRL	0xf00
+#define CORESIGHT_CLAIMSET	0xfa0
+#define CORESIGHT_CLAIMCLR	0xfa4
+#define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
+#define CORESIGHT_AUTHSTATUS	0xfb8
+#define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVTYPE	0xfcc
+#define CORESIGHT_DEVID2	0xfc0
+
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
 #define CORESIGHT_PERIPHIDR5	0xfd4
@@ -36,6 +52,24 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 
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
+
 extern const struct bus_type coresight_bustype;
 
 enum coresight_dev_type {
-- 
2.34.1

