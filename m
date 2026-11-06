Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934137;
	b=L7jfjS3p3XD5uEqWnmGypuXrWbiRGYqb7PwMPg7o1d76x8h5Rsq/juFaZ1UWojCAN6eK
	 AyNgruJjPN9/71k4TAKIxtsIqhJsT7+bIB9usd7KCtLWdB8p4jvthYRyKFI1TMBa7mcu0
	 hg2EmBWcy1OeKDpAqoS3whWCRyk0IHCM5Bx/G2EcuQFuB/0oZss+n6ZMVZygjc4pDzHrh
	 bIKXlqiNNEpLGWcdJ0PBHvKl06jKF6zCroSz5tjPBct1UA6xCjgITy5Pt72yioF/ItsaU
	 afpRDIg01/NdMYFE+CGm7r0fIv/k4//P9lo8QWbBQwLuDX4GWhlU5B91Ax43M16QdsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
	b=PrK3VurdU4Ln4YY/da79Ccis1hPoUTzicByIuoqGAqKg5qrvnr4Jdfz8pV94pnE2rqY5
	 Nr+iH9/hK2IaETRiGoaVxb4wYOFcWONRfxs01+ontMmWgMtHjrgkjxNzsDUqpT9woLEXL
	 rX61/LGVmTP02Gv3BfCQfCEvzR3jp/WUK8vmfxqs9YqRbHQkD0LOiSFnC9+FgH/vCg37a
	 LglpQuSys0MAJ73mwRft5xQfw2rkh2hSOiyDuTDuoa1JQLPYY+YgCGaEiYdH1PKb2yuO+
	 qM55l9lbeheJnceRmOpS+xmwxmUrwdQkpDrj/fD0OFq1+hHDH9kAXhL13ahykWmuVJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCF606A33D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 03:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BDCF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeqHn2274541
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 03:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+
	apeYiX/g=; b=RHWtcteQGaMRU64YkRnqkmV191vilO66tfkPxdKF+xU5483fDKF
	WZS9j5/FskroCvWXB1GiSvDywhNMVLx40cXNau6z3VpqIkfx4KroopaQ4Fdy9UOv
	+vMJBscOU74HXOxilluzEp4OoPluQi6pc6n/mdrmY6O7/tV3dTGMChHd2yZ0qt16
	7I1GCyA8+LSCBsoo13UoXipZeuIO+ADcWrAncMPpZ3XHdA3FB5T6VdJFqW36ZOYD
	S+AG2ARJNu7+NIS3jE5hkzLxT8h5jpAT+5cbzLwaHVI1MCALqeHRIS1DxtxFBjUM
	SoalYoUejOlhyOAZTZeoq5Y+FioN4sXf16w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0mt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:02:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso2070727eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 19:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934135; x=1794538935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=UZAcDcqXVYesCM9ONw3xM6JzBcw438TjOAas4MGM/nsMj5SIhIbyCpYkfImxuTf5R1
         x1vZpLM2qM/KvyaoXPUYbMV3CBzqDFBSBfVELCnygeSYY0aRCJsJFkL/H8MDbVO8gM9P
         ztTRbQLOBsEo+wU1YwWUznQE6Y4QhbqkyDb/hAPI/YotAA2ttTQp/tyoKccZpCVc382p
         HZWjEAknNn/hC7Fnsub3RHQZIHDB4jvFjwC0v6TQJuUP/X7RW/f2jbhTc3XvExjanvUD
         FtRfbbe2rrz5YzyE1KMlq/sZ1RDXNX66KKJplvED51OZCKaQw7O2sI1sXbYEjIV9QuyD
         hlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934135; x=1794538935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=hwFngqVvqLHl4JCq/NRSKxnzSCTeihN7jhoS12oj2fvzg31VgUo6mwGvtHpYBhqaqH
         /1gLTrTIpfUXDpmBJSWg+CF0xSD1cjyapqbgyWKVMPcMNEI8b4razbSXlcjZ9ICaWZOA
         qJa/4ZbM9PUqrEW9YvBTB7OOvItJwpNbeEIYB73c+nrOuie7AuoMSXd+wLRv/punO9yb
         NuKL2bnQtN/r/CBIWqg5N7QTsPZX6twKBjvXWLe9ZV56BGHexjMHiMUrPU4tu8ek48TW
         vEnfzyAN+vDVHORz/xxND24X/vBe7XyQHPucqcwixbbBgjia9BPMnz1A7F0F1iXwjQn8
         np3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxy3u8at7N9oXrrrS4WNnaOBX6t8XArlUCsh9hemNdOO98BAAcEskbgHMEnmdAoNWmUhrH1E0Jy0ARblOSY@vger.kernel.org
X-Gm-Message-State: APuU4Z92i9ntIyxdhgC7C6Uy05UP+Sef+H7fhTliCSKHbPU6KifNkuuC
	psa625TBo5o3tO0Ids/PAVXRdgtaUxjOjYZW/+Z1AcEMim0XhSbg/IK681bKMy0VZKiqP6ZiEgF
	UNS5BSWP4cTFzI+Hh0x8e+wUeSiv5Mok7CF4EYy1oIxYRvmOpeN4l7j4nqaciuEvR9hQu
