Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560914B1486
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401957; cv=none; b=KhNYaz4xGOijnOajZ3eeqL8ntnrq66fSa7Kn2vqH8KJZU1glzZ+C/5LJCXUUUyuhjkh8r1fZ+CEaRqP+SFmNMkrGhXqnRYbGr4RLeg4crIwQ1V+PktGctPm1C6B+7BlxkFwR2sfe0HCfAVZtFIqeoovVuZSxwnuBIz01azNsduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401957; c=relaxed/simple;
	bh=lXeO7bP7idTFtUBzuKbosYtATj9Ndsw4dWgt9vtKsn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGtGp01IhD6G4K+d/dhzyTS2eHXKMdY+UG5UxJOdlITX7A7gBpeODEhi8qXIPT5qpHhZNmHpiz59aur1TdRO1t0LzFz5KxdrZzPg6VKENyuNhb/yWnhAloPq/LcxudCfSt6uxzofebSrwYTbjhIFtRyEh3xtRFgq+b/spWxwM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2FkTV8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJanArfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2FkTV8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJanArfc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrXJ3256601
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=; b=d2FkTV8UHXYJiKNw
	Ic9Nf4JeODiAasoFzuWwMZ2q8POGB2MzoXGNxB2LPYUEOcr4YLnaGALtx4pcLPkN
	RtHQiq/SG4xwaloHlwNIRjB68NhAs56o7/1RUAoW2mGs8mtSU8JnPkTARPN9vmjO
	UcvO4SuZHcXwkRDGanA+2h7XFjbIp8qVRWAaOKzfK2vwNj22ILXzmGBz3n2KfMtb
	EBColTIxKBUewnNOgrbMuBbWA8aP6VY6wmYNik4x+zydgu6hMEWfVH74Wme61ZM+
	x8inA8KSoQsiv5k/j/zb9O7klTm/OKORiVzSppyClc9dsofQHonk9WKoGqb2Js6Z
	n1PQww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8cbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso3037964eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401955; x=1793006755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=;
        b=UJanArfcctal/2vnX5XxgRfKPjC786lNL+H479l1RmwhfRAFtvWqr02swC39XrKasq
         rjFqf0KrPruLNWxWxzt6crURX9nPIDjDZWHSZf7kOtKKHHNGJVrMYtAGJvj3ydpKFmSx
         WwsSi5aIwLdQdIaAcFmmhpl6BFrphKa02TVgFiLcHOoxwwqijCZ6CHu2mOvhPF/J6Ufx
         jVpRj2n8J9V7c+JfxCUhgbcVcD+nXB66K5AogURo6BcT4U6h34lCJoyV/9gHNt2mUC8R
         enZU+PjOefS8JvIgqtuM1EgRWxVkgEIuMitVNGzN586vfsqo+4Tnb+khUap+1FOM7P8u
         P9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401955; x=1793006755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqNPgcDIDE6Bp0KwMFBvoaExUNRvYuzoKfkIwpxCEXY=;
        b=sKZrcxBxxbzN58fmiYczBpagxFkNp2cW/Ll52tTibp10URhi/NrvVT6S7rsNxi1qoH
         4Mi4Oz40VXejM4ZPK+LHnyQryGnPlN/62/jNU+YWKe2G6V8SeC+G1bXNEiTEo2OXteqi
         DjNVkdMDRr774K6sG3wEbvAEfwklkwnlCdpsnnngezfhPZzZ+FD8EbM8G6szxt1bvMwI
         mOqBHeau4I4w3mzOgQBwUhu6Nd80sIxbXRjOQ+KwoEIQJ+2bQSUwtDgjDqclIyTTSAqb
         vOyjcFWnnQoyWLD1kOCBNtPQ3iU1XB+cK9TMiRNuzYepjj5NRk6Ks/uTmztThmG+kLw3
         ThBA==
X-Gm-Message-State: AFq9FYKt14J3u5K6ngtHvYHcMe1HieHmLLXj2lmlrVq7LTy1Zs4lIj8B
	0M2bSdI/JJH7+5aPppS4RQmhFRI5DoQv9pQiFslKt9GUGl/6a2NVpbP7ukaMqXQZMJkFJOiO0/9
	0dow9PuT3x51O0pVy1L/uhKpSw3Kd6a+UDXVzEF+Teym2tt/CCdElHN+84s7ZiwzTL5iqD5WyJZ
	jI
