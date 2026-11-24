Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513194;
	b=FNSXxMmKDa2qeUuWnCiVqu/0Ygiu4qTghu8TdyZZder1UDflLT9PyCib4pQdsUpF9u6C
	 gAJJ8B6qSOKAuDmEr+8KOprBZTWhblsVa2+MFpUYu5yzRjU1CBThjFuSJ9uuddFEUBMZq
	 i2brTfM/xi0Y3AfR38dG4VgcagwDNT+qRkiC5EzUYIuZHpy/iDQe0CtXCTcRg4Qefp4tK
	 TG5+cFFJpLDvckG3VEGrEWNQLS1OWSeIPC1+1902HNq57tfGUtdsjTMiA91EDcnRJXQn/
	 ruwG97mcJmSe+4Eb8NPlKSIrjF/ZjzukTUp4VNf2S+kxEhSkYgzE2eanwV8SzO1M0KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=;
	b=HIEhElfHwnJJdwr3jUofVnRXuLd9sWiDYXlPmc+1KChIlOD/9yJsSVHIFCtgryRvVHmW
	 7wiln0to2LE07gAmSI4Zu3u3cFctTxP4Hwpd0JjKW6wQs1qJOpSwrTbp5n+XTYpm1jTnV
	 VNfynYSOQp49wAtq0BZXyqxLAYLn5KSVI0P+RlgbwiD57UPN4vGY+yvz9MLoR7+CK5fyk
	 fbFV+dqYy97DH0+2KGG4kIasELUzSQeUx1HqLJyWkqlR1SQkc7EBvtsEKC3bA75l6FIDk
	 NYCUL9Ve8XSwIjlQV1XfYK+GFVeBwz21JxofNa26amHAXIsVfYgRLnbrJAXotiWLSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsMCfChj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqma3d0L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED23A606A6A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED23A606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsMCfChj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqma3d0L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mCRS4136027
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqZD3QesazR9IJo/XZx5KP
	+fhEgHwQx1ARc5PMYbTgs=; b=nsMCfChj2qcb1+DYCuLPiQs78IoS7PnG0nQ2Yk
	8dfS/ZBZyKmYx016/oU/Bsx4sIMOqbMnplpU2fnF79xfbVdfkPoypyjlU6bNinko
	nO5HPPmOK3iN7lZ1DIPaK1YOva9KDS8lOPwFNskcV5jU8aHDjDfJDK1SBPvtSmSp
	cvRltUTvieoyJM+2WQp685k/9JplnzH5J6Cs+2iKKwphsmp9TV5yVBxdh+gFNIYg
	PaVaZTUVEV6s45Ttj6pX0QkKJ801ZrDuxM/xLmWBgcVInEsgA3Gg5aDMGcfcR2C2
	5Y8ONGtDOn/1EGawnOk78HKI1KMp/8wscowXHNc6FKY0PPLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgxw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065e2933fso4885000b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513188; x=1796117988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=;
        b=iqma3d0LvwCy2HtlNhQO7G4aKbai2YGFPs1rfboG7hAEfxgtcWg9VS5Tnle0vZiKhw
         n8Q3/HN8fzKGVb5BZOmwwc2/5pETXIayd4Dil2lxSAkFA8L2G80nbwdnHo8PLmTbBnxf
         d6A8+RHdbwXUXUA9P4qF3s66hDVJ00QzulVorUklpfJhq+VN74AEISxEW6HtJBiAUEKC
         5prsoLiprPSvbJiy03jiUKrIVw/m+YCtIfdwC8pP2+J+pslNdzYoEymZSnZAg1z7xOFP
         7CAVKsTdp2j3gYh2nPd6aZzjyLt/RBOPZYqucBe4zBLA9Xr4hEF0Qk7/+88iQ5+i/Q/c
         c/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513188; x=1796117988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CqZD3QesazR9IJo/XZx5KP+fhEgHwQx1ARc5PMYbTgs=;
        b=t5JoKH4UzpMTPYRPECpUjO0FHo80L7IC655rWfkWvb1idFylYchUaoGeEhWQTJFCjx
         Dx9W4cLW+POeLOdK2CmSPjdJVt4YObiXLspVrvnLx/v90XqvYtQdY3pQitn6k8X9gxp4
         2PKuJwfsMmHMdpyftyyIK+YcVjWhr8R0zZjjOK5U2qua3yCltWgSd7upjLUzPvIpp++t
         IRijCwKvOeeNGk//EzZN7+ukUz9T8sdwA1r8VB3aQwGI/UdvkERdUTlFIGCVeZwZUqzN
         l+DJXrhNNcC7fJdYLSp+4j9K9zLSf+T1JDKhMx4jCZeYoEIQkbe/iV8nooj0YvebJ+aH
         E5lA==
X-Forwarded-Encrypted: i=1; AL+hErE4F7IQgT+NNgtfj7nE27W2cU53OJ1hh+a7zrSwzCmTE3U+5lH+lvjmKStElMYzD8PIXgemVu52VTrtuYOy@vger.kernel.org
X-Gm-Message-State: APuU4Z8U0qrJYDr2JjPZKDf7qx3fGmDj/ibsKintNEhAYNhKjmyAHGb1
	hejJucBwTFxPTGUREKih4KKsb3YgrmQ8D7/MeRk6TXWmvkbjqFuDrVER5CfSJv84QR7Wvud+0DW
	oNoNHfok5km1QW96wLV6rkQvveiIgInLkyaDqZp4B6TGLaOiW2SCekrUzNOlF/WJ9CM17
