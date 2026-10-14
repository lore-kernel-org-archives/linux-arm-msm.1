Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB151588F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982989; cv=none; b=p8rw19/AuBLJcWpISVy9/ZuCzxrHe84gC7vIMiQPrAmit+CDjyDzi3pK/S9bl1E1juEM0vPjzHQSxB3zOxO+JX4mhv/xfJdjdV/1qLwmXRZpY87dQIBR8ILiXcvhisfTJq2EODqqQdBeSNDv/467Yn6D8IZd1pN7Xs0PchuTR34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982989; c=relaxed/simple;
	bh=ASWIqLah/uFWvhZywA6+lXlXr9BhgVdBiskjUcy96bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sF86NvIZHsQlFdrcV8OmuV6Gp8PCUqy0b1KCBT0Zwf6xO9z8e8X9MJp7q0GHhxoW90SL9wm78Hq2XMOIZJruIrxYnoif0JoMJayZ91DHavUTlIJQ5m5tsPELpXGESmI8hdDwzALSqq/fopn3fQgrIHJvsuwM3D33BQzuqRgE8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFx36s33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWP3o/cW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFx36s33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWP3o/cW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARTFm466878
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=; b=kFx36s338qO6e7pE
	GKWQhHpV1WwW2PUWaVNWiJaGszUnYv+PPw/btR4wbwwT27k69Kgwkdug5rAvNmmo
	3UOyrAzi3y6bKwBwhx9g5uFUAgCKrK/77od0sfSCfyCAtgUHWSxyC3F/8kLAZNfH
	LRoNdQdrHzV+dXEZ9LVdHT7U/lsJq0RFTLvEN6/Uv7uvwzj+IXMGTbGdZzmse36f
	LHWPNrL4VpShSh6KGv14ME5G78fcCOV6mMRBggg0PT++ZWjd1c/UP1A/Jdwl8ZUj
	E1hcEP/Wis/DybvzUYPq7SPauE6elkG3K2GGh+K06+ih9S962pD1mFufkkld6zyh
	pMoqhA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crjb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e96da6516bso250812e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982985; x=1792587785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=;
        b=NWP3o/cWmgvbNYcE60HvpzgTw/47YVg2RSBno9Q/mJ3ibrO0gp6NSzGk4XUWmYxcJK
         UJtEbZz5a98YyWOf39dJfdKN8h8TIFxxUznXkQvTJSf6XNHiANsiIfqk/3ynrCAroH3+
         K4k+fO8kuuwOW2b5Ij8MfcfDyrFJa3aXzcaHavPdbyBEZ3CpkyKBroHrBeqQi4WAkpi1
         QYNMt35Pk5rQ7EXrg43OqRBAfJ6keQUv/ucZLN/fseie4m8flLYwCCV7mEb7mNVPBoAH
         lytSqF5aqlAe8edoy6Y29IhY/Y2A1plGN5qPepynQucdkeaNepArHY3TkTLf8tPl4kqg
         RfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982985; x=1792587785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDwwf2nnDOaoIDpnBdokHTTm2gc9B8Cwgq888y5WJ0A=;
        b=CLXK9l9ysV6+P7XesTrSGDrTSZ7eGyH1VCeg+U5i6INBblaoX9Z4YgO9A/Si191ZC2
         MEtF92ZVQBRRO1C6QKhXDBLC8S+CXg3dnEI/FevfwZYQ8vIXcMBcHHAqGR8bRNCzuyII
         BcnHa7SDklO/ahqVpeSTU0qaNS8yvzLvXnVYUZkY82J/qaz80Q9+aTX235JKGttQs5pt
         SjpjoDPu8/+QxvnuxtPGSnKdpxNXmUxJcN4KHc+h9qlBxqgtyqbeTZ50iZzHWzLi3ZvU
         6b42y9rip4GXClkulXNgH7Fcv80DsjYwXwLlge1MGmIsKlGG/fZcuUc1SvjJtn1DOSwM
         M8mw==
