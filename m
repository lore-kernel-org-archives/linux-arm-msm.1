Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489528;
	b=NEZAEQxKt3saQIQGwVMWbtMU42z+ELzv6OVjTF78ywJ/4dIlC0YRfplul+huXKuMDRRP
	 rgGAvEBvJU2JK39N74qOlJ0DdF4rZ5KCFm14/cioTYguNW2Pbuli6Tkm+7YDeTh0uJFa4
	 M9H6eQ0p72uwVUKfa1vs6ej4w/18278Blx31KIq1gst0U7CrQI8/Qp69nG1/FBJdUG+kj
	 GODKGamWIAPITxRbBNyEx6ywveGV7jXeMRgSQh8LkoYFs1myDAvQ0QIWYXlVxdCfncRa5
	 yrm2O2sjnMBVxQ6yraS61ivhuowzZqJjHAIHdeGDLXbGe2t+5nL2o1hwqROAZNDUScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
	b=R64PU/RWKgwrDiYochvWR8QeAJjFf95dS8kX45WkwvnqQ2/TkgtmbBGT/IOFsnh97t0s
	 wcxoKZEAafvUt9sa8upD3uvKRqpkO2AuQ9ARiIEQRCqczCziiimSG01kgb6eopQXV5trr
	 6UYglCLc9Kxnma/FOIn9aAhXLf4c2if63yI5G9cB8HNbjiLXzlOepzpv/FwU/4becVccy
	 2vOLp5pv0q4e6RbrFTCKwcoSHQJY10eV+VnhsvCtZGmDcWZC9MnZ3YqYJN9cwvAGbPzaW
	 9Vmy86nKODRGPvX3vpJtKvWpqLoviRvQtNfQtuxt2C+l5YVtWMD9CAdlCZLYOK+JHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEV4faAH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWxeJJr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE10606A89F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE10606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEV4faAH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWxeJJr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfJ8v1953697
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=; b=iEV4faAH6AEwx0yK
	M8mdfguFa67BDVndXkch3vGD1FgznzpBchyXDhGoZPawVNC1dGjOQvR25hpW3Xm5
	gYz8OciFHmJZC1PAWKdsA6NTFwNc3jT87CbXxksERiEUcwN9EUi67VRrQW/QtPqm
	dhg4Qk/mThJZB+x/uQAcwelSZm8sIFBG0vn+u1G+NZ81DGD7R3ZPcaIL9qNneVq0
	0bbqu0E3mPhjh3nSQTBEcFMGntolMHPmaok+g03Lc61oY0Qzq3Rdpp7nXapZHY3i
	nDRRC3D+HBu1Plz+rpNbp4LrtHjqj1aW0nuIjHP1fW2yWkPPSSksSIGFWU0mpl+0
	nzom3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30gud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so6824734eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489527; x=1795094327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
        b=YAWxeJJrmwgtpLdrXgRxtWdhAHbyFVdp8oXahHIP0oYMmIVLxpn9Po7ZDdTgUQuVeH
         gxiuxJsZoXYKRazaTliQHaMjlYuJ/dzkgDCu+kg37puDm7BdMkaY7Lo41sczo9STlmtd
         UKHDnY+tafrAEIpyhnFjttObXI2+ryWuwfVVfYQgcz8JT1v//9qcnt62bW87LYtI15u1
         +KimLqtNrClzQ0JezqoCjTNPXS5Zog2RPhJP6ZRwmtlaIXyQLCSxUeU2D1oKOOq7N+ul
         xYsNu8ncNpY6kAuPQ2xnEQO8g9Rlc6iG/iUGEpJ4OzFp8RDc3OM8JwqrsUoL1XXXNKp7
         VOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489527; x=1795094327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
        b=kOCiZwrbbPf3eJYoOB69qypxFfMA8LpxN6+yG1cdMp+XOeMbpr+KXZloEWLrBcpyVD
         q2XMAJ1PYI1CGwDi3xSIyeXPMo3q1yrYRnCIBfeVrXSJvBz8Qw0rizTjD9ZHTJhwPLPQ
         vZQjTyN41bn7WewLi6wd5Xk3+pRbxF01KcOBU+b+wJWsSFlBD/BMAa0elich2O8yJZFO
         Tnc0AJag6ceRj/JUrsABBRR7w/f6WpienvlQNIW78NUMYNMUPnRaAma+scVcpYpx3cM+
         kPOq+UFAoPc+vjZfDlD/pzoLFLA42WxsCKAlIkRrBleqFr/BbkHStGEAvN4PqGAI6ReX
         /wUQ==
X-Forwarded-Encrypted: i=1; AL+hErGfIfIEnOZ+ozh8ZDxPwGM8hbiilq3QtbCPxbuwkod60l7HxS9SW1zNCz24yQiou9YO/ELzYSRcQgETRrX3@vger.kernel.org
X-Gm-Message-State: APuU4Z8zDdh3H/xLvsPZs9hUK0MNdfFnHokZWyjBDZIpBPzjKbHyXANl
	WspsIQHlmfEO5++eeiIcKSlq7cyDG4gSv0cPOVwG48F/v06Rucng3huhn7OTFeR+9mvz82/cqLn
	55TWhhO7p0sZi9tLCitzrMLPdnIEQqxHef7ph3a+KSs/9/FsNkbnUkUGgGREI1uaDNEHzOppgb5
	we
