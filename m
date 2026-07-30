Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839636403B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420519; cv=none; b=dTvw5gomxlin0ZSO4Gl9V0WzO6mRBvgku6IPWKl+YURIvtUIsOfAEM63vEwq+hImYnr2ROIQYgVU4Q4Gq0deefvreFTHxNzY1zfWicdZsQec+8RS5OUpOwsfK1dXB55oBBmUjPq6ZqxOvMa0mbqeYrng8o2DJz9yiOB1B/arZm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420519; c=relaxed/simple;
	bh=YLPr7TThknuHRweRQd5AnSaQHr9z47c/8vkT2o0DLCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OwTNUrc/GblfvZNlESkPhRC0HKwORkMCvxAl4s3+DFdR9N/eRHUL7CFsp0LjwnvgdM9F52CjGHmLkOr7+O7NPl9lh4XpLEzd4Vgts1kyckleeeeNpJ+8GKKSBSO8KbqRl7U4BERQ6J8wqYboljnLCpeTzjcafXpFmtNEW7t70nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW+q6+OK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OB32OxbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW+q6+OK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OB32OxbZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE2GJD1482609
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ToOb8xl6bqk
	7/mITFay8ShYzRKcgoE8ExL8nP+bjnjQ=; b=IW+q6+OKYM+90L4DKHH9cbtUsEM
	sBKWqKg/NQqX6PIsR5K3nOMr+IeypAWezfHgXKkaa8xz4g1bNKZ0bBRYCKHRCsv7
	NPTF5Ilb38F0dQBnK4ITPoBcvC+MotlHiLqX389bi1jFBLX51JuR7fD6RWytSUVS
	Z8RkC0IEZm+8Yjn+uB1BMk4ydcNx/F+jWR9rXpvoeycl7k4vz1nth1ZWuaD2kHv3
	KpmyhRw2pvfsy0suqTO7bRzg+buCVhE65gASwTsO/OVbSvdP99r+GK0IE6YOza+Z
	sVH+LYX/up6JUT+FHggb/uL5bu6kq5zHpM8IgoJHtfemjn0b2kG9v8Rhmig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr81581a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so25643426d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420517; x=1786025317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToOb8xl6bqk7/mITFay8ShYzRKcgoE8ExL8nP+bjnjQ=;
        b=OB32OxbZK6cBTLRMr0xwDszQIq4NmoW0g+kUgfVXmDVOoTPnGi8++PbN+WWHDdbiAR
         yfsL/9OktgsGumQKDA4Cvi3nMuV0Ua3oNKEazOfS2GSThSx9qypxblxFuaz3ppYcdbps
         ZmyO/Faub5D2mxbLJIF5dC4Fb28ds1ke2g3ROCTS5AETjW/cLVQhTpQcE+YRJf4P0meQ
         aJMtxAuYAmWn8ON9Gb9uR3iWvZNu1ZN4/oNNFDjNGyxWLVzeJXiP+r9zThJ2hVulcRzy
         L74nK+Ug7SXiwHeZvZmM88R5++0fcAEQsDkIac6/6eO4oUd3lFxyi5tuIESwyvHrIMdc
         yddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420517; x=1786025317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToOb8xl6bqk7/mITFay8ShYzRKcgoE8ExL8nP+bjnjQ=;
        b=n7VsNfS79gg/nZyw/DoT0RU/zoginYg2YLt7rtA5ce57F25YkTDLRjDb4HFdlK+iUq
         6fmGld4PZTAu7eMeIpLl7NEAw5MRdUpYYTwBUo5s1yiCko9UrWCJLYP3+UJvTeg9UPUK
         r9inYlWhptnY0Of+VdUak6Kp89GQluDnPjYPGF/k3xttEfhIzwKq2MGdSVJgbTaPO+0u
         z6g6oBv0roEaa1hjl4i3H3poipLAUhVepPAd4GuEuR3UEIv43hjKBUqI1mmaCU1TvvZi
         wv9pWNAPknpmenzbdhvUUk4gWeFJAoDCsURUyIsEAk/fbaLsNoyoBuXsBTpMcawkiBr2
         uDvw==
X-Forwarded-Encrypted: i=1; AHgh+RoIKyweAfVoBtN0DU9P7QFJ+VR/m/VEt7Dbt2oAAxfzLOyrurRnpITyKaK7YaArNvTQU8woUeAz7B/kBpzG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbj91LCkQ41wix8q09w+SmJZVHMBpCQHwd8Ht43KVWVhk96Ivg
	Nc40TZBmu28/RlMhilyK1oFgb2utiitiO4PqXXfY8gAJTIm1b5OnAXBklAWJspzjM7cFCQSYa40
	bdcEentMwdQhsT4HHUuPKpL9Aj7a+VI043kb/tpUBv5sq3rEPsdnh+ZArLgS7xFRXmCzU
