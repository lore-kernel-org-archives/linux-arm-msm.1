Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C463A1696
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461502; cv=none; b=H1Z2Ubb44OrtDVmWTNIxnZXbEgZP5ogqvh1ME/0A/5szC263TGZWzxn3/JgmH+aHfHnVmyfkwWAfCEbfrIr/51Q7IIKO30mDKZkRU+dGe5A8feiqX1iIF4mhc8dg8jwWDOWZBZsYsKwWVgSWJakUdqhbsfo6yv9tAgaz0jMd3J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461502; c=relaxed/simple;
	bh=adkMKR1iXVx+DwmZ3065YpyXhuugVWY0+cU+LJwva4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eT8bqjM6ONXRkGsBtr+9gughsoo7PlzQ9nHVLpzH4nPY07ACYIz53mYsqoi3MRyzgl93NUJ0DrYDlb/oFrE8y82LCHQ3zscQDvBuILcYp4nJH+tmPw4Ro3Kxa6+sx+eCvI+PZ9iLbZ/jdL8zEQf4/xgOmI8IQ//G0WZnqnpE8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUqyFTET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfxlyPIX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUqyFTET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfxlyPIX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX0bx693987
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rb0nIYYamBu
	gMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=; b=DUqyFTETmQyHD8vNPyIOTED5LPx
	itmqBxqa2/5ZK0NqmsapWvXj7Tjmt4E31nhOGfkoOq/z7MuYGLGFn/vMpiPawodT
	Wuid+/pkzTCUQYdg8W4K7OkIF3kD8t3da1WpW6a6D3ljhUI4pEwurd1tQrhw+c6k
	1Z2PKw1ZhZNPbkVXiwodrbSYQzOyz2cLxWajTt7pKajDKYLNHboafYr+bCbfdJp3
	8ETARFXFYbS8l3hxMEJtRkaqi78Iv6UJPn2Me1/aWrvKC2JZrpnW39vbP/rrIwHV
	HuxOH1lYRsM17CGQPmcoKraWPK7NfrGDa/zkUHOfTmgiIfKZRKhjIDTPvlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049grn4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:18:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a3514f912so1446934b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461493; x=1787066293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rb0nIYYamBugMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=;
        b=UfxlyPIXipfp+9iUQ0xWZywl7ijRe4EwZ9OsPcv3Y8Cu7Baew0hpaygcsFpVsV2sgv
         TfIObk7UsxDQmG+pFKzo2T2Z7hAf79rp97zIHG/gOBHRTnfcyVVqH2m0JukrrJ3QHH7k
         JT9mMV4p8kIXf3V+UQ94iDS/gyxnw5xNwEtxPsocMShHBsfV87msLemi84zWWgl0HJC0
         f48+pDWsROGvqrtqkc6nohSO2DfkMqpNV6vg4jGzB00wIyAVY2FacCxn3OPWB8c+EUat
         G1TJVKiNx8s7gGVbQrvujsSi3kyPXMt5ro6jweXpBsjP/6hJYbgEKl97Q+92QbyjpZFk
         CVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461493; x=1787066293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rb0nIYYamBugMkUBgoIqbypSuVTrhDhDqU1MT4y2vJo=;
        b=Ik5Rus97sg2eWFJy0SKZQNg8NAzQewWKydJuU5BBlv7EH+/PuzQ1RRxPcgu/hsd72f
         CNOsQ8bqTdA9t05kNOiWbYSXWE3LMDMayIa9dNjrKjpaTNETtSw9A7oB+bIVBTF4Hzad
         rtOGHzEeu5lUQeGt7xOi2r0m66ez7+9QtHUxUdD06ep6EHyOOqBjTtE22suY37GKwjZH
         +jbizwbDgR4ozp/V7B16X4SY9d9xo8sB1YjIB1Jt5S8uMvMDaBIA346BN7S8so8tnKsN
         4dvdt9LoMKevxMMqfSpmMeBV/LofZMy8sEAbtHWkUsryPbdRsDbLHrN1X2TGyiLZwwbs
         3Vgg==
