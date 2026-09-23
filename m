Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42344BCBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152833; cv=none; b=Sz22TC0vfr7bUBgIw249jvMgNEADX7J0T6sJxSI0lBgVEV0YaolTIDOZTiDFjQPF2r3KWQN4wHOLpwPNHK7GrkPYmRONb68+yHPaD9xYW0GZoUfeYM7N5AgOGZ5d0VA2uVGC8bOzjVOY/ivUNfv5V1DJFToG7K4L3kseH6yVYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152833; c=relaxed/simple;
	bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWxwPr3E9RVcSHPmbHzT/Qfx0Cm+cU+r6YloSt2e0Ah6O/mWmrEuEfya32W8QhzerXX1VBcmmcfY7W2Exx5vUjKIcJvuWQpk1BKCeTrsJTMm24VtQmGVa0WKd+Hnb2/rAC0L5HekSZh1bW83+u7xUPfgh6Bm919vZYvV7IFybgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7wMsSmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFswQ/KZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7wMsSmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFswQ/KZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jl4f3333001
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=; b=F7wMsSmdgQjLZvU5
	2CCvGGk7UpLvzXxhElnevwvA0wsK9FI3rJEYg/KZD7hXBDDr3zX2kwhd30kFL4yX
	pL7CHa7xVSl4YTWqhv6e/ENys4ZL0j4eF9hb6xCVWB6IpjM7HNMOnaKtC+zpLTwI
	uuGAj1aCD1L1LEQ1GVnLHE97WPS6ojYWH3Wyz9LAt63jbITK+nxqWk0YT44jaRh7
	RAh7s2beQmihwxrKf3SRvryJAcDrG4liVjFCvE+tD7thHOP+JrjdB/hJRb8UV33S
	8BGtfwWAfCawmZ7YvQjfIRxV5gLZQpzPwPfdW3hCDcDfHF/aBuGxjYEeJK/nKcze
	FH/9ZA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xudp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32850005b6bso831226eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152808; x=1790757608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=PFswQ/KZCxnZgDZFuCcQKqcuDAY9rhZ64vMyom8EUdrpg9wfG9Dx/UUEmocKdUTJUS
         gF120xekdgn+VqTS1QGruM+BpDvZhrnNjNkBPg4fgef63rdT0C/BPuwrWXlNrqJ5GTtW
         ZWsydAkhyXNRJ5tkJGfU62DWULCFJ2LMc2HBFwRgYNYGki3Cn5IBzxWkRoMOW8dXJtgu
         tZvrifjcdJuib5zCEdIx1NpUAFAwhoTroL7/E7WmJX9wbBCOjN55SvyPoUDpcawrKN+M
         OVOf3nPscgqI+yU4jvkwLcwoHEua6BajNTrlimbLCc7eS7Uz7bbvBseAJfVy0Nf8SpuD
         Gn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152808; x=1790757608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=kGGxM1+cN3v4+4tYRizPO9EX8XMwDRag3fyBqCKPKEQ6Wnj6l1WNwHUTHpVv6OJ1Hg
         eu4msHF97Pe8uuTsAR0ZsYgDxIJV5BvhzibQURt8eJMFgFN4zJx8dNYtuq/ZHLgKp3i7
         uJ3BBI8ynsYUj+Whr4qGDjkjT4WzekwxhmvhJ8eMwu2t+7vri3KpCGP6oaAdBg9dCdSB
         TLzTDK60hpJTAjN669e06RbZuRJn0OELIpd3FDSgVUSquUjt2szkXi49QeVGF1yicQ7e
         tfYwKJsGzErUuUG8IKoKENxgBGU+pi4ubLTRUldKYSwIxJaLqWW1JOmjftUxarHissl2
         vh+A==
X-Gm-Message-State: AFuF++kDQtqR8Oji2cqnrEyZkimAErsGSglmDc+Mk6dMKKi57LfNgKGu
	6hOGiaHT218ywO5eQvsICYk830uOdmSdG3g13ZyrXCPTQQWvdzSjEk0c1m3TD7BMyHgebyYWMsC
	TZaZ6yPYzyGU5Co+Vs0IzgA8S0q9hR2GMfTqvnmSMiLHu7Z2ENLKX8/sHAq15MGkqJMow
X-Gm-Gg: AYBFou3kuTP3G1J242Jppv1TFsnaJFCGjZegp3WoSayiVDFFz0/NNgPBxrhCgLrnmIJ
	UDkVnSa5765sl5En9jsyS4uN0ZBX8vKbbj2zAWoki2zUwvt6ntDmG9SK0ICICpRCltfNDJgHw7w
	JiBF8QMk66423Q5sjfuAJU9NdaMFkeYOS4IZvkX9hujqkiggmUDpCfWGvlfJLeoe5Efs2nU72Ie
	P98z4rGZolf3yEiLOiZBQik8lT9r0BRwtToIFAgOhRv+7KRHwKaHuTCvoraY0HlAe8kn7MfhRHb
	rejj0oivMY2NEPr33xCyInf0UXLpfojbUqR9SjIajmwkfoxomy+WmDqB1oLw661iLmZHD2JgRN/
	LdNTt5drju3RkI2sv6uZTm0N1DCOLML0T
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854807eec.10.1790152807811;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854783eec.10.1790152807221;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:06 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:34 +0530
Subject: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=3250;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
 b=N/29XZZ2KO5pgju+btB8IieQgG4KOSTd0lXWxo5oi7fE1R/tYC2WmQBPt/3FoOvHUW/mlk4Ma
 ooHExQpQNfyAlOMaLjv+Yvsy7qeMrbEYL09rXJTHOnkEbEpyCXUiIZ3
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: JIlquIEf9n9U1tBT-zYx_IN94Uc2_7S9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX5/bDI8Q+Th4O
 Sm0Xncsel9M7nJBf/qSovjOeXMFOFkzsb2wEZvC2QktooZKdTCmez60COxF2SEmUonWkAU3Es5a
 nNhFVaJ0sgrs2NYC7CMUkIZgWrBdD8eQy+kvLmsyjxizmpAPrfJ9uNmobsTcCzpH4l+sX4bST7B
 jwhGPbPc8AjXeCXqwwzCbDi5pIlylAPZBc65UmRDo0iC1bhxoS06Z7boLlPsoRINMl4hbcNJp2g
 K/bJsoEGR2ZBdwR2IpeFjHuo7E5nEYCZx5ZN2JXaesCKfqUykwtzVQTvwUscJHrM7hoLmYoF4uX
 bAhKh2RCwO9ULk0oyNTQc/1w13+I4BOfmkqIToDw7PGTKkHASN11fAJI/rM7jct0o81pHZ7QhOX
 kZI5o6pZnQy1II9w/w/6W/A92RKNQHIKIMFw0p4kBjNCrUNcYqiNLrz82wPRJ6SXXprSnPH2uyS
 VZctyzKX6lMlTfIP9wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX61LLAGs6shQ9
 8zyu2oPrsEssdbUlvSNJpMReoZxTVKh9fx3MC9C63ZxB44Q0Dyu2d+GG+ExjpJH5GXO0O/DK82I
 EEv/GbnVNwGbxeOwOH3NhzP4zeesVus=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab39068 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: JIlquIEf9n9U1tBT-zYx_IN94Uc2_7S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

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
 drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f20d3e5ecc81..b29c1fd00de2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