X-Gm-Gg: AR+sD11UV/3ZO7Lk8z6wvfQ/VEBB7SlrXwklQP7B2JJ5K59GFM68332OCvI0dMTUY9U
	sHx3Nows9Vpr3k1aMAaOZcZYkO/Bt0ajGUUkp8/IFpNjf2dKQqF9ZjWIfDb7rBMQzzvCdC5uaIA
	uxpNqwLIYxigdZFyM3lJs8QBSxw6/K8PvIu/6pfWZtKgkJinKAEh7SJcxQPIvZFhk0IvCdMwSlD
	qsdtF5GPDqnlHytRsOL2UlJJl+6BWWOCG/QhiQWq6/WkMMqMEj8X1ujxkEiP6n3m7MOtrDK3Z4J
	cdpahdg+WiAcj4Yi6ypbN2NGAEutJik0OUjxel3MlXdWwD6TR6VcJO0n+s0Co9WeiOsdxGjc0gN
	cHs4I5b2BT2phyFtUEA+mZ/YBm+gHdQM=
X-Received: by 2002:a05:6214:2621:b0:8cc:ee2e:8d9c with SMTP id 6a1803df08f44-9083b8b83damr2438836d6.5.1785420516331;
        Thu, 30 Jul 2026 07:08:36 -0700 (PDT)
X-Received: by 2002:a05:6214:2621:b0:8cc:ee2e:8d9c with SMTP id 6a1803df08f44-9083b8b83damr2438286d6.5.1785420515619;
        Thu, 30 Jul 2026 07:08:35 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm18465826d6.43.2026.07.30.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:08:35 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v5 1/4] mmc: Allow host driver to control the re-programming of Crypto keys
Date: Thu, 30 Jul 2026 19:38:19 +0530
Message-Id: <20260730140822.1976635-2-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXzg7Wn3+nqWWz
 3OnGmmYsLglD0Wj0VfLQ4LnCwx2mXjLXdBYgdMMKSnRv6PvVNazff8VYP3WQkTi3h+3FMq+mUA0
 JIogS3jtymkQ1RFMVMtNuKo6GbKtZpvoPsxH3cGuykuReUIA3eRU3ao2thRStqiR3e5mJn3WsVD
 TmIcsoDlneb9a+iquRBOHQfqzjfx/YNeAgv38SfcddpUKK1AmPN0Oq1jxeMKzw4rcok9R6q8sLr
 K8hVDuiSVC+eWYEbqw7FKa0w0W6oZGo9zyERHn0C2GPEURlhmd+O4NXEsu0+NGtICde9N59063D
 hSBoo7faQvAopIm5Cv7nUxl7zRSQUfs8qde89HpRx7PyVsVccD/LbC6Uv8okO9G4ZR4ZuwusbBV
 JyQUvG/41ulyY8h3ht93wX2g4Eyip0Z9DRf7VA+HXRHohuEtsmK9XxnT/DS49ULYSJzFluGySHS
 SGgKO9WmLKRkbb3jPTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX88EAZx8UlyRn
 /4N+CDL8CDZIughODLfiH9nmgyGMwaRv4K0auSodocKcYTtoHthtqyZDW6eY6fQaxJA6JcwfIhi
 Yze6kwnOeVzccQFTNpGKtsLcrd4GHeU=
X-Proofpoint-GUID: 1pd9v1iWXhAfycmTvB-RUVfE2CCicbwC
X-Authority-Analysis: v=2.4 cv=GN441ONK c=1 sm=1 tr=0 ts=6a6b5ae5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=qCc5xqAkgSuM58seIEQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1pd9v1iWXhAfycmTvB-RUVfE2CCicbwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300107

The register context for the crypto profile belongs to the
sdhci/cqhci host and not the mmc card, hence re-programming should be
managed by the host driver itself.

Add the flag MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control
reprogramming keys to crypto engine for SoCs which dont require this
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
 include/linux/mmc/host.h  | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

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
index ba84f02c2a10..83d92fb64417 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -457,12 +457,9 @@ struct mmc_host {
 #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
 #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
 #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
-#ifdef CONFIG_MMC_CRYPTO
 #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
-#else
-#define MMC_CAP2_CRYPTO		0
-#endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

