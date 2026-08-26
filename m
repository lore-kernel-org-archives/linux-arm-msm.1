Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BD282F13
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728611; cv=none; b=HtXkfG4XDy6bsAQOn2GV4s3+RR48By5KyBcKP4oNBrO98foAuel2mkMMnbSsnOgu0vTUJvq/hixPl1HQW23b3vfuUGYzDPdPFpBDbwG1GCqYT+A2N7oUEBFYMv5h0LAiphNAzBA0qCuIkPr/tqXKV6OuHr9dkWpyb40kbcoID4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728611; c=relaxed/simple;
	bh=NL3e6lSDwolXTEQEXxOaRqaxbTOpDo25fI3lmsTFnA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ttiHYW9KVwlp5u1pmV/iBP+TYy6yAJ4j6NUlu0OBm8o+BJi19RS6E3AOdSYQJ+MEZf501/1BXcWz75lKQPx8fqWUAAQplpgz/7fN9zuQtIQINtMC4/vcqXa4iQCozfaaHUVVvq2ycpUTCT4RJLZUGJkFakTUz81f0CbcHsT7F88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4io1fmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuroGTVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4io1fmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuroGTVJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RuNW451454
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ojrjt6AFu0pYOjors39GFF
	/bsR2YDyUbcT9UWfVi3y4=; b=T4io1fmQl/uID8u6cgTERmptOw6XwNjOY8cVMY
	FgHFVJroxFMT8Vj4EC2JS6GHsZ+i1TnQc1PmLUqw3bN9nJ/LME+X5i3PnSIiPt7M
	9lhokF9Ew9AQHPO9e/2cWaxsfy0GRvy256BqtOIjy0uAu9k0YsvKDdU5JIqsZ4en
	3SI0+Z71XEV0esccGAZ2y4XZWc1P5p4VqI9R/wR4mzeLa8ibJBUhPlB0Af6ow4mU
	UKGIpOjdoo0LCged9OIq5Hvys/+pSO+GWhX8Q3piHbmwnwUtvB9Ys5OZOcMus6he
	1tvDyLlbLyMchO9EQEtZqctqkLubXjTBcRU1w5s2+3jl0vRA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ggv3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:16:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedf42f199so715840a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787728607; x=1788333407; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ojrjt6AFu0pYOjors39GFF/bsR2YDyUbcT9UWfVi3y4=;
        b=DuroGTVJ20wI1dp4uLLVpzxLmr/jEZHEdp1a+NubfXx4SaJ9gxtvY6OjPkxCHHnJJS
         Jw/GVh+oonqkY9q77jT4LDb0gNsnlO0QlvUdu3Zw5JKxQtrb6Udpfi0MfF2soZyA9kOv
         WzVTPqGlyq4jVkDMOGdUgwtxZDBliV2q3aoJ0BOrNwXR9/LjAbbRG0MAoLhGipp9tojg
         va8igJzfRgudJ16DWV1icYWVxMuA7uZwEUbeLgy3k4jH8+Zs2ZSRI1Psa7K1C+swQY/+
         rysmdOFQKHd6F2P8B2j7bVn+1fMvGLlci80MQRs/oQZochTwDVIrwCkn8mNcUTLNCXPL
         rj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787728607; x=1788333407;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ojrjt6AFu0pYOjors39GFF/bsR2YDyUbcT9UWfVi3y4=;
        b=HZiWyGInuc7r+GDHlAUJgasadbxcDDwe7ggvGMj7eLCR3aTPy/GyYAQu39gbLpJkC9
         aXZbYB2TFWvesn0KCBOpTWGktAqJ1jdyu6cxSvezSYFhdg1wRZhS/Rb+tDA8LVkSBMy5
         8gSao9/VI8+a2kuzl2+eJcH2yOT3WVDVQlEmZW/e2b1npSH3wRgd2SSxF/gXpgLJXWWn
         ZzXLHURhW1k8TnY5XiDX2pzBmY4iiibywIPdkqBn7WSUceleaKQi13L9+/6k4ImQ3Z1R
         0lZQguBlNsXyCfyobGCgbzHtlQ0Y/rzZdb2mvt2HU5TbriiS6feRdfdHkNNhTFMn6Qet
         Lv0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTTk5X9A2CwB3IwjrCQ3963KATNNUpQdWBqk01nDvNsgmM1IWbRB2XuUxghEwSuGWdOYmsajm8AVS+LXEo@vger.kernel.org
X-Gm-Message-State: AFuF++mwkXYZw1AM6f5C1UGS3carx1T706jrCjg1SQqqPQiB3kajaOg1
	0EZD1U5NIXNjvMdSnqWSKEsCzPjRd20eiSeIX4/MKn+yQmK+6oLMDtOdt/Qgm2SKT3ItrUh+5Pm
	OSFCX/W0c0KgROWmOxYKQ9tXFh2jaCYgG6ZD8cPJ3pRT1e7Rxv1nk2pJocmSfkb73vGOg
