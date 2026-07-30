Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5980043CECB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420525; cv=none; b=Hun2OxaDQLDuCtGl+kicbtaMv/I2nUBv7YPSM7kQGOUmIyr7gPUQVq9IRQ5f5YJ/+Tw0cit7TCsTYKJSFWYK4F8kjzvWPFmdczsKzPDDuEVBZdWUkNohf2TRoIg6nl7ltbs3vkTI0VkiNABaQs35/qO7BsjLUn6qwPPlhOHc4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420525; c=relaxed/simple;
	bh=0x/ONhsoOOzKRRJYikIViC5SFY1o5Ga4LVrFVxlZo9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ShEYbLxTgacqm3ZRuN2p3+Tg99zz+UJzAM/nRCU535mi5gvSThf0lmyYsWZU3hu3OklnDSUauE1ilxCILjLha13Hf8iHQ1qu70fSWgwYwEcPBMCpjoVfYtVexXB1Vrpyw+TAe7E/CKzc/Yly4C39ooXVxuqQouRlc82p5uJEkq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwAHQxfq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTTYbGEj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwAHQxfq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTTYbGEj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE2Mdw1483162
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lGn2K7VnHfs
	d5//ZGJYk4SpCsJD0eKIApEU+QqkLx+s=; b=IwAHQxfqG6Ecn4VdEEpiGm09zsL
	/dqKOv97Va1ETxB4V6tfXj/3GXd0crz3Mon3b7iUBhjRkkbzVPCosD7uqP/gNXd5
	+fSx0ChI14ZqWMRwU9YLlxLou5VtBImF9SMfp9hV50xUjXE/izNs2Rxa/V20HHJN
	n5PtccXvk9/8PHksavH32oUc3KofBUE1m1C+h3UlTcm5fl1ZQsdSqtpV4yi5ByZZ
	n2pQ0315Ujpt9zlNF4qZ0cAdGjVqxrzMIcg7dHV6BYuUySkGmR8DF061u90VqEIQ
	lvty00IjSt76o3EXFvYPSXbfuiAN3BwHH276lbxjTuat4OTPS/ddK83KOOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr81581an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907e49dbae8so19716606d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420523; x=1786025323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGn2K7VnHfsd5//ZGJYk4SpCsJD0eKIApEU+QqkLx+s=;
        b=ZTTYbGEjhPLeTJ33xFcc73+sHPmHmgioUokb3CEfSxb8n1yogqw/Re1g+OnrYKOzai
         R2D0oKBv1BmaNC1klDvr8WnxPRlCMIH9MJDabu0ueTVjGk02FMJ/yPqSWzlXZFr3c2o0
         0C3heOm9AKrnpSG6Ff+biuH3+M9WKRTbIhRaOL6Og5R5FFP6pH7ph3xUvgB3A03h/5yt
         1Ss04qrjLwFgts8+gzZqJJqSziYRDTsZVwjg8XDuUqcx9oLoo18CpklIBcr6xkuIexpF
         RoZZgBL1i0VvtPZ+kglShRIfQoTYq4hD536k42KljBLntQfN2dEJ2qx7Kw/VfkQd3aTm
         sw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420523; x=1786025323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGn2K7VnHfsd5//ZGJYk4SpCsJD0eKIApEU+QqkLx+s=;
        b=YIX/wFjAYFqkOYhQaOACtoFuFX9L7CpdXsxs/8R1Yg/dIw5sQQISVVTR0V4hXyKdIg
         w2yRuCc1fJhg1WUi/CnJ94uFfelR3205/UBdEXj1dInry3Jr4MILpJRfayNqecsjp+hc
         qOD/7yW3rU5Oh6PC/SXW3iC8ZyEa0YEaXmKUCiY4jbPSuLpYMC5wE1HXl9lRdOtzcBIq
         3TYxQ4prHgFZpGLxjH51g+5R01dVypqJ1ndybyBeuf8k63p62TfzNS3JKmeQVRrkyFo8
         hbZ/w5YNRPLqjlIZS4FcaHxxDy8SqTG+R50E3CG2ud9C6QubjpInAqiOo+RRF0Gj+TRe
         RYhw==
X-Forwarded-Encrypted: i=1; AHgh+RoEGCPt6IArrEzph9lhEVEz2VE8We05coV+6SjzGwFLyBIBeFGEWmsGNMAs/kyT5lMDRK8RPtbgysKZW7T+@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuOP5uYv9flpRy0O9OAHAuRRULqaNiqr+5QFjFvLOftYCynQV
	b/su5O9hCGBK3lwMXVk4X6jt3rBtu+CMGkTTHA6F6bmQyqpkzLpIu8kdW2TWuzvmhi9EbJ2Oj7r
	jVPZBAn1oZasPcNjj4jdBc/bDjWuRebVoG0b3hZB1n3L68rzgFQe1vmZUag25K5cqTolS
