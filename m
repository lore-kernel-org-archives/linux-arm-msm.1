Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015945;
	b=I5IEU8hfhtNPnHGuPiMprYkpFEj22oB1jIQ0owQ/U9bV9xipT1qIPSFbmEXQHT1Im/13
	 OPxy30cli4GCIhMaUBKop1r5P3EShvUAoCazbEAHH6dIrn4vriIV86USgaETqmIFE0yQJ
	 CFZtn+Ryti7p8R2aBl98RpycisTxVZkKHaMkULrUJxskLaqfjb7459DP5lE80Pa2JbZit
	 jxhAQ+HIuKV+KLnw1gc8Y5yTSqQkWrjwhZp8B1PZldCfitASu7IGLwBOJT3hgI5vA4/X3
	 ww6p41MaEfTQwsUbk/bxxGmSUpbTA+mByiHHvGPYrT/PQT4f1cJgF0wU/BCFNonyJmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
	b=Yzt1CQGn9XyfZvvkOhqnQfjtALPLvqT1x+3QHGkTwMPMgrRCJA1QGX9tLrBR764EqjIX
	 1Z2QAg7pYjvmKoA9+kaPpbOt11g9lAimuTJsThCTjzrBBvVHUdYfRCUooZNYVJvYKX9t8
	 135PTzS8c5Du58hERYRpwG9iytGuDgyaW58ZrgY69GW0g9uZ+ZpYbhROKTJTOef9aQqsG
	 RRYpXARbuvTg7MyVpCX9zZ2bNASiUHY5XudKpAyrKzvDljrzwr+jUvIvNvz67puGF4kts
	 odNts8qSB8ELlMNrOtHq+a/xy9Nh98778rQAGJLPGAOUjy3ON7n9xuBjroottX98Gfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gW0PHRyk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FArbB7Dd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CE606EEB0
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583CE606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gW0PHRyk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FArbB7Dd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnprP2143951
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=gW0PHRykNFc1GvF1
	S6oBgQZRiZtJ2sVkCStuUhJDwuBD2ZWjRyWIZEFPvNO/jMgt+PeqRiVqM8+otFDs
	k9wVUGTNSJe1iXUzb34pSOJFlgdBdo+eYGy7Q6067/y4D0baObT3qiTAvNUjYFLm
	VNTdiucv3MgbchmG1y03xJmfzwWJTNkSmM34Yqz8dNL/ghcNs53aAfH5jkEEg8Vg
	JfF1jwnJXnJoaVkuVr6mdxHDT8dfaIy3hcRn6L2Xfgpsej7egXDW4D1eQD9+6Xkh
	Cz0FoRC2i07E/r7abA1Ugb5JbZmrpDXvcCJSYC1Di7JmK9jJlPcVjyduhxMY8Ttt
	XqQMcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyph2xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:45:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso313610eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015943; x=1794620743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=FArbB7DdSvR6LFBUR8oQXy7Zvbxgzod+0PH7pfm+Au64dmO+tRsr6+e3lO/42cZ5kC
         VSVcP7W7gDrdf+SqhBNenPDL0aoN+ZZPZJqx/DYnkMLcbNATWOe0QrVbvT7xlvtwuO/Z
         oIROVi+J7ZnNlJ7QvGemOEBlrIfcj/EhGlEVzPsWEbRv0EQdzVmJEFXVwmAtKGsVRCMG
         qeCyzIZ46ioolLF3WGz/FDjmoCfiX6LbYafu60R3lHGpyT93mLsvggMgSjYCn31n8bUd
         TIE+IM7jJ+/RKStUWA/1a5bgMgRDHiHmdVZwf6w6S7VyLyTFz1v02Mh6GIapXy1Qqi7J
         yoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015943; x=1794620743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=xe+Tx4u3ZbcyaiKL3yq+IKNqXPqUkIIvUaml7u0VcjFLcpZdwaI3H9v8R7B9cYB8i9
         ChFV5SSM1Xmoyjx7EGxfcmLjpH9uj9PLyDB/eCwiTOJsThs36u+X9raZc2v0kcoGJn3Z
         CatoPdafbN1Ki4TYyAq/L+JvXfhRiJRAyO4eh7CArfimheBhibjlanuz2iCQmf3e1uEc
         an7m0ovQ+8OvtgcBJg9qBAuyer+NbtrvSwFX7kx5JN+zFaHPgJpyu83P1BfdkFjqgwwf
         Vq9c84KEP5l6CQbnnkOMzZ5Km8t6TTkVAcSDWQYWuLdxZMCiFxYdmXqrCyrb7uyyMRPH
         y46A==
