Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B148380FEA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774701; cv=none; b=QouEVVV/gngPoxSY0I6Gkwz6jIh6/0+pnEbCoOtosnYVTneN+m1QvS3T7+3yM+P9irK2uE4+0QaUDAcIp7yNid274uIK/zo4EeNisPyif8s9M4sKjsXzP5iwbExOJUg6gz+qYSc1Q3kE1sB87G8n5Vya/TXA6xinBjQTS3FGads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774701; c=relaxed/simple;
	bh=Yiquwdn/MRqyem7FnSUiqjhctXmadtypfOSdk70hM8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wy1V7i0O0ZPIDZuT0hQ0Z+rEmWSJJcQi+v099waJvM2XKJa3oJq/hYwSyeN0K06jVtaqaz2ryWDuG87JqpGFNIQneKI0J1GbXIOe7qEKfC+AC9oqjl6AmyVdk7OYYuNQKI5FwMAsgWnh1cHO1v9h+k2+ojrUB2Z51XZcw6vW4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiqSXdis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+w1LnTN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiqSXdis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+w1LnTN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBw4W920749
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoIRMALlpYP
	SjmYNZNJKuT7d4iuWsmv7iepCB2HxtQE=; b=hiqSXdisgehm8mFS9CUXnsMf6Cm
	uMY5nCD928hYlfPCgHaLz4XcAGbMibjKwKcqvRurYXM2WDPNGTD227/yyy40JXcP
	Ftc1JSGEZYYtXV5OJuYYGotky0moGD0KJcQZblzrxiuVp0SJ+Ipe2Ipxf4SLJokT
	AUd3cQz4qptZ4XAlg88q7gTvpg9+9yUp84Uv4AtHAYVUzZ8KBJ7zuikRWJhrl6gA
	VdBoa58ji/jJi9TTUw6ZTjgm58vx8afvg1BWaZD7+JbRi9Yow7MHZ/fnv6xM8gTs
	1xiqUf0WIL2qSzmXPeUV5Ne8Y+sTmf0uIabjJ+AJQkAZz4VT4+CFwtsLKVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrtak9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 16:31:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so83436a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785774697; x=1786379497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoIRMALlpYPSjmYNZNJKuT7d4iuWsmv7iepCB2HxtQE=;
        b=R+w1LnTN1nAUkXjRIi8JHSZ1Z1hibadK7n7XtZzOcZ9/ElYdLZLN5SXSfKTDOvoKQI
         /BoXjooEwQy2g1AbcVvuILJpBcMjbv4+UH1P+eoMDf+6IETPnkYGGJyaGzQFOjsYbIto
         Pc4Aitx2eCyWAN9XwsaBcHDrTFiAc3msguYEI4CWjhd9kfnx7NAGgsSRjC6yh07NtPwg
         H2AzQPUqMUAWD/QhWRMzLxKTqJ3QIcchgsod/vdKGaYIpgmIg0/zidm9uYPkQCTFxwID
         jTxNUzN1WNoGJMoY0CUfE/L43HwBDTjPkbom9MICL2pmO5L6lBpYTC/CxAGwk9ZnxY1s
         Cu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774697; x=1786379497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoIRMALlpYPSjmYNZNJKuT7d4iuWsmv7iepCB2HxtQE=;
        b=f9oiTb7MU9hjuPJFuclWGyMPwA5CwqNwp6bKm9a+tz+ychBYvayE9wbwGKKUR8+jda
         LlFuWeNx2owHzkfsNnyH3N7wrWG4azTVIh1nonvQ2oHqQc83GbZs1ypoECMdJZNNjqlS
         6Po2/kTub9gIbYrCA/1nCEDmqdq9YElKzOLexx+nAQy8tol+VNuP4NA4DM7tVufaMtB5
         hyp1u7vDdnbFYyxCvJVfjfVM36ap6KyiCzbjzumWrNWZd4ltddyZTpb04TF74WbYaO2g
         FYLEOODzLsrFcK5dBIDZ1tdfAkWezRUBwgwlo5FodSBwagJ4QM/bPtpv3nshJ99p/zEu
         6jSg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb6KRQQ+ayySdM5XgNfANySTSFHjdD7H5fBREFKt+3LdIvvDYz6tEE7jauVYfrX+nV/vbz4d7mOYFyj+e0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyg2NWt2NWQH0gmCy4cKPVRydJrJ84DddIZgsZjtW6KakTjnNv
	yYh4aFA6066EDPQeWBIf98Wz1BKOcvsCp3z99GqhoET17k8pbDH13dC3Tt3AOdIdMHYGlMqJImw
	OUlfZQ9UoVVbVgKxUZJ5ke78fOlMBJW5EF7dpz5zgKmVq0sShGFzS6TAnDAgOGr9xLmuv
