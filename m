Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256D5328DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074384; cv=none; b=DA6JHf0TwOs/b3lVKt7yOchR4mSz1EUyOlhKNyGsKYHeWp+bS87xL8JV0T6nlbIRTlT/ZE6x0mpYkQaCYl3sJU50qrqqdJ86gIAuZkQW+u74gcL7gUgIkgDTk6UTSfe7YfepNc5+9N6jOMZ2SQlBVvlgOEDu8zIA2KdDfAdhVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074384; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNj3lIy4chSqF640ayhz2TlWqBRNBtl3kq5SOL3fuDbHyOfNmxXi9HzRYuqnN0ro0MpdATMAPr2U7TsbY5xEhTEhgBGqlPrK4HXoL3CsCWEWaumpgcC2prKCGosEzDmoEB2o2mzNR+e/PHAS/8iAT2pUnWcLqS7wSU5//Kfv8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOuhrj7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8BWdqYd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOuhrj7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8BWdqYd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jldf3510608
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=DOuhrj7tQmzO4se0
	B6M0VuzNCKu4xPUlNYRkUVEipt1H4GDlQTqSqasCCFEfdXEOCTAvOHwmeBt7xSny
	IBDXPVOSQAnY5mZtoH8GNx4LJ+MvpH36fTfhY58bWk6ac9WP5TIR5RxMjqWVAHJk
	/x1I3CCjKd/DuPET7nv8ZfOTOba1zWBrgYhPw6ISNbuYfUfk6EiNk593eU6l1WEQ
	8G3HM3tTmc86SOgFP9HJ+HRRcwL7vGgSTIxhFKae1Soxq4C606Xq62uTF+No20Oq
	Q09M/QTl6S0WxXyxRPjBn4KlDBvlHdfZPrZOC4r7S++kunKvuFyIV8mZiX8g+yeC
	5rDfNA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsafbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so528471241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074377; x=1792679177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=M8BWdqYdGnAH9S9NQkbKu3ciH8vBFTtO4N0mqEwNcwetBw5oPSSiQY/dhbdmLksM/e
         /XYtbzpu21Yk3c+IHP+hjUjq5w42I8qjyUFfrza3wezWqcN3hsbbbSVSE3Mos+azVkST
         8wwottc+jUT8m9P6DYAm6FwV3/uFHNr3JDRkXl+19tTQLnWsFrOSgwJQD7NRY8MOjOZ3
         5g3+UoqyNJ4gpvucOwxAvjUbaRx5Z6u+0AbmHkcV2+wxc+2PNIffuWv1vgx3C2mK30OD
         YR4b8CcOERa5dIw4bhEAxhFyvzoP0vszFFscpKbbgaPIbwQFXiciCHJllDbyC8xbBaW8
         0gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074377; x=1792679177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=DhccqQ2YaDrLqJ0Wxz3LN/hbnw+VRCEN3XJRkKoEsVzYLyewEjFwhEgOA1DZTfD5eN
         sunJK/3V3aBVMaKswghBoMEmcCVTeqkk8+faxloLfXrY1+ILyBiX2QutBtgX6mjgKZTJ
         KYa5MK0UCdOhBsxJF2BjtZ722OqEYKGOd18GS8IKsmN1dlNy5O2e8QrkUmdidmv48F+F
         kfML7M6+Ew5UIrCZDzTJbSRgx2eWeg1Dx0zqKuIHduIp3WoU21m34CctsNmz0eOCCM6B
         cG9PbVtyVNIeEoj6CevYZ8NF2WD3IthuPg/8nfvfPGEV4S80tcyQnWCgb8PaZh1fMt+9
         +K8Q==
X-Forwarded-Encrypted: i=1; AKwUvBySbngKBN+V+nAK7g+g0tA9MDWGKuWY0KRNRvHFThoFE+IMHJnKDLs/00lK4eF9kkQk773gF6TaYQELHbjt@vger.kernel.org
X-Gm-Message-State: AFq9FYK2EsvRgaUmV0xUQuKW7xa5UuNonK4cT5tA12WonrwFMmQa6Reg
	TqLNFs2uXoBogj5zOPDvLIw4ZYISZ5jmzfTa1FTA+RYgK63czwnPOco3INYKlCf7KlCp/YacckL
	tWjWOUC5yxU9EiV6CYUtJwFTE5GdRIClQ1a1kWsFjD6CnPj781oYAnUGf+s+ceK0kuPOV
X-Gm-Gg: AYBFou3YyGwwuGqFF0If4+BPBe93gXqpQ+h449x4eLiSyWre+8SVN7vX114ETdd8+e3
	Ocow12YiZZfZVxmc5zo0FNmxXVzHjrLLBXfYdxkjxaVAPjZcRuXcck6aujboNLMYWlFlHJfZnIB
	fUI8Yk0uCVC9LI4tXQMAsJbkPE5NXJGkjqyFfcw12HqF9f/YfYcU0pmwJIKc9Pqzlj8ixDO/sEL
	/J5bZaSwZxgYeRzVwy/9EHcCvohZqSQVYASikzpM6apk9CWRG3MIDtYj8YD48Zwq39IFHH//hTJ
	M/4D6YKatz+jhAlDsypAD5ZVphlB32TFxa8yY3E747HAINhOy9E+E1ej+6iUWCTdazT4iVG/RHe
	1y5Kb48hIYouAMiAqATq42nH2uTPCecXoEmMU3O8u4lXBLNE9BMVQegOBqxUNKTcbneO6ZTXrT6
	1x8aCxCOxN4DWsGGzvTQ9aYg0BEifOT9PfL6OGKEOnRe9bbp8H1iU=
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746933e0c.17.1792074376582;
        Thu, 15 Oct 2026 07:26:16 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5e91f4dcdc7mr6746873e0c.17.1792074375948;
        Thu, 15 Oct 2026 07:26:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:00 +0200
Subject: [PATCH v11 1/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-1-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
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
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: BeTKwnoSgAxo8tzdQvzAu4IDUBkLISss
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0e289 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXy9cMOPyzLaOY
 YsC2UyWAgm+wDRrnxhtPn2gZob78LVBewdKnPw3yxipjI/ypxPWRLTikv0lxouts2IJVkJ/ZRZ5
 UW/EtI060lhJ4F2jC/jsNtqkdxAEbeCuwYgV5cDOT1kqBP/4pVyEWSPt2/rIQ1FGbOH05H3t4+S
 BcT8U3w6G8/hWWdxcuM6RuzosIgQ+I0EMvY/GyzSa3cSV6jWBOfQrlEzRQT2ptY2GdlXdG2ZMjw
 QPqzEx1l6lfpTQedVDUSHGesVaVoO/ggOrS4gcWNonNcshxh1+352I6dXbtUEJbRCMuUrgr5xfu
 vPFHelxkpZDWLgQ9AQ1p/WrY/NKNyz/bOF8wvqG6XevJrILZLgkdvQoX3dOtu1kZ+VQMbShRrTF
 FA3/yi9qGSeMzeMVuR6L9LDGDVmRjUEKnx2cGyAcUJY5S8j4Ww0wG0wjPRiCXGl7a3MKnAzonhI
 knPdztA2tmyWGoKBd/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX58gRlEUWuH71
 K5KnQO4mm6C0R2+dRGBlK+7MvWjb68GTGqxdkqaOJwLSt9XgiRKC5kHoLcsNE/Ppov9hhWGqA2A
 Oxi8GKklgs1Oybzb1Ja/E6W1jpObFoQ=
X-Proofpoint-GUID: BeTKwnoSgAxo8tzdQvzAu4IDUBkLISss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

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

