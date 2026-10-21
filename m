Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574774;
	b=WpMBK5eG3/MFijdi5lOXpHA70Sggg4U01Wq3CpESYN16Qf5V+TCgJUTI6ujIX5/prdt9
	 XVZ9iiuLyHs6XwMMNAeX3FFMgOOaZesbcKfKlKSEWvC+MDXtSuKdINxGYu+/QM+EfPvWr
	 e5Gp1I/b/iD0iAJs8wW5wmmcNG4fguip9+3h3FZlD0soL+08et1VVUryiY5WUtTmfXZSj
	 VzoJgBGftXUm81ahlsaGlcoYDuO3+HmdxggkqORJWZNxC9vIzwTs6BZkfmvz6JbLWp9uN
	 Y0NyxAX1eqPIzciCfTJgD4I9Fe/TjNpvvXnQwdLcaZf4/4qyi0xCwi0sBkYPaeLbcaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
	b=1ehgYawrvvISzY9v5Dga1HSN5o3BXmCIS1LJBaipXiokoPEf5dTT4MANTkGaXSm0VXOM
	 1SrsGrR5PMVJ2RX4iDrvHDKPea/f5MvyfZB4B2qtjkRUwq8N064LOPHLSIafDMO9dSjGJ
	 uzpeEX9vkVTAYTXdWbN0eFoqE39/7v7bKvk5Hq2WnR8Cglgf6XDhkG1qkKt7fWKi5Dwh7
	 pzzzNcWC9lzQVQ24IO9N94XOmxjdrfn4p3EnXipQERom/7aSN0l/qfWGIFiDHdL7hl1/T
	 Nom8Aov/VLmYVIddW7FzMA1Hw2dvVVySA+tHL3aQrAtAjiUNPBuIvSLIk4YHazRpDxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwsZCwkc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F4606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3F4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JwsZCwkc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6se793336
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=; b=ZP6RJxAzcZY4H2aF
	/JLzUqi0gmvmU9LyRhTwvotGe6RgfZ/IHX4qdNcnPEvPLH4UlfQsmi/a4bUta+Jp
	6S8371gAAdiWU+V9ADN1fJT/tsLhNPQdTnAoOcYGH3QbnDHJhRNKo2qCrrYwFSlt
	C66v7dC3D7JHEbzGbmqyDdglCzBEMxMttFb38whW8HghFvbG8oa5yPh6NqcDWrK/
	K1/UiQ/GtvXh/unDC+dBoVSmCBFU8qJY9ST9b2QH9W1M3ZVq2VF4j11Y96BninVT
	S1qQzmXOR8950y0MpU7oKNJZum16YNeO8sJlYHHb6nq7MDmZaXbn2OQ/mGauXv6J
	77xVUA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk8pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:26:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so1051372eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574772; x=1793179572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=JwsZCwkcrDBzUDPeMBtG3IJKvLQGzM6cJjHInM5/0LpRry49KlTj6VfA0hlNptx54H
         urwOIQ9fvCi3xOJ1vU1Iti3l+iZ/FtNl8C5qV8G7l1PGEj6+h4sHV7HJ9ajOn6TvrGrK
         i7uVr5Mk5M9djx5Qr/iQFbD/d0GMhSHoagUsf+lCKGIegn8q1wTFVAfHBUlkOMOR5cW2
         SwNU1RfaT2SXhpWqf7Dflf5hiDgGWXBTvfhDU70SG+m43NUhR/BD1OkVxy5e5nAex6WG
         j8o2dqgPChUJLOOTTOWjDCZoJjhcQIo4W4yNIm4EgeAmDIXx1ewQJQSnNqZnMFD7HV6e
         uMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574772; x=1793179572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=nSE7zh3cwGawSQLEmKx14H7Nh2xc6ocgXRhj947H9W3EBORj73XgpfSgR1+f6y3iK7
         HXPpg9FihGNVV9+oXvSZS6kVwMvTatvcnEQQjS9Jjgu2PwNs0uLdLlMvbKbrrrv7ttCQ
         ZCjYs4qCNgt32/j46HwWavUbOUWwy1O//N37nkmYorRQABZ1w5Bl8/7awYglAMBOdd0N
         DUabK5MI5Tz3Wf72d2UWuNf3dhTm6Vv2KqcoNnJZc3Sa6pmi4Pk66BYxJu7CmGslN804
         WLgrsmJpsSaa9zyWQwmahOH8gNTNJcO6vPdYIezFBR7AilPbai62LeNg5PzV7GUWA3hl
         V3sA==
