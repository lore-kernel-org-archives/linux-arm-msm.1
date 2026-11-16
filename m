Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814900;
	b=eJw9CmGGEvLf91L410lgQtB2hGqTS33ms+v1DW9BUBa1ZmYIo5Rx2f2sgzrg79YYTeT5
	 XWI1iWhHIZsCLl2orAvKKP6ER8dp+hNocb+NV8FRR7hn0lwSBKGFrQ61WzoMjgZPt2BXw
	 oOP7ki8iyxMfswh7TTA5vg/MM5x7I5XdoifeD0NArx4F4GUGSZT1LPfTTK1webTByVyXo
	 T215pcSg/7jE6bUBprnRg2fiBKo7hrPifI9LHwET+dgfHRsiPpwCxB7RhnptjxWkdzYj/
	 j8XKyFqhT8SHvomi+uEjsCRVLqGQv1j2EhV3JCOJf8HcgQWvj8CmQ10y/nvwtmYclYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
	b=nYP5G3/lMocZRTw3NNYORDAeATJ7DVsrScUbXM3trKq8WuHTMf7X+a1735RyjrfCsI6E
	 37N+x5OWTwEVH+yv/V5vqK3RhxIBUIcOZRXXypysa/GpQyWGUUmF664Q0p8YSP993wh0r
	 9dpusFcvVfd8WypDBr6wZxdHkukMMwWA/YWl4v9yKYcxJutm2hVd9ynlqRZinCkLKhOUz
	 iM+QeZYHlI+gQ0QJ1gt6SOgqv7cKT2DRr9Gyx7sq2lTMqlYjjiRhoNQj63CiaUk1lAHDd
	 2Vbk0k0uE+mP3KY0+Gw7OM3WUhU/0gKFNGnc+32KhaenrPGxgFUCL9wLUbaQ0jDB6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFD606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFFD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7es4r524902
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=fiD7pAi5zEstA8r2Vs44yFkqR4X
	YvvFq4o52bSRYK48HE3aQquJlX6w70anF31TAXrQ1eJdQ0xX84w7A3lTBMyh4uf8
	GDH9NSWhY7V5P44oAiF2I/pzBGcs7KiTkHiZmNyLcuqnqQokHS8jAJflVfG5tAhX
	9Pgejhz7no8XiyEPWmu6DxmFuJ4ezoGWC9bjIkaQoCCo4vL7zLycSIyEovbWPoER
	CWXAsaadk2p/vpIu8+mV3ai1DSR2P6GiQobPkbwPR0WWj+wvLIC5eSd4FSt77ilS
	ixsJdNilDpEsS0dK9FVYg7fPnLisGW/dbJU0MxZ5EdiGe8S238tw+Y3ZNhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqnga8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3840730eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814898; x=1795419698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=VGgsOagWNNsOA3nfb5HWNgKKp/k2uhs412HNm96pKHoCrjfnJc0hTNhCqeN8ul7wNv
         8r8YZ6Sr+qhOopKYFJtM58b6YRMJP+FuAckzYitTC08TPQldNV6cFhcLTfS6vuwVzkP/
         ctQt73DiM47ZYv0kXxBuOwrQ5xe+8K6/SUovnYF7t/QrG3qFfSWlsgCtAR7j9GpkxNaO
         o2CI6rxPt5Qha5WIdA61tgrsTU+xfuST142c32aVdKZplSZpkAU7aosHDBPXGZGjpVqu
         vgwW1iO4URU74xqzkJ86FCYWlF9ER7UhuG0i2VBkdv+mJ0GB/xIrwoLSWaiCVBzDHXXp
         zhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814898; x=1795419698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=SlDVYU7Qy7uWfEJjcpkmuBXdF7dzGRCx84nfAZHZNtMYolCHzaXVVsI9pOMMS4smbQ
         zuSr2EudmjymoQSBBgMe/bGZRnPg2BlBAjXG8CB8b8tnuTuRGCP1h09eetJ4kvHR9W9F
         VPv/S/dWS01VV4VnxYqRXfKZM4VfBXVinSSOqQCGsSWnzsmBi5YedqvEvzAP3gwh8F17
         h8pl/04V9rZq3HizkTTQGX0uWtxS+3SziOM2+A7AqG2p8/Glb/mTFhmyjpx3TjIBoIgG
         ukDBHJZkZTaNNjJgJCN+J+8o54EOfw9ED2FWREnqPk9Lv0qg1+7dgA6haveuTUai/ZrB
         ECow==