X-Forwarded-Encrypted: i=1; AL+hErHtp7fEbxBekP9dTlp99jj5/X7MWvyZZWlrLhz0745IHWxqQEGAiD5EG4Nx5hmkXP+BCZ6JEaiibDaQTe40@vger.kernel.org
X-Gm-Message-State: APuU4Z9qoyO68g2eYHK0OqnXPVzMJGjqtyNTt/gOU6ssoxlh2p9w/ntP
	OQD25Ic1ORbXSP/AFVzS9jk9yzJ4Wnm8cSh799+SDtNF8LLcYBibwk53MMq7q2LqUFk5fVaqlGQ
	v+z0BiUcOR/37Q4Yr5M+Ur+t/QNxsAn5Z/ZW4wsbcpz8LT0dIuSYpdG9Lww+IfW7lvV8t
X-Gm-Gg: AYBFou3NurUlQx4nLhpvXeHLV6lcYUXcoB6o6xl4whdCiOieX5yK52eaENTXk6Nu4PW
	BTroc++X3ui1Z+MTKVNHtMNjnh4gZZvh5811wiQI/H8cckWULyTMBN5nP6YxcKmCnDVgEI8rksw
	VrBEk9kK7KgZWJTQ7K+sqQXhwJ4LIASQgDp/MkfGEcesiVyaI+IunNm+nNqnScG1Mn+7Ba6oTtK
	nLJ0G8Ey3z4OajBrSE2J+miOER8xRJiN59q+exlolertzAZ+sJWOpaWmnGwI14LxRxvEZsgRjcu
	/UUYQPusJKSsqTEhNV7jZJff8vkX7yKAHguoYrCKPyHnPnbvjOhOAoxtzIWzjsasgSXdozKQYuq
	OcpoLWFsZiBXy28qTH2SfgqYwFOzMwHbyk9g83TC/9NJDIauXP66BLPWlKhbl5gThbBXJdtTCI/
	tk/OcEVFw=
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr947893eec.15.1794015942883;
        Fri, 06 Nov 2026 17:45:42 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr947855eec.15.1794015942316;
        Fri, 06 Nov 2026 17:45:42 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:41 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:19 +0530
Subject: [PATCH v8 1/4] PCI: host-common: Fix early bus-walk exit in
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
Message-Id: <20261107-shutdown-v8-1-bf607c6429b0@oss.qualcomm.com>
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=wYcaAkfQWy2rWkm7ilCCTWzQFh1Rmc1QaTAfbEZEw3bciOtcbL14NfGk/6vh5x9ZF6DDyfJXw
 IXBLCa+0QtKAXwKrtJoYcXO8SmE0SdmbaapVi7ZYdE0O9nGpbii//Xx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX6IA/vmWXdCRM
 K6pG6xlaNzqM2PLaHVbXIgo6fSEbnfMv1GJe3U4Q4PriliLLcv+d2hl1Ojyzl0ynbqf7Zmha+2i
 TIwlZlCv1qi9Y4e4/OpgiQljoRhb/mSL0yVkTdgtk4MYkHZtT4HrRAprRdomomL883/qPKD2UpX
 b0o8KN1nYOlj0NfEyoypzIeuA6crN56103NYFTz41jS3ZCcP+rpuIwSZgn1ZGzh1Dogsmap6WO2
 PMSJSqz+kyIKlCrSW5Y7LGPiz5sobL/PyuUiYEVvTIpyWjWTXP25SuSEfU1RIDDOx63Bn04bs2L
 P2/amvtMbQNDjNNfRgSAroUVfK5RuOepxTpaVj+JnMpUA4QbH8KhSw0FqZ0rRAhPihzroJxSLiF
 OYB7DJTr/6vMuAptIUliK3Ei1Igj+w82ThN2Y6gcrFa+S+ZJp1b2/ir+oD/R/Fh5r9WDu9JKaL/
 BoFCVd+IyyHTu/+rY0A==
X-Proofpoint-GUID: gDSSLgaSik0TCEQyTBiO-kkLmfGtJXkm
X-Proofpoint-ORIG-GUID: gDSSLgaSik0TCEQyTBiO-kkLmfGtJXkm
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee82c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXwGCO9fkj5zkY
 dUQF83VitYUAzZnEzkHQ9HnVR/9z01kgKJofQ2SjA22tWq9ttcO8eMT+t7vsNrKseYEU5JwuvwZ
 6gnbc6WfRmWYcRzZTqA0ujC+qupfsSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070006

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

