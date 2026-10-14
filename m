Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ABA4EBACB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021894; cv=none; b=D6m4x3K/o2HtP7zld8/aC3DlV1+vAmhCjbjnbgEjVBcQgxMM3cYYdYPOVm7TkBaEPN7upnJEuSKenGyY3drLl32IXTqbSeDnCuVp+T51qDjGwdFd+WmIig6pK9hsJWywZhoDPtuZIbD1rvRUtWU0/fkHIMcvTHYHgBdF0qfmbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021894; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAYb+OGgeNKUTwa0vFQY/nmdELkeffSXowE1X/F1qNZQruiO4odrlBVKHkJoriHHrKdSa1JxigpQnOX2+JzdM9YW37jHCKWaqB2j0x4dtf9a3OltfvQcFtqBhysz9L2N2WyOcJr5L70vkRJq57x8PqQOJaPaWQKWeW7o2o1T0dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw1VGvWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gz6s+56o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw1VGvWD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gz6s+56o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMIvaf301254
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=Nw1VGvWDcRuOvcdr
	EbE6sGvjtyEPI4XcPUD++TzvxNaj+u46lzdW7uttqFc7jNMUn+cDTdaP1Q1Zu8BV
	YTPgkLqmDuPUxKS7pU4CRunM7yorQmikpqj36mmVD+exlqfbvTcidmXTJZknxlHz
	4P2TBUDbdwHM+6uR1E/ifnsR5adue4UE4ohsAsjUTWx/BFBtG5C4IQ08w+N+c18d
	UN5EdxNUog61cdtmyFJqmUtuYF8E91/Lmga4VBSfTcQfwwK9Q7pFBeqAg56AhMoJ
	xgviQSzxvMdPufZCX8JJKl8EfzGZQT6KtXCaTlU6bRb/7HZcAQt7MT8/gjHqn9um
	03KaAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4623yfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:51:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so957794085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021890; x=1792626690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=gz6s+56ojRLM84w/YU+3IYraiQgIDPF9uc7ILdK5LXIAE2YZdxSSTX7d2/CFMHKwRW
         QkiYCSey3Lxi4OOdj2UR9/I/MBpEOrvXnYs1kBNiMZCOiGJBtP2Oi23cLpQb1L1ZeL3d
         0Ogg9slJmw/ha9xNMw4y2+TwwqulWydL+DOJiIxmircFdsASDtO1oHSTQ04HiUrWuUem
         p931y6IuzxJYes60BCHUUUuGN1YF/m+S+3koN41EcoioAlecv+0qZlFjZr3xhP+IfcwU
         i3YJ39sfnlJMNKlwu1W8UKB7ltX0JPokULMoZ4dSpkypdi5tVpMjRyLz1OocPdX4z+zu
         t1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021890; x=1792626690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=ULNG7uiRwqx/IZ/UZ2sRzDnjJOCB9UpJBrNlqGlafjmWhUSk+DfUn50anwxoBtPtkf
         6p4e5x3OoFGBqmFPsNsHLAcxHqMhwELBWiDLGJcpRdVQrQH/b4WbXkDVwObbm6S3s0c3
         ZEIWX2xNo3axRZZAU5CzPiqFjgWgdu233e5hCffyfDNB2bsc3qkYgaw0tzxpYNTLKkGE
         cuaQDTKrhMUpS/ek0DWluPNGpf3PlkuIniK7/myKSOBNz4FN8O5iRc6TsNQABEaBWdEr
         EprlM2z45m6s47F9oeXB2BIpD8WMSVqU6GnFpnb43G3LIavEJFLZZPgNuQ9uodzwN7d+
         IpLw==
X-Gm-Message-State: AFq9FYKebKVwTXwguuPwXuxMSAniA7GUl0zfSH0gDXqQAe8RKy0gciwS
	RSoNmjRC/QOyl1bTRCj3y3TjRFBs++Kj0PBJTicXMUViGpz2d/AcuQsZKcR+y2bZF7zGDuws/3P
	3BBu2i7ZgTL7iMJGM2EOhaDfjXxOSGGhBhEhaMq6I4aGoY268pNt9dp8nqlBE5TwC+b7f