X-Gm-Gg: AZFdTZcppHM2OmaFGNiYK1oGkDw7yu0u5U9V62U26GcSk7fJlV01YCpYRYgz4SrdL6o
	i5L7vu0Lfc6gBKNsz4jG4UYBXHgXGpt7uIzP31RuiteiHoRKmQYhi7HY2J1w1wFjP4hGzDJSZVx
	Bs35Xl2bAX/Q6QcwOg6wB+FZneXmRIa871TTyChJqtTpZqd4GwTvDFGowxLT9OzXuG3kgc2Rjvo
	zAAfsapHQ2o6SlhKpYjEag6cJK2z0yvaCsWcTZINGXP1eeu3IMUcFJVhlCFABkylQlMzB5gzy6b
	w0jDbaBVil9hUis2UzTpIv05q0hAZcHHMypuOzvlTcLoyZL79rkPgA/0N6M6y/dVi9tErlqITu4
	uz6owEzP6Ooqd3pKLvv//D6ZwyIYjMOqLI7IM3pPsvr8bOL6Vw/NqrMe7TjlztARPcHRB/OFX5B
	aHSBevyvLW69A1sshzZvxqJp7cVF4v9Nun35Sx
X-Received: by 2002:a05:6a00:2345:b0:8ac:2c22:4b79 with SMTP id d2e1a72fcca58-8c87b4f42femr13584611b3a.18.1795513187924;
        Tue, 24 Nov 2026 01:39:47 -0800 (PST)
X-Received: by 2002:a05:6a00:2345:b0:8ac:2c22:4b79 with SMTP id d2e1a72fcca58-8c87b4f42femr13584590b3a.18.1795513187416;
        Tue, 24 Nov 2026 01:39:47 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:46 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add coresight nodes for the QCOM Eliza SoC
Date: Tue, 24 Nov 2026 17:39:29 +0800
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFNbBWsC/0WOQQ6DIBBFr0JYdxKgtlqu0rgYYVSSCi1QY2q8e
 7Euunw/mfdm5Ymio8Q1W3mk2SUXfAF5YtyM6AcCZwtzJdRV3IQCtBZMiJTcMGbwwVKCPkSgh/s
 gVBUqYeuzwLrhxfGM1Lvl57+3B0d6vUsmH+O/otnekFI2UE4gRzTkg4FnDB1B1zdCXQxaZVDPc
 nd3mKi8Mk0ua+ZpyXAIlODttn0BXtVZC9oAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=1179;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bWSvNuLq4UwhcNgU3WU8q46KvqQfdKWiClSimIaHvk4=;
 b=j8yfTjmD0mZ21nyFnkalgTIlZ4Cbn8RzXjtWKFtgZkwiTU96mRtX5OSIFM7FiEzhh1zP4T71T
 VcdJTqD8IcKCH+qo66PfSUYPkbuamRSO8Kj/drGHUCfsOeAAqH8BM4l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXwSt8keQhe286
 yy2vbCAN8EEfAAz2KosZItTcYY+2yQyLBbfwmpbqA8QWloGafwMT0mB0exnSoK8OxOvX8nbnDdX
 dP5v4XpIu9X2KA1KfOCuOGBTqoaVxOsjuGtxZOqLqAf1yr6nbv05LjpLHRbaHVwj+vVsHHAUdZv
 grKTCZ7GoxugJHzl2fNxPCYafzgOttuU8EwBSAoC4IdfgXfi4570weJV0V7Gf3wqTCXKqTr4FHa
 O8+ZQV0U3j/PKEh3MeYeedPnzzq6THnrzEXeaU2VOIN0teu/+mapMWwtqt/yP4yzy19kixRwwRN
 Hn4UD8wIWIvfKCT5/vsICTTXCRDJv6BLTooDj55tsTT0y4eBfH++orc9rlzRtFkpEERiXAAB1R+
 i6oewrHkIZKAm/BPux94FjwYuV0wP/1/STMZ1dKkXiRJXb05C+KQ9K9pSZrD2miOwBjSr1qUyqo
 5eVu/U3YchZh1sUIgVw==
X-Proofpoint-GUID: _dmbBg5oASzt2sZ1aEnmXp52I3cKfKB9
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b055b65 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pitd1UQUPAqnyXy6cy8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX1CmhxDx0e1Mz
 1UhpFeWX4cm2Zh0zt7icvkbz8w0bHrUtC2BJxK1WMV7LcySzfvDBWvgF7pAKS/ub21WoPztCUas
 xq7NRgTUxF/ixJUbUKcTM79k3Aho4Fs=
X-Proofpoint-ORIG-GUID: _dmbBg5oASzt2sZ1aEnmXp52I3cKfKB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

Add DT nodes to enable
ETE/TPDM/TPDA/CTI/Funnel/STM/Replicator/ETF/ETR/dummy_source/dummy_sink/CTCU
devices on QCOM Eliza Soc.

dt-binding dependency for fixing the probe issue of the TraceNoC device.
https://lore.kernel.org/all/20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
      arm64: dts: qcom: eliza: Add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2177 ++++++++++++++++++++
 2 files changed, 2178 insertions(+)
---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20260902-add-coresight-nodes-for-eliza-44a20d730a78
prerequisite-change-id: 20261118-fix-tracenoc-probe-bf8025cad2ca:v1
prerequisite-patch-id: 1a8b6c3c6cbeffe85cf7e9ba18047b9e7f93a059
prerequisite-patch-id: 3e735b506605c095cd5145cbbf6d05e52865b923
prerequisite-patch-id: 54676cd3a27d629eae2579b3f806765d2d2f4596
prerequisite-patch-id: 90f74c034275c8673d6c5b44692297a4899e4bfb

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