X-Gm-Gg: AR+sD12yDiXKXGY3Gs7RgLr8qys+VIZOuBexobF3mJ1ezYQcaMEFhYFvvCIyzgfpRJW
	b3BCNB/RsoP+Nl7T1LsO14udpa7+JthyaulB3husLl6BjDXv3MsplNqHAL5Rvnj7K/84uUzqRnD
	ALuVKRN4vgsFpRo2PURMKMZJgOcGn6c1HcpSorVogcnT/pohWEIa1M81FCglDAzVsSaVO9vOjLL
	RmSLyWrsMkxJ7eVzk2tfZulFVWdgYxECOcOaHix1SjrhETb0WOjSqOPIG5tH+4x9J66ciJEvpSE
	8MNSaBQVWzf2WvH3G2LpAbepZOeia3LdrDRJ06bzZMT5dQcvYaFiEpROIUqiekdQtxYXeWmRsGM
	Td6yv+zfFFe6KwoDKe3Zci+yehCJgLbth7gE=
X-Received: by 2002:a05:6a20:258b:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3cf8403244cmr7730798637.15.1787728607416;
        Wed, 26 Aug 2026 00:16:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:258b:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3cf8403244cmr7730705637.15.1787728606953;
        Wed, 26 Aug 2026 00:16:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8dc465sm5553772eec.24.2026.08.26.00.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:16:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/2] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Wed, 26 Aug 2026 12:46:29 +0530
Message-Id: <20260826-shutdown-v4-0-eb5fe9d454ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2SjmoC/22NwQ6DIBAFf8VwLkZWVNpT/6PpARAqTZUWlLYx/
 nvBXjx42WSSmbcz8soZ5dEpm5FTwXhjhwj0kCHZ8eGmsGkjIyigLhgA9t00tvY9YK0YKY+t1iA
 aFPWnU9p81qnL9c9+Enclx9QnozN+tO67/gqQvJ3ZALjAFRS8ZpoIyquz9T5/Tfwhbd/n8aC0H
 sptTzd9GXtGJKFCNJxwvdMvy/IDVFYad/kAAAA=
X-Change-ID: 20260822-shutdown-fe8139dff2b7
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787728602; l=1841;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NL3e6lSDwolXTEQEXxOaRqaxbTOpDo25fI3lmsTFnA8=;
 b=GD0xjFYrtBYYo30U6XGHWU6fZK+dCfgosCsPS3QO/EWRzvF/wAax+YHPB1CUe6DMV48MS1weV
 e+XeiYcBm3WAiy1yYGhp0O99RgNmbSTtHntf/omunebG/7rcOhN1jNI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZcapJRGPUb7EXZTJGXC8RbnOLpaLtLgq
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8e92e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TAUCERawVXn9uOooFg0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OSBTYWx0ZWRfX+BUzMKA3HpR8
 XRcIFUvrY8p4lZscDFSt9TsqBKxXk8wuZQtHpwbzbhfyJQTwoHB8ICD8XqYapUtlXHOfYtgdvpv
 NlNg1HU1tJ8NPsYYwtYSNfNuvjzSTQM=
X-Proofpoint-ORIG-GUID: ZcapJRGPUb7EXZTJGXC8RbnOLpaLtLgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OSBTYWx0ZWRfX95SZS7yLrfCP
 gYGG0pR66jR/mALaq8qFDxLMVWZInep02M+DtP9BPm6/3G8XmHkqQY0DtwrJEF/x6+ZIPumf203
 IiFeOKCl+GZ5KPWsFWdjMvHvZzn033uvQYFJ5pXA6nCm0K9Z3flXp79eT/ykymWsi3jvg8f8dBb
 mTrz1UjHQ+k9nScTbLO+WLY52CQxeX60Gi+UKgoB3d6SQVGPvPzvpgTEfY7FRu5PQ05vk/Wp8z1
 PJ5+Diuq5vp7QOMgDaV/lPUChH/QwVGmJ0/jAfiyCqnmT7gNZGFCgyyGUSVxZnOvELKpa+eaIAe
 LIkPYaUpwN4PxLXpm4OJgjgfcvXznfAaIP7ikRAjOej4u3i6IeIbkmfE65FMRQ1h2EJA64D3M1Z
 fT1qbvOMRZbGr6dbIvqxCQ3vINb1kC+iBwCgo5R26PMPgDe2KeQHK+gKM8NtPZ2G0TiWYKkvTKD
 kUnrgiWm++phURyO+aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260059

During system shutdown/reboot, power/clocks to the PCIe controller get
removed regardless of link state. If the link is still up when that
happens, it can trigger SMMU or NoC errors.

This series adds a shutdown() callback to the Qualcomm PCIe host driver
that forces the link into L2/D3cold before shutdown proceeds, reusing
the existing suspend_noirq() path.

Patch 1 makes dw_pcie_suspend_noirq() skip the D3cold capability check
during shutdown/reboot, since that check can fail and leave the link up
if any endpoint hasn't suspended yet.

Patch 2 adds qcom_pcie_shutdown() and wires it up as .shutdown.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- removed goto d3cold, (Konrad & Sashiko for PME error)
- Disabling MSI IRQ's (Sashiko)
- Link to v3: https://patch.msgid.link/20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com

Changes in v3:
- Added null point check and use pm_runtime_put_sync (Sashiko).
- Link to v2: https://patch.msgid.link/20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com

Changes in v2:
1) don't remove the endpoint pci dev's only keep link in D3cold.
Link to v1: https://lore.kernel.org/all/20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com/

---
Krishna Chaitanya Chundru (1):
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++-
 drivers/pci/controller/dwc/pcie-qcom.c            | 53 +++++++++++++++++++++++
 2 files changed, 67 insertions(+), 2 deletions(-)
---
base-commit: 570f7e331f5febb30f1384817463c7e42b65ca7d
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

