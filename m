Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9623C819C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442104; cv=none; b=AtcfdA/PWCArtJaCnIKlXsm9ijJawuwqFnJK4JMCc1OQC4pYXn+rgaE+E6Avhn/4pILi+/utqT8QaHfFfUXSvykyWU1h/2cJhnY2Ld9NOD3EPYKXOrF8dpQc/9KQK6irtSw7kTBJ0NQyvWznaDoMZ42K1Z9gFIyK/0k+hDxkUEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442104; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJfXFl4ZtMVw4K4BqqOilxNjy+qadesYWGA8FMmfrblCzEhXrDU2HX+c/LPkbg/oc2qh9sNHp/6giBMCOEx1u0iDw0Z6Bx/4dt0ez47ftaO2myATIjxufOuh+YdOLZmBS/yKItXvqmQdOXONca8bt70ronqxbVXcM0UnDZCWRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJ22DvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hId1DPhh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJ22DvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hId1DPhh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZfa313879
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=JkJ22DvO8oYEI9db
	0B+z8dGhLGpInzRKRkSHIF3hcNwLqKjhtfCw0Gwqv/4bnorvEkS5gWqqjNOKXeAD
	MredqkqKwcSXc1hmp2jqMTkRRB8WQkw4a4S5RgUY4M14LTqXBzvh3m1eUiKNIO5r
	hkR51OaFpAq9qp8x1pHtcIG+Ovl5mKpyyUllWCLvkQoHtAWihXTBh2AvaChmBjDx
	p2tj4mrZ+n5p9eHgtk+dtFhTa1F4rQ4johJyQPKrkcw6TAPBKsXgmbWJGvw0b24n
	fQw/FZm4WTb6Owbdr+wXkdSFGY67GNwih5WGiumbkPjynC0ALe8Z+XFVzf9WPlcO
	uhslNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31g56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:48:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3947286a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442101; x=1792046901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=hId1DPhh2bcOvwEN5crABCmvmyt3lUbh8OiPtSo1qFwdWJO7Cl6orrXSLfr5pwa51x
         03vOajI4LsMLsHswpLI2LITUYVdhdaOotbUeqJ3Yxs5TVuhTtcD0xFifJgjL3DM46Kbw
         sPaAO8+XGgA1xx1Uwl1rSXptXwrq6w53dkfLHf9VDcIJTRIWkWIwZC7aUoRQtmhkwDJ8
         8ufxa752xjmAGmjnw5TDRLk9YD6JFFiTHk/P61J9iAYGuT007obug4FV42mi3exFpbOt
         3Eoo6dzC/Y9CRS0PgFV97h15ig0iSrlGEAYfcruV/xJFMlLiIH8RcS3W295OWPAy/lca
         sYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442101; x=1792046901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=C5I7XS5J2szrW3cdBVzT/htqYKY9gzwvqOsnjMdYcWTUqJgV9fMVIGwWohleQF3FJU
         8k/iB/bC+IRKuqOISlOD6QsKpeiUIRPKY0t6sjESLHQEXgJ9sMzkfduWRo4seshiZM/L
         CZJAYHgWCqB8qjcSfo4Dl/nmZLNe4wqr+eq3DuvY44fQHv9ZbRs5B0a2HLx06T0e0Xks
         VkWkoSSiO+L0YSMh3hUmUSazGv4x26oAPRCQgMmuj12Dr2qftOL2O869YEggj8594t+K
         syi8KiC1WYa+8GFQhyTS0mDsxm6CKGcP5xNngKwemszd8DSqyFu2K3Twwc1TlI9h9dHM
         BVmg==
X-Forwarded-Encrypted: i=1; AKwUvBzTKgc84vJHKemXF3S98snxZBP3XPo7lDy+/z2zQ3kL9R84RZr4a0laeyJEaSTNY0oq3JbrMOhU475s7lKn@vger.kernel.org
X-Gm-Message-State: AFq9FYKlgr55t9EXIVZOJSMrICDO5dlr5wRIUt/g/wGs/6Gp7OiFipGT
	TG/MgwoZRGqOWATzfQLNOdG22iDYrJuie/v3J1hgm5P5Bjm7rekt9vx7V2lm/qdg4Cd8fLF7r5T
	gCHlePvDUpIW3BxHwRbKZCUKgZ6EjU9ep61us2xp/cB96Wu+PMDKtopQ8BjQ83eMPsCnB
X-Gm-Gg: AYBFou0sPSlDvYsJ+yH+ncc0C1zJHgM7MhW1QqydK6K17B7mCSxAn1YHYAsi8HRNWDf
	nfY8xmANR0ZDSbldwDnnmukg1z1g+J+msZqiK+4NKxBfC6mjwbiz1xk9QUioMjCLOLN58/yEZZ4
	OLWb8Vttdek2ZeGSXpYCJ+glOiRDBRkXV/gBdi5uhAfYtwW1yQeaugIh9yLZMHoDhyRhU6VOUCr
	Uj6L43CBtNFMsy5sSbZ/wbGkszoNcbJP91MhGO+Fbf8pKInE86b9hbM7ckLl47YSyYGy6dKJbXH
	MmVTt85Kp8kol+qAT4ERoX16I9DiV/0+a78F8a7BLvm01fjx4Ar1qrtJeCnHbvaHchLcAeWqRLa
	pEM8y6N980SHGZ7QXMZ/izDLD6JYVRywMRZwuoqIl28s0xNh7AowH7I4=
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612849a91.49.1791442101193;
        Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612810a91.49.1791442100559;
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:17 +0800
Subject: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442027; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=jIgf60idSKurGrTwCMA9BKGAUgriAqwNO8PbOAveqoTDDZq6G4MsKu4HZfnyczcUiu9e6p/BR
 wz4yxrP/o4uAotz7CeHcNhJZpBpJj0web8KHZ7xhaaTIlilAP1GYCON
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX/U3WgV+tP0S3
 whWwTBHglGhdSkPg1QHdyL1nO2Sua191+166crwu5xv3sogmVfJ/SatOWYQjZNuI1ge+ataAqK9
 54TjAfwM46ieoD7sysGZxOtDVs1JgraGon4Jw7YSWvFWrmU2719MoBKz0NqUs9qi68+pg2CboAR
 RnMlRBw1tXo3DRlpJVn+PdfNpU7cJPu8StXW3n3Q9838OPbzQrYshPx6jcYtaumEE/lqQQq1Ynj
 xdJelhTr7x/tyq5A/c8yh6dWl3+OJiEzfnplcJASzLAcew56A5EZKaJ0htO0JCveGRMIsgiLmFz
 6duti/GdMbE+ndL5QaPiUbMvFiijirJCwRyABBumknxQLFz9sSCMmlC0kFbW179GoGPZZwD0pyK
 fGzHPxqyUHYzW7NFLaHTymKzyBwSgWi1RA0Sb9E2U8wmR1AHcCVAapki2kn+m7/QfLgqansgPCB
 NdOn2+8baIO9Opp51Nw==
X-Proofpoint-ORIG-GUID: blVSP3TQBBz-fukPmr8Y0PyXtD5s3sTR
X-Proofpoint-GUID: blVSP3TQBBz-fukPmr8Y0PyXtD5s3sTR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX4ajawOKFYS/2
 sxiCwwZTFBpRc+/uTVJfgDv5bESI4hrfm5Ot55idpV3Bdkue/Qhg3b/FOwcC4P9J15qRXbfT+oz
 taYi7JBZX2098+4vDVRsK8MzvHBt2Hs=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73cb6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

