Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953D47ACF8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027142; cv=none; b=fKm09kOOX0TW5IROdftTAHxx1zLDVsNrSNGJNl5ZOlRsOquJZD4B6OfBVhEK/7tbVBkJrfUHM2M5QdtVVzmdLpPG3WvzKMNe79Fh4FtvVG+Vbyd1q0gncDMI5LhtUXEpDJhk6T6Au+JWFcTaKyjZM4/uoKW3ODNDLiT3Yk5rBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027142; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ds8u0VZPrOYMRB72zzQEd65VeAVs7+Nstor5IGQzfen/F+g9pekDuRiNfF3kaRxzPi23Yd+f80gWq6pGwjowXCwuP6vFl5ODKdJyBp8fiEpNmkLIkRLiFy0Bh9iCbFBzNm05eCnMJBeOkxCrvPvOWOM+O2GXNhq3JTVC8goY51Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6ElbH6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+xog4vS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6ElbH6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+xog4vS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhfd1309003
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 14:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=d6ElbH6PPCz9QX/b
	BLbUMMJyIPdBUt6nC/OUVYRJu70FjQUJAa7LpLyG7zhEwsScwo1NGcXiHmzKgeSg
	DYU8w0xqtmCJIWKYgCXBfDx/xfUTJCdzL1u29j6IC+sObGK/yHh50oe8eSIAOlvk
	976M3BEoKD5MoE4SNLDq7BNxKXvDUfxcaK1YJAd6nzdZwvKiZFSXQ9vzebS9sYel
	KFkMqqoT9+O0OtQNIpNFVm1w692AacBXnc1bZO2Net0oojLqeyRhN74XIV1ZKHFG
	Axe12rUOHhUNYN1nxi/bgL7bUO6lLRce7AcRCt7F/rgvB/jLDwlU3Zyh+00QU14W
	HuUzJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729vee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 14:38:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso24832221cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 07:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027135; x=1786631935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=h+xog4vSrVOt3Yxt00u0EKfuI/Q3Ztb3+ziJxrXe9Hu9q2t2nYG/cljZOQc5/lgQ74
         VI+/h0ZgZA1/xYJaPud5Ft6KOJF9fM8hiTtOO+I+CbKcDCKayElv8i+Xr7X/5imOnuvF
         SRAnoEhOCoCswYe+j+AvKLTVe7mowwnZ1coar45dUTMHVJ+SEeYeTUJ9kPiKsX41/qB5
         wwOg5AeCFbckWaHd9L+Lyw0lGNNdByOnmJdCuLX17f9JKDmcQNKFxXXOzi7cbx/VQHAa
         ttNnvClMEX/vuZrei49VcaNrfzTGpOu1OQMTNhAhPdjuxGVXIXI2jpbVJ5mgIxHRQ9+t
         5DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027135; x=1786631935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=llkLluDZkmAN3dKx8kjewStgHATlcmN9tvGTfeRc2uiQJhaMIQ8PihVV6xuBW+qiSc
         r7xJeJzUmPvN0cXk+eeQJ2yxrPy//N8MsrQg1FGhE3+eOSn+8mOFT3wYfm12A5YkZEAb
         aE9PM3/k5G8lIPU98UeJ2nFOQb1Ga2pHYH336PdzBlP+kCXvRL0ghjYhOCBr53R9JHsd
         Zfvymnk/v+982SSTnVf4R3366MPhtGsui4HLsSN4UaRTzQLseDkD0AQWkPVn0GumWksr
         dNZK2BljZys/9/ZhHOIzUxBK07/FHA+XZnoWj1rTw3XnHRQqvlmFwSTBbQMk93Lo+C+g
         8YMA==
