Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883303D9DB8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086325; cv=none; b=EBnR5awpOasXFIhLxPjtUuCINv//GtIKWEoz1Ac6wAnnCHTQfczWAQFSLzftDhTHSgiztkvtaOVOee0l31BOgv2Ac8+K1mcCm8QVAqiymB6l5fzvh65ZmaHnOGcVQZ5IqbEtxq59lS3iXGwpFbf3MOw9VVQjYMj/4nXTP8r7xfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086325; c=relaxed/simple;
	bh=g/kZEO26OX4smC+wgpc8bkbcZi84SL0SycYp6R1V6Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEKiJvgWq1KUGj8xvpDaJSs+17lzuVw5AFNsIpuRnvODmoU7q7PjuQ9q+6CqTts4i/bCfwrdCIruLgCWBxAS7GwWGlqPQ098M23aeY0uaOvWki25Wahq42j8nr6zeBhgFP0yFaH/x72KvmGtqX7UGuSvlwQv9XW4fFS1XhhNYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQrtxPOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOKtYeMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQrtxPOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOKtYeMr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663B0jcM2994864
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=; b=hQrtxPODMLsXzsMY
	Ky5XzFZLaa3/GdOLddqzgIsN/xncfImwxbfBYVyirfLaRanQ7XhsJPPXlbI+INlN
	tIDpj0PFEJTAwEnsgD8ry+vvE1MsWu/JQlvFKtOOFdjREWPhWKp6uc7ZrS9utKIS
	7fn7sgSTRM2nIzTbg7YN29v8K+NEHXAR5FoZL9HUF6CJeU09thBjQ0lONiFfmqJz
	blcbppHE9CUzXBTG9v9d/fCpNnbQIjj2NYW2W96h3qHVRRi9xqb2BixqfPpbHKy1
	SL4hS6mK1tnDjr6FwfQV1/cUBhOQScj8Ym1n8gI5fDPIbpCo4QQQCvpgIOZX3CTD
	3jcTJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n2mrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so60345585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086322; x=1783691122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=TOKtYeMr5Ig6yhlGAE8TelGEDNL/Q+zYAbzjVFVhO2h7zIiG81Wvkd5psLgjklAOKa
         yYA14KtUGQ9r36jFOfdlDulaMh472LHcfqzmyGfMox2KA2n/SLiRSerg4g9BiY5pyZ4g
         KdAHXJTeO7Zb5t0L8+rP7PbhYSysjLxcqvQJMENNi1dGyKdJRHxC5i3M20P9W1ywRcne
         qR/RF11HTRIynDKfUAgTcaqRPYUWacfzzSK/vYJI8VVW7em9GYjVkxfnQUiFNa5WZQAN
         53LhvZUm9okUpaGMukm3vBqylpNyfX3MT5/DuO9lxXVbVZFY8S0LV+jzzBbp/yUYX7p2
         beIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086322; x=1783691122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=LpTuyzo13vLoQfWcvG/xFa+bxwdkRxC/NEaDQa6C9p3/ZtfRISk91IJgEVMyViFBxh
         Phsd0sjsxKXuTAjRYmbqvABHYuzQ70xxmpVH6esbKg218Y//rtHfpNC3m098m0y+tUHa
         tfVm9jCaRZP0Z0p91kC+CZBUFcNtb4AD8j+5+/5yOYrAeCF/g0d0Hxf4CV4HTOuoxwdc
         IG1sddSMAmYHwSV77KgxBznKvsVxVf77auW8J9N6g61qGuL+vJqAZjywjdO1RTAh5Z/e
         jqDzNx8HGzqR1mlF+mF5zKoDTtv8rB27i4Gi6yDYfBL08B0wpSGXeL0CS0v/y4iFDga2
         zZPw==
X-Forwarded-Encrypted: i=1; AFNElJ/8LzRiY0Q0kzR2SZXni04pEtSX2IYfE8zqKpMwLzPqGddwIRyDPrCL7ybIwcUCq18C+H6iUyFP/DsjxzNw@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXhYUsokRruaD9eVrl2msACe1hhbPF7fHMP4xD+Pjkl0O6UCf
	AlRGT1r91kOblelihHiOMeR08osTbLbUdJS28AmU/odVDrRWr95X8x049nGdUw7NVi5ocmzfT9e
	wdPNK9Sbd+/07rH5OsumxkQOFLQ5d/91B9WDG5KHbJ9fNKJhzJkb6BqLpqP2+SiCTKfjT