X-Gm-Gg: AR+sD136gz1ASDLuyuNoAWrU2+ehfChq+N3TlgEXvEgdqD0GInpU8KnRYDjVDljPcQD
	451N21SEhqyjU0c/lWb5pyxnJKpWoy0bkkobDODOVI6i2IaPzuSkhhzTt3JjAVZs9aIIWSeBqNK
	CSzGJGGAgWIpRgWOr1Tc+5Fk3kucvQZs8lecyFAnCYoNNBjyDiyY7dFpYJBxLb8jLHgTEkLis7a
	OrydrPpJFlhjw2DvicH8WgNjqUCcyfK0O58CNrY+6Z5nzrBm+k+dbAO5BZZQDxE3WWoM3zNNcgO
	VR0ZCjkxDFFqyZmWBdRveBSC6l0k+4BNs54VlHEn3c2XHoIXFiZX3cYoJE+U4vdzH20FFm/zNMS
	ivIMap4DqGaA4TH0sYVc5UGp1lbNA4lI=
X-Received: by 2002:a17:90b:590c:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38febf70cffmr217678a91.3.1785774697030;
        Mon, 03 Aug 2026 09:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38febf70cffmr217638a91.3.1785774696387;
        Mon, 03 Aug 2026 09:31:36 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb50dsm54592761c88.10.2026.08.03.09.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:31:35 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v6 1/2] mmc: Allow host driver to control the re-programming of crypto keys
Date: Mon,  3 Aug 2026 22:01:22 +0530
Message-Id: <20260803163123.1802005-2-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0OCBTYWx0ZWRfXxENL/9Y/RjKX
 S6kOaqkH8BSrnfpld5iut7arRRZTUXryUDvkSMH50nEAVPZtMSPUrqiP1SHkpveUZULUNFJcDwT
 vq7aFGxN8ka9Zzd8dbzEc57MTln9SGku8bHIjWp0XE3CjJFiA3fIP9jalHXlJpzXQTxXawYvc/M
 7LniPznutW9yRazeGhcin42ztf3P5AYo0ZQzHHol8wBx6srk1nv26CZd+T9HePA4LK7Be+hLgc4
 2kNWwntWbiFQuOaqnbi/SHrATz06vE6dBtsR1efnvhP+bwAbBSEW25osKmdsyKdiuPC9xYRZZE4
 eUN00avWP3SmhcEujEwGBQZ3YOKaTwIMnASEg/mprKtioi06XKWvGpEzO0yHiLKwBTgHgQHcC7C
 a4WOznjVTGXCZr2aeWEWZtBLVJDWmTdXcgShT89gORorJgXBMmY16SYAM7xDaRa+DEnyHO3M9tk
 r2qXNZkFyvMoHDv56Rg==
X-Proofpoint-GUID: OqpP5UP8XDFFDfOkKstezQ1CXxjCvjPV
X-Proofpoint-ORIG-GUID: OqpP5UP8XDFFDfOkKstezQ1CXxjCvjPV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0OCBTYWx0ZWRfX+freSdef0zI4
 c3Jtd3nrjsJBstfQ41hjSKa+F2SkQ47fOaua5yHGXW9plCEn3DRrnwjk/Py70vYcGM9d5JOUkOH
 9GX03oJKDQE+ZHnMFvKAU3SgAkSxNmo=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a70c26a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=JtzH_wN-VhvO7tw2ChoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030148

The register context for the crypto profile belongs to the
sdhci/cqhci host and not the mmc card, hence re-programming should be
managed by the host driver itself.

Add the flag MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control
reprogramming keys to crypto engine for SoCs which do not require this
feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/core/crypto.c | 2 +-
 include/linux/mmc/host.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..a5a90bfc634e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..3c3c45fdf39b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -463,6 +463,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

