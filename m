Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093022;
	b=ZAOC4D4Hcv0PoV5maCljojRPKEAN13h0G5wTmIdm83QzhCRBuWTl24Qw4IG+69pw+TqD
	 gKH0/eGQf2gfh3VD+ywL5LHQ1nr00UfPssM/5puvu8we7CriOY6KKMlaNNIt9Pxl3qVkp
	 21Bqeh5D2B+p2C5oMrHajaDHfRMRhppBPcvksYsMWzcyTpV30r4XTdtIqP6Ho1UNPS9XF
	 FC8M5Sylq+yZrTv9DffsxdwA+Wt9ObCev86N69SLnjJud7nvkY2iMD0wp54g9p7AcmBd4
	 EopmH3SfuzTD5VlJrjLahVhKqCFN5aqJflIX0JCWAQxyG+itTigmUDMhJAzehxytNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
	b=yHrWwEq8/zprxkX+EfYnjC1iDTOYr3j/c2PRzGsVdTFteRFBI6m0x/3/0sdCJ4nrsksQ
	 TDG/w/DPZde/kkwSBgfa5MxFS7jH/b1Y3atvRyWKwCdf17IxJZKdOjrt71PAfNR+AyrFR
	 dn7vj2A2GhoZWBcL1dePA7OZoxLKrJSLBVC+qllB0HTFWnQECYln0kXaO9OUuM4egg2VP
	 08Of1kVTc2T8BQVPxBdRSNCJvB39c/dVW48iprFypmD5jlKQ7yTvc4u8puE0brfv6o4EH
	 B746LatTQi1jI/dQWEupUv5+sMfEKadCWB1UmKFhl0TB7aLW9samj/PVKjk3BAmAsUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Jm+aKW/B";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BC606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jm+aKW/B
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjt2Z2179418
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=; b=oBnV9XRNseDfl5P8
	2AscwJxNZGf20yy6EJFwl3Zm3gjUkPbkGy+EOIa2qpQ1BM0bJCsmhZTiidPWYwi/
	y0OcXHMgnn2Wbo1hxB+UbsgFJb5iYfX0hYmw3+t6EyUo/mkWWxI+G62pX+qE5Tp9
	4+X2XVG62d8B0H8bqdN5TND2DDhCPYh74yspvPaqJTQGLwUktWx47Qpv4YMmFTx0
	ooNYWnUAmGK2rfgIqn4PJJfhVP2L7kwRs2n0jzrCxfNH9vDtOVrj+VDyAmGi+Naz
	UwWRud5F9UecXjDeeFCDeTk/9PirC1a0tsNoufyDkuUju+Yyp/9yHRk9dkju9tyB
	5uQAOA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx68cce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:57:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383f2d05c73so3078971eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093021; x=1795697821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=Jm+aKW/B9vuNGDgViYiod7XDLz5WaYjy1ngzfOf5CGnTKsKOIxyE9i0Jgq3WihRLt3
         QJYRZQhiX/V2Mdaqky0Lh+xc4jdoLCqwI0t1UNmP+VtUoieOMn6Q/X/++8ghrTcdh0ed
         Y3YYgmpRbK3skqy8jEDlAJgsipozwE0v9p6cVFR8VkIjlnNkF4apQ3wly1Mw/fUCXMRJ
         OTYZVrhGlkloee/TRjh1f9na8EE+jXl6B2gBGXLDO0KiM9TXhMK+BrxW7Hs/I5Zf9dgJ
         uT4b9krJPgW9bFn3btjx9xcPAXjb04mzgZ2W9Ki3dgVh8mf9/PpJA2LkldX4AsjWSVHn
         lEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093021; x=1795697821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=NYdNqW1PQZV6dtft4LA7MBuSBXCG19Z5HNvLgGcerc5SynlXKxsKQ85SHxmY4sR7aY
         82vHJy9x1UIfqq6N8f0C5VxqgVIrFULLMESzXjAFsOMvgghXJWEgegTwOqLBuS+2MIPW
         Y2UjEMEsBkTxLZQs5ojOvf7jQOgXCk50pbLhr9GimkqBh8M/W0RaoXBBX+H/dPml6VQz
         oOBI6l2rE+GAfU6d90WbNto5BvI/iIDDGTmMperqlHDWO9waR8W0ZtSUA8im3owtxlrs
         tsjT08C15kProf//kV400Qxan9F66cPWAG48X5KbHwck7C37JR8voWKyA2wRrK+lokAk
         Ik0w==
