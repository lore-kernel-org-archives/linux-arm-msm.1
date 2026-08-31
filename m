Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4C39182A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195444; cv=none; b=M4OxXjCWKet3ndsc0K4yFznaHcheR32A/XNe1vjCJOufEX8KHXvPE4SmHxtP4o8eYXp9nPfG788+dixikr5NfT8P5aeTJLz3BgUImvE5UJp+TmR6UJQ4RUku11ZA/5Dq5YwphYvU/nz/vTD97ru/HkZbzY1cs6Nuy29RLIgvaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195444; c=relaxed/simple;
	bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQnE6/hdv7rVuiQq/VsksJkhMfclMLKWSsJ0mbniIH3ASXfpZVg2NHdtgNGl8w0v6xK96xUuqaCvCZDjuYbj9SRk71OQZMjpok//ElHdoqTNKxJiuXEntR+tJjYFZ83fiveC7/JnstzsR61NF7W+yS/rr5xBR+MXf65YHE6OgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsPAo+Nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxlCYTC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsPAo+Nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxlCYTC3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpu3F4152564
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=; b=bsPAo+NcDSuRRYEN
	XSbd5FNMoruUvSsf1UvIY/QD6tzWeVhu1mmfKiPjrXk51dpiW8wXIHzcwfgZRWCh
	w6fM83JlErwwPQgIh4smbiYbHPwbcULJfYAIqdWDE+n7uD8ToufcO1F+pFjU4CRd
	yOA/eJniq20OUXObygHzaRUKR/WfW9jp0XnUB1l3wqoxrrXltt6tXCrtuK54awDQ
	DkTL2TFQEFhsKXIXq6btv3qrFwyopyz3hl9Nxpe6tfbK7bK1evp/dybuF1F9BvGB
	bke/8k2VPuPLXy3Eob4pHzw84XTKEDbtj4N2JOmTg4LH+yXZjy7i1eE0VxzUJfVk
	qbpb0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h923qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:57:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so552483285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195441; x=1788800241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=RxlCYTC3fhTjKvWCp+xY5IwtrVtf5Ss1nJuJxz7FF99MR1FuagAPKlxGHrRABWR53D
         raRHIZloJn2uUj/7DDgJzMYSJQIlNLnauAhGJaPNURT1R1E403cVo0iHItQffXozheGd
         QN8/PGN+BknXJfkpK7wHvWeipcuZbccFibXbUsNiNBN+6U7P7dqJwVRmjrdm8Oa6zs8q
         OtaiYKLXnLqtGXdd+bLPGSUPRritHNrKdEWO/SAgTi9Y8QD7Emti9g901u8N8cNbWG4J
         AtxP5f6HSAgnqePgaHWBs6/G6wKHKPsPCGcRejMWvStebysQxCo9SLh+D54LHrNCNP5b
         /i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195441; x=1788800241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=SjuTbJ55YGBhnsgLnM10EXc8K4E/uMDYVakC8WBIxWQSkVdmpikI9mNBbanxmrC1UI
         uWs4IK/vIUBNWor3Zh/q+j/MTxBdEdTV73iLezi6UV1Hk8Do/1xjlloMpgVKzSDKNr44
         Z6gUtEDt+CmN28nbQVjvJUOrWtfpMzpg6YF0ozU46pR+T2m9DSqmRL/hAP16KB7AGTdf
         EdCEHiMCmwnchAAjz2S721rtfJCXpV5BNrIAz69B4dUmP5orEzw8pEQUtk4ZzakmqFdG
         EIquTwh4+gsZHdfyfTfyrCKhxlfTW1+hrvFgYji1ZJ8O6+ut8tDjB1E35CglBOgkH+Os
         Jpow==
X-Gm-Message-State: AFuF++nL4HXDGoGzx2//cC+5M7e6UBRnkfKyqy34kGngUKFHzD8KmaZQ
	H6qnRgGyuAzXGoatD1aqbnuFfaib90zgHFcn64iEEoE12zWbGPuATlLqAyy6Xo+i2Qa3vJ7vqiU
	oeBxG+1xooMuq5AedQiwz2uJRjFBxZKLzca0mFHZOEeL8M5oB4fqYiEanoAcgFzIgIdAoZwyxbh
	Jg
