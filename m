Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670242;
	b=uKcv/VSC4XlsA6mkMD2mOpfKfFtHwj7KbvHTFg/RGBXDcsU1cYIr+fVuvZTj9TI8B5Ch
	 2fIoaI5V548eP5mOnvYmU/BvRoB4dnRF84uKw545KLv4eD54VNthOTVPDg527r6Q860fC
	 olXlXrFrZmwUfZFtJk5p43D8YfxlIeJaCC7SHh2R/QS3PKT6nFltvyQqWiBRXOJMz3WsG
	 tDn/dFob6K7TqwbsCTC4w2rmssvzqIqNXWClI6YemyvzE+bwTBUYY1vKfjtDj3q0wcMtf
	 Qa3dgfMNOvLbcJIAM3HumfV1lxHYY7XQTu3yYlo1f7+lsu7NugqZWgR2pG+Y0H0e3cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
	b=UP8uxihVfi1cOcfrN9cEZvlX0c2vQOHKtFDdhmzsxrySw/gh7YA+LkBhCSbqIoKgBZgU
	 mZnrX08Kc36q97tuULE8TlzWpcwjaCjBIviLWZbNYtstDb1nyP1y5ds72iFigQ1QpF5RC
	 klDLxX00LG2GPhAUFBe5O5juDCmPoupLMsHlq45m7ZwN26iKnIS1ZlXy61HukBfMwHHQM
	 7rLaE6qmi+vPL169UrlOSYQKe6ver35mTgIUQRIytRdPkAxdMtrgGLbOoATrZw4fl/Yba
	 hqA1QKs46RvGcffIeP2grOf51ekKEo388h+ZssFWQC6ELHHjyyPy+H72Gyn+PltwR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E7Z/vZkW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUYYnl4x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8471606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8471606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7Z/vZkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUYYnl4x
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Xav1647689
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=; b=E7Z/vZkWw7uxXA++
	EalEyVbJeQ9ZLWVZJeI+8FPEIowMfBSWxVdvDpEECuZMrJIyfb9y7F7pnaP9I3aH
	zUur194t4glPzOK8KgbvR6lHhXv4f+myDAFB138d7N5kEJuFzzG1aJDut3ouvzuP
	DHPeF/mfE5JeL7P4dqylP+qZE+GZkFrJP740dNwTlD+GEfszN4vPttybEDH+fLQX
	Rn9JfheXnXGC7gEHt7UIflSXch3mEikg/R3ekIAM88V+9OuhMF47MzCUiUfnFajs
	zko092A7RglnVIhOfaaPNo5Il5VtVoo3MS1Bg0WQQ1MVB6nUsFUaqHabfAR6x9+e
	9WI8lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahttnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so7025337eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670240; x=1796275040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
        b=TUYYnl4xkv5yyr0k2Sp7rH0Pi5cJSfrl49Yrs4Y3gchxtXZtlKSuK9KkCJBPLPIJ9Q
         vEHBgBn9fARZ5b/jWUq2cqqjI5VbXWce/RyKWMeZk/H0dQZCqXRoeWp0LInFmwRK/Xq2
         1Hpy9dAASZBThLU4kx8nQco1knmtVl1bV7xVwXdCtnMUP0+V8BNihlpBzGlMwJCyPn6c
         8R3XaQCOKH+5jU1G6zLoWq8OeLuApo9ybKxI1iBDD0oM7uy4ePlJYvwJMRd3xOTwL6OW
         8a4oDR4kIWcwvvrUsZs/N7OBwR2O9VQzb7hugnnA1sILj2JBpgwE+ugt0kvAs+ur1Pw6
         E+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670240; x=1796275040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqK3bpzM5FZtay3bMGryeU6spO62FC+7I+8VOgahwf0=;
        b=HKmcVTm8V+NSUe1AarRDPwpufQOWwIsUDly+O9KUzgoLM3uqWg9eEFdCPd0heI1OYH
         FLB7g3OMWYvQbj/0sqSuImu95ru0tFTodHp9eokbOC7q/8ZRHxc7xKNKD0f2vTpNfxiM
         blnGXt1ErF6XbkXjHzzKqSt2yDtOudxygpZRnI+ZdVLKuIqBgS7NUdf0iXLl5MVh+NQO
         Y93HkXXkdVz92MjaJT7DoYqW5snNJsHhsN+53QX1LtrPayUVJuY8Qwn/fQSpNA3hGNIb
         /6bj7BX/1APoSZsBdELdF+TIVN5Q5nuIXMEakIwP02bs+zS5aHTybc0ruh5N1kCoaLIB
         /hww==
X-Forwarded-Encrypted: i=1; AL+hErHKXT+vXb6RU80V07apQK1jLNOMZn5OTJy2c8cL9mYhfYL4r6MliQlyoY/fftuBkxRWZIwBvE+EhNU0kFsV@vger.kernel.org
X-Gm-Message-State: APuU4Z8g6Ktc/o/5J2YvQCNGfgg2Y6PBOP5rkdg359F5JNAWeaKx9nbT
	crMnQngY2CA1gWyGefax9WwT6/YvP7s0r8Iun9EmDndch7O13XsmUe7BXuN8YByH1R5LtOPi25Z
	pKqOxwPu5wzxmvV2yQn4C0prhUqMdzMtf1UHPUKW1eCXK3XlxQdt9BOVXQwvFpt3Y9l0G4GaYYy
	Uc