X-Gm-Gg: AYBFou06XS24TVxBfo9YNO6AIroEKKEvqE/DWnvx81KyKmVW56U1yaMMBozrshDsnoT
	pm5WBIssg7f0QoNjBfSV0Te9hgCru3a++ZoWV1y0oYQiMAqkD2N0AkXn6bzjbpXrHPJaySIZbeL
	KyvZhCaI4YThD56zQVk9XvnEavCRhmVdLiLW5JdGVMChvkXi2nJgc1dhqN1Yqzs84H2EexmxABF
	AboBVj/Mz2qRP+fM6cc8H4s+mHOA+OoSM4h9AVQpNaHIYu5e2hizAzHftCZlD9oSqlZmZFNPlAV
	0NA0DHqyXAqmRhBFH/eng4SDJaJGWw/ydFBagmQpUIQruYhvCV5EI19ym8WPfbgxE+1A8a8J+Ya
	MhYrXadbGDwnZwOJDugK/jEZ0YOHuST6SZxnuG0dQ4w68gj5/f7YMqLQV2Bph6X4AObqOE2Ndnw
	1TY2xxYU6z35bB
X-Received: by 2002:a05:620a:1a0d:b0:93e:6394:5e37 with SMTP id af79cd13be357-93ebd1c4b2bmr2843096485a.14.1792021890375;
        Wed, 14 Oct 2026 16:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:93e:6394:5e37 with SMTP id af79cd13be357-93ebd1c4b2bmr2843090785a.14.1792021889684;
        Wed, 14 Oct 2026 16:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:13 +0300
Subject: [PATCH v3 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-1-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YF0Qqb0Jsn2AzfHSzmdbHfGJDrdky9Vj1BN3Yu4/ugn
 LV7Gg06GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRgsvsfwW05kcdnlhbvcLu
 f1Cl5RaVK9YnDovxsGUU1zxnNBEUZ7JzLHPPlirfdlxk2sWEH/7WTspHKwICAq54x9VNc5DLEGf
 v1Xizg+n3mexIjnuO7tvXn+jlVHF8uXCWS4hxzdbfC/anJ5oIXPsj9ldn8/RHP3mmac75Yjin8G
 bgE+FtJw3i2bluOwZ+cTfVvnw+2Prt/YnKGUx/shQvuEQeKFpqKHlpYewa7vjo7vsep4T/p3a82
 DnpjETSrb5KVluOL4zHYqIy7zV7OU+wOl6hPLO9SKLBp/5E3MQ+v6WCTntfuAQuejrxefKGCht2
 09VrKwofCGhE1QfvTrcrmneFK1CkVccjvPjKn11FM+oB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Qx5QgdNvrhcHyzO4FG5HQZmwF0bwRRni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX4VyqrAO89B1d
 +tNKTbBAHdoTZ1Q3wi5CC1iP6KD/V1IAwjLQcjwPYEToOBfUsyacI6AmOPLnNaBfgyMlxe223X5
 XxS8r1ZnBr4r6VJ+3lryE/3joHRsIqlbxrGo53/Cv5wppJozcX61P7YjfQy8iUla2jjKuty7ZJV
 NqvYTtXQj1OHn3sSiYLNYNcHaeOYjw7LKpMhzQtQhARWrBAWjt+iUWj9KUyQM4OEEqls1XFH67i
 cHXjjdLkXncPRZ4IFVQfIkc0DnxvVOZdmgszoPyJQp6Y6zA2UGp0pEZPpdVrwjdAqmArqJvPpbH
 EacTKVdbwIj217KUCYtd173FIPFG+rtQbmobP1pFXU0QK2WZlfe0JAy4q2GCXcDx2BXkzCMoh2k
 sV8JCtu0zjWQsv/8yLddmI/zh2OVAK/WvPee/Ec9X3KVwh7awwvDhY2arBSkPZdnM6EuGQiyr/Q
 hsj8GEdvbTDMQVMwLxA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6ad01583 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX31JM+2AAobze
 zDP4jKhOajG+jPYgQGHKkRTlhYBC/jIN4DHx+J9/JJKgFVpPTleiRAinWFQhxztI4Ef50cqOXCt
 DFDNchpClXO2cZr4DPnOFN5T9dJzu+c=
X-Proofpoint-GUID: Qx5QgdNvrhcHyzO4FG5HQZmwF0bwRRni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140095

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
new file mode 100644
index 000000000000..1cc63a6adc7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,wqhd60-nt36850.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly WQHD panel based on the Novatek NT36850
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Truly 5.7" 1440x2560 60 Hz LCD panel driven by the Novatek NT36850
+  controller. It is a command mode panel using two DSI links and it is found
+  on the display cards for Qualcomm hardware development kits.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: truly,wqhd60-nt36850
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  avdd-supply:
+    description: positive bias supply
+
+  avee-supply:
+    description: negative bias supply
+
+  ports:
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - avdd-supply
+  - avee-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "truly,wqhd60-nt36850";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l14a_1p8>;
+            avdd-supply = <&lcdb_ldo>;
+            avee-supply = <&lcdb_ncp>;
+
+            backlight = <&wled>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.47.3

