Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101809;
	b=awuuad7C99GL5ETVUzACDGLWSAEJTM9OO0MejTVEqYfQ0eEFInIhJLLnbTegpfpFSh3D
	 BtdmO6FP2DsxiKgx9k6u63OW2gVL4zAJ98Kz1cbiESwR1qE6qxU1UOhp+lj+iNc0mKW4X
	 qjnCFzi46GnzR3R6MRTPaYdt5+iDkc9QxTc5rp3YKIIRO5HbovX0tSAYWV3UOgtxV2nuq
	 l3S2YGmk9i3HImo+d8QrFLfbYRscaUCscyeGOAl/WyCUk/OUqk833bVuRl6LXvg3ByfVN
	 uUHM9qDWVJJauLKKF3zTv3IX4PMTx5pjsDMv/hjdWjwQq/qEB6CIqj4Q3BSy538iZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
	b=3cLIjd98AIUgKVe72nAbsb/9i3w+b1ewWJ75PY2zcIcw8tUTbJMoNjcJdIJIrDFdbZiQ
	 rMaftndbLxXA3QJ4wU4XsOrkihvIjGPIJQYmbqX+QmaWUgM40TESa/PDL5Snoxkf7rWds
	 8qYPr0tOh7+oCAIwwAcyXdrxUnrbzKPyy2KSWn4dblxpdzU+LBt/O9hnTFezbwtxF8ssx
	 nFG9y4ub4Nqo8JumheOewjFvXiC50TVeze9D2vKKaRUsdOYhUsYWaLuvYh/QUb9xK86Ld
	 JpU67l1Xnsv5sL7UmB6whISWhHYTSwRtGrQXV+jBX9LtLbzHPGHwfbfxHon/b2wwYVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3814A606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3814A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2nV1921937
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PkFYMQA9efe
	d66cH/akGO8FsOX46tW0maNvLeqNarWM=; b=mOn8RZOL2DSGU0iRzZHIFNYMhuT
	sxk6zhcQAMrx4SDF80xmvnG4SFPp/RB6e6L+kJWptP1YsxNvFsBMSc49pm4NFaym
	pM2HVMXcLD0psbT6ynTIybcqYWtkkS1sDcc5ixgflCbVnvCuMQjYX3PmqrepQSrG
	pSdsCKgB9PsfcIgoYsGnbLnfC8FYG6oqoSBNZDOQQcintMF6a1csSU0y3McYsoUp
	Mr03yCzOePoKodMabZoOqqHU/K0/mLf+bBr0bSf9rddHbi2vPILApd5i6FbxpLm2
	5WFW7U+rPP5kYmc1ogDGigG6ltPSB2p2THILlwXsd8+OLg7NZa2udBPuBog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68ps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:50:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7196770eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101807; x=1793706607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=FVTWW6HH+gXB0r5GLy0A2FbpkAXLlYPK/UlAAFO6T8wS23hiN4u+LQLbPV+3cots/k
         aNZJyhQuJyldgBodeKL3tjdM38x78JDBYfqI5G1FjMEsTxQoaX8WofG+SVA2cxK89uDz
         MIUmkGaL6xxbRxtWxNuYcnXFfNB+2sTlHBaMlSbU6wxdBychp5+C1ztbqrOTaXIcOwdH
         fQXqi5Tc5xT6aFbu4aZfNi0+bQRjGQ713zAHYFBZzdJfJqSJHoj/6I56Xqjrl+9UydRB
         laYQsZIEoMubqI5uR22e+SYKly4et9TYWHKDUOs5GmiFedxPj9E0OQRdTlMjMDFQGi61
         XE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101807; x=1793706607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=DPyiv3xHOefw/c5ozUs+jq+fiWeASHuST/MUNOBVGUMw945P/kAe9K7ptkp0uH+FR3
         bapnWtxyuzgogpWMhNdNJmJsnI9RSD6FEccFbt//Qq7bVj9kH+5A8sjHALuGLSPFiahy
         HyDttwvryMrWo7wgtMMf779o6vTe0jFD58PQHEKixVrZBVuv8WkbwmAuNTXEox10FJ8h
         jqd+WWEzVKoUDNwnmUi6W5HjmE0xPHiVmaGHsL3FWOS2LgsbEjXq/SbLPXMncMm8FOLm
         u9098Jt7cjLbzlCHDtrVhVPvmYnERhWMDXI1eGvxwCiGIcGMkRkMqjHBMV2r+ZOgfYdS
         b/mg==
