Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A442D765
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212018; cv=none; b=HsmRb+AhAVolbg78NCjz43L5FAQgrc52FYlbpX1hSXxgTnxik5VUxw7Pgf1OddLqMOSzDxRR6lymR16sdU1Uk/Dgh6H2pV/EI+YEcmGEJPRPlYK2QyoDMp5ouyu4VRwvunbADdsLv9ZQpG8rHqUe0d2TanVk/yk1wZiKTt8qA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212018; c=relaxed/simple;
	bh=A7xM0UYhtZ+MdG4R2/Am8DKIWjuOd2vSU4OOMghrr9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLxaa51cFp5a6R5ALuzu2YxWwjTTD3RwmhKouBt3qJw6MMjLifNxJd9G1+2QTzph/gI378AUapKexAOsdgggNF3+aE51a0rUHcswfE8CP1pH+bm/sYs9SWp+FNjOtUTxxZ1OdTMcVkycHYI7WCscBMFywQ1NQNC/99mm0bIK9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OD3fyZs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh23+/5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OD3fyZs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh23+/5X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJoU62734544
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xeMVRi9VMKz
	qYFaALL8EB3/fVi9uvBRvVhZaG4bfmXI=; b=OD3fyZs1s2Atm0AkxKVhWS5Vmwe
	B7L2kVww41PFeU2RJkYX3D+m7cad9HUC2HgOanxvGBZSw4dt+jbUJS9LdXhXVlZS
	g7wA3WfmtSJdnlHDxRuUJzy5jxMy56WB2KWnGL1dlCUYf9cM++B5QOeZIotPVoP4
	utpQXF8Uhqx53zbB/7Li+Qiawm++ECKHBAQ8VfWrnedkPUr11wRIiyft4+rr0kQ3
	FMEaaNRGGJSJoC6KhuSintW/AXvUxQ3c5RItddyYiDpSytqZPXq4hY8DGBxnsLtI
	mkBOAXstyUuv9OXSKvFRFb9pAItY9ddJjQ3VcCRBXiMNFC9FVFC9ue+X+nw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1bc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:26:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1ada6c43so102057141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212015; x=1784816815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xeMVRi9VMKzqYFaALL8EB3/fVi9uvBRvVhZaG4bfmXI=;
        b=Lh23+/5X3dz65fUXbmu5sgtmrD64qGtzuMksFOVHi6iMCmhQXzMY0as0asuMbB+sth
         FkHbHOmDCXCggp+OviF4L2Hq1fi3POf5WOAuqigq8DvLvgRR4tglwEFSyKoXIeMAtQr4
         g0CrGmCtAigChFmlhb/eFUgd9ELfUS0jNWmlzaB2HxQOmusQE1DmES4pM1cW9uS7CViQ
         YUxent8hBGOGONo89V84YKNYQ3zDXqY14PPdTh9yz0aL10035BUp24St1RRIWXtbhtH+
         zUohnSH5ZCO0BzBXoSQ68LrzqSFcgx0DfkMeApdgllmcddq08mmtGk339iwe29tYtXMO
         wQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212015; x=1784816815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeMVRi9VMKzqYFaALL8EB3/fVi9uvBRvVhZaG4bfmXI=;
        b=ooo5XFWR69BgJqEmJk0IV7qHnKvu68b/4UT3kiW4RoHAqMTWXTOFR5/IzalLmmHkEA
         2ekCN5l4cl1HJKemvSKFxrIlFMY4aXEBldvy3VICsxNSUw3DjHutL1P60ThK7tRDiwfC
         4LMXZqgif+8v5a8eR+aYHUnl2HbXQF+2RyIoI5keNkkX6E/FRELgjwvwqkdQDqzdCox6
         CrbJtMDr/B7o8FYySNvZ5/tAQiBd0VXpFIqUiNKxVdLd0u1d4LAvcXsNbRVefeds6sm/
         0K+/mRxOgZRx6sDHNlRkauuTUPZaX3kgJxQLSdHL0EP0JX1mmzUsQIHjhEfAr9x1fJi7
         j/gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrin8CZ10GmK5lqWj2lkBo3dtkgZcD/HX1H0aH1QPLW/xHC8fXv1WYHKUJUuWS/20IN5tXUy8jCdqQjtDDH@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBpB392WwfP7QjZM3ZcFhaxYl3gUhFjzy4Q8chqpD7sz8yMfh
	54nJBmOfhqJRjOXNWpLmDnMOF1e9PyZrEuY/i9IbB9/YiA34Jf/1+Fh+wSdfH5vjBn6q/o6UlsM
	z9Q1iZBjtJYwbX9y5jm5c4LmRCiDAu3w28h8o0xedrVN8zxAnlQUpsUe9dP20I2nbmzeT