X-Forwarded-Encrypted: i=1; AL+hErHM9r4ok+d5zYaei4QuDuoyu2mfy+jAk9znY6LClA6KS+V+P9sk2ACxZ9gzqXTDCz1AvrecGx/YTo6elVSN@vger.kernel.org
X-Gm-Message-State: APuU4Z/wf007r06CV41mCOigOaa0KhJowfO/aYzCUWKKxnPvykv9k7Jw
	EgCkrIR7uRr2wrbvmQG69AujNIGgvv920FESxtez2VNOxY/KWhAxuBW6crjDy4zSMfu0wC+9K8i
	fdwEFiR+z8qSzLdIUVcLEc3OHJ6wG6i6pIPEBYCxNPyxtYvJMEImWS8gN6q0cyf5BJCgD
X-Gm-Gg: AZFdTZeP/tCqUu25C/fgcksu76WMgLSBYJMANrgAtmh61nKFE3wJcerRddnoKj1vYaL
	mHEh4Tqd4Z8b6RxjdnxP4Z/5AkP2vR85Cf1j7mknsMG9gwEuG3yOQbp5l1jimOc9uOmMeaz3Kd9
	T+TjQfe1jokElQKS4ocCnEeNH5S+Ap19BbNPKCJz4Cbfrldb4L9KVNBDC6Qq66Q+bli3AFJB1Qb
	mlrcYHRjnXVq/+rw/A+czHafzxO47QPLkIySECi3lGMm2OGhNn0NB8Pp5yPf/fHk7RFdAQ7hwHb
	Fw0K4V4LHPm7Lu70OMK+XU9aBput+TJMUry/3z6ZX2UYnhNPZXNOFScqsUgHDxgCMF/d8ZduToP
	aDicOVT16t6WHedyeU4CqQxSfpmjVFtvsb/UCPAi9KSkG7SQtNPE5NrxeRPRRBiVTGhrs9E9KUi
	BLUiLNGHZ4
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958740eec.22.1795093020538;
        Thu, 19 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958700eec.22.1795093019864;
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:33 +0530
Subject: [PATCH v6 1/7] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
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
Message-Id: <20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=5883;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ym0w2JFu4Q8J6SLUhmOn7q9U3/O2c9O+f8dhYs9nmZk=;
 b=GKA/21jMYBH5Y5+9KJeS83+AIQ1zL5YHNq0gXkifEGDCeF/dctt/LHjNzfDkOJyveKlXI/nLH
 qP9dXMNA6ynDswC28JhwmChVx+Iz5srSsrFpQNqJaXTrRR71SdZjLoM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: kxVMVOww4a3BNZdX8wfFrih-uKKGzo-7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX89LbnZSs3lvx
 Q7M0UJ0+vC5QZ6uHDu8SqZ+99qSIEWdcDBJcB3QnbqG1uKwaT9Zj8bA4Xpl0iAedeKke8Odzkzk
 +X5WlKRdTfWy2Oll7RU4sV3vrI6O4Zs=
X-Proofpoint-ORIG-GUID: kxVMVOww4a3BNZdX8wfFrih-uKKGzo-7
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6afef21d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m7h7XtmfQhPoxq-7kmMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX1V4godasuwRZ
 bHP+rnnbUgpME6IxXShSHxwLTZxLliYj5EUXlGjavtEUrXsv7yXbrmvjSIzOxwe7+I4p0rzO9M+
 RPvMxwwrYiiHXB1vSsO6RKYIFwSFqZ7/hfWSIH3fytF60RTQuJPoXMDkSMbl9tdoqQa6MNskrse
 IZ+MEMdkLtw5enSIKDKeVZNvqep8gHghIysC6Smjmbi212SdvWpVK6JL/OAIWAdHewgOYLMskdF
 NedTrpUWLbbrD9MTAsqDlTIDi60NmUdONLKgEBCa5B7ZRoeIDUGHyRqMfBr8Tq+08Kgqtn1v7Jz
 AgwFjD/28Ih3NTAemHkKCYkImIa77tj++VHlkZurlb6seYVmfIGoEDq4dkFjwIknCcgFb7HMfDd
 pnev0rv1qo3EvrquY4J7MEcep1NoAbRMnhHb5Tmy9YV49NdNmJTOQbQ4XjsKI2I3/kZm8svvwUz
 reofJvyM4p67sVz5isA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

