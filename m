Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754127A476
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637976; cv=none; b=endh2zzJImiM/GVb00kRplgFymm1/3F9R+DYep02l6kIcFwa5jA0Ds56rBDttNcQZU1PPLLFX40SbnZhoEr5tvs/edY32rGkd1cnkNoNWVlzB2hwTUl3HIxGFjy4ER2JeLYAdMuEtqmVZjQMdnpe+NTOblI8yxeQwb+HrHc2uRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637976; c=relaxed/simple;
	bh=sp1KiAwb7xU4i7/GbIL9uBR5RzBTBtLjDrLPYX5auas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PRizrg1J8aLanfO4EZNRajZ7mSj2FuWeprfAq/kKpeo07igmsMxTXGZHb6QpyGXSoWUT2WonioNiYFMDWB6m78fsPjArr1HEaMoU3wV6F3NjcHYy7wMX49Z5qhlBMiEwusippjUfopLJBId2WTfEXKQqLvp+wp7GTD3FbknJ+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jwo8CeZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIalWHWX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jwo8CeZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIalWHWX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARTKT1455597
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V1I7OD9llRaXfNPiv6jjz4
	t8KLU7H+bwoBYVdV+s1Q0=; b=Jwo8CeZffT1PLL4yRz8jluQmsJ3BbEbsUWj4jX
	nc5aJN4lU6ZJxc9AQVGSjpbDtKvX1TGwU6SJZjC0L/ET0sTMDnlB8lBGVhaGfa2S
	XLLlneMmu0wItT24/lNq689IpuGrnxjAyJzJ8f3l6NKaguhd6KvovpJ3unHLyZUX
	iRYvV8m8LLr1+aZ8BX4E44fRYz/QSqcpJId92B4r0NNhxKkqgXEbv4qc8tDd5usw
	f3B4pLFG/KgjCOeS//IjmKlp1uuP2dAMRarLQVb0YZZ+znfSWA0Bvq/fuWKI7wnp
	pWEtowMmZCBDl8C3ZCB8gbOz2jvXdkoTS/Qntkwq7JzxgAkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujc3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso161640525ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637973; x=1785242773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V1I7OD9llRaXfNPiv6jjz4t8KLU7H+bwoBYVdV+s1Q0=;
        b=cIalWHWXNhFjTw9hqFzEBrXysxxz8AjYW81qAO1QLUNEAxHDR5Ix4SXeWAn8iop9L8
         /6aAZmrxrC4qe0kftHiErneZxHXvdzGseyDnUdGmCjvxAXW+ahYZVDZih3F1FLb1zW08
         8Vdebj48/Cmsz0KIzXvhfxLZY5mYXtq0lwaLEK9hxBifaVjiDI76wm3QqMZfl/ERM/3X
         36TZeXw4V/OhL7o1qeK1Dro/orqE1ZOEeSuD7/rUASTx1nUc23lzEmsEYY2dQ9NMwz4x
         /dl5bsEvf0QFo5UUJUI6YcesYxkugkWDXQ6yTQz6u3fiS3ehWksjmjKtiFq6aKgzKbqs
         cYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637973; x=1785242773;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V1I7OD9llRaXfNPiv6jjz4t8KLU7H+bwoBYVdV+s1Q0=;
        b=MdEG7bTD/yMYFWMjFAmNN9XkjkU/e3YOZBu0t0CXllLljZGjqwHZFk3dNepx0rDKYn
         ZYAhLweRZq4kOKwwG6WzxvW7izMyCFDrq1bbutZ/2o2ovb1WhnWA1ZxnREFTZ05Lxpmx
         ipXRvAljWYg8TPLpttKdoG8HHZrY50G/JAijjGTCoXJyhzujIE3nH5YNhblFU/TEgrPO
         cshNhdfjdrbyF4u6A6bRihluJizGi6hkKaC5eZrd1U6i+5rxY5DMZRKH4tcMMjEvJyPm
         d1MnaiOp0StiJAJm2pHm1rgZKixymYJCOjKnJIE/++crC/bUYiKQacCuKr0jSdKbgVka
         2McA==