X-Gm-Gg: AR+sD12yNZNod9AvuTJFcotdQ5GHi2A2OEM6W8zZnkhMoycVxGPs3Qud1kGlGO1fpFj
	pqO+2gYzP/YTjPau3Yy2WCOiZtirDwVyr0W2NqJP153pZxg5xL5TxQ05/YH7l3Nx+Ud08Ym6Jrc
	yXwlnRdO6nj/mcF7GU8IiYQtanuw9jUAC9fzUNr41QdRQ8B76sf9JTgIJNbewS+J8/gwqBeNYUU
	ZzLrtYALqmY7+TB4ChY4JBS8KmeganXIKVX6Sc3ctdl+biWq3p0tswNShr1VzGk2sPbTecuJOrg
	2H+txE4TBjeNmGCsZLtSl61TM6Yy4sH+j/28FtUKtuS94kPLVytayf2BKepOL02W6CSX9kMo9WF
	/ObQUvA==
X-Received: by 2002:a05:620a:1a16:b0:939:46d7:4b4e with SMTP id af79cd13be357-93947f8ef62mr336392785a.7.1788195441248;
        Mon, 31 Aug 2026 09:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1a16:b0:939:46d7:4b4e with SMTP id af79cd13be357-93947f8ef62mr336386685a.7.1788195440641;
        Mon, 31 Aug 2026 09:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:57:11 +0300
Subject: [PATCH v5 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-1-dda8af2d2920@oss.qualcomm.com>
References: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJqx5+tT+/GvNgkkR0BSGbzPUY8tqFDL97uK
 xeOAjsNl86JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyagAKCRAbX0TJAJUV
 VnmyD/9jLIAAWa5IkiNXWwMS3JrjUznKe6tKlL36QtTVddayUzDBqvD3CjaK4zl7axJK+6DJdRj
 DHUQQl5bz/GvSSDwcaYSJ+ayPEDy/QHBL106eOD3taruI4RQ4wEEyjLHKn8Q1iXL10Mq3hdIVoA
 KAnL4xMOlDyxMIitkPDz+w21eAo80XUKo85/cVI2qoMQzJCw4IJq0gCFSJBPmdiViT9afqZtDXg
 fu+ENhcHHgV9vPRdgnb/1L9mToIRUQ4q72fpGEdgGR8moROMEdxeiJrtPk5v6a6rMpdBjFkbSTR
 GwIgt2Wc8piFW5djwaCo/6/nwyHccaFgYZ9bSmMJF0rxVuMdo9t0KCAvFjPSL+t0mg0KbLyC9jz
 i/CpGjDGPIqEOG5hAbWQXJfMxUTbv6lIrzJlWlbRZJ7Wdl4TJl4rvJq9ls1BMLiOVvJzodI4TDG
 MhqwdP4Gl2X1qi0Cs7YN23BFEJdhYnAL35VU1bNXAVEWnleoFob2ErCGfZ8Y0UTvh+tSPKWppfm
 2R0bwwWrima3vDDZPXl8mErL2JD05zh0G9ybP42RjzXThqb9dh6o7kqtHpri1fb3Id/mo7AukgG
 5OMI8TfH3QKbrlKNHdWgA1oJJT3sfiob7BkIeiHIhhdYzxdiXUbHf/zffTqBdORNYBGr3XM+umr
 xFN56RxG8ijMnqg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a95b272 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QqHR8nc9v79apngTQnplRR4r3msKcKIV
X-Proofpoint-GUID: QqHR8nc9v79apngTQnplRR4r3msKcKIV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX5XFH/9P4k9gX
 CHY+S/oK9gOn9Kn1U4yWZxLlQYJGKKdvs56dzN0bdnyonDO+FUWZ2kJt8ev8joSxIKAFpDJY9Kr
 h3JCxMv1n8fK7bg796pF1JtbEFiBwC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX0gEEGj8Qox2w
 xVFi5oOeWBKCQ/HGIpHnI60VylGFJmV9rKj6rc6MgIAu1GaF+Al9EfkYq9IQzd7fgXwNMRNij9m
 nLiUPsZz353nHVL+dmnj3+G4QA+y4TJGcUZk59XBKQMc4l46VBI94H98jqEULv2arFKAXzaT251
 QBZhGtkPxDOUJNIEN5xhajYRMysl5YpbgXffwbA/k5ffQwH7QMP58vOYssUeCPiugnwlD4oqkWj
 Z5h5AQ/E4L2PSc3tHRRFBFRObXCybrjFJw7VHC6tIo0eTD08IStu67MWgaYYqG1byi0llgcPN/R
 Yv7TPTXr0BT0he4+9pkYBxsxe/xd8H3aDCqEgetlmTr16QmkIYLsBKil/pRAkULuhme809F70l6
 hBQ6a4N/PI5Hzb8CsWbgywSCf+4uEXc1wRbJZ5GJt0Bf341ViHBsXA+/4xC5ijgpFIpDoos396u
 JDJCdwSE5L5CL+JYzdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..1585f13cdcfe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -636,6 +636,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3975,6 +3999,57 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

