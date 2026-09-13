Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C437FF6D
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302832; cv=none; b=nsbVCytRCg79iaJWCNpASSTP3DDXrKUvuJHPG3+s2skN6oCn6q3SxF+X3mHYZWYzZ3TR9bKesiQdJ14L56RLkTTcgBWUhQvHTM/qENIfPhW/7abcDPzOnGuEV5laMTWYmXozTjQHz7tX1tKmO1ekoznRKS+MnYqa+2OaCEokiTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302832; c=relaxed/simple;
	bh=/BtZgDfys4CXTrsxFKjPXH5EalqVZkUvEMDQgav+eWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0mMsDcMuEywbSznEGOYbqbo71VMIEFZMfkgESXNARPHjTyxU5gH7pyyFKcgX/00nhyuJkFbaYJoOyeVZZJVrGIOGOMRE0vT6e5cWqPdoVrUmzeJW9Yn8BeAaqoz4DEUt7sPw8Xb6N7yIZKTGTTK63ObqR3J5CQw+/nmM39NluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vbtc5akr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkhjF7PO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vbtc5akr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkhjF7PO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATxZK1467994
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cyF7bDkehBP
	xmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=; b=Vbtc5akrWG0zesD6IH5CV8IsjEy
	SB1MMzY1X3ZE8yz6bmi3++eMe8tCD7cR0XdsSCyfls0kEKP2Ssd3Rl2AzOhBuvQb
	36B/y3jB2hnYRvS7Yj1wacJrBbSCrvPsWG7U7Dq/ErXNK87Z8p7cpb34SJ9S9C6I
	FthnBYyA9heWHk4q3vR65jAENHTK1jyghNKCHZvd4YUVaqXJotT9rUE9FhKqzCu5
	EackylVKLzM+Ns2J8hzPC5UQq7p3lTeMoIydJb4yMHhIkinFe8hQU1icZAScMXxa
	CKpXnJk75cT2NPWtBFvKa0ukD5+e/3VgWW9xFwW+eAMdOlC6RJ5bug+HRvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c377b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:33:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso256670685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302828; x=1789907628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=fkhjF7POzhZs2MWFscZi7LFxwaUfIiS/iCATkHlRgjgMTbyN0pMVz6hhXPIIjBYf68
         bh+B1BjnvMM5hCeee/LKkP7MNwE0s0P93r3OAZ5XYcCW8KJ4IrBJaAWAgHOiQx1c8h+W
         IuPPrv+DpxQKG+1S8Si5wVHKToZ7F12f2Yr3Bmz59FDpSwfptD/C/gjq7na/7z+JeiI2
         ZejlymJkiDfZlZO/EdHZCt0tKm8L3ntqkEKSfWrAaVjELd/CumIYDGCgOb1z8L2Huqq7
         MzVncWMQrhJ8x3cLyPPfDLt7kIgE57wNIFx1vi8R/MFbA4AGZmNkupMIUFvC9m13/8gg
         7+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302828; x=1789907628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=Z+tM5f7z8Apfaf+AeaslluCfvkRycOJqIdsH2UmSwPPSL41VCq0KAmCKduQk5xx2Fg
         M0uxVZ5+/LUREj4Bb5pKb4LXMONMxnULAscvxb+0hHgNCm9BKx8TWXCgC0E8zkCi45nr
         Il/4CEijbirtYOA0B9miSTIA4332/zqWvI1McVWqBgt07dxVYfy0NnCxCBtEvGn3xKv2
         sipgltGCJExU2wbUp13h3r+YrDmQw8p06v8TuRXsQ7jwkQBs7xTxJaMrQ39JxfCfmDuB
         UyPOdGf4ctOFwH4kG8Vg4WODpFRWlBD90i6Jd56kATtzw45ZSM9ndzjR20XaTDddTis0
         0oRA==
X-Forwarded-Encrypted: i=1; AKwUvBxumZL8uwh55IQ5hSdTDVE2ANIoImG6zGFqAwwFTLv8KcRbPq8zK5//PAouSDxi4Hvwmvbwh2gcpaJsp7xk@vger.kernel.org
X-Gm-Message-State: AFuF++msmrTL2nq+BNpzd3dDLs12v5YIaBSSZpi7pFiiU4Dfb4soZqYE
	91PXNGOGCtJBl/4KOnotcHtkxH1pB21XAvEK9J40DcQtdBVdN5/k+c+YQ5Hd1Xw2AJVNPUAHnZk
	9V/xCIq8UqPdsiuyqeA6zAi4YocjColpnhiMtADMoUHrQzEwm52qOWYeUkmKhfGWAHRuP
