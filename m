Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5E3C0A13
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737948; cv=none; b=PwBCvbcjmW8NbJMlJ1vKgjREDaejD7YR4eQv8Y/D81z6lgCsvzD3fBWU0bvinwDZSgV2h0pSDTUUewk/Z9kLCw2GXQ358av5MnQjQmjI7nO8o9OfvcIe4DonWAH9IqaN8V8pSr+y23cYykl3E1lWMjmEamWmnW4U83LpLZHKoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737948; c=relaxed/simple;
	bh=/QBOoKexHSv+6S9TnRfL7zK1e/8WkGNWuw8pdpfWHCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pRkegxMrWEjCg2OUU87z/ciLdSsSqRm7g1h+BnqUQJmux2FiE1z5KaLSv/FD+7bWBaYIGuQWZ2AbQQUsiMKPjXk/jrey936EBI5zxq2MHJXNwXh2rdbDImk+dTuAC7gJgTsUIFnZQdTf7StrSue3Dfff8nFXLbyUSL+CLtEfpYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVxU6Us7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUOCBC06; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVxU6Us7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUOCBC06"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cp0q279648
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QQ/waY63tEphnRBtMLXJZh4HjD9raH3agUr
	MAEQION4=; b=TVxU6Us7NvoHcLct0Ciacik6N5LFLfI8mJ3jjIw8k4U1i8VXP/H
	WIx/ki8rCneyfQHeKd7A+8U6ubsN6QkAGS1x+fetBs/6fJ6pUhX4VflnXsrttwRE
	vZw8YLRijkS43XJPOa3hIS/xyh2q9nY1rcVJ/g6U4W6rqlBSmYKOYrs8IZJuaA0T
	lE040M+KviPAy1tC+TyRZYzvNocHF/gJcmKWP19ZH6ZFt71bKTkPUCrL0gHSabrQ
	lN+JYVcdEhsbkVE/59XMsqZJprUStEATVh/byhaiwZkGRwd10xc0Onz/GVzG1gCx
	zURkzgOu5Yw9xrWfyrhGvFKW5ynwEknx/sA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceu9jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:52:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so168950a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737945; x=1788342745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQ/waY63tEphnRBtMLXJZh4HjD9raH3agUrMAEQION4=;
        b=IUOCBC06OimnCHY+bb0dWH1uAhfqlGxCposbqI7wl4yJa+VKV5Nehji5Q0XhowpKRa
         ozBwQZNkZNVHK2d1zmyZsi/xV1jfki9D8HFWdhxRY9TdSGEC4nk3OXBIK+0ngFdk1GX5
         IAp1Ryab/ftZjykvCIvyqZjH4bBddWQaTc4XSHGEuJXb6qyPluhsJA+slbPAvT8kdX5b
         oQn9SkfY9PvQ52DLMMgTE+TuvE+tQfmWMyuhHVlF4qquHTGGvYmY2Re5aMGghR5775qX
         Hvz8j9K+obtP/OGtfIu1UrTDnRN/0O4rtKid3QKKW8Xe02S84DqWbzamqX67Wr1ojgL4
         EikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737945; x=1788342745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQ/waY63tEphnRBtMLXJZh4HjD9raH3agUrMAEQION4=;
        b=ElSi/V6dwieGkZZOriJQD5ViJ7B+cpalNixEaC7X8ET5eM5XJFJPJYtvk/SrF3OggT
         F6c/Wo+q1PSK0hAVd/FnmvK/sEjoNANvUxCaSZ1GTtaWSOlJcrTGq+ifRdVV1GdgQMEX
         p4AzJNXiTgBC6GSpT9/7dMoft0TrWXj0w7gDRJcl/hPRSIMwG40S7yQMPbJqKWgcBCBG
         SSe/xQLa2CmrqBQN8xBCEPQRZ7ghNNt+hT1FX0+ymXBFTUo/ghpzNciJgKvXovooBYhx
         vJe0LW2fA/jVEerVBTzpZE3m2CxzHprmytSnpzkZZFV+hO2lxZYPOlCRdU8QKsvAqqya
         xDIg==
X-Forwarded-Encrypted: i=1; AHgh+RqP/DcGT1qfxg05gEeclhH+A6z2ZsgSPB4nm75fgvv7rHYqDWeucEjdjP+nSmdJVg9xkwp2ZDVLl2FgZgz1@vger.kernel.org
X-Gm-Message-State: AFuF++meg5ZtOKw0lV7p+1QV0YflXRCjhmfiVdLhJjqeu9ZieTXYOlbY
	KIGgLZpjWjv+mgzanEQzjelX4nz2v2dlXgpuIj7wtsxvbUdRxiE1UoQK4XxaXQF6qKhyIo4J6M7
	2ghwScsbEfLHkaggR4wLDq6qARAKiyXEqsxzlzOeGWjtXY17FwY0dJCtxfdgudl5Nf3dw