X-Gm-Gg: AYBFou0wiKHG/YX+gqlkvAevYxRSmGRQvgTV8tcSeUfqFf7QfJRDsugRzuftdd6691z
	AA69yn1QjvhSqtGDNyfFgZ2pGedCX1s8lDKK634OIUs8hvhiWloyII96DYZtyUCwDrshkk1AAvt
	lcJTPWugK6sy+01YPcFxK6J1xrUrhA2R7ZL+l3iOkpCSK0NWb9Jj3qd9UZmrZBEUrGf7WAq6Duv
	/jr4T4fqvE3Hoaw50BwtAjFdKCO5BUx9y/hnCAJSU9IHUkAABG5gjiMsMmW26l22507Pt7tj4s6
	zUSE4xwzjpERuzoDKik57Pa8fQd/hsWRtB6zt6iHLU/aer7m9ZbJsOAtkKGoDV9/4Lox50s5fn8
	ko8j8HXS4gyhuPtVcyjcT9HDJbNc8/7fisg==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9769408c88.23.1792401954798;
        Mon, 19 Oct 2026 02:25:54 -0700 (PDT)
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9769372c88.23.1792401954201;
        Mon, 19 Oct 2026 02:25:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:13 +0530
Subject: [PATCH v2 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to
 list qcs8300 first
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-5-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=1159;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lXeO7bP7idTFtUBzuKbosYtATj9Ndsw4dWgt9vtKsn0=;
 b=sjm+65Ib8YrCBQPt2R/Zbrm5GYLWerivul8CnzzIcez5z+2TGxqbmoQ+cWL8+ZPUBvyxNeUU0
 zbxSJSxjNTFCH4PTwZyc3qwws3KG0sTG5DvGKJYveBomSlQsGmUVvcH
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: bHray2HA9EeQl5SLvj04vELKPXwIOHAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX8Gy7HMFf58H2
 aon3UHl/1RasK8pySW02UOnA8D71Cadd/w1pbzK2/S5FtSU7GYeFhooWzmXqwDGota/o2NUPkU5
 U8nZPNWjq4NCqmN5ysdlBXJw01sKWYgHP90l8o8HabKPT1wKhTt3SKXYzG8gNuNoQZgWEHMpBr9
 DIlT71AJbAUAtr2O7WBnw81DQGg08vlXwTk2U3m6ieQ8ZrGR/9alXZlLNy4GxyZcIQCozYTb/Lt
 Y62HyY6TB+MKk109rw/o3RBHxZZnGHsn5BR4jJc4yHPvUl3mVZZ2JP8P4k88rEqAL74z9Pm+RJj
 FUeh7mSHnFaIv904ySwddHm0F002v0KeIePcKkt8NVPTx8Z9zIzKcA0w6uIrd3Mp6jo+btpixRs
 BMZGlthyQYQPdG3zSRbo8u+mWPbk+Skgu+PyHBwrf2Cz29UTUxhGs+f4xfLKBl8UHX1K/14IdjE
 jISnRpqlpVIavBIcEgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXydU5mmcKQ0u/
 7A7B0SPdsiX5NiDsvDzkqS7ufSOoCdIh8COn72PGdkOufeZxWCSaUIFxFsGI5wfXSzwlkW2lXDc
 hZp3txxKXU8N0aAJ4Tg/P2x4x1ZnmfE=
X-Proofpoint-GUID: bHray2HA9EeQl5SLvj04vELKPXwIOHAV
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5e223 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190037

The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
compatible, since no QCS8300-specific compatible was documented for this
PHY at the time.

Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
order used by the pcie0_ep and pcie1_ep nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..d7d135e87a8c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2597,7 +2597,8 @@ pcieport1: pcie@0 {
 		};
 
 		pcie1_phy: phy@1c14000 {
-			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
 			reg = <0x0 0x01c14000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,

-- 
2.34.1