X-Forwarded-Encrypted: i=1; AHgh+Ros2g7mLpdxbeZ+mAhc+e0Fm/+0Kln4d7uENXazDyWnA7xug742mr54t7+m3ikisFRm7YeCZXuQOvd/VWrV@vger.kernel.org
X-Gm-Message-State: AOJu0YzlVDCIWyvaKJg9hywCiraBApvX7ZUSohlfBWW0LrUURhecYSDX
	KQ/O07eNH1v6xKZk1uWjDbnJadKlEFkCmx3xs5yF/6AZAb99gunLQcJCMhn4pWqMMaLTVjzrlwP
	bwf5Xl4BWQSqV5OTUTLU4mSN1vsSg71t9yFXAfeuYLw9u00aE1GBRJEtIJfD9aSP2U7N6
X-Gm-Gg: AR+sD11Ihxk7yat//gWiJi7KHkc4ApjJgYeUNie6zE33H7lLAzf4mE2NGwXRWalSYH2
	kTADHU/dar8BN4N5VnUrbsB5A3ds2X6UmnCGloDW+SZFo5VSjBLf61xbKTLTRKsOXMV/9SMj9JR
	/EHlFzjhj1YcATPFxq5skYS6dABKQ1CXNuHSgzKP5RgrmHz2P8zhcOzIFlCSLVX8UEYzQncXwvk
	6FvJtY3643FwwC+cQXjrlY+rZy5w7lwR72O9hfm1k60MeJY9LTTTomoRVHkABa1IhXZEfcOc7xD
	vk1UD5vfUjcth8QE9yODBobbVN2qwQjhh+pltPTuu9cdGP3gDsngbgcBTZbqQYUF/ViR3uLaO3n
	3LIsq+UAaYUJlievae5O/pJ4YzKPWpqA0wTdRmTwe75s3Qzwijn5qexx8l8Kp0cV0GgfG+wHQ9D
	95+Ylgvs+gGkFMvy7uNq0XIpGkMXIPgr5/mNgVi6/DdzoDH/dhAw==
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164305321cf.26.1786027134267;
        Thu, 06 Aug 2026 07:38:54 -0700 (PDT)
X-Received: by 2002:ac8:5cc3:0:b0:51c:1532:ae93 with SMTP id d75a77b69052e-52ce6146122mr164304391cf.26.1786027133693;
        Thu, 06 Aug 2026 07:38:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:36 +0200
Subject: [PATCH v10 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-3-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cRiZejYfFkz-8j_idmuBYX9vnfGHeKhR
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a749c7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX1YmgxHQ9sqvP
 JslDfzqt6jLUoG16tJsYd89/U8cFH/PWZRm5N5hC9Jqn2e0WHAUPaOFbias7iKFxDaTgAXLXmk8
 SmQyJPAAjvwETLbTqExl0R1J5O4/anYfvoYwsJZqzeqQfeBhj9DL/+PO/3p0pr+ix8IzA12stji
 2HiRCuJ/uD5Qw3HWUUTyUee8COdaixrsJe/PrJrfYnl4Kg7YAK3GAkRMAH+MGqc/iMbgqBmie8T
 yM1BrXcPe6X5pVG6s5FDqA+AuT3GnIjFzJSKKVEu+Nu/IamfSo+QW6DToAOwVHI6DD/rQ2YeLW5
 72QA47wodWZM9hBlqw5nTiLGIGF2RBphyW9NWi8E4AM6O5IqhJNQTPf8vTHvD29KLNGyCXBFsaj
 32dtagEPL9i8YiZZNBjNqZUO4br7dqohmw601+o2uG6EPV9/XdhDRMznb1B/Zns7aXbK5SsvaIH
 X0pnEbYp8k0u2guva+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX7w2iMvhoCk9I
 JulRQM1/Zqb0aks2qpr+K/WnFoHMIO0G6TBKXongr9BFDl4Oxjn5/mmCQGL6EIAiDZsjhLH7obi
 Q8myGhE5PjHyB+7WBbRZBG/P5TkJ8sM=
X-Proofpoint-GUID: cRiZejYfFkz-8j_idmuBYX9vnfGHeKhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

