Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743220;
	b=B259LSSv/6S9Ou1HUPtzFXpvmHuGp0IZ46G8Lj4fy/qUJGJsUYdSBmgVtwgcSK/sTrYO
	 jloKpshjyyAQ+wF6r/EfWREa0xyAjJ4gMtN9J9bXhIfswTXjUN3bReSdwM21k14qxIIZw
	 uf1JfgeiM/LGo04+xt8r6wMPAxHC7UGhrJgAIMd4EDelLW0/dy0CefcQKXLPQDk8CEBmW
	 CEJcs3af5ufBIVjU12OlA9pqy9Ak693qZaDpdT8AL3rJISe9Pv8DI+loAGO1OLhE9HLTc
	 N3mpPruV3Wk9aSKy3Z6T32Gfq8Hr1ENA4V2O0CVkshMIxzlGiQuQVdOqoH/2HeMgqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yT6jPp8HY5vKvIY0G2r/UqKlv2QeCR0DI5RlNnDypO8=;
	b=xGbOyxkIt1UorHg8Lra++jazgxL3NOywUYot2bDdwtcJNlmK+RwO2fiCA9Q5rMEEUzYp
	 sCD07mKH15hEvCCBjxjV9PVTQ+WfRPDeUcqE0HBIasehLgxXwC0oh6aqfC5MmyFUeP0qm
	 3KqScgbLc3qQs6cOA6DKWLWOjnCuQDJacKo3+Q76VuTPmnC2WTTZ6566J93Fa/wtAnHkX
	 mAtxtxw1chQPGiO4ngpEc9nEAQVMme+7apiqZMDVbHAYNftfm1/AJPnBJQKFwKNcsnloR
	 IsCPcgnPML1gFCULaGiFyiDK5i56NmxTboqMDE3td5hW0WU1+S5mlqbfA+Wm6ioUAag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsToAD7F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyJ0GS8s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168F606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D168F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsToAD7F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyJ0GS8s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FCcX2112270
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yT6jPp8HY5vKvIY0G2r/UqKlv2QeCR0DI5RlNnDypO8=; b=BsToAD7F4z6PT6ao
	Dbx6eAkp4dN+Uc09wNhoOpzDiJGaBcnQC79Fo1vA1+99onhGuNbP+145nIUsu5XP
	OribmwcCr5O4eG/uXwtBmuAOMnNprqyK6LYe1jALe2jE1KHaDDYpCEVnzseIqjcq
	hPL3JvIXLeE3cSQDjMrrVLOZbE/VXuwkTuWuHX+tOFyF/jqKzu0rxCcWUm3gs90+
	gytP95IctXyM9rGiw8r0QAjZBMbusbqI0X4fsBemAMPqKcd0StpKITNT6O87gzLW
	L08WW4LkTdS20l/AGAoyRvgNhAd3CuvX87QzY3mEbbSnlXXnW0XQI0eYOEroOa1J
	N2d9dg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyka3w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b994cb09fso14125856d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743218; x=1793348018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yT6jPp8HY5vKvIY0G2r/UqKlv2QeCR0DI5RlNnDypO8=;
        b=JyJ0GS8s2sXLgsCIIwQdSFZbbybXOeLxd+Mc8802dXhQ/A7z+1KZ90mAPaEMPTb+oR
         yN0GJBDNxEXYfmPr+ipdyi+aymPD6HE4D9Qw/sHu8f6rI7nWwrnXfZ27hHaF1eXqZ2NC
         tdtm8AubU/6R82tLte39O5m7saVqzR4tViVCHTWq5tqI0zejhGTjXNkqD+PXWGsbfs2A
         6VZnq/76ahwL5UmkSlDQcvrp4i3w/6WS6kYDvUIrzT5+J4FJgnqdXlS/AmQ384LrXWhJ
         3D0IRX6YcqwflKDRUCir0Y9sTO4fLZZS80Jr57JAJQE7p8ILT/JW7f8XdckUX4s4gVAs
         177g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743218; x=1793348018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yT6jPp8HY5vKvIY0G2r/UqKlv2QeCR0DI5RlNnDypO8=;
        b=QR6J1tuZ94aRq+fYa/i9vz9/5qbV1oANPh0SCJmoDu4NZd9AV79CCHZNVYKAQWv+5n
         0nBSEo3tsI+UFa85byFBla9rdYNkJU0qk/sxN53oQuO8BScb3PMaCjUkidTUc2Klt4Mv
         6FG0jnrSGM1xZpHUbE6Lii70OwtVHb8mCD1qR+iFQQyuUMO988wnk81+6h1rGt/BRAEE
         fNAkr3PLmG/jVdxUt7yZ8RFe+1lINWqlxWj0oy7HoBZRL8EalWJPPxdjKqmuh6HDzEi5
         Ygu+DeV7UyAwswYeX1zEWl9oR99v2h25xSfEo4z2JwP8srqg0DntS5aYKHu+EZENYjAW
         OmKA==
