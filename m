Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808C423E98
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378865; cv=none; b=fay9ZutweXbb8lVsvCBZIVnnN1HX30iaXq/RrBuZIWStGPJn0b7EsLwY5e151CdVzFabAqz71htw1d1HPtU3oSIK3Mu01HT2WD5P7rJLJUH9Lbm7UrZd6co20iG4PUVAfuIw1eU3KttBl3l3R0nVs2N5+yI9jMqpCkQ2p6XZr0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378865; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X78nCwae8+ZY1F4bAXV3tOwpD3Arx1WUODWqJ1uNU27Lw5VE2ykyMbq0rPG2G/4cp686ciuaXazAZbfV7tYI4RceycRPo5eZLSKjnzeamYc7mV9KIuHAjtZ8ayFIlvXcjW7DutxJXH6+N0D9EztCCIW5SoT9MCrAcaxqfey3Bi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+b2/amV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvbRebzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+b2/amV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvbRebzM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwYS3739615
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=m+b2/amVz9FkEIbJ
	/ULA+M9LSdAis/Bav/3U+xzPZX90vK7+E0zGrfazoAclybv76wHGyJHTnYolQdrQ
	v6fnvNmI498SjqvLj5pzVUNXfCwGj4Eo9CSvXecXjQB+9XNSLdkysi9Qi5tHVsgs
	NPGJnNYfWUheSW6/de5jZbSHN5XT5RNU6ehp7/Agx/zkOARLINGQVisWTdo+3yD+
	ApAqxKdJhcMV/YIDKB4YvuOFEw1F8YUM9VxPNGUyJXrqb2z35fXp/yvZhQOn+VEK
	eDWvDy0+6OGyxnWuS7aBe5HwzD0oGUM7IEbgz1MCqbGa/YFNUfEwpg7byThpp/Ra
	OwdQ8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddyya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:40:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so3468774a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378858; x=1789983658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=CvbRebzMnyGF8diM5My6fV1MzzTje2og6YI96sr0WXJKd0v55FrgWDcV0WvfD39NYh
         o1CweJ4zLPZSSBnh/A6qinM0taCKgf5DpwA5h/v1nN45+t+x2FeftU5V1JtIeOy8/iC0
         /UMLRmfGjK0JJT3fM6vNktrSRjG2yzPZLFBdrWzkGr6FlqXAfvfQvHfVZiWybh7QsPGz
         1DWYrgsCH6lmiE/ZGDoMSNL/U1AQv3aFZyTmQYltyJueeHVZSH/wVLB9cK82e1aw90bP
         SiTPfFU5q9u/QK+q+HFVuXoBDECnJT3yABjOEjPWbZmP5Q9rqRRkWaldwvunhLR3Rb7X
         SMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378858; x=1789983658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=lX/B30gCy3vw1sgY35/ftbFOxNb1FZmjP2nimadOFwN8Z3GG4oDhIOVZldHj3EoxuO
         dUk/b7m0vCqSxvZEaSwqUem7KwqMgt8d7bUMc2c5NdMndPZMSBfbTa8b9/hf6C23TYGw
         eZKleAFJkIaM/G1n89PtPG1YLJ77hke6jxiEwBTyIrFA1sUAAnYNxMkVqv1NmJg/rUU0
         uiu/vTnC5t0fT/XwhlVOy618XHn4DvFKicTh9HsVp59hkR9/YOLydTXiUx4csbVTVijT
         oF91rEQUCRVcZZ902tiwgSBDeTl4AcQIy5fkR+LPgxCbtkOCEZu2Xf+Hoez0AlBLD4pp
         ZevA==
X-Forwarded-Encrypted: i=1; AKwUvBxchDEiO3bcYrZyOPxL2x5/z5e7y0DLTdLnHVbu8yoJ3dRvT2Uz788OSzSXVRcORV1uE60xQDdAp8QaOZO/@vger.kernel.org
X-Gm-Message-State: AFuF++mIGfQDmv4oW8nxJsuvS3Xjsh9Pa5iQ+yKLYMK1tZsanaHfsUBN
	5ua+1v7ZbexwfbsSn+8ni5pLlcd7RDp4vYpCsbh02loEXkuw9KzcCR+6CvFmh1+3tiJTppHlLpy
	VHU3NiCVbn3bQP85FtFRIDcacj9EYfdN7kRkvYQfrNy/YOv+8xPCE9UtZibJ4zTNSHMy2
X-Gm-Gg: AYBFou2Kc3t1GUbh8KeiETl7Jbu/E4bEiSlwKc8PNY4hijNxiu8tscbgM8b8wqFQcAv
	8ZXcK6UxIZOm1S5hB2HWDNc+LvRDx7sa3vYupKwJLXGRviG6THsSCfGUO604Uar57OCWiNo2V1M
	7SZAAjxSIe5T4AVeT/oquh1NLpEaX6MeGZWghFkexKmdsvrk8aNdmPNYOsCbD5AKZjco1bFb0nQ
	wN1jrqgdF/rH1Gyef9NyrKp2jtybE8Eg63rdg+nNyxDD6mxGZcjShLvw5GMDz5TvYiSCsJWc9dw
	xzkug3ZiWp/JnpqeGQzEhhx4e0e0vaoVGFgUBWuP1YK+rT2AM5IKQ4PT50w/cJIoaXQ01DR8m4+
	s3sVYesiGIxYl80TFwPZFig0J2tJt6Vp0hdyWYg01EGn/geAio48s798t
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001296a91.3.1789378858444;
        Mon, 14 Sep 2026 02:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001238a91.3.1789378857857;
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:58 +0800
Subject: [PATCH DNM RFC v2 10/10] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-10-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378768; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=iu7wOe3pfXWPmLd9My3slCaONNEzZNUVdCafaRu9tdHeskrAI1rGcPR5+/FkZ3oE4TQJB8zrM
 osqqskJa3ouAOWjaxKCGP0Lu65YlrgiKPPiqMAugS7iGHYIymBIDBV4
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX0l/TqOo7Ehuk
 JAud1gUIc9k4U324kTx5tKD/79J4NyQ22ZLjNiugNpJpDc2XLyddpw8kzdviSkLYK2oKy+lTrkE
 ytzRyUBH5Zhm9T2Zgbt69ZFN5fLxJbIrm1ltCz2BwFjUWfMRoyfV0WY5jkOCOBFIUOi0LXvsuzf
 8Q0e5EYVQGVs1yRUXvYollPVhQqcOOWpbOCll7rChdBeIXkBRy2R3YrYa93UhjYJOq36jDsdMOM
 GXrpjEaeotcvhC85zJtDBdq/YYVANubqgESn0ih2LwuF0J+lr+DQtRF3HT8wNouE1nnCXcR/nyI
 fUNavOt3sU7ouxKuqlll8+M7JYBqHUKU/bWuIIugHXoFh3KzrZZWXPBsuHT5968exkK/+3XsmsJ
 2NcBp9OLesLhfZeTdGItyo9FPU67ZSqOSi7T0VoY59STJdNfcwqdLeE1PYiS51YAzNUTMV2H3UY
 cdmM6JBAeC99gKkyzrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXz16ZTVhSJRWO
 5exxjRaK5TePZKy8yQJIVFX255zsAzwu5VVo1lUEq8AIMNywA3TN1otiK/AhpiV4c16yYO8GQ21
 WP33uVwrumyZGp2Ef4wFfZnDESRSfEg=
X-Proofpoint-GUID: iHCI97UJ03Lw0r5jwdv94TVOQ7p0fhjK
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c12b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: iHCI97UJ03Lw0r5jwdv94TVOQ7p0fhjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

