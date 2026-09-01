Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC2442FB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 03:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234827; cv=none; b=fvQoajYP5Fbx1meFJTrjgeCTajGVH9Zs0GeWGrhQOAFIlGJMq4T0XAOjZZmmCEtdvAbBcQkXy9b0IsEUsygF6VUbRmYt9fmOmSGg+O63HymT1jlqBnuh0/BAy+rayLC9TOFtDOZc0OnCIPSXBEbiXnRYZWYjv1vu01YE7VniFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234827; c=relaxed/simple;
	bh=Sucy4fr6KPej0mCXZ8RPlOV666LJlaDDldUIymHzob4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duPOoDtX9ep4l1OVP4pRtHiV+2oKPVcUXHlQhSBms1kV8BCE6Q5S5CrpOwN3bHlcWQ5fCqz7AAG+wRfTRzvRCBDKimOTMCC8+bJzAotZtxheW0DxTgOmm9gUNh1n4E9atPNHODs2mOUGqWLd6oro0BNqQBc176/Nv9qBErK4c14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cK/UD5eQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L66EQ7xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cK/UD5eQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L66EQ7xc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68123OF9535646
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 03:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KS9QKPVhNbB
	jP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=; b=cK/UD5eQQgBvQFMEjZzQVD7DnAG
	s1vUo4RoT145Vhw4aF1H5pPhqGdq81oYfujmtC2NAUk0QQglwj3/tjXWpcNrJ7Cc
	6UKbOK9AfCRMkB1cJyYNPjM5JtlVZgzYVpJHAEKi2R8smESF8923UqagwoucATOc
	jERyH/72TetZkbwUsjy3+NrF8A8cOEq9YBxeHCik09WqwblFS8ixLF6sdhN2PMxa
	oAftPPQyx8sOedxVe9pBmdWmyCS5wfH5PLEywOP9SYnwAluYC2+lpdmc7TBbvP3r
	+RR4629WLxeHyMpWeTGTBK5VHRcpp8HLnY31rhZyZw7OHUppr/LdD67oKtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8rc04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:53:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f710f066so6714425ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 20:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234824; x=1788839624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS9QKPVhNbBjP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=;
        b=L66EQ7xcr4nZromSZmI753qxYDfni5SHDf+hkox60wYppmXdh+XJSxjsOWlrYOZzE3
         MwJrOzoWzlMMbFat9qsojNGbei67C1rw16j/Uz9cZbL6KaSHQnFeNS64+kd/8t4AGuZP
         frD4pZM7+adnVrxoAKqXdhQsD/W9498pRMcDgzvtL5TAGHt0ATxI34kGN4Ymfwu1rHO0
         wlXwN7HNSaQRk+LjBojqe2wF64fM/vEIcunB+KJ9U+JyzWpdD6UEtdZdML7IoUjlVv46
         MYN/i2DK1jy+PM6ksD3oRSeFb8FKx7CLuB1V6PGLVw++kKSkGXc6id6hfYJEcc5MSGze
         l3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234824; x=1788839624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KS9QKPVhNbBjP7g5X0bEgCE7crQtVcVR9ScRHPxuWRE=;
        b=isxKolmAGGqwgccd/iULSuSci1V2B78rTO7Veen2Xp1P04Ug3jZy930zku0uX7JfaW
         +vjciI6w5F5lw2gcYtSzOGgkYoanK0i8x7LAQTH78M87iS9Ov7JnBKeKcLPoght0BAd7
         YwBtk+pMByFwuLddrPpunRfgbSrt9I+iR/I8MOKukPRgKdCbkSOeP9nwt7cJ4tRvZNlL
         nkOLB/HBAH+Q0O3HH+vISo+pr1inx90PqKLy7OuyDpAgKJn7YkktKpv16skQ4qEUT0lL
         wIwUkvVlxH1BlRvZ7FoIPOhhZnZEkA+McPAOelHj3uL3KZiU2cJBHzII2wj3tcRtnMyZ
         xOqA==