X-Gm-Message-State: AFq9FYJIg/+Tqzhte6EoyO84a6grOJNcTq9OGuLvRCZKFhAax2EUFDxi
	NNOXbqPErT4uBhYbaIk7qylsBOw6D/uzm7F40F/R0jzCTUs1TnpImjJo6+jxfiZTLw2Zcu9V2g2
	apFF4TJBrXfnzUHyYBl+F4hLxJbNRawrlOs2WZcxFyvZP+LI6SKmYkTTW0ggGwrtVp2TX
X-Gm-Gg: AYBFou2Ukkd6Nv3ATHeOBLMDZefBY5J+D2VLTQbx6XNw7ZRl92+k6ingb38q3Wfse9E
	QYWhbmE6oeJqOHlGcBntAuo5w2dJ2LWwThvtxUqxUaVrf6l5cZboeUaMm0OvDPkLG7o70QzxF18
	OoHOTxzEOg3Nm0Hsh7d26vJMUZsWc0KeE5AaNLpuJsq6ATARwE4P+ssVo/k7L5+MNl/yZtsOvMW
	oGjsj569clO49n4yobnAGbv7Zc2qAUAMe0UF8AfOanVNCTp6qMsVmNIXj1wucAjxdZOBRoaNQ5x
	KTGnu7xYLOU+IX7ntgnEh1W1gxQ+EPfpFsSvXy5V1TcCRValSgoGCrMAJ3zmC9V3ftGSdPwfhJx
	dyT9GhxXnnYUt5luqpl831F7OlpvDK+9aUEG/h4mtTG7fOimKz6RBwluCpY7+AA==
X-Received: by 2002:a05:6214:20a2:b0:91b:7601:342b with SMTP id 6a1803df08f44-91c3ab0bd0emr18512286d6.49.1792743217888;
        Fri, 23 Oct 2026 01:13:37 -0700 (PDT)
X-Received: by 2002:a05:6214:20a2:b0:91b:7601:342b with SMTP id 6a1803df08f44-91c3ab0bd0emr18512016d6.49.1792743217328;
        Fri, 23 Oct 2026 01:13:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:36 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:11 +0800