X-Forwarded-Encrypted: i=1; AHgh+RoufM0YczMEaJ+Omc5ZydGA0GLo4+DbyxpeP9kHm1MZR75jpdBOqdO5yjtub0/snaIOr1NUm06u9SNjXCV9@vger.kernel.org
X-Gm-Message-State: AOJu0YyHwkcsb51msfek7JUT0+NIZ61lee4ek5OksHNFPuupxGH96tBQ
	QDtEUV/LxO7Qfi1yfgTK1pP4DmTAeAuDoCsyXNUTzfw0uvaWN5WD5XKywoO3rK+zr6Rb8KG8I2h
	6CcJWwMXdrNnGjB4s450HKT7m4hzmntBoDd/5IeJtGZLRLJKnxW4KigZKHiNlchkmZ0Bu
X-Gm-Gg: AfdE7cl7xN/LdkczphTgAKgfJfLA8BhDTblX4GMmiEbAxCLDNhty9pADsMP393G4JfD
	a+oxJGX2j91WtuAaZYkGJktqunT4uW+AIUqH57FEzR0TsZdK6QuV696+cfPsPp9z/SChU7iYZ2n
	AWXwHvuJKQiWGyTz1mgrJxAITPtErp23fpPljT/g1bcWNSn5EjCNPFzlzAviKCy0Hnvy9ULg5Sr
	6V1A2GzqunuBGIkBoJ3jqDlpco/c3OhOvetdPzjWch09nF3Mycy3uAzzVAcZsTN3CVycqXskk3J
	yMN0Oxrn47eZEmglwKq+RMJrAB/aq8tzNZaANHmJupPA1EP0IjgEZ7UebShIe+AtGXWabe+57jV
	6qbrrq521IZva6PmHouhWNx+sRv7EXwgKL8ckon1+9MrrGm7UFHwNpKk=
X-Received: by 2002:a05:6a21:a38b:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c3ad5ff387mr19882298637.9.1784637972639;
        Tue, 21 Jul 2026 05:46:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38b:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c3ad5ff387mr19882244637.9.1784637972135;
        Tue, 21 Jul 2026 05:46:12 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:11 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v6 0/7] media: qcom: camss: Add SM8750 support