X-Gm-Gg: AR+sD116YPnTxaW7zeVnrebcfJMtOBlbdWKrjrMJ8RFzYIrW3iaGDQlWd5XJu3Cm3tN
	3xPICS/B6/f9E5u7W3bvndqyGyj/Mj5iptgdfRpCTTSPKhsVSDHoA9UikkAE814/qD9PxNsCTGY
	YCUDYilk+MOWCiRFTm35Hw/aYA2yInJwSwSNgo2FCwTymm4hNvhwasb4dgecql9/yPD7crE4wCS
	J+WbsackbUxIIt/kMwrQnVdGgfQDKMxqqWY1FazG8WwW8XO6A+a+ebyngxZbdfEaGsAh610J2E5
	3ipX2EbsufLCr0DoZzv7zujEsdHSXUNH1EWZ/2wu+hMK88Ry8aXZXNzQjuDMCdLsaq9xKHcHOZo
	Y3xbrjhW0hNARRfzuU97u2/q3OqUGMIo=
X-Received: by 2002:a05:6214:400a:b0:8ee:cf22:88f1 with SMTP id 6a1803df08f44-908346cf802mr26871276d6.17.1785420522344;
        Thu, 30 Jul 2026 07:08:42 -0700 (PDT)
X-Received: by 2002:a05:6214:400a:b0:8ee:cf22:88f1 with SMTP id 6a1803df08f44-908346cf802mr26870576d6.17.1785420521647;
        Thu, 30 Jul 2026 07:08:41 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm18465826d6.43.2026.07.30.07.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:08:41 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v5 2/4] mmc: sdhci-msm: Reprogram crypto keys during host hardware initialization
Date: Thu, 30 Jul 2026 19:38:20 +0530
Message-Id: <20260730140822.1976635-3-neeraj.soni@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfX61Nx+2QE8MlW
 hfULyr0tY9d/bhGvZXVEl3MukLh8a99DNn+16b9rgxvYa9BFVz8qQPf6trP0l3UhVcTWlRn/5B6
 PHi0eXPrq7q+wyqgNTinj46xf+jKlFU6rU/hsxbT9vyflcO9CrWL4uIvhS2mMcQftI81tt5Vyae
 oOjz5Xa8V8RgJF2ZwsDlEfsmycCqrG01hVniOGsTtVGaGjYzphqldV7l3IJKMC9bxbCUFc3P5Xx
 ODlAQ8kEi2+dgVR5JZtZE424mcnX/2OK1xt7cwj7i609dZscKnezIUT7wFsEMSApH2ly8lPO8Ba
 Wpo1xZCSj8iEaIgQc9VyjtYInu9t1dWbUxXJz0m/bQRsb3Ue4Cwyacb+t9ByHfKCwP86q8MS5g+
 ChL7bnT98b6vTUDw5HrN3Ae2bGDPxgV4n2H57BzpTB5bEUgIhq4pqhLubFexqUftoKiFLAjtc2n
 ALPcF6DNdbBFEokQPTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXzHcH/bbrMypW
 vBAjfuqRoOQTN1wMb755WXWTW1UC60G/JlcvoS8XbH7zHsMBRAmGE/IYlZqrb0E/Maklo0aMHPV
 efBu4k8/NerPsIpyyEuVFGOUkfZ19vU=
X-Proofpoint-GUID: MlzsUtRGL6ASBgQtBc0-wFEOiO0GQa_j
X-Authority-Analysis: v=2.4 cv=GN441ONK c=1 sm=1 tr=0 ts=6a6b5aeb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=INlCos_yAX0xULvCZXIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MlzsUtRGL6ASBgQtBc0-wFEOiO0GQa_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300107

Host looses the Inline Crypto Engine (ICE) keys during hardware reset.
Re-program the keys while intializing ICE to ensure that ICE is available
in the same state as before the hardware reset.

Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-program of ICE keys
is not needed during MMC runtime suspend/resume.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4aff965f0e2e..7d71dc6f388d 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1958,7 +1958,10 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 				cap.sdus_mask * 512;
 	}
 
+	blk_crypto_reprogram_all_keys(&mmc->crypto_profile);
+
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
 	return 0;
 }
 
-- 
2.34.1

