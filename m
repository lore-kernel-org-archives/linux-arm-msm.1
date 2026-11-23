Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454069;
	b=INEM5MVcZA4nG6FZN4EEn4Hhs2adUqsrMY0yge8C3iRm4smfrvtELgp8TdyWE+8WGpcY
	 zCHcI3x4LXTpfivqXV7TcCFpqov9+q7IBHtlDhfhzq2qZW/u11ZJIeD+hMJ429FKAQM1Q
	 RUvsAZF7eEUynkhaowS8rlOF91U/rzHZz2mzT6CFuiLROKu0/b/9t1WSKX1mtygKoUFpp
	 Xh8KEd524vEx5CZVAg2t5iuM11FrRYcgWFf5JiRRGtrir60GWBZGK1foycyI42qb77NzZ
	 dz/MVYJD4czHld4DhjWq0BC68eV7rlQ9z4lzcr+8phXFKgqYC/Mysgh8MntEPiYN+RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
	b=E5HQQrS8fknd4q2KFdi61VDNqKtRpgfWIy9yvYji3v0hn9DXyHuVNZHx7S6WMRGm8Suh
	 F8Z7o4jLWyjm5VMkZPD1lvAFsWsXw5bc9cbVQ41txY7PYsVDCIJSE3e7KfOqvpYDNkFZ0
	 D0ANVpC6Lm1aPqvexvF1LvF5kLpJEsx3JNEv8qsj9k/FIXd71dFHAzfQ9oXQ5w12/WTQt
	 fZKVmwmh+/AswHRXyEnWv6KKg17CKOBW/AXrWc+HgmZCF59Jfh0vXHkNHhw/cVrD5/NpZ
	 oQzPXAmt3XzY5gQqom1jMelvb5mAWdsQmxIiJ24UfwUYdeBgbPDHjVGWGDY7gae0vKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD1606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FD1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpLR2768985
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2
	l/yhw260=; b=kNtD7xRKKfKPufQqHWGDlvpUdKfMbwYMs+CfxgvwQwrtsoN20jH
	YMniMJZlfbb2QXZ67Ulv7v11cOe/OB26lYk9meK78i08hqTC6ZDQZcejlAOMh8M7
	TWROgOrZmtEfUB7caaEgZ8ChtFRdtUTqiBjEhAMZmYQo/lzY4D8wUp0wRdgdkz7E
	xFg4hJjBTeXTi00A4AJtCpzF7uNyCVueIB76LQ5TLhyrlohpuhhghKifVap7Tkg0
	fxhVp8HWdBp302mvCxTf0CYJY9GSuqjcDavUMARGrBgBHaclFFGAyNo17CVguIn1
	2oe+hMPnz+J27ZlKi3/hYY+ddw43s/XB+9g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679f81d5d7bso6006749d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454067; x=1796058867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=RUmta1yWodRd96hJYYv2QoRLP5No4YuO3ZX+fX4ciNb8DKKQqWt+wal9AryXu0DfJR
         95A6Nr4QQod1cMERl5egpTI15YLGa0DiXrFPRJElZq9vqsqTwIFT4hk0E1oeztEzBDyf
         TY5BhoZYXsnz2vi/uzm8weJxyn/hA1G2+eedTqMI6b8u73kb9AcImFHlLvl0MR7qdjIk
         b0Ter+KwzQsVijx05+KzggJLpRgEJqk+6T6leF3A8dU6wzGZ1pVE+tqzPXgIgBlbRHqt
         8gVy804Mp0IGtILodT34PqfOUvWVPAdB0hEBZtP4E8uh9R1BPZoU2jnEUMI9M2AiS5Kk
         cjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454067; x=1796058867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=ivfYY3Ni4ersUm9eI/kHFOueNI84n8TtZDNsrPAUSBapwMIDFxctt2v+FGNyLubJpO
         GfePa6GYdFK9Zbak82ryxLh02jG39rlyPpbKxiZXKB3kL0ovcaGB04BV5nXWx5HkUFl6
         X0W1s5HFNXoZvRWHRPYXxdgY59GTnkxcguJ4vM4KrGpfvN+n7L5caIj+Ga69ETPDfUmJ
         Ez8lN4CB1aj6SgouXKdHvqwLbf5hMS1L7QUkpZLO57rfVLXWHDpAAcKSE9uMy1mwJdBI
         OwXD6y3SOCVcC3cBsSaPjjVdBk+wkl8nmBBZ6Y1LA0HJZWjMuZGnJmw8ozi9Kekxdhoq
         GpuQ==