X-Gm-Gg: AfdE7clGPfbLzdcmIMqPfNp+XEu6jw/3cJwow5416UO5x7nFyv40/rH+6maWpZDaCgn
	1tyM6Aqblz346zxeWAmBblyN2UvEqPR2hyjPRn5XNlWALoIdBkMYQfzs/SENWtiGPllcY3co5eI
	Uj4+9mYuwH8BktbXR5S2LhdxRR6QlzePKZGuLCU6sGZDzUTW9OVze8S9JAXKI9XP8NQzkc77D+W
	nUlYhsnAQyWndRKyBk/a0autZtc9QZSHB25me+NAp70bKbOBMQyuECBbvisEmAPxrFQxszES+31
	qCq9Ht5mO37HVRCNjVl/LbtQ1wC9OYOk46KzcA5NvinBe6BMRLGR0GD0Jops6uxb6bB+PZswnX+
	9s8ZIaleNdhAqzH4b7/EWi2e80UDkf2lt+fMeTl8rIP2Ipi8u7O4591qsb/Rd
X-Received: by 2002:ac8:5d44:0:b0:51a:8c86:bd44 with SMTP id d75a77b69052e-51e4f0e9657mr79211301cf.65.1784212015349;
        Thu, 16 Jul 2026 07:26:55 -0700 (PDT)
X-Received: by 2002:ac8:5d44:0:b0:51a:8c86:bd44 with SMTP id d75a77b69052e-51e4f0e9657mr79210771cf.65.1784212014684;
        Thu, 16 Jul 2026 07:26:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm152869121cf.4.2026.07.16.07.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:26:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Thu, 16 Jul 2026 22:25:59 +0800
Message-ID: <20260716142605.2398433-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXxbRc/XnmVm02
 64J0+QTDoDfVcUWDJmZBMIQS2Dxwks+ACUPt5J+neIJ+IWeCV7ovVrcqYMi4jZt6b304lzYaB2G
 Vm4lP3Jvo4dDWR5XtqOqewRgcttT2PaV+TXMes/B8AA4by4NQwpW+bonELNSeFKkS4FERMU1LlY
 zNta9ZMgIFz0+bcw4XTtz4SiLC05XzL4WFC54JYt5kYXpi6mQztiywTFNCqyrm5zwesyXZKeYfe
 /T7a9kudJ5VzbOu0pLhzZcTGggl5KnnI1oTUiiNM1orljewohN4QzpwXYaueCi/0S4GgB6W5Zsy
 313s404PYSMdT/X+zvMDDxMUEF/a/Pz4Kvn58uKnw0Jg/K9TQDC+ejihgB6Y5BzvFvNX1tDTfah
 yqyJuFTKVNizrfCL+rbYQGBbtqcilzq6B5HomQp9Z4I5sDoOnR1b73QJ2dUkpbS472ue8+nP02m
 mosn79ol9yBPe9a7E+A==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58ea30 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Po2-bYs7AHTl7xbkTNiITI_aWQ37zimC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX09Bpe7SKDKci
 +MyXdS1YIBRflCqR3B/lESKnZo8T4GhS4+dRPu36W8XIdU5B7PcU9CWUWza34VJR05NDkUo6DK2
 DB0o29Rg4ODqAb/09VRI/7307N20V1Q=
X-Proofpoint-ORIG-GUID: Po2-bYs7AHTl7xbkTNiITI_aWQ37zimC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index bd184f062ec0..7ca4e75ea09f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -396,6 +396,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