Date: Tue, 21 Jul 2026 05:45:59 -0700
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1qX2oC/5WSzU7DMBCEX6XymUX+t5sT74E4OPGaWrRJGqdRq
 4p3Z9NQgQRV4WJpLc83a82cWcEhY2HV6swGnHLJXUuDfVixZhPaV4QcaWaSSyOEtBBihHLo+24
 YIXUDNGFXCnQtlJ13hoPhttERlY3eM6L0A6Z8vDg8v9C8yWXshtPFcBLz7d/ZkwAOVtuEKLF2k
 j91pTzuD2HbdLvdIx1stpjkFWu5EOqqXmiTJAYa7V299hhiuMFQXwzD/f3VFGFTY70VwZrGuht
 Y/YWl5e5jNWEF1jZpJZsUxQ2s+SfWEDaGRtkg1jyi/wX7voQ34P5ArRiXBFkdCsL8KI/VqsXjC
 BdTyoJ9r0y1mkPlTnA4ChKULKHfnCBZrXRtjYgqVJNQv4kURVZr2Ob2cITFgtZVQNdxLHkGei7
 4NVBBjUtO1/WClD+RcwskvIXQhj5s86fOKedk1BpTcqQz9OP3D9l56OkPAwAA
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: a3Fkx_QBCkOBLL-5hoL8wJd8etdEDp5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX4H+fcApZD8fc
 11oOI8WMyYms1o80I2WqV+qvMf3K+3jIHOir6xuO9bG8tXwso/w7OFyUOJ3yx7UUnOEvZKthDTi
 qukhMb6eOSAFB2QFVgPHC9hEzuqCSIIJ3rL74EIjU5c5mCwvBzjYFExnZQi35dDZokLwzsuETvl
 lFNCyxNqyMiZvyF5sM0EILUfN7sAiQ+04eHJSulgln3Mk7C4XTrgcWb5veH/Y+fMQ5oJgaEhPdm
 OqqtmZydBNRgzqorS3L9EtIxu7zxEDWw85H4wrqd1afA+2SV7MlvpqODAN2kb+M50QaYk23a+ex
 nFRFS1nA3encpGol7GHcIDZKZLaLuA83UdXIP+yOer7nH6JBh9CYtlOEc2SxLdx16bRmp6bhRnq
 zKoRAeML8uvx1MKwk7o1xX9gtc5jdjfpt2zJGAyFKZayqwzOwlosrOFuR0deU25ngflj0/iZXig
 dayCAeTieo/1JW2EbqA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f6a15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6w4XBuUmqBM_Xun5PScA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a3Fkx_QBCkOBLL-5hoL8wJd8etdEDp5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX3mwhlrMYxbs+
 JiTTItggveW6wI615hYyoFzilCsIY9JW4Rrz8tq5Gi+aoMqC1QKYkE0aO0MvUnwHHj/UMAmau5r
 CNAhuFYNugKQi60RGSLf0StaUUUnnv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org/
- https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/
- https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v6:
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY driver
  based on new split-csiphy arch, reusing the shared kaanapali resources.
- Add a dt-bindings patch describing the SM8750 CSI2 PHY with the
  "qcom,sm8750-csi2-phy", "qcom,kaanapali-csi2-phy" compatible
- Add TPG v2.3.0 support, reusing the Kaanapali TPG resources
- Link to v5: https://lore.kernel.org/r/20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com

Changes in v5:
- Add missing CSI2_RX_CFG0_PHY_SEL_BASE_IDX macro due to kaanapali
  series has merged it into gen4 driver
- Link to v4: https://lore.kernel.org/r/20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com

Changes in v4:
- Update dependency to kaanapali camss v14 and rebase to resolve conflict
- Link to v3: https://lore.kernel.org/r/20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com

Changes in v3:
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v2: https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com

Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove redundant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (7):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add SM8750 CSI2 PHY
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980
      media: qcom: camss: tpg: Add support for v2.3.0 TPG

 .../bindings/media/qcom,sm8750-camss.yaml          | 427 +++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |  10 +-
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 454 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 103 +++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1008 insertions(+), 10 deletions(-)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v13
prerequisite-patch-id: 2f70527d6a880f047a4858f75813420c81b4667a
prerequisite-patch-id: b797e1ad3e25f79b0bac8f885b2866206a6e0260
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v12
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 6fb94a3fa54b9810ff6603960770011db1f0b2d6
prerequisite-patch-id: e31f60c0c41e5b6baa464339263a33e5b2d69fac
prerequisite-patch-id: 83a3c9f2c2478a4a3a9441f58c58d04b04cec44d
prerequisite-change-id: 20260112-kaanapali-camss-73772d44eff7:v15
prerequisite-patch-id: 322972f71789ddcc32cae5e94d71bdac75b0d571
prerequisite-patch-id: 92fb4faf61647d08ec71d038c1dcdc92f72c5f0a
prerequisite-patch-id: bd1bcd82db3b28174e1598ae285430568cf94134
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: 1d8b84bb0f1f86699b1f7699f3125ef5e4e2eb22
prerequisite-patch-id: ec8bcc12a96780388b1633deab8a9816d8e02617
prerequisite-patch-id: d6a128a29162994f73c84e0935607c1a02d8e988
prerequisite-patch-id: b5740c83f750d116dfe565b8ab70542e27c09e52

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

