Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35513C0A0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152828; cv=none; b=ihiVVA6vUL0V5pXE9sYv2qqG+M4Kkzy+L0U57EiwIPMZiLnI+ilFtjA6oTfzRDn28Z1p2oHv/dnsdXPx0XbEXZ6r9mgl6y+GlLH6D2Nhz3zfbt+TbSMcrRhRZ1VDDfqEIL0rKTgYuqSHMEe8ch4w3AgTE9aEA9vU6GVWD7pWGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152828; c=relaxed/simple;
	bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODS/Dvydq2uaJiSMph01yjCwil0UG/dzH5GOIezaSIn3HxN6GNpKVWvn+hdk+3H32poEwqPT6WSFsGp5UfT3+ePdgndW8KXXJHsiexfzYNuG+++qoN/XFiCuj4fafBE8tvQ0dIppG3r3udSM/4NrchScdwB6oKXizULcRE8+9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtcMmpo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHbpJJES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtcMmpo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHbpJJES"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jvh32589892
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=; b=YtcMmpo60xktOfVa
	5mQhINctQVE8nlltFUfINfnW064drKr8RIoYmnWHU+gviCv0D4gRNJ5EtiC1wedq
	0lvEJqtQ1nRYS7ZVV4G/tlE9F2xZdVg77oVW9MPuNv2qimpfNdEtfoFMcdw0z9QQ
	c3V/2ZFqnEQZ7t4NFqVYRX15SObz4g8jyJmRw2Q92s87JqIkrRU1Kbc6Ru/OHe3j
	MBEtb1DiCOhQTMou/fNeZc13nMMN4B5Ne2w6sJvA0QLq/lZdysoHW5Fa0Kp43NaN
	In5WySVIwztYi4ewBdwJXlODVqUCRujVqk4jfghUKhHav06dyxXRHMYObNjmeu7m
	DX+uEA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319wfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:40:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so737039eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152813; x=1790757613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=JHbpJJES5bVaAAYumIl4asYBD9aROedx+lGf9qvtkmqPn0IA9Omv6ClwZbm3y73dhp
         EVV/uf29ljpL1RiMkNoolKhikUYuKe8M5WyiNx4LsRYJzEMOqCBRpuo8DVSX5JK0sjKz
         McLIpIK/Fz3gSpuGc/kcrH9wKshpnEiApu5HrhXcdgWHbgeJw0UeM7i7LT/p/Q9pjhYF
         2ZeWh7umPlGqB5IRPnfvXZj3ZKDH5961PX+5Ao70n5zLAgdh7+3FX0euIzbtJR7FFLDn
         DAwqWktsLmbLmDe8+QsQzLr0K11bTHoeF88BYty4rFNkMXgmxNVSqXiIj+ylxuPiNX7c
         gKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152813; x=1790757613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQXRpTTPtzwVRvlOFmFAjbS+ReLpP/eRuTZel+cLkNE=;
        b=SHaazmOmPUtGnxTLuzLkx814XYaCe1mVACTrqxso47GofkaCMdb1XU20bG/3hVJAXo
         PG+0vtmspd0D+5LnGs2WUtZ+193btk93AahReUQ1WdEGx+VIHYSFRDLJkD1qbEFk1AH4
         q+2GR8Ez9U4BL0MpO2f8SfL5OjVq4PbB0tnNIc09SJRuXe2REImm5k76j+bb6tcGtEX5
         2FinHSwF3wfuBJRIvtW50ePy50qDZaeUkoYPYcRo/lQKEmfWIdXRBoqB2AfW9/6eSrvX
         AIqAa6BbxfBWthYVw3Cmw37Qw8YPMnkxLGIeT5N2iwENe2oBX61gHiW2jIsdqF3FyX0e
         bj9Q==
X-Gm-Message-State: AFuF++kfBjng9LDsvkgS61Qg6T4AyFKmQ3VA9fntZDofbmjrlvt8/XJ4
	SRv9zEzVCASCu474Tq2c4/PU1zZO06gay3wME9KXG5bEZay8fhCHUHkHQZU4QNyHmG4eH7ru52p
	y5hVg4rTr/SDdR2RBt0ocCb5u2E5MuNYTtetKBEqmPl32SuoMaacJnnA26qJWV/7w2H08
X-Gm-Gg: AYBFou0jPUAJHCZPCBhGukuBpZom40aDvnuhdL1sekOGKx/KQzs9Yb/xGfW3a9tNghI
	4dWUDs1G/bHOyFExc35DiGjmXLt50o5wC5YOiynH3Cw/qSSfhDyb1SheQGR44PzM/n80mkS8vkD
	2CVxg00AB3vwz0qdbhpSaHWHqijgb79u8Rs6CleK9VCC8YzyqJKBhwNb9PA0O4F+8hRa018h1h0
	XNl4w294Qgyouhx9vfikWVqt7MuDYpAZAB4isxx1C4W5t6gfon+QDzKRE9IBM2ZIQz7MTedn4cv
	H79ggK1mU6kRkEKvT5jnzXeRQPs5ep2657Zl6Vc8QL6SpxhmaTVk789ibKAI9G/izGd8rwjYUIF
	Ov12NQLgYSqVGk0dYsH+BxrznbtFznHDx
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704614eec.27.1790152813236;
        Wed, 23 Sep 2026 01:40:13 -0700 (PDT)
X-Received: by 2002:a05:693c:87c3:20b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-33ea647e619mr1704574eec.27.1790152812628;
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:35 +0530
Subject: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=1160;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=4EJ+Dqj+1p2e3D/bJWAuULr9rdv/qA1bb0r2/Z+2fTQ=;
 b=e0MgaiZWsc2oUknzB47/o7/O9yahDPbB/eRXHGFyGweqtgG5dEQKiMCoL6vwICumPCsRUFTil
 krWQU6b6EpwBpTcLD+l0jsxvh2hMEnmvNvfNnKFQlbB1YCmBV1FNbCV
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: aS3h3b67vJBUFeVIbDf_bF2_loDgmbGQ
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab3906e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: aS3h3b67vJBUFeVIbDf_bF2_loDgmbGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX7gxUYoSZIJHW
 1IkS3QIi5FnPaMaBPRBRIy+ByXcWZF14xE6Vnmis8J9QYnfCKoNNPk13gJzo6HyA63NiMP4fcVj
 3Fl4AW5UcQma2eno71ibgNIM5bqCDqPt56lhCTP0Pi/pU0s2EAPmNQOnzSvJ18yHrgZvNtIXJBE
 C2d9+vYgxmQMaSYFws+btzlU11RRrBnl230e7vb/Njjsv+KPtuM5sojZT02ifjtu/RvJ/2Z7PcT
 rffBxLkRPDkKTwBHFsU8oCpDntALJCNFI/9XGc4w8UgINLSb8xXkLenJMpR7vqpdDfgwfrLPpPF
 XswNRlnNcyTOwbTUSEC2jGfbfvw3Y/S4bqsSJ645fHCMKf/fPWE6ovl0kCvacFwBSVPcPCTiIWl
 jKKOaFQMTghBAJ93AdMSOKRi4XZ7jM5KDqlqV1ZbWXq2YlJPB7We8k0J/U2566a3glS1sP4BTSF
 7UUPBw9eEySUS6lH6vQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX32tYkoWPuMMR
 E+ft3YSx0oZPtDLLyVn/2PShHlruf+oLe17vp/lkuDUTIvLjiZC8Cb7q1EIOP295xocYt7raqou
 fQQQBujOXv/Z4O+6szvdqpuk0+QJcyc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