X-Gm-Gg: AZFdTZfjdW4zEKzHpFS903Bor87QgPsyvLVYMnznCbX/ovj06CsZycGhIr6Wiv3dYz9
	9eILHFxKUWlUwIYysuzlAf29eentxduUSW624T9O6X5e4eq929pcdcIIhdV8y8a/qGMWaSAo9Og
	v6iW3RTY2NbSn3hN7mhTU+g6NZSIC7ouSvIRBvr6RCW+15ZvZcdo0eucpEOWJGoryNVrOgZoI1A
	l4L3ZdUaKG0M7bh3WwpJzX2q46WUQtKqEg07/bm7N+9wGtBE25aq7jxZ1nr15Bw5EuAFdnMlbzh
	JdsvMTQ+KnY8AsxRUC+/+XRMwyn9axdUbmdZKFcM+NtxUpExzaBHKMV41MhYBhvsS8/mXQZLmdt
	XRXAb/UjNAHtE7IVWkZNfH0V9gAzi7BLHgjbQvBQtVWDWcDwFHRejShQsluM3DX7YkJfPVMmY63
	P8gfJVT/bN
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr27963589c88.19.1795670240347;
        Wed, 25 Nov 2026 21:17:20 -0800 (PST)
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr27963556c88.19.1795670239808;
        Wed, 25 Nov 2026 21:17:19 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:46:59 +0530
Subject: [PATCH v10 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
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
Message-Id: <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=2417;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=AdMsyjE2U658wo9GCc3C4v1LK0MFmWfjDkwn5I63cMU=;
 b=rcI1ccufPYHfbWcNrTqR6g4ZNMspDWAXucjiM1IWLplFLDRprXpz3ufm/VdbWcN/GIKBddpSO
 wmU9knpq7goCMe3loOpYbdMSkmYK3oBVZWAFWCbnUKmNDoKtgn/+VGW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: BA03kK87Ep2KQu8naYtCp1cvuuumKdd2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXxMB3gVt9g5Ww
 1mWlP9lxZYhq9/rz9IM+uvo5wVCEWdfBCmflFwEXuEaoPEZtQuI/9ATxXVLBRluAzWn2DXj7W4Q
 2Q2lv8LwHL0+WhJUmGokwUPi5g0hbqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX7H2zpgACcyH+
 e6ov/dTSJAFaMQlFQE1N3VvB3koY8G2+4AjjOsm0Ak/aRPzSRgAiBE6V69SNQF0m0RzB1wO1320
 oEyhU1XwIRjlb3Vdd4FigwIij7n8d/CUfXVFWSGUMHO8iJ+SQLLbGUwZZsxUcCSwX85n+HaXOr/
 lkQ/GPZfbNjLO4tiARMujgoyvFNa6nAEHXmsaCYH17vrLK5ieE96GDMpVp4dZM+pqrfbqWVY5H0
 rya3TxtGzOpT0Ng+D9hD+yWbzeDqu1Odp0ZUlTUXIifSWUdCid6QSc5C9ScZAg0bmYC2iBwAj5k
 EAwo0rtKiPmOtDJPRGJM3bwYvs3jQDOKNNGGJhLXjtebOJpF7SJXBaZLYYt4ArZhYacF/3wE37A
 aLe2iiClKsvd4ViB7Q7oDsG/cI/ie2qaMeXM4COMZjD1VollLbPvtV2x8NDTBkpJo61DgdiXl/4
 8fh6iZg7KojybE8g5pA==
X-Proofpoint-ORIG-GUID: BA03kK87Ep2KQu8naYtCp1cvuuumKdd2
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07c0e1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

__pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
the walk as soon as its callback returns nonzero. Any device enumerated
after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
capable endpoint -- is then never visited, so pme_capable can come back
false even though such a device exists on the bus.

Since pci_host_common_d3cold_possible() already returns false whenever
any device disqualifies D3cold, aborting the walk buys nothing for the
plain suspend path: the overall bool result is unaffected. But it
silently drops pme_capable detection for any device ordered after the
disqualifying one.

This matters for the upcoming shutdown path in particular: unlike plain
suspend, shutdown forces the link into L2/D3cold regardless of whether
pci_host_common_d3cold_possible() itself allows it (see the following
"force_d3cold" changes), so at shutdown time it's common for an
endpoint to still be in D0 and disqualify D3cold while a later,
PME-capable device is never visited. dw_pcie_suspend_noirq() still
uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
result here can cause Vaux/wakeup support to be dropped for a device
that actually supports PME from D3cold.

Fixes: 1d2a29ccd3a1 ("PCI: host-common: Add pci_host_common_d3cold_possible() helper")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..c2c852c64aa8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -275,21 +275,16 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 		return 0;
 
 	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 
 	if (device_may_wakeup(&pdev->dev)) {
-		if (!pci_pme_capable(pdev, PCI_D3cold))
-			goto exit;
-		else
+		if (pci_pme_capable(pdev, PCI_D3cold))
 			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+		else
+			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 	}
 
 	return 0;
-
-exit:
-	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
-
-	return -EOPNOTSUPP;
 }
 
 /**

-- 
2.34.1

