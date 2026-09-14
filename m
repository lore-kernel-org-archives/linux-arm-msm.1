Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BA41A4FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378782; cv=none; b=MrMHQ6KYqhmUnO885YANSCbRBH6WnBJYMxTcOoVYhfbp6Kq/COidFRKkd8xXkzoVYOExlHz9PUf7bSvoO5NgUM+VO52SWY2rhvMKxaKT9UX5mYYpJLtneh/ILO0kmXaFwz6OAjOgeDMh2EqydXTL15KU0SLZonIyIiWfSdbEkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378782; c=relaxed/simple;
	bh=fjPHKJ99+6/YYqBG7WRX+vjmWbKlg+Pq7IG5ShfV2Mo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ObuM0Q6h8GjHEgWdjXG0120QtwQq2FGngQOQKiZhXHOrG5WJCe4pKqzeldCoFeimTFz+JKfeFmYK9+nbD700cmNkA7D8uK8/qQcr11FMvHdRfHG5aoC/UaPAxtFVI5RffmilUB07WDJMqp3BHLPzYVYaTpZFLuSqYUjtiTx2ylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMrTDdO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT8VVA6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMrTDdO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT8VVA6H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8L6tf404286
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9bQ4YU3lf2Q7aRmm0fsqRK
	c4V3MxEw0Tq9J1jmu9YoE=; b=jMrTDdO23rQOiTJgoZtDVUUPoN0p5YSN4Yn/Mk
	Fhmk5o8Y5nmusXfzvGG6kxzeirnrifpYMBQGCmSp//zeT+pm++wZ7/ShjqOyw4aS
	c06T1PElP+7B8d95J6YEqIncgtpquc6+ltno9sw26Vax9hVsIo/JZxdRr7eFFviX
	kDD8Maf0V5iGODHqDG6uWf1c1lyNxxQhqYQ0/ni/Q8RUy9Fxsprlm9noAkXXbCgO
	bLFXB5Ft1shLJoYhKNpEkqPwSMgmSt+cZZnoJBQTnPL/EnXpKL5YzflrKYn+LNcQ
	XY9yR+5j4fRdIJ8NKgFVJL0nX6xclAA/eprVTGIAvzrbGjdg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r8mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so2434773a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378778; x=1789983578; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=JT8VVA6HzL7+GaVb3Or1DFchIBn/61mQtxHhl0zZRchfORE4OPLfVZ4t0aXdwnaCdS
         0JZoQY5QwC1dIaNlokfteNeD2PflBqYgucH58u4Q0S40CMG+cHZP4xYtM4nv6usnWG57
         SXtjqQKqUo+T4O/HcISQQT8BtL0F5bSVAD8stGlkfz0tsFIBXzsnxZHueZF8UUmhJ8oX
         /f2wb/0PTTInVTC17jZCN9gD3NuROTxXB+Z5KSxXtaH3BLjD7rA2xtqldD5D5PgjUK9P
         vy2K53+TCVXD9X1VHkOVSCRljXRkoAC+2VEUDQjK1cagXehkLZnHfQ9aRxk9zC7eOt0S
         gUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378778; x=1789983578;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9bQ4YU3lf2Q7aRmm0fsqRKc4V3MxEw0Tq9J1jmu9YoE=;
        b=dM7EaDcM97YMziBRbmZNGefXoS2GUx61jffot7BAQhjeUZuwYOPjuBVUw1O0fP94KC
         WAPMSnek+2ccBo5vgEcqesnIEHdi4e8yh3hTIhint/9/s7ms+GEsDrJxcebsq04P3tom
         /D380OqFEUzpAXgr8jX8oLh0anfLIq0QLxI3+4nxzoeTQhd2qnfUBrZZzVNu8PZU5vWT
         SfbzNYj83ibVboE2aQgLojmAeWAXXnmQNdZni6BNIUmJgCyyJ2HXB/tih+86X3D0nz0p
         qtQBWF/WRIN/wKnTR00TDQIV1K1TcnogUolJ/I4kN9nOVETh2uaZwvFI6LxVlYt8Vlin
         +z8w==
X-Forwarded-Encrypted: i=1; AKwUvBwboFWyNzfzvLL5eUY/n8Fd/jdH2yzpYKZf2E9ke+/4dm0zyuHzu1+kVqJPc5fBd85KCHYVXkEojmBXSFhJ@vger.kernel.org
X-Gm-Message-State: AFuF++kbuojSemmW2ynb6el5M0DVnUP9E2ZuY+27V1jS9N5vQDJnNwwc
	PzgrBZLOFqjKPshtuKkwKIThSVHjVH8crusqBIlLHPBMUr+Kht06EkS59zWc5V2Tkzgrx0kvv5T
	KdX8Bl3Q+vxA6nORS4gsHJLvgkB6SPAgseo8RyPH0Ea/mErktCii8RsuWGVrO2XpAIOW7
X-Gm-Gg: AYBFou19Kab8Y2u5Smxk8JgGTweZoOCRKnRKQ750vnsd1iyO3ruTamf+nZKJyP0e15O
	/c4c5E7GPrgWN88opPGH07zFi4XVIVY48gNBPD4H7ULTMhDybsq3/+DSuzYSMwBFo/XV4PSKcjB
	ur2kp/FyOSQrkfqCXfQ6LQk2ThnGtLpeTSTZ9yhQhhbONBJxA3XqzV11nNnndw5uVJoxeV1dDDd
	wODCMFcWBSvU55JL19HJ++7M0wuU62XE6z7dBklZ5h8XedoxFXn/68ARTVudkabrTlUsaX24pcl
	IGz/BdyeZ0bHISPHH4sAJGEYiQKS224RXhtESskUAgdHCiDxv9Mv3EgIhl7FffwW+fJFhOOaJ/k
	L2rbfDwJuhiD/P2NUCbdJISFiODNOMBVCO/p/rX/fBJiGxI+pmjg2pfJG
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246077a91.16.1789378777502;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4246008a91.16.1789378777033;
        Mon, 14 Sep 2026 02:39:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:36 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH RFC v2 00/10] arm-mpam: Add basic device tree support for
 resctrl