X-Forwarded-Encrypted: i=1; AHgh+RqOpSfzavFLSjAuVLqHS8BFKyOPx4m8KN7AGuVTzaMolrwX9FCxekqKe2XrTMXxK86OjN1HPFMQzZUzNahp@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNk5vUpqWnQm39oloMgmZ7gGqoKJtKw8TA9jasfRjCy/30dF7
	6Kc4M0vGL0i2h7naJeOPNEoyooN1+4Nl8ltqgy78eb7HQ6Cv5umHUje9BxYLT1/f11IZRgB45DH
	TIWB8b44W4xX5dMJIrJnEwOXQN4oNXHgiumPRfOEwBev1p942ysek5vr2CFgSqMcJ1M0z
X-Gm-Gg: AR+sD115JoDcLLydETwiE2To7PugjZtBQn8LI8MOUyZ4oQHUV3+nVet8IWkwcNxOvZC
	+49OxFD8MpNMIomY8GnTbvn9JTEBT5iFfjuf0iR6g1u1544ttGF51n0L0zHZEuCyB3v6JFkoo1o
	JGgFkkftbkznfwzO8QVpyF1BWwgg18qm9rQF85xi3M2DwdRDdJeNTvad0Yfy24ZVk+iwqx/vVBC
	h7KFilGVh2zPUwpeiG34daoTHVQKivCPMNWVuJaIcyFYPM8Gso1Dd6zmdtGZ1HI8WohLRy02rAz
	GC1T6vXcVOeAC5ze6ugUC5WLqiS4I1GvrjoAfG7q7Q9pGjlY57N7IwtX1WIfmt6YTgaGeAU35vW
	MKkcT72xCJ4EzdJOSgWq+sbUesDq7OAw=
X-Received: by 2002:a05:6a00:3a24:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84fafa1c035mr928006b3a.31.1786461492936;
        Tue, 11 Aug 2026 08:18:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a24:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84fafa1c035mr927950b3a.31.1786461492483;
        Tue, 11 Aug 2026 08:18:12 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa95261b0sm983727b3a.36.2026.08.11.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:18:12 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v7 1/2] mmc: Allow host driver to control the re-programming of crypto keys
Date: Tue, 11 Aug 2026 20:47:58 +0530
Message-Id: <20260811151759.1258525-2-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
References: <20260811151759.1258525-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX/yfgdMlcjhpq
 3X/d+RdcYZUQv5UgVn6bjV6vU2FWUXA31inqS3UBUQHLXv5vYZmu66+5OX8uncnI8zrjqM2totk
 YZfnMjSx723AbaR+TFvcSSekDqKYZ4Y=
X-Proofpoint-ORIG-GUID: 21vRmWgIujWq13qmNEUfx-iOm0hugq3S
X-Proofpoint-GUID: 21vRmWgIujWq13qmNEUfx-iOm0hugq3S
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b3d3b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gPkh30t4SdGlgi7DwewA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX6llYWE6HgvuU
 tZjeXorXYvBThgb8fD/3nzHYGlqOAGnqq55HR588vXFk7R1+JDhKjbF+tKcfJfLFcaQIEuqXx6Z
 CvNrxILRMzY4t9vTfT2F9+B+W3EEBBR3WCNIiP14NIqtTUr3QTPcBt21Or0NcG7DsvOOGFMx7rS
 jKj3DWFopM4cytD8oDaJ+QowxWANBKUQUNAS+FLOosv1O4q98NP/vVfM+feNspXkGzJc2LmEG4p
 6kOZudu5bGokpdGCZzTuSHe9fUMLmYLHmriKfoyYlDU1uo5xLHkgio0Cyz2/LO+JIOC695blnEH
 SNuysgpjzWxifuU5h866Y1806hu4KkswoCctOLCTI+hCVvLLRckSzEwkShS287yBPIjwUr+1e0A
 3d9cSMU08V0Qz9WM97HNSZt626F033NQXjEW3gLrPIeU/uNlhz6igjPxoMo3eylziE3xOa9rDLf
 96LUeBC56Znr6L82HkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110128

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
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
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