X-Forwarded-Encrypted: i=1; AKwUvBz9h7VNO6ZyQVjyTVddcext9HpX4D8OlYJw67H7jfC+y2HW+yZaML9sKdb6KMipMD8GzSU65cdW0xjCBanM@vger.kernel.org
X-Gm-Message-State: AFuF++l8GfWqVLxFmnvUZ6XXfRvrYYiJ0Glq74XouBBTpy8yKjtdeGGA
	K3kPl0DC5DV+YAgLQJQQo4E+XcSlcxHPeyfCysqQ+DD+9BJthRZEa4vYolpQKMhKsI4AuMnnk5t
	bkuQ1Tt6QioqVDCq//2e0POXHdWyEvXyni0vDFhPfwvY/yq3H2Fp5T4Lwg9mc6vAXmnhx
X-Gm-Gg: AYBFou3G67QA8Rs4/qJVPtGG08uOHKWMYsi/q34tqxB9AnFGLSq8blrCaHZ7pI5Tflk
	TYFacqe34uWBHoI94mY1UTEIBCH5nKy7HZuC//9thazrhYlkG1pmniZuJ9BRkULh8txszQYqTds
	ggtLZRre7cqOWZR89bh/ceNai3yAgTZrrgt1RrKm3YTI9DFv0/BDcGrtEHr/uB469X95h9jJXt5
	OP31PGFM2UvOS6RrevhIMNy9zX3G7LrgcLswi0kIhr+iu4jkayHS8qu7NVsvr9+bbtEZGadsxHI
	CcJj7gXTt4ZP8Z0osjBleNa1QxMgzKb7uRUrIGfxHpeCO63Tq3yfFE7qa+C0xsdC76mXblrzSZg
	LWoFQYRiQTq4Pyi9VpZBZZCy543Z42D06Y9qstkG9nXFePK+wwSmeJqir8wL0
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr26351865ad.2.1788234822994;
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2d7:1b20:e98f with SMTP id d9443c01a7336-2d952687ef9mr26351385ad.2.1788234822541;
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:21 +0800
Message-ID: <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a964c49 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3weyhEHb0IcQobFNrp4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX9AsIs/ErbuPm
 T9H/RWLo6o1K5b2HvAtQOBhfgxTcZvaWcOXyKbbyGT9xBFE1rhZADrVWT5GHXxadR+Du5QIy0+L
 O/H/EOPwoCK5px+4mqSR4EymnK4Kg0XDnzpbaeUmb14X0TplVhfzdUeSrNpuCvY5FSZPFeBNkZv
 tKE1YLzaZshu1eZ16+k+i9pBJrQEE9IX5SXJJWF77q8SxBvvV+b50ZFVwddMgCDMNj2+/BZIylq
 wGWAHKiPQ/7MqgccYL2/r2PB/MQbo6DKmgIfiRf6wr+GETxg9DCku8aSqJ28HCPdI9QTs68wwlA
 dORhRgnGpbxne3W3qs4ThYYC9JkqGEH3thMkYj5kv/7EZtuvuj0rQaTJaM/4s6KJV2qEOkSFrZN
 swYq2Oaf5JgipAMqAkXgG00PVdXEtL3qn+dc5qiwIMrLTq7NlejVxgn47fg/ovEwJy+nGbBf4/8
 mqxwP4fYRfU4X8NcWYA==
X-Proofpoint-ORIG-GUID: Vhwvp5QM0q2SCViE0IHwwXOOfamkBONh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfXx1KAOyRXTOXN
 A8RExn61LfJ/90v3N2cTcF8M+uZES78Q+7gzZ1KRUuCPlkpkf831FqmxYT0ZP2qR9SozNOwuxW1
 OSt1ux9jlwEB/p36iNpltWkzs5oenUA=
X-Proofpoint-GUID: Vhwvp5QM0q2SCViE0IHwwXOOfamkBONh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010031

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The NE_GCC block has two eUSB2 PHY block resets - PRIM and SEC - but
right now only the primary is registered. Add the secondary, which is
required by the usb_1 eUSB2 PHY.

Note that the SoC has three eUSB2 PHYs but only these two QUSB2PHY
resets: the HS-only USB20 tile has no dedicated QUSB2PHY reset and
is instead reset as a whole via NE_GCC_USB20_PRIM_BCR.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index a7024317e90b..ad9ff389956d 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -121,5 +121,6 @@
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
 #define NE_GCC_QUSB2PHY_PRIM_BCR				13
+#define NE_GCC_QUSB2PHY_SEC_BCR					14
 
 #endif
-- 
2.43.0