Date: Mon, 14 Sep 2026 17:37:48 +0800
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHnAp2oC/32OzQ6CMBCEX4Xs2SUU/MOTiYkP4NVwKO0qVaC1W
 4jG8O5WvHuZZCaTb+YNTN4Qwy55g6fRsLF9NPkiAdXI/kpodPSQZ/k62xQCOyc79MQq+BZ1wHv
 vkAfnrA+oxEorVcilLLcQCc7TxTxn+hlOxwNUv5CH+kYqfLnfWmM4WP+aP4xiLs9zW/F/bhSYI
 cl1UW5qknpV7i1z+hhkq2zXpVGgmqbpAyjuxULkAAAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
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
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378757; l=6993;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=fjPHKJ99+6/YYqBG7WRX+vjmWbKlg+Pq7IG5ShfV2Mo=;
 b=G6cSHOVN1KD+oQ8XYfHE9H3vN6W1t5NoY5K3ygsYz9Rh+3PduIxJpk4b7CYxU+kwL1D3oeLDv
 qmtkvthUP9RDap+QGs+epUxoEAXOSYckHHT/KYIEx6f+txONDI8Y5jR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX/Qf58Mj38Kij
 14cZB0Kd3feqX5wo5M2pWu/Rv8bzCJHo9cyGHuLOrlKTsAeO0VeqqHFHQIQknyp1gv6yRq9apOZ
 unf98xGdAUyMPCb+FHyAOAC70TtP3MI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXxiFZstEV5pUs
 MKqb5nT5BnSM6YshctkG817aHpRwbKp7GmXXwp//UigySHsD5/g4HFqjKoXlyjTIsJRg7nXGyz3
 Mtxg/htz+ujOhiwDqPnEdf4I9GqhV5QYOxgtEW7kJ6CAwLeM7x2yoBdDd1J7BzJk37tJl/sVjlB
 as6lBvnGn8iA36xY67OluuwTN2fkqGeq+Z4ScW65h84bkO21UnPdWygrQlIVZzbQbb4xVqE+ohf
 V2tSmMlTxEd7+8PuD1kFZfwLooKKUcPibijJa6E3PttIE1GxhUpy524kfHugh7UKBqteFlWnGvB
 E/phc06dM7/lJMEPsWsRYZLjryh7ELk6VIXTdwd6ucSTtdcNjiPAujEK5wWnBFE+Ii1blfPZfeP
 GaL+a5msu4PQiU7fYPure3ZaXeiz++kf9DGnBHbR0SfyvGzLvgZ93zNqU0Zq+B3161akm7i2k5U
 in+CyCXzKfgz8Tle37A==
X-Proofpoint-GUID: SvK6dw_FAPn6ybB2-_E8grypNX0kyLFb
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7c0da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: SvK6dw_FAPn6ybB2-_E8grypNX0kyLFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

Notes for James, Shanker and Rob
--------------------------------
This series builds directly on your not-yet-upstream MPAM snapshot
patches from the mpam/snapshot+extras/v6.18-rc1 branch. The RFC (v1)
went only to linux-kernel and may have been missed; this v2 also goes to
linux-arm-kernel.

Please let us know if you are OK with us picking these up and extending
them (original authorship and Signed-off-by kept, changes annotated with
[Yin Li: ...]), or if you have your own plans to upstream MPAM DT
support, so we can avoid duplicating effort.

Add Arm MPAM resctrl basic device tree support.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- dt-bindings: schema and example fixes
- arm_mpam: fix foundling MSC creation
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

Note: the MPAM DRIVER entry in MAINTAINERS has no "L:" mailing list, so
get_maintainer.pl does not suggest linux-arm-kernel for these files.
This series is Cc'd to linux-arm-kernel explicitly; adding an "L:" entry
to MAINTAINERS may be worth considering.

DT affinity model
-----------------
An MSC's CPU affinity is derived from its parent device (cache or memory
node). When the parent is a generic container, a per-RIS fallback
resolves affinity from a 'cpus' or 'arm,mpam-device' phandle on each RIS
node.

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. It is
included as a reference for other platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes in v2:
- Fixes to the inherited patches are folded into their respective
  patches with [Yin Li: ...] annotations, as requested by Ben and Andre.
- Move the RIS index range-check and MSC MMIO window size fixes to the
  front as standalone fixes to existing code, with Fixes: tags.
- MSC MMIO window size: reworked as a genuine off-by-one fix using
  resource_size(); the ">" bounds checks include the access width and
  are kept as ">" rather than changed to ">=".
- ris_idx: validate the range right after of_property_read_reg() and
  keep u8 downstream, instead of widening the call chain to u64.
- cache-id sentinel: keep the ~0U notation (not U32_MAX) and leave
  cacheinfo.c unchanged; only replace unsigned long with u32.
- Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
  variables from unsigned long to u32.
- Fold the device_node refcount fix (of_node_get()), reviewed by Andre
  Przywara in v1, into the DT support and memory-controller MSC patches.
- Drop the "clear mask on error" patch: the caller ignores the affinity
  on error, so it was unnecessary.
- The foundling_msc fix and the binding schema/example fixes are kept
  separate for now, to be folded once reviewed.
- Link to v1: https://patch.msgid.link/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (6):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
      dt-bindings: arm: Fix MPAM MSC binding schema and examples
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 400 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   3 +
 6 files changed, 636 insertions(+), 38 deletions(-)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