X-Gm-Gg: AYBFou0XiTJ3N08odeRJ89E9kCMHAr/D29Pe126jrSorVJ0DtQ2NJYSqQDoCNIKv2/b
	ZauBz9HjTeZ2wRll5fgPUFZhWjfB/+LCMBcy8NRQMb5rfYqEnuxojmhbIE5uJqTFZZBkDQAGfJJ
	euiL+OcB1IeZqY9nw9zrPwNeQHxPm5JHG3iUKq3tGKG4bQKe5m1/ylndFVnJb0xLnAf2KG8XZuc
	LrZwyG0N28r/Ft/qBxlTzWhy3Fr6rR9ikcKHhRkyUhhf0hn430eMuJ1Go7zEFUtQnqQr9hlC+0j
	Qjwuyl/4IuKcI1st/dJdWcrdNExpNOJX8dmI0SpiX35sVrXC2N0c4VG1JPuIhyh0phLgUYxHgtC
	MyqVZfcb9QSkW+9bGmR5kDDazqanjQsJRkIWN/qG2Jv+EbEYKbmyU9RuuCslM2CLCWVh+BmeLJ/
	NU4MgUroU=
X-Received: by 2002:a05:7300:ce01:b0:36a:1452:8dad with SMTP id 5a478bee46e88-3768636e3c6mr6130137eec.20.1794489526689;
        Thu, 12 Nov 2026 05:18:46 -0800 (PST)
X-Received: by 2002:a05:7300:ce01:b0:36a:1452:8dad with SMTP id 5a478bee46e88-3768636e3c6mr6130104eec.20.1794489526047;
        Thu, 12 Nov 2026 05:18:46 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm43798356eec.22.2026.11.12.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:18:45 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:48:18 +0530
Subject: [PATCH v2 2/2] ufs: ufs-qcom: Enable ICE before enabling crypto
 support
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
Message-Id: <20261112-qcom_ice_pm_enable-v2-2-177e454d6f22@oss.qualcomm.com>
References: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
In-Reply-To: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5bcb7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lF1qQ_KX37YNnQO-sMYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX2saVVUguIYbm
 nuhgIa7XOPo3VsACO6CbygbBNxlRd1fGTzsEX3nHkn+HOiZ19WanBk7B+a7OiN+yzL5XtlxyH08
 6zHfZByaG2FC0ttq0VYUM7zdDX5EUqcU4gQbfVX+kt+l68/j8mXZSoH7vDqtQuQ4GpDdWIkyO+J
 gF4ICRWqO9409g7OniI98Pknk3AHRm/I+5b8bxs3zf0R2TVe5pl8ECsWvNcLcFFuyCyLjQwhdWj
 BaRySBufWwt8RhVMLrjNZPEjWMkyjFZX8CsH49bVRVklurTaI9p9Py1cf8TZjQ4r7+1JgWdMtY8
 pSF2qxn0UIiPwWk7ZyyPYjoxRTxDNh6SlMggJNyPmN6p9q4JQiqOzUxJp5v0q6tb0YSN0xKgoeY
 iznCPPUtD+TFD76rTVx7L9lMkDeiSEdn+BIbLJ1HjDMqzWwv0NtPG0/3cM7Ks+6kl9zPyy5irVq
 LQbVHmrx1YTE/vwDpbw==
X-Proofpoint-ORIG-GUID: jROH2ACveYbF48qVyMayj7R3DXpFLrIa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfXwgAzp+SaobCm
 f9+o/NX7b+m7L1xsjdGlBu9UvK0jzy3enIgQKro5eWnYwx7oG6GXdcJxUMuH2rR2J76s+JfaktM
 HYZm7WaowL5+V7stZ5mhNQNwNSmfnpQ=
X-Proofpoint-GUID: jROH2ACveYbF48qVyMayj7R3DXpFLrIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052

ufs-qcom currently exposes UFS crypto profile and sets UFSHCD_CAP_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before ufs-qcom has explicitly enabled ICE.

Similar to MMC, enable ICE during ufs crypto init path to ensure ICE is
ready before blk-crypto can issue key programming calls.

Also call qcom_ice_enable() from HCE PRE_CHANGE path once crypto support
has been enabled. UFS controller reset can reset ICE state, and the UFS
core can reprogram keys during HCE start before POST_CHANGE.
Re-enabling ICE in PRE_CHANGE makes ICE ready before reset-time key
reprogramming and for any later ICE operation.

Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6afb8498b8c2..4ec400c5281b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -158,13 +158,15 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
 }
 
-static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
+static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops; /* forward decl */
+
+static inline int ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
 	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
-		qcom_ice_enable(host->ice);
-}
+		return qcom_ice_enable(host->ice);
 
-static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops; /* forward decl */
+	return 0;
+}
 
 static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 {
@@ -188,6 +190,12 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 
 	host->ice = ice;
 
+	err = qcom_ice_enable(host->ice);
+	if (err) {
+		dev_err(dev, "Failed to enable ICE: %d\n", err);
+		return err;
+	}
+
 	/* Initialize the blk_crypto_profile */
 
 	caps.reg_val = cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
@@ -318,11 +326,12 @@ static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 
 #else
 
-static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
+static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 {
+	return 0;
 }
 
-static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
+static inline int ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
 	return 0;
 }
@@ -636,12 +645,15 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		 * is initialized.
 		 */
 		err = ufs_qcom_enable_lane_clks(host);
+		if (err)
+			return err;
+
+		err = ufs_qcom_ice_enable(host);
 		break;
 	case POST_CHANGE:
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
-		ufs_qcom_ice_enable(host);
 		ufs_qcom_config_ice_allocator(host);
 		break;
 	default:
@@ -660,10 +672,9 @@ static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
 	switch (status) {
 	case PRE_CHANGE:
 		ufs_qcom_select_unipro_mode(host);
-		break;
+		return ufs_qcom_ice_enable(host);
 	case POST_CHANGE:
 		ufs_qcom_enable_hw_clk_gating(hba);
-		ufs_qcom_ice_enable(host);
 		break;
 	default:
 		dev_err(hba->dev, "Invalid status %d\n", status);

-- 
2.34.1

