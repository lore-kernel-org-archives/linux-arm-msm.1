Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463521;
	b=xreNC2BYgyOB2JVXtmUssAEsYTqg+Il52S206cETIUVfF5l/1zAG2qZsNXCsxcCQrlCz
	 hIR0AJ4W+MfZbfTPn9zJH7dPxH0KQz1pLQlRMUm/4p8+nOCJpVLhPGG9JBvKzjO8Nfaqh
	 vXXX4UeIITkvXgpajdPoQ6Io6dkY/4hnx9zvWfXK9xPO/w/0caKK4yla+qHO3MRrC2HyZ
	 DEk9fytl8hYwtzUjsCnhvB4hjWxKZhprZNA0haRaJAYWPhUCmnl5pvEqb5QLKcllFfna2
	 ZnK3+FR8UT3uIFbEH+aywVswuNhPx/BQ4J0CzhQL4Bu+lVnL59GzmgNydjy+Jq1yhlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
	b=zi/73e6z8wggLER6E0ZYfyj9MbDkaiR8yR3LhK8h2kf0fi0NQZw231GhAyWfuUtiLgyp
	 ChF/XCiWetuL4bikfYtrMI21SSWuLY/FLa7iRH7lg3lK207SeBz5a2UHsrn2yjDn0os7R
	 PH64OHzRL6+9aHH711wOckGSaf54DYZ0pJ6NoiTIhRTzxFnDssskBfbDexk/rYQItOkR0
	 bE3GWMXzhIDhauKE1BNAwF3evxOEl4rou7EjQJQE53oChZJUI20Nd5qkvT4JxTcpncYlI
	 xepZ1Gi42SxOCXnd2YA5e2P5rSZFZPLbIFHIepasi8evDpGTHa+xBV3WNT8KBkvg9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E2vptEh/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2f4jtw8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DD606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3DD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E2vptEh/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2f4jtw8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlVY3730153
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=; b=E2vptEh/HQByNP4t
	7A+kHy4yItIf5B97NdyYtmKXd2NSkkLJnuhI/ksLoLX8wGBeROk53QZ5sKVpE/if
	pcdJa6Zj/7p7ITQBHkejZs1aJQt+IBC6UR3nYVtIczzDMU0sv/HuchF/Jl8ThPMo
	C1FDc/d/VPORUUHO5p7CO2y8XfRATeQWc5B7a+2AfQf2U26/Z/GExBegIHYcB02R
	oLhwWOkePWv5jjM/Wmyc+nmvbLVoJ2FnOCRUhQxN1eknDAsUZyB7PF61ELeG83C5
	um1dNJfuYUvyojlYzUEiK76c5RSy+DjffiY1SJhooOG5ALcuMcuu7CAFjnkV6rr3
	vVVkmA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd37mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:51:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4109711eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463519; x=1796068319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
        b=A2f4jtw8d8s2cajlFlOYffzDzjGvDSk5MaDvJWS6Zr1Mq+zCf40EvUy5Qhn7eDzs/I
         0VCXJ6exnQgFjiPvdMBkfEQiyRayc1FVpYe9bP4gfCRaxvBk4nG14qF0m3aFJT7nuslG
         0wlBQbavlJxUmpIB3b4d2b1W+e1IjxCawXAdu1Gz1N5+nCCcPHSatdSyCBVAhfyDd6SD
         7bwvwbkMaeSzekRwO9Nf3+j3QJ5/7KSBOf/RJNvcwEADf07zgRIpW4833kfcbA2XzUDA
         x2JISF5DBRYozS3ZXVPVB00XyWXlpVkJ/eoM2BalmY7HNZqqMRExpj+eU7wwfskyVruE
         C7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463519; x=1796068319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmQ30jQqMNwZmjGFkuYgtcg/0UXtSi/qTb52PKDkGdY=;
        b=ufI8uIRxl0hQBfifNMAlnLV8Yr8py49VStRKXTQ6UbNbSpxfvsojl3bWtx1pDlQDJ5
         Mh8qgFeNBR37jXPrep2+hvqVs30XztsedGvvvKWRASQ7Ab3REqAW0DmmTLqUVAUwtGoA
         A6jt6grqUsbPZemzdHb65qhxq/X559JF5HFfKuEFQbW1oorGYMkMwFfOPO5JdORASOd2
         waKO+Mx26ltzqgBAR2+4mY5lIgVJgj/1LU4IavpVAAPBO0eWTKXjQEphELvf1Sb4ubAl
         odllwHI5ckCOcqa8czoMgpUBa+nNS2h7b5lG+MFk34oLqLIGskjbVvMxMj4yNaCOMsMz
         dneg==