X-Gm-Gg: AYBFou3uIwky4FG5fNzlvTRWShlwtcgr6hg74eKZwhThcD/G3T328Sjy8gYhK61y97c
	7qHK2/mo2MW9OZlsGgj5YfDn5UFesmLOnZFGwfEhGH8wPAhGJexz+BnGX3g3gZV9AuC/HOozQsK
	ydRio6keZC8sEcu0TQtm5yqWoEgGdpAFp0SmUoYO45qHo7WtH9fmF35rpKz+Sh790t0t82Si7A3
	2YiRMcJEBa5qlb8KaEmBjAMQtBYb5JNFPQcbqA86VX4OwudwHut2Pr+YLaISzRuINwAitkFrvcG
	1O0ULZKg/HPDo2TKMxu85BIDFDZ0ajcM2lgUPDyJ2YrWaKNNpQPS4XF9ObN/oIsvChDH/ad7zAZ
	27oZMbxdY1HCBNBE=
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929973785a.22.1789302827575;
        Sun, 13 Sep 2026 05:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929947785a.22.1789302824548;
        Sun, 13 Sep 2026 05:33:44 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm131403175e9.2.2026.09.13.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:33 +0200
Message-ID: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7238; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/BtZgDfys4CXTrsxFKjPXH5EalqVZkUvEMDQgav+eWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgcDRWoexqVysJxJwz/JPJdHx9ku3F8DoK6B
 yuVBP6zpQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYHAAKCRDBN2bmhouD
 1y6aD/9f+MGyU72k6ORvj3aQN0S1PsG+bjGsEspokFkPaCBbS7zAdkPouE7QFYItzCwMvv/m0gK
 APZCXfYZlCP6eUi9UTspRlXiXU7NISQbua9ZXN+IXb2FDaWgd5zM3peWDhJhLu5bS2WcxQVr/8N
 I5RNPu5hf5M8d+T4dXFhU96eALQUqoa/wttTAc5WT54YQpIQ+aKgyXNOOD8mPvA4HF4htEU/7Ps
 Nrk6wjVJ/ANv+ndNEOC1D3doEBW/Jz0/FwUqWKF+TogLWFiOEcrhkzGknmjD7O2SL0OG1KlHh3g
 ex/1yYjQzZLn8NZ7xIUX6ylwGd7/+qlEapIsuyGpV1WX7WxoeW6VijBpZipCZZA7PYQ7O9s5Nla
 OmiDMjSxY6/bUkUFv46YkBBbuVJpUFrr5iDiKs6/eN1mgKcWf68ONIgxM8fm3GiilYyXAM1x3wU
 zkrhT2nOisbLArRqZBV/sSuUjwpaoFvg4xibMe6vw6Gbveh+2miJkAYP0bB54UjrJVW7Qdj8Y5j
 O93zxfjAFIAMdWW0pzpb0V6x5YsTtWwxKBZ+8MDixIqAiFQXp93HqTD868dPpffRwRiGPVipvNI
 E8lqXrt3TtAfO5Raa9OjgbQ1kaYXPxhIhpW76faosmFJa/588EqAE0KYH3pqqhgkCfBy0pvuGr/ 8Ur3MhMzzkfl7lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5gSVg14DhTPZvkyxZb9oDiincPyyTkDp
X-Proofpoint-GUID: 5gSVg14DhTPZvkyxZb9oDiincPyyTkDp
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa6982c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KDEBpenjW5rMv1hHu3kA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX1VmqhNGPZK6M
 O0IrUMfvWXO99XBmKJeQi0MbxLA3yK8zHZmr8uHAU0JUXzJZTg0G4+gWL8lF/LQK3F93/LoSCPg
 NvEfFnp+tvcMFEuru5iRbsoCl7Gj1Pcsx1jFCqajA87NXFnHiLpE3xZInOTIhXb5shd0yAmkt3I
 yEBfVpygPKcThfYZ/w71Q8DuwYPysvteeEmfpJV39EleMxE80M6ZX1bYsaHEJETiAbgt0Rmz6nS
 9P1eeNo6SI6/Xq4hVLklZsqXU2dK2rwt/KlE9dtJtEJfHmwdJkK4lmI0EQ+pcumZbnl2y2XLJdu
 ovFRSpJHrbuuLfwG+1vycKNalGy1VblsthsYK+lXSU+jAEzF2frePFyfeP/8dTaaPvCdPQ1thzI
 ijOpQ3a+IA/9C+4ltJYktoZP7FeTsenv3MRdiyK4qPWVqvk64AB4TfO+ZAX83c2qqhhE+0jhkN/
 Orw0riCDe3b+dTUf0lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX15FjfXRWeOEG
 8KllvbAAg1cw81CD3RpzVI6lxSeqZQxwuSENZqpaQqvgkENl/44Xo05h8O6mf9mtPEH66pK+deQ
 /Pz/XZuisaK2ik3GmU4ZU+VCLkvz6qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
 .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
 .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
 .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
 5 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index c41a86203e78..287cce4dbddc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -150,7 +150,7 @@ examples:
                     reg = <0>;
 
                     dpu_intf0_out: endpoint {
-                         remote-endpoint = <&mdss_dp0_in>;
+                        remote-endpoint = <&mdss_dp0_in>;
                     };
                 };
 