X-Gm-Message-State: AFq9FYLF3aFVZM+aGPxeDS+N4VV1Iy7OxgOVfWfdils1ISfR/0UwW0ac
	opSjn5enkqY7NgzHcA+k9YdYU9+VJ2pyQ6HTKqHsB3pfVe9vGGg5XVqNiId6XighWASLI4h4FnZ
	AWqcXC7d+DjB3QEr2vcVl4xnNN3k6hOtFamIiSg2B6TN0bVQHpIYy+zL2yTPcmC65+mF2ZcjK6C
	b/
X-Gm-Gg: AYBFou1TkMHI2ZW9YUktH2ZmTcwI1iJFFg+Wnt8r44J1QgD8rNXwyYdFh+2nvS8aA4G
	pLwlSCXxMijdIL/E4VaNOYdpcy+W11vlU+nS75CRsbXyFtCb+VxdTAEgCo8GCM434ijRACu/zYI
	Hn7V/+YhTGL1HdI1CLIeL/eCqOv1jKyLenx/Jd0oUHnlR2eximtbdfRu4WSt0AyC2n24/oUXg1r
	8nW7BZ0SJpb4aJ8ZlfLxfzTvsr/K0vo3LELGHG+tjY7CcYoiOFXjiV50rNoO0oryGS6AT8qG0IW
	PQ7ofa/6DI9huvjeyybQx1xq79INLYIEt3qNHT2Bg8Ofloi8CELvppL7bqD6DhSJ9fDD6u0r1aM
	s+kk2blQNr0PAug/z7jRkziDbba5oA/uQ+TvKRo1M/2C0ZbqQBoaPDTdChA3/TlZKUkwgaRRsFc
	LJJ83yFh1i54IgB2YQ24PWxQ==
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193443eec.28.1793101807114;
        Tue, 27 Oct 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193410eec.28.1793101806511;
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Mahua QCB
Date: Tue, 27 Oct 2026 17:19:52 +0530
Message-ID: <20261027114955.1266499-2-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08ff0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WmEwIusUxj_G99g7Fb4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: m_ud347plyGt5Gvi_yX-Xiud3iNSMzHv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0AhPy1sC2EYL
 YYBcKorNqy8hGREXyYCosyGJeHYc6HmPofbiMQqMGetaTg/glWye0AAF1nvJl/mEYHmJKbPgZer
 HsmkoLcAlx/s5y4EUor3OXbO8uN2448=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+rJxzLoDKh5l
 Ij8lzI0NHsbt5GxjhH1Z9ateUN8pl12n2gY1eyxE0wMd4RDY5CPbq0Bx7MnjFVrfH7982vhKcHw
 3CHTW2iw8Fq64cg/89n5rkdIWdqs3rT6/HayIBDmY4df7OmevsYc/8OldDXchRCITPoxLt7mjlr
 1SgLbZ9CmLjk4wJs0L/5NvoZDkHLzto9SjecsrJG7tksC0Ii09lWAiG+143LIeBvTFZeLXEkKIu
 3QeTUWY+cae1UabNscMLm16aRIblFemsKK/Q1mL5YA31lUJkdjs8j3OjrCLU7v6JxxlcgGIRe/e
 /qb+z0AMR95HuPnamSc28jqbdxl08cE83dqYDT497aA+FBmOQ/lYx1fiWe9nPbqAyak63+z3WfG
 rurE4iP/mjb0zQiYTZPk0EXAndRAx8OtGNgq6Ak2dPvpF4zb4DzkN6KGM8e2WILSohWvBHGZn/x
 XpJCXC3GQO7jAVFgQtA==
X-Proofpoint-ORIG-GUID: m_ud347plyGt5Gvi_yX-Xiud3iNSMzHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Document the Mahua QCB (Qualcomm Compute Board) board id, an open
form-factor Mahua board intended for compute bring-up and power/signal
measurement.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..933a2361b5d7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -192,6 +192,7 @@ properties:
       - items:
           - enum:
               - qcom,mahua-crd
+              - qcom,mahua-qcb
           - const: qcom,mahua
 
       - items:
-- 
2.43.0