X-Forwarded-Encrypted: i=1; AL+hErG2PRTC+USVbPXtpDsa5By1CqAsjxbEI8zHa2uPNJLUZs/ipp9cspb9WS4YbhKNlMdCVo8ZVWntc83zmG/x@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+SI4tpOhGTtT26kcjQzzkyt7JRQ/nfEalc9qM8nE9LnGpDGs
	n653ilb/l2TBhsBrpLlHX82UtndFxa3nh80rsfbLfKLvMd7XmIkYxh6DfLMJodDPTRSxGhard2U
	lX5HECbzMi37eEBxP+G3QkjnKSqm3HPsj5j+Hgdq/n0eYD7RcGbhONRiYC7Kq3P0p5G0F
X-Gm-Gg: AZFdTZfB+pyha4I+Pe/jRUuNjuPaYJF7yjAi/iDTMw91/fcgMEao1WHN3PmNUk1UriR
	l9iNdEwsryI8+L8NUXLrphQyMPVlvUvZq0U30J2WgvK2R4eUdu5PzMGiSs/yBz4xjC8+wdUMTZ2
	NYwZ7PKcJFZsilXA8Zx3Su/kitK/kPUqsGVtWwisdSe/qjvwd38pcxEg70VXBWECFfCGYsCuiq7
	C9gCnVpxbmZAhUFvVCIjytYxN3xHw4TO0ewv9FsruAgre/NN5YA54EF0WjETokM9wOMZF9b1b6B
	ddsm1GCqOBy0THBG8WCajD9Kr+FvcY0usirJkz5iJWx0kIvhEVHjXZX6ISKZbKQN3tUNAgbIZ4y
	26IzIuN25ZzktI8Wl9gzl9Dhg58eytGhoLL6YL1koiyXqSLDhFgcZU9VvxnCSPKPZQxVHk3KhJA
	==
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr6588593eec.20.1795463519217;
        Mon, 23 Nov 2026 11:51:59 -0800 (PST)
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr6588558eec.20.1795463518660;
        Mon, 23 Nov 2026 11:51:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:33 +0530
Subject: [PATCH v3 02/10] dt-bindings: clock: qcom: Add PDM XO4 divider
 clock IDs
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-2-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 2Y8i2_3SawF8bS3HP51B451zcq1cPg4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX7hkX7R8fQIXH
 ERlRuSTLWeF2ozJY/UQhIhOemhB4f4uAHOwZZUZAmh3D4RceP+s54TiSmstuivD9r3VQsgaE57c
 EL0J9Hk6pK41hYpUge5JpkoJ1XqOCcWOlCPBqgENTDWWPGkinMiz1XZYYC9Bit6xLHofV6YfbPz
 NA6ImhI3WsiGhCC0JbNShGM2dauG8y3HHtpRrP3dpXBKGJAcaA/aWSNtd6KmaPltizxCmjAGxQu
 odAq4fNdBJhQJLzgWuuPw70V5XxUyT9gCWPhmhtjVRJYSAVurAlSeBfujvm+cXXf7EPDqFgBxIx
 YweSQUfVlcW9CQirBS3Bs5kVT202n1sD9IpQPm7ZP2b7RTnlBKxeTixbYREsaxZt1/i1GVr8dTy
 FIreMZc+PLbbYpeZw2oeFsDFW8be4X+uUrfI6zbSo73i3tgWofKRR4Cv9NP69X+gyQV589eg7VK
 XqNspJDtnaRQHVtMZtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4YMMDS14hu5S
 0yi8MITs/wfwBOltZYHVAKXM8DCmfiRxXFJEogJpnNV6kT1i/MAl+8Hv+uSuqhPYaZcd9I6MSC7
 4iKkz6cu4It1lCLSVBi4gsu5wHhKRAs=