X-Gm-Gg: AYBFou1WJwGkRfHg/i9XSa9rpjP73Q9LMz25R+UPSUmAK98AyVbK+f97Udrq19A/E6L
	bt8APs81wW2/7L4xQpgyd3W8zubw3XKC238oHYDs2q1Hpn1zrMpSiHoFIB7wSTr/VgPtb6qBS9I
	LtlzgbReyuckyIjnFyv8bP3Z7FgL1aJto3ITUEpJyW81vmfNhHbytWPEeIbQVXrUVzH2YOS39zl
	feJYAaeeK0AK4+QF2aennvB7CyuzMPv8hNxGXmqe9amXAGxX72j7MlM4tmkRq9hRJ7XbgeldwCr
	tRu3P5Vf/dTVDiGDK/pieIBi2BZdbUE4pIo8GxIB+GhhOJgy4z8LgG3ZE/Mob2c7zFfJGQ2s4D1
	L8xhZJGLz0CieweHKItv8nFABlTbpCSiazWzeKN27Ggo+iSaNT/GbFiCF+CtO/eMU5Bsxa6K8AF
	P1FpnCVgPZ8AOkbxvdAHuYr3FuqR0=
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6002996c88.8.1793934134719;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6002959c88.8.1793934134052;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:13 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Thu,  5 Nov 2026 19:02:09 -0800
Message-Id: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXwMgMfGM8akRo
 K9LX5Fex1M0yC1NVgtxZ2zkzmD/s2h1EKy2c8I5yrf+vHh1ZDIg2YU1u4THTPkfNKW2KAJg2p9+
 Cj0xKdtLBq94tNL1oXtscoB2HIliD7SZCw53A8hrJVAXFVdHOIQfxbUa4U2OIXQFWgm8QRo0yqe
 ApXD4YveKdYzKWv0WnK+8oWHdd68zx780Odbw1lWz125RVnKaeU4OYTvZLw9kbhxOL26oT9zj51
 Yn7S4YX9LyGMwF6awvUfqV5ZqcAW7dfWrmwXIOIT0ew0X6tyhtxV0GduQJ9tDboJ5SaVQMRS1mI
 uknqy+iCbu96bapEVULWKkvlt7gAhgMJwsBZPpR0O/s9JRSYErXdg0aTcKt33hupj82hIka8tNy
 rwAzdkAnlhzMmflgoJtUzvmB1sqmNR+fX6E1OA74B9yQnjkMEc9L2WOqNI7WB3T3igA3lJPmI9j
 Z/kIYKt6T9cxCCvZxMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfXxj7HSVFj5o5M
 KFmgNLLyYwY3dXUJXFFD6mDFsQeUKkYIxAxe6owlmZhR6Abgzq84Wl/LuNpuWW8IZxCXRFGuLjy
 RiBs0uld55MLu9zYg+7ajyjcCOtQbn4=
X-Proofpoint-ORIG-GUID: oLka18RVYImX3gIVCtnOxbohsfzR72ii
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed4337 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TtAy84kTgrs9sRaG4nIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: oLka18RVYImX3gIVCtnOxbohsfzR72ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,sa8775p-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,qcs8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,sc7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced below and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

Changes in v3:
- Patch 1 (lemans): moved csiphy_opp_table out of the soc@0 simple-bus
  to the root node (a simple-bus's direct children need reg/ranges,
  which an OPP table has neither of), dropped the opp-300000000 entry
  (SA8775P's camcc only defines a 400 MHz rate for this clock, so it
  was unreachable), and reordered csiphy0..3 after camss so soc@0's
  children stay sorted by ascending unit address.
- Patch 2 (monaco): same csiphy_opp_table root-node move, and dropped
  both the opp-300000000 entry and the extra "csiphy_rx" clock from
  csiphy0..2 (QCS8300 binds through the sa8775p soc_cfg, which only
  declares two clocks, "core"/"timer", for this PHY).
- Patch 3 (kodiak): same csiphy_opp_table root-node move; its
  opp-300000000 and opp-400000000 entries are both kept, since
  SC7280's camcc genuinely supports both rates for this clock.

Link: https://lore.kernel.org/all/20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Patch 1 (lemans): dropped the extra "csiphy_rx" clock from
  csiphy0..3 (3 clocks -> 2: "core", "timer"), matching the driver's
  sa8775p soc_cfg, which only declares two clocks for this SoC family.
- The "undocumented compatible" and "camss_detect_legacy_phy() does
  not exist" comments on all three patches were resolved by the
  companion phy-driver/binding series and CAMSS work landing, not by
  a change to these dtsi patches themselves.
- Patches 2 (monaco) and 3 (kodiak) are otherwise unchanged from v1.

Link: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 104 ++++++++++++++++
 3 files changed, 412 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