X-Forwarded-Encrypted: i=1; AKwUvBzsN63+xPqdnLxlWRVfoBLMmug8rcci72D/qdh71NRafTN9Q1AJ/GvBeHnHGvAFFmvIfLaoD1qMPHlo8wM3@vger.kernel.org
X-Gm-Message-State: AFq9FYJRu8I90/wfBsD3dCwcju6tXLJdJb+WZHzEYSp8ItkocmMQTToT
	MDo2rXCqbjyQntwQD8AvT7ferM8Uc/lG2IO75mYf5QPKt99RrjCTvZUT5V0HaMWWLOqNDlARdFf
	N/raOlZ2A+HV46RwWQX/Vnd01BTXI35QtuVikRbcVByjAs8iMCnC+d62Rh4ZJju86LzZT
X-Gm-Gg: AYBFou2VF5wK0O5eApk5eLlFHzYmDakTebk8JrrFiculcOw6YSFRbETNMTTq90w2Abt
	XdlEpnpOyHf6pFWnLgKMXRx/HJWokSS0SzuLoVyG+wJo/z/moeMIWiR6Mw0YQ9fx2LymhAlbcPq
	rjNQgmt61tLnCn54MmmdbezfpPRoU3D0DhcyOb0SBYShFGIBbJftmPptnjwTdo2CkYFuwrvC2lm
	BKVbtYVnMX7Mw/JM9wembKfuyrpxDH3iPB0oflI17eeXr+9zfGchH9But6dAF0M8nbsnQ1Un+Kj
	EJNHSFeMzLBguhSczuBT4RJq60f9/01iibuMTdnSimw0xQSlTeswld86xtitHQD/j1KRRT9q2Ux
	HdZLjBoTq9w==
X-Received: by 2002:a05:6122:3c4e:b0:5d3:9fc0:7885 with SMTP id 71dfb90a1353d-5e91efb3a55mr5467831e0c.0.1791982983599;
        Wed, 14 Oct 2026 06:03:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4e:b0:5d3:9fc0:7885 with SMTP id 71dfb90a1353d-5e91efb3a55mr5467671e0c.0.1791982981490;
        Wed, 14 Oct 2026 06:03:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:39 +0300
Subject: [PATCH RFC 1/5] dt-bindings: nvmem: Add UEFI variable NVMEM
 provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-1-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ASWIqLah/uFWvhZywA6+lXlXr9BhgVdBiskjUcy96bM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz315K2FLP6WGMZnegKPCWuqzDd6D0ByEMRQej
 ElIqj4tpuGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99eQAKCRAbX0TJAJUV
 VnNREACdYf4Y+MuvkYiPeu9661Rm1nFDv4WC9VsnQ2JyiHsKSkNFgewOd29zaZAI+oGnufkrwux
 4q20TvzLeLe/3ozRF/ewkO1jTitV+irbQiLIWhFWxwgxr8N9w3aOgS6GGhTms/7K8HaILwEzDUH
 J51l2sflhfQN7E+Rr0ag/mkF1MH6j5TJ7vgT1lPQyiJr/p0xkKhVwdPA6bxituaJ3yvuIod4Sav
 oEhYmLeM1NoO9XyIqM52YqVC5BOhjphdMUnKrAcmdwEmG0eghPzp9DmlJ/wm+N/7lzmWxwABcYN
 Y1fGMYkMBh0ocx1JgAFsXwzxeThIyQWecP6O6tbuMQLx1LJOJDEjNT0OdmDMqWORWNbDzG/CW+8
 0/iKIXL/1+K95KzogmOLoZN4M70UC+IrceawLhmvBCPf6QMQRueJColiSzpwN3M+wPSkeIokodg
 5Um34B2se0rms/Zi+cqCHDyPX7c3wtXkgA1dl0DcKyR+M4J1pJAWYg2a0KlYXUaT5fsLR5DX2sT
 U1WSvL3ZUPGVL98WQWAIltw90CLW0nkJErc/4YWg9vwlOmo/nmgECdOjlcvVsNyw6PAL1wtr/9x
 8++nDWbqmg8oM7ymG/zp+Fbjgawn5hW7lHwor2LUfNf6N624O84hSOvFqgNkxaAly3BpgO6rmHw
 jv+lYCtivt/cgLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX7UQlNajbQGBn
 VLoZhlfxeO7InET5MFfStSjQ15zouYpUhci75ecppNNShF/OghyehU8Uy2Y37JuRg8nOocBfFFv
 ZasRjVxRSXQy64+pGifAtlc03CoWTeQ=