@@ -352,9 +352,9 @@ examples:
                 };
 
                 port@1 {
-                   reg = <1>;
+                    reg = <1>;
 
-                   mdss_dp_out: endpoint { };
+                    mdss_dp_out: endpoint { };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 44c1bb9e4109..fb3d24bbac7d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -248,9 +248,9 @@ examples:
                         remote-endpoint = <&usb_dp_qmpphy_dp_in>;
                     };
                 };
-        };
+            };
 
-        dp_opp_table: opp-table {
+            dp_opp_table: opp-table {
                 compatible = "operating-points-v2";
 
                 opp-162000000 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index b4f437172218..8cbf99f9fcba 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -81,7 +81,7 @@ examples:
             port@1 {
                 reg = <1>;
                 dpu_intf1_out: endpoint {
-                  remote-endpoint = <&mdss_dsi0_in>;
+                    remote-endpoint = <&mdss_dsi0_in>;
                 };
             };
         };
@@ -90,18 +90,18 @@ examples:
             compatible = "operating-points-v2";
 
             opp-19200000 {
-              opp-hz = /bits/ 64 <19200000>;
-              required-opps = <&rpmhpd_opp_low_svs>;
+                opp-hz = /bits/ 64 <19200000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
             };
 
             opp-25600000 {
-              opp-hz = /bits/ 64 <25600000>;
-              required-opps = <&rpmhpd_opp_svs>;
+                opp-hz = /bits/ 64 <25600000>;
+                required-opps = <&rpmhpd_opp_svs>;
             };
 
             opp-307200000 {
-              opp-hz = /bits/ 64 <307200000>;
-              required-opps = <&rpmhpd_opp_nom>;
+                opp-hz = /bits/ 64 <307200000>;
+                required-opps = <&rpmhpd_opp_nom>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 68176de854b3..f5acf528d0e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -223,7 +223,7 @@ examples:
             phys = <&mdss_dsi0_phy>;
 
             ports {
-             #address-cells = <1>;
+                #address-cells = <1>;
                 #size-cells = <0>;
 
                 port@0 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 8d698a2e055a..8c65a80b46e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -208,47 +208,47 @@ examples:
             #sound-dai-cells = <0>;
 
             ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-              port@0 {
-                  reg = <0>;
+                port@0 {
+                    reg = <0>;
 
-                  mdss_dp0_in: endpoint {
-                    remote-endpoint = <&mdss_intf0_out>;
-                  };
-              };
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&mdss_intf0_out>;
+                    };
+                };
 
-              port@1 {
-                  reg = <1>;
+                port@1 {
+                    reg = <1>;
 
-                  mdss_dp0_out: endpoint {
-                  };
-              };
+                    mdss_dp0_out: endpoint {
+                    };
+                };
             };
 
             mdss_dp0_opp_table: opp-table {
-              compatible = "operating-points-v2";
+                compatible = "operating-points-v2";
 
-              opp-160000000 {
-                 opp-hz = /bits/ 64 <160000000>;
-                 required-opps = <&rpmhpd_opp_low_svs>;
-              };
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
 
-              opp-270000000 {
-                 opp-hz = /bits/ 64 <270000000>;
-                 required-opps = <&rpmhpd_opp_svs>;
-              };
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
 
-              opp-540000000 {
-                 opp-hz = /bits/ 64 <540000000>;
-                 required-opps = <&rpmhpd_opp_svs_l1>;
-              };
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
 
-              opp-810000000 {
-                 opp-hz = /bits/ 64 <810000000>;
-                 required-opps = <&rpmhpd_opp_nom>;
-              };
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
             };
         };
     };
-- 
2.53.0