PCIe host bridge devices may need their operating point raised before
retraining to a higher link speed so that hardware resources (e.g., RPMh
votes on Qualcomm platforms) are available at the requested data rate.
After retraining, the operating point must be updated to reflect the
actual negotiated speed.

Add pcie_set_opp() to look up an OPP on the host bridge parent device
using a key of (total link rate in kHz, LNKCTL2 Target Link Speed
level). The total link rate is the per-lane rate multiplied by the
link width, so that OPP tables can carry separate entries per generation
and width, e.g. Gen 3 x1 and Gen 3 x2.

In pcie_set_target_speed(), call pcie_set_opp() before retraining only
when upscaling (speed_req > cur_bus_speed), since only raising the
operating point requires pre-staging hardware.  After retraining, call
pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
the votes.  Both calls are skipped for downstream ports of PCIe switches,
as those are outside the host controller's scope.

Some controllers also require ASPM to be disabled around link retraining.
Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
pcie_set_target_speed() saves the child device's ASPM state, disables
all ASPM link states before retraining, and restores them afterward. The
child device is used because the ASPM core ignores requests made on the
Root Port itself and configures the link through its downstream device.
The states are restored with pci_force_enable_link_state(), as a
plain enable does not undo pci_disable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
---
 drivers/pci/pcie/bwctrl.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h       |  1 +
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3b1122461ffd..c1e749df5bbe 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -28,9 +28,11 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci-bwctrl.h>
+#include <linux/pm_opp.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include "../pci.h"
 #include "portdrv.h"
@@ -98,6 +100,37 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 	return pcie_retrain_link(port, use_lt);
 }
 
+static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
+			enum pci_bus_speed speed)
+{
+	struct device *dev = host->dev.parent;
+	struct dev_pm_opp_key key = {};
+	int ret, freq_mbps, width;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	u16 lnksta;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
+
+	freq_mbps = pcie_dev_speed_mbps(speed);
+	if (freq_mbps < 0)
+		return -EINVAL;
+
+	freq_kbps = freq_mbps * KILO * width;
+	key.freq = freq_kbps;
+	key.level = pci_bus_speed2lnkctl2(speed);
+	opp = dev_pm_opp_find_key_exact(dev, &key, true);
+	if (!IS_ERR(opp)) {
+		ret = dev_pm_opp_set_opp(dev, opp);
+		if (ret)
+			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
+				freq_kbps, ret);
+		dev_pm_opp_put(opp);
+	}
+	return 0;
+}
+
 /**
  * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
  * @port:	PCIe Port
@@ -118,9 +151,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
+	struct pci_dev *child = NULL, *dev;
+	int aspm_state = 0, ret;
 	u16 target_speed;
-	int ret;
 
 	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
 		return -EINVAL;
@@ -130,6 +166,27 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * Host Bridge resources may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (bus && is_rootbus && host) {
+		/* Get function 0 of downstream device */
+		list_for_each_entry(dev, &bus->devices, bus_list) {
+			if (PCI_FUNC(dev->devfn) == 0) {
+				child = dev;
+				break;
+			}
+		}
+
+		if (child && host->disable_aspm_for_retrain) {
+			aspm_state = pcie_aspm_enabled(child);
+			pci_disable_link_state(child, PCIE_LINK_STATE_ALL);
+		}
+		if (speed_req > bus->cur_bus_speed)
+			pcie_set_opp(port, host, speed_req);
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -154,6 +211,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host) {
+		if (child && host->disable_aspm_for_retrain)
+			pci_force_enable_link_state(child, aspm_state);
+		pcie_set_opp(port, host, bus->cur_bus_speed);
+	}
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9cbcadd08f3d..352079393edb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -673,6 +673,7 @@ struct pci_host_bridge {
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
 						   system suspend is broken */
+	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.34.1