X-Proofpoint-GUID: 4-7asM6VTdJyn5yXbwU7J67wscQP2b7M
X-Proofpoint-ORIG-GUID: 4-7asM6VTdJyn5yXbwU7J67wscQP2b7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX8H56b46gtLgP
 oOg2h2gxDOPf4uyD93YNkTyJGznjDR9JhgPQqDon614b4ZF0BFXSnyw+fcXCI+MkEpQZSlVRo+i
 UM7+Aouu57EcxxBsmZsvDtgbzkZHTk2M5OXdsYnBJ2ble7UlJWAlkutG4ZxVSgoQqcQQcprqTrb
 09YBiUu65iIUMgYqWciW6K1R/tn7cXMp3xQVI2Qi9FhgUK2j+nNcWsGI0ZceUqxIogxrnwXHb+j
 lMKjLYGR/WQUL/cauIXuFUJ0AfOPxhGlGQByvWOsBTo3W4gBzYA2fYB8uTtdhTeMJbtOA5Er6dZ
 rfc93VbuQT2L+CkR+mh92I4IpmTJ43oZ0GxRBnjj0P04eAi6kmW7wcWxTkjuZ8IuL66ILJL3Le1
 Pnk7GctrW/K8YuxQKNTgffNrnV6Fz3nzcF4ByUUC0Uj85Tjh8cB/W7ieYGZ3gI7RprHEKrHliAF
 oxG/jNlQ6DR3/qUElAw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf7d8a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=t4Q5Td2Vxm9WVIIx0qwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

Describe a provider that exposes the contents of a UEFI variable as an
NVMEM device, so data provisioned in a UEFI variable can be consumed
through the standard nvmem-cells bindings. The vendor GUID is optional;
when omitted the variable is looked up by name across the whole variable
store. If the variable has not been provisioned, the cells read as
zeroes.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/nvmem/nvmem-efivar.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
new file mode 100644
index 000000000000..cdc10bee3c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-efivar.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nvmem-efivar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UEFI Variable Based nvmem Device
+
+maintainers:
+  - Abel Vesa <abel.vesa@oss.qualcomm.com>
+
+description: |
+  Exposes the contents of a UEFI variable as an NVMEM device, so that data
+  provisioned in a UEFI variable can be consumed through the standard
+  "nvmem-cells" / "nvmem-cell-names" bindings.
+
+  The variable is read via the EFI runtime GetVariable service, which keeps
+  working even on platforms where that service is emulated by firmware (for
+  example the Qualcomm uefisecapp backend) and where direct flash access is not
+  available to the non-secure world. If the variable has not been provisioned,
+  the cells read as zeroes.
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+
+properties:
+  compatible:
+    const: nvmem-efivar
+
+  efivar-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Name of the UEFI variable to read.
+
+  efivar-guid:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Vendor GUID of the UEFI variable, in the canonical
+      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" form. Optional; when omitted
+      the variable is looked up by name across the whole variable store.
+
+required:
+  - compatible
+  - efivar-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvmem-efivar {
+        compatible = "nvmem-efivar";
+        efivar-name = "ConfigData";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cell_a: cell@0 {
+            reg = <0x0 0x6>;
+        };
+
+        cell_b: cell@6 {
+            reg = <0x6 0x6>;
+        };
+    };
+
+    /* A consumer references a cell through the standard nvmem bindings:
+     *
+     * &some_device {
+     *     nvmem-cells = <&cell_a>;
+     *     nvmem-cell-names = "some-value";
+     * };
+     */
+...

-- 
2.54.0

