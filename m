Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15673423E9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750779; cv=none; b=BHOY3xmCh62zb+RjkvVnh5lUl1fgSwDdBBKX+QSYJ+pB+BUv+LupI7Y6VnJ2yQGlQ44FqukeDNWQM2nF1Vpi/5tF9mBGt7yfowVprTeAbzsZHZjYhGjV2rDrbM/qOyQm2n/fRXB9HlnlqQ6h4Gn8enj6536TqgU41yc+kxqUZ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750779; c=relaxed/simple;
	bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cq8I3FIoNAoy2t8KVbsPROeu8YBd8PEzcb5OdY3Lzglun5BDb5XHYnH1+xRkX8403E/XEhLUwSaylaHAjgyEf6wMJoYCWGSjoQZRJmDu55FcmeD8BVbsrTh58JRqhILHYNHhwpe/oriuRYW1bH+El/azZkCPEMtEFjcwzZK5s78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBuKGqmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IH2Jr3QI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBuKGqmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IH2Jr3QI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBvEi1909311
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=; b=VBuKGqmLiocUIwHt
	0iPDM39Avaueimj6DQynSuQtrxeXR2hrt4lUfIu0mKH456ajW4UTxZMwiYvEZJ6t
	Qx0AKeeVCL4Ox/EZDdLyuTCZOfe3hl7U52dY8dYvxOGn7dhb6AaFBJDZ8xSxlrkU
	1U4bHrLMjoik9OGXK4iWtCYkqp+oVJNTb4Ys+DWyeORKWr9lr4XyIj/JLpAd/5JB
	nDORMRVKOQv8rbvrCupunqmb932IItna0cLDS+oJvkfzkOtsPiOl44HayYT3qBew
	mEgLgk+awdOc2IpDQ/0Y4Mkw9PC70t2BeA64JfS8G6Gxnv5q3CplY6hpP+PzbrzH
	vB93KA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1se67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:26:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1458069a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750773; x=1788355573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=IH2Jr3QIxpyMYt04ajQd42juhtO6867RSDv4G0VtQtAagNTzoZdX2C/qUOXMJQiqU/
         drOnXI0kidAbFtOhd6QibbUfF5qbiKsxV5KtTBccocvZYIYJ4aXSzbqGOT31huBMZ7pL
         HTWOt+DFKmtOpsYfIeN5VMPrthUG7KwUHvmHmb6wGXtCG3fM6aRWb0ywWvA1WjRfm6KV
         SoBpSMgY8XGFQ064rFWJKX1U8tolPOygTZQ472ZhwdiWJR1+dkt6wHb8T7DDjWnLHOCP
         EbTvfg1rMrN/RnixlX1VZ/j6PJusYbcLj2F4RhZnNkYMXgIffPtgq0ILy8TebL7GBFu4
         1ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750773; x=1788355573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=ZymkoVNDyi0HnIohISckFUQn1WrH0TYgH1DdVBw0H5r9cdHqS67YK3XKxEu3rbToac
         Mh2vS4+kEGS6D9p0fvnpx+jpj9pNJjMiAkOEnptdvUo0qKI2aNs1kGAYzqs8uSLS12cY
         3kQy/QOxS6chA1UXb8hdpMEk2G5YE5HFF2iXXjYEVeHSscTg0zS4434sHumgOkcUaXGK
         yOOa6m34IoiXM2QXOSyGDpsz1zqJf2d+8ABLzXtdnwqAScRq2Oz5wIUbiyefRR8CKu16
         CjZ6uXkcdSzKZ4z5OCNsxy70oYYYWWCD1CUIYTkkvwS2qh2skC2IcEoHc2fMi1fAKwXr
         G/Wg==
X-Gm-Message-State: AFuF++n2imX32lbAD/YPSRZd/dqokn07xyKtt7TDkonwjfvFt5MkolRL
	BkhtnHzfdPy3T6hJD1nzLUKhIjSiEe2WXkG8pmBUNoHLpgMrz7gI8ihopsVCx1wT98AfyMcEV2X
	Evsv4ukruUwM9c/a6e8OgjNdPfguhxdOmMTbV0Ix87dz+k2ezKS9eV3SeOnl/Z/GhYnts
X-Gm-Gg: AR+sD10UWb0/R3aih2IYAmHxt/ntLF9He+F4njGJxSxKBbIkrd8fnX8XqVsXPxXNAOL
	t++MMAmkvH4Ie4SOH13/rn2hA5QSCPVzXm4jBZL5gJgsjU1DNAhriguorUGsXug0PCbcT8AWtYy
	iUaQ5ItIBDe9GDJI5FUbrwmSoVD/0kvXmMBprinwM1JwX7DBj7MWN+IS2Y8GXSwZljw3dR2G/1D
	rF1b4VQEiBvaiCxdbxQ6zF4S17PwFpNCUqfBKh0n+nD9MjVobu+6lsL7ieD8O3otwntLQhdvVmS
	jxwfPvU2cNmmd3M03V3b6IuzRc8h+S1nojhQ3QJlVEL+BtvIUCz1O4EJ5QidFVcxQckhIV7le4s
	FwDOS3audfQ+e22ACfsQMDqjTtfs8CMH4HQ==
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798786a91.9.1787750773098;
        Wed, 26 Aug 2026 06:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798645a91.9.1787750772646;
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:50 +0530
Subject: [PATCH v4 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-2-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=3234;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
 b=MvYtIoBfRHzr+9ZlxzKLLMoppQsZDe6pf/KPNN/1QMZ5lRfEuP0Dwulclq9H09nsqHriGV/ys
 J1Twvj9xDNPBP2Fdaacm+ZxMCdQ9/9E7ncnRt/0xCCt2ksAYoackshw
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: cN8_HUjSzDyblWILwDPGKpINEv8KJNHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXyveQ/3/XIuLp
 uog89MwqnFQTmaiTSYoRMXt3AyB5yCC/xYlpA04kIED8sY1zvhGaA+0Frlir+ij5DYttIfxlz6K
 zup8+j8zsEhPKhdfcUItmx1A1+y3fhCxIwQRmC5FFPB0jCPSuSv634ynX9iWVKvmO3H4hM5JwKw
 cLZXwz+6oLvfMYg0PQSoAAivUfgyUrP4tBL4pdwlB+OUl+XsNH0Z+1BH4S2nxdSsPnXAV0QpIoh
 zip0XpwJRmtwnjqD1nSalsSFar48Ozg1qlyh4Elt3ww5SrU6MtapQ1fV8Q5q3NKhmlkpWxC/vDS
 5JwwzVWCQwbv/3Ci4OYWQ1NgWYsvRjGshVsc1S9hXzgPr9c8udg1vOqmnJAR5e62uuJvCeqE8JZ
 /HpGMmlT9uVj24+EWD8NNVq4Th+rKtvJK50t2dlcj3j66M4lkT2Wpx64hNswKsx52XgedevOnQ4
 TRqAo8muUpiBle6xCuA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ee975 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cClR-N3A75S5OZrvWOIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cN8_HUjSzDyblWILwDPGKpINEv8KJNHy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX5BQMGrSKuebZ
 asmIDdmJDchnO0cw3qtxjA1D3UhEul1M/L9SUZEjox6idwUkHoFXx1EquqLjkw1qEyGoq54EjMt
 bG8dRwTz7X8hwM8Lb/Tj2QlQQim8yG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

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
index a153107d0085..98a61b8b9013 100644
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
@@ -2368,7 +2369,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2378,7 +2378,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2399,16 +2398,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2629,6 +2618,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			goto err_depopulate;
 	}
 
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
 
 err_depopulate:

-- 
2.34.1