X-Gm-Gg: AR+sD12JRFkOaBdzJL2BtCZ4INPEu5CpsYZCxoWNxSxn9An65jE3kmKrH4O1pSoerMR
	ze3JlmNHwamZV1mHKzgCkBHWoAMPUKlgsCwYlceWr/Wv5m/McPoROqQLI7ggtKPSHVrCVCNVfDy
	r1oqCvyzDd8cWXNmTt+MDzl6o6xlDzQX5ORBbZAYolaSHl1NZ0b4DREGuQAXDCPz0d3PO2uWBu0
	A3WN4rm1BzaT/E/2yaQMNKGY6sc89G/I4cHwHlC2FL+Ah4xhZNWwzNerJHLoHZUURQcpux3wBmj
	9HPtcGm1d4B5HMbFr5dTva9SQ+vdVANZahBpaHONjhcEdyJTs9bDA38Eao0Xx/Be+uw0KxMtfz1
	cfChdxHsSxZB45FTS7qQUhPjuvolG2/A=
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr12538733a91.11.1787737945078;
        Wed, 26 Aug 2026 02:52:25 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr12538627a91.11.1787737944494;
        Wed, 26 Aug 2026 02:52:24 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm12587158c88.3.2026.08.26.02.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:52:23 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v8 0/2] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Wed, 26 Aug 2026 15:22:15 +0530
Message-Id: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8eb75a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=bHz8KAZ3X1NNnLgrXMwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX8yWUOPh2bfgQ
 eYDOm40OVum1j86GmK62CxYy2Dk42GsWsD0WiHgXogMVHjIHfjmsov9So8KS5FXmHvQaFR+G+5r
 tBAO3PoCinmQpap8fjealxamXxbp4Lw=
X-Proofpoint-ORIG-GUID: 17Va2B43cGiNmkxT9zPK6s8IiF69nPWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXwu2tp27+3AUW
 XubxL2wtKRd9ojihKb1GeRRfF/IAA0EFPAoQSWxkUtOcNeM5N5+R4vUKvd4IDGQq434AR6wTyUu
 TCm5h+mkX3TTTz5RGM40Yv/CDQRBLoqV+mL6J7dfwExffXUilAxuKMb80P4LEXq9TSWY52ndKav
 3zht+CDW7ccBk1rwB5lAUkb8xjualc5knNxbO0Ew9IVLO/ygsiSaHXF/L+lRAFCyjzuKwFT2nNg
 0yIcm1PtGQa8juXyXI9m5HNgCHZft8HO+HjlXOxiomoQTO8i6N4oN9dTSqd+HqmJ0jQhLVNYbKI
 JdlZ5Zmx9TPDfI4R4voPNBgKS2i5+1UJJPSkXY7hNqVXwnI537twmU6ijf+1iOUogSOXiUIBnWu
 kjQZJyOzorCHYc/EicssKj2hWNZ2faeoSjh4ErUPX1oapB9POZ0J8rC5AKcsfOt1Y04dOknJQMs
 nXsT657yxtAuskOqJwg==
X-Proofpoint-GUID: 17Va2B43cGiNmkxT9zPK6s8IiF69nPWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

Crypto reprogram all keys is called for each MMC runtime suspend/resume in
current upstream design. If this is implemented as a non-interruptible
call to TEE for security, the cpu core is blocked for execution while this
call executes although the crypto engine already has the keys.
For example, glitches in audio/video streaming applications have been
observed due to this.

Fix this by allowing host driver to control when to re-program the
crypto keys.

---
Changes in v8:
- Update the commit message for [PATCH 2/2] to clarify the expected key
reprogramming behavior following hibernation image creation failures,
suspend-to-RAM transitions and CQE recovery events.

Changes in v7:
- Register pm ops using pm_sleep_ptr() to allow dead code elimination when
!CONFIG_PM_SLEEP.
- Added sdhci_msm_ice_restore() to restore crypto keys.

Changes in v6:
- Dropped the change, introduced in [PATCH v4] https://lore.kernel.org/linux-mmc/20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com/,
which removed encapsulation of MMC_CAP2_CRYPTO with CONFIG_MMC_CRYPTO.
- Dropped the change to re-program crypto keys in sdhci_msm_ice_init().
- Merged [PATCH v5 2/4] https://lore.kernel.org/linux-mmc/20260730140822.1976635-3-neeraj.soni@oss.qualcomm.com/
and [PATCH v5 3/4] https://lore.kernel.org/linux-mmc/20260730140822.1976635-4-neeraj.soni@oss.qualcomm.com/
into [PATCH v6 2/2].
- Dropped the [PATCH v5 4/4] https://lore.kernel.org/linux-mmc/20260730140822.1976635-5-neeraj.soni@oss.qualcomm.com/.
- Link to v5 https://lore.kernel.org/linux-mmc/20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com/.

Changes in v5:
- Split the v4 patch https://lore.kernel.org/linux-mmc/20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com/
as suggested here https://lore.kernel.org/all/CAPx+jO8rUwYV6q1-RrA4aZ9XnomSf82fgf8Jh2fUC0fE03RFPw@mail.gmail.com/
into 2 logical patches [PATCH v5 1/4] and [PATCH v5 2/4].
- Introduced [PATCH v5 3/4] to specifically restore crypto keys during
hibernation exit.
- Introduced [PATCH v5 4/4] to fix crypto capability usage in mtk-sd as
suggested here https://lore.kernel.org/all/20260723230104.GA662946@google.com/.
- Dropped "Acked-by:" tag from v4 due to the split and introduction of
new changes.

Neeraj Soni (1):
  mmc: Allow host driver to control the re-programming of crypto keys

Ram Prakash Gupta (1):
  mmc: sdhci-msm: Use pm ops instead of macro to restore crypto keys

 drivers/mmc/core/crypto.c    |  2 +-
 drivers/mmc/host/sdhci-msm.c | 32 +++++++++++++++++++++++++++++++-
 include/linux/mmc/host.h     |  1 +
 3 files changed, 33 insertions(+), 2 deletions(-)

--
2.34.1