X-Forwarded-Encrypted: i=1; AL+hErEfCoHp4pyGQ22GXWREbX9PbnVKvDgz9/SsxMKReujZmCidgfQvbowyG1SIY43xua7AgwaWIGqXiUz1u4Ne@vger.kernel.org
X-Gm-Message-State: APuU4Z8eHqGmj4zEKX8CaWIYyHalT64iALQeMLpW1wZLtZFDl5Raojil
	lKqEeUVI9JSe5IJ+muBVl0z2gVJCWgGPuiDKULF4rpqMeP6dhJqaJTUDml2BINywxKU7lGEebGw
	NclOhHXe/Z8M3oVAMtN+Y4dheapcttBRKeHPa6germDaKzwIzVgdHOIxB8YBjTtZPk6HD
X-Gm-Gg: AYBFou1MUslTrovZqPOPkFp5MRFQyri5p6BEEysjbFPN1HaoAoM2qSfkRONIFI5meAu
	47t0X4BFTCYqCoGSTrVVd/Qz9F220syitaHl2fewZ8DvHXXPlfJNzD0DqiqYMzQBDtqi//QxrV6
	r27yNqn3h7dKqqVrAfcj5QzF/oF/IIIq1Cf27n03Bth+ydg4h9Wu1/Ut1cVnrPZbOOU8nU88yV9
	Waf7/1A8qXLEWe6724gH2CD2VxDyTl16tH77ZV2NGezVPghgKFy4keFiEfUG5+IVlSRVXIobDTs
	OrpZWOfxAmGuJCQgkYEBWIGg3ArSDQKxjZbiM3PQXHEOcULlFfzZHXWr5B7vcLaDIH9XIZYgO6+
	a5adjvaL6Xueno6NksPs0cicVoDtzM9vSmK+44UxrW4pxFtn1MXYoK1/+KebcUmiZvro5HS2ya+
	azlLcw2633gyQrXkDdiGqqQsWkWTfrsHfDDg==
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492323eec.27.1794814898011;
        Sun, 15 Nov 2026 23:41:38 -0800 (PST)
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492283eec.27.1794814897499;
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v18 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Mon, 16 Nov 2026 15:41:12 +0800
Message-Id: <20261116074118.822731-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afab3b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX6g1jzy+hZDYB
 av9PHnOcCtOcxTBZcyi3gbb9opszhM8Uj7BQHmkN5Har+1I4pqFUD7gUA56hYte02xxfK/ijCK1
 kdl7jIUt/MgUveoapkQP6eQTwe9PnE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX9kxJuWAnwgg/
 sOzHkLC16Nd3vLsSHbBV+NDqSPnTfCRn9957XuahKGWL3iVyAEPId+fuvQPmp0Mh/UOnfDDGy0E
 aFMrmoaMXRuYQtIOygI3hpyWs0kp3HADZLhDwiUe7UHldCgNv4Qyf7eXl+znCQkeonz0STTF72F
 u/FQFpig03twdEjcdeOh6xib5S6B+pI8uByB6o24voXX6fpZuf+Xo4dYEw4UrO1EjIc2jNcWVL+
 W8BwWopGGlQqtcK9A+Kg2fl1r+YaklEAjcCrDr38ArHDVyR5h1rNuS6R5voNf8YSO8bSZuaMEcl
 4EobN1MTn5FhE2pCP6NXsSj3QSTQbF+M7Sstsnb9e/QzpbPZZhIDaP9Z1G1SWFmhxjiHi7xKtG1
 HVp24XVKJZyJQ9Pu+4Rk5v7I5179w/mKmnKKyxz1m0G8NYU6dJQ32hbGfwcMQU/psOiNWRR4u9D
 qLRjZjNxLtY9aHnyqXQ==
X-Proofpoint-GUID: Eoe35Mi_AYj-Q-JDcxNLbbI-VZdmvaN3
X-Proofpoint-ORIG-GUID: Eoe35Mi_AYj-Q-JDcxNLbbI-VZdmvaN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

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