X-Gm-Message-State: AFq9FYIaTUUOViLMOxGWfWz9G+M//6H5/nId4HWXEuy5Q+Pvmmkon7Ex
	y1fZFQwCmWr0WR7JkIZcakv43PKjof1/T7wb37twrqzEr1AcaK8u8yvMaHzjiCF2MN2oENt4/zl
	tmzzCJR25oElMHcZeAlAL5KVeMM5IT6nEbnmQuSc0lI3/UVB/vOQyTc1Azet9nZNs8mzc
X-Gm-Gg: AYBFou3zweSwF3aU+MX1HH7rYF0nxqUdjZRorwov+DQP9BFYbDjRZMnTGWG0Mkasq9Y
	E0aRpG+xhPf98BvHOYyKyKzwu1R5hYa29Dox19xcO3Xdf4VPUzwMZkO7t6ot9ngydOuFwHXeFtB
	g0jqQ0lv4sFgr5cky+woZfO6twyif2Nu+LxfBPHTlmt+pkGap2Gar5b2uFnEjuAL5XLRcsnUCJE
	pDVFRuqJQwEn2r4/l8veZ2kXZH1vornsuroHNPIIhtkn+3IGWb8lqgVeowsHUT8WW6fu3ROK+dB
	UK6BDQCugaUAvq40djyq95IFZ8wRp3bogaRIjFYYEOKmsnDVh1cX02VzV0iVD3N0Ov0VvmtmjRW
	OYGlNKPmPGDXGvebBbH5pfce8Od0dzv0V
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438748eec.28.1792574771970;
        Wed, 21 Oct 2026 02:26:11 -0700 (PDT)
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438721eec.28.1792574771404;
        Wed, 21 Oct 2026 02:26:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:10 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:48 +0530
Subject: [PATCH v6 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
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
Message-Id: <20261021-dup-sessions-v6-2-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=3363;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=hoyqKe3Xg75nwp77nhRMqSJ1qCMhXfgxFsO2RjAVi4I=;
 b=LC1PJt8KXbUZfy9ow4duAZddRfZhmxUyXouyYDY/1eKvG8XU9wQLssAvCoFt9h3kaF+wkgumf
 eoG9rZcAutiAvulGWlaNiI5ZQ+5HfGx3D9mV3LidBOK9FZ36auSqBJs
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/l5Zet2eHYuK
 XZvyyfx0zcAdQnQJx5NXCjgZp+d9BJh/oony+8/x/w7m0z/lhciCSTJH60IFWX9uYtL6BvErYFl
 IzCFzjrg760h1/kYU+6qS4luKHNsWA8=
X-Proofpoint-ORIG-GUID: wvjtSbHytBGKbw56F6qTbnqIBbPHzAU-
X-Proofpoint-GUID: wvjtSbHytBGKbw56F6qTbnqIBbPHzAU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX4Zo9vZQ28vEI
 MdhbKhTzJ9ZAtVET/fhch5v3t5Wbn0Pgz0QlNnUNcpimMRRkKIsUR2Y35GhOsyKFJEkgJvQeqew
 zqCH4dEE/Vyrahlqaxev8MuculSGL9p9QaBiu0h1bGvRJxlGg7lpwmxPEhsSVmM/1jIRJOFdJd+
 /bJrVyWgWtzSgNzVRtx4ou7yKDABGEKomz2GnOdKFMIBP+6seM2i3PgyciGg3Kwz4x7GdfBjS1T
 vff96lszQqNlJ/w+ibsGoU83RhOFJ97NG/syjyR4l7i4hhb+oN1CZCSiTSwf95Kxve7+RPssnyr
 BNpcHHNeXEjk/y1w/GypJMyY656VIn3bw2oLg2uegdo5+10FK9W4ny/00nSXJM3iKTBg9H2T95k
 Tbj8uDEeAcdtyhWAxou1fIAOVi+D4QmbZq273t884EfJNkERSv/kD/sqeWoMJYN15ennygjMjVB
 GVxlJX8UHU59WdFUj4g==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad88534 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, qcom,nsessions = <5> was set in DT to duplicate
sessions inline during fastrpc_cb_init(). This policy does not belong
in DT and should be handled at the driver level instead.

Remove the qcom,nsessions DT property read and the per-CB duplication
logic from fastrpc_cb_init(). After all context banks have been
initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
copies of the last session for the ADSP domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index caa479f304c1..5dd1990d3e2a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,11 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+/*
+ * Extra ADSP sessions duplicated from the last CB, as each CB supports
+ * only one session.
+ */
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2338,7 +2343,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2352,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2368,16 +2371,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
 		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2656,6 +2649,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		goto err_deregister_fdev;
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_deregister_fdev:

-- 
2.34.1