X-Proofpoint-GUID: 2Y8i2_3SawF8bS3HP51B451zcq1cPg4-
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04995f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ogv3psnu3gARwhNlCuYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add clock IDs for the PDM XO4 divider sources on QCS615, QCS8300,
SA8775P, SC7280, SM8750, and Shikra. The corresponding GCC drivers use
these IDs to register the divider clocks.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc7280.h  | 1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h  | 2 ++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h | 1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h  | 1 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h  | 1 +
 6 files changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
index 3d5724b79bff18a858bdbb5c1654c5174e8cb23b..68dfd6616ce4b1c1e41f11603be639685301129f 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -192,6 +192,7 @@
 #define GCC_WPSS_RSCP_CLK				182
 #define GCC_EDP_CLKREF_EN				183
 #define GCC_SEC_CTRL_CLK_SRC				184
+#define GCC_PDM_XO4_DIV_CLK_SRC				185
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,qcs615-gcc.h b/include/dt-bindings/clock/qcom,qcs615-gcc.h
index 9704091636b87108a2a8c5ccc4a6b293829d8272..cddf21466a96a2990f1aaaf7c655fa6a4369ccbd 100644
--- a/include/dt-bindings/clock/qcom,qcs615-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs615-gcc.h
@@ -175,6 +175,8 @@
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			166
 
+#define GCC_PDM_XO4_DIV_CLK_SRC					167
+
 /* GCC Resets */
 #define GCC_EMAC_BCR                                            0
 #define GCC_QUSB2PHY_PRIM_BCR                                   1
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index 3c674c7baaba91815b13450e647b41053bd7330d..cee26f50092044f4a0b4cead6f669f0ccf7343c0 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -196,6 +196,7 @@
 #define GCC_TSCSS_CNTR_CLK_SRC					186
 #define GCC_TSCSS_ETU_CLK					187
 #define GCC_TSCSS_GLOBAL_CNTR_CLK				188
+#define GCC_PDM_XO4_DIV_CLK_SRC				189
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gcc.h b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
index 01f54234963d6a531926103f8658307d4e0662f2..e101c9b565d650495e63f5f97b3458375d0e85ec 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gcc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
@@ -257,6 +257,7 @@
 #define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK			246
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK			247
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK		248
+#define GCC_PDM_XO4_DIV_CLK_SRC				249
 
 /* GCC resets */
 #define GCC_CAMERA_BCR					0
diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..31d381ee5c2298127b060935de60a425a0572b67 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PDM_XO4_DIV_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,sm8750-gcc.h b/include/dt-bindings/clock/qcom,sm8750-gcc.h
index e234595d7f42d60291d60d7dcae6c6c8cb9b9925..cb2f40a704cf82d668577836b2a8d5756c1e7642 100644
--- a/include/dt-bindings/clock/qcom,sm8750-gcc.h
+++ b/include/dt-bindings/clock/qcom,sm8750-gcc.h
@@ -178,6 +178,7 @@
 #define GCC_VIDEO_AXI0_CLK					168
 #define GCC_VIDEO_AXI1_CLK					169
 #define GCC_VIDEO_XO_CLK					170
+#define GCC_PDM_XO4_DIV_CLK_SRC					171
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC						0

-- 
2.34.1

