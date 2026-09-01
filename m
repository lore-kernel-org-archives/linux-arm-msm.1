Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3208486BA9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283266; cv=none; b=ssoD89Q0sS0H4t5+nZq53Q64LR2geZFFCCNZWIeL3AqeMQjLhPvlLT/oZu64GS/iGdIf7GgI/S7PukT1MZVsAa+lUmAmsi269WhFMd7tYv0xM5MCqp6be6E9Dxh61yBepiESa4IJZq8BnUSsCt34mXKf9A12jkrlTii0gdWEFEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283266; c=relaxed/simple;
	bh=cT4BBpHAqxNuLzOsErL2ZK2QNlhFAr9KUmL6LjbhLBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8mNTxebgPJIdp0RMbR1x+PFCXfKwv+KtCjD4iv+6uApL4gReQMORbupAiItd62mFkigTmkJI05jP3w4MZP1sk++Sa/ErUd9bm6fbCaeMiy8jQjPr7XBJ4juwvElnUtvhUNPAm+I/pcmoW/eQcFRgVNQc780Q2lY5Cq/RDiepOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=L3O5bEdw; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="L3O5bEdw"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53016020b2fso462991cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283262; x=1788888062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=L3O5bEdwGH21Ke2FJ43ymyG3L2mxGq985ZxmFo0AorcOwf/tz2Fn0rHpDxiScstRWA
         M0mPU6xkUoxiRGct+2JDbA3/pDfn11VEG3QEw5ibirbMq4VAldBvRzP6oykuVedubmrs
         +z10Unb0jawsgYgP7GpTPRwWg+Yvbfllgj1yRHUXp/SmmHE1dnNUHte7fIyLV7GCiZds
         8Iif2kj/3dkWkInlyoLub4v03z0+7/4IeA6qWTQQe465x+3tFxZGidTmd9R5sbk2I+kZ
         aKPNdl3CT2DUUAzel5H/vvZYUysxdcuc/Y3nZFQoiNuZxCqVMR6BMTylpKbnD5yiSiGO
         3jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283262; x=1788888062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1Kd6YHXG0ln8QPZUcILiAmOUtQjXjJoInkmnIaSZS4=;
        b=mWjqdv96WdBftmh/5boKVJkFHeTYs8lwzfqupn0hwF5TVsryM3AFBxNtAq+8g32a5g
         GZBqABahvYkXBFB39BfqkXCYqsCZ+l7M14vSSdvGoPPLyrUbSIJ0QBHjty5U/yfxiqcz
         fSBgPqDPA4uR7kqaMamE683Zsbb9xwzb9jsNZDQ7ByGPM5kjLVNtpaZr/eJXV4VmZCfT
         kc8ytYPsOqurXQrMKUFUpRWVZS3EITSpAz0h4/lzhBhMb3dZoCoCQXTtZc4njcw+qd9w
         TldSBL4DdIp6+eRbJ9JdRejrx5bFWudHg7Ni0BB5513lSh5IZWSd7Xl/wBEOcZHjShoF
         PcUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7lbz229E6LjD3yIJ/TUUQ3Ecl+EGO8BEF7iitbvFEVnUdQhYp5vxidEe3OR6AzySgamu3Z512G270viyx@vger.kernel.org
X-Gm-Message-State: AFuF++kz+LZLLQhSOkBfvFQBZ9b9We8kKuzWifLxT2qHaI1hSaQkmqxz
	uf7RaXnGPCR+5lfH/Y+pashIehjrkG2j3bs+MpEt0EBUE8D4EQO5LTBHUmkcaG6m51s=
X-Gm-Gg: AR+sD11O3/6xa5Oe5VRtKI48fAtSxHPZSV8TCN4gqZ1ihywEnK2horOkjzz9i1tpBsr
	wIRBffMmo/HdhhPKipukF/UwNw9xSOx3NRRLbRkqgYTMy/GSM7gNczhNtPbqE0HjgDsTxbxnxRZ
	dZQSdWHYBZ1OwavGsMih1y8GkuRwAD1GBOXQK0R8/6/W8cu/Ba9onBLTY8Y38e34MyhbhE+8gsB
	3YCpxtFn8+Gn/ag89uUXrjKOWyqsUDYYPd4EMGmxNHJ1lk63KVbwC27dfDfLV2HKoVQ0VqcMjA2
	CIOTcK3jaAES/oijH7eXC9A3lf7+ocNtikjkirB8d8OVsXTFRS33v4FNUU6R/SQOzNIM2q1w8kh
	BomGGxumH1VS2H5FNt6kxIqTobZRqF7DITLp5tZM1JzKipQzOPEhU+fv4XbQt1xG4mSCaqOVexq
	mhxsdYVqABXS/d8KElkRHKT0C0yrG7/AttffAR9U5Jgzl0OfXNZVlAAKOp9YGwcmZO
X-Received: by 2002:ac8:7e82:0:b0:51b:60f1:689a with SMTP id d75a77b69052e-52fb938d2c6mr424963111cf.7.1788283262313;
        Tue, 01 Sep 2026 10:21:02 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:52 -0500
Message-ID: <20260901172058.1512508-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The TC9564 includes a PCIe switch with one upstream port and two
downstream (external) ports, plus a third downstream port.  The
third port has an embedded PCIe endpoint with two functions, each
providing access to a 10 Gbps capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

This unfortunately changed the way the devicetree code treats the
nodes, because of_bus_pci_match() considers any node named pcie@
that has no device_type property to be a PCI bus.

The previous name "pci" matched such nodes as "default-flags" bus type
(defined in the of_busses[] array).  This series restores the previous
behavior for these endpoint nodes.

					-Alex

Alex Elder (5):
  arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: use pci for
    device nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev for device nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device
    nodes

 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 4 ++--
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts              | 4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