X-Forwarded-Encrypted: i=1; AL+hErGZmrFQuSexqZz5T4LWsArUgQYMEFr8AeYuaWDtFVtHuSFrkSd1/k9vOQB5ZSafbvYEbPoHEhrjaZQBM/AU@vger.kernel.org
X-Gm-Message-State: APuU4Z/g5XHtHH+je0h95b1TmKHRv9O3CnZScK6RX2vVVcobpa0vFmXr
	BphO2XMuZadH5ETTBfSoxYJFRzgoSyfvLCuw8zIVsBIE8/WZAa6H7M35cnALoTncCxUGw+2xUvZ
	a9+PxNuHt2OCXb0B0QjAVFDMqSM4Z48sN7VGJWnal6MIjNyiiczMVviNTcqKTcIQl62q5Nf+SKW
	D3
X-Gm-Gg: AZFdTZc2ik4t401eP7sw+LKf5WzXaiikGCD62ayn+KTVveDtoFMkLhod9wbXd8Qc7ry
	dNKi6dSBudZo1aHf9SkX1DZVrMgULIAYnE9Tq5fJkGKanDy1aKeo3/FaPTsAI6MdV7roCQSgR6r
	MZd5Y6C4HLCcqeLoqIx3fsNpHdD2uYSCTIEGCxsR6+n9LhS2E5CIhC5CqAgnwmX3R5+oT+pMpBW
	qXYftJ25ZIvwr3Tlu8vX3NfPNvAv7lL/ivTkpP7NiN2vRJg5yFOdmC305Ac+2FuqiEH05npyR1K
	ui4krb0h8VLwPiVTBmru58fOefNz4AyG7WsFmCIwDhbLIVAqd+wBZuTj1D/cOoYnELZl9QibPnv
	gBn/SGjGAhWoTQxz5un0DXzEPg3/n/unYs/gWIE+UdiO9LJY2tXQvrCrhXBx8Aqfa
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150741d50.137.1795454067131;
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150728d50.137.1795454066646;
        Mon, 23 Nov 2026 09:14:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soundwire: qcom: add multi-master support
Date: Mon, 23 Nov 2026 17:14:08 +0000
Message-ID: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX5Gs0go2JM4L0
 q0MYZcnNCaCYMnDp2Ki+l/zIWbTYZItr/PAbkzcG7flu7SmIJMTjoR/lsX/88VsyoOpB7Fvh8PA
 6Q4gloczuxr1SIwt62mpmxh/vELutdBMwD1EJB07fbYrwv+/fLvthYz4f9rjmaOuPY6C4gM2y1g
 MFroN44g/K7sDbScI123zwi2ou95tSB9vK58mmGLTA2CB/fn1GyUS9/VCGHukLYgEGQ69gPnMf3
 7L2hVf6cxbZpd6biHVGExCMDJ3MIE71Xon5K5nYESucKdcsk85w6+cBAMkeHHNKwOeareUPACXJ
 HqGk9BA7XaUt7zY/qTC74i/W5USionhfUost2s5Ny6UgILBA9SPd3QU7msath55dLF7hYrk0T+C
 1/RkTS2SqzsQCY9hiylmzawAmwXq/BuaXwaBuVVB5Mm0eQQl0I8gO04HupswYM0UtlgOQE3PzEq
 awCpHw0jHLuSM406qEA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047474 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=owqDj3WxTxIMLBZ9Q5AA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: MzJ_i-f0pwwGq6TJJpejc7i3uvJ0p6jG
X-Proofpoint-ORIG-GUID: MzJ_i-f0pwwGq6TJJpejc7i3uvJ0p6jG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXyAflz4SnlEhP
 MWBfn1HRaBqljdPhlR1DMedgEG4AoJM04h60nni2uMghVA1sy3bRQ3e3S75wyc0RCPL9JHfAfzR
 fecuYSN8VuzVpXZm8f34ZSM7uOefyqs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now. The primary rejects a second claim
with -EBUSY if the dependent is already paired, so any future misconfig
is caught at probe time rather than silently cross-wiring.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Two further patches (broadcast fan-out and SSP-period programming) will
follow as a separate series once this core lands.

Changes since v2:
 - Collapse is_primary/is_dependent to enum qcom_swrm_mm_role
   {NONE, PRIMARY, DEPENDENT} [Pierre, Vinod]
 - Reject a second multi-master pairing at probe with -EBUSY
   (primary already paired or dependent already claimed) [Vinod]
 - Gate the dependent hclk through its own runtime PM and keep it
   active via DL_FLAG_RPM_ACTIVE on the device link; fixes the
   stranded-hclk leak and the double clk_disable on teardown
   [Sashiko]
 - Hold device_lock() across the peer drvdata read to close the
   UAF window against a concurrent sysfs unbind [Sashiko]
 - WARN_ON_ONCE() on peer_dpn_offset underflow in
   qcom_swrm_port_target() [Sashiko]
 - Commit log for 2/3 now explains the lane -> port mapping and
   how the dependent is driven via runtime PM [Pierre]
 - Rebased on next-20261120

v2: https://lore.kernel.org/all/20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 +++++-
 drivers/soundwire/qcom.c                      | 337 +++++++++++++++++-
 2 files changed, 418 insertions(+), 28 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