X-Gm-Gg: AfdE7clnIpNxPtuPTT0aM/qdzhUzeqUJgBfWPVuz8gVwx00YIVWHtXIfheOfBm+W5v3
	y7NH68AmyvkFwjtPMeTTFbHKeWNhe/RF4LORR5iWVKDDF5Ch4wAoKxRuEmCD8YWioXVUSft+/Gd
	kB2wHeYmfgXssGN5S6E2g47qKZ7CIHJAoI/XstnhCQZksmQ3obXhI9Lg7QnH6UmZtysxWlHO+ty
	6p/e++LVcotzwyM+E74ECb2YAlvPogS4vrUuv8hv45L7BXbH/LSWOVOMqSe++QUg2VJOfurQdfh
	wXeFEO6l0m8dLWbs3A5Dnj7mwV8SAZsHSqNX48DWilCh+YiUiESUjscaKYIaX/q9nPMxzbvoUZP
	7efCDLYS+mMbWu2zugR/BK5podG6E0WwaX9ZgX++UUNsKdcjMmh4Ptevm2OSC/sRMhS7/6FgPLH
	O4nWSC6BkvrzJQwPiunRgOzT2EPqotjhdRbzxVLOxUvCeNeexOxZsNQodMTBWZIpk=
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr1486709885a.9.1783086321538;
        Fri, 03 Jul 2026 06:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr1486692485a.9.1783086320737;
        Fri, 03 Jul 2026 06:45:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:14 +0200
Subject: [PATCH v8 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX5ZEgxZNA82in
 HB0YForQ83TcwGMNRoA2B8c44ehK2SLBh0qShNqwj2CY4CXLqO2mX2169tMbM9bk3blg8cVndh6
 JtwAxSQm5mdoD3jz5Rl+Wst2IKU0FT4=
X-Proofpoint-ORIG-GUID: OUqTuruDlW7KAH3rO-nT2KTAQ-0nHLF8
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47bcf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OUqTuruDlW7KAH3rO-nT2KTAQ-0nHLF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX2V1E4Hruq9XK
 lJ8fiemPd0vB29VfgEPO0HYli9KfPTPRFfx/6JiVMnnJa7pOxOl9lhBgDQv4Y0QlUEVXv8OYP6n
 B2v00pCcsysmK9TWuvVdvIevsj4LMG5ZSFaXuxa/+07fHsNkYfyT+LWAqJztQ0G73sELjd4ine9
 Kn5r9g4jDuHiouF9WfLrWJbkqySILUwDyyZAu70CTmN6osSjzahcrFLaCsESk4y6AnIbec18Nre
 8fHH7skPa/p6BcKTu7Jl7Moh0MQoUa0vhAF7Z7BV5/JumAA0qE+kWjzll3CYmHJaVcoTkmgOuQ1
 oZthQxx2PGxHbYP+mUVK+FjkiSxHj4MVQvQbyNgcUPXETXq38+Km7m85zLg1kVXtjGeXDSdNXDK
 2HIVqF8Sw0i5yC3zuhiPVc3iuEW+P4AVSvahYgKMjBCpG2lTEpcYuzBPDT6EztAcVh3R6KDWXru
 dVyUHnGcLMHeBDWN84Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135

Allow an eMMC hardware partition node to describe an NVMEM layout so the
partition can be exposed as an NVMEM provider. This lets a partition
(e.g. an eMMC boot partition) store device-specific information such as a
WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
cells.

Accept "fixed-layout" as the partition node compatible, in addition to
"fixed-partitions", so the layout can be described directly on the
partition node.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b58a5fdbee218358 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -38,7 +38,9 @@ patternProperties:
     properties:
       compatible:
         contains:
-          const: fixed-partitions
+          enum:
+            - fixed-partitions
+            - fixed-layout
 
 required:
   - compatible
@@ -86,6 +88,25 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-layout";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-addr@4400 {
+                    compatible = "mac-base";
+                    reg = <0x4400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+
+                bd-addr@5400 {
+                    compatible = "mac-base";
+                    reg = <0x5400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+            };
         };
     };
 

-- 
2.34.1