Subject: [PATCH v4 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
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
Message-Id: <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=9471;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=SyvO6c5OqZG1y5uyyTt/nacH1a0GGIXJnhjYmRYH77E=;
 b=2PDRPPGqQSheevFKzeSb+UFybjKNC1ZZC9UQkbAwkrEuU/MSUnsim2k59q/UHD+PD8WwLJb5i
 A3maWpNotevCJYdQUR/FBOISA+dcXa1WsZfrlTIpmH04l8YmlIURVPW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX9yhbFcQqXy+X
 8TT4sOXfbnk/3Y+HjeOVZiW7eZWTqZSVc/wJYkOjkrS8JDmYKVuOSF1JYLKC+i4sGDa998Evikv
 PouobnAVKZQ68BDaWcx01HJ5jE7plC2iyoMGHceae0xfsix5j/+NaEZW5GPNM92NtJcEulWBg1T
 8FPEG3sZ3OmjYHFkdOrp7DKA6BIY4HiIovrGiPMjjohONvcgZShVwDDSKJXwKnTR9JQ/icbfvKu
 1WJkfAaR5mbAwrRPCj2wMX7ZPGJPGv8KrWL/yIldabnMQfJL92RnXTQ5/HzSTq5h/RQBVUZQSbC
 NpmtVdYE5YA2ob/JwAxNz5PazUWcqQL/OiZuzCer1kMJBdQ/dMl+0W+HOvPnpPP+qUEeXbRy5/I
 bo6GvOp70T+YYJdOLVX3HqR0UNjs2ltlL/de0lszfhtUJ6WETJS3yot6qCRGApziVi7vhKMZ9f8
 5+IDt/YBtbPHb3sQ4GQ==
X-Proofpoint-ORIG-GUID: P4VDWN1WPXVII4mx9LM1UFQFoDxsSGs9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXz/SGxvzaC8JC
 W5M8oAn5m5v16KtOfdgqwkXPGTzmzTXQ7ydxzeDHNu1p+cxkLveWqlEYkH3jGFuwz8GnPsFc1zl
 pNze+FLy3nTamgdU6MZGmQBxjLtKvlw=
X-Proofpoint-GUID: P4VDWN1WPXVII4mx9LM1UFQFoDxsSGs9
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb1733 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3e6MG95HUu93SJj1PsAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
MDSS hardware and most of the DPU, while INT2 GDSC supplies the
VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
remain inaccessible.

Describe CORE and INT2 as power domains of the DPU device, matching
the hardware partitioning. INT2 only supplies DPU-local source pipes,
while CORE also remains attached to the parent MDSS device because it
supplies shared MDSS hardware. DPU performance-state votes on CORE are
propagated through the genpd hierarchy to its parent MMCX domain.

Keep the widest valid power-domain constraint in dpu-common.yaml and
narrow it in each platform-specific binding. Require two domains and
their names for Kaanapali, while retaining the existing single-domain
constraint for all other DPU platforms.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dpu-common.yaml           |  3 ++-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 +++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 26 ++++++++++++++++++++++
 13 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e694..c67199011f26 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   operating-points-v2: true
   opp-table:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..6d6391970d6b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -125,7 +125,9 @@ examples:
 
             operating-points-v2 = <&mdp_opp_table>;
 
-            power-domains = <&rpmhpd RPMHPD_MMCX>;
+            power-domains = <&mdss_gdsc>,
+                            <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             ports {
                 #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index d5a64c8a921f..bded43a34b87 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,msm8998-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index 034d3df8d247..6c1476a0faaf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -19,6 +19,9 @@ properties:
           - const: qcom,shikra-dpu
           - const: qcom,qcm2290-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 8137618237ce..3fa0f02f4489 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sm6350-dpu
       - qcom,sm6375-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index df9ec15ad6c3..7703d9b017cf 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -24,6 +24,9 @@ properties:
       - qcom,sm8450-dpu
       - qcom,sm8550-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
index a411126708b8..8e10f9e0d176 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sc8180x-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index dc11fd421a27..9dafe1d827e1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sdm670-dpu
       - qcom,sdm845-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
index 510eb6c19364..173c2f034241 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm6115-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: MDP register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index 8cbf99f9fcba..b8344ff8895a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -16,6 +16,9 @@ properties:
   compatible:
     const: qcom,sm6150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
index c79b2d442800..8e50942f3e1f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm7150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
index a88d22f30a60..b407bc399462 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sm8150-dpu
       - qcom,sm8250-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93..7f8e52d52078 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -61,6 +61,32 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,kaanapali-dpu
+      required:
+        - compatible
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+
+        power-domain-names:
+          items:
+            - const: core
+            - const: int2
+
+      required:
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
+        power-domain-names: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

